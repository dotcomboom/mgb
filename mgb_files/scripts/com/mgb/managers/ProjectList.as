package com.mgb.managers
{
   import com.mgb.data.*;
   import com.mgb.utils.*;
   import flash.events.*;
   import flash.utils.*;
   import mx.collections.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.ResultEvent;
   
   public class ProjectList implements IEventDispatcher
   {
      
      private static var _instance:ProjectList;
      
      private static const state_LISTREADY:int = 1;
      
      private static const state_LOADINGLIST:int = 2;
       
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _1754366959projectNamesAC:ArrayCollection;
      
      private var state:int = 1;
      
      private var _totalProjectCount:int = 0;
      
      private var _lastCheckedTime:String = "(not yet)";
      
      private var projectNames:Array;
      
      private var alarmTimer:Timer = null;
      
      private var _totalKBUsed:int = 0;
      
      private var mgbLogger:MgbLogger;
      
      public function ProjectList(param1:ProjectListSingletonEnforcer)
      {
         mgbLogger = MgbLogger.getInstance();
         projectNames = new Array();
         _1754366959projectNamesAC = new ArrayCollection(projectNames);
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         if(null == param1)
         {
            throw new Error("Assertion failure - multiple instantiations of ProjectList singleton");
         }
         MgbGlobalEventer.getInstance().addEventListener(PieceChangedEvent.CHANGE,processPieceChange);
      }
      
      public static function getInstance() : ProjectList
      {
         if(ProjectList._instance == null)
         {
            ProjectList._instance = new ProjectList(new ProjectListSingletonEnforcer());
         }
         return ProjectList._instance;
      }
      
      private function cancelLoad() : void
      {
         throw new Error("need to code the cancel handler for ProjectList");
      }
      
      private function cancelDeferredReload() : void
      {
         if(alarmTimer != null)
         {
            alarmTimer.reset();
            alarmTimer = null;
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function get totalKBUsed() : int
      {
         return _totalKBUsed;
      }
      
      private function onAlarm(param1:TimerEvent) : void
      {
         mgbLogger.logDebug("Wakeup - ProjectList reload " + int(param1.target.delay / 1000) + "s timer triggered");
         cancelDeferredReload();
         load();
      }
      
      public function clear() : void
      {
         projectNamesAC.removeAll();
         projectNamesAC.refresh();
         cancelDeferredReload();
         lastCheckedTime = "(not yet)";
         totalProjectCount = 0;
         totalKBUsed = 0;
      }
      
      private function requestDeferredReload(param1:String = null, param2:String = null, param3:Number = NaN) : void
      {
         var _loc4_:Number = NaN;
         if(isNaN(param3))
         {
            param3 = 5;
            if(param1 != null && param2 == null)
            {
               param3 = 3;
            }
            else if(param1 != null && param2 != null)
            {
               param3 = 1;
            }
            else
            {
               mgbLogger.logBug("Bug when calling requestDeferredReload() - multiple projects but just type=" + param2);
            }
            param3 = 5;
         }
         if(alarmTimer == null)
         {
            _loc4_ = Math.random() * 0.4 + 0.8;
            alarmTimer = new Timer(param3 * 60 * 1000 * _loc4_);
            alarmTimer.addEventListener(TimerEvent.TIMER,onAlarm);
            alarmTimer.start();
            mgbLogger.logDebug("scheduling ProjectList reload - delay = " + int(alarmTimer.delay / 1000) + "s");
         }
      }
      
      private function processPieceChange(param1:PieceChangedEvent) : void
      {
         if(param1.wasPieceSavedOrDeleted())
         {
            requestDeferredReload(param1.pieceProject,param1.pieceType);
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      private function doLoad(param1:String = null) : void
      {
         var _loc2_:S3Service = new S3Service();
         var _loc3_:Object = new Object();
         _loc3_.overrideUsername = MgbSession.getInstance().userName;
         _loc3_.overrideProject = null;
         if(param1)
         {
            _loc3_.marker = param1;
         }
         _loc2_.request("listprojects",s3ListResult,_loc3_);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function get totalProjectCount() : int
      {
         return _totalProjectCount;
      }
      
      public function get lastCheckedTime() : String
      {
         return _lastCheckedTime;
      }
      
      [Bindable(event="propertyChange")]
      public function get projectNamesAC() : ArrayCollection
      {
         return this._1754366959projectNamesAC;
      }
      
      private function updateProjectsList(param1:Array) : void
      {
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         for(_loc4_ in param1)
         {
            if(_loc4_ != "-")
            {
               _loc5_ = false;
               if(projectNamesAC.length > 0)
               {
                  _loc6_ = 0;
                  while(_loc6_ < projectNamesAC.length)
                  {
                     if(projectNamesAC.getItemAt(_loc6_).project == _loc4_)
                     {
                        _loc7_ = projectNamesAC.getItemAt(_loc6_);
                        _loc7_.sizeBytes += int(param1[_loc4_]);
                        _loc7_.simpleSizeKB += Number(param1[_loc4_] >> 10);
                        _loc5_ = true;
                     }
                     _loc6_++;
                  }
               }
               if(!_loc5_)
               {
                  projectNamesAC.addItem({
                     "project":_loc4_,
                     "sizeBytes":int(param1[_loc4_]),
                     "simpleSizeKB":Number(param1[_loc4_] >> 10)
                  });
               }
               _loc2_ += int(param1[_loc4_]);
               _loc3_++;
            }
         }
         projectNamesAC.refresh();
         totalKBUsed += _loc2_ / 1024;
         totalProjectCount += _loc3_;
         lastCheckedTime = TimeUtils.humanTimeDateNow(true);
         MgbSession.getInstance().checkQuota();
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function load() : void
      {
         if(state != state_LOADINGLIST)
         {
            state = state_LOADINGLIST;
            projectNamesAC.removeAll();
            doLoad();
            totalProjectCount = 0;
            totalKBUsed = 0;
            cancelDeferredReload();
         }
      }
      
      public function set projectNamesAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1754366959projectNamesAC;
         if(_loc2_ !== param1)
         {
            this._1754366959projectNamesAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectNamesAC",_loc2_,param1));
         }
      }
      
      private function s3ListResult(param1:ResultEvent) : void
      {
         if(param1.result.hasOwnProperty("mgb_error") && 0 != param1.result.mgb_error)
         {
            mgbLogger.logError("Could not list projects (error #" + param1.result.mgb_error + ")",false);
            state = state_LISTREADY;
         }
         else
         {
            updateProjectsList(param1.result.projectsList);
            if(param1.result.truncated)
            {
               trace("Loading projectslist - continuation from key: " + param1.result.lastKey);
               doLoad(MgbSession.getInstance().userName + "/" + param1.result.lastKey);
            }
            else
            {
               state = state_LISTREADY;
            }
         }
      }
      
      private function set _1011597832totalKBUsed(param1:int) : void
      {
         _totalKBUsed = param1;
      }
      
      private function set _839440738lastCheckedTime(param1:String) : void
      {
         _lastCheckedTime = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set totalKBUsed(param1:int) : void
      {
         var _loc2_:Object = this.totalKBUsed;
         if(_loc2_ !== param1)
         {
            this._1011597832totalKBUsed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"totalKBUsed",_loc2_,param1));
         }
      }
      
      private function set _2026666278totalProjectCount(param1:int) : void
      {
         _totalProjectCount = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set totalProjectCount(param1:int) : void
      {
         var _loc2_:Object = this.totalProjectCount;
         if(_loc2_ !== param1)
         {
            this._2026666278totalProjectCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"totalProjectCount",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set lastCheckedTime(param1:String) : void
      {
         var _loc2_:Object = this.lastCheckedTime;
         if(_loc2_ !== param1)
         {
            this._839440738lastCheckedTime = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lastCheckedTime",_loc2_,param1));
         }
      }
   }
}

class ProjectListSingletonEnforcer
{
    
   
   public function ProjectListSingletonEnforcer()
   {
      super();
   }
}
