package
{
   import com.mgb.data.MgbTutorial;
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
   import mx.binding.utils.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.HSlider;
   import mx.controls.LinkButton;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.effects.Glow;
   import mx.events.PropertyChangeEvent;
   import mx.events.SliderEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class EditFooterComponent extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var maxLevelTag:String;
      
      private var descriptiveVerb:String = "";
      
      private var maxLevelSupported:int = 1;
      
      private var currentLevelTag:String;
      
      private var myWatcherMaxLevel:ChangeWatcher;
      
      private var _1217010542mgbSession:MgbSession;
      
      public var _EditFooterComponent_Text1:Text;
      
      private var _1874196999textSkillBox:Text;
      
      public var _EditFooterComponent_Button1:Button;
      
      private var _608421221tutorialBack:LinkButton;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1236788598skillSliderCanvas:Canvas;
      
      private var _1790870882PanelTutorial:Panel;
      
      private var _842119394sliderChangeEffect:Glow;
      
      mx_internal var _watchers:Array;
      
      private var toolControl:UIComponent = null;
      
      private var _608937469tutorialSkip:LinkButton;
      
      private var _2139181690mgbTutorial:ActiveTutorial;
      
      private var _896842355PanelTutorialLeftGap:int = 200;
      
      private var _1392263458PanelGuestInfo:Panel;
      
      private var _69155344sliderSkill:HSlider;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _608783217tutorialNext:Button;
      
      public var _EditFooterComponent_LinkButton3:LinkButton;
      
      private var _89369547TextTutorial:TextArea;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var currentTutorial:MgbTutorial;
      
      mx_internal var _bindings:Array;
      
      public function EditFooterComponent()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "height":66,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Panel,
                     "id":"PanelGuestInfo",
                     "stylesFactory":function():void
                     {
                        this.cornerRadius = 4;
                        this.headerHeight = 2;
                        this.right = "0";
                        this.borderThicknessBottom = 4;
                        this.borderThicknessTop = 4;
                        this.borderThicknessLeft = 6;
                        this.borderThicknessRight = 6;
                        this.verticalGap = 2;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "y":0,
                           "height":62,
                           "layout":"absolute",
                           "horizontalScrollPolicy":"off",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Text,
                              "id":"_EditFooterComponent_Text1",
                              "stylesFactory":function():void
                              {
                                 this.horizontalCenter = "0";
                                 this.top = "2";
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"_EditFooterComponent_Button1",
                              "events":{"click":"___EditFooterComponent_Button1_click"},
                              "stylesFactory":function():void
                              {
                                 this.horizontalCenter = "0";
                                 this.bottom = "4";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {"label":"Choose another user"};
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Panel,
                     "id":"PanelTutorial",
                     "stylesFactory":function():void
                     {
                        this.cornerRadius = 4;
                        this.headerHeight = 2;
                        this.right = "0";
                        this.borderThicknessBottom = 4;
                        this.borderThicknessTop = 4;
                        this.borderThicknessLeft = 6;
                        this.borderThicknessRight = 6;
                        this.verticalGap = 2;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "y":0,
                           "height":62,
                           "layout":"absolute",
                           "horizontalScrollPolicy":"off",
                           "filters":[_EditFooterComponent_GlowFilter2_c()],
                           "childDescriptors":[new UIComponentDescriptor({
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
                                          return {"width":8};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":VBox,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "width":60,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Spacer,
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"height":1};
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"tutorialNext",
                                                "events":{"click":"__tutorialNext_click"},
                                                "stylesFactory":function():void
                                                {
                                                   this.borderColor = 40960;
                                                   this.fillColors = [40960,40960];
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "height":18,
                                                      "filters":[_EditFooterComponent_GlowFilter1_c()]
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"tutorialSkip",
                                                "events":{"click":"__tutorialSkip_click"},
                                                "stylesFactory":function():void
                                                {
                                                   this.bottom = "0";
                                                   this.textDecoration = "underline";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "label":"Skip",
                                                      "height":18
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"tutorialBack",
                                                "events":{"click":"__tutorialBack_click"},
                                                "stylesFactory":function():void
                                                {
                                                   this.bottom = "0";
                                                   this.textDecoration = "underline";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "label":"Back",
                                                      "height":18
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "percentHeight":100,
                                             "autoLayout":true,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"TextTutorial",
                                                "stylesFactory":function():void
                                                {
                                                   this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":0,
                                                      "y":0,
                                                      "percentWidth":100,
                                                      "percentHeight":100,
                                                      "wordWrap":true,
                                                      "editable":false,
                                                      "styleName":"tutorialText"
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_EditFooterComponent_LinkButton3",
                                                "events":{"click":"___EditFooterComponent_LinkButton3_click"},
                                                "stylesFactory":function():void
                                                {
                                                   this.horizontalCenter = "0";
                                                   this.verticalCenter = "0";
                                                   this.textDecoration = "underline";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"styleName":"standoutLarge"};
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
                  }),new UIComponentDescriptor({
                     "type":Canvas,
                     "id":"skillSliderCanvas",
                     "stylesFactory":function():void
                     {
                        this.left = "4";
                        this.backgroundColor = 16777215;
                        this.cornerRadius = 10;
                        this.borderThickness = 4;
                        this.borderStyle = "solid";
                        this.borderColor = 16777215;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "y":2,
                           "height":60,
                           "width":188
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":HSlider,
                     "id":"sliderSkill",
                     "events":{
                        "mouseUp":"__sliderSkill_mouseUp",
                        "change":"__sliderSkill_change"
                     },
                     "stylesFactory":function():void
                     {
                        this.borderColor = 8388863;
                        this.left = "12";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "y":1,
                           "width":170,
                           "liveDragging":true,
                           "snapInterval":1,
                           "maximum":15,
                           "allowTrackClick":true,
                           "minimum":1,
                           "styleName":"denseTable",
                           "enabled":true
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Text,
                     "id":"textSkillBox",
                     "stylesFactory":function():void
                     {
                        this.left = "10";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "y":40,
                           "text":" Skill level"
                        };
                     }
                  })]
               };
            }
         });
         _2139181690mgbTutorial = ActiveTutorial.getInstance();
         _1217010542mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 66;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.clipContent = true;
         _EditFooterComponent_Glow1_i();
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         EditFooterComponent._watcherSetupUtil = param1;
      }
      
      public function set tutorialNext(param1:Button) : void
      {
         var _loc2_:Object = this._608783217tutorialNext;
         if(_loc2_ !== param1)
         {
            this._608783217tutorialNext = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialNext",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textSkillBox() : Text
      {
         return this._1874196999textSkillBox;
      }
      
      public function set sliderChangeEffect(param1:Glow) : void
      {
         var _loc2_:Object = this._842119394sliderChangeEffect;
         if(_loc2_ !== param1)
         {
            this._842119394sliderChangeEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderChangeEffect",_loc2_,param1));
         }
      }
      
      private function set mgbTutorial(param1:ActiveTutorial) : void
      {
         var _loc2_:Object = this._2139181690mgbTutorial;
         if(_loc2_ !== param1)
         {
            this._2139181690mgbTutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbTutorial",_loc2_,param1));
         }
      }
      
      private function watcherListenerProp(param1:PropertyChangeEvent) : void
      {
         if(param1.property == maxLevelTag || param1.property == currentLevelTag)
         {
            updateSliderFromProfileValues();
         }
      }
      
      public function set skillSliderCanvas(param1:Canvas) : void
      {
         var _loc2_:Object = this._1236788598skillSliderCanvas;
         if(_loc2_ !== param1)
         {
            this._1236788598skillSliderCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skillSliderCanvas",_loc2_,param1));
         }
      }
      
      public function __tutorialBack_click(param1:MouseEvent) : void
      {
         mgbTutorial.tutorialStep(-1);
      }
      
      public function __tutorialNext_click(param1:MouseEvent) : void
      {
         mgbTutorial.tutorialStep(1);
      }
      
      public function set textSkillBox(param1:Text) : void
      {
         var _loc2_:Object = this._1874196999textSkillBox;
         if(_loc2_ !== param1)
         {
            this._1874196999textSkillBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textSkillBox",_loc2_,param1));
         }
      }
      
      private function set PanelTutorialLeftGap(param1:int) : void
      {
         var _loc2_:Object = this._896842355PanelTutorialLeftGap;
         if(_loc2_ !== param1)
         {
            this._896842355PanelTutorialLeftGap = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"PanelTutorialLeftGap",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get PanelGuestInfo() : Panel
      {
         return this._1392263458PanelGuestInfo;
      }
      
      private function _EditFooterComponent_Glow1_i() : Glow
      {
         var _loc1_:Glow = new Glow();
         sliderChangeEffect = _loc1_;
         _loc1_.alphaFrom = 0.8;
         _loc1_.alphaTo = 0;
         _loc1_.duration = 1400;
         _loc1_.color = 4210752;
         _loc1_.blurXFrom = 24;
         _loc1_.blurXTo = 0;
         _loc1_.blurYFrom = 16;
         _loc1_.blurYTo = 0;
         _loc1_.inner = false;
         _loc1_.strength = 4;
         BindingManager.executeBindings(this,"sliderChangeEffect",sliderChangeEffect);
         return _loc1_;
      }
      
      private function _EditFooterComponent_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Array
         {
            return [textSkillBox,sliderSkill];
         },function(param1:Array):void
         {
            sliderChangeEffect.targets = param1;
         },"sliderChangeEffect.targets");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest == true;
         },function(param1:Boolean):void
         {
            PanelGuestInfo.visible = param1;
         },"PanelGuestInfo.visible");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = PanelTutorialLeftGap;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            PanelGuestInfo.setStyle("left",param1);
         },"PanelGuestInfo.left");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Viewing " + mgbSession.userName + "\'s work using Guest mode - you can view but not save";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _EditFooterComponent_Text1.text = param1;
         },"_EditFooterComponent_Text1.text");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedIn;
         },function(param1:Boolean):void
         {
            _EditFooterComponent_Button1.visible = param1;
         },"_EditFooterComponent_Button1.visible");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest == false;
         },function(param1:Boolean):void
         {
            PanelTutorial.visible = param1;
         },"PanelTutorial.visible");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = PanelTutorialLeftGap;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            PanelTutorial.setStyle("left",param1);
         },"PanelTutorial.left");
         result[6] = binding;
         binding = new Binding(this,function():uint
         {
            return !!mgbTutorial.activeTutorialEnableStartButton ? (!!mgbSession.userLoggedInForTheFirstTimeEver ? 65535 : 16776960) : 15723722;
         },function(param1:uint):void
         {
            PanelTutorial.setStyle("backgroundColor",param1);
         },"PanelTutorial.backgroundColor");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = mgbTutorial.activeTutorial.comment;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            PanelTutorial.toolTip = param1;
         },"PanelTutorial.toolTip");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbTutorial.activeTutorialEnableNextButton;
         },function(param1:Boolean):void
         {
            tutorialNext.visible = param1;
         },"tutorialNext.visible");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = mgbTutorial.activeTutorialNextButtonText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            tutorialNext.label = param1;
         },"tutorialNext.label");
         result[10] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbTutorial.activeTutorialEnableSkipButton;
         },function(param1:Boolean):void
         {
            tutorialSkip.visible = param1;
         },"tutorialSkip.visible");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbTutorial.activeTutorialEnableSkipButton;
         },function(param1:Boolean):void
         {
            tutorialSkip.includeInLayout = param1;
         },"tutorialSkip.includeInLayout");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbTutorial.activeTutorialEnableBackButton;
         },function(param1:Boolean):void
         {
            tutorialBack.visible = param1;
         },"tutorialBack.visible");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbTutorial.activeTutorialEnableBackButton;
         },function(param1:Boolean):void
         {
            tutorialBack.includeInLayout = param1;
         },"tutorialBack.includeInLayout");
         result[14] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = mgbTutorial.activeTutorialText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            TextTutorial.htmlText = param1;
         },"TextTutorial.htmlText");
         result[15] = binding;
         binding = new Binding(this,function():uint
         {
            return !!mgbTutorial.activeTutorialEnableStartButton ? (!!mgbSession.userLoggedInForTheFirstTimeEver ? 65535 : 16776960) : 15131311;
         },function(param1:uint):void
         {
            TextTutorial.setStyle("backgroundColor",param1);
         },"TextTutorial.backgroundColor");
         result[16] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Start next tutorial? " + mgbTutorial.activeTutorial.comment;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _EditFooterComponent_LinkButton3.label = param1;
         },"_EditFooterComponent_LinkButton3.label");
         result[17] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbTutorial.activeTutorialEnableStartButton;
         },function(param1:Boolean):void
         {
            _EditFooterComponent_LinkButton3.visible = param1;
         },"_EditFooterComponent_LinkButton3.visible");
         result[18] = binding;
         binding = new Binding(this,function():*
         {
            return sliderChangeEffect;
         },function(param1:*):void
         {
            _EditFooterComponent_LinkButton3.setStyle("showEffect",param1);
         },"_EditFooterComponent_LinkButton3.showEffect");
         result[19] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeSlidersText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skillSliderCanvas.toolTip = param1;
         },"skillSliderCanvas.toolTip");
         result[20] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeSlidersText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            sliderSkill.toolTip = param1;
         },"sliderSkill.toolTip");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeSlidersText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            textSkillBox.toolTip = param1;
         },"textSkillBox.toolTip");
         result[22] = binding;
         return result;
      }
      
      private function sliderLimitsCheck(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(sliderSkill)
         {
            _loc2_ = String(Application.application.getUserProfile(maxLevelTag));
            _loc3_ = !!_loc2_ ? int(_loc2_) : 1;
            if(sliderSkill.value > _loc3_)
            {
               sliderSkill.value = _loc3_;
            }
            internalSliderMoveEventHandler(param1);
         }
      }
      
      public function set PanelGuestInfo(param1:Panel) : void
      {
         var _loc2_:Object = this._1392263458PanelGuestInfo;
         if(_loc2_ !== param1)
         {
            this._1392263458PanelGuestInfo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"PanelGuestInfo",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get PanelTutorial() : Panel
      {
         return this._1790870882PanelTutorial;
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorialBack() : LinkButton
      {
         return this._608421221tutorialBack;
      }
      
      public function configureSlider(param1:int, param2:String, param3:String, param4:Function, param5:UIComponent) : void
      {
         this.descriptiveVerb = param3;
         this.toolControl = param5;
         this.maxLevelTag = "skillLevel" + param2;
         this.currentLevelTag = "skillLevelCurrent" + param2;
         this.maxLevelSupported = param1;
         myWatcherMaxLevel = ChangeWatcher.watch(Application.application,["userProfile","profileObj",this.maxLevelTag],watcherListenerProp);
         myWatcherMaxLevel = ChangeWatcher.watch(Application.application,["userProfile","profileObj",this.currentLevelTag],watcherListenerProp);
         updateSliderFromProfileValues();
         sliderSkill.addEventListener("change",param4);
         sliderSkill.addEventListener("change",internalSliderMoveEventHandler);
         param4(null);
         internalSliderMoveEventHandler(null);
         sliderSkill.labels = [1,int(param1 / 2),param1];
         sliderSkill.tickInterval = 1;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorialNext() : Button
      {
         return this._608783217tutorialNext;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbTutorial() : ActiveTutorial
      {
         return this._2139181690mgbTutorial;
      }
      
      public function ___EditFooterComponent_LinkButton3_click(param1:MouseEvent) : void
      {
         mgbTutorial.determineTutorialPresentation();
      }
      
      private function _EditFooterComponent_GlowFilter2_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.6;
         _loc1_.blurX = 16;
         _loc1_.blurY = 16;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get PanelTutorialLeftGap() : int
      {
         return this._896842355PanelTutorialLeftGap;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:EditFooterComponent = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _EditFooterComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_EditFooterComponentWatcherSetupUtil");
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
      public function get skillSliderCanvas() : Canvas
      {
         return this._1236788598skillSliderCanvas;
      }
      
      public function set TextTutorial(param1:TextArea) : void
      {
         var _loc2_:Object = this._89369547TextTutorial;
         if(_loc2_ !== param1)
         {
            this._89369547TextTutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"TextTutorial",_loc2_,param1));
         }
      }
      
      public function nukeSlider() : void
      {
         textSkillBox.visible = false;
         sliderSkill.visible = false;
         skillSliderCanvas.visible = false;
         PanelTutorialLeftGap = 0;
      }
      
      public function __tutorialSkip_click(param1:MouseEvent) : void
      {
         mgbTutorial.tutorialSkip();
      }
      
      private function updateSliderFromProfileValues() : void
      {
         sliderSkill.maximum = maxLevelSupported;
         var _loc1_:String = String(Application.application.getUserProfile(maxLevelTag));
         var _loc2_:int = !!_loc1_ ? int(_loc1_) : 1;
         var _loc3_:String = String(Application.application.getUserProfile(currentLevelTag));
         var _loc4_:int;
         if((_loc4_ = !!_loc3_ ? int(_loc3_) : 1) > sliderSkill.maximum)
         {
            _loc4_ = sliderSkill.maximum;
         }
         if(_loc4_ > _loc2_)
         {
            _loc4_ = _loc2_;
         }
         if(_loc4_ < 1)
         {
            _loc4_ = 1;
         }
         sliderSkill.value = _loc4_;
         internalSliderMoveEventHandler(null);
         sliderChangeEffect.end();
         sliderChangeEffect.play();
      }
      
      public function __sliderSkill_change(param1:SliderEvent) : void
      {
         sliderLimitsCheck(param1);
      }
      
      public function set tutorialBack(param1:LinkButton) : void
      {
         var _loc2_:Object = this._608421221tutorialBack;
         if(_loc2_ !== param1)
         {
            this._608421221tutorialBack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialBack",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get TextTutorial() : TextArea
      {
         return this._89369547TextTutorial;
      }
      
      private function _EditFooterComponent_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = [textSkillBox,sliderSkill];
         _loc1_ = mgbSession.userLoggedInIsGuest == true;
         _loc1_ = PanelTutorialLeftGap;
         _loc1_ = "Viewing " + mgbSession.userName + "\'s work using Guest mode - you can view but not save";
         _loc1_ = mgbSession.userLoggedIn;
         _loc1_ = mgbSession.userLoggedInIsGuest == false;
         _loc1_ = PanelTutorialLeftGap;
         _loc1_ = !!mgbTutorial.activeTutorialEnableStartButton ? (!!mgbSession.userLoggedInForTheFirstTimeEver ? 65535 : 16776960) : 15723722;
         _loc1_ = mgbTutorial.activeTutorial.comment;
         _loc1_ = mgbTutorial.activeTutorialEnableNextButton;
         _loc1_ = mgbTutorial.activeTutorialNextButtonText;
         _loc1_ = mgbTutorial.activeTutorialEnableSkipButton;
         _loc1_ = mgbTutorial.activeTutorialEnableSkipButton;
         _loc1_ = mgbTutorial.activeTutorialEnableBackButton;
         _loc1_ = mgbTutorial.activeTutorialEnableBackButton;
         _loc1_ = mgbTutorial.activeTutorialText;
         _loc1_ = !!mgbTutorial.activeTutorialEnableStartButton ? (!!mgbSession.userLoggedInForTheFirstTimeEver ? 65535 : 16776960) : 15131311;
         _loc1_ = "Start next tutorial? " + mgbTutorial.activeTutorial.comment;
         _loc1_ = mgbTutorial.activeTutorialEnableStartButton;
         _loc1_ = sliderChangeEffect;
         _loc1_ = MgbSystem.describeSlidersText;
         _loc1_ = MgbSystem.describeSlidersText;
         _loc1_ = MgbSystem.describeSlidersText;
      }
      
      private function _EditFooterComponent_GlowFilter1_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 40960;
         _loc1_.alpha = 0.8;
         _loc1_.blurX = 16;
         _loc1_.blurY = 16;
         return _loc1_;
      }
      
      private function internalSliderMoveEventHandler(param1:Event) : void
      {
         if(sliderSkill)
         {
            if(sliderSkill.value < 1)
            {
               sliderSkill.value = 1;
            }
            toolControl.currentState = "Level_" + sliderSkill.value;
            if(param1)
            {
               Application.application.updateUserProfile(currentLevelTag,sliderSkill.value.toString());
            }
            textSkillBox.text = " " + descriptiveVerb + ": level " + sliderSkill.value;
         }
      }
      
      public function set sliderSkill(param1:HSlider) : void
      {
         var _loc2_:Object = this._69155344sliderSkill;
         if(_loc2_ !== param1)
         {
            this._69155344sliderSkill = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderSkill",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderChangeEffect() : Glow
      {
         return this._842119394sliderChangeEffect;
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
      
      public function set PanelTutorial(param1:Panel) : void
      {
         var _loc2_:Object = this._1790870882PanelTutorial;
         if(_loc2_ !== param1)
         {
            this._1790870882PanelTutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"PanelTutorial",_loc2_,param1));
         }
      }
      
      public function ___EditFooterComponent_Button1_click(param1:MouseEvent) : void
      {
         Application.application.accountManagement.goToTop();
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderSkill() : HSlider
      {
         return this._69155344sliderSkill;
      }
      
      public function __sliderSkill_mouseUp(param1:MouseEvent) : void
      {
         sliderLimitsCheck(param1);
      }
      
      public function set tutorialSkip(param1:LinkButton) : void
      {
         var _loc2_:Object = this._608937469tutorialSkip;
         if(_loc2_ !== param1)
         {
            this._608937469tutorialSkip = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialSkip",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorialSkip() : LinkButton
      {
         return this._608937469tutorialSkip;
      }
   }
}
