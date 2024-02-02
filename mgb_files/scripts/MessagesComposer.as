package
{
   import com.adobe.flex.extras.controls.AutoComplete;
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
   import mx.collections.*;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.*;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class MessagesComposer extends Panel implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      public static const CLOSE_ME_PLEASE_EVENT:String = "Mgb_MessagesComposer_closeRequest";
       
      
      private var _1529844226subjectInput:TextInput;
      
      public var _MessagesComposer_LinkButton1:LinkButton;
      
      public var _MessagesComposer_Label5:Label;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _108417msg:MgbMessage;
      
      private var _24991063messagesComposerBackgroundColor:SelectBackgroundColor;
      
      private var _1480278894_friendsNames:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1702646255bodyText:TextArea;
      
      private var _1897626133friendsNamesAC:ArrayCollection;
      
      private var _147079056attachmentEditor:MessagesAttachmentsListEditor;
      
      private var _1405524947friendsList:MgbFriendshipsList;
      
      mx_internal var _bindings:Array;
      
      private var _591263684toNameInput:AutoComplete;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function MessagesComposer()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Panel,
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
                           "stylesFactory":function():void
                           {
                              this.fontWeight = "bold";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"text":"Start new conversation"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"percentWidth":100};
                           }
                        }),new UIComponentDescriptor({
                           "type":LinkButton,
                           "id":"_MessagesComposer_LinkButton1",
                           "events":{"click":"___MessagesComposer_LinkButton1_click"},
                           "propertiesFactory":function():Object
                           {
                              return {"label":"Send message"};
                           }
                        }),new UIComponentDescriptor({
                           "type":LinkButton,
                           "events":{"click":"___MessagesComposer_LinkButton2_click"},
                           "propertiesFactory":function():Object
                           {
                              return {"label":"Clear message"};
                           }
                        }),new UIComponentDescriptor({
                           "type":LinkButton,
                           "events":{"click":"___MessagesComposer_LinkButton3_click"},
                           "propertiesFactory":function():Object
                           {
                              return {"label":"Close window"};
                           }
                        }),new UIComponentDescriptor({
                           "type":SelectBackgroundColor,
                           "id":"messagesComposerBackgroundColor",
                           "stylesFactory":function():void
                           {
                              this.right = "0";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"y":0};
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Label,
                           "stylesFactory":function():void
                           {
                              this.fontWeight = "bold";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "text":"To:",
                                 "width":80,
                                 "toolTip":"Enter the name of who you want to send the message to. If you start typing a name of a \'friend\' the name will be suggested - use the up/down arrows to select their name in this case - or just type any valid username in MGB. In MGB messages can only be sent to one person"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":AutoComplete,
                           "id":"toNameInput",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "text":"",
                                 "width":160
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"percentWidth":100};
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Label,
                           "stylesFactory":function():void
                           {
                              this.fontWeight = "bold";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "text":"Subject:",
                                 "width":80
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":TextInput,
                           "id":"subjectInput",
                           "propertiesFactory":function():Object
                           {
                              return {"percentWidth":100};
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":VBox,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":80,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function():void
                                    {
                                       this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"text":"Message:"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_MessagesComposer_Label5",
                                    "events":{"click":"___MessagesComposer_Label5_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "text":"(clear)",
                                          "percentWidth":100
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":TextArea,
                           "id":"bodyText",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "height":160
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":MessagesAttachmentsListEditor,
                  "id":"attachmentEditor",
                  "propertiesFactory":function():Object
                  {
                     return {"percentWidth":100};
                  }
               })]};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _108417msg = new MgbMessage();
         _1897626133friendsNamesAC = new ArrayCollection(_friendsNames);
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.borderColor = 16777215;
            this.verticalGap = 4;
            this.headerHeight = 2;
         };
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "auto";
         this.styleName = "cleanPanelSolid";
         this.addEventListener("creationComplete",___MessagesComposer_Panel1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MessagesComposer._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      private function get msg() : MgbMessage
      {
         return this._108417msg;
      }
      
      private function set msg(param1:MgbMessage) : void
      {
         var _loc2_:Object = this._108417msg;
         if(_loc2_ !== param1)
         {
            this._108417msg = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msg",_loc2_,param1));
         }
      }
      
      public function set subjectInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1529844226subjectInput;
         if(_loc2_ !== param1)
         {
            this._1529844226subjectInput = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subjectInput",_loc2_,param1));
         }
      }
      
      public function set toNameInput(param1:AutoComplete) : void
      {
         var _loc2_:Object = this._591263684toNameInput;
         if(_loc2_ !== param1)
         {
            this._591263684toNameInput = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toNameInput",_loc2_,param1));
         }
      }
      
      private function clearBody() : void
      {
         bodyText.text = "";
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MessagesComposer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _MessagesComposer_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_MessagesComposerWatcherSetupUtil");
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
      
      [Bindable(event="propertyChange")]
      private function get _friendsNames() : Array
      {
         return this._1480278894_friendsNames;
      }
      
      private function clearAll() : void
      {
         toNameInput.text = "";
         subjectInput.text = "";
         clearBody();
         clearAttachments();
      }
      
      private function authUserSignin(param1:Event) : void
      {
         if(mgbSession.authenticatedName)
         {
            friendsList = MgbCaches.getInstance().friendshipsListCache.getFriendships(mgbSession.authenticatedName);
            friendsList.addEventListener("gotNewRows",updateFriendNames);
            updateFriendNames(null);
         }
      }
      
      public function addMessageAttachmentToMessage(param1:MgbMessageAttachment) : void
      {
         attachmentEditor.addMessageAttachmentToMessage(param1);
      }
      
      private function set _friendsNames(param1:Array) : void
      {
         var _loc2_:Object = this._1480278894_friendsNames;
         if(_loc2_ !== param1)
         {
            this._1480278894_friendsNames = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_friendsNames",_loc2_,param1));
         }
      }
      
      private function set friendsList(param1:MgbFriendshipsList) : void
      {
         var _loc2_:Object = this._1405524947friendsList;
         if(_loc2_ !== param1)
         {
            this._1405524947friendsList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendsList",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messagesComposerBackgroundColor() : SelectBackgroundColor
      {
         return this._24991063messagesComposerBackgroundColor;
      }
      
      private function clearAttachments() : void
      {
         msg.attachmentsAC.removeAll();
      }
      
      private function initControl() : void
      {
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_AUTHENTICATED_USER_SIGNED_OUT,authUserSignout);
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_AUTHENTICATED_USER_SIGNED_IN,authUserSignin);
         authUserSignin(null);
         msg.addEventListener(MessageArrivalEvent.LOADED,sendMessageResultHandler);
         msg.addEventListener(FaultEvent.FAULT,sendMessageFaultHandler);
      }
      
      [Bindable(event="propertyChange")]
      private function get friendsNamesAC() : ArrayCollection
      {
         return this._1897626133friendsNamesAC;
      }
      
      private function set friendsNamesAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1897626133friendsNamesAC;
         if(_loc2_ !== param1)
         {
            this._1897626133friendsNamesAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendsNamesAC",_loc2_,param1));
         }
      }
      
      public function ___MessagesComposer_LinkButton2_click(param1:MouseEvent) : void
      {
         clearAll();
      }
      
      public function ___MessagesComposer_Label5_click(param1:MouseEvent) : void
      {
         clearBody();
      }
      
      private function updateFriendNames(param1:Event) : void
      {
         var _loc2_:MgbFriendship = null;
         friendsNamesAC.removeAll();
         for each(_loc2_ in friendsList.friendshipsListAC)
         {
            friendsNamesAC.addItem(_loc2_.friendname);
         }
         toNameInput.text = "";
      }
      
      private function sendMessageFaultHandler(param1:FaultEvent) : void
      {
         Alert.show("Couldn\'t send message.. please try again later");
      }
      
      [Bindable(event="propertyChange")]
      public function get toNameInput() : AutoComplete
      {
         return this._591263684toNameInput;
      }
      
      private function _MessagesComposer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = bodyText.text.length > 0 && !msg.sendPending && toNameInput.text.length > 1;
         _loc1_ = friendsNamesAC;
         _loc1_ = MgbSystem.restrictCharactersInUsername + "!";
         _loc1_ = MgbSystem.maxSubjectLength;
         _loc1_ = bodyText.text.length > 0;
         _loc1_ = MgbSystem.maxMessageLength;
         _loc1_ = msg.attachmentsAC;
      }
      
      public function set messagesComposerBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._24991063messagesComposerBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._24991063messagesComposerBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messagesComposerBackgroundColor",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get friendsList() : MgbFriendshipsList
      {
         return this._1405524947friendsList;
      }
      
      private function sendMessageResultHandler(param1:MessageArrivalEvent) : void
      {
         requestCloseWindow();
         MgbCaches.getInstance().messageConversationsCache.addMessageToConversationCache(msg.fromName,msg);
         clearAll();
      }
      
      public function ___MessagesComposer_Panel1_creationComplete(param1:FlexEvent) : void
      {
         initControl();
      }
      
      private function _MessagesComposer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return bodyText.text.length > 0 && !msg.sendPending && toNameInput.text.length > 1;
         },function(param1:Boolean):void
         {
            _MessagesComposer_LinkButton1.enabled = param1;
         },"_MessagesComposer_LinkButton1.enabled");
         result[0] = binding;
         binding = new Binding(this,function():Object
         {
            return friendsNamesAC;
         },function(param1:Object):void
         {
            toNameInput.dataProvider = param1;
         },"toNameInput.dataProvider");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.restrictCharactersInUsername + "!";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            toNameInput.restrict = param1;
         },"toNameInput.restrict");
         result[2] = binding;
         binding = new Binding(this,function():int
         {
            return MgbSystem.maxSubjectLength;
         },function(param1:int):void
         {
            subjectInput.maxChars = param1;
         },"subjectInput.maxChars");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return bodyText.text.length > 0;
         },function(param1:Boolean):void
         {
            _MessagesComposer_Label5.enabled = param1;
         },"_MessagesComposer_Label5.enabled");
         result[4] = binding;
         binding = new Binding(this,function():int
         {
            return MgbSystem.maxMessageLength;
         },function(param1:int):void
         {
            bodyText.maxChars = param1;
         },"bodyText.maxChars");
         result[5] = binding;
         binding = new Binding(this,function():ArrayCollection
         {
            return msg.attachmentsAC;
         },function(param1:ArrayCollection):void
         {
            attachmentEditor.attachmentsAC = param1;
         },"attachmentEditor.attachmentsAC");
         result[6] = binding;
         return result;
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
      
      private function authUserSignout(param1:Event) : void
      {
         clearAll();
      }
      
      private function sendMessage() : void
      {
         if(toNameInput.text == mgbSession.authenticatedName)
         {
            Alert.show("Talking to yourself is the first sign of madness, and we don\'t want any more crazies on MGB. Surely you know someone to talk to? :)");
         }
         else
         {
            msg.body = bodyText.text;
            msg.subject = subjectInput.text;
            msg.toName = toNameInput.text;
            msg.fromName = MgbSession.getInstance().authenticatedName;
            msg.send();
         }
      }
      
      public function set attachmentEditor(param1:MessagesAttachmentsListEditor) : void
      {
         var _loc2_:Object = this._147079056attachmentEditor;
         if(_loc2_ !== param1)
         {
            this._147079056attachmentEditor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"attachmentEditor",_loc2_,param1));
         }
      }
      
      public function set bodyText(param1:TextArea) : void
      {
         var _loc2_:Object = this._1702646255bodyText;
         if(_loc2_ !== param1)
         {
            this._1702646255bodyText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bodyText",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      public function get bodyText() : TextArea
      {
         return this._1702646255bodyText;
      }
      
      [Bindable(event="propertyChange")]
      public function get attachmentEditor() : MessagesAttachmentsListEditor
      {
         return this._147079056attachmentEditor;
      }
      
      public function requestCloseWindow() : void
      {
         dispatchEvent(new Event(CLOSE_ME_PLEASE_EVENT,true));
      }
      
      public function ___MessagesComposer_LinkButton1_click(param1:MouseEvent) : void
      {
         sendMessage();
      }
      
      public function ___MessagesComposer_LinkButton3_click(param1:MouseEvent) : void
      {
         requestCloseWindow();
      }
      
      [Bindable(event="propertyChange")]
      public function get subjectInput() : TextInput
      {
         return this._1529844226subjectInput;
      }
   }
}
