package
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.containers.ViewStack;
   import mx.controls.*;
   import mx.core.*;
   import mx.effects.WipeDown;
   import mx.effects.WipeUp;
   import mx.effects.easing.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.rpc.events.ResultEvent;
   import mx.states.AddChild;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import mx.utils.*;
   
   use namespace mx_internal;
   
   public class MGB extends Application implements IBindingClient
   {
      
      mx_internal static var _MGB_StylesInit_done:Boolean = false;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _533960051gamePlayer:GamePlayerControl;
      
      public var _MGB_Button1:Button;
      
      private var _544628700mainBackgroundColor:SelectBackgroundColor;
      
      private var save_ticker:Timer;
      
      private var _embed__font_geosanslight_medium_normal_1505705259:Class;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _2066618617serviceStatus:ServiceStatusControl;
      
      private var _868027850tileMaker:TileMakerControl;
      
      private var _embed__font_ellianarellespath_medium_normal_1698987184:Class;
      
      private var _1357246641actorMaker:ActorMakerControl;
      
      private var _embed__font_illegaledding_medium_normal_1320555572:Class;
      
      private var _872205655messagesTab:MessagesTab;
      
      private var _475505495mainTabBar:ToggleButtonBar;
      
      private var _161881160mapMaker:MapMakerControl;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _3366282myWU:WipeUp;
      
      private var _608462135tutorialClue:TextArea;
      
      public var userProfile:MgbProfile;
      
      private var _embed__font_bradybunch_medium_normal_2093840927:Class;
      
      private var _1260658248mgbLogger:MgbLogger;
      
      private var browserManager:IBrowserManager;
      
      private var _embed__font_argorpriht_medium_normal_1814301884:Class;
      
      private var _embed__font_abscissa_bold_normal_984225449:Class;
      
      private var _3366265myWD:WipeDown;
      
      mx_internal var _watchers:Array;
      
      private var _2009421692activeTutorial:ActiveTutorial;
      
      public var _MGB_NewsLink1:NewsLink;
      
      private var _1311427152accountManagement:AccountManagement;
      
      private var _1691355014tutorialMaker:TutorialMakerControl;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1703153366mainViewStack:ViewStack;
      
      private var userProfileReady:Boolean = false;
      
      private var _500406371embeddedGamePlayer:GamePlayerControl;
      
      private var _embed__font_abscissa_medium_normal_989989060:Class;
      
      mx_internal var _bindings:Array;
      
      private var _embed__font_titlefont_medium_normal_407081814:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _938957637projectsTab:ProjectsTab;
      
      public function MGB()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Application,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":SelectBackgroundColor,
                  "id":"mainBackgroundColor",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":0,
                        "y":0
                     };
                  }
               })]};
            }
         });
         userProfile = new MgbProfile();
         _1217010542mgbSession = MgbSession.getInstance();
         _2009421692activeTutorial = ActiveTutorial.getInstance();
         _1260658248mgbLogger = MgbLogger.getInstance();
         save_ticker = new Timer(6 * 1000,1);
         _embed__font_abscissa_bold_normal_984225449 = MGB__embed__font_abscissa_bold_normal_984225449;
         _embed__font_abscissa_medium_normal_989989060 = MGB__embed__font_abscissa_medium_normal_989989060;
         _embed__font_argorpriht_medium_normal_1814301884 = MGB__embed__font_argorpriht_medium_normal_1814301884;
         _embed__font_bradybunch_medium_normal_2093840927 = MGB__embed__font_bradybunch_medium_normal_2093840927;
         _embed__font_ellianarellespath_medium_normal_1698987184 = MGB__embed__font_ellianarellespath_medium_normal_1698987184;
         _embed__font_geosanslight_medium_normal_1505705259 = MGB__embed__font_geosanslight_medium_normal_1505705259;
         _embed__font_illegaledding_medium_normal_1320555572 = MGB__embed__font_illegaledding_medium_normal_1320555572;
         _embed__font_titlefont_medium_normal_407081814 = MGB__embed__font_titlefont_medium_normal_407081814;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         mx_internal::_MGB_StylesInit();
         this.layout = "absolute";
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.minWidth = 800;
         this.minHeight = 600;
         this.currentState = "";
         this.states = [_MGB_State1_c(),_MGB_State2_c()];
         _MGB_WipeDown1_i();
         _MGB_WipeUp1_i();
         this.addEventListener("initialize",___MGB_Application1_initialize);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MGB._watcherSetupUtil = param1;
      }
      
      private function _MGB_AccountManagement1_i() : AccountManagement
      {
         var _loc1_:AccountManagement = new AccountManagement();
         accountManagement = _loc1_;
         _loc1_.label = "HOME";
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.setStyle("backgroundColor",48059);
         _loc1_.id = "accountManagement";
         BindingManager.executeBindings(this,"accountManagement",accountManagement);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MGB_AddChild4_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MGB_Button1_i);
         return _loc1_;
      }
      
      mx_internal function _MGB_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         if(mx_internal::_MGB_StylesInit_done)
         {
            return;
         }
         mx_internal::_MGB_StylesInit_done = true;
         style = StyleManager.getStyleDeclaration("HeaderComponent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("HeaderComponent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontFamily = "titlefont";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".smallFont");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".smallFont",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontFamily = "abscissa";
               this.fontSize = 10;
            };
         }
         style = StyleManager.getStyleDeclaration(".headingBarStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".headingBarStyle",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderColor = 0;
               this.backgroundColor = 12632256;
               this.color = 1052688;
               this.separatorColor = 16711680;
               this.selectionColor = 16711680;
               this.disabledColor = 11579568;
            };
         }
         style = StyleManager.getStyleDeclaration(".denseTable");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".denseTable",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".gameStatus");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".gameStatus",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontFamily = "abscissa";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".headerToggleButtonBar");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".headerToggleButtonBar",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lastButtonStyleName = "mytoggleButtonBarButtonStyle";
               this.selectedButtonTextStyleName = "mytoggleButtonBarSelectedButtonStyle";
               this.buttonStyleName = "mytoggleButtonBarButtonStyle";
               this.firstButtonStyleName = "mytoggleButtonBarButtonStyle";
               this.backgroundDisabledColor = 16711680;
               this.textIndent = 0;
               this.horizontalGap = 4;
            };
         }
         style = StyleManager.getStyleDeclaration(".standoutLarge");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".standoutLarge",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration("Button");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Button",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration("Panel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Panel",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.roundedBottomCorners = true;
               this.cornerRadius = 16;
               this.headerHeight = 32;
               this.verticalGap = 4;
            };
         }
         style = StyleManager.getStyleDeclaration("NpcDialog");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("NpcDialog",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontFamily = "titlefont";
               this.fontSize = 16;
            };
         }
         style = StyleManager.getStyleDeclaration("Alert");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Alert",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.shadowDirection = "right";
               this.borderStyle = "solid";
               this.dropShadowEnabled = true;
               this.backgroundColor = 36864;
               this.shadowDistance = 3;
               this.backgroundAlpha = 1;
            };
         }
         style = StyleManager.getStyleDeclaration("Application");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Application",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.kerning = true;
               this.fontFamily = "abscissa";
               this.fontSize = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".flatPanel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".flatPanel",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "none";
               this.dropShadowEnabled = false;
               this.backgroundAlpha = 0.8;
            };
         }
         style = StyleManager.getStyleDeclaration("TitleWindow");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("TitleWindow",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.modalTransparencyBlur = 0;
               this.modalTransparencyColor = 13688960;
               this.borderAlpha = 0.9;
            };
         }
         style = StyleManager.getStyleDeclaration(".tutorialText");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".tutorialText",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.kerning = true;
               this.fontSize = 14;
            };
         }
         style = StyleManager.getStyleDeclaration(".mytoggleButtonBarSelectedButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mytoggleButtonBarSelectedButtonStyle",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 15;
               this.cornerRadius = 8;
               this.paddingLeft = 0;
               this.paddingRight = 0;
            };
         }
         style = StyleManager.getStyleDeclaration("ToolTip");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("ToolTip",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.letterSpacing = 0;
               this.cornerRadius = 8;
               this.fontSize = 12;
               this.paddingLeft = 10;
               this.backgroundAlpha = 1;
            };
         }
         style = StyleManager.getStyleDeclaration(".cleanPanel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".cleanPanel",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.shadowDirection = "right";
               this.borderStyle = "solid";
               this.dropShadowEnabled = true;
               this.shadowDistance = 3;
               this.backgroundAlpha = 0.8;
            };
         }
         style = StyleManager.getStyleDeclaration(".mytoggleButtonBarButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mytoggleButtonBarButtonStyle",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.cornerRadius = 8;
               this.highlightAlphas = [0,0];
               this.fillColors = [0,16777215,16777215,15658734];
               this.fillAlphas = [0.5,1,0.75,0.65];
               this.paddingLeft = 0;
               this.paddingRight = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".cleanPanelSolid");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".cleanPanelSolid",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.shadowDirection = "right";
               this.borderStyle = "solid";
               this.dropShadowEnabled = true;
               this.shadowDistance = 3;
               this.backgroundAlpha = 1;
            };
         }
         style = StyleManager.getStyleDeclaration("LinkButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("LinkButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.textDecoration = "underline";
               this.color = 255;
            };
         }
         StyleManager.mx_internal::initProtoChainRoots();
      }
      
      public function set myWD(param1:WipeDown) : void
      {
         var _loc2_:Object = this._3366265myWD;
         if(_loc2_ !== param1)
         {
            this._3366265myWD = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myWD",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get serviceStatus() : ServiceStatusControl
      {
         return this._2066618617serviceStatus;
      }
      
      public function set tutorialMaker(param1:TutorialMakerControl) : void
      {
         var _loc2_:Object = this._1691355014tutorialMaker;
         if(_loc2_ !== param1)
         {
            this._1691355014tutorialMaker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialMaker",_loc2_,param1));
         }
      }
      
      private function _MGB_SetProperty1_c() : SetProperty
      {
         var _loc1_:SetProperty = new SetProperty();
         _loc1_.name = "minHeight";
         _loc1_.value = 300;
         return _loc1_;
      }
      
      public function set serviceStatus(param1:ServiceStatusControl) : void
      {
         var _loc2_:Object = this._2066618617serviceStatus;
         if(_loc2_ !== param1)
         {
            this._2066618617serviceStatus = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"serviceStatus",_loc2_,param1));
         }
      }
      
      private function set activeTutorial(param1:ActiveTutorial) : void
      {
         var _loc2_:Object = this._2009421692activeTutorial;
         if(_loc2_ !== param1)
         {
            this._2009421692activeTutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorial",_loc2_,param1));
         }
      }
      
      private function initApplication() : void
      {
         if(!browserManager)
         {
            browserManager = BrowserManager.getInstance();
            browserManager.init(null,MgbSystem.titleString);
         }
         currentState = !!startInEmbedMode() ? "embedUI" : "fullUI";
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_LOGIN_LOGOUT,mgbLoginLogout);
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_AUTHENTICATED_USER_SIGNED_IN,mgbAuthUserChange);
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_AUTHENTICATED_USER_SIGNED_OUT,mgbAuthUserChange);
         save_ticker.addEventListener(TimerEvent.TIMER,onTickSaveProfile);
         addEventListener(Event.ENTER_FRAME,waitUntilS3KeysArrive);
         SSSSession.isReady();
         initUserProfile();
         ToolTipManager.showDelay = 150;
      }
      
      private function _MGB_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "embedUI";
         _loc1_.overrides = [_MGB_AddChild1_c(),_MGB_SetProperty1_c(),_MGB_SetProperty2_c()];
         return _loc1_;
      }
      
      private function _MGB_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         tutorialClue = _loc1_;
         _loc1_.x = 540;
         _loc1_.y = 8;
         _loc1_.wordWrap = false;
         _loc1_.editable = false;
         _loc1_.height = 26;
         _loc1_.width = 210;
         _loc1_.filters = [_MGB_GlowFilter2_c()];
         _loc1_.setStyle("backgroundColor",16776960);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("cornerRadius",8);
         _loc1_.setStyle("borderColor",160);
         _loc1_.setStyle("borderThickness",2);
         _loc1_.id = "tutorialClue";
         BindingManager.executeBindings(this,"tutorialClue",tutorialClue);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MGB_NewsLink1_i() : NewsLink
      {
         var _loc1_:NewsLink = new NewsLink();
         _MGB_NewsLink1 = _loc1_;
         _loc1_.setStyle("top","40");
         _loc1_.setStyle("right","4");
         _loc1_.id = "_MGB_NewsLink1";
         BindingManager.executeBindings(this,"_MGB_NewsLink1",_MGB_NewsLink1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function getUserProfile(param1:String) : String
      {
         var _loc2_:String = String(userProfile.profileObj[param1]);
         if(_loc2_ == null)
         {
            switch(param1)
            {
               case "maxQuotaKB":
                  _loc2_ = "200";
                  break;
               case "userStatusComment":
                  _loc2_ = "";
                  break;
               case "wishListVote1":
                  _loc2_ = "No vote";
                  break;
               case "wishListVote1":
                  _loc2_ = "No vote";
                  break;
               case "wishListVote1":
                  _loc2_ = "No vote";
                  break;
               case "wishListVoteFreeform":
                  break;
               case "conversationViewTabBackgroundColor":
                  _loc2_ = "#ffffd0";
                  break;
               case "messagesComposerBackgroundColor":
                  _loc2_ = "#d0ffff";
            }
         }
         return _loc2_;
      }
      
      [Bindable(event="propertyChange")]
      public function get mainViewStack() : ViewStack
      {
         return this._1703153366mainViewStack;
      }
      
      public function mgbLoginLogout(param1:Event) : void
      {
         userProfileReady = false;
         save_ticker.reset();
         if(mgbSession.userName)
         {
            loadUserProfile();
         }
         else
         {
            initUserProfile(true);
         }
      }
      
      private function initUserProfile(param1:Boolean = false) : void
      {
         userProfile.name = MgbProfile.USER_PROFILE;
         userProfile.projectName = MgbSystem.reservedSystemProjectName;
         userProfile.userName = mgbSession.userName;
         userProfile.profileObj = new ObjectProxy({
            "mainBackgroundColor":"0xD0D0D0",
            "accountmanagementBackgroundColor":"0xcccccc",
            "tilemakerBackgroundColor":"0x33ccff",
            "actormakerBackgroundColor":"0x00cc00",
            "mapmakerBackgroundColor":"0x3399ff",
            "gamemakerBackgroundColor":"0x009933",
            "tutorialmakerBackgroundColor":"0x009933",
            "gameplayerBackgroundColor":"0xD0D0D0",
            "adpanelBackgroundColor":"0xD0D0D0",
            "maxQuotaKB":"250",
            "userStatusComment":"",
            "informationpanelBackgroundColor":"0xD0D0D0",
            "tutorialLevelCompleted":MgbSystem.newUserFirstTutorial,
            "skillLevelCurrentTileMaker":"14",
            "skillLevelCurrentMapMaker":"8",
            "skillLevelTileMaker":"14",
            "skillLevelActorMaker":"1",
            "skillLevelMapMaker":"10",
            "skillLevelGameMaker":"1",
            "skillLevelTutorialMaker":"1",
            "skillLevelGamePlayer":"1"
         });
         userProfileReady = true;
      }
      
      public function unregisterForProfileUpdates(param1:Function) : void
      {
         removeEventListener("MGB_applyUserProfile",param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorialClue() : TextArea
      {
         return this._608462135tutorialClue;
      }
      
      private function _MGB_ToggleButtonBar1_i() : ToggleButtonBar
      {
         var _loc1_:ToggleButtonBar = new ToggleButtonBar();
         mainTabBar = _loc1_;
         _loc1_.selectedIndex = 0;
         _loc1_.styleName = "headerToggleButtonBar";
         _loc1_.y = 40;
         _loc1_.x = 32;
         _loc1_.filters = [_MGB_GlowFilter1_c()];
         _loc1_.setStyle("horizontalGap",4);
         _loc1_.setStyle("cornerRadius",8);
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("buttonWidth",90);
         _loc1_.id = "mainTabBar";
         BindingManager.executeBindings(this,"mainTabBar",mainTabBar);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MGB_ProjectsTab1_i() : ProjectsTab
      {
         var _loc1_:ProjectsTab = new ProjectsTab();
         projectsTab = _loc1_;
         _loc1_.label = "Current Project";
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.id = "projectsTab";
         BindingManager.executeBindings(this,"projectsTab",projectsTab);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set embeddedGamePlayer(param1:GamePlayerControl) : void
      {
         var _loc2_:Object = this._500406371embeddedGamePlayer;
         if(_loc2_ !== param1)
         {
            this._500406371embeddedGamePlayer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"embeddedGamePlayer",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tileMaker() : TileMakerControl
      {
         return this._868027850tileMaker;
      }
      
      private function _MGB_AddChild3_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MGB_ToggleButtonBar1_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get mapMaker() : MapMakerControl
      {
         return this._161881160mapMaker;
      }
      
      private function _MGB_AddChild7_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MGB_NewsLink1_i);
         return _loc1_;
      }
      
      public function mgbAuthUserChange(param1:Event) : void
      {
         var _loc2_:Button = Button(mainTabBar.getChildAt(8));
         _loc2_.visible = _loc2_.includeInLayout = mgbSession.userLoggedInIsAdmin;
      }
      
      public function set myWU(param1:WipeUp) : void
      {
         var _loc2_:Object = this._3366282myWU;
         if(_loc2_ !== param1)
         {
            this._3366282myWU = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myWU",_loc2_,param1));
         }
      }
      
      private function _MGB_TutorialMakerControl1_i() : TutorialMakerControl
      {
         var _loc1_:TutorialMakerControl = new TutorialMakerControl();
         tutorialMaker = _loc1_;
         _loc1_.label = "Tutorial Maker";
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.setStyle("backgroundColor",14540176);
         _loc1_.id = "tutorialMaker";
         BindingManager.executeBindings(this,"tutorialMaker",tutorialMaker);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get accountManagement() : AccountManagement
      {
         return this._1311427152accountManagement;
      }
      
      public function set messagesTab(param1:MessagesTab) : void
      {
         var _loc2_:Object = this._872205655messagesTab;
         if(_loc2_ !== param1)
         {
            this._872205655messagesTab = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messagesTab",_loc2_,param1));
         }
      }
      
      public function set mainViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1703153366mainViewStack;
         if(_loc2_ !== param1)
         {
            this._1703153366mainViewStack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainViewStack",_loc2_,param1));
         }
      }
      
      public function ___MGB_Application1_initialize(param1:FlexEvent) : void
      {
         initApplication();
      }
      
      private function _MGB_GlowFilter2_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 160;
         _loc1_.alpha = 0.8;
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get mainTabBar() : ToggleButtonBar
      {
         return this._475505495mainTabBar;
      }
      
      private function _MGB_GamePlayerControl2_i() : GamePlayerControl
      {
         var _loc1_:GamePlayerControl = new GamePlayerControl();
         gamePlayer = _loc1_;
         _loc1_.label = "Game Player";
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.id = "gamePlayer";
         BindingManager.executeBindings(this,"gamePlayer",gamePlayer);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set tutorialClue(param1:TextArea) : void
      {
         var _loc2_:Object = this._608462135tutorialClue;
         if(_loc2_ !== param1)
         {
            this._608462135tutorialClue = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialClue",_loc2_,param1));
         }
      }
      
      private function set mgbLogger(param1:MgbLogger) : void
      {
         var _loc2_:Object = this._1260658248mgbLogger;
         if(_loc2_ !== param1)
         {
            this._1260658248mgbLogger = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbLogger",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actorMaker() : ActorMakerControl
      {
         return this._1357246641actorMaker;
      }
      
      [Bindable(event="propertyChange")]
      public function get gamePlayer() : GamePlayerControl
      {
         return this._533960051gamePlayer;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function set projectsTab(param1:ProjectsTab) : void
      {
         var _loc2_:Object = this._938957637projectsTab;
         if(_loc2_ !== param1)
         {
            this._938957637projectsTab = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectsTab",_loc2_,param1));
         }
      }
      
      public function raiseToolSkillLevel(param1:String, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:String = "skillLevel" + param1;
         var _loc5_:String = getUserProfile(_loc4_);
         var _loc6_:int = 0;
         if(Boolean(_loc5_) && _loc5_ != "")
         {
            _loc6_ = int(_loc5_);
         }
         if(param2 > _loc6_)
         {
            this.updateUserProfile(_loc4_,param2.toString());
            mgbLogger.logInfo("Your skill level in " + param1 + " has now increased to " + param2 + " and you may access new tools",true);
         }
         if(param3)
         {
            updateUserProfile("skillLevelCurrent" + param1,param2.toString());
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myWD() : WipeDown
      {
         return this._3366265myWD;
      }
      
      public function set tileMaker(param1:TileMakerControl) : void
      {
         var _loc2_:Object = this._868027850tileMaker;
         if(_loc2_ !== param1)
         {
            this._868027850tileMaker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tileMaker",_loc2_,param1));
         }
      }
      
      private function _MGB_WipeDown1_i() : WipeDown
      {
         var _loc1_:WipeDown = new WipeDown();
         myWD = _loc1_;
         _loc1_.duration = 250;
         return _loc1_;
      }
      
      private function _MGB_ActorMakerControl1_i() : ActorMakerControl
      {
         var _loc1_:ActorMakerControl = new ActorMakerControl();
         actorMaker = _loc1_;
         _loc1_.label = "Actor Maker";
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.setStyle("backgroundColor",9474192);
         _loc1_.id = "actorMaker";
         BindingManager.executeBindings(this,"actorMaker",actorMaker);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get activeTutorial() : ActiveTutorial
      {
         return this._2009421692activeTutorial;
      }
      
      private function _MGB_AddChild2_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MGB_HeaderComponent1_c);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorialMaker() : TutorialMakerControl
      {
         return this._1691355014tutorialMaker;
      }
      
      private function _MGB_MessagesTab1_i() : MessagesTab
      {
         var _loc1_:MessagesTab = new MessagesTab();
         messagesTab = _loc1_;
         _loc1_.label = "Messages";
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.id = "messagesTab";
         BindingManager.executeBindings(this,"messagesTab",messagesTab);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MGB_AddChild6_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MGB_TextArea1_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get myWU() : WipeUp
      {
         return this._3366282myWU;
      }
      
      private function _MGB_ViewStack1_i() : ViewStack
      {
         var _loc1_:ViewStack = new ViewStack();
         mainViewStack = _loc1_;
         _loc1_.creationPolicy = "all";
         _loc1_.setStyle("left","2");
         _loc1_.setStyle("right","2");
         _loc1_.setStyle("bottom","4");
         _loc1_.setStyle("top","72");
         _loc1_.id = "mainViewStack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_MGB_AccountManagement1_i());
         _loc1_.addChild(_MGB_ProjectsTab1_i());
         _loc1_.addChild(_MGB_TileMakerControl1_i());
         _loc1_.addChild(_MGB_ActorMakerControl1_i());
         _loc1_.addChild(_MGB_MapMakerControl1_i());
         _loc1_.addChild(_MGB_GamePlayerControl2_i());
         _loc1_.addChild(_MGB_MessagesTab1_i());
         _loc1_.addChild(_MGB_ServiceStatusControl1_i());
         _loc1_.addChild(_MGB_TutorialMakerControl1_i());
         return _loc1_;
      }
      
      private function _MGB_ServiceStatusControl1_i() : ServiceStatusControl
      {
         var _loc1_:ServiceStatusControl = new ServiceStatusControl();
         serviceStatus = _loc1_;
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.id = "serviceStatus";
         BindingManager.executeBindings(this,"serviceStatus",serviceStatus);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MGB = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _MGB_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_MGBWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },bindings,watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         super.initialize();
      }
      
      public function loadUserProfileHandler(param1:ResultEvent = null) : void
      {
         if(param1 && param1.result.hasOwnProperty("mgb_error") && 0 != param1.result.mgb_error)
         {
            mgbLogger.logInfo("Could not load user profile");
         }
         else
         {
            dispatchEvent(new Event("MGB_applyUserProfile"));
            userProfileReady = true;
            activeTutorial.loadTutorial();
            mgbSession.maxQuotaKB = int(getUserProfile("maxQuotaKB"));
            if(mgbSession.maxQuotaKB < 16384)
            {
               updateUserProfile("maxQuotaKB","16384");
               mgbSession.maxQuotaKB = int(getUserProfile("maxQuotaKB"));
            }
            updateUserProfile("lastLoginDate",TimeUtils.humanTimeDateNow(false,true));
         }
      }
      
      public function loadUserProfile() : void
      {
         userProfile.onErrorIssueAlert = false;
         userProfile.loadByName(mgbSession.userName,MgbSystem.reservedSystemProjectName,MgbProfile.USER_PROFILE,loadUserProfileHandler);
      }
      
      private function _MGB_GlowFilter1_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.7;
         _loc1_.blurX = 26;
         _loc1_.blurY = 20;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get embeddedGamePlayer() : GamePlayerControl
      {
         return this._500406371embeddedGamePlayer;
      }
      
      public function set accountManagement(param1:AccountManagement) : void
      {
         var _loc2_:Object = this._1311427152accountManagement;
         if(_loc2_ !== param1)
         {
            this._1311427152accountManagement = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"accountManagement",_loc2_,param1));
         }
      }
      
      public function getEmbedCodeForMap(param1:String, param2:String, param3:String) : String
      {
         var _loc4_:String = "embedStart=user=" + escape(param1) + ";project=" + escape(param2) + ";map=" + escape(param3);
         var _loc5_:String = "http://s3.amazonaws.com/apphost/MGB.swf";
         return "<object id=\'mySwf\' classid=\'clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\' codebase=\'http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab\' height=\'450\' width=\'700\'>\n" + "<param name=\'src\' value=\'" + _loc5_ + "\'/>\n" + "<param name=\'flashVars\' value=\'" + _loc4_ + "\'/>\n" + "<embed name=\'mySwf\' src=\'" + _loc5_ + "\' " + "pluginspage=\'http://www.adobe.com/go/getflashplayer\' height=\'450\' width=\'700\' " + "flashVars=\'" + _loc4_ + "\'/>\n" + "</object>";
      }
      
      public function set actorMaker(param1:ActorMakerControl) : void
      {
         var _loc2_:Object = this._1357246641actorMaker;
         if(_loc2_ !== param1)
         {
            this._1357246641actorMaker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorMaker",_loc2_,param1));
         }
      }
      
      public function registerForProfileUpdates(param1:Function) : void
      {
         addEventListener("MGB_applyUserProfile",param1);
         if(userProfileReady)
         {
            param1();
         }
      }
      
      public function set mapMaker(param1:MapMakerControl) : void
      {
         var _loc2_:Object = this._161881160mapMaker;
         if(_loc2_ !== param1)
         {
            this._161881160mapMaker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapMaker",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messagesTab() : MessagesTab
      {
         return this._872205655messagesTab;
      }
      
      private function _MGB_WipeUp1_i() : WipeUp
      {
         var _loc1_:WipeUp = new WipeUp();
         myWU = _loc1_;
         _loc1_.duration = 250;
         return _loc1_;
      }
      
      private function onTickSaveProfile(param1:TimerEvent) : void
      {
         if(!(Boolean(mgbSession.userLoggedInIsGuest) || mgbSession.userName == null))
         {
            if(userProfileReady)
            {
               userProfile.save();
               mgbLogger.logDebug("profile saved");
            }
         }
      }
      
      private function _MGB_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _MGB_Button1 = _loc1_;
         _loc1_.y = 43;
         _loc1_.label = "Close Editor";
         _loc1_.height = 22;
         _loc1_.setStyle("right","8");
         _loc1_.addEventListener("click",___MGB_Button1_click);
         _loc1_.id = "_MGB_Button1";
         BindingManager.executeBindings(this,"_MGB_Button1",_MGB_Button1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function waitUntilS3KeysArrive(param1:Event) : void
      {
         if(SSSSession.isReady())
         {
            removeEventListener(Event.ENTER_FRAME,waitUntilS3KeysArrive);
            if(Boolean(Application.application.parameters) && Boolean(Application.application.parameters["embedStart"]))
            {
               setViewFromString(Application.application.parameters["embedStart"],true);
            }
            else if(Boolean(browserManager) && Boolean(browserManager.fragment))
            {
               setViewFromString(browserManager.fragment,startInEmbedMode());
            }
         }
      }
      
      private function _MGB_GamePlayerControl1_i() : GamePlayerControl
      {
         var _loc1_:GamePlayerControl = new GamePlayerControl();
         embeddedGamePlayer = _loc1_;
         _loc1_.showGameStats = false;
         _loc1_.showLoadButton = false;
         _loc1_.disableColorpicker = true;
         _loc1_.showAuthenticatedName = true;
         _loc1_.setStyle("backgroundColor",16777215);
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.id = "embeddedGamePlayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set mainBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._544628700mainBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._544628700mainBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainBackgroundColor",_loc2_,param1));
         }
      }
      
      public function ___MGB_Button1_click(param1:MouseEvent) : void
      {
         accountManagement.goToTop();
      }
      
      [Bindable(event="propertyChange")]
      public function get projectsTab() : ProjectsTab
      {
         return this._938957637projectsTab;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbLogger() : MgbLogger
      {
         return this._1260658248mgbLogger;
      }
      
      public function flushUserProfile(param1:Boolean = false) : void
      {
         if(mgbSession.userLoggedInIsGuest)
         {
            mgbLogger.logInfo("Supressing forced flush of userProfile since user is Guest account");
         }
         else if(false == userProfileReady && false == param1)
         {
            mgbLogger.logInfo("Supressing non-forced flush of userProfile since profile had not been loaded");
         }
         else if(param1 || Boolean(save_ticker.running))
         {
            save_ticker.reset();
            userProfile.save();
         }
      }
      
      private function startInEmbedMode() : Boolean
      {
         var _loc2_:Object = null;
         var _loc1_:Boolean = Boolean(Application.application.parameters) && Boolean(Application.application.parameters["embedStart"]);
         if(!_loc1_ && browserManager && Boolean(browserManager.fragment))
         {
            _loc2_ = URLUtil.stringToObject(browserManager.fragment);
            if(_loc2_ && _loc2_.hasOwnProperty("viewmode") && _loc2_.viewmode == "embed")
            {
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      public function set mainTabBar(param1:ToggleButtonBar) : void
      {
         var _loc2_:Object = this._475505495mainTabBar;
         if(_loc2_ !== param1)
         {
            this._475505495mainTabBar = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainTabBar",_loc2_,param1));
         }
      }
      
      private function _MGB_AddChild5_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MGB_ViewStack1_i);
         return _loc1_;
      }
      
      private function _MGB_AddChild1_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MGB_GamePlayerControl1_i);
         return _loc1_;
      }
      
      private function _MGB_MapMakerControl1_i() : MapMakerControl
      {
         var _loc1_:MapMakerControl = new MapMakerControl();
         mapMaker = _loc1_;
         _loc1_.label = "Map Maker";
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.id = "mapMaker";
         BindingManager.executeBindings(this,"mapMaker",mapMaker);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function updateUserProfile(param1:String, param2:String) : void
      {
         var _loc3_:String = "";
         if(mgbSession.userName != null)
         {
            userProfile.profileObj[param1] = param2;
            if(userProfileReady)
            {
               save_ticker.reset();
               save_ticker.start();
            }
            else
            {
               _loc3_ = "-- Not saved: profile was not ready";
            }
         }
         else
         {
            _loc3_ = "-- Not saved: No user logged in";
         }
         trace("updateUserProfile: " + param1 + " = " + param2 + _loc3_);
      }
      
      public function getUrlFromMap(param1:String, param2:String, param3:String = null, param4:Boolean = false, param5:Boolean = false) : String
      {
         var _loc6_:* = "user=" + escape(param1) + ";project=" + escape(param2);
         if(param3)
         {
            _loc6_ += ";map=" + escape(param3);
         }
         if(param5)
         {
            _loc6_ += ";viewmode=embed";
         }
         if(param4)
         {
            browserManager.setFragment(_loc6_);
            browserManager.setTitle(MgbSystem.titleString + " - User:" + param1 + ", Project:" + param2 + (!param3 ? "" : ", Map:" + param3));
         }
         var _loc7_:String;
         return (_loc7_ = MgbSystem.baseMgbUrl + "#" + _loc6_).replace("##","#");
      }
      
      private function _MGB_State2_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "fullUI";
         _loc1_.overrides = [_MGB_AddChild2_c(),_MGB_AddChild3_c(),_MGB_AddChild4_c(),_MGB_AddChild5_c(),_MGB_AddChild6_c(),_MGB_AddChild7_c()];
         return _loc1_;
      }
      
      private function _MGB_SetProperty2_c() : SetProperty
      {
         var _loc1_:SetProperty = new SetProperty();
         _loc1_.name = "minWidth";
         _loc1_.value = 500;
         return _loc1_;
      }
      
      private function setViewFromString(param1:String, param2:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc3_:Object = URLUtil.stringToObject(param1);
         if(_loc3_)
         {
            _loc4_ = _loc3_.hasOwnProperty("user") ? String(_loc3_.user) : null;
            _loc5_ = _loc3_.hasOwnProperty("project") ? String(_loc3_.project) : null;
            _loc6_ = _loc3_.hasOwnProperty("map") ? String(_loc3_.map) : null;
            if(_loc4_ && _loc4_.length > 0 && _loc5_ && _loc5_.length > 0)
            {
               if(param2)
               {
                  if(Boolean(_loc6_) && _loc6_.length > 0)
                  {
                     mgbSession.userName = _loc4_;
                     mgbSession.activeProject = _loc5_;
                     mgbSession.userLoggedInIsGuest = true;
                     embeddedGamePlayer.loadGameByName(_loc6_);
                  }
               }
               else
               {
                  accountManagement.pseudoLoginUsingViewMode(_loc4_,_loc5_,_loc6_);
               }
            }
            if(!param2)
            {
               browserManager.setTitle(MgbSystem.titleString + " - User:" + _loc4_ + ", Project:" + _loc5_ + ", Map:" + _loc6_);
            }
         }
         else if(!param2)
         {
            browserManager.setTitle(MgbSystem.titleString);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainBackgroundColor() : SelectBackgroundColor
      {
         return this._544628700mainBackgroundColor;
      }
      
      private function _MGB_HeaderComponent1_c() : HeaderComponent
      {
         var _loc1_:HeaderComponent = new HeaderComponent();
         _loc1_.x = 10;
         _loc1_.y = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
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
      
      private function _MGB_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = mainViewStack;
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = "Errors (" + mgbLogger.entriesAC.length + ")";
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = activeTutorial.activeTutorialWantedPage != null && activeTutorial.activeTutorialWantedPage != mainViewStack.selectedChild.id.toLowerCase();
         _loc1_ = "Select the <b>\'" + activeTutorial.activeTutorialWantedPage + "\'</b> screen";
         _loc1_ = !mgbSession.userLoggedIn;
      }
      
      public function createAndSaveInitialUserProfile() : void
      {
         userProfile = new MgbProfile();
         initUserProfile();
         userProfileReady = true;
         userProfile.save();
         loadUserProfileHandler(null);
      }
      
      public function set gamePlayer(param1:GamePlayerControl) : void
      {
         var _loc2_:Object = this._533960051gamePlayer;
         if(_loc2_ !== param1)
         {
            this._533960051gamePlayer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gamePlayer",_loc2_,param1));
         }
      }
      
      private function _MGB_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return mainViewStack;
         },function(param1:Object):void
         {
            mainTabBar.dataProvider = param1;
         },"mainTabBar.dataProvider");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            mainTabBar.visible = param1;
         },"mainTabBar.visible");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            _MGB_Button1.visible = param1;
         },"_MGB_Button1.visible");
         result[2] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            accountManagement.setStyle("showEffect",param1);
         },"accountManagement.showEffect");
         result[3] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            accountManagement.setStyle("hideEffect",param1);
         },"accountManagement.hideEffect");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            projectsTab.enabled = param1;
         },"projectsTab.enabled");
         result[5] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            projectsTab.setStyle("showEffect",param1);
         },"projectsTab.showEffect");
         result[6] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            projectsTab.setStyle("hideEffect",param1);
         },"projectsTab.hideEffect");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            tileMaker.enabled = param1;
         },"tileMaker.enabled");
         result[8] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            tileMaker.setStyle("showEffect",param1);
         },"tileMaker.showEffect");
         result[9] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            tileMaker.setStyle("hideEffect",param1);
         },"tileMaker.hideEffect");
         result[10] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            actorMaker.enabled = param1;
         },"actorMaker.enabled");
         result[11] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            actorMaker.setStyle("showEffect",param1);
         },"actorMaker.showEffect");
         result[12] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            actorMaker.setStyle("hideEffect",param1);
         },"actorMaker.hideEffect");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            mapMaker.enabled = param1;
         },"mapMaker.enabled");
         result[14] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            mapMaker.setStyle("showEffect",param1);
         },"mapMaker.showEffect");
         result[15] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            mapMaker.setStyle("hideEffect",param1);
         },"mapMaker.hideEffect");
         result[16] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            gamePlayer.enabled = param1;
         },"gamePlayer.enabled");
         result[17] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            gamePlayer.setStyle("showEffect",param1);
         },"gamePlayer.showEffect");
         result[18] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            gamePlayer.setStyle("hideEffect",param1);
         },"gamePlayer.hideEffect");
         result[19] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            messagesTab.enabled = param1;
         },"messagesTab.enabled");
         result[20] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            messagesTab.setStyle("showEffect",param1);
         },"messagesTab.showEffect");
         result[21] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            messagesTab.setStyle("hideEffect",param1);
         },"messagesTab.hideEffect");
         result[22] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            serviceStatus.setStyle("showEffect",param1);
         },"serviceStatus.showEffect");
         result[23] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            serviceStatus.setStyle("hideEffect",param1);
         },"serviceStatus.hideEffect");
         result[24] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Errors (" + mgbLogger.entriesAC.length + ")";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            serviceStatus.label = param1;
         },"serviceStatus.label");
         result[25] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            tutorialMaker.setStyle("showEffect",param1);
         },"tutorialMaker.showEffect");
         result[26] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            tutorialMaker.setStyle("hideEffect",param1);
         },"tutorialMaker.hideEffect");
         result[27] = binding;
         binding = new Binding(this,function():Boolean
         {
            return activeTutorial.activeTutorialWantedPage != null && activeTutorial.activeTutorialWantedPage != mainViewStack.selectedChild.id.toLowerCase();
         },function(param1:Boolean):void
         {
            tutorialClue.visible = param1;
         },"tutorialClue.visible");
         result[28] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Select the <b>\'" + activeTutorial.activeTutorialWantedPage + "\'</b> screen";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            tutorialClue.htmlText = param1;
         },"tutorialClue.htmlText");
         result[29] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            _MGB_NewsLink1.visible = param1;
         },"_MGB_NewsLink1.visible");
         result[30] = binding;
         return result;
      }
      
      private function _MGB_TileMakerControl1_i() : TileMakerControl
      {
         var _loc1_:TileMakerControl = new TileMakerControl();
         tileMaker = _loc1_;
         _loc1_.label = "Tile Maker";
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         _loc1_.setStyle("right","0");
         _loc1_.id = "tileMaker";
         BindingManager.executeBindings(this,"tileMaker",tileMaker);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
   }
}
