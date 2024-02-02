package
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import com.mgb.menuEvents.*;
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
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.controls.LinkButton;
   import mx.controls.List;
   import mx.controls.Spacer;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddChild;
   import mx.states.State;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class MessagesTab extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _MessagesTab_VBox1:VBox;
      
      private var _1203659802mgbConversationsList:MgbConversationsList;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _110256292text1:Label;
      
      private var refreshTimer:Timer;
      
      private var _1659441854selectedConversation:String = "";
      
      private var _980896532messagesTabBackgroundColor:SelectBackgroundColor;
      
      private var _599342816composer:MessagesComposer;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _MessagesTab_LinkButton2:LinkButton;
      
      private var _774844686conversationsList:List;
      
      private var _114388536conversationView:MessagesConversationView;
      
      mx_internal var _bindings:Array;
      
      public var _MessagesTab_Label1:Label;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1332686138mgbConversationsCache:MgbMessageConversationsCache;
      
      public function MessagesTab()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Label,
                  "id":"_MessagesTab_Label1",
                  "stylesFactory":function():void
                  {
                     this.paddingTop = 64;
                     this.paddingLeft = 64;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"text":"Messages are only available if you are signed in"};
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "id":"_MessagesTab_VBox1",
                  "stylesFactory":function():void
                  {
                     this.left = "16";
                     this.right = "16";
                     this.top = "4";
                     this.bottom = "4";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "propertiesFactory":function():Object
                        {
                           return {
                              "percentWidth":100,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Label,
                                 "id":"text1",
                                 "stylesFactory":function():void
                                 {
                                    this.fontWeight = "bold";
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Spacer,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"percentWidth":100};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":LinkButton,
                                 "events":{"click":"___MessagesTab_LinkButton1_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {"label":"Compose New Message"};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":LinkButton,
                                 "id":"_MessagesTab_LinkButton2",
                                 "events":{"click":"___MessagesTab_LinkButton2_click"},
                                 "stylesFactory":function():void
                                 {
                                    this.disabledColor = 255;
                                 }
                              }),new UIComponentDescriptor({
                                 "type":SelectBackgroundColor,
                                 "id":"messagesTabBackgroundColor"
                              })]
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":List,
                        "id":"conversationsList",
                        "events":{"change":"__conversationsList_change"},
                        "stylesFactory":function():void
                        {
                           this.borderStyle = "none";
                           this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "itemRenderer":_MessagesTab_ClassFactory1_c(),
                              "percentWidth":100,
                              "percentHeight":100,
                              "allowMultipleSelection":false,
                              "dragEnabled":false
                           };
                        }
                     })]};
                  }
               })]};
            }
         });
         _1203659802mgbConversationsList = MgbCaches.getInstance().messageConversationsList;
         _1332686138mgbConversationsCache = MgbCaches.getInstance().messageConversationsCache;
         _1217010542mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.horizontalScrollPolicy = "off";
         this.states = [_MessagesTab_State1_c(),_MessagesTab_State2_c()];
         this.addEventListener("creationComplete",___MessagesTab_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MessagesTab._watcherSetupUtil = param1;
      }
      
      public function ___MessagesTab_LinkButton2_click(param1:MouseEvent) : void
      {
         doRefresh();
      }
      
      private function set selectedConversation(param1:String) : void
      {
         var _loc2_:Object = this._1659441854selectedConversation;
         if(_loc2_ !== param1)
         {
            this._1659441854selectedConversation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedConversation",_loc2_,param1));
         }
      }
      
      private function _MessagesTab_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = MessagesConversationItemRenderer;
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MessagesTab = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _MessagesTab_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_MessagesTabWatcherSetupUtil");
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
      
      private function _MessagesTab_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "viewConversation";
         _loc1_.overrides = [_MessagesTab_AddChild1_c()];
         return _loc1_;
      }
      
      public function authUserSignin(param1:Event) : void
      {
         doRefresh();
         conversationsList.selectedIndex = -1;
         selectedConversation = null;
      }
      
      [Bindable(event="propertyChange")]
      public function get conversationsList() : List
      {
         return this._774844686conversationsList;
      }
      
      [Bindable(event="propertyChange")]
      public function get composer() : MessagesComposer
      {
         return this._599342816composer;
      }
      
      private function _MessagesTab_MessagesConversationView1_i() : MessagesConversationView
      {
         var _loc1_:MessagesConversationView = new MessagesConversationView();
         conversationView = _loc1_;
         _loc1_.setStyle("top","48");
         _loc1_.setStyle("left","96");
         _loc1_.setStyle("right","96");
         _loc1_.setStyle("bottom","12");
         _loc1_.id = "conversationView";
         BindingManager.executeBindings(this,"conversationView",conversationView);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set conversationsList(param1:List) : void
      {
         var _loc2_:Object = this._774844686conversationsList;
         if(_loc2_ !== param1)
         {
            this._774844686conversationsList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"conversationsList",_loc2_,param1));
         }
      }
      
      private function composeMessage() : void
      {
         if(currentState == "ComposeMessage")
         {
            currentState = "";
         }
         else
         {
            currentState = "ComposeMessage";
         }
      }
      
      private function _MessagesTab_AddChild2_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.creationPolicy = "all";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MessagesTab_MessagesComposer1_i);
         return _loc1_;
      }
      
      public function set conversationView(param1:MessagesConversationView) : void
      {
         var _loc2_:Object = this._114388536conversationView;
         if(_loc2_ !== param1)
         {
            this._114388536conversationView = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"conversationView",_loc2_,param1));
         }
      }
      
      private function handleDeleteConversationEvent(param1:DeleteConversationEvent) : void
      {
         trace("handleDeleteConversationEvent");
         var _loc2_:MgbMessageConversation = mgbConversationsCache.getConversation(mgbSession.authenticatedName,param1.conversationId);
         _loc2_.deleteConversation();
         currentState = "";
      }
      
      private function initControl() : void
      {
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_AUTHENTICATED_USER_SIGNED_OUT,authUserSignout);
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_AUTHENTICATED_USER_SIGNED_IN,authUserSignin);
         conversationsList.addEventListener(ViewConversationEvent.VIEW_CONVERSATION,handleViewConversationEvent);
         conversationsList.addEventListener(DeleteConversationEvent.DELETE_CONVERSATION,handleDeleteConversationEvent);
         conversationView.addEventListener(DeleteConversationEvent.DELETE_CONVERSATION,handleDeleteConversationEvent);
         MgbGlobalEventer.getInstance().addEventListener(DeleteConversationEvent.DELETE_CONVERSATION,handleDeleteConversationEvent);
         conversationView.addEventListener(MessagesConversationView.CLOSE_ME_PLEASE_EVENT,handleCloseConversationViewEvent);
         composer.addEventListener(MessagesComposer.CLOSE_ME_PLEASE_EVENT,handleCloseConversationViewEvent);
         refreshTimer = new Timer(5 * 60 * 1000,0);
         refreshTimer.addEventListener(TimerEvent.TIMER,refreshTimerTick);
         refreshTimer.start();
      }
      
      public function ___MessagesTab_LinkButton1_click(param1:MouseEvent) : void
      {
         composeMessage();
      }
      
      private function _MessagesTab_MessagesComposer1_i() : MessagesComposer
      {
         var _loc1_:MessagesComposer = new MessagesComposer();
         composer = _loc1_;
         _loc1_.setStyle("top","32");
         _loc1_.setStyle("left","128");
         _loc1_.setStyle("right","128");
         _loc1_.setStyle("bottom","64");
         _loc1_.id = "composer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get text1() : Label
      {
         return this._110256292text1;
      }
      
      [Bindable(event="propertyChange")]
      private function get selectedConversation() : String
      {
         return this._1659441854selectedConversation;
      }
      
      public function addPieceToMessage(param1:String, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:MgbMessageAttachment = null;
         if(Boolean(mgbSession.authenticatedName) && mgbSession.authenticatedName != "")
         {
            _loc5_ = new MgbMessageAttachment(param2,param3,param4,param1);
            switch(currentState)
            {
               case "":
               case null:
                  currentState = "ComposeMessage";
               case "ComposeMessage":
                  composer.addMessageAttachmentToMessage(_loc5_);
                  break;
               case "viewConversation":
                  conversationView.addMessageAttachmentToReply(_loc5_);
            }
         }
      }
      
      public function set composer(param1:MessagesComposer) : void
      {
         var _loc2_:Object = this._599342816composer;
         if(_loc2_ !== param1)
         {
            this._599342816composer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"composer",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get conversationView() : MessagesConversationView
      {
         return this._114388536conversationView;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbConversationsCache() : MgbMessageConversationsCache
      {
         return this._1332686138mgbConversationsCache;
      }
      
      public function set text1(param1:Label) : void
      {
         var _loc2_:Object = this._110256292text1;
         if(_loc2_ !== param1)
         {
            this._110256292text1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text1",_loc2_,param1));
         }
      }
      
      private function doRefresh() : void
      {
         mgbConversationsCache.markAllStale();
         mgbConversationsList.load(mgbSession.authenticatedName,true);
         refreshTimer.addEventListener(TimerEvent.TIMER,refreshTimerTick);
      }
      
      private function set mgbConversationsList(param1:MgbConversationsList) : void
      {
         var _loc2_:Object = this._1203659802mgbConversationsList;
         if(_loc2_ !== param1)
         {
            this._1203659802mgbConversationsList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbConversationsList",_loc2_,param1));
         }
      }
      
      private function _MessagesTab_State2_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "ComposeMessage";
         _loc1_.overrides = [_MessagesTab_AddChild2_c()];
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
      
      public function authUserSignout(param1:Event) : void
      {
         mgbConversationsList.clear();
         currentState = "";
      }
      
      public function set messagesTabBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._980896532messagesTabBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._980896532messagesTabBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messagesTabBackgroundColor",_loc2_,param1));
         }
      }
      
      public function __conversationsList_change(param1:ListEvent) : void
      {
         selectedConversation = conversationsList.selectedItem.conversationId;
      }
      
      private function handleCloseConversationViewEvent(param1:Event) : void
      {
         currentState = "";
      }
      
      private function _MessagesTab_AddChild1_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.creationPolicy = "all";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MessagesTab_MessagesConversationView1_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbConversationsList() : MgbConversationsList
      {
         return this._1203659802mgbConversationsList;
      }
      
      private function refreshTimerTick(param1:TimerEvent) : void
      {
         if(Boolean(mgbSession.authenticatedName) && mgbSession.authenticatedName != "")
         {
            trace("refreshMessages");
            doRefresh();
         }
      }
      
      private function handleViewConversationEvent(param1:ViewConversationEvent) : void
      {
         currentState = "viewConversation";
      }
      
      private function _MessagesTab_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = !(mgbSession.authenticatedName && mgbSession.authenticatedName != "");
         _loc1_ = !(mgbSession.authenticatedName && mgbSession.authenticatedName != "");
         _loc1_ = mgbSession.authenticatedName && mgbSession.authenticatedName != "";
         _loc1_ = "Viewing messages for " + mgbSession.authenticatedName;
         _loc1_ = mgbConversationsList.state == MgbConversationsList.state_LISTREADY ? "Refresh" : "Refreshing...";
         _loc1_ = mgbConversationsList.state == MgbConversationsList.state_LISTREADY;
         _loc1_ = mgbConversationsList.listAC;
         _loc1_ = selectedConversation;
      }
      
      public function ___MessagesTab_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         initControl();
      }
      
      private function set mgbConversationsCache(param1:MgbMessageConversationsCache) : void
      {
         var _loc2_:Object = this._1332686138mgbConversationsCache;
         if(_loc2_ !== param1)
         {
            this._1332686138mgbConversationsCache = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbConversationsCache",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      public function get messagesTabBackgroundColor() : SelectBackgroundColor
      {
         return this._980896532messagesTabBackgroundColor;
      }
      
      private function _MessagesTab_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return !(mgbSession.authenticatedName && mgbSession.authenticatedName != "");
         },function(param1:Boolean):void
         {
            _MessagesTab_Label1.visible = param1;
         },"_MessagesTab_Label1.visible");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !(mgbSession.authenticatedName && mgbSession.authenticatedName != "");
         },function(param1:Boolean):void
         {
            _MessagesTab_Label1.includeInLayout = param1;
         },"_MessagesTab_Label1.includeInLayout");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return Boolean(mgbSession.authenticatedName) && mgbSession.authenticatedName != "";
         },function(param1:Boolean):void
         {
            _MessagesTab_VBox1.visible = param1;
         },"_MessagesTab_VBox1.visible");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Viewing messages for " + mgbSession.authenticatedName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            text1.text = param1;
         },"text1.text");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = mgbConversationsList.state == MgbConversationsList.state_LISTREADY ? "Refresh" : "Refreshing...";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MessagesTab_LinkButton2.label = param1;
         },"_MessagesTab_LinkButton2.label");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbConversationsList.state == MgbConversationsList.state_LISTREADY;
         },function(param1:Boolean):void
         {
            _MessagesTab_LinkButton2.enabled = param1;
         },"_MessagesTab_LinkButton2.enabled");
         result[5] = binding;
         binding = new Binding(this,function():Object
         {
            return mgbConversationsList.listAC;
         },function(param1:Object):void
         {
            conversationsList.dataProvider = param1;
         },"conversationsList.dataProvider");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = selectedConversation;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            conversationView.conversationId = param1;
         },"conversationView.conversationId");
         result[7] = binding;
         return result;
      }
   }
}
