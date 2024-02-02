package
{
   import com.mgb.controls.AutoTruncatedLabel;
   import com.mgb.controls.BitmapDuper;
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
   import mx.collections.ArrayCollection;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.*;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.formatters.DateFormatter;
   import mx.rpc.events.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class MessagesConversationView extends Panel implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      public static const CLOSE_ME_PLEASE_EVENT:String = "Mgb_MessagesConversationView_closeRequest";
       
      
      private var _433699017replyText:TextArea;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _940821457avatarPreview:Array;
      
      private var _2047467752shortDateDisplay:DateFormatter;
      
      public var _MessagesConversationView_LinkButton2:LinkButton;
      
      private var _873639351messageBody:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _740154499conversation:MgbMessageConversation;
      
      private var _2060164376longDateDisplay:DateFormatter;
      
      private var _209346968conversationViewTabBackgroundColor:SelectBackgroundColor;
      
      mx_internal var _watchers:Array;
      
      private var _532201064attachmentView:Array;
      
      private var _949720988column2:Array;
      
      public var _MessagesConversationView_HBox5:HBox;
      
      private var _949720987column1:Array;
      
      public var _MessagesConversationView_AutoTruncatedLabel1:Array;
      
      public var _MessagesConversationView_VBox3:VBox;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _192594147_conversationId:String;
      
      private var _1964060937repMessages:Repeater;
      
      public var _MessagesConversationView_Panel1:Panel;
      
      private var _108401386reply:MgbMessage;
      
      public var _MessagesConversationView_Spacer6:Spacer;
      
      public var _MessagesConversationView_Spacer7:Spacer;
      
      private var _147079056attachmentEditor:MessagesAttachmentsListEditor;
      
      public var _MessagesConversationView_Label1:Label;
      
      public var _MessagesConversationView_Label2:Array;
      
      mx_internal var _bindings:Array;
      
      public var _MessagesConversationView_Label4:Label;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function MessagesConversationView()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Panel,
            "id":"_MessagesConversationView_Panel1",
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
                           "id":"_MessagesConversationView_Label1",
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
                           "events":{"click":"___MessagesConversationView_LinkButton1_click"},
                           "propertiesFactory":function():Object
                           {
                              return {"label":"Close window"};
                           }
                        }),new UIComponentDescriptor({
                           "type":SelectBackgroundColor,
                           "id":"conversationViewTabBackgroundColor"
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Repeater,
                  "id":"repMessages",
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function():void
                        {
                           this.backgroundColor = 0;
                           this.backgroundAlpha = 0.1;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "percentWidth":100,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":VBox,
                                 "id":"column1",
                                 "stylesFactory":function():void
                                 {
                                    this.verticalGap = 0;
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":102,
                                       "childDescriptors":[new UIComponentDescriptor({
                                          "type":AutoTruncatedLabel,
                                          "id":"_MessagesConversationView_AutoTruncatedLabel1",
                                          "stylesFactory":function():void
                                          {
                                             this.textAlign = "center";
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {"percentWidth":100};
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":HBox,
                                          "stylesFactory":function():void
                                          {
                                             this.horizontalGap = 0;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "percentWidth":100,
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":Spacer,
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"percentWidth":100};
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":BitmapDuper,
                                                   "id":"avatarPreview",
                                                   "stylesFactory":function():void
                                                   {
                                                      this.left = "4";
                                                      this.top = "0";
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "width":64,
                                                         "height":64
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
                                          "type":Label,
                                          "id":"_MessagesConversationView_Label2",
                                          "propertiesFactory":function():Object
                                          {
                                             return {"percentWidth":100};
                                          }
                                       })]
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":VBox,
                                 "id":"column2",
                                 "stylesFactory":function():void
                                 {
                                    this.verticalGap = 0;
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "percentWidth":100,
                                       "childDescriptors":[new UIComponentDescriptor({
                                          "type":TextArea,
                                          "id":"messageBody",
                                          "stylesFactory":function():void
                                          {
                                             this.backgroundAlpha = 0;
                                             this.borderStyle = "none";
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "editable":false,
                                                "height":128,
                                                "percentWidth":100,
                                                "wordWrap":true
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":MessagesAttachmentsListEditor,
                                          "id":"attachmentView",
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "percentWidth":100,
                                                "showInEditMode":false
                                             };
                                          }
                                       })]
                                    };
                                 }
                              })]
                           };
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":HRule,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "height":2,
                        "percentWidth":100
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "height":160,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":VBox,
                           "id":"_MessagesConversationView_VBox3",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":102,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function():void
                                    {
                                       this.textAlign = "right";
                                       this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "text":"Reply: ",
                                          "percentWidth":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_MessagesConversationView_Label4",
                                    "events":{"click":"___MessagesConversationView_Label4_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.textAlign = "right";
                                       this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "text":"(clear)",
                                          "percentWidth":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":TextArea,
                           "id":"replyText",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":VBox,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Spacer,
                                    "id":"_MessagesConversationView_Spacer6",
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spacer,
                                    "id":"_MessagesConversationView_Spacer7",
                                    "propertiesFactory":function():Object
                                    {
                                       return {"height":8};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_MessagesConversationView_LinkButton2",
                                    "events":{"click":"___MessagesConversationView_LinkButton2_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"label":"Send reply"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "events":{"click":"___MessagesConversationView_LinkButton3_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"label":"Delete conversation"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "events":{"click":"___MessagesConversationView_LinkButton4_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"label":"Close window"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "id":"_MessagesConversationView_HBox5",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"width":102};
                           }
                        }),new UIComponentDescriptor({
                           "type":MessagesAttachmentsListEditor,
                           "id":"attachmentEditor",
                           "propertiesFactory":function():Object
                           {
                              return {"percentWidth":100};
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
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
            this.headerHeight = 2;
            this.borderColor = 16777215;
            this.verticalGap = 4;
         };
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "auto";
         this.styleName = "cleanPanelSolid";
         _MessagesConversationView_DateFormatter2_i();
         _MessagesConversationView_DateFormatter1_i();
         this.addEventListener("creationComplete",___MessagesConversationView_Panel1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MessagesConversationView._watcherSetupUtil = param1;
      }
      
      private function _MessagesConversationView_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Subject: " + conversation.subject;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MessagesConversationView_Label1.text = param1;
         },"_MessagesConversationView_Label1.text");
         result[0] = binding;
         binding = new Binding(this,function():Object
         {
            return conversation.messageListAC;
         },function(param1:Object):void
         {
            repMessages.dataProvider = param1;
         },"repMessages.dataProvider");
         result[1] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = repMessages.mx_internal::getItemAt(param2[0]).fromName;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            _MessagesConversationView_AutoTruncatedLabel1[param2[0]].text = param1;
         },"_MessagesConversationView_AutoTruncatedLabel1.text");
         result[2] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = repMessages.mx_internal::getItemAt(param2[0]).fromName;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            avatarPreview[param2[0]].avatarName = param1;
         },"avatarPreview.avatarName");
         result[3] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = shortDateDisplay.format(repMessages.mx_internal::getItemAt(param2[0]).date);
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            _MessagesConversationView_Label2[param2[0]].text = param1;
         },"_MessagesConversationView_Label2.text");
         result[4] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = longDateDisplay.format(repMessages.mx_internal::getItemAt(param2[0]).date);
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            _MessagesConversationView_Label2[param2[0]].toolTip = param1;
         },"_MessagesConversationView_Label2.toolTip");
         result[5] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = repMessages.mx_internal::getItemAt(param2[0]).body;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            messageBody[param2[0]].htmlText = param1;
         },"messageBody.htmlText");
         result[6] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):ArrayCollection
         {
            return repMessages.mx_internal::getItemAt(param2[0]).attachmentsAC;
         },function(param1:ArrayCollection, param2:Array):void
         {
            attachmentView[param2[0]].attachmentsAC = param1;
         },"attachmentView.attachmentsAC");
         result[7] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = conversation.conversationId;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            attachmentView[param2[0]].conversationId = param1;
         },"attachmentView.conversationId");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !conversation.disableReplies;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_VBox3.visible = param1;
         },"_MessagesConversationView_VBox3.visible");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return replyText.text.length > 0;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_Label4.enabled = param1;
         },"_MessagesConversationView_Label4.enabled");
         result[10] = binding;
         binding = new Binding(this,function():int
         {
            return MgbSystem.maxMessageLength;
         },function(param1:int):void
         {
            replyText.maxChars = param1;
         },"replyText.maxChars");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !conversation.disableReplies;
         },function(param1:Boolean):void
         {
            replyText.visible = param1;
         },"replyText.visible");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !conversation.disableReplies;
         },function(param1:Boolean):void
         {
            replyText.includeInLayout = param1;
         },"replyText.includeInLayout");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !conversation.disableReplies;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_Spacer6.includeInLayout = param1;
         },"_MessagesConversationView_Spacer6.includeInLayout");
         result[14] = binding;
         binding = new Binding(this,function():Boolean
         {
            return conversation.disableReplies;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_Spacer7.includeInLayout = param1;
         },"_MessagesConversationView_Spacer7.includeInLayout");
         result[15] = binding;
         binding = new Binding(this,function():Boolean
         {
            return replyText.text.length > 0 && !reply.sendPending;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_LinkButton2.enabled = param1;
         },"_MessagesConversationView_LinkButton2.enabled");
         result[16] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !conversation.disableReplies;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_LinkButton2.visible = param1;
         },"_MessagesConversationView_LinkButton2.visible");
         result[17] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !conversation.disableReplies;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_LinkButton2.includeInLayout = param1;
         },"_MessagesConversationView_LinkButton2.includeInLayout");
         result[18] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !conversation.disableReplies;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_HBox5.includeInLayout = param1;
         },"_MessagesConversationView_HBox5.includeInLayout");
         result[19] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !conversation.disableReplies;
         },function(param1:Boolean):void
         {
            _MessagesConversationView_HBox5.visible = param1;
         },"_MessagesConversationView_HBox5.visible");
         result[20] = binding;
         binding = new Binding(this,function():ArrayCollection
         {
            return reply.attachmentsAC;
         },function(param1:ArrayCollection):void
         {
            attachmentEditor.attachmentsAC = param1;
         },"attachmentEditor.attachmentsAC");
         result[21] = binding;
         return result;
      }
      
      public function ___MessagesConversationView_Panel1_creationComplete(param1:FlexEvent) : void
      {
         initControl();
      }
      
      public function addMessageAttachmentToReply(param1:MgbMessageAttachment) : void
      {
         attachmentEditor.addMessageAttachmentToMessage(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get repMessages() : Repeater
      {
         return this._1964060937repMessages;
      }
      
      [Bindable(event="propertyChange")]
      public function set conversationId(param1:String) : void
      {
         var _loc2_:Object = this.conversationId;
         if(_loc2_ !== param1)
         {
            this._1676095234conversationId = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"conversationId",_loc2_,param1));
         }
      }
      
      private function set conversation(param1:MgbMessageConversation) : void
      {
         var _loc2_:Object = this._740154499conversation;
         if(_loc2_ !== param1)
         {
            this._740154499conversation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"conversation",_loc2_,param1));
         }
      }
      
      public function set repMessages(param1:Repeater) : void
      {
         var _loc2_:Object = this._1964060937repMessages;
         if(_loc2_ !== param1)
         {
            this._1964060937repMessages = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"repMessages",_loc2_,param1));
         }
      }
      
      private function clearAll() : void
      {
         replyText.text = "";
         reply.attachmentsAC.removeAll();
      }
      
      [Bindable(event="propertyChange")]
      private function get _conversationId() : String
      {
         return this._192594147_conversationId;
      }
      
      [Bindable(event="propertyChange")]
      public function get longDateDisplay() : DateFormatter
      {
         return this._2060164376longDateDisplay;
      }
      
      public function ___MessagesConversationView_LinkButton1_click(param1:MouseEvent) : void
      {
         requestCloseWindow();
      }
      
      [Bindable(event="propertyChange")]
      public function get shortDateDisplay() : DateFormatter
      {
         return this._2047467752shortDateDisplay;
      }
      
      private function processNewRows(param1:Event) : void
      {
      }
      
      private function initControl() : void
      {
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_AUTHENTICATED_USER_SIGNED_OUT,authUserSignout);
         reply = new MgbMessage();
         reply.addEventListener(MessageArrivalEvent.LOADED,sendReplyResultHandler);
         reply.addEventListener(FaultEvent.FAULT,sendReplyFaultHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get avatarPreview() : Array
      {
         return this._940821457avatarPreview;
      }
      
      private function sendReplyFaultHandler(param1:FaultEvent) : void
      {
         Alert.show("Couldn\'t send reply.. please try again later");
      }
      
      public function set column1(param1:Array) : void
      {
         var _loc2_:Object = this._949720987column1;
         if(_loc2_ !== param1)
         {
            this._949720987column1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"column1",_loc2_,param1));
         }
      }
      
      public function set column2(param1:Array) : void
      {
         var _loc2_:Object = this._949720988column2;
         if(_loc2_ !== param1)
         {
            this._949720988column2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"column2",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get replyText() : TextArea
      {
         return this._433699017replyText;
      }
      
      private function sendReply() : void
      {
         reply.body = replyText.text;
         reply.subject = conversation.subject;
         reply.toName = conversation.buddyname;
         reply.fromName = MgbSession.getInstance().authenticatedName;
         if(reply.toName == reply.fromName)
         {
            trace("assertion failure: \'reply.toName != reply.fromName\' in sendReply()");
         }
         reply.send(conversation.conversationId);
      }
      
      public function set longDateDisplay(param1:DateFormatter) : void
      {
         var _loc2_:Object = this._2060164376longDateDisplay;
         if(_loc2_ !== param1)
         {
            this._2060164376longDateDisplay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"longDateDisplay",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageBody() : Array
      {
         return this._873639351messageBody;
      }
      
      private function sendReplyResultHandler(param1:MessageArrivalEvent) : void
      {
         MgbCaches.getInstance().messageConversationsCache.addMessageToConversationCache(reply.fromName,reply);
         clearAll();
      }
      
      private function set _1676095234conversationId(param1:String) : void
      {
         trace("set conversationId=\'" + param1 + "\'  when authName = " + mgbSession.authenticatedName);
         _conversationId = param1;
         if(Boolean(param1) && param1 != "")
         {
            conversation = MgbCaches.getInstance().messageConversationsCache.getConversation(mgbSession.authenticatedName,param1,true);
            conversation.addEventListener("gotNewRows",processNewRows);
         }
         else
         {
            conversation = null;
         }
      }
      
      public function set shortDateDisplay(param1:DateFormatter) : void
      {
         var _loc2_:Object = this._2047467752shortDateDisplay;
         if(_loc2_ !== param1)
         {
            this._2047467752shortDateDisplay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shortDateDisplay",_loc2_,param1));
         }
      }
      
      public function ___MessagesConversationView_Label4_click(param1:MouseEvent) : void
      {
         clearAll();
      }
      
      private function set _conversationId(param1:String) : void
      {
         var _loc2_:Object = this._192594147_conversationId;
         if(_loc2_ !== param1)
         {
            this._192594147_conversationId = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_conversationId",_loc2_,param1));
         }
      }
      
      public function set avatarPreview(param1:Array) : void
      {
         var _loc2_:Object = this._940821457avatarPreview;
         if(_loc2_ !== param1)
         {
            this._940821457avatarPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"avatarPreview",_loc2_,param1));
         }
      }
      
      public function ___MessagesConversationView_LinkButton2_click(param1:MouseEvent) : void
      {
         sendReply();
      }
      
      public function authUserSignout(param1:Event) : void
      {
         clearAll();
      }
      
      [Bindable(event="propertyChange")]
      public function get attachmentView() : Array
      {
         return this._532201064attachmentView;
      }
      
      [Bindable(event="propertyChange")]
      public function get conversationViewTabBackgroundColor() : SelectBackgroundColor
      {
         return this._209346968conversationViewTabBackgroundColor;
      }
      
      [Bindable(event="propertyChange")]
      public function get attachmentEditor() : MessagesAttachmentsListEditor
      {
         return this._147079056attachmentEditor;
      }
      
      public function set replyText(param1:TextArea) : void
      {
         var _loc2_:Object = this._433699017replyText;
         if(_loc2_ !== param1)
         {
            this._433699017replyText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"replyText",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      private function get conversation() : MgbMessageConversation
      {
         return this._740154499conversation;
      }
      
      private function _MessagesConversationView_DateFormatter2_i() : DateFormatter
      {
         var _loc1_:DateFormatter = new DateFormatter();
         longDateDisplay = _loc1_;
         _loc1_.formatString = "EEEE, MMMM D, YYYY at L:NN A";
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MessagesConversationView = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _MessagesConversationView_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_MessagesConversationViewWatcherSetupUtil");
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
      
      public function set messageBody(param1:Array) : void
      {
         var _loc2_:Object = this._873639351messageBody;
         if(_loc2_ !== param1)
         {
            this._873639351messageBody = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageBody",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get column1() : Array
      {
         return this._949720987column1;
      }
      
      [Bindable(event="propertyChange")]
      public function get column2() : Array
      {
         return this._949720988column2;
      }
      
      public function ___MessagesConversationView_LinkButton3_click(param1:MouseEvent) : void
      {
         deleteConversation();
      }
      
      private function _MessagesConversationView_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "Subject: " + conversation.subject;
         _loc1_ = conversation.messageListAC;
         _loc1_ = repMessages.currentItem.fromName;
         _loc1_ = repMessages.currentItem.fromName;
         _loc1_ = shortDateDisplay.format(repMessages.currentItem.date);
         _loc1_ = longDateDisplay.format(repMessages.currentItem.date);
         _loc1_ = repMessages.currentItem.body;
         _loc1_ = repMessages.currentItem.attachmentsAC;
         _loc1_ = conversation.conversationId;
         _loc1_ = !conversation.disableReplies;
         _loc1_ = replyText.text.length > 0;
         _loc1_ = MgbSystem.maxMessageLength;
         _loc1_ = !conversation.disableReplies;
         _loc1_ = !conversation.disableReplies;
         _loc1_ = !conversation.disableReplies;
         _loc1_ = conversation.disableReplies;
         _loc1_ = replyText.text.length > 0 && !reply.sendPending;
         _loc1_ = !conversation.disableReplies;
         _loc1_ = !conversation.disableReplies;
         _loc1_ = !conversation.disableReplies;
         _loc1_ = !conversation.disableReplies;
         _loc1_ = reply.attachmentsAC;
      }
      
      private function _MessagesConversationView_DateFormatter1_i() : DateFormatter
      {
         var _loc1_:DateFormatter = new DateFormatter();
         shortDateDisplay = _loc1_;
         _loc1_.formatString = "MM/DD/YY L:NN A";
         return _loc1_;
      }
      
      public function set conversationViewTabBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._209346968conversationViewTabBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._209346968conversationViewTabBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"conversationViewTabBackgroundColor",_loc2_,param1));
         }
      }
      
      private function deleteConversation() : void
      {
         dispatchEvent(new DeleteConversationEvent(DeleteConversationEvent.DELETE_CONVERSATION,conversation.conversationId));
      }
      
      public function set attachmentView(param1:Array) : void
      {
         var _loc2_:Object = this._532201064attachmentView;
         if(_loc2_ !== param1)
         {
            this._532201064attachmentView = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"attachmentView",_loc2_,param1));
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
      
      public function set attachmentEditor(param1:MessagesAttachmentsListEditor) : void
      {
         var _loc2_:Object = this._147079056attachmentEditor;
         if(_loc2_ !== param1)
         {
            this._147079056attachmentEditor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"attachmentEditor",_loc2_,param1));
         }
      }
      
      private function set reply(param1:MgbMessage) : void
      {
         var _loc2_:Object = this._108401386reply;
         if(_loc2_ !== param1)
         {
            this._108401386reply = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reply",_loc2_,param1));
         }
      }
      
      public function ___MessagesConversationView_LinkButton4_click(param1:MouseEvent) : void
      {
         requestCloseWindow();
      }
      
      [Bindable(event="propertyChange")]
      private function get reply() : MgbMessage
      {
         return this._108401386reply;
      }
      
      public function requestCloseWindow() : void
      {
         dispatchEvent(new Event(CLOSE_ME_PLEASE_EVENT));
      }
      
      public function get conversationId() : String
      {
         return _conversationId;
      }
   }
}
