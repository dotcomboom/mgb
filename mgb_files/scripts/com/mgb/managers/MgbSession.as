package com.mgb.managers
{
   import com.mgb.data.*;
   import flash.events.*;
   import flash.net.*;
   import mx.collections.*;
   import mx.controls.*;
   import mx.core.Application;
   import mx.events.PropertyChangeEvent;
   
   public class MgbSession implements IEventDispatcher
   {
      
      public static const EVENT_MGB_AUTHENTICATED_USER_SIGNED_IN:String = "mgbAuthUserSignin";
      
      private static const publishedGameProfilePrefixString:String = "PublishedGame--";
      
      public static const EVENT_MGB_PROJECT_CHANGED:String = "mgbChangeProject";
      
      public static const EVENT_MGB_AUTHENTICATED_USER_SIGNED_OUT:String = "mgbAuthUserSignout";
      
      private static var _instance:MgbSession;
      
      public static const EVENT_MGB_LOGIN_LOGOUT:String = "mgbLoginLogout";
       
      
      public var activityPerHeartbeat:int = 0;
      
      private var _userLoggedIn:Boolean = false;
      
      private var _990064589gameStats:GameStats;
      
      private var _activeProject:String = null;
      
      private var _userName:String = null;
      
      private const QUOTA_NOTKNOWN:int = -1;
      
      private var _maxQuotaKB:int = -1;
      
      private var _userLoggedInIsGuest:Boolean = false;
      
      private var _userLoggedInForTheFirstTimeEver:Boolean = false;
      
      private var _overQuota:Boolean = false;
      
      private var _expensiveOps:uint;
      
      private var loginSO:SharedObject;
      
      private var _s3BytesSent:uint;
      
      public var avatarTile:MgbTile;
      
      public var alertOnceAboutKeys:Boolean = false;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _cheapOps:uint;
      
      private var alertOnceTags:Array;
      
      private var _sessionId:uint = 1000;
      
      private var _authenticatedName:String = null;
      
      private var _loginSummary:String = "Not signed in";
      
      private var _usageFriendlyString:String = "";
      
      public var recentTileImportUrl:String = "http://";
      
      public var userBadges:String;
      
      private var _1773622490loginCount:int = 0;
      
      private var _2116593736embeddedMiniUiMode:Boolean = false;
      
      private var _s3BytesReceived:uint;
      
      private var _userLoggedInIsAdmin:Boolean = false;
      
      public function MgbSession(param1:MgbSessionSingletonEnforcer)
      {
         alertOnceTags = new Array();
         avatarTile = new MgbTile();
         _990064589gameStats = new GameStats();
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         if(null == param1)
         {
            throw new Error("Assertion failure - multiple instantiations of MgbSession singleton");
         }
         loginSO = SharedObject.getLocal("loginInfo");
      }
      
      public static function getInstance() : MgbSession
      {
         if(MgbSession._instance == null)
         {
            MgbSession._instance = new MgbSession(new MgbSessionSingletonEnforcer());
         }
         return MgbSession._instance;
      }
      
      [Bindable(event="propertyChange")]
      public function set loginSummary(param1:String) : void
      {
         var _loc2_:Object = this.loginSummary;
         if(_loc2_ !== param1)
         {
            this._2130302973loginSummary = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loginSummary",_loc2_,param1));
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function set overQuota(param1:Boolean) : void
      {
         var _loc2_:Object = this.overQuota;
         if(_loc2_ !== param1)
         {
            this._780077564overQuota = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overQuota",_loc2_,param1));
         }
      }
      
      public function get overQuota() : Boolean
      {
         return _overQuota;
      }
      
      private function set _607796817sessionId(param1:int) : void
      {
         _sessionId = param1;
      }
      
      private function set _997205149usageFriendlyString(param1:String) : void
      {
         _usageFriendlyString = param1;
      }
      
      public function navGotoActorMaker(param1:String = null) : void
      {
         Application.application.mainViewStack.selectedIndex = 3;
         if(param1)
         {
            Application.application.actorMaker.loadActorByName(param1);
         }
      }
      
      private function set _823319356userLoggedInIsGuest(param1:Boolean) : void
      {
         _userLoggedInIsGuest = param1;
      }
      
      private function set _1535175523cheapOps(param1:int) : void
      {
         _cheapOps = param1;
      }
      
      public function alertOnce(param1:String, param2:String, param3:String, param4:Boolean = false) : void
      {
         if(!alertOnceTags[param1])
         {
            alertOnceTags[param1] = new Boolean(true);
            Alert.show(param3,param2);
         }
      }
      
      public function navGotoHome() : void
      {
         Application.application.mainViewStack.selectedIndex = 0;
      }
      
      [Bindable(event="propertyChange")]
      public function get loginCount() : int
      {
         return this._1773622490loginCount;
      }
      
      private function set _780077564overQuota(param1:Boolean) : void
      {
         _overQuota = param1;
      }
      
      public function get s3BytesReceived() : uint
      {
         return _s3BytesReceived;
      }
      
      public function get userLoggedIn() : Boolean
      {
         return _userLoggedIn;
      }
      
      public function navGotoGamePlayer(param1:String = null) : void
      {
         Application.application.mainViewStack.selectedIndex = 5;
         if(param1)
         {
            Application.application.gamePlayer.loadGameByName(param1);
         }
      }
      
      public function get activeProject() : String
      {
         return _activeProject;
      }
      
      private function set _1838310347maxQuotaKB(param1:int) : void
      {
         _maxQuotaKB = param1;
         checkQuota();
      }
      
      public function get userLoggedInIsGuest() : Boolean
      {
         return _userLoggedInIsGuest;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function set usageFriendlyString(param1:String) : void
      {
         var _loc2_:Object = this.usageFriendlyString;
         if(_loc2_ !== param1)
         {
            this._997205149usageFriendlyString = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"usageFriendlyString",_loc2_,param1));
         }
      }
      
      private function set _1952920477s3BytesSent(param1:int) : void
      {
         _s3BytesSent = param1;
      }
      
      private function set _1252719410userLoggedIn(param1:Boolean) : void
      {
         _userLoggedIn = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set storedUsername(param1:String) : void
      {
         var _loc2_:Object = this.storedUsername;
         if(_loc2_ !== param1)
         {
            this._1838661017storedUsername = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"storedUsername",_loc2_,param1));
         }
      }
      
      public function set loginCount(param1:int) : void
      {
         var _loc2_:Object = this._1773622490loginCount;
         if(_loc2_ !== param1)
         {
            this._1773622490loginCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loginCount",_loc2_,param1));
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function checkQuota() : void
      {
         var _loc1_:ProjectList = ProjectList.getInstance();
         overQuota = maxQuotaKB != QUOTA_NOTKNOWN && _loc1_.totalKBUsed > maxQuotaKB;
         usageFriendlyString = maxQuotaKB == QUOTA_NOTKNOWN ? "" : int(_loc1_.totalKBUsed * 100 / maxQuotaKB) + "%";
      }
      
      public function get sessionId() : uint
      {
         return _sessionId;
      }
      
      [Bindable(event="propertyChange")]
      public function set s3BytesReceived(param1:uint) : void
      {
         var _loc2_:Object = this.s3BytesReceived;
         if(_loc2_ !== param1)
         {
            this._998405844s3BytesReceived = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"s3BytesReceived",_loc2_,param1));
         }
      }
      
      public function generatePublishedGamesTableFromProfile(param1:MgbProfile) : ArrayCollection
      {
         var _loc2_:Array = new Array();
         return new ArrayCollection(_loc2_);
      }
      
      public function get authenticatedName() : String
      {
         return _authenticatedName;
      }
      
      [Bindable(event="propertyChange")]
      public function set expensiveOps(param1:uint) : void
      {
         var _loc2_:Object = this.expensiveOps;
         if(_loc2_ !== param1)
         {
            this._1400112807expensiveOps = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"expensiveOps",_loc2_,param1));
         }
      }
      
      public function get storedPassword() : String
      {
         return loginSO.data.password;
      }
      
      public function generatePublishTag(param1:String, param2:String = null) : String
      {
         return publishedGameProfilePrefixString + (!!param2 ? param2 : activeProject) + "," + param1;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function navSendPiece(param1:String, param2:String) : void
      {
         Application.application.mainViewStack.selectedIndex = 6;
         Application.application.messagesTab.addPieceToMessage(param1,userName,activeProject,param2);
      }
      
      [Bindable(event="propertyChange")]
      public function set userLoggedIn(param1:Boolean) : void
      {
         var _loc2_:Object = this.userLoggedIn;
         if(_loc2_ !== param1)
         {
            this._1252719410userLoggedIn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userLoggedIn",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set userLoggedInIsAdmin(param1:Boolean) : void
      {
         var _loc2_:Object = this.userLoggedInIsAdmin;
         if(_loc2_ !== param1)
         {
            this._817279155userLoggedInIsAdmin = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userLoggedInIsAdmin",_loc2_,param1));
         }
      }
      
      public function get s3BytesSent() : uint
      {
         return _s3BytesSent;
      }
      
      [Bindable(event="propertyChange")]
      public function set activeProject(param1:String) : void
      {
         var _loc2_:Object = this.activeProject;
         if(_loc2_ !== param1)
         {
            this._1488744141activeProject = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeProject",_loc2_,param1));
         }
      }
      
      private function set _998405844s3BytesReceived(param1:int) : void
      {
         _s3BytesReceived = param1;
      }
      
      private function set _2130302973loginSummary(param1:String) : void
      {
         _loginSummary = new String(param1);
      }
      
      public function get cheapOps() : uint
      {
         return _cheapOps;
      }
      
      public function createNewProject(param1:String) : Boolean
      {
         return true;
      }
      
      public function set embeddedMiniUiMode(param1:Boolean) : void
      {
         var _loc2_:Object = this._2116593736embeddedMiniUiMode;
         if(_loc2_ !== param1)
         {
            this._2116593736embeddedMiniUiMode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"embeddedMiniUiMode",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set userLoggedInIsGuest(param1:Boolean) : void
      {
         var _loc2_:Object = this.userLoggedInIsGuest;
         if(_loc2_ !== param1)
         {
            this._823319356userLoggedInIsGuest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userLoggedInIsGuest",_loc2_,param1));
         }
      }
      
      private function set _973607074storedPassword(param1:String) : void
      {
         loginSO.data.password = param1;
         loginSO.flush();
      }
      
      [Bindable(event="propertyChange")]
      public function set userLoggedInForTheFirstTimeEver(param1:Boolean) : void
      {
         var _loc2_:Object = this.userLoggedInForTheFirstTimeEver;
         if(_loc2_ !== param1)
         {
            this._496490047userLoggedInForTheFirstTimeEver = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userLoggedInForTheFirstTimeEver",_loc2_,param1));
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      public function navGotoMapMaker(param1:String = null) : void
      {
         Application.application.mainViewStack.selectedIndex = 4;
         if(param1)
         {
            Application.application.mapMaker.map.loadMapByName(userName,activeProject,param1);
         }
      }
      
      private function set _1838661017storedUsername(param1:String) : void
      {
         loginSO.data.username = param1;
         loginSO.flush();
      }
      
      [Bindable(event="propertyChange")]
      public function set maxQuotaKB(param1:int) : void
      {
         var _loc2_:Object = this.maxQuotaKB;
         if(_loc2_ !== param1)
         {
            this._1838310347maxQuotaKB = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxQuotaKB",_loc2_,param1));
         }
      }
      
      public function get storedUsername() : String
      {
         return loginSO.data.username;
      }
      
      public function set gameStats(param1:GameStats) : void
      {
         var _loc2_:Object = this._990064589gameStats;
         if(_loc2_ !== param1)
         {
            this._990064589gameStats = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameStats",_loc2_,param1));
         }
      }
      
      public function get usageFriendlyString() : String
      {
         return _usageFriendlyString;
      }
      
      [Bindable(event="propertyChange")]
      public function set sessionId(param1:uint) : void
      {
         var _loc2_:Object = this.sessionId;
         if(_loc2_ !== param1)
         {
            this._607796817sessionId = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sessionId",_loc2_,param1));
         }
      }
      
      private function set _1400112807expensiveOps(param1:int) : void
      {
         _expensiveOps = param1;
      }
      
      public function navGotoTileMaker(param1:String = null, param2:String = null, param3:String = null) : void
      {
         Application.application.mainViewStack.selectedIndex = 2;
         if(param1)
         {
            Application.application.tileMaker.dpad.loadTileByName(param1,false,param2,param3);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set authenticatedName(param1:String) : void
      {
         var _loc2_:Object = this.authenticatedName;
         if(_loc2_ !== param1)
         {
            this._1871711398authenticatedName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"authenticatedName",_loc2_,param1));
         }
      }
      
      private function set _817279155userLoggedInIsAdmin(param1:Boolean) : void
      {
         _userLoggedInIsAdmin = param1;
      }
      
      public function get userLoggedInIsAdmin() : Boolean
      {
         return _userLoggedInIsAdmin;
      }
      
      public function get expensiveOps() : uint
      {
         return _expensiveOps;
      }
      
      public function get userLoggedInForTheFirstTimeEver() : Boolean
      {
         return _userLoggedInForTheFirstTimeEver;
      }
      
      [Bindable(event="propertyChange")]
      public function set storedPassword(param1:String) : void
      {
         var _loc2_:Object = this.storedPassword;
         if(_loc2_ !== param1)
         {
            this._973607074storedPassword = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"storedPassword",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set s3BytesSent(param1:uint) : void
      {
         var _loc2_:Object = this.s3BytesSent;
         if(_loc2_ !== param1)
         {
            this._1952920477s3BytesSent = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"s3BytesSent",_loc2_,param1));
         }
      }
      
      public function get maxQuotaKB() : int
      {
         return _maxQuotaKB;
      }
      
      [Bindable(event="propertyChange")]
      public function get gameStats() : GameStats
      {
         return this._990064589gameStats;
      }
      
      private function set _496490047userLoggedInForTheFirstTimeEver(param1:Boolean) : void
      {
         _userLoggedInForTheFirstTimeEver = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get embeddedMiniUiMode() : Boolean
      {
         return this._2116593736embeddedMiniUiMode;
      }
      
      private function set _266666762userName(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            _userName = null;
            MgbLogger.getInstance().logClear();
            loginCount = 0;
            ProjectList.getInstance().clear();
            maxQuotaKB = QUOTA_NOTKNOWN;
            userLoggedIn = false;
            userBadges = null;
            userLoggedInIsGuest = false;
            activeProject = null;
            userLoggedInForTheFirstTimeEver = false;
         }
         else
         {
            _userName = new String(param1);
            ProjectList.getInstance().load();
            userLoggedIn = true;
            avatarTile.loadByName(_userName,MgbSystem.defaultProject,MgbSystem.avatarName,null,true);
         }
         loginSummary = !!_userName ? "using " + _userName + "\'s workspace" : "not signed in";
         MgbGlobalEventer.getInstance().dispatchEvent(new Event(EVENT_MGB_LOGIN_LOGOUT));
         ++this.sessionId;
      }
      
      [Bindable(event="propertyChange")]
      public function set cheapOps(param1:uint) : void
      {
         var _loc2_:Object = this.cheapOps;
         if(_loc2_ !== param1)
         {
            this._1535175523cheapOps = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cheapOps",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set userName(param1:String) : void
      {
         var _loc2_:Object = this.userName;
         if(_loc2_ !== param1)
         {
            this._266666762userName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userName",_loc2_,param1));
         }
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      private function set _1488744141activeProject(param1:String) : void
      {
         if(param1 != _activeProject)
         {
            _activeProject = !!param1 ? new String(param1) : param1;
            MgbGlobalEventer.getInstance().dispatchEvent(new Event(EVENT_MGB_PROJECT_CHANGED));
         }
      }
      
      public function get loginSummary() : String
      {
         return _loginSummary;
      }
      
      private function set _1871711398authenticatedName(param1:String) : void
      {
         _authenticatedName = param1;
         userLoggedInIsAdmin = MgbSystem.isAdminName(param1);
         MgbGlobalEventer.getInstance().dispatchEvent(new Event(!!param1 ? EVENT_MGB_AUTHENTICATED_USER_SIGNED_IN : EVENT_MGB_AUTHENTICATED_USER_SIGNED_OUT));
      }
   }
}

class MgbSessionSingletonEnforcer
{
    
   
   public function MgbSessionSingletonEnforcer()
   {
      super();
   }
}
