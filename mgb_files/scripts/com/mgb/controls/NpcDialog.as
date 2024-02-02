package com.mgb.controls
{
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
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.Image;
   import mx.controls.LinkButton;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class NpcDialog extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1102661043borderImgCls:Class;
      
      mx_internal var _watchers:Array;
      
      private var _1215697276fontFamilyString:String;
      
      private var _1533988097messageToShow:String;
      
      private var _embed_mxml__________Resources_CloseIcon_PNG_1777034285:Class;
      
      private var _208482656continueMessage:Text;
      
      private var _751720114choice3:LinkButton;
      
      private var _3433268pan1:Panel;
      
      public var _NpcDialog_Image1:Image;
      
      private var _1713767982leftActor:ActorPreview;
      
      private var _2091691953characterCountVisibleSoFar:int;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _751720113choice2:LinkButton;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _954925063message:TextArea;
      
      private var _751720112choice1:LinkButton;
      
      public function NpcDialog()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"_NpcDialog_Image1",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":20,
                        "y":14,
                        "maintainAspectRatio":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Panel,
                  "id":"pan1",
                  "stylesFactory":function():void
                  {
                     this.shadowDistance = 0;
                     this.headerHeight = 0;
                     this.right = "20";
                     this.left = "20";
                     this.top = "14";
                     this.cornerRadius = 20;
                     this.backgroundColor = 16777215;
                     this.backgroundAlpha = 0;
                     this.paddingBottom = 8;
                     this.paddingLeft = 8;
                     this.paddingRight = 8;
                     this.paddingTop = 16;
                     this.dropShadowEnabled = false;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"cleanPanel",
                        "verticalScrollPolicy":"off",
                        "horizontalScrollPolicy":"off",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HBox,
                           "stylesFactory":function():void
                           {
                              this.borderStyle = "none";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":VBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Spacer,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"percentHeight":100};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":ActorPreview,
                                             "id":"leftActor"
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
                                    "type":VBox,
                                    "stylesFactory":function():void
                                    {
                                       this.paddingRight = 22;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentHeight":100,
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":TextArea,
                                             "id":"message",
                                             "stylesFactory":function():void
                                             {
                                                this.backgroundAlpha = 0;
                                                this.borderStyle = "none";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "editable":false,
                                                   "percentWidth":100,
                                                   "height":96
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":LinkButton,
                                             "id":"choice1",
                                             "events":{"click":"__choice1_click"},
                                             "stylesFactory":function():void
                                             {
                                                this.fontWeight = "normal";
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":LinkButton,
                                             "id":"choice2",
                                             "events":{"click":"__choice2_click"},
                                             "stylesFactory":function():void
                                             {
                                                this.fontWeight = "normal";
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":LinkButton,
                                             "id":"choice3",
                                             "events":{"click":"__choice3_click"},
                                             "stylesFactory":function():void
                                             {
                                                this.fontWeight = "normal";
                                             }
                                          })]
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"continueMessage",
                           "stylesFactory":function():void
                           {
                              this.textAlign = "right";
                              this.fontSize = 12;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "text":"Press CTRL key to continue...",
                                 "percentWidth":100
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "events":{"click":"___NpcDialog_Image2_click"},
                  "stylesFactory":function():void
                  {
                     this.top = "30";
                     this.right = "34";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"source":_embed_mxml__________Resources_CloseIcon_PNG_1777034285};
                  }
               })]};
            }
         });
         _1102661043borderImgCls = NpcDialog_borderImgCls;
         _1215697276fontFamilyString = MgbSystem.gameFonts[0];
         _embed_mxml__________Resources_CloseIcon_PNG_1777034285 = NpcDialog__embed_mxml__________Resources_CloseIcon_PNG_1777034285;
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
            this.backgroundAlpha = 0;
         };
         this.minHeight = 216;
         this.minWidth = 400;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         NpcDialog._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      private function get fontFamilyString() : String
      {
         return this._1215697276fontFamilyString;
      }
      
      private function showNextChar(param1:Event = null) : void
      {
         characterCountVisibleSoFar += 2;
         if(messageToShow == null || characterCountVisibleSoFar > messageToShow.length)
         {
            slowTyping(false);
            choice1.visible = choice2.visible = choice3.visible = true;
            if(messageToShow == null)
            {
               message.verticalScrollPosition = 0;
            }
         }
         else
         {
            message.verticalScrollPosition = message.textHeight;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : TextArea
      {
         return this._954925063message;
      }
      
      public function setParams(param1:Object) : void
      {
         clearParams();
         if(param1.leftActor)
         {
            leftActor.show(param1.leftActor);
         }
         if(Boolean(param1.message) && param1.message is String)
         {
            messageToShow = param1.message;
            characterCountVisibleSoFar = 1;
            slowTyping(true);
         }
         if(param1.choice1 is String && String(param1.choice1).length > 0)
         {
            choice1.label = param1.choice1;
         }
         if(param1.choice2 is String && String(param1.choice2).length > 0)
         {
            choice2.label = param1.choice2;
         }
         if(param1.choice3 is String && String(param1.choice3).length > 0)
         {
            choice3.label = param1.choice3;
         }
         choice1.visible = false;
         choice2.visible = false;
         choice3.visible = false;
         continueMessage.visible = choice1.label == null && choice2.label == null && choice3.label == null;
         if(Boolean(param1.font) && param1.font is String)
         {
            fontFamilyString = param1.font;
         }
         else
         {
            fontFamilyString = MgbSystem.gameFonts[0];
         }
      }
      
      private function set messageToShow(param1:String) : void
      {
         var _loc2_:Object = this._1533988097messageToShow;
         if(_loc2_ !== param1)
         {
            this._1533988097messageToShow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageToShow",_loc2_,param1));
         }
      }
      
      public function set message(param1:TextArea) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
         }
      }
      
      private function set fontFamilyString(param1:String) : void
      {
         var _loc2_:Object = this._1215697276fontFamilyString;
         if(_loc2_ !== param1)
         {
            this._1215697276fontFamilyString = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontFamilyString",_loc2_,param1));
         }
      }
      
      private function set characterCountVisibleSoFar(param1:int) : void
      {
         var _loc2_:Object = this._2091691953characterCountVisibleSoFar;
         if(_loc2_ !== param1)
         {
            this._2091691953characterCountVisibleSoFar = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"characterCountVisibleSoFar",_loc2_,param1));
         }
      }
      
      public function __choice2_click(param1:MouseEvent) : void
      {
         choiceClicked(2);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:NpcDialog = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _NpcDialog_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_controls_NpcDialogWatcherSetupUtil");
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
      public function get leftActor() : ActorPreview
      {
         return this._1713767982leftActor;
      }
      
      [Bindable(event="propertyChange")]
      public function get choice1() : LinkButton
      {
         return this._751720112choice1;
      }
      
      [Bindable(event="propertyChange")]
      public function get choice3() : LinkButton
      {
         return this._751720114choice3;
      }
      
      public function clearParams() : void
      {
         leftActor.show();
         messageToShow = null;
         choice1.label = null;
         choice2.label = null;
         choice3.label = null;
      }
      
      [Bindable(event="propertyChange")]
      public function get pan1() : Panel
      {
         return this._3433268pan1;
      }
      
      [Bindable(event="propertyChange")]
      public function get choice2() : LinkButton
      {
         return this._751720113choice2;
      }
      
      public function set continueMessage(param1:Text) : void
      {
         var _loc2_:Object = this._208482656continueMessage;
         if(_loc2_ !== param1)
         {
            this._208482656continueMessage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"continueMessage",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderImgCls() : Class
      {
         return this._1102661043borderImgCls;
      }
      
      [Bindable(event="propertyChange")]
      private function get messageToShow() : String
      {
         return this._1533988097messageToShow;
      }
      
      private function choiceClicked(param1:int) : void
      {
         dispatchEvent(new NpcDialogEvent(NpcDialogEvent.choiceMade,param1));
      }
      
      [Bindable(event="propertyChange")]
      private function get characterCountVisibleSoFar() : int
      {
         return this._2091691953characterCountVisibleSoFar;
      }
      
      private function _NpcDialog_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = borderImgCls;
         _loc1_ = pan1.height;
         _loc1_ = pan1.width;
         _loc1_ = messageToShow.slice(0,characterCountVisibleSoFar);
         _loc1_ = fontFamilyString;
         _loc1_ = fontFamilyString;
         _loc1_ = choice1.label != null;
         _loc1_ = choice1.label != null;
         _loc1_ = fontFamilyString;
         _loc1_ = choice2.label != null;
         _loc1_ = choice2.label != null;
         _loc1_ = fontFamilyString;
         _loc1_ = choice3.label != null;
         _loc1_ = choice3.label != null;
      }
      
      private function slowTyping(param1:Boolean) : void
      {
         if(param1)
         {
            addEventListener("enterFrame",showNextChar);
         }
         else
         {
            this.removeEventListener("enterFrame",showNextChar);
         }
      }
      
      public function __choice1_click(param1:MouseEvent) : void
      {
         choiceClicked(1);
      }
      
      public function __choice3_click(param1:MouseEvent) : void
      {
         choiceClicked(3);
      }
      
      public function set leftActor(param1:ActorPreview) : void
      {
         var _loc2_:Object = this._1713767982leftActor;
         if(_loc2_ !== param1)
         {
            this._1713767982leftActor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftActor",_loc2_,param1));
         }
      }
      
      public function set choice1(param1:LinkButton) : void
      {
         var _loc2_:Object = this._751720112choice1;
         if(_loc2_ !== param1)
         {
            this._751720112choice1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"choice1",_loc2_,param1));
         }
      }
      
      public function set choice3(param1:LinkButton) : void
      {
         var _loc2_:Object = this._751720114choice3;
         if(_loc2_ !== param1)
         {
            this._751720114choice3 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"choice3",_loc2_,param1));
         }
      }
      
      public function set borderImgCls(param1:Class) : void
      {
         var _loc2_:Object = this._1102661043borderImgCls;
         if(_loc2_ !== param1)
         {
            this._1102661043borderImgCls = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderImgCls",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get continueMessage() : Text
      {
         return this._208482656continueMessage;
      }
      
      public function set pan1(param1:Panel) : void
      {
         var _loc2_:Object = this._3433268pan1;
         if(_loc2_ !== param1)
         {
            this._3433268pan1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pan1",_loc2_,param1));
         }
      }
      
      public function set choice2(param1:LinkButton) : void
      {
         var _loc2_:Object = this._751720113choice2;
         if(_loc2_ !== param1)
         {
            this._751720113choice2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"choice2",_loc2_,param1));
         }
      }
      
      public function ___NpcDialog_Image2_click(param1:MouseEvent) : void
      {
         choiceClicked(0);
      }
      
      private function _NpcDialog_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return borderImgCls;
         },function(param1:Object):void
         {
            _NpcDialog_Image1.source = param1;
         },"_NpcDialog_Image1.source");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return pan1.height;
         },function(param1:Number):void
         {
            _NpcDialog_Image1.height = param1;
         },"_NpcDialog_Image1.height");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return pan1.width;
         },function(param1:Number):void
         {
            _NpcDialog_Image1.width = param1;
         },"_NpcDialog_Image1.width");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = messageToShow.slice(0,characterCountVisibleSoFar);
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            message.text = param1;
         },"message.text");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = fontFamilyString;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            message.setStyle("fontFamily",param1);
         },"message.fontFamily");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = fontFamilyString;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            choice1.setStyle("fontFamily",param1);
         },"choice1.fontFamily");
         result[5] = binding;
         binding = new Binding(this,function():Boolean
         {
            return choice1.label != null;
         },function(param1:Boolean):void
         {
            choice1.visible = param1;
         },"choice1.visible");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return choice1.label != null;
         },function(param1:Boolean):void
         {
            choice1.includeInLayout = param1;
         },"choice1.includeInLayout");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = fontFamilyString;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            choice2.setStyle("fontFamily",param1);
         },"choice2.fontFamily");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return choice2.label != null;
         },function(param1:Boolean):void
         {
            choice2.visible = param1;
         },"choice2.visible");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return choice2.label != null;
         },function(param1:Boolean):void
         {
            choice2.includeInLayout = param1;
         },"choice2.includeInLayout");
         result[10] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = fontFamilyString;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            choice3.setStyle("fontFamily",param1);
         },"choice3.fontFamily");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return choice3.label != null;
         },function(param1:Boolean):void
         {
            choice3.visible = param1;
         },"choice3.visible");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return choice3.label != null;
         },function(param1:Boolean):void
         {
            choice3.includeInLayout = param1;
         },"choice3.includeInLayout");
         result[13] = binding;
         return result;
      }
   }
}
