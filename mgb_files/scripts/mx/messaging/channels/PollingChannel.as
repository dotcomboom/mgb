package mx.messaging.channels
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.core.mx_internal;
   import mx.logging.Log;
   import mx.messaging.Channel;
   import mx.messaging.ChannelSet;
   import mx.messaging.Consumer;
   import mx.messaging.ConsumerMessageDispatcher;
   import mx.messaging.MessageAgent;
   import mx.messaging.MessageResponder;
   import mx.messaging.events.ChannelFaultEvent;
   import mx.messaging.messages.CommandMessage;
   import mx.messaging.messages.IMessage;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   use namespace mx_internal;
   
   public class PollingChannel extends Channel
   {
      
      private static const DEFAULT_POLLING_INTERVAL:int = 3000;
       
      
      mx_internal var _timer:Timer;
      
      private var _pollingEnabled:Boolean;
      
      private var _piggybackingEnabled:Boolean;
      
      mx_internal var _pollingInterval:int;
      
      mx_internal var pollOutstanding:Boolean;
      
      private var _pollingRef:int = -1;
      
      mx_internal var _shouldPoll:Boolean;
      
      private var resourceManager:IResourceManager;
      
      public function PollingChannel(param1:String = null, param2:String = null)
      {
         resourceManager = ResourceManager.getInstance();
         super(param1,param2);
         _pollingEnabled = true;
         mx_internal::_shouldPoll = false;
         if(timerRequired())
         {
            mx_internal::_pollingInterval = DEFAULT_POLLING_INTERVAL;
            mx_internal::_timer = new Timer(mx_internal::_pollingInterval,1);
            mx_internal::_timer.addEventListener(TimerEvent.TIMER,internalPoll);
         }
      }
      
      public function enablePolling() : void
      {
         ++_pollingRef;
         if(_pollingRef == 0)
         {
            startPolling();
         }
      }
      
      mx_internal function get timerRunning() : Boolean
      {
         return mx_internal::_timer != null && mx_internal::_timer.running;
      }
      
      protected function timerRequired() : Boolean
      {
         return true;
      }
      
      override protected function setConnected(param1:Boolean) : void
      {
         var _loc2_:ChannelSet = null;
         var _loc3_:MessageAgent = null;
         if(connected != param1)
         {
            if(param1)
            {
               for each(_loc2_ in channelSets)
               {
                  for each(_loc3_ in _loc2_.messageAgents)
                  {
                     if(_loc3_ is Consumer && (_loc3_ as Consumer).subscribed)
                     {
                        enablePolling();
                     }
                  }
               }
            }
            super.setConnected(param1);
         }
      }
      
      override public function send(param1:MessageAgent, param2:IMessage) : void
      {
         var consumerDispatcher:ConsumerMessageDispatcher = null;
         var msg:CommandMessage = null;
         var agent:MessageAgent = param1;
         var message:IMessage = param2;
         var piggyback:Boolean = false;
         if(!mx_internal::pollOutstanding && _piggybackingEnabled && !(message is CommandMessage))
         {
            if(mx_internal::_shouldPoll)
            {
               piggyback = true;
            }
            else
            {
               consumerDispatcher = ConsumerMessageDispatcher.getInstance();
               if(consumerDispatcher.isChannelUsedForSubscriptions(this))
               {
                  piggyback = true;
               }
            }
         }
         if(piggyback)
         {
            internalPoll();
         }
         super.send(agent,message);
         if(piggyback)
         {
            msg = new CommandMessage();
            msg.operation = CommandMessage.POLL_OPERATION;
            if(Log.isDebug())
            {
               _log.debug("\'{0}\' channel sending poll message\n{1}\n",id,msg.toString());
            }
            try
            {
               internalSend(new PollCommandMessageResponder(null,msg,this,_log));
            }
            catch(e:Error)
            {
               mx_internal::stopPolling();
               throw e;
            }
         }
      }
      
      protected function applyPollingSettings(param1:XML) : void
      {
         var _loc2_:XML = null;
         if(param1.properties.length())
         {
            _loc2_ = param1.properties[0];
            if(_loc2_["polling-enabled"].length())
            {
               internalPollingEnabled = _loc2_["polling-enabled"].toString() == "true";
            }
            if(_loc2_["polling-interval-millis"].length())
            {
               mx_internal::internalPollingInterval = parseInt(_loc2_["polling-interval-millis"].toString());
            }
            else if(_loc2_["polling-interval-seconds"].length())
            {
               mx_internal::internalPollingInterval = parseInt(_loc2_["polling-interval-seconds"].toString()) * 1000;
            }
            if(_loc2_["piggybacking-enabled"].length())
            {
               internalPiggybackingEnabled = _loc2_["piggybacking-enabled"].toString() == "true";
            }
            if(_loc2_["login-after-disconnect"].length())
            {
               _loginAfterDisconnect = _loc2_["login-after-disconnect"].toString() == "true";
            }
         }
      }
      
      mx_internal function set internalPollingInterval(param1:Number) : void
      {
         var _loc2_:String = null;
         if(param1 == 0)
         {
            mx_internal::_pollingInterval = param1;
            if(mx_internal::_timer != null)
            {
               mx_internal::_timer.stop();
            }
            if(mx_internal::_shouldPoll)
            {
               startPolling();
            }
         }
         else
         {
            if(param1 <= 0)
            {
               _loc2_ = String(resourceManager.getString("messaging","pollingIntervalNonPositive"));
               throw new ArgumentError(_loc2_);
            }
            if(mx_internal::_timer != null)
            {
               mx_internal::_timer.delay = mx_internal::_pollingInterval = param1;
               if(!mx_internal::timerRunning && mx_internal::_shouldPoll)
               {
                  startPolling();
               }
            }
         }
      }
      
      public function poll() : void
      {
         internalPoll();
      }
      
      protected function set internalPiggybackingEnabled(param1:Boolean) : void
      {
         _piggybackingEnabled = param1;
      }
      
      protected function get internalPollingEnabled() : Boolean
      {
         return _pollingEnabled;
      }
      
      mx_internal function pollFailed(param1:Boolean = false) : void
      {
         internalDisconnect(param1);
      }
      
      override protected function connectFailed(param1:ChannelFaultEvent) : void
      {
         mx_internal::stopPolling();
         super.connectFailed(param1);
      }
      
      mx_internal function stopPolling() : void
      {
         if(Log.isInfo())
         {
            _log.info("\'{0}\' channel polling stopped.",id);
         }
         if(mx_internal::_timer != null)
         {
            mx_internal::_timer.stop();
         }
         _pollingRef = -1;
         mx_internal::_shouldPoll = false;
         mx_internal::pollOutstanding = false;
      }
      
      protected function internalPoll(param1:Event = null) : void
      {
         var poll:CommandMessage = null;
         var event:Event = param1;
         if(!mx_internal::pollOutstanding)
         {
            if(Log.isInfo())
            {
               _log.info("\'{0}\' channel requesting queued messages.",id);
            }
            if(mx_internal::timerRunning)
            {
               mx_internal::_timer.stop();
            }
            poll = new CommandMessage();
            poll.operation = CommandMessage.POLL_OPERATION;
            if(Log.isDebug())
            {
               _log.debug("\'{0}\' channel sending poll message\n{1}\n",id,poll.toString());
            }
            try
            {
               internalSend(new PollCommandMessageResponder(null,poll,this,_log));
               mx_internal::pollOutstanding = true;
            }
            catch(e:Error)
            {
               mx_internal::stopPolling();
               throw e;
            }
         }
         else if(Log.isInfo())
         {
            _log.info("\'{0}\' channel waiting for poll response.",id);
         }
      }
      
      protected function getDefaultMessageResponder(param1:MessageAgent, param2:IMessage) : MessageResponder
      {
         return super.getMessageResponder(param1,param2);
      }
      
      mx_internal function get internalPollingInterval() : Number
      {
         return mx_internal::_timer == null ? 0 : mx_internal::_pollingInterval;
      }
      
      protected function startPolling() : void
      {
         if(_pollingEnabled)
         {
            if(Log.isInfo())
            {
               _log.info("\'{0}\' channel polling started.",id);
            }
            mx_internal::_shouldPoll = true;
            poll();
         }
      }
      
      protected function get internalPiggybackingEnabled() : Boolean
      {
         return _piggybackingEnabled;
      }
      
      override mx_internal function get realtime() : Boolean
      {
         return _pollingEnabled;
      }
      
      final override protected function getMessageResponder(param1:MessageAgent, param2:IMessage) : MessageResponder
      {
         if(param2 is CommandMessage && (param2 as CommandMessage).operation == CommandMessage.POLL_OPERATION)
         {
            return new PollCommandMessageResponder(param1,param2,this,_log);
         }
         return getDefaultMessageResponder(param1,param2);
      }
      
      override protected function internalDisconnect(param1:Boolean = false) : void
      {
         mx_internal::stopPolling();
         super.internalDisconnect(param1);
      }
      
      public function disablePolling() : void
      {
         --_pollingRef;
         if(_pollingRef < 0)
         {
            mx_internal::stopPolling();
         }
      }
      
      protected function set internalPollingEnabled(param1:Boolean) : void
      {
         _pollingEnabled = param1;
         if(!param1 && (mx_internal::timerRunning || !mx_internal::timerRunning && mx_internal::_pollingInterval == 0))
         {
            mx_internal::stopPolling();
         }
         else if(param1 && mx_internal::_shouldPoll && !mx_internal::timerRunning)
         {
            startPolling();
         }
      }
   }
}

import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.logging.ILogger;
import mx.logging.Log;
import mx.messaging.MessageAgent;
import mx.messaging.MessageResponder;
import mx.messaging.channels.PollingChannel;
import mx.messaging.events.ChannelFaultEvent;
import mx.messaging.events.MessageEvent;
import mx.messaging.messages.AcknowledgeMessage;
import mx.messaging.messages.CommandMessage;
import mx.messaging.messages.ErrorMessage;
import mx.messaging.messages.IMessage;
import mx.messaging.messages.MessagePerformanceUtils;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

use namespace mx_internal;

class PollCommandMessageResponder extends MessageResponder
{
    
   
   private var _log:ILogger;
   
   private var suppressHandlers:Boolean;
   
   private var resourceManager:IResourceManager;
   
   public function PollCommandMessageResponder(param1:MessageAgent, param2:IMessage, param3:PollingChannel, param4:ILogger)
   {
      resourceManager = ResourceManager.getInstance();
      super(param1,param2,param3);
      _log = param4;
      param3.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,channelPropertyChangeHandler);
   }
   
   private function doPoll(param1:int = 0) : void
   {
      var _loc2_:PollingChannel = PollingChannel(channel);
      if(_loc2_.connected && _loc2_.mx_internal::_shouldPoll)
      {
         if(param1 == 0)
         {
            if(_loc2_.mx_internal::internalPollingInterval == 0)
            {
               _loc2_.poll();
            }
            else if(!_loc2_.mx_internal::timerRunning)
            {
               _loc2_.mx_internal::_timer.delay = _loc2_.mx_internal::_pollingInterval;
               _loc2_.mx_internal::_timer.start();
            }
         }
         else
         {
            _loc2_.mx_internal::_timer.delay = param1;
            _loc2_.mx_internal::_timer.start();
         }
      }
   }
   
   private function channelPropertyChangeHandler(param1:PropertyChangeEvent) : void
   {
      if(param1.property == "connected" && !param1.newValue)
      {
         suppressHandlers = true;
      }
   }
   
   override protected function resultHandler(param1:IMessage) : void
   {
      var messageList:Array = null;
      var message:IMessage = null;
      var mpiutil:MessagePerformanceUtils = null;
      var errMsg:ErrorMessage = null;
      var msg:IMessage = param1;
      var pollingChannel:PollingChannel = channel as PollingChannel;
      if(suppressHandlers)
      {
         if(Log.isDebug())
         {
            _log.debug("\'{0}\' channel ignoring response for poll request preceeding most recent disconnect.\n",channel.id);
         }
         doPoll();
         return;
      }
      if(msg is CommandMessage)
      {
         pollingChannel.mx_internal::pollOutstanding = false;
         if(msg.headers[CommandMessage.NO_OP_POLL_HEADER] == true)
         {
            return;
         }
         if(msg.body != null)
         {
            messageList = msg.body as Array;
            var _loc3_:int = 0;
            var _loc4_:* = messageList;
            for(; §§hasnext(_loc4_,_loc3_); channel.dispatchEvent(MessageEvent.createEvent(MessageEvent.MESSAGE,message)))
            {
               message = §§nextvalue(_loc3_,_loc4_);
               if(Log.isDebug())
               {
                  _log.debug("\'{0}\' channel got message\n{1}\n",channel.id,message.toString());
                  if(channel.mpiEnabled)
                  {
                     try
                     {
                        mpiutil = new MessagePerformanceUtils(message);
                        _log.debug(mpiutil.prettyPrint());
                     }
                     catch(e:Error)
                     {
                        _log.debug("Could not get message performance information for: " + msg.toString());
                     }
                     continue;
                  }
               }
            }
         }
      }
      else
      {
         if(!(msg is AcknowledgeMessage))
         {
            errMsg = new ErrorMessage();
            errMsg.faultDetail = resourceManager.getString("messaging","receivedNull");
            status(errMsg);
            return;
         }
         pollingChannel.mx_internal::pollOutstanding = false;
      }
      if(msg.headers[CommandMessage.POLL_WAIT_HEADER] != null)
      {
         doPoll(msg.headers[CommandMessage.POLL_WAIT_HEADER]);
      }
      else
      {
         doPoll();
      }
   }
   
   override protected function statusHandler(param1:IMessage) : void
   {
      if(suppressHandlers)
      {
         if(Log.isDebug())
         {
            _log.debug("\'{0}\' channel ignoring response for poll request preceeding most recent disconnect.\n",channel.id);
         }
         return;
      }
      var _loc2_:PollingChannel = PollingChannel(channel);
      _loc2_.mx_internal::stopPolling();
      var _loc3_:ErrorMessage = param1 as ErrorMessage;
      var _loc4_:String = _loc3_ != null ? _loc3_.faultDetail : "";
      var _loc5_:ChannelFaultEvent;
      (_loc5_ = ChannelFaultEvent.createEvent(_loc2_,false,"Channel.Polling.Error","error",_loc4_)).rootCause = param1;
      _loc2_.dispatchEvent(_loc5_);
      if(_loc3_ != null && _loc3_.faultCode == "Server.PollNotSupported")
      {
         _loc2_.mx_internal::pollFailed(true);
      }
      else
      {
         _loc2_.mx_internal::pollFailed(false);
      }
   }
}
