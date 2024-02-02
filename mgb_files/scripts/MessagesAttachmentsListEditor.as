package
{
   import com.mgb.controls.BitmapDuper;
   import com.mgb.data.*;
   import com.mgb.managers.*;
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
   import mx.containers.VBox;
   import mx.controls.*;
   import mx.core.*;
   import mx.effects.Fade;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class MessagesAttachmentsListEditor extends VBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _MessagesAttachmentsListEditor_Label2:Array;
      
      public var _MessagesAttachmentsListEditor_Label3:Array;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _1293151773giveFlag:Array;
      
      public var _MessagesAttachmentsListEditor_HBox1:HBox;
      
      public var _MessagesAttachmentsListEditor_HBox2:Array;
      
      private var _1676095234conversationId:String;
      
      public var _MessagesAttachmentsListEditor_VBox1:VBox;
      
      public var _MessagesAttachmentsListEditor_VBox2:Array;
      
      public var _MessagesAttachmentsListEditor_VBox3:Array;
      
      private var _1433127027showAttachments:CheckBox;
      
      public var _MessagesAttachmentsListEditor_VBox4:Array;
      
      private var _1133192915repAttachments:Repeater;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _771941275pieceOwner:Array;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1220689315myEffect:Fade;
      
      private var _1444978193showInEditMode:Boolean = true;
      
      public var _MessagesAttachmentsListEditor_BitmapDuper1:Array;
      
      mx_internal var _bindings:Array;
      
      private var _899122924commentBox:Array;
      
      private var _1506826286attachmentsAC:ArrayCollection;
      
      public var _MessagesAttachmentsListEditor_LinkButton1:LinkButton;
      
      public var _MessagesAttachmentsListEditor_Text3:Array;
      
      public var _MessagesAttachmentsListEditor_LinkButton3:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public var _MessagesAttachmentsListEditor_LinkButton2:LinkButton;
      
      public function MessagesAttachmentsListEditor()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "id":"_MessagesAttachmentsListEditor_VBox1",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "id":"_MessagesAttachmentsListEditor_HBox1",
                  "stylesFactory":function():void
                  {
                     this.backgroundColor = 0;
                     this.backgroundAlpha = 0.2;
                     this.fontWeight = "bold";
                     this.paddingLeft = 6;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":LinkButton,
                           "id":"_MessagesAttachmentsListEditor_LinkButton1",
                           "events":{"click":"___MessagesAttachmentsListEditor_LinkButton1_click"},
                           "propertiesFactory":function():Object
                           {
                              return {"label":"Add Attachment"};
                           }
                        }),new UIComponentDescriptor({
                           "type":LinkButton,
                           "id":"_MessagesAttachmentsListEditor_LinkButton2",
                           "events":{"click":"___MessagesAttachmentsListEditor_LinkButton2_click"}
                        }),new UIComponentDescriptor({
                           "type":CheckBox,
                           "id":"showAttachments",
                           "propertiesFactory":function():Object
                           {
                              return {"selected":true};
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Repeater,
                  "id":"repAttachments",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HBox,
                           "id":"_MessagesAttachmentsListEditor_HBox2",
                           "stylesFactory":function():void
                           {
                              this.backgroundAlpha = 0.1;
                              this.backgroundColor = 128;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":BitmapDuper,
                                    "id":"_MessagesAttachmentsListEditor_BitmapDuper1",
                                    "events":{"click":"___MessagesAttachmentsListEditor_BitmapDuper1_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "height":128,
                                          "width":128
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"_MessagesAttachmentsListEditor_VBox2",
                                    "stylesFactory":function():void
                                    {
                                       this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":196,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":HBox,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"childDescriptors":[new UIComponentDescriptor({
                                                   "type":Text,
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "text":"Builder:",
                                                         "width":60
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Label,
                                                   "id":"pieceOwner",
                                                   "stylesFactory":function():void
                                                   {
                                                      this.fontWeight = "bold";
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"width":128};
                                                   }
                                                })]};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HBox,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"childDescriptors":[new UIComponentDescriptor({
                                                   "type":Text,
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "text":"Project:",
                                                         "width":60
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Label,
                                                   "id":"_MessagesAttachmentsListEditor_Label2",
                                                   "stylesFactory":function():void
                                                   {
                                                      this.fontWeight = "bold";
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"width":128};
                                                   }
                                                })]};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HBox,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"childDescriptors":[new UIComponentDescriptor({
                                                   "type":Text,
                                                   "id":"_MessagesAttachmentsListEditor_Text3",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"width":60};
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Label,
                                                   "id":"_MessagesAttachmentsListEditor_Label3",
                                                   "stylesFactory":function():void
                                                   {
                                                      this.fontWeight = "bold";
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"width":128};
                                                   }
                                                })]};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":CheckBox,
                                             "id":"giveFlag",
                                             "events":{"change":"__giveFlag_change"},
                                             "stylesFactory":function():void
                                             {
                                                this.disabledColor = 4210752;
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":LinkButton,
                                             "id":"_MessagesAttachmentsListEditor_LinkButton3",
                                             "events":{"click":"___MessagesAttachmentsListEditor_LinkButton3_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "label":"(remove)",
                                                   "toolTip":"remove this attachment from the message"
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"_MessagesAttachmentsListEditor_VBox3",
                                    "stylesFactory":function():void
                                    {
                                       this.paddingRight = 16;
                                       this.verticalGap = 0;
                                       this.paddingBottom = 16;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"Comment:"};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HBox,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"width":16};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":TextArea,
                                                      "id":"commentBox",
                                                      "events":{"change":"__commentBox_change"},
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "percentWidth":100,
                                                            "percentHeight":100
                                                         };
                                                      }
                                                   })]
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"_MessagesAttachmentsListEditor_VBox4",
                                    "stylesFactory":function():void
                                    {
                                       this.paddingRight = 16;
                                       this.paddingBottom = 12;
                                       this.paddingTop = 12;
                                       this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":LinkButton,
                                             "events":{"click":"___MessagesAttachmentsListEditor_LinkButton4_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "label":"Accept friend request",
                                                   "toolTip":"A message will be sent to let them know you have accepted"
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Spacer,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"height":8};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Label,
                                             "stylesFactory":function():void
                                             {
                                                this.paddingLeft = 8;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"To ignore the friend request, just delete this message"};
                                             }
                                          })]
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
         });
         _1217010542mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         _MessagesAttachmentsListEditor_Fade1_i();
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MessagesAttachmentsListEditor._watcherSetupUtil = param1;
      }
      
      private function _MessagesAttachmentsListEditor_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return MgbMessageAttachment(repAttachments.currentItem).showAttachmentHider;
         },function(param1:Boolean):void
         {
            _MessagesAttachmentsListEditor_HBox1.includeInLayout = param1;
         },"_MessagesAttachmentsListEditor_HBox1.includeInLayout");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return MgbMessageAttachment(repAttachments.currentItem).showAttachmentHider;
         },function(param1:Boolean):void
         {
            _MessagesAttachmentsListEditor_HBox1.visible = param1;
         },"_MessagesAttachmentsListEditor_HBox1.visible");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showInEditMode;
         },function(param1:Boolean):void
         {
            _MessagesAttachmentsListEditor_LinkButton1.visible = param1;
         },"_MessagesAttachmentsListEditor_LinkButton1.visible");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showInEditMode;
         },function(param1:Boolean):void
         {
            _MessagesAttachmentsListEditor_LinkButton1.includeInLayout = param1;
         },"_MessagesAttachmentsListEditor_LinkButton1.includeInLayout");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return attachmentsAC.length < MgbSystem.maxMessageAttachments;
         },function(param1:Boolean):void
         {
            _MessagesAttachmentsListEditor_LinkButton1.enabled = param1;
         },"_MessagesAttachmentsListEditor_LinkButton1.enabled");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showInEditMode && attachmentsAC.length > 0;
         },function(param1:Boolean):void
         {
            _MessagesAttachmentsListEditor_LinkButton2.visible = param1;
         },"_MessagesAttachmentsListEditor_LinkButton2.visible");
         result[5] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showInEditMode;
         },function(param1:Boolean):void
         {
            _MessagesAttachmentsListEditor_LinkButton2.includeInLayout = param1;
         },"_MessagesAttachmentsListEditor_LinkButton2.includeInLayout");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Remove all Attachments (" + attachmentsAC.length + ")";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MessagesAttachmentsListEditor_LinkButton2.label = param1;
         },"_MessagesAttachmentsListEditor_LinkButton2.label");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showInEditMode == false && attachmentsAC.length > 0;
         },function(param1:Boolean):void
         {
            showAttachments.visible = param1;
         },"showAttachments.visible");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showInEditMode == false && attachmentsAC.length > 0;
         },function(param1:Boolean):void
         {
            showAttachments.includeInLayout = param1;
         },"showAttachments.includeInLayout");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ">> Show all (" + attachmentsAC.length + ") attachments ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            showAttachments.label = param1;
         },"showAttachments.label");
         result[10] = binding;
         binding = new Binding(this,function():Object
         {
            return attachmentsAC;
         },function(param1:Object):void
         {
            repAttachments.dataProvider = param1;
         },"repAttachments.dataProvider");
         result[11] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return showAttachments.selected;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_HBox2[param2[0]].visible = param1;
         },"_MessagesAttachmentsListEditor_HBox2.visible");
         result[12] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return showAttachments.selected;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_HBox2[param2[0]].includeInLayout = param1;
         },"_MessagesAttachmentsListEditor_HBox2.includeInLayout");
         result[13] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):*
         {
            return myEffect;
         },function(param1:*, param2:Array):void
         {
            _MessagesAttachmentsListEditor_HBox2[param2[0]].setStyle("showEffect",param1);
         },"_MessagesAttachmentsListEditor_HBox2.showEffect");
         result[14] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):MgbMessageAttachment
         {
            return MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0]));
         },function(param1:MgbMessageAttachment, param2:Array):void
         {
            _MessagesAttachmentsListEditor_BitmapDuper1[param2[0]].messageAttachmentToView = param1;
         },"_MessagesAttachmentsListEditor_BitmapDuper1.messageAttachmentToView");
         result[15] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).showItemImage;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_BitmapDuper1[param2[0]].includeInLayout = param1;
         },"_MessagesAttachmentsListEditor_BitmapDuper1.includeInLayout");
         result[16] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).showItemImage;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_BitmapDuper1[param2[0]].visible = param1;
         },"_MessagesAttachmentsListEditor_BitmapDuper1.visible");
         result[17] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).showItemDescription;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_VBox2[param2[0]].includeInLayout = param1;
         },"_MessagesAttachmentsListEditor_VBox2.includeInLayout");
         result[18] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).showItemDescription;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_VBox2[param2[0]].visible = param1;
         },"_MessagesAttachmentsListEditor_VBox2.visible");
         result[19] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).userName;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            pieceOwner[param2[0]].text = param1;
         },"pieceOwner.text");
         result[20] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).project;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            _MessagesAttachmentsListEditor_Label2[param2[0]].text = param1;
         },"_MessagesAttachmentsListEditor_Label2.text");
         result[21] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).itemType + ":";
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            _MessagesAttachmentsListEditor_Text3[param2[0]].text = param1;
         },"_MessagesAttachmentsListEditor_Text3.text");
         result[22] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).itemName;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            _MessagesAttachmentsListEditor_Label3[param2[0]].text = param1;
         },"_MessagesAttachmentsListEditor_Label3.text");
         result[23] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return (MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).flags & MgbMessageAttachment.FLAG_ACTS_AS_GIVE) > 0;
         },function(param1:Boolean, param2:Array):void
         {
            giveFlag[param2[0]].selected = param1;
         },"giveFlag.selected");
         result[24] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).canBeGiven;
         },function(param1:Boolean, param2:Array):void
         {
            giveFlag[param2[0]].visible = param1;
         },"giveFlag.visible");
         result[25] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return showInEditMode;
         },function(param1:Boolean, param2:Array):void
         {
            giveFlag[param2[0]].enabled = param1;
         },"giveFlag.enabled");
         result[26] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = "Give " + MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).itemType + " to recipient";
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            giveFlag[param2[0]].label = param1;
         },"giveFlag.label");
         result[27] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = "If *checked*, this item is being \'given\' - this lets the recipient take a copy of this " + MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).itemType + " to put in their projects, send to other users, etc. \\nIf *unchecked*, this is just a " + MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).itemType + " that the recipient can look at, but not copy into their own projects. To copy, just click on the tile image to the left - it will open in the editor and can then be saved into your own projects";
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            giveFlag[param2[0]].toolTip = param1;
         },"giveFlag.toolTip");
         result[28] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return showInEditMode;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_LinkButton3[param2[0]].visible = param1;
         },"_MessagesAttachmentsListEditor_LinkButton3.visible");
         result[29] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return showInEditMode || Boolean(MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).showCommentField);
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_VBox3[param2[0]].visible = param1;
         },"_MessagesAttachmentsListEditor_VBox3.visible");
         result[30] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return showInEditMode || Boolean(MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).showCommentField);
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_VBox3[param2[0]].includeInLayout = param1;
         },"_MessagesAttachmentsListEditor_VBox3.includeInLayout");
         result[31] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).comment;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            commentBox[param2[0]].text = param1;
         },"commentBox.text");
         result[32] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return showInEditMode;
         },function(param1:Boolean, param2:Array):void
         {
            commentBox[param2[0]].editable = param1;
         },"commentBox.editable");
         result[33] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).isFriendRequest;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_VBox4[param2[0]].visible = param1;
         },"_MessagesAttachmentsListEditor_VBox4.visible");
         result[34] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Boolean
         {
            return MgbMessageAttachment(repAttachments.mx_internal::getItemAt(param2[0])).isFriendRequest;
         },function(param1:Boolean, param2:Array):void
         {
            _MessagesAttachmentsListEditor_VBox4[param2[0]].includeInLayout = param1;
         },"_MessagesAttachmentsListEditor_VBox4.includeInLayout");
         result[35] = binding;
         return result;
      }
      
      public function __commentBox_change(param1:Event) : void
      {
         commentChange(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get commentBox() : Array
      {
         return this._899122924commentBox;
      }
      
      [Bindable(event="propertyChange")]
      public function get conversationId() : String
      {
         return this._1676095234conversationId;
      }
      
      private function commentChange(param1:Event) : void
      {
         param1.target.getRepeaterItem().comment = commentBox[param1.target.instanceIndices[0]].text;
      }
      
      private function _MessagesAttachmentsListEditor_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).showAttachmentHider;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).showAttachmentHider;
         _loc1_ = showInEditMode;
         _loc1_ = showInEditMode;
         _loc1_ = attachmentsAC.length < MgbSystem.maxMessageAttachments;
         _loc1_ = showInEditMode && attachmentsAC.length > 0;
         _loc1_ = showInEditMode;
         _loc1_ = "Remove all Attachments (" + attachmentsAC.length + ")";
         _loc1_ = showInEditMode == false && attachmentsAC.length > 0;
         _loc1_ = showInEditMode == false && attachmentsAC.length > 0;
         _loc1_ = ">> Show all (" + attachmentsAC.length + ") attachments ";
         _loc1_ = attachmentsAC;
         _loc1_ = showAttachments.selected;
         _loc1_ = showAttachments.selected;
         _loc1_ = myEffect;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem);
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).showItemImage;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).showItemImage;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).showItemDescription;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).showItemDescription;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).userName;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).project;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).itemType + ":";
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).itemName;
         _loc1_ = (MgbMessageAttachment(repAttachments.currentItem).flags & MgbMessageAttachment.FLAG_ACTS_AS_GIVE) > 0;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).canBeGiven;
         _loc1_ = showInEditMode;
         _loc1_ = "Give " + MgbMessageAttachment(repAttachments.currentItem).itemType + " to recipient";
         _loc1_ = "If *checked*, this item is being \'given\' - this lets the recipient take a copy of this " + MgbMessageAttachment(repAttachments.currentItem).itemType + " to put in their projects, send to other users, etc. \\nIf *unchecked*, this is just a " + MgbMessageAttachment(repAttachments.currentItem).itemType + " that the recipient can look at, but not copy into their own projects. To copy, just click on the tile image to the left - it will open in the editor and can then be saved into your own projects";
         _loc1_ = showInEditMode;
         _loc1_ = showInEditMode || MgbMessageAttachment(repAttachments.currentItem).showCommentField;
         _loc1_ = showInEditMode || MgbMessageAttachment(repAttachments.currentItem).showCommentField;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).comment;
         _loc1_ = showInEditMode;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).isFriendRequest;
         _loc1_ = MgbMessageAttachment(repAttachments.currentItem).isFriendRequest;
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
      
      public function set showInEditMode(param1:Boolean) : void
      {
         var _loc2_:Object = this._1444978193showInEditMode;
         if(_loc2_ !== param1)
         {
            this._1444978193showInEditMode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showInEditMode",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MessagesAttachmentsListEditor = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _MessagesAttachmentsListEditor_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_MessagesAttachmentsListEditorWatcherSetupUtil");
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
      public function get showInEditMode() : Boolean
      {
         return this._1444978193showInEditMode;
      }
      
      [Bindable(event="propertyChange")]
      public function get pieceOwner() : Array
      {
         return this._771941275pieceOwner;
      }
      
      public function set showAttachments(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1433127027showAttachments;
         if(_loc2_ !== param1)
         {
            this._1433127027showAttachments = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showAttachments",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function addMessageAttachmentToMessage(param1:MgbMessageAttachment) : void
      {
         if(attachmentsAC.length < MgbSystem.maxMessageAttachments)
         {
            attachmentsAC.addItem(param1);
         }
         else
         {
            Alert.show("You may only send " + MgbSystem.maxMessageAttachments + " attachments in each message. Try sending this message as it is, and then send another message with the rest of the items","Message full");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get giveFlag() : Array
      {
         return this._1293151773giveFlag;
      }
      
      public function set repAttachments(param1:Repeater) : void
      {
         var _loc2_:Object = this._1133192915repAttachments;
         if(_loc2_ !== param1)
         {
            this._1133192915repAttachments = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"repAttachments",_loc2_,param1));
         }
      }
      
      public function ___MessagesAttachmentsListEditor_LinkButton2_click(param1:MouseEvent) : void
      {
         attachmentsAC.removeAll();
      }
      
      public function ___MessagesAttachmentsListEditor_LinkButton4_click(param1:MouseEvent) : void
      {
         acceptFriendRequest(param1);
      }
      
      public function set attachmentsAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1506826286attachmentsAC;
         if(_loc2_ !== param1)
         {
            this._1506826286attachmentsAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"attachmentsAC",_loc2_,param1));
         }
      }
      
      public function __giveFlag_change(param1:Event) : void
      {
         giveFlagcheckBoxChange(param1);
      }
      
      private function giveFlagcheckBoxChange(param1:Event) : void
      {
         var _loc2_:int = int(param1.target.instanceIndices[0]);
         if(pieceOwner[_loc2_].text != mgbSession.authenticatedName && giveFlag[_loc2_].selected == true)
         {
            Alert.show("You can\'t give what you don\'t own!");
            giveFlag[_loc2_].selected = false;
         }
         param1.target.getRepeaterItem().isBeingGiven = giveFlag[_loc2_].selected;
      }
      
      public function set giveFlag(param1:Array) : void
      {
         var _loc2_:Object = this._1293151773giveFlag;
         if(_loc2_ !== param1)
         {
            this._1293151773giveFlag = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giveFlag",_loc2_,param1));
         }
      }
      
      private function removeAttachment(param1:MgbMessageAttachment) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < attachmentsAC.length)
         {
            if(attachmentsAC[_loc2_] == param1)
            {
               attachmentsAC.removeItemAt(_loc2_);
               return;
            }
            _loc2_++;
         }
      }
      
      public function set myEffect(param1:Fade) : void
      {
         var _loc2_:Object = this._1220689315myEffect;
         if(_loc2_ !== param1)
         {
            this._1220689315myEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myEffect",_loc2_,param1));
         }
      }
      
      public function ___MessagesAttachmentsListEditor_BitmapDuper1_click(param1:MouseEvent) : void
      {
         launchItem(MgbMessageAttachment(param1.currentTarget.getRepeaterItem()));
      }
      
      [Bindable(event="propertyChange")]
      public function get attachmentsAC() : ArrayCollection
      {
         return this._1506826286attachmentsAC;
      }
      
      public function set commentBox(param1:Array) : void
      {
         var _loc2_:Object = this._899122924commentBox;
         if(_loc2_ !== param1)
         {
            this._899122924commentBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"commentBox",_loc2_,param1));
         }
      }
      
      public function set pieceOwner(param1:Array) : void
      {
         var _loc2_:Object = this._771941275pieceOwner;
         if(_loc2_ !== param1)
         {
            this._771941275pieceOwner = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pieceOwner",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myEffect() : Fade
      {
         return this._1220689315myEffect;
      }
      
      public function ___MessagesAttachmentsListEditor_LinkButton1_click(param1:MouseEvent) : void
      {
         addAttachmentButtonHandler();
      }
      
      public function ___MessagesAttachmentsListEditor_LinkButton3_click(param1:MouseEvent) : void
      {
         removeAttachment(param1.currentTarget.getRepeaterItem());
      }
      
      private function launchItem(param1:MgbMessageAttachment) : void
      {
         switch(param1.itemType)
         {
            case Piece.MGB_TILE:
               if(param1.userName == mgbSession.authenticatedName || param1.isBeingGiven == true)
               {
                  mgbSession.navGotoTileMaker(param1.itemName,param1.userName,param1.project);
               }
               break;
            case Piece.MGB_MAP:
         }
      }
      
      private function acceptFriendRequest(param1:Event) : void
      {
         var _loc2_:MgbMessageAttachment = MgbMessageAttachment(param1.currentTarget.getRepeaterItem());
         var _loc3_:MgbFriendshipsList = MgbCaches.getInstance().friendshipsListCache.getFriendships(mgbSession.authenticatedName);
         _loc3_.addFriendship(_loc2_.userName,this.conversationId);
      }
      
      [Bindable(event="propertyChange")]
      public function get repAttachments() : Repeater
      {
         return this._1133192915repAttachments;
      }
      
      private function addAttachmentButtonHandler() : void
      {
         Alert.show("To add an attachment to a message, go to the \'Current Project\' tab and drag tiles/maps to the envelope icon");
      }
      
      [Bindable(event="propertyChange")]
      public function get showAttachments() : CheckBox
      {
         return this._1433127027showAttachments;
      }
      
      public function set conversationId(param1:String) : void
      {
         var _loc2_:Object = this._1676095234conversationId;
         if(_loc2_ !== param1)
         {
            this._1676095234conversationId = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"conversationId",_loc2_,param1));
         }
      }
      
      private function _MessagesAttachmentsListEditor_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         myEffect = _loc1_;
         _loc1_.duration = 350;
         return _loc1_;
      }
   }
}
