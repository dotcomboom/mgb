package com.mgb.managers
{
   import com.mgb.utils.*;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.*;
   import mx.controls.*;
   import mx.events.CloseEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.*;
   
   public class MgbLogger implements IEventDispatcher
   {
      
      private static const TYPE_ERROR:String = "Error";
      
      private static const TYPE_GAME_BUG:String = "Bug in Game";
      
      private static const REPEAT_MESSAGE_PREFIX:String = " (Message repeated ";
      
      private static const TYPE_BUG:String = "MGB Bug";
      
      private static const TYPE_INFO:String = "Information";
      
      private static var _instance:MgbLogger;
      
      private static const REPEAT_MESSAGE_SUFFIX:String = " times)";
      
      private static const maxLogLines:int = 99;
       
      
      private var _493639502entriesAC:ArrayCollection;
      
      private var entries:Array;
      
      private var tooManyAlertsMessageShowing:Boolean = false;
      
      private var pendingBugTransmissions:int = 0;
      
      private var alertOpenCount:int = 0;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function MgbLogger(param1:MgbLoggerSingletonEnforcer)
      {
         entries = new Array();
         _493639502entriesAC = new ArrayCollection(entries);
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         if(null == param1)
         {
            throw new Error("Assertion failure - multiple instantiations of MgbLogger singleton");
         }
      }
      
      public static function getInstance() : MgbLogger
      {
         if(MgbLogger._instance == null)
         {
            MgbLogger._instance = new MgbLogger(new MgbLoggerSingletonEnforcer());
         }
         return MgbLogger._instance;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get entriesAC() : ArrayCollection
      {
         return this._493639502entriesAC;
      }
      
      private function log(param1:String, param2:String, param3:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         if(entries.length > 0)
         {
            _loc4_ = String(entries[0].message);
            if(entries[0].repeat > 0)
            {
               _loc4_ = _loc4_.substr(0,_loc4_.indexOf(REPEAT_MESSAGE_PREFIX));
            }
            if(param1 == _loc4_)
            {
               _loc5_ = entries[0].repeat + 1;
            }
         }
         if(_loc5_ > 0)
         {
            entries[0].repeat = _loc5_;
            entries[0].message = param1 + REPEAT_MESSAGE_PREFIX + int(_loc5_ + 1) + REPEAT_MESSAGE_SUFFIX;
         }
         else
         {
            entriesAC.addItemAt({
               "time":TimeUtils.humanTimeDateNow(),
               "type":param2,
               "message":param1,
               "repeat":0
            },0);
            logTrim();
         }
         entriesAC.refresh();
         if(param3)
         {
            if(alertOpenCount > 2)
            {
               if(tooManyAlertsMessageShowing == false)
               {
                  Alert.show("See the \'Errors\' tab for more error details","Many error messages...",4,null,alertTooManyCloseHandler);
                  tooManyAlertsMessageShowing = true;
               }
            }
            if(tooManyAlertsMessageShowing == false)
            {
               Alert.show(param1,param2,4,null,alertCloseHandler);
               ++alertOpenCount;
            }
         }
      }
      
      private function logTrim(param1:int = 99) : void
      {
         while(entries.length > param1)
         {
            entriesAC.removeItemAt(entries.length - 1);
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function set entriesAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._493639502entriesAC;
         if(_loc2_ !== param1)
         {
            this._493639502entriesAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"entriesAC",_loc2_,param1));
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      public function logInfo(param1:String, param2:Boolean = false) : void
      {
         log(param1,TYPE_INFO,param2);
         logDebug(param1,TYPE_INFO);
      }
      
      private function transmitBugInfoToLogServer(param1:String) : void
      {
         var _loc2_:HTTPService = null;
         var _loc3_:Object = null;
         if(pendingBugTransmissions <= 4)
         {
            _loc2_ = new HTTPService();
            _loc2_.url = MgbSystem.logBugUrl;
            _loc2_.useProxy = false;
            _loc2_.method = "POST";
            _loc2_.addEventListener("result",httpTransmitBugResult);
            _loc2_.addEventListener("fault",httpFault);
            _loc2_.contentType = "application/x-www-form-urlencoded";
            _loc3_ = new Object();
            _loc3_.user = MgbSession.getInstance().userName;
            _loc3_.message = param1;
            _loc3_.clientversion = MgbSystem.version;
            _loc2_.send(_loc3_);
            ++pendingBugTransmissions;
         }
      }
      
      public function logError(param1:String, param2:Boolean = false) : void
      {
         log(param1,TYPE_ERROR,param2);
         logDebug(param1,TYPE_ERROR);
      }
      
      public function logClear() : void
      {
         logTrim(0);
      }
      
      public function logException(param1:String, param2:Error, param3:Boolean = true) : void
      {
         var _loc4_:String = "[" + TimeUtils.humanTimeDateNow() + "] Caught unhandled " + param2.name + " exception (#" + param2.errorID + ") in " + param1 + ": " + param2.message + ";  " + param2.getStackTrace();
         logBug(_loc4_);
         if(param3)
         {
            Alert.show(_loc4_);
         }
      }
      
      private function alertCloseHandler(param1:CloseEvent) : void
      {
         --alertOpenCount;
      }
      
      public function logDebug(param1:String, param2:String = "Trace") : void
      {
         trace("[Debug" + param2 + " " + TimeUtils.humanTimeDateNow() + "] " + param1);
      }
      
      private function alertTooManyCloseHandler(param1:CloseEvent) : void
      {
         tooManyAlertsMessageShowing = false;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      private function httpTransmitBugResult(param1:ResultEvent) : void
      {
         logDebug("Bug Logged to LogServer OK");
         --pendingBugTransmissions;
      }
      
      private function httpFault(param1:FaultEvent) : void
      {
         logDebug("Failed to log bug with LogServer");
         --pendingBugTransmissions;
      }
      
      public function logBug(param1:String) : void
      {
         log("MGB has detected a bug in itself: <<" + param1.slice(0,65) + "...>>; This will be automatically reported to the developers and scheduled to be fixed in a later release",TYPE_BUG,false);
         logDebug(param1,TYPE_BUG);
         transmitBugInfoToLogServer(param1);
      }
      
      public function logGameBug(param1:String, param2:Boolean = false) : void
      {
         log(param1,TYPE_GAME_BUG,param2);
         logDebug(param1,TYPE_GAME_BUG);
      }
   }
}

class MgbLoggerSingletonEnforcer
{
    
   
   public function MgbLoggerSingletonEnforcer()
   {
      super();
   }
}
