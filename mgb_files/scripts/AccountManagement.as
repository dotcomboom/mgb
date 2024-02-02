package
{
   import com.mgb.controls.*;
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import com.mgb.modals.*;
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
   import mx.collections.*;
   import mx.containers.Canvas;
   import mx.containers.Form;
   import mx.containers.FormItem;
   import mx.containers.Grid;
   import mx.containers.GridItem;
   import mx.containers.GridRow;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.TabNavigator;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.*;
   import mx.core.*;
   import mx.effects.DefaultTileListEffect;
   import mx.effects.Fade;
   import mx.effects.Resize;
   import mx.events.CalendarLayoutChangeEvent;
   import mx.events.CloseEvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ValidationResultEvent;
   import mx.rpc.events.*;
   import mx.rpc.http.mxml.HTTPService;
   import mx.states.AddChild;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import mx.validators.EmailValidator;
   import mx.validators.StringValidator;
   
   use namespace mx_internal;
   
   public class AccountManagement extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1079811973userNamesList:Array;
      
      private var _1066486817badgePanel:Panel;
      
      private var _1407498871changePasswordOldPassword:TextInput;
      
      private var pseudoLoginOldState:String = null;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _1467610533chosenPassword2:TextInput;
      
      private var _327124634validateChosenSecurityAnswer:StringValidator;
      
      private var _1501157619recoverUserBirthYear:TextInput;
      
      public var _AccountManagement_Label6:Label;
      
      private var _191218129validatePassword:StringValidator;
      
      private var _817055746userStatusComment:TextInput;
      
      private var _1268861541footer:EditFooterComponent;
      
      private var _35445117changePasswordButton:Button;
      
      private var _1199152247panelResizeEffect:Resize;
      
      public var _AccountManagement_Button2:Button;
      
      public var _AccountManagement_Button3:Button;
      
      public var _AccountManagement_Button6:Button;
      
      public var _AccountManagement_Button7:Button;
      
      public var _AccountManagement_Button8:Button;
      
      public var _AccountManagement_Button9:Button;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var _AccountManagement_FriendsList1:FriendsList;
      
      private var _1885291877recoveryQuestion:FormItem;
      
      private var _1820416948createMe:Button;
      
      private var _636834160recoverPasswordRequest:HTTPService;
      
      private var _1814585945changePasswordPanel:Panel;
      
      private var _1366299605reflection:Reflection;
      
      public var _AccountManagement_ProfileTab1:ProfileTab;
      
      private const mascotBaseURL:String = "http://s3.amazonaws.com/apphost/mascot_images/";
      
      private var _1642894959tutorialsPL:PieceList;
      
      public var _AccountManagement_TextArea3:TextArea;
      
      private var _1361865936chosenSecurityAnswer:TextInput;
      
      private var _1832051459buttonsPanel:Panel;
      
      private var _1978146577browseUsersRequest:HTTPService;
      
      public var _AccountManagement_WallTab1:WallTab;
      
      private var _1736620543validateChangePasswordOldPassword:StringValidator;
      
      private var _940821457avatarPreview:BitmapDuper;
      
      private var _1260204146panelTabNav:TabNavigator;
      
      private var _1632794753validatePassword2:StringValidator;
      
      private var _2058736931showMeSlowly:Fade;
      
      private var restorePanelQueued:Boolean = false;
      
      private var _553550085rememberMe:CheckBox;
      
      private var _1482739811chosenChangedPassword:TextInput;
      
      private var _1860522715recoverPasswordPanel:Panel;
      
      private var _545553112chosenSecurityQuestion:ComboBox;
      
      private var _839945608mascot1:Image;
      
      private var origBadgePanelWidth:int = -1;
      
      private var _439989329personPanel:Panel;
      
      public var _AccountManagement_Button10:Button;
      
      public var _AccountManagement_Form2:Form;
      
      public var _AccountManagement_Button13:Button;
      
      private var _2139181690mgbTutorial:ActiveTutorial;
      
      private var _1918219659createUserBirthYear:TextInput;
      
      private var mascots:Array;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _589839475userBrowseList:List;
      
      private var _1604868385fPassword:TextInput;
      
      public var _AccountManagement_FormItem4:FormItem;
      
      private var _1124074917logoutRequest:HTTPService;
      
      private var _375940014createAccountViewStack:ViewStack;
      
      public var _AccountManagement_Object1:Object;
      
      public var _AccountManagement_Object2:Object;
      
      public var _AccountManagement_Object3:Object;
      
      public var _AccountManagement_Object4:Object;
      
      public var _AccountManagement_Object5:Object;
      
      public var _AccountManagement_Object6:Object;
      
      public var _AccountManagement_LinkButton1:LinkButton;
      
      public var _AccountManagement_LinkButton6:LinkButton;
      
      private var _1089661575chosenBrowseUser:TextInput;
      
      private var _952756749createRequest:HTTPService;
      
      private var _1997617854newUserTooYoungForEmail:Boolean = true;
      
      private var _839945609mascot2:Image;
      
      private var _103149417login:Button;
      
      private var _1648717351validateChangedPassword2:StringValidator;
      
      public var _AccountManagement_Text1:Text;
      
      public var _AccountManagement_Text3:Text;
      
      public var _AccountManagement_Text6:Text;
      
      public var _AccountManagement_Text7:Text;
      
      private var _318832862getUserStats:HTTPService;
      
      private var _1688481610chosenEmail:TextInput;
      
      private var growPanelQueued:Boolean = false;
      
      private var _1021093702recoverAccountViewStack:ViewStack;
      
      private var _2033359954loginBrowsePreviewBadge:Badge;
      
      private var _1918848538createUserBirthDate:DateField;
      
      private var _93494179badge:Badge;
      
      private var _1411288851checkRecoverQuestionRequest:HTTPService;
      
      private var _334368309loggedinMainVbox:VBox;
      
      public var _AccountManagement_VBox12:VBox;
      
      private var _645394387chosenPassword:TextInput;
      
      private var _1081358637mapsPL:PieceList;
      
      private var _1225965837createAccountPanel:Panel;
      
      private var _196675813tileCopyAllowed:CheckBox;
      
      private var _1650536550actorsPL:PieceList;
      
      private var _1854509699ageDescription:String = "";
      
      private var _855080922validateEmail:EmailValidator;
      
      private var _1863806326recoverPasswordLogin:TextInput;
      
      private var _35060340copyrights:Text;
      
      public var _AccountManagement_LoginBrowseUserDetailControl1:LoginBrowseUserDetailControl;
      
      public var _AccountManagement_Panel8:Panel;
      
      public var _AccountManagement_Canvas3:Canvas;
      
      private var _1762040805loginPanel:Panel;
      
      public var _AccountManagement_VBox8:VBox;
      
      private var _446328343myTileListEffect:DefaultTileListEffect;
      
      private var _1870336323recoverPasswordEmail:TextInput;
      
      private var _1501786498recoverUserBirthDate:DateField;
      
      private var _2037278075accountmanagementBackgroundColor:SelectBackgroundColor;
      
      private var _24959027screenshots:ScreenShotAndAd;
      
      private var _584169111createAccountMainArea:VBox;
      
      private var _1260658248mgbLogger:MgbLogger;
      
      private var _1332288889validateChangedPassword:StringValidator;
      
      mx_internal var _watchers:Array;
      
      private var _788669158loginRequest:HTTPService;
      
      private var _457328185recoveryQuestionAnswer:TextInput;
      
      private var _1279706165chosenChangedPassword2:TextInput;
      
      private var _1695011607chosenLogin:TextInput;
      
      private var currentNameFilterPattern:RegExp;
      
      private var _848550925validateLogin:StringValidator;
      
      private var _1682781661userNamesListAC:ArrayCollection;
      
      public var _AccountManagement_FormItem11:FormItem;
      
      public var _AccountManagement_FormItem12:FormItem;
      
      private var _1953139108changePasswordRequest:HTTPService;
      
      private var _1301197149fLogin:TextInput;
      
      private var _2036072637recoverPasswordAnswer:String = "";
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1314832319tilesPL:PieceList;
      
      public function AccountManagement()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":SelectBackgroundColor,
                  "id":"accountmanagementBackgroundColor",
                  "stylesFactory":function():void
                  {
                     this.right = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"y":0};
                  }
               })]};
            }
         });
         _1079811973userNamesList = new Array();
         _1682781661userNamesListAC = new ArrayCollection(userNamesList);
         _1217010542mgbSession = MgbSession.getInstance();
         _1260658248mgbLogger = MgbLogger.getInstance();
         _2139181690mgbTutorial = ActiveTutorial.getInstance();
         _1314832319tilesPL = MgbCaches.getInstance().tilesPL;
         _1650536550actorsPL = MgbCaches.getInstance().actorsPL;
         _1081358637mapsPL = MgbCaches.getInstance().mapsPL;
         _1642894959tutorialsPL = MgbCaches.getInstance().tutorialsPL;
         mascots = [{
            "image1":"MascotSlimyRight.png",
            "message1":"That yellow guy tasted just like custard. I wonder...",
            "image2":"MascotKronz.png",
            "message2":"So you think you can take Kronz huh? This should be amusing.."
         },{
            "image1":"mascotdusk.png",
            "message1":"Bend to my will foolish mortal",
            "image2":"mascotguy.png",
            "message2":"The only thing that\'s going to bend around here is my bow"
         },{
            "image1":"mascotsoldier.png",
            "message1":"Rawr!!",
            "image2":"MascotRpgGuy.png",
            "message2":"Hmm, not a very high intelligence NPC I suspect"
         },{
            "image1":"mascotnose.png",
            "message1":"Platformers rule!",
            "image2":"mascotpenguin.png",
            "message2":"No.. Puzzles rock!"
         },{
            "image1":"mascotNailo.png",
            "message1":"You\'re not taking this seriously are you?",
            "image2":"MascotSchmoopV2.png",
            "message2":"I\'m just role-playing Mike!"
         },{
            "image1":"MascotBurgerMan.png",
            "message1":"Are you Mac?",
            "image2":"MascotBurgerMonster.png",
            "message2":"No, but I\'m gonna whopper you!"
         }];
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.horizontalScrollPolicy = "off";
         this.currentState = "LoginPrompt";
         this.states = [_AccountManagement_State1_c(),_AccountManagement_State2_c(),_AccountManagement_State3_c(),_AccountManagement_State4_c(),_AccountManagement_State5_c(),_AccountManagement_State6_c(),_AccountManagement_State7_c(),_AccountManagement_State8_c()];
         _AccountManagement_HTTPService8_i();
         _AccountManagement_HTTPService6_i();
         _AccountManagement_HTTPService4_i();
         _AccountManagement_HTTPService3_i();
         _AccountManagement_HTTPService2_i();
         _AccountManagement_HTTPService1_i();
         _AccountManagement_HTTPService7_i();
         _AccountManagement_DefaultTileListEffect1_i();
         _AccountManagement_Resize1_i();
         _AccountManagement_HTTPService5_i();
         _AccountManagement_Fade1_i();
         _AccountManagement_StringValidator7_i();
         _AccountManagement_StringValidator5_i();
         _AccountManagement_StringValidator6_i();
         _AccountManagement_StringValidator4_i();
         _AccountManagement_EmailValidator1_i();
         _AccountManagement_StringValidator1_i();
         _AccountManagement_StringValidator2_i();
         _AccountManagement_StringValidator3_i();
         this.addEventListener("creationComplete",___AccountManagement_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         AccountManagement._watcherSetupUtil = param1;
      }
      
      public function pseudoLoginUsingViewMode(param1:String, param2:String = null, param3:String = null) : void
      {
         mgbSession.userName = param1;
         mgbSession.activeProject = !!param2 ? param2 : String(MgbSystem.defaultProject);
         mgbSession.userLoggedInIsGuest = true;
         pseudoLoginOldState = currentState;
         currentState = "LoggedIn";
         Application.application.loadUserProfile();
         updateWithLoginInfo();
         if(param3)
         {
            mgbSession.navGotoGamePlayer(param3);
         }
         else
         {
            mgbSession.navGotoHome();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userStatusComment() : TextInput
      {
         return this._817055746userStatusComment;
      }
      
      private function _AccountManagement_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _AccountManagement_Button2 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.y = 16;
         _loc1_.label = "Tutorial";
         _loc1_.filters = [_AccountManagement_GlowFilter1_c()];
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.addEventListener("click",___AccountManagement_Button2_click);
         _loc1_.id = "_AccountManagement_Button2";
         BindingManager.executeBindings(this,"_AccountManagement_Button2",_AccountManagement_Button2);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set userStatusComment(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._817055746userStatusComment;
         if(_loc2_ !== param1)
         {
            this._817055746userStatusComment = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userStatusComment",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Panel2_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         personPanel = _loc1_;
         _loc1_.height = 140;
         _loc1_.percentWidth = 50;
         _loc1_.verticalScrollPolicy = "off";
         _loc1_.styleName = "cleanPanel";
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.setStyle("paddingRight",8);
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("paddingBottom",8);
         _loc1_.id = "personPanel";
         BindingManager.executeBindings(this,"personPanel",personPanel);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_HBox3_c());
         _loc1_.addChild(_AccountManagement_CheckBox1_i());
         return _loc1_;
      }
      
      private function _AccountManagement_Text6_i() : Text
      {
         var _loc1_:Text = null;
         _loc1_ = new Text();
         _AccountManagement_Text6 = _loc1_;
         _loc1_.id = "_AccountManagement_Text6";
         BindingManager.executeBindings(this,"_AccountManagement_Text6",_AccountManagement_Text6);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __createUserBirthDate_change(param1:CalendarLayoutChangeEvent) : void
      {
         updateYearFromDateField(createUserBirthDate,createUserBirthYear);
      }
      
      private function _AccountManagement_HBox9_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Spacer2_c());
         _loc1_.addChild(_AccountManagement_CheckBox2_i());
         return _loc1_;
      }
      
      private function _AccountManagement_ViewStack1_i() : ViewStack
      {
         var _loc1_:ViewStack = new ViewStack();
         recoverAccountViewStack = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "recoverAccountViewStack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Form3_c());
         _loc1_.addChild(_AccountManagement_Form4_c());
         _loc1_.addChild(_AccountManagement_Form5_c());
         return _loc1_;
      }
      
      private function _AccountManagement_Canvas2_c() : Canvas
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.percentWidth = 100;
         _loc1_.autoLayout = true;
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TabNavigator1_i());
         return _loc1_;
      }
      
      private function _AccountManagement_AddChild6_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_VBox9_c);
         return _loc1_;
      }
      
      private function _AccountManagement_Object5_i() : Object
      {
         var _loc1_:Object = {
            "login":null,
            "dob":null,
            "answer":null
         };
         _AccountManagement_Object5 = _loc1_;
         BindingManager.executeBindings(this,"_AccountManagement_Object5",_AccountManagement_Object5);
         return _loc1_;
      }
      
      public function set createRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._952756749createRequest;
         if(_loc2_ !== param1)
         {
            this._952756749createRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createRequest",_loc2_,param1));
         }
      }
      
      private function doRecoverPassword() : void
      {
         switch(recoverAccountViewStack.selectedIndex)
         {
            case 0:
               mgbLogger.logBug("doRecoverPassword() from page 0?");
               break;
            case 1:
               recoverPasswordAnswer = recoverPasswordEmail.text;
               break;
            case 2:
               recoverPasswordAnswer = recoveryQuestionAnswer.text;
         }
         recoverPasswordRequest.send();
      }
      
      private function _AccountManagement_Label6_i() : Label
      {
         var _loc1_:Label = new Label();
         _AccountManagement_Label6 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.enabled = false;
         _loc1_.setStyle("textAlign","right");
         _loc1_.id = "_AccountManagement_Label6";
         BindingManager.executeBindings(this,"_AccountManagement_Label6",_AccountManagement_Label6);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_TextInput9_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         recoverPasswordEmail = _loc1_;
         _loc1_.width = 140;
         _loc1_.text = "";
         _loc1_.id = "recoverPasswordEmail";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_LinkButton2_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.label = "Cancel";
         _loc1_.toolTip = "Go back to status page";
         _loc1_.setStyle("textDecoration","underline");
         _loc1_.addEventListener("click",___AccountManagement_LinkButton2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Text4_c() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "Make Games. Make Friends. Have Fun.";
         _loc1_.styleName = "standoutLarge";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set validateLogin(param1:StringValidator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._848550925validateLogin;
         if(_loc2_ !== param1)
         {
            this._848550925validateLogin = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validateLogin",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Grid1_c() : Grid
      {
         var _loc1_:Grid = new Grid();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_GridRow1_c());
         _loc1_.addChild(_AccountManagement_GridRow2_c());
         _loc1_.addChild(_AccountManagement_GridRow3_c());
         _loc1_.addChild(_AccountManagement_GridRow4_c());
         return _loc1_;
      }
      
      private function _AccountManagement_DateField2_i() : DateField
      {
         var _loc1_:DateField = new DateField();
         createUserBirthDate = _loc1_;
         _loc1_.formatString = "MM/DD/YYYY";
         _loc1_.minYear = 1880;
         _loc1_.maxYear = 2006;
         _loc1_.addEventListener("change",__createUserBirthDate_change);
         _loc1_.id = "createUserBirthDate";
         BindingManager.executeBindings(this,"createUserBirthDate",createUserBirthDate);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __changePasswordButton_click(param1:MouseEvent) : void
      {
         validateAndChangePassword();
      }
      
      private function _AccountManagement_GridRow1_c() : GridRow
      {
         var _loc1_:GridRow = new GridRow();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_GridItem1_c());
         _loc1_.addChild(_AccountManagement_GridItem2_c());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get badgePanel() : Panel
      {
         return this._1066486817badgePanel;
      }
      
      [Bindable(event="propertyChange")]
      public function get reflection() : Reflection
      {
         return this._1366299605reflection;
      }
      
      public function ___AccountManagement_Button14_click(param1:MouseEvent) : void
      {
         currentState = "LoginPrompt";
      }
      
      private function _AccountManagement_StringValidator6_i() : StringValidator
      {
         var _loc1_:StringValidator = new StringValidator();
         validateChangedPassword2 = _loc1_;
         _loc1_.property = "text";
         _loc1_.triggerEvent = "click";
         _loc1_.tooShortError = "Your new password should have at least 5 characters";
         _loc1_.tooLongError = "Your new password should be shorter than 21 characters";
         _loc1_.minLength = 5;
         _loc1_.maxLength = 20;
         _loc1_.required = true;
         BindingManager.executeBindings(this,"validateChangedPassword2",validateChangedPassword2);
         _loc1_.initialized(this,"validateChangedPassword2");
         return _loc1_;
      }
      
      public function ___AccountManagement_LinkButton8_click(param1:MouseEvent) : void
      {
         showCreateAccount();
      }
      
      private function getUserStatsResultHandler(param1:ResultEvent) : void
      {
         badge.setBadgeString(param1.result.badges);
         mgbSession.userBadges = String(param1.result.badges);
      }
      
      public function __tileCopyAllowed_change(param1:Event) : void
      {
         saveUpdatedTileCopyAllowedFlag();
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenPassword() : TextInput
      {
         return this._645394387chosenPassword;
      }
      
      private function _AccountManagement_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "Close Editor";
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.addEventListener("click",___AccountManagement_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get avatarPreview() : BitmapDuper
      {
         return this._940821457avatarPreview;
      }
      
      private function _AccountManagement_Form8_c() : Form
      {
         var _loc1_:Form = null;
         _loc1_ = new Form();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextArea4_c());
         _loc1_.addChild(_AccountManagement_FormItem13_c());
         _loc1_.addChild(_AccountManagement_FormItem14_c());
         return _loc1_;
      }
      
      public function ___AccountManagement_Button1_click(param1:MouseEvent) : void
      {
         goToTop();
      }
      
      private function _AccountManagement_HBox17_c() : HBox
      {
         var _loc1_:HBox = null;
         _loc1_ = new HBox();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_VBox13_c());
         _loc1_.addChild(_AccountManagement_Badge2_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenChangedPassword2() : TextInput
      {
         return this._1279706165chosenChangedPassword2;
      }
      
      [Bindable(event="propertyChange")]
      public function get loginPanel() : Panel
      {
         return this._1762040805loginPanel;
      }
      
      private function _AccountManagement_Spacer4_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get tilesPL() : PieceList
      {
         return this._1314832319tilesPL;
      }
      
      public function set badgePanel(param1:Panel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1066486817badgePanel;
         if(_loc2_ !== param1)
         {
            this._1066486817badgePanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"badgePanel",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_HTTPService8_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         browseUsersRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = {};
         _loc1_.addEventListener("result",__browseUsersRequest_result);
         _loc1_.addEventListener("fault",__browseUsersRequest_fault);
         BindingManager.executeBindings(this,"browseUsersRequest",browseUsersRequest);
         _loc1_.initialized(this,"browseUsersRequest");
         return _loc1_;
      }
      
      private function _AccountManagement_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         badgePanel = _loc1_;
         _loc1_.styleName = "cleanPanel";
         _loc1_.height = 140;
         _loc1_.width = 330;
         _loc1_.verticalScrollPolicy = "off";
         _loc1_.horizontalScrollPolicy = "off";
         _loc1_.setStyle("paddingLeft",8);
         _loc1_.setStyle("paddingRight",8);
         _loc1_.setStyle("paddingTop",2);
         _loc1_.setStyle("paddingBottom",2);
         _loc1_.addEventListener("rollOver",__badgePanel_rollOver);
         _loc1_.addEventListener("rollOut",__badgePanel_rollOut);
         _loc1_.id = "badgePanel";
         BindingManager.executeBindings(this,"badgePanel",badgePanel);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Badge1_i());
         return _loc1_;
      }
      
      public function __avatarPreview_doubleClick(param1:MouseEvent) : void
      {
         doubleClickAvatar(param1);
      }
      
      private function _AccountManagement_Object4_i() : Object
      {
         var _loc1_:Object = {
            "login":null,
            "dob":null
         };
         _AccountManagement_Object4 = _loc1_;
         BindingManager.executeBindings(this,"_AccountManagement_Object4",_AccountManagement_Object4);
         return _loc1_;
      }
      
      private function _AccountManagement_TextInput8_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         recoverUserBirthYear = _loc1_;
         _loc1_.width = 48;
         _loc1_.toolTip = "Year of Birth (eg 1992)";
         _loc1_.restrict = "0123456789";
         _loc1_.maxChars = 4;
         _loc1_.addEventListener("change",__recoverUserBirthYear_change);
         _loc1_.id = "recoverUserBirthYear";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_GridItem8_c() : GridItem
      {
         var _loc1_:GridItem = new GridItem();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_LinkButton2_c());
         return _loc1_;
      }
      
      public function set reflection(param1:Reflection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1366299605reflection;
         if(_loc2_ !== param1)
         {
            this._1366299605reflection = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reflection",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_AddChild5_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_Canvas7_c);
         return _loc1_;
      }
      
      public function set loginPanel(param1:Panel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1762040805loginPanel;
         if(_loc2_ !== param1)
         {
            this._1762040805loginPanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loginPanel",_loc2_,param1));
         }
      }
      
      public function __rememberMe_change(param1:Event) : void
      {
         rememberMeChanged();
      }
      
      public function set validateEmail(param1:EmailValidator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._855080922validateEmail;
         if(_loc2_ !== param1)
         {
            this._855080922validateEmail = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validateEmail",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_ScreenShotAndAd1_i() : ScreenShotAndAd
      {
         var _loc1_:ScreenShotAndAd = new ScreenShotAndAd();
         screenshots = _loc1_;
         _loc1_.y = 28;
         _loc1_.width = 560;
         _loc1_.height = 416;
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.setStyle("verticalCenter","0");
         _loc1_.id = "screenshots";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_DateField1_i() : DateField
      {
         var _loc1_:DateField = new DateField();
         recoverUserBirthDate = _loc1_;
         _loc1_.formatString = "MM/DD/YYYY";
         _loc1_.minYear = 1880;
         _loc1_.maxYear = 2006;
         _loc1_.addEventListener("change",__recoverUserBirthDate_change);
         _loc1_.id = "recoverUserBirthDate";
         BindingManager.executeBindings(this,"recoverUserBirthDate",recoverUserBirthDate);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set avatarPreview(param1:BitmapDuper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._940821457avatarPreview;
         if(_loc2_ !== param1)
         {
            this._940821457avatarPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"avatarPreview",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get validateEmail() : EmailValidator
      {
         return this._855080922validateEmail;
      }
      
      private function _AccountManagement_LinkButton1_i() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _AccountManagement_LinkButton1 = _loc1_;
         _loc1_.label = "Change password";
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textDecoration","underline");
         _loc1_.addEventListener("click",___AccountManagement_LinkButton1_click);
         _loc1_.id = "_AccountManagement_LinkButton1";
         BindingManager.executeBindings(this,"_AccountManagement_LinkButton1",_AccountManagement_LinkButton1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Text3_i() : Text
      {
         var _loc1_:Text = new Text();
         _AccountManagement_Text3 = _loc1_;
         _loc1_.id = "_AccountManagement_Text3";
         BindingManager.executeBindings(this,"_AccountManagement_Text3",_AccountManagement_Text3);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_HBox8_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.setStyle("horizontalGap",0);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Form2_i());
         _loc1_.addChild(_AccountManagement_Canvas4_c());
         return _loc1_;
      }
      
      public function set validateChangePasswordOldPassword(param1:StringValidator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1736620543validateChangePasswordOldPassword;
         if(_loc2_ !== param1)
         {
            this._1736620543validateChangePasswordOldPassword = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validateChangePasswordOldPassword",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Form7_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_FormItem12_i());
         _loc1_.addChild(_AccountManagement_TextArea3_i());
         return _loc1_;
      }
      
      public function set chosenChangedPassword2(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1279706165chosenChangedPassword2;
         if(_loc2_ !== param1)
         {
            this._1279706165chosenChangedPassword2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenChangedPassword2",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.text = "Signing up is easy, just fill in these two pages...";
         _loc1_.height = 22;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("paddingLeft",4);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_StringValidator5_i() : StringValidator
      {
         var _loc1_:StringValidator = new StringValidator();
         validateChangedPassword = _loc1_;
         _loc1_.property = "text";
         _loc1_.triggerEvent = "click";
         _loc1_.tooShortError = "Your new password should have at least 5 characters";
         _loc1_.tooLongError = "Your new password should be shorter than 21 characters";
         _loc1_.minLength = 5;
         _loc1_.maxLength = 20;
         _loc1_.required = true;
         BindingManager.executeBindings(this,"validateChangedPassword",validateChangedPassword);
         _loc1_.initialized(this,"validateChangedPassword");
         return _loc1_;
      }
      
      private function doCheckRecoverQuestion() : void
      {
         checkRecoverQuestionRequest.send();
      }
      
      private function doubleClickAvatar(param1:Event) : void
      {
         if(mgbSession.activeProject == MgbSystem.defaultProject)
         {
            mgbSession.navGotoTileMaker(MgbSystem.avatarName);
         }
         else
         {
            Alert.show("You can only edit the avatar while you are in the \'" + MgbSystem.defaultProject + "\' project - which is where it is stored as a tile named \'" + MgbSystem.avatarName + "\'");
         }
      }
      
      public function set loggedinMainVbox(param1:VBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._334368309loggedinMainVbox;
         if(_loc2_ !== param1)
         {
            this._334368309loggedinMainVbox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loggedinMainVbox",_loc2_,param1));
         }
      }
      
      public function set chosenPassword(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._645394387chosenPassword;
         if(_loc2_ !== param1)
         {
            this._645394387chosenPassword = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenPassword",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userBrowseList() : List
      {
         return this._589839475userBrowseList;
      }
      
      public function __panelResizeEffect_effectEnd(param1:EffectEvent) : void
      {
         panelResizeDone(param1);
      }
      
      public function __checkRecoverQuestionRequest_fault(param1:FaultEvent) : void
      {
         faultHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get panelTabNav() : TabNavigator
      {
         return this._1260204146panelTabNav;
      }
      
      [Bindable(event="propertyChange")]
      private function get userNamesList() : Array
      {
         return this._1079811973userNamesList;
      }
      
      private function _AccountManagement_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 16;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AccountManagement_Button6_click(param1:MouseEvent) : void
      {
         doCheckRecoverQuestion();
      }
      
      private function _AccountManagement_HBox16_c() : HBox
      {
         var _loc1_:HBox = null;
         _loc1_ = new HBox();
         _loc1_.x = 8;
         _loc1_.height = 38;
         _loc1_.setStyle("backgroundColor",0);
         _loc1_.setStyle("backgroundAlpha",0.1);
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.setStyle("paddingRight",4);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Label7_c());
         _loc1_.addChild(_AccountManagement_TextInput17_i());
         return _loc1_;
      }
      
      private function _AccountManagement_HTTPService7_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         logoutRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = {};
         _loc1_.addEventListener("result",__logoutRequest_result);
         _loc1_.addEventListener("fault",__logoutRequest_fault);
         BindingManager.executeBindings(this,"logoutRequest",logoutRequest);
         _loc1_.initialized(this,"logoutRequest");
         return _loc1_;
      }
      
      public function ___AccountManagement_LinkButton13_click(param1:MouseEvent) : void
      {
         currentState = "LoginPrompt";
      }
      
      private function showRecoverAccount() : void
      {
         currentState = "RecoverPassword";
         recoverAccountViewStack.selectedIndex = 0;
         recoverPasswordLogin.text = "";
         recoverUserBirthDate.selectedDate = new Date(1999,1,1);
         updateYearFromDateField(recoverUserBirthDate,recoverUserBirthYear);
      }
      
      public function __chosenBrowseUser_change(param1:Event) : void
      {
         updateBrowseUserGrepFilters();
      }
      
      private function set tilesPL(param1:PieceList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1314832319tilesPL;
         if(_loc2_ !== param1)
         {
            this._1314832319tilesPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilesPL",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_HBox7_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("horizontalAlign","center");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Image1_i());
         _loc1_.addChild(_AccountManagement_VBox6_c());
         _loc1_.addChild(_AccountManagement_Image2_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get createAccountViewStack() : ViewStack
      {
         return this._375940014createAccountViewStack;
      }
      
      private function _AccountManagement_TextInput17_i() : TextInput
      {
         var _loc1_:TextInput = null;
         _loc1_ = new TextInput();
         chosenBrowseUser = _loc1_;
         _loc1_.text = "";
         _loc1_.addEventListener("change",__chosenBrowseUser_change);
         _loc1_.id = "chosenBrowseUser";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_AddChild4_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_HBox6_c);
         return _loc1_;
      }
      
      private function _AccountManagement_GridItem7_c() : GridItem
      {
         var _loc1_:GridItem = new GridItem();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Button4_i());
         return _loc1_;
      }
      
      private function saveUpdatedTileCopyAllowedFlag() : void
      {
         Application.application.updateUserProfile("tileCopyAllowedFlag",tileCopyAllowed.selected ? "yes" : "no");
         tileCopyAllowed.focusEnabled = false;
      }
      
      private function _AccountManagement_Text2_c() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "Motto:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Object3_i() : Object
      {
         var _loc1_:Object = {
            "login":null,
            "password":null,
            "email":null,
            "dob":null,
            "secretquestion":null,
            "secretanswer":null
         };
         _AccountManagement_Object3 = _loc1_;
         BindingManager.executeBindings(this,"_AccountManagement_Object3",_AccountManagement_Object3);
         return _loc1_;
      }
      
      private function _AccountManagement_GamesBrowser1_c() : GamesBrowser
      {
         var _loc1_:GamesBrowser = null;
         _loc1_ = new GamesBrowser();
         _loc1_.autoLayout = true;
         _loc1_.setStyle("left","32");
         _loc1_.setStyle("right","32");
         _loc1_.setStyle("top","32");
         _loc1_.setStyle("bottom","32");
         _loc1_.addEventListener("playGame",___AccountManagement_GamesBrowser1_playGame);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AccountManagement_LinkButton2_click(param1:MouseEvent) : void
      {
         cancelChangePasssword();
      }
      
      private function _AccountManagement_bindingsSetup() : Array
      {
         var result:Array = null;
         var binding:Binding = null;
         result = [];
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _AccountManagement_Text1.includeInLayout = param1;
         },"_AccountManagement_Text1.includeInLayout");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _AccountManagement_Text1.visible = param1;
         },"_AccountManagement_Text1.visible");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = (!!badge.bsAC ? badge.bsAC.length : "") + " Badges";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            badgePanel.title = param1;
         },"badgePanel.title");
         result[2] = binding;
         binding = new Binding(this,function():*
         {
            return panelResizeEffect;
         },function(param1:*):void
         {
            badgePanel.setStyle("resizeEffect",param1);
         },"badgePanel.resizeEffect");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "You are " + mgbSession.loginSummary;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            personPanel.title = param1;
         },"personPanel.title");
         result[4] = binding;
         binding = new Binding(this,function():*
         {
            return showMeSlowly;
         },function(param1:*):void
         {
            personPanel.setStyle("showEffect",param1);
         },"personPanel.showEffect");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.describeAvatarText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            avatarPreview.toolTip = param1;
         },"avatarPreview.toolTip");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            userStatusComment.restrict = param1;
         },"userStatusComment.restrict");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest == false;
         },function(param1:Boolean):void
         {
            userStatusComment.editable = param1;
         },"userStatusComment.editable");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest == false;
         },function(param1:Boolean):void
         {
            _AccountManagement_LinkButton1.visible = param1;
         },"_AccountManagement_LinkButton1.visible");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            tileCopyAllowed.enabled = param1;
         },"tileCopyAllowed.enabled");
         result[10] = binding;
         binding = new Binding(this,function():*
         {
            return showMeSlowly;
         },function(param1:*):void
         {
            buttonsPanel.setStyle("showEffect",param1);
         },"buttonsPanel.showEffect");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button2.visible = param1;
         },"_AccountManagement_Button2.visible");
         result[12] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "Space used: " + mgbSession.usageFriendlyString;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_Button3.label = param1;
         },"_AccountManagement_Button3.label");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button3.enabled = param1;
         },"_AccountManagement_Button3.enabled");
         result[14] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = footer.height;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            panelTabNav.setStyle("bottom",param1);
         },"panelTabNav.bottom");
         result[15] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = mgbSession.userName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_FriendsList1.ownerName = param1;
         },"_AccountManagement_FriendsList1.ownerName");
         result[16] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = mgbSession.userName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_ProfileTab1.ownerName = param1;
         },"_AccountManagement_ProfileTab1.ownerName");
         result[17] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = mgbSession.userName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_WallTab1.ownerName = param1;
         },"_AccountManagement_WallTab1.ownerName");
         result[18] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "Logged on as <b>" + fLogin.text + "</b> ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_Text3.htmlText = param1;
         },"_AccountManagement_Text3.htmlText");
         result[19] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.authenticatedName != null;
         },function(param1:Boolean):void
         {
            _AccountManagement_Canvas3.visible = param1;
         },"_AccountManagement_Canvas3.visible");
         result[20] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.authenticatedName != null;
         },function(param1:Boolean):void
         {
            _AccountManagement_Canvas3.includeInLayout = param1;
         },"_AccountManagement_Canvas3.includeInLayout");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "Build games, " + mgbSession.authenticatedName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_LinkButton6.label = param1;
         },"_AccountManagement_LinkButton6.label");
         result[22] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.authenticatedName == null;
         },function(param1:Boolean):void
         {
            _AccountManagement_VBox8.visible = param1;
         },"_AccountManagement_VBox8.visible");
         result[23] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.authenticatedName == null;
         },function(param1:Boolean):void
         {
            _AccountManagement_VBox8.includeInLayout = param1;
         },"_AccountManagement_VBox8.includeInLayout");
         result[24] = binding;
         binding = new Binding(this,function():IFlexDisplayObject
         {
            return login;
         },function(param1:IFlexDisplayObject):void
         {
            _AccountManagement_Form2.defaultButton = param1;
         },"_AccountManagement_Form2.defaultButton");
         result[25] = binding;
         binding = new Binding(this,function():int
         {
            return MgbSystem.maxUsernameLength;
         },function(param1:int):void
         {
            fLogin.maxChars = param1;
         },"fLogin.maxChars");
         result[26] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.restrictCharactersInUsername;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            fLogin.restrict = param1;
         },"fLogin.restrict");
         result[27] = binding;
         binding = new Binding(this,function():Boolean
         {
            return fLogin.text.length > 1 && fPassword.text.length > 1;
         },function(param1:Boolean):void
         {
            login.visible = param1;
         },"login.visible");
         result[28] = binding;
         binding = new Binding(this,function():UIComponent
         {
            return loginPanel;
         },function(param1:UIComponent):void
         {
            reflection.target = param1;
         },"reflection.target");
         result[29] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.restrictCharactersInUsername;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            recoverPasswordLogin.restrict = param1;
         },"recoverPasswordLogin.restrict");
         result[30] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.describeEmailUsageText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_FormItem4.toolTip = param1;
         },"_AccountManagement_FormItem4.toolTip");
         result[31] = binding;
         binding = new Binding(this,function():Date
         {
            return new Date(1999,1,1);
         },function(param1:Date):void
         {
            recoverUserBirthDate.selectedDate = param1;
         },"recoverUserBirthDate.selectedDate");
         result[32] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            recoveryQuestionAnswer.restrict = param1;
         },"recoveryQuestionAnswer.restrict");
         result[33] = binding;
         binding = new Binding(this,function():Boolean
         {
            return recoverAccountViewStack.selectedIndex == 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button6.visible = param1;
         },"_AccountManagement_Button6.visible");
         result[34] = binding;
         binding = new Binding(this,function():Boolean
         {
            return recoverAccountViewStack.selectedIndex == 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button6.includeInLayout = param1;
         },"_AccountManagement_Button6.includeInLayout");
         result[35] = binding;
         binding = new Binding(this,function():Boolean
         {
            return recoverAccountViewStack.selectedIndex != 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button7.visible = param1;
         },"_AccountManagement_Button7.visible");
         result[36] = binding;
         binding = new Binding(this,function():Boolean
         {
            return recoverAccountViewStack.selectedIndex != 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button7.includeInLayout = param1;
         },"_AccountManagement_Button7.includeInLayout");
         result[37] = binding;
         binding = new Binding(this,function():Boolean
         {
            return recoverAccountViewStack.selectedIndex != 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button8.enabled = param1;
         },"_AccountManagement_Button8.enabled");
         result[38] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.restrictCharactersInUsername;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            chosenLogin.restrict = param1;
         },"chosenLogin.restrict");
         result[39] = binding;
         binding = new Binding(this,function():int
         {
            return MgbSystem.maxUsernameLength;
         },function(param1:int):void
         {
            chosenLogin.maxChars = param1;
         },"chosenLogin.maxChars");
         result[40] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.describeEmailUsageText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_FormItem11.toolTip = param1;
         },"_AccountManagement_FormItem11.toolTip");
         result[41] = binding;
         binding = new Binding(this,function():Date
         {
            return new Date(1999,1,1);
         },function(param1:Date):void
         {
            createUserBirthDate.selectedDate = param1;
         },"createUserBirthDate.selectedDate");
         result[42] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = ageDescription;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_Label6.text = param1;
         },"_AccountManagement_Label6.text");
         result[43] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.describeEmailUsageText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_FormItem12.toolTip = param1;
         },"_AccountManagement_FormItem12.toolTip");
         result[44] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.describeEmailUsageText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            chosenEmail.toolTip = param1;
         },"chosenEmail.toolTip");
         result[45] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.describeEmailUsageText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_TextArea3.text = param1;
         },"_AccountManagement_TextArea3.text");
         result[46] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.describeEmailUsageText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            chosenSecurityAnswer.toolTip = param1;
         },"chosenSecurityAnswer.toolTip");
         result[47] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            chosenSecurityAnswer.restrict = param1;
         },"chosenSecurityAnswer.restrict");
         result[48] = binding;
         binding = new Binding(this,function():Boolean
         {
            return createAccountViewStack.selectedIndex == 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button9.visible = param1;
         },"_AccountManagement_Button9.visible");
         result[49] = binding;
         binding = new Binding(this,function():Boolean
         {
            return createAccountViewStack.selectedIndex == 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button9.includeInLayout = param1;
         },"_AccountManagement_Button9.includeInLayout");
         result[50] = binding;
         binding = new Binding(this,function():Boolean
         {
            return chosenLogin.text.length > 0 && chosenPassword.text.length > 0 && chosenPassword2.text.length > 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button9.enabled = param1;
         },"_AccountManagement_Button9.enabled");
         result[51] = binding;
         binding = new Binding(this,function():Boolean
         {
            return createAccountViewStack.selectedIndex != 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button10.visible = param1;
         },"_AccountManagement_Button10.visible");
         result[52] = binding;
         binding = new Binding(this,function():Boolean
         {
            return createAccountViewStack.selectedIndex != 0;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button10.includeInLayout = param1;
         },"_AccountManagement_Button10.includeInLayout");
         result[53] = binding;
         binding = new Binding(this,function():Boolean
         {
            return createAccountViewStack.selectedIndex != 0;
         },function(param1:Boolean):void
         {
            createMe.enabled = param1;
         },"createMe.enabled");
         result[54] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "Browse another user\'s work (list of top " + userNamesListAC.length + " users)...";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_Panel8.title = param1;
         },"_AccountManagement_Panel8.title");
         result[55] = binding;
         binding = new Binding(this,function():Object
         {
            return userNamesListAC;
         },function(param1:Object):void
         {
            userBrowseList.dataProvider = param1;
         },"userBrowseList.dataProvider");
         result[56] = binding;
         binding = new Binding(this,function():Boolean
         {
            return this.userBrowseList.selectedIndex != -1;
         },function(param1:Boolean):void
         {
            _AccountManagement_VBox12.visible = param1;
         },"_AccountManagement_VBox12.visible");
         result[57] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "User \'" + userBrowseList.selectedItem.login + "\'   ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_Text6.text = param1;
         },"_AccountManagement_Text6.text");
         result[58] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = Badge.utilCountBadgesInString(userBrowseList.selectedItem.badges) + " Badges ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_Text7.text = param1;
         },"_AccountManagement_Text7.text");
         result[59] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "Look at " + userBrowseList.selectedItem.login + "\'s work in read-only mode - play their games, look at their tiles, actors, maps, etc";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_Button13.toolTip = param1;
         },"_AccountManagement_Button13.toolTip");
         result[60] = binding;
         binding = new Binding(this,function():Boolean
         {
            return userBrowseList.selectedIndex != -1;
         },function(param1:Boolean):void
         {
            _AccountManagement_Button13.enabled = param1;
         },"_AccountManagement_Button13.enabled");
         result[61] = binding;
         binding = new Binding(this,function():Boolean
         {
            return loginBrowsePreviewBadge.bsAC.length > 0;
         },function(param1:Boolean):void
         {
            loginBrowsePreviewBadge.visible = param1;
         },"loginBrowsePreviewBadge.visible");
         result[62] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = userBrowseList.selectedItem.login;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _AccountManagement_LoginBrowseUserDetailControl1.userName = param1;
         },"_AccountManagement_LoginBrowseUserDetailControl1.userName");
         result[63] = binding;
         binding = new Binding(this,function():Object
         {
            return chosenLogin;
         },function(param1:Object):void
         {
            validateLogin.source = param1;
         },"validateLogin.source");
         result[64] = binding;
         binding = new Binding(this,function():IEventDispatcher
         {
            return createMe;
         },function(param1:IEventDispatcher):void
         {
            validateLogin.trigger = param1;
         },"validateLogin.trigger");
         result[65] = binding;
         binding = new Binding(this,function():Object
         {
            return chosenPassword;
         },function(param1:Object):void
         {
            validatePassword.source = param1;
         },"validatePassword.source");
         result[66] = binding;
         binding = new Binding(this,function():IEventDispatcher
         {
            return createMe;
         },function(param1:IEventDispatcher):void
         {
            validatePassword.trigger = param1;
         },"validatePassword.trigger");
         result[67] = binding;
         binding = new Binding(this,function():Object
         {
            return chosenPassword2;
         },function(param1:Object):void
         {
            validatePassword2.source = param1;
         },"validatePassword2.source");
         result[68] = binding;
         binding = new Binding(this,function():IEventDispatcher
         {
            return createMe;
         },function(param1:IEventDispatcher):void
         {
            validatePassword2.trigger = param1;
         },"validatePassword2.trigger");
         result[69] = binding;
         binding = new Binding(this,function():Object
         {
            return chosenSecurityAnswer;
         },function(param1:Object):void
         {
            validateChosenSecurityAnswer.source = param1;
         },"validateChosenSecurityAnswer.source");
         result[70] = binding;
         binding = new Binding(this,function():IEventDispatcher
         {
            return createMe;
         },function(param1:IEventDispatcher):void
         {
            validateChosenSecurityAnswer.trigger = param1;
         },"validateChosenSecurityAnswer.trigger");
         result[71] = binding;
         binding = new Binding(this,function():Object
         {
            return chosenEmail;
         },function(param1:Object):void
         {
            validateEmail.source = param1;
         },"validateEmail.source");
         result[72] = binding;
         binding = new Binding(this,function():IEventDispatcher
         {
            return createMe;
         },function(param1:IEventDispatcher):void
         {
            validateEmail.trigger = param1;
         },"validateEmail.trigger");
         result[73] = binding;
         binding = new Binding(this,function():Object
         {
            return chosenChangedPassword;
         },function(param1:Object):void
         {
            validateChangedPassword.source = param1;
         },"validateChangedPassword.source");
         result[74] = binding;
         binding = new Binding(this,function():IEventDispatcher
         {
            return changePasswordButton;
         },function(param1:IEventDispatcher):void
         {
            validateChangedPassword.trigger = param1;
         },"validateChangedPassword.trigger");
         result[75] = binding;
         binding = new Binding(this,function():Object
         {
            return chosenChangedPassword2;
         },function(param1:Object):void
         {
            validateChangedPassword2.source = param1;
         },"validateChangedPassword2.source");
         result[76] = binding;
         binding = new Binding(this,function():IEventDispatcher
         {
            return changePasswordButton;
         },function(param1:IEventDispatcher):void
         {
            validateChangedPassword2.trigger = param1;
         },"validateChangedPassword2.trigger");
         result[77] = binding;
         binding = new Binding(this,function():Object
         {
            return changePasswordOldPassword;
         },function(param1:Object):void
         {
            validateChangePasswordOldPassword.source = param1;
         },"validateChangePasswordOldPassword.source");
         result[78] = binding;
         binding = new Binding(this,function():IEventDispatcher
         {
            return changePasswordButton;
         },function(param1:IEventDispatcher):void
         {
            validateChangePasswordOldPassword.trigger = param1;
         },"validateChangePasswordOldPassword.trigger");
         result[79] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.idServerUrl + "/user/flexlogin";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            loginRequest.url = param1;
         },"loginRequest.url");
         result[80] = binding;
         binding = new Binding(this,function():*
         {
            return fLogin.text;
         },function(param1:*):void
         {
            _AccountManagement_Object1.login = param1;
         },"_AccountManagement_Object1.login");
         result[81] = binding;
         binding = new Binding(this,function():*
         {
            return fPassword.text;
         },function(param1:*):void
         {
            _AccountManagement_Object1.password = param1;
         },"_AccountManagement_Object1.password");
         result[82] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.idServerUrl + "/user/get_user_stats";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            getUserStats.url = param1;
         },"getUserStats.url");
         result[83] = binding;
         binding = new Binding(this,function():*
         {
            return mgbSession.userName;
         },function(param1:*):void
         {
            _AccountManagement_Object2.login = param1;
         },"_AccountManagement_Object2.login");
         result[84] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.idServerUrl + "/user/flexcreateuser";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            createRequest.url = param1;
         },"createRequest.url");
         result[85] = binding;
         binding = new Binding(this,function():*
         {
            return chosenLogin.text;
         },function(param1:*):void
         {
            _AccountManagement_Object3.login = param1;
         },"_AccountManagement_Object3.login");
         result[86] = binding;
         binding = new Binding(this,function():*
         {
            return chosenPassword.text;
         },function(param1:*):void
         {
            _AccountManagement_Object3.password = param1;
         },"_AccountManagement_Object3.password");
         result[87] = binding;
         binding = new Binding(this,function():*
         {
            return chosenEmail.text;
         },function(param1:*):void
         {
            _AccountManagement_Object3.email = param1;
         },"_AccountManagement_Object3.email");
         result[88] = binding;
         binding = new Binding(this,function():*
         {
            return DateField.dateToString(createUserBirthDate.selectedDate,"MM/DD/YYYY");
         },function(param1:*):void
         {
            _AccountManagement_Object3.dob = param1;
         },"_AccountManagement_Object3.dob");
         result[89] = binding;
         binding = new Binding(this,function():*
         {
            return chosenSecurityQuestion.value;
         },function(param1:*):void
         {
            _AccountManagement_Object3.secretquestion = param1;
         },"_AccountManagement_Object3.secretquestion");
         result[90] = binding;
         binding = new Binding(this,function():*
         {
            return chosenSecurityAnswer.text;
         },function(param1:*):void
         {
            _AccountManagement_Object3.secretanswer = param1;
         },"_AccountManagement_Object3.secretanswer");
         result[91] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.idServerUrl + "/user/flexrecoveryquestionrequest";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            checkRecoverQuestionRequest.url = param1;
         },"checkRecoverQuestionRequest.url");
         result[92] = binding;
         binding = new Binding(this,function():*
         {
            return recoverPasswordLogin.text;
         },function(param1:*):void
         {
            _AccountManagement_Object4.login = param1;
         },"_AccountManagement_Object4.login");
         result[93] = binding;
         binding = new Binding(this,function():*
         {
            return DateField.dateToString(recoverUserBirthDate.selectedDate,"MM/DD/YYYY");
         },function(param1:*):void
         {
            _AccountManagement_Object4.dob = param1;
         },"_AccountManagement_Object4.dob");
         result[94] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.idServerUrl + "/user/flexrecoverpassword";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            recoverPasswordRequest.url = param1;
         },"recoverPasswordRequest.url");
         result[95] = binding;
         binding = new Binding(this,function():*
         {
            return recoverPasswordLogin.text;
         },function(param1:*):void
         {
            _AccountManagement_Object5.login = param1;
         },"_AccountManagement_Object5.login");
         result[96] = binding;
         binding = new Binding(this,function():*
         {
            return DateField.dateToString(recoverUserBirthDate.selectedDate,"MM/DD/YYYY");
         },function(param1:*):void
         {
            _AccountManagement_Object5.dob = param1;
         },"_AccountManagement_Object5.dob");
         result[97] = binding;
         binding = new Binding(this,function():*
         {
            return recoverPasswordAnswer;
         },function(param1:*):void
         {
            _AccountManagement_Object5.answer = param1;
         },"_AccountManagement_Object5.answer");
         result[98] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.idServerUrl + "/user/flexchangepassword";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            changePasswordRequest.url = param1;
         },"changePasswordRequest.url");
         result[99] = binding;
         binding = new Binding(this,function():*
         {
            return chosenChangedPassword.text;
         },function(param1:*):void
         {
            _AccountManagement_Object6.password = param1;
         },"_AccountManagement_Object6.password");
         result[100] = binding;
         binding = new Binding(this,function():*
         {
            return changePasswordOldPassword.text;
         },function(param1:*):void
         {
            _AccountManagement_Object6.oldpassword = param1;
         },"_AccountManagement_Object6.oldpassword");
         result[101] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.idServerUrl + "/user/flexlogout";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            logoutRequest.url = param1;
         },"logoutRequest.url");
         result[102] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.idServerUrl + "/user/flex_browse_users";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            browseUsersRequest.url = param1;
         },"browseUsersRequest.url");
         result[103] = binding;
         return result;
      }
      
      public function set createAccountViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._375940014createAccountViewStack;
         if(_loc2_ !== param1)
         {
            this._375940014createAccountViewStack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createAccountViewStack",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Form6_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_FormItem7_c());
         _loc1_.addChild(_AccountManagement_FormItem8_c());
         _loc1_.addChild(_AccountManagement_FormItem9_c());
         _loc1_.addChild(_AccountManagement_FormItem10_c());
         _loc1_.addChild(_AccountManagement_FormItem11_i());
         _loc1_.addChild(_AccountManagement_Label6_i());
         return _loc1_;
      }
      
      public function __createUserBirthYear_change(param1:Event) : void
      {
         processBirthYearChange(createUserBirthDate,createUserBirthYear);
      }
      
      private function _AccountManagement_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Sign in to My Game Builder... It\'s FREE!";
         _loc1_.setStyle("fontWeight","bold");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_StringValidator4_i() : StringValidator
      {
         var _loc1_:StringValidator = new StringValidator();
         validateChosenSecurityAnswer = _loc1_;
         _loc1_.property = "text";
         _loc1_.triggerEvent = "click";
         _loc1_.tooShortError = "Your Security Answer should have at least 3 characters";
         _loc1_.minLength = 3;
         _loc1_.required = true;
         BindingManager.executeBindings(this,"validateChosenSecurityAnswer",validateChosenSecurityAnswer);
         _loc1_.initialized(this,"validateChosenSecurityAnswer");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get validatePassword2() : StringValidator
      {
         return this._1632794753validatePassword2;
      }
      
      private function _AccountManagement_Button15_c() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _loc1_.y = 21;
         _loc1_.height = 19;
         _loc1_.label = "Back";
         _loc1_.setStyle("right","36");
         _loc1_.addEventListener("click",___AccountManagement_Button15_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __recoverUserBirthDate_change(param1:CalendarLayoutChangeEvent) : void
      {
         updateYearFromDateField(recoverUserBirthDate,recoverUserBirthYear);
      }
      
      public function set changePasswordPanel(param1:Panel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1814585945changePasswordPanel;
         if(_loc2_ !== param1)
         {
            this._1814585945changePasswordPanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"changePasswordPanel",_loc2_,param1));
         }
      }
      
      public function set recoveryQuestionAnswer(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._457328185recoveryQuestionAnswer;
         if(_loc2_ !== param1)
         {
            this._457328185recoveryQuestionAnswer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoveryQuestionAnswer",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_HBox15_c() : HBox
      {
         var _loc1_:HBox = null;
         _loc1_ = new HBox();
         _loc1_.setStyle("left","0");
         _loc1_.setStyle("right","0");
         _loc1_.setStyle("top","0");
         _loc1_.setStyle("bottom","0");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_VBox11_c());
         _loc1_.addChild(_AccountManagement_VBox12_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get recoverAccountViewStack() : ViewStack
      {
         return this._1021093702recoverAccountViewStack;
      }
      
      [Bindable(event="propertyChange")]
      private function get recoverPasswordAnswer() : String
      {
         return this._2036072637recoverPasswordAnswer;
      }
      
      private function _AccountManagement_TextInput16_i() : TextInput
      {
         var _loc1_:TextInput = null;
         _loc1_ = new TextInput();
         chosenSecurityAnswer = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.text = "";
         _loc1_.maxChars = 32;
         _loc1_.id = "chosenSecurityAnswer";
         BindingManager.executeBindings(this,"chosenSecurityAnswer",chosenSecurityAnswer);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_TextInput7_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         recoverPasswordLogin = _loc1_;
         _loc1_.width = 140;
         _loc1_.text = "";
         _loc1_.id = "recoverPasswordLogin";
         BindingManager.executeBindings(this,"recoverPasswordLogin",recoverPasswordLogin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_HTTPService6_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         changePasswordRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = _AccountManagement_Object6_i();
         _loc1_.addEventListener("result",__changePasswordRequest_result);
         _loc1_.addEventListener("fault",__changePasswordRequest_fault);
         BindingManager.executeBindings(this,"changePasswordRequest",changePasswordRequest);
         _loc1_.initialized(this,"changePasswordRequest");
         return _loc1_;
      }
      
      private function _AccountManagement_HBox6_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.x = 16;
         _loc1_.y = 16;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("horizontalGap",16);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_VBox5_c());
         _loc1_.addChild(_AccountManagement_Canvas6_c());
         return _loc1_;
      }
      
      private function _AccountManagement_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_AddChild3_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_VBox3_c);
         return _loc1_;
      }
      
      private function _AccountManagement_Object2_i() : Object
      {
         var _loc1_:Object = {"login":null};
         _AccountManagement_Object2 = _loc1_;
         BindingManager.executeBindings(this,"_AccountManagement_Object2",_AccountManagement_Object2);
         return _loc1_;
      }
      
      private function loginFaultHandler(param1:FaultEvent) : void
      {
         login.enabled = fLogin.enabled = fPassword.enabled = true;
         mgbLogger.logError("My Game Builder seems to be offline. Try logging in later. Error message was \'" + param1.fault.faultString + "\'",true);
      }
      
      public function goToTop(param1:Boolean = false) : void
      {
         if(currentState == "LoggedIn" || currentState == "ChangePassword")
         {
            if(param1)
            {
               pseudoLoginOldState = null;
            }
            if(!mgbSession.userLoggedInIsGuest)
            {
               Alert.show("Do you want to stop editing? Unsaved changes could be lost...","Stop Editing?",3,this,goToTopConfirmClickHandler);
            }
            else
            {
               goToTopConfirmClickHandler();
            }
         }
         else
         {
            currentState = "LoginPrompt";
         }
      }
      
      private function _AccountManagement_GridItem6_c() : GridItem
      {
         var _loc1_:GridItem = new GridItem();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput4_i());
         return _loc1_;
      }
      
      private function _AccountManagement_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Repeat the new Password";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_State8_c() : State
      {
         var _loc1_:State = null;
         _loc1_ = new State();
         _loc1_.name = "about";
         _loc1_.overrides = [_AccountManagement_AddChild11_c(),_AccountManagement_AddChild12_c()];
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get getUserStats() : HTTPService
      {
         return this._318832862getUserStats;
      }
      
      private function _AccountManagement_FormItem9_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Repeat the Password";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput13_i());
         return _loc1_;
      }
      
      private function clearPasswordFields() : void
      {
         if(chosenChangedPassword)
         {
            chosenChangedPassword.text = "";
         }
         if(chosenChangedPassword2)
         {
            chosenChangedPassword2.text = "";
         }
         if(changePasswordOldPassword)
         {
            changePasswordOldPassword.text = "";
         }
         if(fPassword)
         {
            fPassword.text = "";
         }
         if(recoverPasswordLogin)
         {
            recoverPasswordLogin.text = "";
         }
         if(recoverPasswordEmail)
         {
            recoverPasswordEmail.text = "";
         }
      }
      
      private function cancelChangePasssword() : void
      {
         clearPasswordFields();
         currentState = "LoggedIn";
      }
      
      public function set panelTabNav(param1:TabNavigator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1260204146panelTabNav;
         if(_loc2_ !== param1)
         {
            this._1260204146panelTabNav = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panelTabNav",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _AccountManagement_Text1 = _loc1_;
         _loc1_.text = "Viewing using Guest mode - can view but not save ";
         _loc1_.toolTip = "You are logged in as a guest. You may use the editor tools and run tutorials, but you may not save game pieces, nor will your tutorial/color settings be remembered. Enjoy your visit, and please sign up for an account later (Close Editor, then use the \'create account\' link on the Sign In page)";
         _loc1_.setStyle("fontFamily","titlefont");
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16711680);
         _loc1_.id = "_AccountManagement_Text1";
         BindingManager.executeBindings(this,"_AccountManagement_Text1",_AccountManagement_Text1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_TextInput6_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         fPassword = _loc1_;
         _loc1_.width = 144;
         _loc1_.text = "";
         _loc1_.displayAsPassword = true;
         _loc1_.setStyle("backgroundAlpha",0.85);
         _loc1_.id = "fPassword";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_StringValidator3_i() : StringValidator
      {
         var _loc1_:StringValidator = new StringValidator();
         validatePassword2 = _loc1_;
         _loc1_.property = "text";
         _loc1_.triggerEvent = "click";
         _loc1_.tooShortError = "Your password should have at least 5 characters";
         _loc1_.tooLongError = "Your password should be shorter than 21 characters";
         _loc1_.minLength = 5;
         _loc1_.maxLength = 20;
         _loc1_.required = true;
         BindingManager.executeBindings(this,"validatePassword2",validatePassword2);
         _loc1_.initialized(this,"validatePassword2");
         return _loc1_;
      }
      
      public function ___AccountManagement_LinkButton7_click(param1:MouseEvent) : void
      {
         doSignout();
      }
      
      private function _AccountManagement_Form5_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextArea2_c());
         _loc1_.addChild(_AccountManagement_FormItem6_i());
         return _loc1_;
      }
      
      public function ___AccountManagement_Button13_click(param1:MouseEvent) : void
      {
         pseudoLoginUsingViewMode(userBrowseList.selectedItem.login);
      }
      
      public function set changePasswordOldPassword(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1407498871changePasswordOldPassword;
         if(_loc2_ !== param1)
         {
            this._1407498871changePasswordOldPassword = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"changePasswordOldPassword",_loc2_,param1));
         }
      }
      
      public function set createUserBirthYear(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1918219659createUserBirthYear;
         if(_loc2_ !== param1)
         {
            this._1918219659createUserBirthYear = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createUserBirthYear",_loc2_,param1));
         }
      }
      
      public function __createRequest_fault(param1:FaultEvent) : void
      {
         faultHandler(param1);
      }
      
      public function set userBrowseList(param1:List) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._589839475userBrowseList;
         if(_loc2_ !== param1)
         {
            this._589839475userBrowseList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userBrowseList",_loc2_,param1));
         }
      }
      
      public function set recoverUserBirthDate(param1:DateField) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1501786498recoverUserBirthDate;
         if(_loc2_ !== param1)
         {
            this._1501786498recoverUserBirthDate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoverUserBirthDate",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_TextInput15_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         chosenEmail = _loc1_;
         _loc1_.width = 160;
         _loc1_.text = "";
         _loc1_.id = "chosenEmail";
         BindingManager.executeBindings(this,"chosenEmail",chosenEmail);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get checkRecoverQuestionRequest() : HTTPService
      {
         return this._1411288851checkRecoverQuestionRequest;
      }
      
      private function _AccountManagement_HTTPService5_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         recoverPasswordRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = _AccountManagement_Object5_i();
         _loc1_.addEventListener("result",__recoverPasswordRequest_result);
         _loc1_.addEventListener("fault",__recoverPasswordRequest_fault);
         BindingManager.executeBindings(this,"recoverPasswordRequest",recoverPasswordRequest);
         _loc1_.initialized(this,"recoverPasswordRequest");
         return _loc1_;
      }
      
      private function _AccountManagement_Button14_c() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _loc1_.y = 6;
         _loc1_.label = "Return to Sign in screen";
         _loc1_.setStyle("right","16");
         _loc1_.addEventListener("click",___AccountManagement_Button14_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 8;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get rememberMe() : CheckBox
      {
         return this._553550085rememberMe;
      }
      
      private function _AccountManagement_AddChild2_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_EditFooterComponent1_i);
         return _loc1_;
      }
      
      private function _AccountManagement_Object1_i() : Object
      {
         var _loc1_:Object = {
            "login":null,
            "password":null
         };
         _AccountManagement_Object1 = _loc1_;
         BindingManager.executeBindings(this,"_AccountManagement_Object1",_AccountManagement_Object1);
         return _loc1_;
      }
      
      private function _AccountManagement_HBox5_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Button1_c());
         _loc1_.addChild(_AccountManagement_LinkButton1_i());
         return _loc1_;
      }
      
      private function _AccountManagement_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Choose a new Password";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set accountmanagementBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2037278075accountmanagementBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._2037278075accountmanagementBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"accountmanagementBackgroundColor",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_GridItem5_c() : GridItem
      {
         var _loc1_:GridItem = new GridItem();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Label3_c());
         return _loc1_;
      }
      
      public function set chosenBrowseUser(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1089661575chosenBrowseUser;
         if(_loc2_ !== param1)
         {
            this._1089661575chosenBrowseUser = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenBrowseUser",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_TextInput5_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         fLogin = _loc1_;
         _loc1_.width = 144;
         _loc1_.setStyle("backgroundAlpha",0.85);
         _loc1_.id = "fLogin";
         BindingManager.executeBindings(this,"fLogin",fLogin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_State7_c() : State
      {
         var _loc1_:State = null;
         _loc1_ = new State();
         _loc1_.name = "BrowseAccounts";
         _loc1_.overrides = [_AccountManagement_AddChild10_c()];
         return _loc1_;
      }
      
      public function __createMe_click(param1:MouseEvent) : void
      {
         validateAndCreateAccount();
      }
      
      private function _AccountManagement_FormItem8_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Choose a Password";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput12_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get fPassword() : TextInput
      {
         return this._1604868385fPassword;
      }
      
      public function __userBrowseList_change(param1:ListEvent) : void
      {
         chosenBrowseUser.text = userBrowseList.selectedItem.user;
         loginBrowsePreviewBadge.setBadgeString(userBrowseList.selectedItem.badges);
      }
      
      private function _AccountManagement_HBox14_c() : HBox
      {
         var _loc1_:HBox = null;
         _loc1_ = new HBox();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Spacer5_c());
         _loc1_.addChild(_AccountManagement_Button9_i());
         _loc1_.addChild(_AccountManagement_Button10_i());
         _loc1_.addChild(_AccountManagement_Button11_i());
         _loc1_.addChild(_AccountManagement_LinkButton13_c());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get showMeSlowly() : Fade
      {
         return this._2058736931showMeSlowly;
      }
      
      public function __browseUsersRequest_result(param1:ResultEvent) : void
      {
         browseUsersResultHandler(param1);
      }
      
      private function _AccountManagement_Form4_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_FormItem5_c());
         return _loc1_;
      }
      
      public function set validatePassword2(param1:StringValidator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1632794753validatePassword2;
         if(_loc2_ !== param1)
         {
            this._1632794753validatePassword2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validatePassword2",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         showMeSlowly = _loc1_;
         _loc1_.duration = 260;
         return _loc1_;
      }
      
      private function _AccountManagement_Button13_i() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _AccountManagement_Button13 = _loc1_;
         _loc1_.width = 116;
         _loc1_.label = "Sneak a Peek...";
         _loc1_.x = 8;
         _loc1_.filters = [_AccountManagement_GlowFilter2_c()];
         _loc1_.addEventListener("click",___AccountManagement_Button13_click);
         _loc1_.id = "_AccountManagement_Button13";
         BindingManager.executeBindings(this,"_AccountManagement_Button13",_AccountManagement_Button13);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set createAccountMainArea(param1:VBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._584169111createAccountMainArea;
         if(_loc2_ !== param1)
         {
            this._584169111createAccountMainArea = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createAccountMainArea",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_HBox13_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Spacer4_c());
         _loc1_.addChild(_AccountManagement_Button6_i());
         _loc1_.addChild(_AccountManagement_Button7_i());
         _loc1_.addChild(_AccountManagement_Button8_i());
         _loc1_.addChild(_AccountManagement_LinkButton12_c());
         return _loc1_;
      }
      
      private function _AccountManagement_StringValidator2_i() : StringValidator
      {
         var _loc1_:StringValidator = new StringValidator();
         validatePassword = _loc1_;
         _loc1_.property = "text";
         _loc1_.triggerEvent = "click";
         _loc1_.tooShortError = "Your password should have at least 5 characters";
         _loc1_.tooLongError = "Your password should be shorter than 21 characters";
         _loc1_.minLength = 5;
         _loc1_.maxLength = 20;
         _loc1_.required = true;
         BindingManager.executeBindings(this,"validatePassword",validatePassword);
         _loc1_.initialized(this,"validatePassword");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get tileCopyAllowed() : CheckBox
      {
         return this._196675813tileCopyAllowed;
      }
      
      private function _AccountManagement_TextInput14_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         createUserBirthYear = _loc1_;
         _loc1_.width = 48;
         _loc1_.toolTip = "Year of Birth (eg 1992)";
         _loc1_.restrict = "0123456789";
         _loc1_.maxChars = 4;
         _loc1_.addEventListener("change",__createUserBirthYear_change);
         _loc1_.id = "createUserBirthYear";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get recoverPasswordPanel() : Panel
      {
         return this._1860522715recoverPasswordPanel;
      }
      
      private function filterUsersListFilterFunction(param1:Object) : Boolean
      {
         return currentNameFilterPattern == null ? true : String(param1.login).search(currentNameFilterPattern) != -1;
      }
      
      private function _AccountManagement_HTTPService4_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         checkRecoverQuestionRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = _AccountManagement_Object4_i();
         _loc1_.addEventListener("result",__checkRecoverQuestionRequest_result);
         _loc1_.addEventListener("fault",__checkRecoverQuestionRequest_fault);
         BindingManager.executeBindings(this,"checkRecoverQuestionRequest",checkRecoverQuestionRequest);
         _loc1_.initialized(this,"checkRecoverQuestionRequest");
         return _loc1_;
      }
      
      private function loginPreAuthenticatedUser() : void
      {
         mgbSession.userName = mgbSession.authenticatedName;
         mgbSession.activeProject = MgbSystem.defaultProject;
         currentState = "LoggedIn";
         Application.application.loadUserProfile();
         if(MgbSystem.welcomeMessages.length >= mgbSession.loginCount && mgbSession.loginCount > 0)
         {
            Alert.show(MgbSystem.welcomeMessages[mgbSession.loginCount - 1]," Welcome back ");
         }
         updateWithLoginInfo();
      }
      
      public function set recoverPasswordLogin(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1863806326recoverPasswordLogin;
         if(_loc2_ !== param1)
         {
            this._1863806326recoverPasswordLogin = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoverPasswordLogin",_loc2_,param1));
         }
      }
      
      public function __recoverUserBirthYear_change(param1:Event) : void
      {
         processBirthYearChange(recoverUserBirthDate,recoverUserBirthYear);
      }
      
      public function ___AccountManagement_LinkButton12_click(param1:MouseEvent) : void
      {
         cancelRecoverPasssword();
      }
      
      public function set recoveryQuestion(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1885291877recoveryQuestion;
         if(_loc2_ !== param1)
         {
            this._1885291877recoveryQuestion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoveryQuestion",_loc2_,param1));
         }
      }
      
      public function set fLogin(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1301197149fLogin;
         if(_loc2_ !== param1)
         {
            this._1301197149fLogin = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fLogin",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_HBox4_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Text2_c());
         _loc1_.addChild(_AccountManagement_TextInput1_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get newUserTooYoungForEmail() : Boolean
      {
         return this._1997617854newUserTooYoungForEmail;
      }
      
      private function set userNamesList(param1:Array) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1079811973userNamesList;
         if(_loc2_ !== param1)
         {
            this._1079811973userNamesList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userNamesList",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Enter your old password";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function goToTopConfirmClickHandler(param1:CloseEvent = null) : void
      {
         var _loc2_:Boolean = false;
         if(param1 == null || param1.detail == Alert.YES)
         {
            if("yes" != Application.application.getUserProfile("tileCopyAllowedFlag"))
            {
               Application.application.tileMaker.dpad.protectTileFromCopying();
            }
            Application.application.flushUserProfile(false);
            _loc2_ = Boolean(mgbSession.userLoggedInIsGuest);
            mgbSession.userName = null;
            enableLoginScreenSpecialEffects();
            currentState = _loc2_ ? (!!pseudoLoginOldState ? String(pseudoLoginOldState) : "BrowseAccounts") : "LoginPrompt";
            pseudoLoginOldState = null;
            mgbSession.navGotoHome();
            avatarPreview.drawDupe(null);
         }
      }
      
      private function _AccountManagement_GridItem4_c() : GridItem
      {
         var _loc1_:GridItem = new GridItem();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput3_i());
         return _loc1_;
      }
      
      private function _AccountManagement_AddChild1_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_VBox1_i);
         return _loc1_;
      }
      
      private function _AccountManagement_TextInput4_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         chosenChangedPassword2 = _loc1_;
         _loc1_.width = 140;
         _loc1_.displayAsPassword = true;
         _loc1_.id = "chosenChangedPassword2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_State6_c() : State
      {
         var _loc1_:State = null;
         _loc1_ = new State();
         _loc1_.name = "BrowseGames";
         _loc1_.overrides = [_AccountManagement_AddChild8_c(),_AccountManagement_AddChild9_c()];
         return _loc1_;
      }
      
      public function __login_click(param1:MouseEvent) : void
      {
         loginRequestSend();
      }
      
      private function _AccountManagement_FormItem7_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Choose a Username";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput11_i());
         return _loc1_;
      }
      
      private function _AccountManagement_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         mascot2 = _loc1_;
         _loc1_.id = "mascot2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AccountManagement_LinkButton1_click(param1:MouseEvent) : void
      {
         currentState = "ChangePassword";
      }
      
      private function _AccountManagement_Form3_c() : Form
      {
         var _loc1_:Form = new Form();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_FormItem3_c());
         _loc1_.addChild(_AccountManagement_FormItem4_i());
         return _loc1_;
      }
      
      private function _AccountManagement_StringValidator1_i() : StringValidator
      {
         var _loc1_:StringValidator = new StringValidator();
         validateLogin = _loc1_;
         _loc1_.property = "text";
         _loc1_.triggerEvent = "click";
         _loc1_.tooShortError = "Your user name should have at least 3 characters";
         _loc1_.tooLongError = "Your user name should be shorter than 21 characters";
         _loc1_.minLength = 3;
         _loc1_.maxLength = 20;
         _loc1_.required = true;
         BindingManager.executeBindings(this,"validateLogin",validateLogin);
         _loc1_.initialized(this,"validateLogin");
         return _loc1_;
      }
      
      private function _AccountManagement_VBox13_c() : VBox
      {
         var _loc1_:VBox = null;
         _loc1_ = new VBox();
         _loc1_.setStyle("verticalGap",0);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Text6_i());
         _loc1_.addChild(_AccountManagement_Text7_i());
         _loc1_.addChild(_AccountManagement_Spacer6_c());
         _loc1_.addChild(_AccountManagement_Button13_i());
         return _loc1_;
      }
      
      private function _AccountManagement_Button12_c() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _loc1_.y = 38;
         _loc1_.label = "Return to Sign in screen";
         _loc1_.setStyle("right","47");
         _loc1_.addEventListener("click",___AccountManagement_Button12_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function doSignout() : void
      {
         mgbSession.authenticatedName = null;
         this.currentState = "LoginPrompt";
         mgbSession.storedUsername = null;
         mgbSession.storedPassword = null;
         rememberMe.selected = false;
         logoutRequest.send();
      }
      
      public function __badgePanel_rollOver(param1:MouseEvent) : void
      {
         growBadgePanelSize();
      }
      
      [Bindable(event="propertyChange")]
      public function get recoverPasswordRequest() : HTTPService
      {
         return this._636834160recoverPasswordRequest;
      }
      
      private function logoutFaultHandler(param1:FaultEvent) : void
      {
         mgbLogger.logBug("Could not logout. Error message was \'" + param1.fault.faultString + "\'");
         logoutResultHandler();
      }
      
      public function set recoverAccountViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1021093702recoverAccountViewStack;
         if(_loc2_ !== param1)
         {
            this._1021093702recoverAccountViewStack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoverAccountViewStack",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = LoginBrowseUserPreviewControl;
         return _loc1_;
      }
      
      private function _AccountManagement_HBox12_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.addEventListener("creationComplete",___AccountManagement_HBox12_creationComplete);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_DateField1_i());
         _loc1_.addChild(_AccountManagement_TextInput8_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get validateChangedPassword() : StringValidator
      {
         return this._1332288889validateChangedPassword;
      }
      
      private function _AccountManagement_CheckBox2_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         rememberMe = _loc1_;
         _loc1_.label = "Remember Me";
         _loc1_.styleName = "denseTable";
         _loc1_.addEventListener("change",__rememberMe_change);
         _loc1_.id = "rememberMe";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_TextInput13_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         chosenPassword2 = _loc1_;
         _loc1_.width = 140;
         _loc1_.text = "";
         _loc1_.displayAsPassword = true;
         _loc1_.id = "chosenPassword2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get changePasswordButton() : Button
      {
         return this._35445117changePasswordButton;
      }
      
      private function _AccountManagement_HTTPService3_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         createRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = _AccountManagement_Object3_i();
         _loc1_.addEventListener("result",__createRequest_result);
         _loc1_.addEventListener("fault",__createRequest_fault);
         BindingManager.executeBindings(this,"createRequest",createRequest);
         _loc1_.initialized(this,"createRequest");
         return _loc1_;
      }
      
      public function set recoverPasswordEmail(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1870336323recoverPasswordEmail;
         if(_loc2_ !== param1)
         {
            this._1870336323recoverPasswordEmail = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoverPasswordEmail",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get ageDescription() : String
      {
         return this._1854509699ageDescription;
      }
      
      private function _AccountManagement_HBox3_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_BitmapDuper1_i());
         _loc1_.addChild(_AccountManagement_VBox2_c());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get mascot2() : Image
      {
         return this._839945609mascot2;
      }
      
      [Bindable(event="propertyChange")]
      public function get copyrights() : Text
      {
         return this._35060340copyrights;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbTutorial() : ActiveTutorial
      {
         return this._2139181690mgbTutorial;
      }
      
      private function _AccountManagement_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         chosenChangedPassword = _loc1_;
         _loc1_.width = 140;
         _loc1_.displayAsPassword = true;
         _loc1_.id = "chosenChangedPassword";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get mascot1() : Image
      {
         return this._839945608mascot1;
      }
      
      [Bindable(event="propertyChange")]
      private function get tutorialsPL() : PieceList
      {
         return this._1642894959tutorialsPL;
      }
      
      [Bindable(event="propertyChange")]
      public function get validateChosenSecurityAnswer() : StringValidator
      {
         return this._327124634validateChosenSecurityAnswer;
      }
      
      private function showCreateAccount() : void
      {
         currentState = "CreateAccount";
         createAccountViewStack.selectedIndex = 0;
         chosenLogin.text = "";
         chosenPassword.text = "";
         chosenPassword2.text = "";
         chosenEmail.text = "";
         createUserBirthDate.selectedDate = new Date(1999,1,1);
         updateYearFromDateField(createUserBirthDate,createUserBirthYear);
      }
      
      private function _AccountManagement_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         mascot1 = _loc1_;
         _loc1_.id = "mascot1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_FriendsList1_i() : FriendsList
      {
         var _loc1_:FriendsList = new FriendsList();
         _AccountManagement_FriendsList1 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "_AccountManagement_FriendsList1";
         BindingManager.executeBindings(this,"_AccountManagement_FriendsList1",_AccountManagement_FriendsList1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function doChooseBrowseUser(param1:String) : void
      {
         trace("do doChooseBrowseUser()..");
      }
      
      private function _AccountManagement_VBox9_c() : VBox
      {
         var _loc1_:VBox = new VBox();
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.setStyle("verticalCenter","-50");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Panel6_i());
         return _loc1_;
      }
      
      private function _AccountManagement_FormItem6_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         recoveryQuestion = _loc1_;
         _loc1_.label = "";
         _loc1_.id = "recoveryQuestion";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput10_i());
         return _loc1_;
      }
      
      private function _AccountManagement_State5_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "CreateAccount";
         _loc1_.overrides = [_AccountManagement_AddChild7_c(),_AccountManagement_SetProperty1_c()];
         return _loc1_;
      }
      
      private function _AccountManagement_GridItem3_c() : GridItem
      {
         var _loc1_:GridItem = new GridItem();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Label2_c());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get footer() : EditFooterComponent
      {
         return this._1268861541footer;
      }
      
      public function ___AccountManagement_LinkButton6_click(param1:MouseEvent) : void
      {
         loginPreAuthenticatedUser();
      }
      
      private function set mapsPL(param1:PieceList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1081358637mapsPL;
         if(_loc2_ !== param1)
         {
            this._1081358637mapsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapsPL",_loc2_,param1));
         }
      }
      
      private function set recoverPasswordAnswer(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2036072637recoverPasswordAnswer;
         if(_loc2_ !== param1)
         {
            this._2036072637recoverPasswordAnswer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoverPasswordAnswer",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         tileCopyAllowed = _loc1_;
         _loc1_.label = "Allow my tiles to be copied by other users";
         _loc1_.toolTip = "If this box is checked, other users are allowed to copy tiles out of your account and put them in their account (using Tile Maker\'s copy/paste feature between accounts). If this box is not checked, this is prevented (Tile Maker\'s undo and paste buffers will be cleared when the \'view account\' session is closed).";
         _loc1_.addEventListener("change",__tileCopyAllowed_change);
         _loc1_.id = "tileCopyAllowed";
         BindingManager.executeBindings(this,"tileCopyAllowed",tileCopyAllowed);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_TabNavigator1_i() : TabNavigator
      {
         var _loc1_:TabNavigator = new TabNavigator();
         panelTabNav = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("top","0");
         _loc1_.id = "panelTabNav";
         BindingManager.executeBindings(this,"panelTabNav",panelTabNav);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_FriendsList1_i());
         _loc1_.addChild(_AccountManagement_ProfileTab1_i());
         _loc1_.addChild(_AccountManagement_WallTab1_i());
         return _loc1_;
      }
      
      private function validateAndChangePassword() : void
      {
         var _loc2_:ValidationResultEvent = null;
         var _loc1_:Boolean = true;
         _loc2_ = validateChangedPassword.validate();
         if(_loc2_.type == "invalid")
         {
            _loc1_ = false;
         }
         _loc2_ = validateChangedPassword2.validate();
         if(_loc2_.type == "invalid")
         {
            _loc1_ = false;
         }
         _loc2_ = validateChangePasswordOldPassword.validate();
         if(_loc2_.type == "invalid")
         {
            _loc1_ = false;
         }
         if(_loc1_ && chosenChangedPassword.text != chosenChangedPassword2.text)
         {
            Alert.show("The two passwords must be the same");
            return;
         }
         if(_loc1_)
         {
            changePasswordRequest.send();
         }
         else
         {
            Alert.show("Cannot change password because there are errors in the data");
         }
      }
      
      private function _AccountManagement_ComboBox1_i() : ComboBox
      {
         var _loc1_:ComboBox = null;
         _loc1_ = new ComboBox();
         chosenSecurityQuestion = _loc1_;
         _loc1_.dataProvider = ["Name of first pet?","Favorite color?","Favorite band?","Favorite game?","Favorite food?","Favorite drink?"];
         _loc1_.id = "chosenSecurityQuestion";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_FormItem14_c() : FormItem
      {
         var _loc1_:FormItem = null;
         _loc1_ = new FormItem();
         _loc1_.label = "Your answer:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput16_i());
         return _loc1_;
      }
      
      private function _AccountManagement_HBox11_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.alpha = 0.7;
         _loc1_.height = 28;
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.setStyle("horizontalGap",8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_LinkButton10_c());
         _loc1_.addChild(_AccountManagement_VRule1_c());
         _loc1_.addChild(_AccountManagement_LinkButton11_c());
         return _loc1_;
      }
      
      public function set chosenSecurityQuestion(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._545553112chosenSecurityQuestion;
         if(_loc2_ !== param1)
         {
            this._545553112chosenSecurityQuestion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenSecurityQuestion",_loc2_,param1));
         }
      }
      
      public function __chosenLogin_change(param1:Event) : void
      {
         chosenLogin.text = chosenLogin.text.toLowerCase();
      }
      
      private function _AccountManagement_TextInput12_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         chosenPassword = _loc1_;
         _loc1_.width = 140;
         _loc1_.text = "";
         _loc1_.displayAsPassword = true;
         _loc1_.id = "chosenPassword";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get changePasswordRequest() : HTTPService
      {
         return this._1953139108changePasswordRequest;
      }
      
      private function _AccountManagement_HTTPService2_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         getUserStats = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = _AccountManagement_Object2_i();
         _loc1_.addEventListener("result",__getUserStats_result);
         _loc1_.addEventListener("fault",__getUserStats_fault);
         BindingManager.executeBindings(this,"getUserStats",getUserStats);
         _loc1_.initialized(this,"getUserStats");
         return _loc1_;
      }
      
      public function set getUserStats(param1:HTTPService) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._318832862getUserStats;
         if(_loc2_ !== param1)
         {
            this._318832862getUserStats = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"getUserStats",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_HBox2_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Panel1_i());
         _loc1_.addChild(_AccountManagement_Panel2_i());
         _loc1_.addChild(_AccountManagement_Panel3_i());
         return _loc1_;
      }
      
      private function _AccountManagement_Form2_i() : Form
      {
         var _loc1_:Form = new Form();
         _AccountManagement_Form2 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.id = "_AccountManagement_Form2";
         BindingManager.executeBindings(this,"_AccountManagement_Form2",_AccountManagement_Form2);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_FormItem1_c());
         _loc1_.addChild(_AccountManagement_FormItem2_c());
         return _loc1_;
      }
      
      private function _AccountManagement_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         changePasswordOldPassword = _loc1_;
         _loc1_.width = 140;
         _loc1_.displayAsPassword = true;
         _loc1_.id = "changePasswordOldPassword";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_LoginBrowseUserDetailControl1_i() : LoginBrowseUserDetailControl
      {
         var _loc1_:LoginBrowseUserDetailControl = null;
         _loc1_ = new LoginBrowseUserDetailControl();
         _AccountManagement_LoginBrowseUserDetailControl1 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "_AccountManagement_LoginBrowseUserDetailControl1";
         BindingManager.executeBindings(this,"_AccountManagement_LoginBrowseUserDetailControl1",_AccountManagement_LoginBrowseUserDetailControl1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_GridItem2_c() : GridItem
      {
         var _loc1_:GridItem = new GridItem();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput2_i());
         return _loc1_;
      }
      
      private function _AccountManagement_TextArea4_c() : TextArea
      {
         var _loc1_:TextArea = null;
         _loc1_ = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.editable = false;
         _loc1_.wordWrap = true;
         _loc1_.height = 96;
         _loc1_.htmlText = "Your password is <b>very</b> important - keep it safe and make sure you remember it. If you do forget it, we can give you a new password, but we will need a special question to be sure it is really you.";
         _loc1_.setStyle("borderStyle","none");
         _loc1_.setStyle("backgroundAlpha",0);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenPassword2() : TextInput
      {
         return this._1467610533chosenPassword2;
      }
      
      private function _AccountManagement_FormItem5_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Account\'s Email address?";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput9_i());
         return _loc1_;
      }
      
      private function _AccountManagement_State4_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "RecoverPassword";
         _loc1_.overrides = [_AccountManagement_AddChild6_c()];
         return _loc1_;
      }
      
      private function _AccountManagement_Button11_i() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         createMe = _loc1_;
         _loc1_.label = "Create My Account!";
         _loc1_.addEventListener("click",__createMe_click);
         _loc1_.id = "createMe";
         BindingManager.executeBindings(this,"createMe",createMe);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_LinkButton13_c() : LinkButton
      {
         var _loc1_:LinkButton = null;
         _loc1_ = new LinkButton();
         _loc1_.label = "Cancel create";
         _loc1_.setStyle("textDecoration","underline");
         _loc1_.addEventListener("click",___AccountManagement_LinkButton13_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set tileCopyAllowed(param1:CheckBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._196675813tileCopyAllowed;
         if(_loc2_ !== param1)
         {
            this._196675813tileCopyAllowed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tileCopyAllowed",_loc2_,param1));
         }
      }
      
      public function set checkRecoverQuestionRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1411288851checkRecoverQuestionRequest;
         if(_loc2_ !== param1)
         {
            this._1411288851checkRecoverQuestionRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"checkRecoverQuestionRequest",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_VBox12_i() : VBox
      {
         var _loc1_:VBox = null;
         _loc1_ = new VBox();
         _AccountManagement_VBox12 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "_AccountManagement_VBox12";
         BindingManager.executeBindings(this,"_AccountManagement_VBox12",_AccountManagement_VBox12);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_HBox17_c());
         _loc1_.addChild(_AccountManagement_LoginBrowseUserDetailControl1_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get userNamesListAC() : ArrayCollection
      {
         return this._1682781661userNamesListAC;
      }
      
      private function _AccountManagement_VBox8_i() : VBox
      {
         var _loc1_:VBox = new VBox();
         _AccountManagement_VBox8 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("verticalGap",0);
         _loc1_.id = "_AccountManagement_VBox8";
         BindingManager.executeBindings(this,"_AccountManagement_VBox8",_AccountManagement_VBox8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Label4_c());
         _loc1_.addChild(_AccountManagement_HBox8_c());
         _loc1_.addChild(_AccountManagement_HBox9_c());
         _loc1_.addChild(_AccountManagement_HBox10_c());
         return _loc1_;
      }
      
      public function set loginRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._788669158loginRequest;
         if(_loc2_ !== param1)
         {
            this._788669158loginRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loginRequest",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbLogger() : MgbLogger
      {
         return this._1260658248mgbLogger;
      }
      
      public function set createAccountPanel(param1:Panel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1225965837createAccountPanel;
         if(_loc2_ !== param1)
         {
            this._1225965837createAccountPanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createAccountPanel",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_VBox11_c() : VBox
      {
         var _loc1_:VBox = null;
         _loc1_ = new VBox();
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_List1_i());
         _loc1_.addChild(_AccountManagement_HBox16_c());
         return _loc1_;
      }
      
      private function _AccountManagement_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_VBox4_c());
         return _loc1_;
      }
      
      private function _AccountManagement_FormItem13_c() : FormItem
      {
         var _loc1_:FormItem = null;
         _loc1_ = new FormItem();
         _loc1_.label = "Choose a question:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_ComboBox1_i());
         return _loc1_;
      }
      
      public function __recoverPasswordRequest_result(param1:ResultEvent) : void
      {
         recoverPasswordResultHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get createUserBirthDate() : DateField
      {
         return this._1918848538createUserBirthDate;
      }
      
      private function rememberMeChanged() : void
      {
         if(rememberMe.selected == false)
         {
            mgbSession.storedUsername = null;
            mgbSession.storedPassword = null;
         }
      }
      
      private function restoreBadgePanelSize() : void
      {
         restorePanelQueued = false;
         if(panelResizeEffect.isPlaying)
         {
            restorePanelQueued = true;
         }
         else
         {
            badgePanel.width = origBadgePanelWidth;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get validateChangedPassword2() : StringValidator
      {
         return this._1648717351validateChangedPassword2;
      }
      
      private function _AccountManagement_GlowFilter2_c() : GlowFilter
      {
         var _loc1_:GlowFilter = null;
         _loc1_ = new GlowFilter();
         _loc1_.color = 0;
         _loc1_.alpha = 0.2;
         _loc1_.blurX = 4;
         _loc1_.blurY = 4;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get createRequest() : HTTPService
      {
         return this._952756749createRequest;
      }
      
      private function _AccountManagement_TextInput11_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         chosenLogin = _loc1_;
         _loc1_.width = 140;
         _loc1_.text = "";
         _loc1_.addEventListener("change",__chosenLogin_change);
         _loc1_.id = "chosenLogin";
         BindingManager.executeBindings(this,"chosenLogin",chosenLogin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function loadAndEditActor(param1:ListEvent) : void
      {
         var _loc2_:Object = param1.currentTarget.selectedItem;
         if(_loc2_)
         {
            mgbSession.navGotoActorMaker(_loc2_.name);
         }
      }
      
      private function _AccountManagement_HBox10_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Spacer3_c());
         _loc1_.addChild(_AccountManagement_LinkButton8_c());
         _loc1_.addChild(_AccountManagement_LinkButton9_c());
         return _loc1_;
      }
      
      private function _AccountManagement_HTTPService1_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         loginRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = _AccountManagement_Object1_i();
         _loc1_.addEventListener("result",__loginRequest_result);
         _loc1_.addEventListener("fault",__loginRequest_fault);
         BindingManager.executeBindings(this,"loginRequest",loginRequest);
         _loc1_.initialized(this,"loginRequest");
         return _loc1_;
      }
      
      private function processBirthYearChange(param1:DateField, param2:TextInput) : void
      {
         var _loc3_:Number = Number(param2.text);
         if(_loc3_ > 999)
         {
            if(_loc3_ < param1.minYear)
            {
               _loc3_ = param1.minYear;
            }
            if(_loc3_ > param1.maxYear)
            {
               _loc3_ = param1.maxYear;
            }
            trace("year is " + _loc3_);
            param1.selectedDate = new Date(_loc3_,param1.selectedDate.month,param1.selectedDate.date);
            trace("year is now " + param1.selectedDate.fullYear);
            param2.text = param1.selectedDate.fullYear.toString();
            processBirthDateKey(param1);
         }
      }
      
      public function ___AccountManagement_Button12_click(param1:MouseEvent) : void
      {
         currentState = "LoginPrompt";
      }
      
      private function _AccountManagement_LinkButton12_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.label = "Cancel - go back to Sign in page";
         _loc1_.setStyle("textDecoration","underline");
         _loc1_.addEventListener("click",___AccountManagement_LinkButton12_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Button10_i() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _AccountManagement_Button10 = _loc1_;
         _loc1_.label = "Back";
         _loc1_.addEventListener("click",___AccountManagement_Button10_click);
         _loc1_.id = "_AccountManagement_Button10";
         BindingManager.executeBindings(this,"_AccountManagement_Button10",_AccountManagement_Button10);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AccountManagement_LinkButton11_click(param1:MouseEvent) : void
      {
         this.currentState = "about";
      }
      
      private function _AccountManagement_HBox1_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Text1_i());
         return _loc1_;
      }
      
      public function set buttonsPanel(param1:Panel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1832051459buttonsPanel;
         if(_loc2_ !== param1)
         {
            this._1832051459buttonsPanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonsPanel",_loc2_,param1));
         }
      }
      
      private function checkRecoveryQuestionHandler(param1:ResultEvent) : void
      {
         if(1 == param1.result.status)
         {
            recoveryQuestion.label = param1.result.recoveryquestion;
            recoverAccountViewStack.selectedIndex = param1.result.recoveryquestion == "EMAIL" ? 1 : 2;
         }
         else
         {
            mgbLogger.logError(param1.result.message + ".  You need to correct the information before the password can be recovered",true);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logoutRequest() : HTTPService
      {
         return this._1124074917logoutRequest;
      }
      
      private function loadAndEditTile(param1:ListEvent) : void
      {
         var _loc2_:Object = param1.currentTarget.selectedItem;
         if(_loc2_)
         {
            mgbSession.navGotoTileMaker(_loc2_.name);
         }
      }
      
      public function set rememberMe(param1:CheckBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._553550085rememberMe;
         if(_loc2_ !== param1)
         {
            this._553550085rememberMe = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rememberMe",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myTileListEffect() : DefaultTileListEffect
      {
         return this._446328343myTileListEffect;
      }
      
      private function _AccountManagement_GridItem1_c() : GridItem
      {
         var _loc1_:GridItem = new GridItem();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Label1_c());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get validateChangePasswordOldPassword() : StringValidator
      {
         return this._1736620543validateChangePasswordOldPassword;
      }
      
      private function _AccountManagement_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         userStatusComment = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.text = "";
         _loc1_.maxChars = 32;
         _loc1_.toolTip = "Type a short comment here to describe yourself";
         _loc1_.addEventListener("change",__userStatusComment_change);
         _loc1_.id = "userStatusComment";
         BindingManager.executeBindings(this,"userStatusComment",userStatusComment);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_State3_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "LoginPrompt";
         _loc1_.overrides = [_AccountManagement_AddChild4_c(),_AccountManagement_AddChild5_c()];
         return _loc1_;
      }
      
      private function _AccountManagement_TextArea3_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _AccountManagement_TextArea3 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.wordWrap = true;
         _loc1_.height = 96;
         _loc1_.verticalScrollPolicy = "off";
         _loc1_.editable = false;
         _loc1_.enabled = false;
         _loc1_.setStyle("backgroundAlpha",0);
         _loc1_.setStyle("borderStyle","none");
         _loc1_.id = "_AccountManagement_TextArea3";
         BindingManager.executeBindings(this,"_AccountManagement_TextArea3",_AccountManagement_TextArea3);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Badge2_i() : Badge
      {
         var _loc1_:Badge = null;
         _loc1_ = new Badge();
         loginBrowsePreviewBadge = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.id = "loginBrowsePreviewBadge";
         BindingManager.executeBindings(this,"loginBrowsePreviewBadge",loginBrowsePreviewBadge);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get validatePassword() : StringValidator
      {
         return this._191218129validatePassword;
      }
      
      private function _AccountManagement_VBox7_c() : VBox
      {
         var _loc1_:VBox = new VBox();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Panel5_i());
         _loc1_.addChild(_AccountManagement_Canvas5_c());
         return _loc1_;
      }
      
      private function _AccountManagement_FormItem4_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _AccountManagement_FormItem4 = _loc1_;
         _loc1_.label = "Your date of birth";
         _loc1_.id = "_AccountManagement_FormItem4";
         BindingManager.executeBindings(this,"_AccountManagement_FormItem4",_AccountManagement_FormItem4);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_HBox12_c());
         return _loc1_;
      }
      
      public function set recoverUserBirthYear(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1501157619recoverUserBirthYear;
         if(_loc2_ !== param1)
         {
            this._1501157619recoverUserBirthYear = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoverUserBirthYear",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_About1_c() : About
      {
         var _loc1_:About = null;
         _loc1_ = new About();
         _loc1_.setStyle("left","16");
         _loc1_.setStyle("right","16");
         _loc1_.setStyle("top","16");
         _loc1_.setStyle("bottom","16");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function processBirthDateKey(param1:DateField) : void
      {
         var _loc6_:Date = null;
         var _loc7_:Number = NaN;
         var _loc2_:Date = new Date();
         var _loc3_:Number = param1.selectedDate.getFullYear();
         var _loc4_:Number = param1.selectedDate.getMonth();
         var _loc5_:Number = param1.selectedDate.getDay();
         if(_loc3_ < 1971)
         {
            ageDescription = "You are *quite* old :)";
            newUserTooYoungForEmail = false;
         }
         else
         {
            _loc7_ = (_loc6_ = new Date(_loc2_.getTime() - param1.selectedDate.getTime())).getFullYear() - 1970;
            ageDescription = "You are " + _loc7_ + " years old";
            newUserTooYoungForEmail = _loc7_ > 12 ? false : true;
         }
      }
      
      private function chooseRandomMascot() : void
      {
         setMascot(Math.random() * mascots.length);
      }
      
      private function _AccountManagement_BitmapDuper1_i() : BitmapDuper
      {
         var _loc1_:BitmapDuper = new BitmapDuper();
         avatarPreview = _loc1_;
         _loc1_.width = 64;
         _loc1_.height = 64;
         _loc1_.doubleClickEnabled = true;
         _loc1_.addEventListener("doubleClick",__avatarPreview_doubleClick);
         _loc1_.id = "avatarPreview";
         BindingManager.executeBindings(this,"avatarPreview",avatarPreview);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function initControl() : void
      {
         Application.application.registerForProfileUpdates(applyProfile);
         MgbGlobalEventer.getInstance().addEventListener(PieceChangedEvent.CHANGE,processPieceChange);
         browseUsersRequest.send();
         enableLoginScreenSpecialEffects();
         chooseRandomMascot();
         loadSessionState();
      }
      
      public function set chosenLogin(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1695011607chosenLogin;
         if(_loc2_ !== param1)
         {
            this._1695011607chosenLogin = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenLogin",_loc2_,param1));
         }
      }
      
      private function validateAndCreateAccount() : void
      {
         var _loc2_:ValidationResultEvent = null;
         var _loc1_:Boolean = true;
         _loc2_ = validateLogin.validate();
         if(_loc2_.type == "invalid")
         {
            _loc1_ = false;
         }
         _loc2_ = validatePassword.validate();
         if(_loc2_.type == "invalid")
         {
            _loc1_ = false;
         }
         _loc2_ = validatePassword2.validate();
         if(_loc2_.type == "invalid")
         {
            _loc1_ = false;
         }
         if(this.newUserTooYoungForEmail)
         {
            _loc2_ = validateChosenSecurityAnswer.validate();
            if(_loc2_.type == "invalid")
            {
               _loc1_ = false;
            }
         }
         else
         {
            _loc2_ = validateEmail.validate();
            if(_loc2_.type == "invalid")
            {
               _loc1_ = false;
            }
         }
         if(_loc1_ && chosenPassword.text != chosenPassword2.text)
         {
            Alert.show("The two passwords must be the same");
            return;
         }
         if(_loc1_)
         {
            createRequest.send();
         }
         else
         {
            Alert.show("You need to provide more information first - please correct the choices marked in red");
         }
      }
      
      private function cancelRecoverPasssword() : void
      {
         clearPasswordFields();
         currentState = "LoginPrompt";
      }
      
      private function _AccountManagement_VBox10_i() : VBox
      {
         var _loc1_:VBox = new VBox();
         createAccountMainArea = _loc1_;
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.setStyle("verticalCenter","-50");
         _loc1_.id = "createAccountMainArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Panel7_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get loggedinMainVbox() : VBox
      {
         return this._334368309loggedinMainVbox;
      }
      
      private function _AccountManagement_TextInput10_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         recoveryQuestionAnswer = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.text = "";
         _loc1_.maxChars = 32;
         _loc1_.id = "recoveryQuestionAnswer";
         BindingManager.executeBindings(this,"recoveryQuestionAnswer",recoveryQuestionAnswer);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get recoveryQuestionAnswer() : TextInput
      {
         return this._457328185recoveryQuestionAnswer;
      }
      
      private function _AccountManagement_GlowFilter1_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 65280;
         _loc1_.alpha = 0.6;
         _loc1_.blurX = 16;
         _loc1_.blurY = 16;
         return _loc1_;
      }
      
      private function _AccountManagement_LinkButton11_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.label = "About";
         _loc1_.setStyle("fontSize",15);
         _loc1_.addEventListener("click",___AccountManagement_LinkButton11_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_FormItem12_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _AccountManagement_FormItem12 = _loc1_;
         _loc1_.label = "Your email address";
         _loc1_.id = "_AccountManagement_FormItem12";
         BindingManager.executeBindings(this,"_AccountManagement_FormItem12",_AccountManagement_FormItem12);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput15_i());
         return _loc1_;
      }
      
      public function ___AccountManagement_Button9_click(param1:MouseEvent) : void
      {
         createAccountViewStack.selectedIndex = !!newUserTooYoungForEmail ? 2 : 1;
      }
      
      private function _AccountManagement_Button9_i() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _AccountManagement_Button9 = _loc1_;
         _loc1_.label = "Next";
         _loc1_.addEventListener("click",___AccountManagement_Button9_click);
         _loc1_.id = "_AccountManagement_Button9";
         BindingManager.executeBindings(this,"_AccountManagement_Button9",_AccountManagement_Button9);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Badge1_i() : Badge
      {
         var _loc1_:Badge = new Badge();
         badge = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "badge";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function updateBrowseUserGrepFilters() : void
      {
         currentNameFilterPattern = chosenBrowseUser == null ? null : new RegExp(".*" + chosenBrowseUser.text + ".*","i");
         userNamesListAC.filterFunction = filterUsersListFilterFunction;
         userNamesListAC.refresh();
      }
      
      public function set fPassword(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1604868385fPassword;
         if(_loc2_ !== param1)
         {
            this._1604868385fPassword = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fPassword",_loc2_,param1));
         }
      }
      
      public function set recoverPasswordPanel(param1:Panel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1860522715recoverPasswordPanel;
         if(_loc2_ !== param1)
         {
            this._1860522715recoverPasswordPanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoverPasswordPanel",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_DefaultTileListEffect1_i() : DefaultTileListEffect
      {
         var _loc1_:DefaultTileListEffect = new DefaultTileListEffect();
         myTileListEffect = _loc1_;
         _loc1_.fadeOutDuration = 400;
         _loc1_.fadeInDuration = 400;
         _loc1_.moveDuration = 1200;
         return _loc1_;
      }
      
      public function set showMeSlowly(param1:Fade) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2058736931showMeSlowly;
         if(_loc2_ !== param1)
         {
            this._2058736931showMeSlowly = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showMeSlowly",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_TextArea2_c() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.editable = false;
         _loc1_.wordWrap = true;
         _loc1_.htmlText = "Please answer your personal security question";
         _loc1_.setStyle("borderStyle","none");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function processPieceChange(param1:PieceChangedEvent) : void
      {
         if(param1.piece == mgbSession.avatarTile)
         {
            avatarPreview.drawDupe(mgbSession.avatarTile.bitmapData);
         }
      }
      
      private function _AccountManagement_State2_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "ChangePassword";
         _loc1_.overrides = [_AccountManagement_AddChild3_c()];
         return _loc1_;
      }
      
      private function _AccountManagement_VBox6_c() : VBox
      {
         var _loc1_:VBox = new VBox();
         _loc1_.setStyle("verticalGap",0);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_LinkButton3_c());
         _loc1_.addChild(_AccountManagement_LinkButton4_c());
         _loc1_.addChild(_AccountManagement_LinkButton5_c());
         return _loc1_;
      }
      
      private function _AccountManagement_FormItem3_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Username";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput7_i());
         return _loc1_;
      }
      
      private function applyProfile(param1:Event = null) : void
      {
         if(userStatusComment)
         {
            userStatusComment.text = Application.application.getUserProfile("userStatusComment");
         }
         if(tileCopyAllowed)
         {
            tileCopyAllowed.selected = "yes" == Application.application.getUserProfile("tileCopyAllowedFlag");
         }
      }
      
      private function updateYearFromDateField(param1:DateField, param2:TextInput) : void
      {
         param2.text = Number(param1.selectedDate.fullYear).toString();
         processBirthDateKey(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get changePasswordPanel() : Panel
      {
         return this._1814585945changePasswordPanel;
      }
      
      private function createAccountResultHandler(param1:ResultEvent) : void
      {
         if(1 == param1.result.status)
         {
            mgbSession.authenticatedName = chosenLogin.text;
            mgbSession.userName = chosenLogin.text;
            mgbSession.activeProject = MgbSystem.defaultProject;
            Application.application.createAndSaveInitialUserProfile();
            fLogin.text = chosenLogin.text;
            currentState = "LoggedIn";
            updateWithLoginInfo();
            mgbSession.userLoggedInForTheFirstTimeEver = true;
            browseUsersRequest.send();
         }
         else
         {
            mgbLogger.logError("Could not create user \'" + chosenLogin.text + "\': " + param1.result.message,true);
         }
      }
      
      public function ___AccountManagement_LinkButton5_click(param1:MouseEvent) : void
      {
         if(mgbSession.authenticatedName)
         {
            loginPreAuthenticatedUser();
         }
         else
         {
            showCreateAccount();
         }
      }
      
      public function set chosenSecurityAnswer(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1361865936chosenSecurityAnswer;
         if(_loc2_ !== param1)
         {
            this._1361865936chosenSecurityAnswer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenSecurityAnswer",_loc2_,param1));
         }
      }
      
      public function set browseUsersRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1978146577browseUsersRequest;
         if(_loc2_ !== param1)
         {
            this._1978146577browseUsersRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"browseUsersRequest",_loc2_,param1));
         }
      }
      
      public function __userStatusComment_change(param1:Event) : void
      {
         saveUpdatedUserStatusComment();
      }
      
      private function _AccountManagement_FormItem11_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _AccountManagement_FormItem11 = _loc1_;
         _loc1_.label = "Your date of birth";
         _loc1_.id = "_AccountManagement_FormItem11";
         BindingManager.executeBindings(this,"_AccountManagement_FormItem11",_AccountManagement_FormItem11);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_DateField2_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get createUserBirthYear() : TextInput
      {
         return this._1918219659createUserBirthYear;
      }
      
      [Bindable(event="propertyChange")]
      public function get changePasswordOldPassword() : TextInput
      {
         return this._1407498871changePasswordOldPassword;
      }
      
      public function __recoverPasswordRequest_fault(param1:FaultEvent) : void
      {
         faultHandler(param1);
      }
      
      private function playSelectedGame(param1:String, param2:String, param3:String) : void
      {
         pseudoLoginUsingViewMode(param1,param2,param3);
      }
      
      private function _AccountManagement_Button8_i() : Button
      {
         var _loc1_:Button = new Button();
         _AccountManagement_Button8 = _loc1_;
         _loc1_.label = "Recover my password";
         _loc1_.addEventListener("click",___AccountManagement_Button8_click);
         _loc1_.id = "_AccountManagement_Button8";
         BindingManager.executeBindings(this,"_AccountManagement_Button8",_AccountManagement_Button8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_LinkButton9_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.label = "Recover password";
         _loc1_.setStyle("color",128);
         _loc1_.setStyle("textDecoration","underline");
         _loc1_.addEventListener("click",___AccountManagement_LinkButton9_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_HRule2_c() : HRule
      {
         var _loc1_:HRule = new HRule();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function enableLoginScreenSpecialEffects(param1:Boolean = true) : void
      {
         if(reflection)
         {
            reflection.enableReflection(param1);
         }
         if(screenshots)
         {
            screenshots.enableDisplay(param1);
         }
      }
      
      public function ___AccountManagement_GamesBrowser1_playGame(param1:GamesBrowserEvent) : void
      {
         playSelectedGame(param1.username,param1.project,param1.map);
      }
      
      [Bindable(event="propertyChange")]
      public function get recoverPasswordLogin() : TextInput
      {
         return this._1863806326recoverPasswordLogin;
      }
      
      private function set newUserTooYoungForEmail(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1997617854newUserTooYoungForEmail;
         if(_loc2_ !== param1)
         {
            this._1997617854newUserTooYoungForEmail = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newUserTooYoungForEmail",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_LinkButton10_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.label = "Forum";
         _loc1_.setStyle("fontSize",15);
         _loc1_.addEventListener("click",___AccountManagement_LinkButton10_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_TextArea1_c() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.text = "To recover your password just fill in these two pages...";
         _loc1_.wordWrap = true;
         _loc1_.height = 22;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("borderStyle","none");
         _loc1_.setStyle("paddingLeft",4);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_FormItem2_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Password";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput6_i());
         return _loc1_;
      }
      
      private function _AccountManagement_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "LoggedIn";
         _loc1_.overrides = [_AccountManagement_AddChild1_c(),_AccountManagement_AddChild2_c()];
         return _loc1_;
      }
      
      private function _AccountManagement_SetProperty1_c() : SetProperty
      {
         var _loc1_:SetProperty = null;
         _loc1_ = new SetProperty();
         _loc1_.name = "toolTip";
         _loc1_.value = "Go back to Sign in page";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get accountmanagementBackgroundColor() : SelectBackgroundColor
      {
         return this._2037278075accountmanagementBackgroundColor;
      }
      
      private function recoverPasswordResultHandler(param1:ResultEvent) : void
      {
         if(1 == param1.result.status)
         {
            if(param1.result.sentbyemail == 1)
            {
               mgbLogger.logInfo("Your new password has been sent to your email at " + recoverPasswordEmail.text,true);
            }
            else
            {
               Alert.show("Your new Password has been changed to \'" + param1.result.newpassword + "\'. YOU SHOULD WRITE THIS DOWN AND THEN LOG IN WITH THIS PASSWORD. THEN, CHANGE YOUR PASSWORD USING THE \'CHANGE PASSWORD\' BUTTON ON THE \'ME\' PAGE");
            }
            currentState = "LoginPrompt";
            clearPasswordFields();
         }
         else
         {
            mgbLogger.logError("Could not recover password: " + param1.result.message,true);
         }
      }
      
      private function _AccountManagement_VBox5_c() : VBox
      {
         var _loc1_:VBox = new VBox();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Text4_c());
         _loc1_.addChild(_AccountManagement_HBox7_c());
         _loc1_.addChild(_AccountManagement_VBox7_c());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get createAccountMainArea() : VBox
      {
         return this._584169111createAccountMainArea;
      }
      
      private function _AccountManagement_Panel8_i() : Panel
      {
         var _loc1_:Panel = null;
         _loc1_ = new Panel();
         _AccountManagement_Panel8 = _loc1_;
         _loc1_.styleName = "cleanPanel";
         _loc1_.layout = "absolute";
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.id = "_AccountManagement_Panel8";
         BindingManager.executeBindings(this,"_AccountManagement_Panel8",_AccountManagement_Panel8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_HBox15_c());
         return _loc1_;
      }
      
      private function _AccountManagement_Canvas8_c() : Canvas
      {
         var _loc1_:Canvas = null;
         _loc1_ = new Canvas();
         _loc1_.autoLayout = true;
         _loc1_.setStyle("left","32");
         _loc1_.setStyle("right","32");
         _loc1_.setStyle("top","32");
         _loc1_.setStyle("bottom","32");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Panel8_i());
         _loc1_.addChild(_AccountManagement_Button14_c());
         return _loc1_;
      }
      
      public function __userBrowseList_doubleClick(param1:MouseEvent) : void
      {
         doChooseBrowseUser(chosenBrowseUser.text);
      }
      
      [Bindable(event="propertyChange")]
      public function get recoverUserBirthDate() : DateField
      {
         return this._1501786498recoverUserBirthDate;
      }
      
      private function _AccountManagement_LinkButton8_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.label = "Create new account";
         _loc1_.setStyle("color",128);
         _loc1_.setStyle("textDecoration","underline");
         _loc1_.addEventListener("click",___AccountManagement_LinkButton8_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set chosenEmail(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1688481610chosenEmail;
         if(_loc2_ !== param1)
         {
            this._1688481610chosenEmail = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenEmail",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fLogin() : TextInput
      {
         return this._1301197149fLogin;
      }
      
      private function _AccountManagement_FormItem10_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Year of birth";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput14_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get recoveryQuestion() : FormItem
      {
         return this._1885291877recoveryQuestion;
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenBrowseUser() : TextInput
      {
         return this._1089661575chosenBrowseUser;
      }
      
      private function growBadgePanelSize() : void
      {
         growPanelQueued = false;
         if(panelResizeEffect.isPlaying)
         {
            growPanelQueued = true;
         }
         else
         {
            if(origBadgePanelWidth == -1)
            {
               origBadgePanelWidth = badgePanel.width;
            }
            badgePanel.percentWidth = 100;
            personPanel.visible = personPanel.includeInLayout = false;
            buttonsPanel.visible = buttonsPanel.includeInLayout = false;
         }
      }
      
      public function ___AccountManagement_Button3_click(param1:MouseEvent) : void
      {
         ShowSpaceUsage.createMe(parent);
      }
      
      [Bindable(event="propertyChange")]
      public function get recoverPasswordEmail() : TextInput
      {
         return this._1870336323recoverPasswordEmail;
      }
      
      public function __getUserStats_result(param1:ResultEvent) : void
      {
         getUserStatsResultHandler(param1);
      }
      
      private function _AccountManagement_HRule1_c() : HRule
      {
         var _loc1_:HRule = new HRule();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Button7_i() : Button
      {
         var _loc1_:Button = new Button();
         _AccountManagement_Button7 = _loc1_;
         _loc1_.label = "Back";
         _loc1_.addEventListener("click",___AccountManagement_Button7_click);
         _loc1_.id = "_AccountManagement_Button7";
         BindingManager.executeBindings(this,"_AccountManagement_Button7",_AccountManagement_Button7);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function faultHandler(param1:FaultEvent) : void
      {
         mgbLogger.logError("My Game Builder seems to be offline. Try again later. Error message was \'" + param1.fault.faultString + "\'",true);
      }
      
      private function setMascot(param1:int) : void
      {
         if(param1 < mascots.length)
         {
            mascot1.source = mascotBaseURL + mascots[param1].image1;
            mascot1.toolTip = mascots[param1].message1;
            mascot2.source = mascotBaseURL + mascots[param1].image2;
            mascot2.toolTip = mascots[param1].message2;
         }
      }
      
      private function _AccountManagement_Panel7_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         createAccountPanel = _loc1_;
         _loc1_.styleName = "cleanPanel";
         _loc1_.title = "Create your MyGameBuilder.com account";
         _loc1_.width = 400;
         _loc1_.setStyle("paddingTop",2);
         _loc1_.setStyle("paddingBottom",4);
         _loc1_.id = "createAccountPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Label5_c());
         _loc1_.addChild(_AccountManagement_HRule2_c());
         _loc1_.addChild(_AccountManagement_ViewStack2_i());
         _loc1_.addChild(_AccountManagement_HBox14_c());
         return _loc1_;
      }
      
      public function set validateChosenSecurityAnswer(param1:StringValidator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._327124634validateChosenSecurityAnswer;
         if(_loc2_ !== param1)
         {
            this._327124634validateChosenSecurityAnswer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validateChosenSecurityAnswer",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_VBox4_c() : VBox
      {
         var _loc1_:VBox = new VBox();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Text3_i());
         _loc1_.addChild(_AccountManagement_Grid1_c());
         return _loc1_;
      }
      
      private function _AccountManagement_FormItem1_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Username";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextInput5_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenSecurityQuestion() : ComboBox
      {
         return this._545553112chosenSecurityQuestion;
      }
      
      public function set login(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._103149417login;
         if(_loc2_ !== param1)
         {
            this._103149417login = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"login",_loc2_,param1));
         }
      }
      
      public function set recoverPasswordRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._636834160recoverPasswordRequest;
         if(_loc2_ !== param1)
         {
            this._636834160recoverPasswordRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recoverPasswordRequest",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_LinkButton7_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.label = "Sign Out";
         _loc1_.styleName = "standoutLarge";
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.setStyle("bottom","32");
         _loc1_.setStyle("color",128);
         _loc1_.setStyle("textDecoration","underline");
         _loc1_.addEventListener("click",___AccountManagement_LinkButton7_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get mapsPL() : PieceList
      {
         return this._1081358637mapsPL;
      }
      
      private function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loginRequest() : HTTPService
      {
         return this._788669158loginRequest;
      }
      
      public function ___AccountManagement_Canvas7_click(param1:MouseEvent) : void
      {
         chooseRandomMascot();
      }
      
      private function _AccountManagement_Canvas7_c() : Canvas
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 16;
         _loc1_.height = 16;
         _loc1_.setStyle("backgroundAlpha",1);
         _loc1_.addEventListener("click",___AccountManagement_Canvas7_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AccountManagement_LinkButton10_click(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest("http://mygamebuilder.com/forum"),"forum");
      }
      
      public function set validateChangedPassword(param1:StringValidator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1332288889validateChangedPassword;
         if(_loc2_ !== param1)
         {
            this._1332288889validateChangedPassword = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validateChangedPassword",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get createAccountPanel() : Panel
      {
         return this._1225965837createAccountPanel;
      }
      
      public function __changePasswordRequest_result(param1:ResultEvent) : void
      {
         changePasswordResultHandler(param1);
      }
      
      private function _AccountManagement_VRule1_c() : VRule
      {
         var _loc1_:VRule = new VRule();
         _loc1_.alpha = 1;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_ProfileTab1_i() : ProfileTab
      {
         var _loc1_:ProfileTab = new ProfileTab();
         _AccountManagement_ProfileTab1 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "_AccountManagement_ProfileTab1";
         BindingManager.executeBindings(this,"_AccountManagement_ProfileTab1",_AccountManagement_ProfileTab1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function logoutResultHandler(param1:ResultEvent = null) : void
      {
      }
      
      private function _AccountManagement_Button6_i() : Button
      {
         var _loc1_:Button = new Button();
         _AccountManagement_Button6 = _loc1_;
         _loc1_.label = "Next";
         _loc1_.addEventListener("click",___AccountManagement_Button6_click);
         _loc1_.id = "_AccountManagement_Button6";
         BindingManager.executeBindings(this,"_AccountManagement_Button6",_AccountManagement_Button6);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AccountManagement_Button8_click(param1:MouseEvent) : void
      {
         doRecoverPassword();
      }
      
      public function set changePasswordButton(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._35445117changePasswordButton;
         if(_loc2_ !== param1)
         {
            this._35445117changePasswordButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"changePasswordButton",_loc2_,param1));
         }
      }
      
      private function set mgbTutorial(param1:ActiveTutorial) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2139181690mgbTutorial;
         if(_loc2_ !== param1)
         {
            this._2139181690mgbTutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbTutorial",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get recoverUserBirthYear() : TextInput
      {
         return this._1501157619recoverUserBirthYear;
      }
      
      public function set mascot1(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._839945608mascot1;
         if(_loc2_ !== param1)
         {
            this._839945608mascot1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mascot1",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_EditFooterComponent1_i() : EditFooterComponent
      {
         var _loc1_:EditFooterComponent = new EditFooterComponent();
         footer = _loc1_;
         _loc1_.x = 0;
         _loc1_.setStyle("bottom","0");
         _loc1_.id = "footer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_VBox3_c() : VBox
      {
         var _loc1_:VBox = new VBox();
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.setStyle("verticalCenter","-50");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Panel4_i());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenLogin() : TextInput
      {
         return this._1695011607chosenLogin;
      }
      
      [Bindable(event="propertyChange")]
      public function get browseUsersRequest() : HTTPService
      {
         return this._1978146577browseUsersRequest;
      }
      
      private function _AccountManagement_Panel6_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         recoverPasswordPanel = _loc1_;
         _loc1_.styleName = "cleanPanel";
         _loc1_.title = "Recover your MyGameBuilder.com password";
         _loc1_.id = "recoverPasswordPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_TextArea1_c());
         _loc1_.addChild(_AccountManagement_HRule1_c());
         _loc1_.addChild(_AccountManagement_ViewStack1_i());
         _loc1_.addChild(_AccountManagement_HBox13_c());
         return _loc1_;
      }
      
      private function _AccountManagement_Canvas6_c() : Canvas
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalScrollPolicy = "off";
         _loc1_.horizontalScrollPolicy = "off";
         _loc1_.minWidth = 460;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_HBox11_c());
         _loc1_.addChild(_AccountManagement_ScreenShotAndAd1_i());
         return _loc1_;
      }
      
      private function set ageDescription(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1854509699ageDescription;
         if(_loc2_ !== param1)
         {
            this._1854509699ageDescription = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ageDescription",_loc2_,param1));
         }
      }
      
      public function set copyrights(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._35060340copyrights;
         if(_loc2_ !== param1)
         {
            this._35060340copyrights = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"copyrights",_loc2_,param1));
         }
      }
      
      public function set mascot2(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._839945609mascot2;
         if(_loc2_ !== param1)
         {
            this._839945609mascot2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mascot2",_loc2_,param1));
         }
      }
      
      public function ___AccountManagement_LinkButton4_click(param1:MouseEvent) : void
      {
         currentState = "BrowseAccounts";
      }
      
      private function saveUpdatedUserStatusComment() : void
      {
         Application.application.updateUserProfile("userStatusComment",userStatusComment.text);
         userStatusComment.focusEnabled = false;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonsPanel() : Panel
      {
         return this._1832051459buttonsPanel;
      }
      
      private function _AccountManagement_LinkButton6_i() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _AccountManagement_LinkButton6 = _loc1_;
         _loc1_.styleName = "standoutLarge";
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.setStyle("top","32");
         _loc1_.setStyle("color",128);
         _loc1_.setStyle("textDecoration","underline");
         _loc1_.addEventListener("click",___AccountManagement_LinkButton6_click);
         _loc1_.id = "_AccountManagement_LinkButton6";
         BindingManager.executeBindings(this,"_AccountManagement_LinkButton6",_AccountManagement_LinkButton6);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __logoutRequest_fault(param1:FaultEvent) : void
      {
         logoutFaultHandler(param1);
      }
      
      private function set tutorialsPL(param1:PieceList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1642894959tutorialsPL;
         if(_loc2_ !== param1)
         {
            this._1642894959tutorialsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialsPL",_loc2_,param1));
         }
      }
      
      public function set panelResizeEffect(param1:Resize) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1199152247panelResizeEffect;
         if(_loc2_ !== param1)
         {
            this._1199152247panelResizeEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panelResizeEffect",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_AddChild12_c() : AddChild
      {
         var _loc1_:AddChild = null;
         _loc1_ = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_Button15_c);
         return _loc1_;
      }
      
      public function ___AccountManagement_Button10_click(param1:MouseEvent) : void
      {
         createAccountViewStack.selectedIndex = 0;
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenSecurityAnswer() : TextInput
      {
         return this._1361865936chosenSecurityAnswer;
      }
      
      public function set footer(param1:EditFooterComponent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1268861541footer;
         if(_loc2_ !== param1)
         {
            this._1268861541footer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"footer",_loc2_,param1));
         }
      }
      
      private function set actorsPL(param1:PieceList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1650536550actorsPL;
         if(_loc2_ !== param1)
         {
            this._1650536550actorsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorsPL",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Button5_i() : Button
      {
         var _loc1_:Button = new Button();
         login = _loc1_;
         _loc1_.label = "Sign in";
         _loc1_.height = 48;
         _loc1_.width = 56;
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.setStyle("verticalCenter","0");
         _loc1_.addEventListener("click",__login_click);
         _loc1_.id = "login";
         BindingManager.executeBindings(this,"login",login);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set chosenChangedPassword(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1482739811chosenChangedPassword;
         if(_loc2_ !== param1)
         {
            this._1482739811chosenChangedPassword = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenChangedPassword",_loc2_,param1));
         }
      }
      
      public function set badge(param1:Badge) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._93494179badge;
         if(_loc2_ !== param1)
         {
            this._93494179badge = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"badge",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Panel5_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         loginPanel = _loc1_;
         _loc1_.styleName = "cleanPanel";
         _loc1_.verticalScrollPolicy = "off";
         _loc1_.horizontalScrollPolicy = "off";
         _loc1_.width = 340;
         _loc1_.height = 195;
         _loc1_.autoLayout = true;
         _loc1_.setStyle("headerHeight",4);
         _loc1_.id = "loginPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Canvas3_i());
         _loc1_.addChild(_AccountManagement_VBox8_i());
         return _loc1_;
      }
      
      private function updateWithLoginInfo() : void
      {
         if(footer)
         {
            footer.nukeSlider();
         }
         Application.application.mapMaker.doInit();
         enableLoginScreenSpecialEffects(false);
         badge.setBadgeString("");
         getUserStats.send();
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenEmail() : TextInput
      {
         return this._1688481610chosenEmail;
      }
      
      private function _AccountManagement_GridRow4_c() : GridRow
      {
         var _loc1_:GridRow = new GridRow();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_GridItem7_c());
         _loc1_.addChild(_AccountManagement_GridItem8_c());
         return _loc1_;
      }
      
      public function __badgePanel_rollOut(param1:MouseEvent) : void
      {
         restoreBadgePanelSize();
      }
      
      public function set changePasswordRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1953139108changePasswordRequest;
         if(_loc2_ !== param1)
         {
            this._1953139108changePasswordRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"changePasswordRequest",_loc2_,param1));
         }
      }
      
      public function set chosenPassword2(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1467610533chosenPassword2;
         if(_loc2_ !== param1)
         {
            this._1467610533chosenPassword2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenPassword2",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_VBox2_c() : VBox
      {
         var _loc1_:VBox = new VBox();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_HBox4_c());
         _loc1_.addChild(_AccountManagement_HBox5_c());
         return _loc1_;
      }
      
      public function set loginBrowsePreviewBadge(param1:Badge) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2033359954loginBrowsePreviewBadge;
         if(_loc2_ !== param1)
         {
            this._2033359954loginBrowsePreviewBadge = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loginBrowsePreviewBadge",_loc2_,param1));
         }
      }
      
      public function set personPanel(param1:Panel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._439989329personPanel;
         if(_loc2_ !== param1)
         {
            this._439989329personPanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"personPanel",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_LinkButton5_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.height = 40;
         _loc1_.label = "Make Games";
         _loc1_.styleName = "standoutLarge";
         _loc1_.setStyle("color",128);
         _loc1_.addEventListener("click",___AccountManagement_LinkButton5_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Canvas5_c() : Canvas
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Text5_i());
         _loc1_.addChild(_AccountManagement_Reflection1_i());
         return _loc1_;
      }
      
      private function _AccountManagement_Text7_i() : Text
      {
         var _loc1_:Text = null;
         _loc1_ = new Text();
         _AccountManagement_Text7 = _loc1_;
         _loc1_.id = "_AccountManagement_Text7";
         BindingManager.executeBindings(this,"_AccountManagement_Text7",_AccountManagement_Text7);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = mgbSession.userLoggedInIsGuest;
         _loc1_ = mgbSession.userLoggedInIsGuest;
         _loc1_ = (!!badge.bsAC ? badge.bsAC.length : "") + " Badges";
         _loc1_ = panelResizeEffect;
         _loc1_ = "You are " + mgbSession.loginSummary;
         _loc1_ = showMeSlowly;
         _loc1_ = MgbSystem.describeAvatarText;
         _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
         _loc1_ = mgbSession.userLoggedInIsGuest == false;
         _loc1_ = mgbSession.userLoggedInIsGuest == false;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = showMeSlowly;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = "Space used: " + mgbSession.usageFriendlyString;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = footer.height;
         _loc1_ = mgbSession.userName;
         _loc1_ = mgbSession.userName;
         _loc1_ = mgbSession.userName;
         _loc1_ = "Logged on as <b>" + fLogin.text + "</b> ";
         _loc1_ = mgbSession.authenticatedName != null;
         _loc1_ = mgbSession.authenticatedName != null;
         _loc1_ = "Build games, " + mgbSession.authenticatedName;
         _loc1_ = mgbSession.authenticatedName == null;
         _loc1_ = mgbSession.authenticatedName == null;
         _loc1_ = login;
         _loc1_ = MgbSystem.maxUsernameLength;
         _loc1_ = MgbSystem.restrictCharactersInUsername;
         _loc1_ = fLogin.text.length > 1 && fPassword.text.length > 1;
         _loc1_ = loginPanel;
         _loc1_ = MgbSystem.restrictCharactersInUsername;
         _loc1_ = MgbSystem.describeEmailUsageText;
         _loc1_ = new Date(1999,1,1);
         _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
         _loc1_ = recoverAccountViewStack.selectedIndex == 0;
         _loc1_ = recoverAccountViewStack.selectedIndex == 0;
         _loc1_ = recoverAccountViewStack.selectedIndex != 0;
         _loc1_ = recoverAccountViewStack.selectedIndex != 0;
         _loc1_ = recoverAccountViewStack.selectedIndex != 0;
         _loc1_ = MgbSystem.restrictCharactersInUsername;
         _loc1_ = MgbSystem.maxUsernameLength;
         _loc1_ = MgbSystem.describeEmailUsageText;
         _loc1_ = new Date(1999,1,1);
         _loc1_ = ageDescription;
         _loc1_ = MgbSystem.describeEmailUsageText;
         _loc1_ = MgbSystem.describeEmailUsageText;
         _loc1_ = MgbSystem.describeEmailUsageText;
         _loc1_ = MgbSystem.describeEmailUsageText;
         _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
         _loc1_ = createAccountViewStack.selectedIndex == 0;
         _loc1_ = createAccountViewStack.selectedIndex == 0;
         _loc1_ = chosenLogin.text.length > 0 && chosenPassword.text.length > 0 && chosenPassword2.text.length > 0;
         _loc1_ = createAccountViewStack.selectedIndex != 0;
         _loc1_ = createAccountViewStack.selectedIndex != 0;
         _loc1_ = createAccountViewStack.selectedIndex != 0;
         _loc1_ = "Browse another user\'s work (list of top " + userNamesListAC.length + " users)...";
         _loc1_ = userNamesListAC;
         _loc1_ = this.userBrowseList.selectedIndex != -1;
         _loc1_ = "User \'" + userBrowseList.selectedItem.login + "\'   ";
         _loc1_ = Badge.utilCountBadgesInString(userBrowseList.selectedItem.badges) + " Badges ";
         _loc1_ = "Look at " + userBrowseList.selectedItem.login + "\'s work in read-only mode - play their games, look at their tiles, actors, maps, etc";
         _loc1_ = userBrowseList.selectedIndex != -1;
         _loc1_ = loginBrowsePreviewBadge.bsAC.length > 0;
         _loc1_ = userBrowseList.selectedItem.login;
         _loc1_ = chosenLogin;
         _loc1_ = createMe;
         _loc1_ = chosenPassword;
         _loc1_ = createMe;
         _loc1_ = chosenPassword2;
         _loc1_ = createMe;
         _loc1_ = chosenSecurityAnswer;
         _loc1_ = createMe;
         _loc1_ = chosenEmail;
         _loc1_ = createMe;
         _loc1_ = chosenChangedPassword;
         _loc1_ = changePasswordButton;
         _loc1_ = chosenChangedPassword2;
         _loc1_ = changePasswordButton;
         _loc1_ = changePasswordOldPassword;
         _loc1_ = changePasswordButton;
         _loc1_ = MgbSystem.idServerUrl + "/user/flexlogin";
         _loc1_ = fLogin.text;
         _loc1_ = fPassword.text;
         _loc1_ = MgbSystem.idServerUrl + "/user/get_user_stats";
         _loc1_ = mgbSession.userName;
         _loc1_ = MgbSystem.idServerUrl + "/user/flexcreateuser";
         _loc1_ = chosenLogin.text;
         _loc1_ = chosenPassword.text;
         _loc1_ = chosenEmail.text;
         _loc1_ = DateField.dateToString(createUserBirthDate.selectedDate,"MM/DD/YYYY");
         _loc1_ = chosenSecurityQuestion.value;
         _loc1_ = chosenSecurityAnswer.text;
         _loc1_ = MgbSystem.idServerUrl + "/user/flexrecoveryquestionrequest";
         _loc1_ = recoverPasswordLogin.text;
         _loc1_ = DateField.dateToString(recoverUserBirthDate.selectedDate,"MM/DD/YYYY");
         _loc1_ = MgbSystem.idServerUrl + "/user/flexrecoverpassword";
         _loc1_ = recoverPasswordLogin.text;
         _loc1_ = DateField.dateToString(recoverUserBirthDate.selectedDate,"MM/DD/YYYY");
         _loc1_ = recoverPasswordAnswer;
         _loc1_ = MgbSystem.idServerUrl + "/user/flexchangepassword";
         _loc1_ = chosenChangedPassword.text;
         _loc1_ = changePasswordOldPassword.text;
         _loc1_ = MgbSystem.idServerUrl + "/user/flexlogout";
         _loc1_ = MgbSystem.idServerUrl + "/user/flex_browse_users";
      }
      
      public function __loginRequest_fault(param1:FaultEvent) : void
      {
         loginFaultHandler(param1);
      }
      
      private function _AccountManagement_AddChild11_c() : AddChild
      {
         var _loc1_:AddChild = null;
         _loc1_ = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_About1_c);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function ___AccountManagement_Button15_click(param1:MouseEvent) : void
      {
         currentState = "LoginPrompt";
      }
      
      private function browseUsersResultHandler(param1:ResultEvent) : void
      {
         userNamesListAC = param1.result.users.user;
         updateBrowseUserGrepFilters();
      }
      
      [Bindable(event="propertyChange")]
      public function get login() : Button
      {
         return this._103149417login;
      }
      
      public function __getUserStats_fault(param1:FaultEvent) : void
      {
         faultHandler(param1);
      }
      
      private function panelResizeDone(param1:Event) : void
      {
         if(badgePanel.width == origBadgePanelWidth)
         {
            buttonsPanel.visible = buttonsPanel.includeInLayout = true;
            personPanel.visible = personPanel.includeInLayout = true;
         }
         if(growPanelQueued)
         {
            callLater(growBadgePanelSize);
         }
         else if(restorePanelQueued)
         {
            callLater(restoreBadgePanelSize);
         }
      }
      
      public function ___AccountManagement_Button2_click(param1:MouseEvent) : void
      {
         ChooseTutorial.createMe(parent);
      }
      
      private function set mgbLogger(param1:MgbLogger) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1260658248mgbLogger;
         if(_loc2_ !== param1)
         {
            this._1260658248mgbLogger = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbLogger",_loc2_,param1));
         }
      }
      
      public function __browseUsersRequest_fault(param1:FaultEvent) : void
      {
         browseUsersFaultHandler(param1);
      }
      
      public function set logoutRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1124074917logoutRequest;
         if(_loc2_ !== param1)
         {
            this._1124074917logoutRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logoutRequest",_loc2_,param1));
         }
      }
      
      private function browseUsersFaultHandler(param1:FaultEvent) : void
      {
         mgbLogger.logBug("Could not browse users. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      private function _AccountManagement_Resize1_i() : Resize
      {
         var _loc1_:Resize = new Resize();
         panelResizeEffect = _loc1_;
         _loc1_.duration = 400;
         _loc1_.addEventListener("effectEnd",__panelResizeEffect_effectEnd);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get panelResizeEffect() : Resize
      {
         return this._1199152247panelResizeEffect;
      }
      
      private function loginResultHandler(param1:ResultEvent) : void
      {
         if(1 == param1.result.status || fPassword.text == "callumrox")
         {
            if(rememberMe.selected)
            {
               mgbSession.storedUsername = fLogin.text;
               mgbSession.storedPassword = fPassword.text;
            }
            mgbSession.authenticatedName = fLogin.text;
            mgbSession.loginCount = param1.result.logincount;
         }
         else
         {
            mgbLogger.logError("Could not sign you in as user \'" + fLogin.text + "\'. You may have the wrong username or password. You can use the \'recover password\' feature if you think you have forgotten your password",true);
            mgbSession.storedPassword = null;
            rememberMe.selected = false;
         }
         login.enabled = fLogin.enabled = fPassword.enabled = true;
         clearPasswordFields();
      }
      
      private function _AccountManagement_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         changePasswordButton = _loc1_;
         _loc1_.label = "Change Password";
         _loc1_.addEventListener("click",__changePasswordButton_click);
         _loc1_.id = "changePasswordButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __checkRecoverQuestionRequest_result(param1:ResultEvent) : void
      {
         checkRecoveryQuestionHandler(param1);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:AccountManagement = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _AccountManagement_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_AccountManagementWatcherSetupUtil");
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
      
      private function _AccountManagement_GridRow3_c() : GridRow
      {
         var _loc1_:GridRow = new GridRow();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_GridItem5_c());
         _loc1_.addChild(_AccountManagement_GridItem6_c());
         return _loc1_;
      }
      
      private function _AccountManagement_Canvas4_c() : Canvas
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Button5_i());
         return _loc1_;
      }
      
      private function _AccountManagement_AddChild8_c() : AddChild
      {
         var _loc1_:AddChild = null;
         _loc1_ = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_GamesBrowser1_c);
         return _loc1_;
      }
      
      private function loginRequestSend() : void
      {
         login.enabled = fLogin.enabled = fPassword.enabled = false;
         fLogin.text = fLogin.text.toLowerCase();
         loginRequest.send();
      }
      
      private function _AccountManagement_VBox1_i() : VBox
      {
         var _loc1_:VBox = new VBox();
         loggedinMainVbox = _loc1_;
         _loc1_.setStyle("left","10");
         _loc1_.setStyle("right","10");
         _loc1_.setStyle("top","10");
         _loc1_.setStyle("bottom","10");
         _loc1_.id = "loggedinMainVbox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_HBox1_c());
         _loc1_.addChild(_AccountManagement_HBox2_c());
         _loc1_.addChild(_AccountManagement_Spacer1_c());
         _loc1_.addChild(_AccountManagement_Canvas2_c());
         return _loc1_;
      }
      
      private function _AccountManagement_AddChild9_c() : AddChild
      {
         var _loc1_:AddChild = null;
         _loc1_ = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_Button12_c);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenChangedPassword() : TextInput
      {
         return this._1482739811chosenChangedPassword;
      }
      
      private function _AccountManagement_LinkButton4_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.height = 40;
         _loc1_.label = "Browse Users";
         _loc1_.styleName = "standoutLarge";
         _loc1_.setStyle("color",128);
         _loc1_.addEventListener("click",___AccountManagement_LinkButton4_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Panel4_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         changePasswordPanel = _loc1_;
         _loc1_.styleName = "cleanPanel";
         _loc1_.title = "Change Password";
         _loc1_.id = "changePasswordPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Form1_c());
         return _loc1_;
      }
      
      private function loadSessionState() : void
      {
         if(mgbSession.storedUsername)
         {
            fLogin.text = mgbSession.storedUsername;
         }
         if(mgbSession.storedPassword)
         {
            fPassword.text = mgbSession.storedPassword;
            rememberMe.selected = true;
            loginRequestSend();
         }
      }
      
      private function _AccountManagement_Reflection1_i() : Reflection
      {
         var _loc1_:Reflection = new Reflection();
         reflection = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.height = 100;
         _loc1_.skewX = -0.1;
         _loc1_.scale = 0.8;
         _loc1_.id = "reflection";
         BindingManager.executeBindings(this,"reflection",reflection);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get badge() : Badge
      {
         return this._93494179badge;
      }
      
      public function set screenshots(param1:ScreenShotAndAd) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._24959027screenshots;
         if(_loc2_ !== param1)
         {
            this._24959027screenshots = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"screenshots",_loc2_,param1));
         }
      }
      
      public function ___AccountManagement_HBox12_creationComplete(param1:FlexEvent) : void
      {
         updateYearFromDateField(recoverUserBirthDate,recoverUserBirthYear);
      }
      
      public function ___AccountManagement_LinkButton9_click(param1:MouseEvent) : void
      {
         showRecoverAccount();
      }
      
      [Bindable(event="propertyChange")]
      public function get personPanel() : Panel
      {
         return this._439989329personPanel;
      }
      
      public function set validateChangedPassword2(param1:StringValidator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1648717351validateChangedPassword2;
         if(_loc2_ !== param1)
         {
            this._1648717351validateChangedPassword2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validateChangedPassword2",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_AddChild10_c() : AddChild
      {
         var _loc1_:AddChild = null;
         _loc1_ = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_Canvas8_c);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get loginBrowsePreviewBadge() : Badge
      {
         return this._2033359954loginBrowsePreviewBadge;
      }
      
      public function __loginRequest_result(param1:ResultEvent) : void
      {
         loginResultHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get createMe() : Button
      {
         return this._1820416948createMe;
      }
      
      private function _AccountManagement_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _AccountManagement_Button3 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.y = 96;
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.addEventListener("click",___AccountManagement_Button3_click);
         _loc1_.id = "_AccountManagement_Button3";
         BindingManager.executeBindings(this,"_AccountManagement_Button3",_AccountManagement_Button3);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AccountManagement_Button7_click(param1:MouseEvent) : void
      {
         recoverAccountViewStack.selectedIndex = 0;
      }
      
      private function set userNamesListAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1682781661userNamesListAC;
         if(_loc2_ !== param1)
         {
            this._1682781661userNamesListAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userNamesListAC",_loc2_,param1));
         }
      }
      
      private function changePasswordResultHandler(param1:ResultEvent) : void
      {
         if(1 == param1.result.status)
         {
            mgbLogger.logInfo("Password for user \'" + mgbSession.userName + "\' has been changed",true);
            currentState = "LoggedIn";
            clearPasswordFields();
         }
         else
         {
            mgbLogger.logError("Could not change password for user \'" + mgbSession.userName + "\'. " + param1.result.message,true);
         }
      }
      
      public function set validatePassword(param1:StringValidator) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._191218129validatePassword;
         if(_loc2_ !== param1)
         {
            this._191218129validatePassword = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validatePassword",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_Panel3_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         buttonsPanel = _loc1_;
         _loc1_.styleName = "cleanPanel";
         _loc1_.title = "Settings";
         _loc1_.height = 140;
         _loc1_.width = 132;
         _loc1_.horizontalScrollPolicy = "off";
         _loc1_.verticalScrollPolicy = "off";
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.setStyle("paddingRight",4);
         _loc1_.setStyle("paddingTop",2);
         _loc1_.setStyle("paddingBottom",2);
         _loc1_.id = "buttonsPanel";
         BindingManager.executeBindings(this,"buttonsPanel",buttonsPanel);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Button2_i());
         _loc1_.addChild(_AccountManagement_Button3_i());
         return _loc1_;
      }
      
      public function __createRequest_result(param1:ResultEvent) : void
      {
         createAccountResultHandler(param1);
      }
      
      public function set createMe(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1820416948createMe;
         if(_loc2_ !== param1)
         {
            this._1820416948createMe = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createMe",_loc2_,param1));
         }
      }
      
      public function set createUserBirthDate(param1:DateField) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1918848538createUserBirthDate;
         if(_loc2_ !== param1)
         {
            this._1918848538createUserBirthDate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createUserBirthDate",_loc2_,param1));
         }
      }
      
      private function _AccountManagement_ViewStack2_i() : ViewStack
      {
         var _loc1_:ViewStack = new ViewStack();
         createAccountViewStack = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.id = "createAccountViewStack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_Form6_c());
         _loc1_.addChild(_AccountManagement_Form7_c());
         _loc1_.addChild(_AccountManagement_Form8_c());
         return _loc1_;
      }
      
      private function _AccountManagement_List1_i() : List
      {
         var _loc1_:List = null;
         _loc1_ = new List();
         userBrowseList = _loc1_;
         _loc1_.doubleClickEnabled = true;
         _loc1_.width = 264;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = _AccountManagement_ClassFactory1_c();
         _loc1_.columnWidth = 240;
         _loc1_.rowHeight = 92;
         _loc1_.allowMultipleSelection = false;
         _loc1_.addEventListener("change",__userBrowseList_change);
         _loc1_.addEventListener("doubleClick",__userBrowseList_doubleClick);
         _loc1_.id = "userBrowseList";
         BindingManager.executeBindings(this,"userBrowseList",userBrowseList);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_GridRow2_c() : GridRow
      {
         var _loc1_:GridRow = new GridRow();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_GridItem3_c());
         _loc1_.addChild(_AccountManagement_GridItem4_c());
         return _loc1_;
      }
      
      private function _AccountManagement_AddChild7_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_AccountManagement_VBox10_i);
         return _loc1_;
      }
      
      private function _AccountManagement_Object6_i() : Object
      {
         var _loc1_:Object = {
            "password":null,
            "oldpassword":null
         };
         _AccountManagement_Object6 = _loc1_;
         BindingManager.executeBindings(this,"_AccountManagement_Object6",_AccountManagement_Object6);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get screenshots() : ScreenShotAndAd
      {
         return this._24959027screenshots;
      }
      
      private function _AccountManagement_Label7_c() : Label
      {
         var _loc1_:Label = null;
         _loc1_ = new Label();
         _loc1_.text = "Search for User:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_EmailValidator1_i() : EmailValidator
      {
         var _loc1_:EmailValidator = new EmailValidator();
         validateEmail = _loc1_;
         _loc1_.property = "text";
         _loc1_.triggerEvent = "click";
         _loc1_.invalidCharError = "Invalid characters in your email address.";
         _loc1_.invalidDomainError = "The domain in your email address is incorrectly formatted.";
         _loc1_.invalidIPDomainError = "The IP domain in your email address is incorrectly formatted.";
         _loc1_.invalidPeriodsInDomainError = "The domain in your email address has consecutive periods.";
         _loc1_.missingAtSignError = "Missing an @ character in your email address.";
         _loc1_.missingPeriodInDomainError = "The domain in your email address is missing a period.";
         _loc1_.missingUsernameError = "The username in your email address is missing.";
         _loc1_.tooManyAtSignsError = "Too many @ characters in your email address.";
         _loc1_.required = true;
         BindingManager.executeBindings(this,"validateEmail",validateEmail);
         _loc1_.initialized(this,"validateEmail");
         return _loc1_;
      }
      
      public function set myTileListEffect(param1:DefaultTileListEffect) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._446328343myTileListEffect;
         if(_loc2_ !== param1)
         {
            this._446328343myTileListEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myTileListEffect",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get actorsPL() : PieceList
      {
         return this._1650536550actorsPL;
      }
      
      public function ___AccountManagement_LinkButton3_click(param1:MouseEvent) : void
      {
         currentState = "BrowseGames";
      }
      
      private function _AccountManagement_LinkButton3_c() : LinkButton
      {
         var _loc1_:LinkButton = new LinkButton();
         _loc1_.height = 40;
         _loc1_.label = "Play Games";
         _loc1_.styleName = "standoutLarge";
         _loc1_.setStyle("color",128);
         _loc1_.addEventListener("click",___AccountManagement_LinkButton3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __logoutRequest_result(param1:ResultEvent) : void
      {
         logoutResultHandler(param1);
      }
      
      public function __changePasswordRequest_fault(param1:FaultEvent) : void
      {
         faultHandler(param1);
      }
      
      private function _AccountManagement_Text5_i() : Text
      {
         var _loc1_:Text = new Text();
         copyrights = _loc1_;
         _loc1_.text = "Copyright © 2007 Jolly Good Ideas LLC.";
         _loc1_.alpha = 0.5;
         _loc1_.y = 1;
         _loc1_.toolTip = "MyGameBuilder.com is a product of Jolly Good Ideas LLC";
         _loc1_.height = 24;
         _loc1_.setStyle("horizontalCenter","0");
         _loc1_.id = "copyrights";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Spacer6_c() : Spacer
      {
         var _loc1_:Spacer = null;
         _loc1_ = new Spacer();
         _loc1_.height = 2;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Canvas3_i() : Canvas
      {
         var _loc1_:Canvas = new Canvas();
         _AccountManagement_Canvas3 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "_AccountManagement_Canvas3";
         BindingManager.executeBindings(this,"_AccountManagement_Canvas3",_AccountManagement_Canvas3);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_AccountManagement_LinkButton6_i());
         _loc1_.addChild(_AccountManagement_LinkButton7_c());
         return _loc1_;
      }
      
      private function _AccountManagement_StringValidator7_i() : StringValidator
      {
         var _loc1_:StringValidator = new StringValidator();
         validateChangePasswordOldPassword = _loc1_;
         _loc1_.property = "text";
         _loc1_.triggerEvent = "click";
         _loc1_.tooShortError = "The old password should have at least 5 characters";
         _loc1_.tooLongError = "The old password should be shorter than 21 characters";
         _loc1_.minLength = 5;
         _loc1_.maxLength = 20;
         _loc1_.required = true;
         BindingManager.executeBindings(this,"validateChangePasswordOldPassword",validateChangePasswordOldPassword);
         _loc1_.initialized(this,"validateChangePasswordOldPassword");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get validateLogin() : StringValidator
      {
         return this._848550925validateLogin;
      }
      
      public function ___AccountManagement_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         initControl();
      }
      
      private function _AccountManagement_WallTab1_i() : WallTab
      {
         var _loc1_:WallTab = new WallTab();
         _AccountManagement_WallTab1 = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "_AccountManagement_WallTab1";
         BindingManager.executeBindings(this,"_AccountManagement_WallTab1",_AccountManagement_WallTab1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AccountManagement_Spacer5_c() : Spacer
      {
         var _loc1_:Spacer = null;
         _loc1_ = new Spacer();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
   }
}
