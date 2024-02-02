package mx.messaging
{
   import flash.events.EventDispatcher;
   import mx.core.IMXMLObject;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.logging.ILogger;
   import mx.logging.Log;
   import mx.messaging.config.ConfigMap;
   import mx.messaging.config.ServerConfig;
   import mx.messaging.errors.InvalidDestinationError;
   import mx.messaging.events.ChannelEvent;
   import mx.messaging.events.ChannelFaultEvent;
   import mx.messaging.events.MessageAckEvent;
   import mx.messaging.events.MessageEvent;
   import mx.messaging.events.MessageFaultEvent;
   import mx.messaging.messages.AbstractMessage;
   import mx.messaging.messages.AcknowledgeMessage;
   import mx.messaging.messages.CommandMessage;
   import mx.messaging.messages.ErrorMessage;
   import mx.messaging.messages.IMessage;
   import mx.messaging.messages.MessagePerformanceUtils;
   import mx.netmon.NetworkMonitor;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.utils.Base64Encoder;
   import mx.utils.UIDUtil;
   
   use namespace mx_internal;
   
   public class MessageAgent extends EventDispatcher implements IMXMLObject
   {
      
      mx_internal static const AUTO_CONFIGURED_CHANNELSET:int = 0;
      
      mx_internal static const MANUALLY_ASSIGNED_CHANNELSET:int = 1;
       
      
      private var _needsConfig:Boolean;
      
      protected var _disconnectBarrier:Boolean;
      
      protected var _log:ILogger;
      
      private var _connected:Boolean = false;
      
      private var _clientId:String;
      
      private var _sendRemoteCredentials:Boolean;
      
      private var _authenticated:Boolean;
      
      protected var _ignoreFault:Boolean = false;
      
      private var _id:String;
      
      protected var _credentials:String;
      
      private var resourceManager:IResourceManager;
      
      private var _channelSetMode:int = 0;
      
      mx_internal var configRequested:Boolean = false;
      
      private var _pendingConnectEvent:ChannelEvent;
      
      protected var _credentialsCharset:String;
      
      private var _remoteCredentials:String = "";
      
      private var _destination:String = "";
      
      protected var _agentType:String = "mx.messaging.MessageAgent";
      
      private var _requestTimeout:int = -1;
      
      private var _remoteCredentialsCharset:String;
      
      private var _clientIdWaitQueue:Array;
      
      private var _channelSet:ChannelSet;
      
      public function MessageAgent()
      {
         resourceManager = ResourceManager.getInstance();
         _id = UIDUtil.createUID();
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get connected() : Boolean
      {
         return _connected;
      }
      
      [Bindable(event="propertyChange")]
      public function get destination() : String
      {
         return _destination;
      }
      
      protected function initChannelSet(param1:IMessage) : void
      {
         if(_channelSet == null)
         {
            _channelSetMode = mx_internal::AUTO_CONFIGURED_CHANNELSET;
            mx_internal::internalSetChannelSet(ServerConfig.getChannelSet(destination));
         }
         if(_channelSet.connected && mx_internal::needsConfig && !mx_internal::configRequested)
         {
            param1.headers[CommandMessage.NEEDS_CONFIG_HEADER] = true;
            mx_internal::configRequested = true;
         }
         _channelSet.connect(this);
         if(_credentials != null)
         {
            channelSet.setCredentials(_credentials,this,_credentialsCharset);
         }
      }
      
      mx_internal function set needsConfig(param1:Boolean) : void
      {
         var cs:ChannelSet = null;
         var value:Boolean = param1;
         if(_needsConfig == value)
         {
            return;
         }
         _needsConfig = value;
         if(_needsConfig)
         {
            cs = channelSet;
            try
            {
               disconnect();
            }
            finally
            {
               mx_internal::internalSetChannelSet(cs);
            }
         }
      }
      
      public function logout() : void
      {
         _credentials = null;
         if(channelSet)
         {
            channelSet.logout(this);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get id() : String
      {
         return _id;
      }
      
      public function set destination(param1:String) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         if(_destination != param1)
         {
            if(_channelSetMode == mx_internal::AUTO_CONFIGURED_CHANNELSET && channelSet != null)
            {
               channelSet.disconnect(this);
               channelSet = null;
            }
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"destination",_destination,param1);
            _destination = param1;
            dispatchEvent(_loc2_);
            if(Log.isInfo())
            {
               _log.info("\'{0}\' {2} set destination to \'{1}\'.",id,_destination,_agentType);
            }
         }
      }
      
      mx_internal function get channelSetMode() : int
      {
         return _channelSetMode;
      }
      
      public function acknowledge(param1:AcknowledgeMessage, param2:IMessage) : void
      {
         var mpiutil:MessagePerformanceUtils = null;
         var ackMsg:AcknowledgeMessage = param1;
         var msg:IMessage = param2;
         if(Log.isInfo())
         {
            _log.info("\'{0}\' {2} acknowledge of \'{1}\'.",id,msg.messageId,_agentType);
         }
         if(Log.isDebug() && channelSet != null && channelSet.currentChannel != null && channelSet.currentChannel.mpiEnabled)
         {
            try
            {
               mpiutil = new MessagePerformanceUtils(ackMsg);
               _log.debug(mpiutil.prettyPrint());
            }
            catch(e:Error)
            {
               _log.debug("Could not get message performance information for: " + msg.toString());
            }
         }
         if(mx_internal::configRequested)
         {
            mx_internal::configRequested = false;
            ServerConfig.mx_internal::updateServerConfigData(ackMsg.body as ConfigMap);
            mx_internal::needsConfig = false;
            if(_pendingConnectEvent)
            {
               channelConnectHandler(_pendingConnectEvent);
            }
            _pendingConnectEvent = null;
         }
         if(clientId == null)
         {
            if(ackMsg.clientId != null)
            {
               mx_internal::setClientId(ackMsg.clientId);
            }
            else
            {
               flushClientIdWaitQueue();
            }
         }
         dispatchEvent(MessageAckEvent.createEvent(ackMsg,msg));
         monitorRpcMessage(ackMsg,msg);
      }
      
      mx_internal function internalSetChannelSet(param1:ChannelSet) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(_channelSet != param1)
         {
            if(_channelSet != null)
            {
               _channelSet.disconnect(this);
            }
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"channelSet",_channelSet,param1);
            _channelSet = param1;
            if(_channelSet != null)
            {
               if(_credentials)
               {
                  _channelSet.setCredentials(_credentials,this,_credentialsCharset);
               }
               _channelSet.connect(this);
            }
            dispatchEvent(_loc2_);
         }
      }
      
      public function fault(param1:ErrorMessage, param2:IMessage) : void
      {
         if(Log.isError())
         {
            _log.error("\'{0}\' {2} fault for \'{1}\'.",id,param2.messageId,_agentType);
         }
         _ignoreFault = false;
         mx_internal::configRequested = false;
         if(param1.headers[ErrorMessage.RETRYABLE_HINT_HEADER])
         {
            delete param1.headers[ErrorMessage.RETRYABLE_HINT_HEADER];
         }
         if(clientId == null)
         {
            if(param1.clientId != null)
            {
               mx_internal::setClientId(param1.clientId);
            }
            else
            {
               flushClientIdWaitQueue();
            }
         }
         dispatchEvent(MessageFaultEvent.createEvent(param1));
         monitorRpcMessage(param1,param2);
         if(param1.faultCode == "Client.Authentication" && authenticated && channelSet != null && channelSet.currentChannel != null)
         {
            channelSet.currentChannel.mx_internal::setAuthenticated(false);
            if(channelSet.currentChannel.mx_internal::loginAfterDisconnect)
            {
               reAuthorize(param2);
               _ignoreFault = true;
            }
         }
      }
      
      public function set requestTimeout(param1:int) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(_requestTimeout != param1)
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"requestTimeout",_requestTimeout,param1);
            _requestTimeout = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function disconnect() : void
      {
         if(!_disconnectBarrier)
         {
            _clientIdWaitQueue = null;
            if(connected)
            {
               _disconnectBarrier = true;
            }
            if(_channelSetMode == mx_internal::AUTO_CONFIGURED_CHANNELSET)
            {
               mx_internal::internalSetChannelSet(null);
            }
            else if(_channelSet != null)
            {
               _channelSet.disconnect(this);
            }
         }
      }
      
      public function set id(param1:String) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(_id != param1)
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"id",_id,param1);
            _id = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function set channelSet(param1:ChannelSet) : void
      {
         mx_internal::internalSetChannelSet(param1);
         _channelSetMode = mx_internal::MANUALLY_ASSIGNED_CHANNELSET;
      }
      
      [Bindable(event="propertyChange")]
      public function get clientId() : String
      {
         return _clientId;
      }
      
      protected function setConnected(param1:Boolean) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(_connected != param1)
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"connected",_connected,param1);
            _connected = param1;
            dispatchEvent(_loc2_);
            mx_internal::setAuthenticated(param1 && Boolean(channelSet) && channelSet.authenticated,_credentials);
         }
      }
      
      mx_internal function setClientId(param1:String) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(_clientId != param1)
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"clientId",_clientId,param1);
            _clientId = param1;
            flushClientIdWaitQueue();
            dispatchEvent(_loc2_);
         }
      }
      
      public function setCredentials(param1:String, param2:String, param3:String = null) : void
      {
         var _loc4_:String = null;
         var _loc5_:Base64Encoder = null;
         if(param1 == null && param2 == null)
         {
            _credentials = null;
            _credentialsCharset = null;
         }
         else
         {
            _loc4_ = param1 + ":" + param2;
            _loc5_ = new Base64Encoder();
            if(param3 == Base64Encoder.CHARSET_UTF_8)
            {
               _loc5_.encodeUTFBytes(_loc4_);
            }
            else
            {
               _loc5_.encode(_loc4_);
            }
            _credentials = _loc5_.drain();
            _credentialsCharset = param3;
         }
         if(channelSet != null)
         {
            channelSet.setCredentials(_credentials,this,_credentialsCharset);
         }
      }
      
      public function channelDisconnectHandler(param1:ChannelEvent) : void
      {
         if(Log.isWarn())
         {
            _log.warn("\'{0}\' {1} channel disconnected.",id,_agentType);
         }
         setConnected(false);
         if(_remoteCredentials != null)
         {
            _sendRemoteCredentials = true;
         }
         dispatchEvent(param1);
      }
      
      public function setRemoteCredentials(param1:String, param2:String, param3:String = null) : void
      {
         var _loc4_:String = null;
         var _loc5_:Base64Encoder = null;
         if(param1 == null && param2 == null)
         {
            _remoteCredentials = "";
            _remoteCredentialsCharset = null;
         }
         else
         {
            _loc4_ = param1 + ":" + param2;
            _loc5_ = new Base64Encoder();
            if(param3 == Base64Encoder.CHARSET_UTF_8)
            {
               _loc5_.encodeUTFBytes(_loc4_);
            }
            else
            {
               _loc5_.encode(_loc4_);
            }
            _remoteCredentials = _loc5_.drain();
            _remoteCredentialsCharset = param3;
         }
         _sendRemoteCredentials = true;
      }
      
      mx_internal function get needsConfig() : Boolean
      {
         return _needsConfig;
      }
      
      public function hasPendingRequestForMessage(param1:IMessage) : Boolean
      {
         return false;
      }
      
      [Bindable(event="propertyChange")]
      public function get authenticated() : Boolean
      {
         return _authenticated;
      }
      
      [Bindable(event="propertyChange")]
      public function get requestTimeout() : int
      {
         return _requestTimeout;
      }
      
      public function initialized(param1:Object, param2:String) : void
      {
         this.id = param2;
      }
      
      mx_internal function getNetmonId() : String
      {
         return null;
      }
      
      final protected function flushClientIdWaitQueue() : void
      {
         var _loc1_:Array = null;
         if(_clientIdWaitQueue != null)
         {
            if(clientId != null)
            {
               while(_clientIdWaitQueue.length > 0)
               {
                  internalSend(_clientIdWaitQueue.shift() as IMessage);
               }
            }
            if(clientId == null)
            {
               if(_clientIdWaitQueue.length > 0)
               {
                  _loc1_ = _clientIdWaitQueue;
                  _clientIdWaitQueue = null;
                  internalSend(_loc1_.shift() as IMessage);
                  _clientIdWaitQueue = _loc1_;
               }
               else
               {
                  _clientIdWaitQueue = null;
               }
            }
         }
      }
      
      private function monitorRpcMessage(param1:IMessage, param2:IMessage) : void
      {
         if(NetworkMonitor.isMonitoring())
         {
            if(param1 is ErrorMessage)
            {
               NetworkMonitor.monitorFault(param2,MessageFaultEvent.createEvent(ErrorMessage(param1)));
            }
            else if(param1 is AcknowledgeMessage)
            {
               NetworkMonitor.monitorResult(param1,MessageEvent.createEvent(MessageEvent.RESULT,param2));
            }
            else
            {
               NetworkMonitor.monitorInvocation(mx_internal::getNetmonId(),param1,this);
            }
         }
      }
      
      final protected function assertCredentials(param1:String) : void
      {
         var _loc2_:ErrorMessage = null;
         if(_credentials != null && _credentials != param1)
         {
            _loc2_ = new ErrorMessage();
            _loc2_.faultCode = "Client.Authentication.Error";
            _loc2_.faultString = "Credentials specified do not match those used on underlying connection.";
            _loc2_.faultDetail = "Channel was authenticated with a different set of credentials than those used for this agent.";
            dispatchEvent(MessageFaultEvent.createEvent(_loc2_));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get channelSet() : ChannelSet
      {
         return _channelSet;
      }
      
      public function channelConnectHandler(param1:ChannelEvent) : void
      {
         _disconnectBarrier = false;
         if(mx_internal::needsConfig)
         {
            if(Log.isInfo())
            {
               _log.info("\'{0}\' {1} waiting for configuration information.",id,_agentType);
            }
            _pendingConnectEvent = param1;
         }
         else
         {
            if(Log.isInfo())
            {
               _log.info("\'{0}\' {1} connected.",id,_agentType);
            }
            setConnected(true);
            dispatchEvent(param1);
         }
      }
      
      mx_internal function internalSetCredentials(param1:String) : void
      {
         _credentials = param1;
      }
      
      public function channelFaultHandler(param1:ChannelFaultEvent) : void
      {
         if(Log.isWarn())
         {
            _log.warn("\'{0}\' {1} channel faulted with {2} {3}",id,_agentType,param1.faultCode,param1.faultDetail);
         }
         if(!param1.channel.connected)
         {
            setConnected(false);
            if(_remoteCredentials != null)
            {
               _sendRemoteCredentials = true;
            }
         }
         dispatchEvent(param1);
      }
      
      protected function internalSend(param1:IMessage, param2:Boolean = true) : void
      {
         var _loc3_:String = null;
         if(param1.clientId == null && param2 && clientId == null)
         {
            if(_clientIdWaitQueue != null)
            {
               _clientIdWaitQueue.push(param1);
               return;
            }
            _clientIdWaitQueue = [];
         }
         if(param1.clientId == null)
         {
            param1.clientId = clientId;
         }
         if(requestTimeout > 0)
         {
            param1.headers[AbstractMessage.REQUEST_TIMEOUT_HEADER] = requestTimeout;
         }
         if(_sendRemoteCredentials)
         {
            if(!(param1 is CommandMessage && CommandMessage(param1).operation == CommandMessage.TRIGGER_CONNECT_OPERATION))
            {
               param1.headers[AbstractMessage.REMOTE_CREDENTIALS_HEADER] = _remoteCredentials;
               param1.headers[AbstractMessage.REMOTE_CREDENTIALS_CHARSET_HEADER] = _remoteCredentialsCharset;
               _sendRemoteCredentials = false;
            }
         }
         if(channelSet != null)
         {
            if(!connected && _channelSetMode == mx_internal::MANUALLY_ASSIGNED_CHANNELSET)
            {
               _channelSet.connect(this);
            }
            if(channelSet.connected && mx_internal::needsConfig && !mx_internal::configRequested)
            {
               param1.headers[CommandMessage.NEEDS_CONFIG_HEADER] = true;
               mx_internal::configRequested = true;
            }
            channelSet.send(this,param1);
            monitorRpcMessage(param1,param1);
         }
         else
         {
            if(!(destination != null && destination.length > 0))
            {
               _loc3_ = String(resourceManager.getString("messaging","destinationNotSet"));
               throw new InvalidDestinationError(_loc3_);
            }
            initChannelSet(param1);
            if(channelSet != null)
            {
               channelSet.send(this,param1);
               monitorRpcMessage(param1,param1);
            }
         }
      }
      
      mx_internal function setAuthenticated(param1:Boolean, param2:String) : void
      {
         var _loc3_:PropertyChangeEvent = null;
         if(_authenticated != param1)
         {
            _loc3_ = PropertyChangeEvent.createUpdateEvent(this,"authenticated",_authenticated,param1);
            _authenticated = param1;
            dispatchEvent(_loc3_);
            if(param1)
            {
               assertCredentials(param2);
            }
         }
      }
      
      protected function reAuthorize(param1:IMessage) : void
      {
         disconnect();
         internalSend(param1);
      }
   }
}
