package mx.messaging
{
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.messaging.channels.NetConnectionChannel;
   import mx.messaging.channels.PollingChannel;
   import mx.messaging.config.ServerConfig;
   import mx.messaging.errors.NoChannelAvailableError;
   import mx.messaging.events.ChannelEvent;
   import mx.messaging.events.ChannelFaultEvent;
   import mx.messaging.events.MessageEvent;
   import mx.messaging.events.MessageFaultEvent;
   import mx.messaging.messages.AcknowledgeMessage;
   import mx.messaging.messages.CommandMessage;
   import mx.messaging.messages.ErrorMessage;
   import mx.messaging.messages.IMessage;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.rpc.AsyncDispatcher;
   import mx.rpc.AsyncToken;
   import mx.rpc.events.AbstractEvent;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.utils.Base64Encoder;
   
   use namespace mx_internal;
   
   public class ChannelSet extends EventDispatcher
   {
       
      
      private var _shouldHunt:Boolean;
      
      private var _connected:Boolean;
      
      private var _hasRequestedClusterEndpoints:Boolean;
      
      private var _clustered:Boolean;
      
      private var _channels:Array;
      
      private var _hunting:Boolean;
      
      private var _authenticated:Boolean;
      
      private var _pendingMessages:Dictionary;
      
      private var _authAgent:AuthenticationAgent;
      
      private var resourceManager:IResourceManager;
      
      private var _heartbeatTimer:Timer;
      
      private var _credentials:String;
      
      private var _reconnectTimer:Timer = null;
      
      private var _credentialsCharset:String;
      
      private var _initialDestinationId:String;
      
      private var _shouldBeConnected:Boolean;
      
      private var _connecting:Boolean;
      
      private var _channelIds:Array;
      
      private var _configured:Boolean;
      
      private var _heartbeatInterval:int = 0;
      
      private var _currentChannel:Channel;
      
      private var _currentChannelIndex:int;
      
      private var _pendingSends:Array;
      
      private var _messageAgents:Array;
      
      private var _channelFailoverURIs:Object;
      
      public function ChannelSet(param1:Array = null, param2:Boolean = false)
      {
         resourceManager = ResourceManager.getInstance();
         super();
         _clustered = param2;
         _connected = false;
         _connecting = false;
         _currentChannelIndex = -1;
         if(param1 != null)
         {
            _channelIds = param1;
            _channels = new Array(_channelIds.length);
            _configured = true;
         }
         else
         {
            _channels = [];
            _configured = false;
         }
         _hasRequestedClusterEndpoints = false;
         _hunting = false;
         _messageAgents = [];
         _pendingMessages = new Dictionary();
         _pendingSends = [];
         _shouldBeConnected = false;
         _shouldHunt = true;
      }
      
      private function reconnectChannel(param1:TimerEvent) : void
      {
         _reconnectTimer.stop();
         _reconnectTimer.removeEventListener(TimerEvent.TIMER,reconnectChannel);
         _reconnectTimer = null;
         connectChannel();
      }
      
      [Bindable(event="propertyChange")]
      public function get connected() : Boolean
      {
         return _connected;
      }
      
      public function login(param1:String, param2:String, param3:String = null) : AsyncToken
      {
         var _loc7_:String = null;
         var _loc8_:Base64Encoder = null;
         if(authenticated)
         {
            throw new IllegalOperationError("ChannelSet is already authenticated.");
         }
         if(_authAgent != null && _authAgent.state != AuthenticationAgent.LOGGED_OUT_STATE)
         {
            throw new IllegalOperationError("ChannelSet is in the process of logging in or logging out.");
         }
         if(param3 != Base64Encoder.CHARSET_UTF_8)
         {
            param3 = null;
         }
         var _loc4_:String = null;
         if(param1 != null && param2 != null)
         {
            _loc7_ = param1 + ":" + param2;
            _loc8_ = new Base64Encoder();
            if(param3 == Base64Encoder.CHARSET_UTF_8)
            {
               _loc8_.encodeUTFBytes(_loc7_);
            }
            else
            {
               _loc8_.encode(_loc7_);
            }
            _loc4_ = _loc8_.drain();
         }
         var _loc5_:CommandMessage;
         (_loc5_ = new CommandMessage()).operation = CommandMessage.LOGIN_OPERATION;
         _loc5_.body = _loc4_;
         if(param3 != null)
         {
            _loc5_.headers[CommandMessage.CREDENTIALS_CHARSET_HEADER] = param3;
         }
         _loc5_.destination = "auth";
         var _loc6_:AsyncToken = new AsyncToken(_loc5_);
         if(_authAgent == null)
         {
            _authAgent = new AuthenticationAgent(this);
         }
         _authAgent.registerToken(_loc6_);
         _authAgent.state = AuthenticationAgent.LOGGING_IN_STATE;
         send(_authAgent,_loc5_);
         return _loc6_;
      }
      
      protected function sendHeartbeat() : void
      {
         var _loc1_:PollingChannel = currentChannel as PollingChannel;
         if(_loc1_ != null && _loc1_.mx_internal::_shouldPoll)
         {
            return;
         }
         var _loc2_:CommandMessage = new CommandMessage();
         _loc2_.operation = CommandMessage.CLIENT_PING_OPERATION;
         _loc2_.headers[CommandMessage.HEARTBEAT_HEADER] = true;
         currentChannel.mx_internal::sendInternalMessage(new MessageResponder(null,_loc2_));
      }
      
      private function hunt() : Boolean
      {
         var _loc1_:String = null;
         if(_channels.length == 0)
         {
            _loc1_ = String(resourceManager.getString("messaging","noAvailableChannels"));
            throw new NoChannelAvailableError(_loc1_);
         }
         if(_currentChannel != null)
         {
            disconnectChannel();
         }
         if(++_currentChannelIndex >= _channels.length)
         {
            _currentChannelIndex = -1;
            return false;
         }
         if(_currentChannelIndex > 0)
         {
            _hunting = true;
         }
         if(mx_internal::configured)
         {
            if(_channels[_currentChannelIndex] != null)
            {
               _currentChannel = _channels[_currentChannelIndex];
            }
            else
            {
               _currentChannel = ServerConfig.getChannel(_channelIds[_currentChannelIndex],_clustered);
               _currentChannel.setCredentials(_credentials);
               _channels[_currentChannelIndex] = _currentChannel;
            }
         }
         else
         {
            _currentChannel = _channels[_currentChannelIndex];
         }
         if(_channelFailoverURIs != null && _channelFailoverURIs[_currentChannel.id] != null)
         {
            _currentChannel.failoverURIs = _channelFailoverURIs[_currentChannel.id];
         }
         return true;
      }
      
      public function get clustered() : Boolean
      {
         return _clustered;
      }
      
      public function disconnect(param1:MessageAgent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:PendingSend = null;
         if(param1 == null)
         {
            _loc2_ = _messageAgents.slice();
            _loc3_ = int(_loc2_.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_[_loc4_].disconnect();
               _loc4_++;
            }
            if(_authAgent != null)
            {
               _authAgent.state = AuthenticationAgent.SHUTDOWN_STATE;
               _authAgent = null;
            }
         }
         else if((_loc5_ = param1 != null ? _messageAgents.indexOf(param1) : -1) != -1)
         {
            _messageAgents.splice(_loc5_,1);
            removeEventListener(ChannelEvent.CONNECT,param1.channelConnectHandler);
            removeEventListener(ChannelEvent.DISCONNECT,param1.channelDisconnectHandler);
            removeEventListener(ChannelFaultEvent.FAULT,param1.channelFaultHandler);
            if(connected || _connecting)
            {
               param1.channelDisconnectHandler(ChannelEvent.createEvent(ChannelEvent.DISCONNECT,_currentChannel,false));
            }
            else
            {
               _loc6_ = int(_pendingSends.length);
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if((_loc8_ = PendingSend(_pendingSends[_loc7_])).agent == param1)
                  {
                     _pendingSends.splice(_loc7_,1);
                     _loc7_--;
                     _loc6_--;
                     delete _pendingMessages[_loc8_.message];
                  }
                  _loc7_++;
               }
            }
            if(_messageAgents.length == 0)
            {
               _shouldBeConnected = false;
               _currentChannelIndex = -1;
               if(connected)
               {
                  disconnectChannel();
               }
            }
            if(param1.mx_internal::channelSetMode == MessageAgent.mx_internal::AUTO_CONFIGURED_CHANNELSET)
            {
               param1.mx_internal::internalSetChannelSet(null);
            }
         }
      }
      
      public function set channels(param1:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(mx_internal::configured)
         {
            _loc5_ = String(resourceManager.getString("messaging","cannotAddWhenConfigured"));
            throw new IllegalOperationError(_loc5_);
         }
         var _loc2_:Array = _channels.slice();
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            removeChannel(_loc2_[_loc4_]);
            _loc4_++;
         }
         if(param1 != null && param1.length > 0)
         {
            _loc6_ = int(param1.length);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               addChannel(param1[_loc7_]);
               _loc7_++;
            }
         }
      }
      
      public function addChannel(param1:Channel) : void
      {
         var _loc2_:String = null;
         if(param1 == null)
         {
            return;
         }
         if(mx_internal::configured)
         {
            _loc2_ = String(resourceManager.getString("messaging","cannotAddWhenConfigured"));
            throw new IllegalOperationError(_loc2_);
         }
         if(clustered && param1.id == null)
         {
            _loc2_ = String(resourceManager.getString("messaging","cannotAddNullIdChannelWhenClustered"));
            throw new IllegalOperationError(_loc2_);
         }
         if(_channels.indexOf(param1) != -1)
         {
            return;
         }
         _channels.push(param1);
         if(_credentials)
         {
            param1.setCredentials(_credentials,null,_credentialsCharset);
         }
      }
      
      protected function scheduleHeartbeat() : void
      {
         if(_heartbeatTimer == null && heartbeatInterval > 0)
         {
            _heartbeatTimer = new Timer(heartbeatInterval,1);
            _heartbeatTimer.addEventListener(TimerEvent.TIMER,sendHeartbeatHandler);
            _heartbeatTimer.start();
         }
      }
      
      public function send(param1:MessageAgent, param2:IMessage) : void
      {
         var _loc3_:AcknowledgeMessage = null;
         var _loc4_:CommandMessage = null;
         if(_currentChannel != null && _currentChannel.connected && !param1.mx_internal::needsConfig)
         {
            if(param2 is CommandMessage && CommandMessage(param2).operation == CommandMessage.TRIGGER_CONNECT_OPERATION)
            {
               _loc3_ = new AcknowledgeMessage();
               _loc3_.clientId = param1.clientId;
               _loc3_.correlationId = param2.messageId;
               new AsyncDispatcher(param1.acknowledge,[_loc3_,param2],1);
               return;
            }
            if(!_hasRequestedClusterEndpoints && clustered)
            {
               _loc4_ = new CommandMessage();
               if(param1 is AuthenticationAgent)
               {
                  _loc4_.destination = initialDestinationId;
               }
               else
               {
                  _loc4_.destination = param1.destination;
               }
               _loc4_.operation = CommandMessage.CLUSTER_REQUEST_OPERATION;
               _currentChannel.mx_internal::sendInternalMessage(new ClusterMessageResponder(_loc4_,this));
               _hasRequestedClusterEndpoints = true;
            }
            unscheduleHeartbeat();
            _currentChannel.send(param1,param2);
            scheduleHeartbeat();
         }
         else
         {
            if(_pendingMessages[param2] == null)
            {
               _pendingMessages[param2] = true;
               _pendingSends.push(new PendingSend(param1,param2));
            }
            if(!_connecting)
            {
               if(_currentChannel == null || _currentChannelIndex == -1)
               {
                  hunt();
               }
               if(_currentChannel is NetConnectionChannel)
               {
                  if(_reconnectTimer == null)
                  {
                     _reconnectTimer = new Timer(1,1);
                     _reconnectTimer.addEventListener(TimerEvent.TIMER,reconnectChannel);
                     _reconnectTimer.start();
                  }
               }
               else
               {
                  connectChannel();
               }
            }
         }
      }
      
      public function logout(param1:MessageAgent = null) : AsyncToken
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:CommandMessage = null;
         var _loc5_:AsyncToken = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _credentials = null;
         if(param1 == null)
         {
            if(_authAgent != null && (_authAgent.state == AuthenticationAgent.LOGGING_OUT_STATE || _authAgent.state == AuthenticationAgent.LOGGING_IN_STATE))
            {
               throw new IllegalOperationError("ChannelSet is in the process of logging in or logging out.");
            }
            _loc2_ = int(_messageAgents.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _messageAgents[_loc3_].internalSetCredentials(null);
               _loc3_++;
            }
            _loc2_ = int(_channels.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_channels[_loc3_] != null)
               {
                  _channels[_loc3_].internalSetCredentials(null);
                  if(_channels[_loc3_] is PollingChannel)
                  {
                     PollingChannel(_channels[_loc3_]).disablePolling();
                  }
               }
               _loc3_++;
            }
            (_loc4_ = new CommandMessage()).operation = CommandMessage.LOGOUT_OPERATION;
            _loc4_.destination = "auth";
            _loc5_ = new AsyncToken(_loc4_);
            if(_authAgent == null)
            {
               _authAgent = new AuthenticationAgent(this);
            }
            _authAgent.registerToken(_loc5_);
            _authAgent.state = AuthenticationAgent.LOGGING_OUT_STATE;
            send(_authAgent,_loc4_);
            return _loc5_;
         }
         _loc6_ = int(_channels.length);
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            if(_channels[_loc7_] != null)
            {
               _channels[_loc7_].logout(param1);
            }
            _loc7_++;
         }
         return null;
      }
      
      public function set clustered(param1:Boolean) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         if(_clustered != param1)
         {
            if(param1)
            {
               _loc2_ = channelIds;
               _loc3_ = int(_loc2_.length);
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  if(_loc2_[_loc4_] == null)
                  {
                     _loc5_ = String(resourceManager.getString("messaging","cannotSetClusteredWithdNullChannelIds"));
                     throw new IllegalOperationError(_loc5_);
                  }
                  _loc4_++;
               }
            }
            _clustered = param1;
         }
      }
      
      public function get channelIds() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(_channelIds != null)
         {
            return _channelIds;
         }
         _loc1_ = [];
         _loc2_ = int(_channels.length);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_channels[_loc3_] != null)
            {
               _loc1_.push(_channels[_loc3_].id);
            }
            else
            {
               _loc1_.push(null);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get authenticated() : Boolean
      {
         return _authenticated;
      }
      
      private function connectChannel() : void
      {
         _connecting = true;
         _currentChannel.connect(this);
         _currentChannel.addEventListener(MessageEvent.MESSAGE,messageHandler);
      }
      
      protected function unscheduleHeartbeat() : void
      {
         if(_heartbeatTimer != null)
         {
            _heartbeatTimer.stop();
            _heartbeatTimer.removeEventListener(TimerEvent.TIMER,sendHeartbeatHandler);
            _heartbeatTimer = null;
         }
      }
      
      mx_internal function get channelFailoverURIs() : Object
      {
         return _channelFailoverURIs;
      }
      
      mx_internal function get configured() : Boolean
      {
         return _configured;
      }
      
      public function setCredentials(param1:String, param2:MessageAgent, param3:String = null) : void
      {
         _credentials = param1;
         var _loc4_:int = int(_channels.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_channels[_loc5_] != null)
            {
               _channels[_loc5_].setCredentials(_credentials,param2,param3);
            }
            _loc5_++;
         }
      }
      
      public function set heartbeatInterval(param1:int) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(_heartbeatInterval != param1)
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"heartbeatInterval",_heartbeatInterval,param1);
            _heartbeatInterval = param1;
            dispatchEvent(_loc2_);
            if(_heartbeatInterval > 0 && connected)
            {
               scheduleHeartbeat();
            }
         }
      }
      
      protected function messageHandler(param1:MessageEvent) : void
      {
         dispatchEvent(param1);
      }
      
      protected function setConnected(param1:Boolean) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(_connected != param1)
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"connected",_connected,param1);
            _connected = param1;
            dispatchEvent(_loc2_);
            mx_internal::setAuthenticated(param1 && Boolean(currentChannel) && currentChannel.authenticated,_credentials,false);
            if(!connected)
            {
               unscheduleHeartbeat();
            }
            else if(heartbeatInterval > 0)
            {
               scheduleHeartbeat();
            }
         }
      }
      
      public function get currentChannel() : Channel
      {
         return _currentChannel;
      }
      
      private function disconnectChannel() : void
      {
         _connecting = false;
         _currentChannel.removeEventListener(MessageEvent.MESSAGE,messageHandler);
         _currentChannel.disconnect(this);
      }
      
      public function get channels() : Array
      {
         return _channels;
      }
      
      public function set initialDestinationId(param1:String) : void
      {
         _initialDestinationId = param1;
      }
      
      protected function faultPendingSends(param1:ChannelEvent) : void
      {
         var _loc2_:PendingSend = null;
         var _loc3_:IMessage = null;
         var _loc4_:ErrorMessage = null;
         var _loc5_:ChannelFaultEvent = null;
         while(_pendingSends.length > 0)
         {
            _loc2_ = _pendingSends.shift() as PendingSend;
            _loc3_ = _loc2_.message;
            delete _pendingMessages[_loc3_];
            (_loc4_ = new ErrorMessage()).correlationId = _loc3_.messageId;
            _loc4_.headers[ErrorMessage.RETRYABLE_HINT_HEADER] = true;
            _loc4_.faultCode = "Client.Error.MessageSend";
            _loc4_.faultString = resourceManager.getString("messaging","sendFailed");
            if(param1 is ChannelFaultEvent)
            {
               _loc5_ = param1 as ChannelFaultEvent;
               _loc4_.faultDetail = _loc5_.faultCode + " " + _loc5_.faultString + " " + _loc5_.faultDetail;
               if(_loc5_.faultCode == "Channel.Authentication.Error")
               {
                  _loc4_.faultCode = _loc5_.faultCode;
               }
            }
            else
            {
               _loc4_.faultDetail = resourceManager.getString("messaging","cannotConnectToDestination");
            }
            _loc4_.rootCause = param1;
            _loc2_.agent.fault(_loc4_,_loc3_);
         }
      }
      
      public function channelDisconnectHandler(param1:ChannelEvent) : void
      {
         _connecting = false;
         setConnected(false);
         if(_shouldBeConnected && !param1.reconnecting && !param1.rejected)
         {
            if(_shouldHunt && hunt())
            {
               param1.reconnecting = true;
               dispatchEvent(param1);
               if(_currentChannel is NetConnectionChannel)
               {
                  if(_reconnectTimer == null)
                  {
                     _reconnectTimer = new Timer(1,1);
                     _reconnectTimer.addEventListener(TimerEvent.TIMER,reconnectChannel);
                     _reconnectTimer.start();
                  }
               }
               else
               {
                  connectChannel();
               }
            }
            else
            {
               dispatchEvent(param1);
               faultPendingSends(param1);
            }
         }
         else
         {
            dispatchEvent(param1);
            if(param1.rejected)
            {
               faultPendingSends(param1);
            }
         }
         _shouldHunt = true;
      }
      
      public function removeChannel(param1:Channel) : void
      {
         var _loc3_:String = null;
         if(mx_internal::configured)
         {
            _loc3_ = String(resourceManager.getString("messaging","cannotRemoveWhenConfigured"));
            throw new IllegalOperationError(_loc3_);
         }
         var _loc2_:int = _channels.indexOf(param1);
         if(_loc2_ > -1)
         {
            _channels.splice(_loc2_,1);
            if(_currentChannel != null && _currentChannel == param1)
            {
               if(connected)
               {
                  _shouldHunt = false;
                  disconnectChannel();
               }
               _currentChannel = null;
               _currentChannelIndex = -1;
            }
         }
      }
      
      public function get heartbeatInterval() : int
      {
         return _heartbeatInterval;
      }
      
      public function channelConnectHandler(param1:ChannelEvent) : void
      {
         var _loc3_:PendingSend = null;
         var _loc4_:CommandMessage = null;
         var _loc5_:AcknowledgeMessage = null;
         _connecting = false;
         _connected = true;
         _currentChannelIndex = -1;
         while(_pendingSends.length > 0)
         {
            _loc3_ = PendingSend(_pendingSends.shift());
            delete _pendingMessages[_loc3_.message];
            if((_loc4_ = _loc3_.message as CommandMessage) != null)
            {
               if(_loc4_.operation == CommandMessage.TRIGGER_CONNECT_OPERATION)
               {
                  (_loc5_ = new AcknowledgeMessage()).clientId = _loc3_.agent.clientId;
                  _loc5_.correlationId = _loc4_.messageId;
                  _loc3_.agent.acknowledge(_loc5_,_loc4_);
                  continue;
               }
               if(!_loc3_.agent.mx_internal::configRequested && _loc3_.agent.mx_internal::needsConfig && _loc4_.operation == CommandMessage.CLIENT_PING_OPERATION)
               {
                  _loc4_.headers[CommandMessage.NEEDS_CONFIG_HEADER] = true;
                  _loc3_.agent.mx_internal::configRequested = true;
               }
            }
            send(_loc3_.agent,_loc3_.message);
         }
         if(_hunting)
         {
            param1.reconnecting = true;
            _hunting = false;
         }
         dispatchEvent(param1);
         var _loc2_:PropertyChangeEvent = PropertyChangeEvent.createUpdateEvent(this,"connected",false,true);
         dispatchEvent(_loc2_);
      }
      
      public function get initialDestinationId() : String
      {
         return _initialDestinationId;
      }
      
      public function connect(param1:MessageAgent) : void
      {
         if(param1 != null && _messageAgents.indexOf(param1) == -1)
         {
            _shouldBeConnected = true;
            _messageAgents.push(param1);
            param1.mx_internal::internalSetChannelSet(this);
            addEventListener(ChannelEvent.CONNECT,param1.channelConnectHandler);
            addEventListener(ChannelEvent.DISCONNECT,param1.channelDisconnectHandler);
            addEventListener(ChannelFaultEvent.FAULT,param1.channelFaultHandler);
            if(connected && !param1.mx_internal::needsConfig)
            {
               param1.channelConnectHandler(ChannelEvent.createEvent(ChannelEvent.CONNECT,_currentChannel,false,false,connected));
            }
         }
      }
      
      public function channelFaultHandler(param1:ChannelFaultEvent) : void
      {
         if(param1.channel.connected)
         {
            dispatchEvent(param1);
         }
         else
         {
            _connecting = false;
            setConnected(false);
            if(_shouldBeConnected && !param1.reconnecting && !param1.rejected)
            {
               if(hunt())
               {
                  param1.reconnecting = true;
                  dispatchEvent(param1);
                  if(_currentChannel is NetConnectionChannel)
                  {
                     if(_reconnectTimer == null)
                     {
                        _reconnectTimer = new Timer(1,1);
                        _reconnectTimer.addEventListener(TimerEvent.TIMER,reconnectChannel);
                        _reconnectTimer.start();
                     }
                  }
                  else
                  {
                     connectChannel();
                  }
               }
               else
               {
                  dispatchEvent(param1);
                  faultPendingSends(param1);
               }
            }
            else
            {
               dispatchEvent(param1);
               if(param1.rejected)
               {
                  faultPendingSends(param1);
               }
            }
         }
      }
      
      mx_internal function setAuthenticated(param1:Boolean, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:PropertyChangeEvent = null;
         var _loc5_:MessageAgent = null;
         var _loc6_:int = 0;
         if(_authenticated != param1)
         {
            _loc4_ = PropertyChangeEvent.createUpdateEvent(this,"authenticated",_authenticated,param1);
            _authenticated = param1;
            if(param3)
            {
               _loc6_ = 0;
               while(_loc6_ < _messageAgents.length)
               {
                  (_loc5_ = MessageAgent(_messageAgents[_loc6_])).mx_internal::setAuthenticated(param1,param2);
                  _loc6_++;
               }
            }
            dispatchEvent(_loc4_);
         }
      }
      
      protected function sendHeartbeatHandler(param1:TimerEvent) : void
      {
         unscheduleHeartbeat();
         if(currentChannel != null)
         {
            sendHeartbeat();
            scheduleHeartbeat();
         }
      }
      
      private function dispatchRPCEvent(param1:AbstractEvent) : void
      {
         param1.mx_internal::callTokenResponders();
         dispatchEvent(param1);
      }
      
      mx_internal function authenticationSuccess(param1:AuthenticationAgent, param2:AsyncToken, param3:AcknowledgeMessage) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:*;
         var _loc4_:CommandMessage;
         var _loc6_:String = (_loc5_ = (_loc4_ = CommandMessage(param2.message)).operation == CommandMessage.LOGIN_OPERATION) ? String(_loc4_.body) : null;
         if(_loc5_)
         {
            _credentials = _loc6_;
            _loc8_ = int(_messageAgents.length);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _messageAgents[_loc9_].internalSetCredentials(_loc6_);
               _loc9_++;
            }
            _loc8_ = int(_channels.length);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               if(_channels[_loc9_] != null)
               {
                  _channels[_loc9_].internalSetCredentials(_loc6_);
               }
               _loc9_++;
            }
            param1.state = AuthenticationAgent.LOGGED_IN_STATE;
            currentChannel.mx_internal::setAuthenticated(true);
         }
         else
         {
            param1.state = AuthenticationAgent.SHUTDOWN_STATE;
            _authAgent = null;
            disconnect(param1);
            currentChannel.mx_internal::setAuthenticated(false);
         }
         var _loc7_:ResultEvent = ResultEvent.createEvent(param3.body,param2,param3);
         dispatchRPCEvent(_loc7_);
      }
      
      public function disconnectAll() : void
      {
         disconnect(null);
      }
      
      public function get messageAgents() : Array
      {
         return _messageAgents;
      }
      
      mx_internal function set channelFailoverURIs(param1:Object) : void
      {
         var _loc4_:Channel = null;
         _channelFailoverURIs = param1;
         var _loc2_:int = int(_channels.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = _channels[_loc3_]) == null)
            {
               break;
            }
            if(_channelFailoverURIs[_loc4_.id] != null)
            {
               _loc4_.failoverURIs = _channelFailoverURIs[_loc4_.id];
            }
            _loc3_++;
         }
      }
      
      mx_internal function authenticationFailure(param1:AuthenticationAgent, param2:AsyncToken, param3:ErrorMessage) : void
      {
         var _loc4_:MessageFaultEvent = MessageFaultEvent.createEvent(param3);
         var _loc5_:FaultEvent = FaultEvent.createEventFromMessageFault(_loc4_,param2);
         param1.state = AuthenticationAgent.SHUTDOWN_STATE;
         _authAgent = null;
         disconnect(param1);
         dispatchRPCEvent(_loc5_);
      }
      
      override public function toString() : String
      {
         var _loc1_:String = "[ChannelSet ";
         var _loc2_:uint = 0;
         while(_loc2_ < _channels.length)
         {
            if(_channels[_loc2_] != null)
            {
               _loc1_ += _channels[_loc2_].id + " ";
            }
            _loc2_++;
         }
         return _loc1_ + "]";
      }
   }
}

import mx.core.mx_internal;
import mx.logging.Log;
import mx.messaging.ChannelSet;
import mx.messaging.MessageAgent;
import mx.messaging.events.ChannelEvent;
import mx.messaging.messages.AcknowledgeMessage;
import mx.messaging.messages.ErrorMessage;
import mx.messaging.messages.IMessage;
import mx.rpc.AsyncToken;

use namespace mx_internal;

class AuthenticationAgent extends MessageAgent
{
   
   public static const LOGGING_OUT_STATE:int = 3;
   
   public static const LOGGED_OUT_STATE:int = 0;
   
   public static const LOGGED_IN_STATE:int = 2;
   
   public static const LOGGING_IN_STATE:int = 1;
   
   public static const SHUTDOWN_STATE:int = 4;
    
   
   private var _state:int = 0;
   
   private var tokens:Object;
   
   public function AuthenticationAgent(param1:ChannelSet)
   {
      tokens = {};
      super();
      _log = Log.getLogger("ChannelSet.AuthenticationAgent");
      _agentType = "authentication agent";
      this.channelSet = param1;
   }
   
   public function get state() : int
   {
      return _state;
   }
   
   public function registerToken(param1:AsyncToken) : void
   {
      tokens[param1.message.messageId] = param1;
   }
   
   public function set state(param1:int) : void
   {
      _state = param1;
      if(param1 == SHUTDOWN_STATE)
      {
         tokens = null;
      }
   }
   
   override public function acknowledge(param1:AcknowledgeMessage, param2:IMessage) : void
   {
      var _loc4_:AsyncToken = null;
      if(state == SHUTDOWN_STATE)
      {
         return;
      }
      var _loc3_:Boolean = Boolean(param1.headers[AcknowledgeMessage.ERROR_HINT_HEADER]);
      super.acknowledge(param1,param2);
      if(!_loc3_)
      {
         _loc4_ = tokens[param2.messageId];
         delete tokens[param2.messageId];
         channelSet.mx_internal::authenticationSuccess(this,_loc4_,param1 as AcknowledgeMessage);
      }
   }
   
   override public function fault(param1:ErrorMessage, param2:IMessage) : void
   {
      var _loc4_:AcknowledgeMessage = null;
      if(state == SHUTDOWN_STATE)
      {
         return;
      }
      if(param1.rootCause is ChannelEvent && (param1.rootCause as ChannelEvent).type == ChannelEvent.DISCONNECT)
      {
         (_loc4_ = new AcknowledgeMessage()).clientId = clientId;
         _loc4_.correlationId = param2.messageId;
         acknowledge(_loc4_,param2);
         return;
      }
      super.fault(param1,param2);
      var _loc3_:AsyncToken = tokens[param2.messageId];
      delete tokens[param2.messageId];
      channelSet.mx_internal::authenticationFailure(this,_loc3_,param1 as ErrorMessage);
   }
}

import mx.messaging.MessageAgent;
import mx.messaging.messages.IMessage;

class PendingSend
{
    
   
   public var agent:MessageAgent;
   
   public var message:IMessage;
   
   public function PendingSend(param1:MessageAgent, param2:IMessage)
   {
      super();
      this.agent = param1;
      this.message = param2;
   }
}

import mx.collections.ArrayCollection;
import mx.core.mx_internal;
import mx.messaging.ChannelSet;
import mx.messaging.MessageResponder;
import mx.messaging.messages.IMessage;

use namespace mx_internal;

class ClusterMessageResponder extends MessageResponder
{
    
   
   private var _channelSet:ChannelSet;
   
   public function ClusterMessageResponder(param1:IMessage, param2:ChannelSet)
   {
      super(null,param1);
      _channelSet = param2;
   }
   
   override protected function resultHandler(param1:IMessage) : void
   {
      var _loc2_:Object = null;
      var _loc3_:Array = null;
      var _loc4_:int = 0;
      var _loc5_:int = 0;
      var _loc6_:Object = null;
      var _loc7_:Object = null;
      if(param1.body != null && (param1.body is Array || param1.body is ArrayCollection))
      {
         _loc2_ = {};
         _loc3_ = param1.body is Array ? param1.body as Array : (param1.body as ArrayCollection).toArray();
         _loc4_ = int(_loc3_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            for(_loc7_ in _loc6_)
            {
               if(_loc2_[_loc7_] == null)
               {
                  _loc2_[_loc7_] = [];
               }
               _loc2_[_loc7_].push(_loc6_[_loc7_]);
            }
            _loc5_++;
         }
         _channelSet.mx_internal::channelFailoverURIs = _loc2_;
      }
   }
}
