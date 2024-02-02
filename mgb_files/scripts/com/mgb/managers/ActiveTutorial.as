package com.mgb.managers
{
   import com.mgb.controls.*;
   import com.mgb.data.*;
   import com.mgb.utils.*;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.*;
   import mx.rpc.http.*;
   
   public class ActiveTutorial implements IEventDispatcher
   {
      
      private static const TUTORIALCOMPLETE_PROFILE_PREFIX:String = "TutDone.";
      
      private static var _instance:ActiveTutorial;
      
      private static const TUTORIAL_NAME_PREFIX:String = "System Tutorial ";
      
      public static const NEXT_BUTTON_TAG:String = "(nextButton)";
      
      public static const NEXT_OR_SKIP_BUTTON_TAG:String = "(nextOrSkipButton)";
       
      
      private var _361881170activeTutorialStepHWM:int = 0;
      
      private var _1023343244activeTutorialEnableNextButton:Boolean = false;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _1659695490activeTutorialWantedPage:String;
      
      private var _2009421692activeTutorial:MgbTutorial;
      
      private var _384511360activeTutorialEnableBackButton:Boolean = false;
      
      private var _2008791181activeTutorialEnableStartButton:Boolean = false;
      
      private var _1841415144activeTutorialEnableSkipButton:Boolean = false;
      
      private var mgbLogger:MgbLogger;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _184194537activeTutorialStepCurrent:int = 0;
      
      private var _571637713activeTutorialText:String = "Loading tutorials...";
      
      private var _2012465270activeTutorialNextButtonText:String = "Next";
      
      public function ActiveTutorial(param1:ActiveTutorialSingletonEnforcer)
      {
         mgbLogger = MgbLogger.getInstance();
         _1217010542mgbSession = MgbSession.getInstance();
         _2009421692activeTutorial = new MgbTutorial();
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         if(null == param1)
         {
            throw new Error("Assertion failure - multiple instantiations of ActiveTutorial singleton");
         }
         MgbCaches.getInstance().tutorialsPL.addEventListener(PieceList.EVENT_LOAD_COMPLETE,tutorialListUpdatedHandler);
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_LOGIN_LOGOUT,mgbLoginLogout);
      }
      
      public static function getInstance() : ActiveTutorial
      {
         if(ActiveTutorial._instance == null)
         {
            ActiveTutorial._instance = new ActiveTutorial(new ActiveTutorialSingletonEnforcer());
         }
         return ActiveTutorial._instance;
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialEnableBackButton() : Boolean
      {
         return this._384511360activeTutorialEnableBackButton;
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialWantedPage() : String
      {
         return this._1659695490activeTutorialWantedPage;
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorial() : MgbTutorial
      {
         return this._2009421692activeTutorial;
      }
      
      private function recordCurrentTutorialCompleted() : void
      {
         setCompletionDate(this.activeTutorial.name);
         Application.application.updateUserProfile("tutorialLevelCompleted",this.activeTutorial.name);
         mgbLogger.logInfo("Tutorial \'" + this.activeTutorial.name + "\' completed");
      }
      
      public function set activeTutorialEnableBackButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._384511360activeTutorialEnableBackButton;
         if(_loc2_ !== param1)
         {
            this._384511360activeTutorialEnableBackButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialEnableBackButton",_loc2_,param1));
         }
      }
      
      public function awardTutorialBadge() : void
      {
         var _loc1_:HTTPService = new HTTPService();
         _loc1_.url = MgbSystem.idServerUrl + "/user/award_tutorial_badge";
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.addEventListener(ResultEvent.RESULT,awardTutorialBadgeResultHandler);
         _loc1_.addEventListener(FaultEvent.FAULT,faultHandler);
         var _loc2_:Object = new Object();
         _loc2_.login = mgbSession.userName;
         _loc1_.send(_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialEnableStartButton() : Boolean
      {
         return this._2008791181activeTutorialEnableStartButton;
      }
      
      public function set activeTutorial(param1:MgbTutorial) : void
      {
         var _loc2_:Object = this._2009421692activeTutorial;
         if(_loc2_ !== param1)
         {
            this._2009421692activeTutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorial",_loc2_,param1));
         }
      }
      
      public function determineTutorialPresentation() : void
      {
         activeTutorialEnableBackButton = activeTutorialStepCurrent > 0;
         activeTutorialEnableSkipButton = activeTutorialStepCurrent == 0 && activeTutorial.tAC != null && NEXT_OR_SKIP_BUTTON_TAG == activeTutorial.tAC[activeTutorialStepCurrent].completionTag;
         activeTutorialEnableNextButton = activeTutorialStepCurrent < activeTutorialStepHWM || Boolean(activeTutorial.tAC) && ("" == activeTutorial.tAC[activeTutorialStepCurrent].completionTag || NEXT_BUTTON_TAG == activeTutorial.tAC[activeTutorialStepCurrent].completionTag || NEXT_OR_SKIP_BUTTON_TAG == activeTutorial.tAC[activeTutorialStepCurrent].completionTag);
         if(Boolean(activeTutorial.tAC) && activeTutorialStepCurrent == activeTutorial.tAC.length - 1)
         {
            activeTutorialNextButtonText = "Done";
         }
         else
         {
            activeTutorialNextButtonText = "Next";
         }
         activeTutorialText = !!activeTutorial.tAC ? String(activeTutorial.tAC[activeTutorialStepCurrent].message) : "";
         activeTutorialEnableStartButton = false;
         tutorialCheckPage();
      }
      
      public function tutorialTagCheck(param1:String) : void
      {
         if(activeTutorial.tAC && activeTutorialStepCurrent < activeTutorial.tAC.length && activeTutorial.tAC[activeTutorialStepCurrent].completionTag == param1)
         {
            tutorialStep(1);
         }
         MgbSession.getInstance().activityPerHeartbeat = MgbSession.getInstance().activityPerHeartbeat + 10;
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      public function set activeTutorialEnableStartButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._2008791181activeTutorialEnableStartButton;
         if(_loc2_ !== param1)
         {
            this._2008791181activeTutorialEnableStartButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialEnableStartButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialEnableNextButton() : Boolean
      {
         return this._1023343244activeTutorialEnableNextButton;
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialEnableSkipButton() : Boolean
      {
         return this._1841415144activeTutorialEnableSkipButton;
      }
      
      public function getCompletionDate(param1:String) : String
      {
         return Application.application.getUserProfile(TUTORIALCOMPLETE_PROFILE_PREFIX + param1);
      }
      
      public function set activeTutorialText(param1:String) : void
      {
         var _loc2_:Object = this._571637713activeTutorialText;
         if(_loc2_ !== param1)
         {
            this._571637713activeTutorialText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialText",_loc2_,param1));
         }
      }
      
      private function checkTutorialBadgeAward() : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:ActiveTutorial = ActiveTutorial.getInstance();
         var _loc4_:PieceList;
         if((_loc4_ = MgbCaches.getInstance().tutorialsPL).ready())
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.piecesAC.length)
            {
               if((_loc6_ = String(_loc4_.piecesAC[_loc5_].name)).charAt(0) == "0")
               {
                  _loc2_++;
                  if((Boolean(_loc7_ = _loc3_.getCompletionDate(_loc6_))) && _loc7_.length > 0)
                  {
                     _loc1_++;
                  }
               }
               _loc5_++;
            }
            if(_loc1_ == _loc2_ && Boolean(mgbSession.userBadges))
            {
               if(Badge.utilHasBadge(mgbSession.userBadges,Badge.COMPLETED_ALL_TUTORIALS) == false)
               {
                  awardTutorialBadge();
               }
            }
         }
      }
      
      public function mgbLoginLogout(param1:Event) : void
      {
         clearTutorial();
      }
      
      private function setCompletionDate(param1:String) : void
      {
         var _loc2_:String = String(TimeUtils.humanTimeDateNow());
         Application.application.updateUserProfile(TUTORIALCOMPLETE_PROFILE_PREFIX + param1,_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialStepHWM() : int
      {
         return this._361881170activeTutorialStepHWM;
      }
      
      public function set activeTutorialWantedPage(param1:String) : void
      {
         var _loc2_:Object = this._1659695490activeTutorialWantedPage;
         if(_loc2_ !== param1)
         {
            this._1659695490activeTutorialWantedPage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialWantedPage",_loc2_,param1));
         }
      }
      
      public function set activeTutorialEnableSkipButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1841415144activeTutorialEnableSkipButton;
         if(_loc2_ !== param1)
         {
            this._1841415144activeTutorialEnableSkipButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialEnableSkipButton",_loc2_,param1));
         }
      }
      
      public function set activeTutorialEnableNextButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1023343244activeTutorialEnableNextButton;
         if(_loc2_ !== param1)
         {
            this._1023343244activeTutorialEnableNextButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialEnableNextButton",_loc2_,param1));
         }
      }
      
      private function awardTutorialBadgeResultHandler(param1:Event) : void
      {
         mgbSession.userBadges = mgbSession.userBadges + "," + Badge.COMPLETED_ALL_TUTORIALS;
         mgbLogger.logInfo("Congratulations. Since you have completed all tutorials, you will be awarded a new badge next time you visit!",true);
      }
      
      private function loadedTutorialHandler(param1:ResultEvent, param2:Boolean = false) : void
      {
         if(param1.result.hasOwnProperty("mgb_error") && 0 != param1.result.mgb_error)
         {
            mgbLogger.logInfo("Can\'t load tutorial - does not exist");
            activeTutorialEnableStartButton = false;
         }
         else
         {
            activeTutorialEnableStartButton = true;
            if(param2)
            {
               determineTutorialPresentation();
            }
         }
      }
      
      private function faultHandler(param1:FaultEvent) : void
      {
         mgbLogger.logError("My Game Builder seems to be offline. Try again later. Error message was \'" + param1.fault.faultString + "\'",true);
      }
      
      public function tutorialStep(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:Object = null;
         switch(param1)
         {
            case -1:
               if(activeTutorialStepCurrent > 0)
               {
                  --activeTutorialStepCurrent;
               }
               break;
            case 0:
               activeTutorialStepCurrent = 0;
               break;
            case 1:
               if(activeTutorialStepCurrent == activeTutorialStepHWM)
               {
                  if(activeTutorialStepCurrent < activeTutorial.tAC.length && Boolean(activeTutorial.tAC[activeTutorialStepCurrent].rewardResult))
                  {
                     _loc2_ = String(activeTutorial.tAC[activeTutorialStepCurrent].rewardResult);
                     trace("reward: " + _loc2_);
                     _loc3_ = CommandEngine.parse(_loc2_);
                     if(_loc3_.command == "raiseSkillLevel")
                     {
                        Application.application.raiseToolSkillLevel(_loc3_.skillname,int(_loc3_.newMinLevel));
                     }
                  }
               }
               ++activeTutorialStepCurrent;
               if(activeTutorialStepCurrent > activeTutorialStepHWM)
               {
                  activeTutorialStepHWM = activeTutorialStepCurrent;
               }
               if(activeTutorialStepCurrent >= activeTutorial.tAC.length)
               {
                  recordCurrentTutorialCompleted();
                  clearTutorial();
                  loadTutorial();
               }
               break;
            default:
               throw new Error("Invalid step " + param1);
         }
         determineTutorialPresentation();
      }
      
      private function clearTutorial() : void
      {
         activeTutorialStepCurrent = 0;
         activeTutorialStepHWM = 0;
         activeTutorialText = "";
         activeTutorialEnableBackButton = false;
         activeTutorialEnableNextButton = false;
         activeTutorial.tAC = null;
         activeTutorialWantedPage = null;
      }
      
      private function loadedTutorialHandlerWithAutoStart(param1:ResultEvent) : void
      {
         loadedTutorialHandler(param1,true);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialText() : String
      {
         return this._571637713activeTutorialText;
      }
      
      private function tutorialListUpdatedHandler(param1:Event) : void
      {
         var _loc2_:PieceList = MgbCaches.getInstance().tutorialsPL;
         if(!_loc2_.ready())
         {
            mgbLogger.logBug("tutorialListUpdatedHandler() called but list was not ready()");
            return;
         }
         if(activeTutorialEnableStartButton == false && activeTutorialStepCurrent == 0)
         {
            loadTutorial();
         }
         if(mgbSession.authenticatedName == mgbSession.userName && mgbSession.userName != null)
         {
            checkTutorialBadgeAward();
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function set activeTutorialStepCurrent(param1:int) : void
      {
         var _loc2_:Object = this._184194537activeTutorialStepCurrent;
         if(_loc2_ !== param1)
         {
            this._184194537activeTutorialStepCurrent = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialStepCurrent",_loc2_,param1));
         }
      }
      
      public function set activeTutorialStepHWM(param1:int) : void
      {
         var _loc2_:Object = this._361881170activeTutorialStepHWM;
         if(_loc2_ !== param1)
         {
            this._361881170activeTutorialStepHWM = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialStepHWM",_loc2_,param1));
         }
      }
      
      private function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      public function loadTutorial(param1:String = null, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc5_:PieceList = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc4_:String;
         if((_loc4_ = !!param1 ? param1 : String(Application.application.getUserProfile("tutorialLevelCompleted"))) == null && param2 == false)
         {
            mgbLogger.logBug("Can\'t load tutorial after \'null\'");
            return;
         }
         if(param2)
         {
            if(!(_loc5_ = MgbCaches.getInstance().tutorialsPL).ready())
            {
               return;
            }
            _loc6_ = Number(NaN);
            if(_loc4_ == null || _loc4_ == MgbSystem.newUserFirstTutorial)
            {
               if(0 == _loc5_.piecesAC.length)
               {
                  mgbLogger.logBug("Can\'t load first tutorial since there are no tutorials");
                  return;
               }
               _loc4_ = String(_loc5_.piecesAC[0].name);
            }
            else
            {
               _loc7_ = 0;
               while(_loc7_ < _loc5_.piecesAC.length && Boolean(isNaN(_loc6_)))
               {
                  if(_loc5_.piecesAC[_loc7_].name == _loc4_ || _loc4_ == "")
                  {
                     _loc6_ = _loc7_;
                  }
                  _loc7_++;
               }
               if(isNaN(_loc6_))
               {
                  mgbLogger.logInfo("Can\'t load tutorial after \'" + _loc4_ + "\' since that tutorial does not exist");
                  return;
               }
               if(_loc6_ == _loc5_.piecesAC.length - 1)
               {
                  mgbLogger.logInfo("Can\'t load tutorial after \'" + _loc4_ + "\' since that was the last tutorial");
                  return;
               }
               _loc4_ = String(_loc5_.piecesAC[_loc6_ + 1].name);
            }
         }
         clearTutorial();
         activeTutorial.onErrorIssueAlert = false;
         activeTutorial.loadByName(MgbSystem.reservedSystemUserName,MgbSystem.reservedSystemProjectName,_loc4_,param3 ? loadedTutorialHandlerWithAutoStart : loadedTutorialHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialStepCurrent() : int
      {
         return this._184194537activeTutorialStepCurrent;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function set activeTutorialNextButtonText(param1:String) : void
      {
         var _loc2_:Object = this._2012465270activeTutorialNextButtonText;
         if(_loc2_ !== param1)
         {
            this._2012465270activeTutorialNextButtonText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorialNextButtonText",_loc2_,param1));
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get activeTutorialNextButtonText() : String
      {
         return this._2012465270activeTutorialNextButtonText;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      private function tutorialCheckPage() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         if(Boolean(activeTutorial.tAC) && activeTutorialStepCurrent < activeTutorial.tAC.length)
         {
            _loc1_ = String(activeTutorial.tAC[activeTutorialStepCurrent].completionTag);
            _loc2_ = _loc1_.slice(0,_loc1_.search("_"));
            if(_loc2_ != "" && _loc1_ != NEXT_BUTTON_TAG && _loc1_ != NEXT_OR_SKIP_BUTTON_TAG)
            {
               activeTutorialWantedPage = _loc2_;
            }
            else
            {
               activeTutorialWantedPage = null;
            }
         }
         else
         {
            activeTutorialWantedPage = null;
         }
      }
      
      public function tutorialSkip() : void
      {
         if(activeTutorialEnableSkipButton = activeTutorialStepCurrent == 0 && NEXT_OR_SKIP_BUTTON_TAG == activeTutorial.tAC[activeTutorialStepCurrent].completionTag)
         {
            mgbLogger.logInfo("Skipping tutorial.. You can come back to this later using the Tutorial Selector on the \'Me\' Screen");
            clearTutorial();
            loadTutorial();
         }
         else
         {
            mgbLogger.logBug("Unexpected tutorialSkip() attempt");
         }
      }
   }
}

class ActiveTutorialSingletonEnforcer
{
    
   
   public function ActiveTutorialSingletonEnforcer()
   {
      super();
   }
}
