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
   import mx.controls.*;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.rpc.events.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class FriendsList extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _FriendsList_Image1:Image;
      
      private var _909346807newFriendName:TextInput;
      
      private var _1471460769_ownerName:String;
      
      public var _FriendsList_LinkButton2:LinkButton;
      
      private var _1756909476friendList:TileList;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      public var _FriendsList_HBox1:HBox;
      
      private var _400072522friendRequestMessage:MgbMessage;
      
      private var trashConfirmDragEvent:DragEvent = null;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var trashConfirmAlert:Alert = null;
      
      private const defaultGreetingText:String = "Hey! Let\'s be friends in MGB";
      
      private var _embed_mxml_Resources_trashcan2_png_1044093694:Class;
      
      mx_internal var _bindings:Array;
      
      private var _31177144ownersfriendshipList:MgbFriendshipsList;
      
      private var _205422649greeting:TextInput;
      
      public var _FriendsList_LinkButton1:LinkButton;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function FriendsList()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "id":"_FriendsList_HBox1",
                  "stylesFactory":function():void
                  {
                     this.top = "8";
                     this.left = "8";
                     this.paddingTop = 5;
                     this.paddingBottom = 4;
                     this.paddingRight = 6;
                     this.right = "80";
                     this.backgroundColor = 0;
                     this.backgroundAlpha = 0.1;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_FriendsList_LinkButton1",
                        "events":{"click":"___FriendsList_LinkButton1_click"},
                        "propertiesFactory":function():Object
                        {
                           return {
                              "label":"Send Friend Request",
                              "toolTip":"Enter the name of the person you want to invite, then click here to send the friend request"
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function():void
                        {
                           this.fontWeight = "bold";
                        },
                        "propertiesFactory":function():Object
                        {
                           return {"text":"Name"};
                        }
                     }),new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"newFriendName",
                        "stylesFactory":function():void
                        {
                           this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "text":"",
                              "editable":true,
                              "width":128,
                              "toolTip":"Enter the name of the person you want to invite"
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Spacer,
                        "propertiesFactory":function():Object
                        {
                           return {"width":16};
                        }
                     }),new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function():void
                        {
                           this.fontWeight = "bold";
                        },
                        "propertiesFactory":function():Object
                        {
                           return {"text":"Message"};
                        }
                     }),new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"greeting",
                        "stylesFactory":function():void
                        {
                           this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "editable":true,
                              "percentWidth":100,
                              "toolTip":"Enter an optional greeting message"
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_FriendsList_LinkButton2",
                        "events":{"click":"___FriendsList_LinkButton2_click"},
                        "stylesFactory":function():void
                        {
                           this.disabledColor = 255;
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":TileList,
                  "id":"friendList",
                  "stylesFactory":function():void
                  {
                     this.top = "48";
                     this.bottom = "4";
                     this.left = "4";
                     this.right = "4";
                     this.borderStyle = "none";
                     this.backgroundAlpha = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "itemRenderer":_FriendsList_ClassFactory1_c(),
                        "allowMultipleSelection":false,
                        "dragEnabled":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"_FriendsList_Image1",
                  "events":{
                     "dragDrop":"___FriendsList_Image1_dragDrop",
                     "dragEnter":"___FriendsList_Image1_dragEnter",
                     "click":"___FriendsList_Image1_click"
                  },
                  "stylesFactory":function():void
                  {
                     this.top = "0";
                     this.right = "20";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":48,
                        "height":48,
                        "source":_embed_mxml_Resources_trashcan2_png_1044093694,
                        "toolTip":"You can de-friend people by dragging them to this trashcan",
                        "filters":[_FriendsList_GlowFilter1_c()]
                     };
                  }
               })]};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _400072522friendRequestMessage = new MgbMessage();
         _embed_mxml_Resources_trashcan2_png_1044093694 = FriendsList__embed_mxml_Resources_trashcan2_png_1044093694;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.addEventListener("creationComplete",___FriendsList_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         FriendsList._watcherSetupUtil = param1;
      }
      
      private function _FriendsList_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownersfriendshipList.username + "\'s " + ownersfriendshipList.friendshipsListAC.length + " Friends";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.label = param1;
         },"this.label");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _FriendsList_HBox1.visible = param1;
         },"_FriendsList_HBox1.visible");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _FriendsList_HBox1.includeInLayout = param1;
         },"_FriendsList_HBox1.includeInLayout");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return newFriendName.text.length > 0 && friendRequestMessage.sendPending == false;
         },function(param1:Boolean):void
         {
            _FriendsList_LinkButton1.enabled = param1;
         },"_FriendsList_LinkButton1.enabled");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.restrictCharactersInUsername;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newFriendName.restrict = param1;
         },"newFriendName.restrict");
         result[4] = binding;
         binding = new Binding(this,function():int
         {
            return MgbSystem.maxUsernameLength;
         },function(param1:int):void
         {
            newFriendName.maxChars = param1;
         },"newFriendName.maxChars");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = defaultGreetingText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            greeting.text = param1;
         },"greeting.text");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !!ownersfriendshipList.refreshPending ? "Refreshing" : "Refresh";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _FriendsList_LinkButton2.label = param1;
         },"_FriendsList_LinkButton2.label");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !ownersfriendshipList.refreshPending;
         },function(param1:Boolean):void
         {
            _FriendsList_LinkButton2.enabled = param1;
         },"_FriendsList_LinkButton2.enabled");
         result[8] = binding;
         binding = new Binding(this,function():Object
         {
            return ownersfriendshipList.friendshipsListAC;
         },function(param1:Object):void
         {
            friendList.dataProvider = param1;
         },"friendList.dataProvider");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _FriendsList_Image1.visible = param1;
         },"_FriendsList_Image1.visible");
         result[10] = binding;
         return result;
      }
      
      public function ___FriendsList_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         initControl();
      }
      
      private function _FriendsList_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ownersfriendshipList.username + "\'s " + ownersfriendshipList.friendshipsListAC.length + " Friends";
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = newFriendName.text.length > 0 && friendRequestMessage.sendPending == false;
         _loc1_ = MgbSystem.restrictCharactersInUsername;
         _loc1_ = MgbSystem.maxUsernameLength;
         _loc1_ = defaultGreetingText;
         _loc1_ = !!ownersfriendshipList.refreshPending ? "Refreshing" : "Refresh";
         _loc1_ = !ownersfriendshipList.refreshPending;
         _loc1_ = ownersfriendshipList.friendshipsListAC;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
      }
      
      private function friendshipEstablishedHandler(param1:MgbFriendshipEvent) : void
      {
         MgbGlobalEventer.getInstance().dispatchEvent(new DeleteConversationEvent(DeleteConversationEvent.DELETE_CONVERSATION,param1.conversationId));
         var _loc2_:MgbMessage = new MgbMessage(param1.username,param1.friendname,param1.username + " has accepted your friend request!",null,"... is now your Friend");
         _loc2_.send(null,true);
         Alert.show("You and " + param1.friendname + " are now friends!","Hurrah!");
      }
      
      public function set newFriendName(param1:TextInput) : void
      {
         var _loc2_:Object = this._909346807newFriendName;
         if(_loc2_ !== param1)
         {
            this._909346807newFriendName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newFriendName",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:FriendsList = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _FriendsList_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_FriendsListWatcherSetupUtil");
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
      
      public function ___FriendsList_Image1_dragDrop(param1:DragEvent) : void
      {
         trashcanDragDrop(param1);
      }
      
      private function trashcanConfirmHandler(param1:CloseEvent) : void
      {
         var _loc2_:Array = trashConfirmDragEvent.dragSource.dataForFormat("items") as Array;
         if(param1.detail == Alert.YES && Object(trashConfirmDragEvent.dragInitiator) == Object(friendList))
         {
            ownersfriendshipList.deleteFriendship(_loc2_[0].friendname);
         }
         trashConfirmAlert = null;
         trashConfirmDragEvent = null;
      }
      
      public function ___FriendsList_LinkButton2_click(param1:MouseEvent) : void
      {
         ownersfriendshipList.refresh();
      }
      
      private function _FriendsList_GlowFilter1_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.6;
         _loc1_.blurX = 18;
         _loc1_.blurY = 18;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get newFriendName() : TextInput
      {
         return this._909346807newFriendName;
      }
      
      private function initControl() : void
      {
         friendRequestMessage.addEventListener(MessageArrivalEvent.LOADED,friendInviteSentHandler);
         friendRequestMessage.addEventListener(FaultEvent.FAULT,friendInviteFaultHandler);
      }
      
      private function friendInviteFaultHandler(param1:FaultEvent) : void
      {
         Alert.show("Your friend request could not be sent to \'" + newFriendName.text + "\'. Check you have the name correct, or try later","Request could not be delivered");
      }
      
      private function set _17453022ownerName(param1:String) : void
      {
         _ownerName = param1;
         ownersfriendshipList = MgbCaches.getInstance().friendshipsListCache.getFriendships(param1);
         ownersfriendshipList.addEventListener(MgbFriendshipEvent.FRIENDSHIP_ESTABLISHED,friendshipEstablishedHandler);
      }
      
      private function _FriendsList_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FriendshipItemRenderer;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get greeting() : TextInput
      {
         return this._205422649greeting;
      }
      
      [Bindable(event="propertyChange")]
      public function set ownerName(param1:String) : void
      {
         var _loc2_:Object = this.ownerName;
         if(_loc2_ !== param1)
         {
            this._17453022ownerName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ownerName",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get friendRequestMessage() : MgbMessage
      {
         return this._400072522friendRequestMessage;
      }
      
      public function set friendList(param1:TileList) : void
      {
         var _loc2_:Object = this._1756909476friendList;
         if(_loc2_ !== param1)
         {
            this._1756909476friendList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendList",_loc2_,param1));
         }
      }
      
      private function set _ownerName(param1:String) : void
      {
         var _loc2_:Object = this._1471460769_ownerName;
         if(_loc2_ !== param1)
         {
            this._1471460769_ownerName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ownerName",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get ownersfriendshipList() : MgbFriendshipsList
      {
         return this._31177144ownersfriendshipList;
      }
      
      private function friendInviteSentHandler(param1:MessageArrivalEvent) : void
      {
         Alert.show("Your friend request has been delivered to " + param1.msg.toName,"Request delivered OK");
         newFriendName.text = "";
      }
      
      private function trashcanDragEnter(param1:DragEvent) : void
      {
         var _loc2_:Image = Image(param1.currentTarget);
         if(param1.dragSource.hasFormat("items"))
         {
            DragManager.acceptDragDrop(_loc2_);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get friendList() : TileList
      {
         return this._1756909476friendList;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      [Bindable(event="propertyChange")]
      private function get _ownerName() : String
      {
         return this._1471460769_ownerName;
      }
      
      public function ___FriendsList_LinkButton1_click(param1:MouseEvent) : void
      {
         sendFriendInvite(ownersfriendshipList.username,newFriendName.text,greeting.text);
      }
      
      public function ___FriendsList_Image1_dragEnter(param1:DragEvent) : void
      {
         trashcanDragEnter(param1);
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function sendFriendInvite(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:MgbFriendship = null;
         if(param1 == param2)
         {
            Alert.show("You\'re already your own best friend. Try asking someone else :)");
            return;
         }
         for each(_loc4_ in ownersfriendshipList.friendshipsListAC)
         {
            if(_loc4_.friendname == param2)
            {
               Alert.show("You and " + param2 + " are already friends!");
               return;
            }
         }
         friendRequestMessage.clear();
         friendRequestMessage.fromName = param1;
         friendRequestMessage.toName = param2;
         friendRequestMessage.subject = "Friend request from " + param1;
         friendRequestMessage.body = param3;
         friendRequestMessage.addAttachment(new MgbMessageAttachment(param1,"","",MgbMessageAttachment.ITEMTYPE_FRIEND_REQUEST));
         friendRequestMessage.send(null,true);
      }
      
      public function set greeting(param1:TextInput) : void
      {
         var _loc2_:Object = this._205422649greeting;
         if(_loc2_ !== param1)
         {
            this._205422649greeting = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"greeting",_loc2_,param1));
         }
      }
      
      private function set friendRequestMessage(param1:MgbMessage) : void
      {
         var _loc2_:Object = this._400072522friendRequestMessage;
         if(_loc2_ !== param1)
         {
            this._400072522friendRequestMessage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendRequestMessage",_loc2_,param1));
         }
      }
      
      private function set ownersfriendshipList(param1:MgbFriendshipsList) : void
      {
         var _loc2_:Object = this._31177144ownersfriendshipList;
         if(_loc2_ !== param1)
         {
            this._31177144ownersfriendshipList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ownersfriendshipList",_loc2_,param1));
         }
      }
      
      public function ___FriendsList_Image1_click(param1:MouseEvent) : void
      {
         Alert.show("You can de-friend people by dragging them to this trashcan");
      }
      
      private function trashcanDragDrop(param1:DragEvent) : void
      {
         if(null != trashConfirmAlert)
         {
            return;
         }
         if(mgbSession.userLoggedInIsGuest)
         {
            Alert.show("As a guest, you are not allowed to de-friend!");
            return;
         }
         var _loc2_:Array = param1.dragSource.dataForFormat("items") as Array;
         if(Boolean(_loc2_) && Boolean(_loc2_.length))
         {
            trashConfirmAlert = Alert.show("Do you really want to de-friend \'" + _loc2_[0].friendname + "\'?  You might make them sad...!","DE-FRIEND - Are You Sure?",Alert.YES | Alert.NO,null,trashcanConfirmHandler,null,Alert.NO);
            trashConfirmAlert.alpha = 1;
            trashConfirmDragEvent = param1;
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
   }
}
