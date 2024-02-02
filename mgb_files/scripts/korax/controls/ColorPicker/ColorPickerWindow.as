package korax.controls.ColorPicker
{
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
   import mx.containers.Box;
   import mx.containers.Canvas;
   import mx.containers.ControlBar;
   import mx.containers.HBox;
   import mx.containers.TitleWindow;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Label;
   import mx.controls.NumericStepper;
   import mx.controls.RadioButton;
   import mx.controls.SWFLoader;
   import mx.controls.Spacer;
   import mx.controls.TextInput;
   import mx.core.*;
   import mx.events.*;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ColorPickerWindow extends TitleWindow implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      private static var wnd:ColorPickerWindow = null;
       
      
      private var _3493400rb_g:RadioButton;
      
      private var _3493411rb_r:RadioButton;
      
      private var _3574093tx_H:NumericStepper;
      
      private var ba:ByteArray;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _103607hsb:ColorHSB;
      
      private var _477636359cc_marker:Class;
      
      private var m_parent:DisplayObject = null;
      
      private var _3574124tx_g:NumericStepper;
      
      private var m_timer_count:int;
      
      private var _3493363rb_B:RadioButton;
      
      private var _2035425377osi_view:SWFLoader;
      
      private var _1977926482sel_hsb:uint = 0;
      
      private var _3574135tx_r:NumericStepper;
      
      private var m_timer:Timer = null;
      
      private var m_timer_count_init:int = 20;
      
      private var _98317ccm:SWFLoader;
      
      private var f_apply_flag:Boolean = false;
      
      internal var osi_hsb_b:Class;
      
      private var _87509038OKButton:Button;
      
      internal var osi_hsb_h:Class;
      
      private var _98306ccb:ColorPickerCanvas;
      
      private var position:Object;
      
      private var _1977935720sel_rgb:uint = 0;
      
      internal var osi_hsb_s:Class;
      
      private var _3048091ccrm:SWFLoader;
      
      private var _3574104tx_S:NumericStepper;
      
      private var _1249927770cc_r_marker:Class;
      
      private var _3047905cclm:SWFLoader;
      
      public var _ColorPickerWindow_Box1:Box;
      
      public var _ColorPickerWindow_Box2:Box;
      
      private var _1178112108cc_l_marker:Class;
      
      private var _98307ccc:ColorPickerCanvas;
      
      private var _3493380rb_S:RadioButton;
      
      mx_internal var _watchers:Array;
      
      private var _3574087tx_B:NumericStepper;
      
      private var _1023692725ob_hsb:Object;
      
      private var _3574119tx_b:NumericStepper;
      
      private var _1851639627old_color:uint = 0;
      
      internal var osi_rgb_b:Class;
      
      private var _1220572206hexrgb:TextInput;
      
      internal var osi_rgb_g:Class;
      
      private var _3493395rb_b:RadioButton;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _3493369rb_H:RadioButton;
      
      internal var osi_rgb_r:Class;
      
      private var _1480355228_color:uint = 0;
      
      private var _3357091mode:uint = 0;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ColorPickerWindow()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 0;
                     this.paddingRight = 4;
                     this.paddingTop = 0;
                     this.paddingBottom = 0;
                     this.backgroundColor = 16777215;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function():void
                        {
                           this.paddingLeft = 0;
                           this.paddingTop = 0;
                           this.paddingRight = 0;
                           this.paddingBottom = 0;
                           this.verticalGap = 0;
                           this.horizontalGap = 0;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "height":272,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Canvas,
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":272,
                                       "height":272,
                                       "horizontalScrollPolicy":"off",
                                       "verticalScrollPolicy":"off",
                                       "childDescriptors":[new UIComponentDescriptor({
                                          "type":Canvas,
                                          "stylesFactory":function():void
                                          {
                                             this.backgroundColor = 0;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "x":7,
                                                "y":7,
                                                "width":258,
                                                "height":258,
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":ColorPickerCanvas,
                                                   "id":"ccc",
                                                   "events":{"mouseDown":"__ccc_mouseDown"},
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "x":1,
                                                         "y":1,
                                                         "width":256,
                                                         "height":256,
                                                         "minWidth":256,
                                                         "maxWidth":256,
                                                         "minHeight":256,
                                                         "maxHeight":256
                                                      };
                                                   }
                                                })]
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":SWFLoader,
                                          "id":"ccm",
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "x":0,
                                                "y":0
                                             };
                                          }
                                       })]
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Canvas,
                                 "events":{"mouseDown":"___ColorPickerWindow_Canvas3_mouseDown"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":36,
                                       "height":272,
                                       "horizontalScrollPolicy":"off",
                                       "verticalScrollPolicy":"off",
                                       "childDescriptors":[new UIComponentDescriptor({
                                          "type":Canvas,
                                          "stylesFactory":function():void
                                          {
                                             this.backgroundColor = 0;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "x":7,
                                                "y":7,
                                                "width":22,
                                                "height":258,
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":ColorPickerCanvas,
                                                   "id":"ccb",
                                                   "events":{"mouseDown":"__ccb_mouseDown"},
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "x":1,
                                                         "y":1,
                                                         "width":20,
                                                         "height":256,
                                                         "minWidth":20,
                                                         "maxWidth":20,
                                                         "minHeight":256,
                                                         "maxHeight":256
                                                      };
                                                   }
                                                })]
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":SWFLoader,
                                          "id":"ccrm",
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "x":0,
                                                "y":0,
                                                "width":5,
                                                "height":9,
                                                "scaleContent":false
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":SWFLoader,
                                          "id":"cclm",
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "x":0,
                                                "y":0,
                                                "width":5,
                                                "height":9,
                                                "scaleContent":false
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
                        "stylesFactory":function():void
                        {
                           this.paddingTop = 8;
                           this.paddingBottom = 8;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "percentHeight":100,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":HBox,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":RadioButton,
                                       "id":"rb_H",
                                       "events":{"click":"__rb_H_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {"label":"H"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":NumericStepper,
                                       "id":"tx_H",
                                       "events":{"change":"__tx_H_change"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "maxChars":3,
                                             "minimum":0,
                                             "maximum":359,
                                             "stepSize":1
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Label,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"text":"°"};
                                       }
                                    })]};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":HBox,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":RadioButton,
                                       "id":"rb_S",
                                       "events":{"click":"__rb_S_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {"label":"S"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":NumericStepper,
                                       "id":"tx_S",
                                       "events":{"change":"__tx_S_change"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "maxChars":3,
                                             "minimum":0,
                                             "maximum":100,
                                             "stepSize":1
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Label,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"text":"%"};
                                       }
                                    })]};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":HBox,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":RadioButton,
                                       "id":"rb_B",
                                       "events":{"click":"__rb_B_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {"label":"B"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":NumericStepper,
                                       "id":"tx_B",
                                       "events":{"change":"__tx_B_change"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "maxChars":3,
                                             "minimum":0,
                                             "maximum":100,
                                             "stepSize":1
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Label,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"text":"%"};
                                       }
                                    })]};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Spacer,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"height":4};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":HBox,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":RadioButton,
                                       "id":"rb_r",
                                       "events":{"click":"__rb_r_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {"label":"R"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":NumericStepper,
                                       "id":"tx_r",
                                       "events":{
                                          "change":"__tx_r_change",
                                          "dataChange":"__tx_r_dataChange"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "maxChars":3,
                                             "minimum":0,
                                             "maximum":255,
                                             "stepSize":1
                                          };
                                       }
                                    })]};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":HBox,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":RadioButton,
                                       "id":"rb_g",
                                       "events":{"click":"__rb_g_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {"label":"G"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":NumericStepper,
                                       "id":"tx_g",
                                       "events":{
                                          "change":"__tx_g_change",
                                          "dataChange":"__tx_g_dataChange"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "maxChars":3,
                                             "minimum":0,
                                             "maximum":255,
                                             "stepSize":1
                                          };
                                       }
                                    })]};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":HBox,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":RadioButton,
                                       "id":"rb_b",
                                       "events":{"click":"__rb_b_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {"label":"B"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":NumericStepper,
                                       "id":"tx_b",
                                       "events":{
                                          "change":"__tx_b_change",
                                          "dataChange":"__tx_b_dataChange"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "maxChars":3,
                                             "minimum":0,
                                             "maximum":255,
                                             "stepSize":1
                                          };
                                       }
                                    })]};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Spacer,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"percentHeight":100};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":HBox,
                                 "stylesFactory":function():void
                                 {
                                    this.horizontalGap = 0;
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":Label,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"text":"#"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":TextInput,
                                       "id":"hexrgb",
                                       "events":{"change":"__hexrgb_change"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "maxChars":6,
                                             "text":"",
                                             "restrict":"a-fA-F0-9"
                                          };
                                       }
                                    })]};
                                 }
                              })]
                           };
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":ControlBar,
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "right";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function():void
                        {
                           this.horizontalGap = 1;
                           this.paddingLeft = 1;
                           this.paddingTop = 1;
                           this.paddingBottom = 1;
                           this.paddingRight = 1;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "styleName":"bbbox",
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Box,
                                 "id":"_ColorPickerWindow_Box1",
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":32,
                                       "height":22
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Box,
                                 "id":"_ColorPickerWindow_Box2",
                                 "events":{"click":"___ColorPickerWindow_Box2_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":32,
                                       "height":22
                                    };
                                 }
                              })]
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function():void
                        {
                           this.borderColor = 8421504;
                           this.verticalAlign = "middle";
                           this.horizontalAlign = "center";
                           this.paddingLeft = 4;
                           this.paddingRight = 4;
                           this.backgroundColor = 16777215;
                           this.backgroundAlpha = 0.4;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "styleName":"bbbox",
                              "height":26,
                              "width":56,
                              "verticalScrollPolicy":"off",
                              "horizontalScrollPolicy":"off",
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":SWFLoader,
                                 "id":"osi_view"
                              })]
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Spacer,
                        "propertiesFactory":function():Object
                        {
                           return {"percentWidth":100};
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___ColorPickerWindow_Button1_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Erase"};
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "id":"OKButton",
                        "events":{"click":"__OKButton_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Ok"};
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___ColorPickerWindow_Button3_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Cancel"};
                        }
                     })]};
                  }
               })]};
            }
         });
         osi_hsb_h = ColorPickerWindow_osi_hsb_h;
         osi_hsb_s = ColorPickerWindow_osi_hsb_s;
         osi_hsb_b = ColorPickerWindow_osi_hsb_b;
         osi_rgb_r = ColorPickerWindow_osi_rgb_r;
         osi_rgb_g = ColorPickerWindow_osi_rgb_g;
         osi_rgb_b = ColorPickerWindow_osi_rgb_b;
         _477636359cc_marker = ColorPickerWindow_cc_marker;
         _1178112108cc_l_marker = ColorPickerWindow_cc_l_marker;
         _1249927770cc_r_marker = ColorPickerWindow_cc_r_marker;
         position = {
            "x":0,
            "y":0,
            "p":0
         };
         ba = new ByteArray();
         _103607hsb = new ColorHSB();
         _1023692725ob_hsb = hsb.to_object();
         m_timer_count = m_timer_count_init;
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
            this.paddingBottom = 0;
            this.paddingTop = 0;
            this.paddingLeft = 0;
            this.paddingRight = 0;
         };
         this.styleName = "popupWindow";
         this.showCloseButton = true;
         this.title = "Color Chooser";
         this.addEventListener("initialize",___ColorPickerWindow_TitleWindow1_initialize);
         this.addEventListener("creationComplete",___ColorPickerWindow_TitleWindow1_creationComplete);
      }
      
      private static function hsb_to_position(param1:ColorHSB, param2:uint) : Object
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         if(param2 > 3)
         {
            return {
               "x":0,
               "y":0,
               "p":0
            };
         }
         var _loc3_:Object = {
            "h":360,
            "s":100,
            "b":100
         };
         if(param2 == 0)
         {
            _loc4_ = "h";
            _loc5_ = "s";
            _loc6_ = "b";
         }
         if(param2 == 1)
         {
            _loc4_ = "s";
            _loc5_ = "h";
            _loc6_ = "b";
         }
         if(param2 == 2)
         {
            _loc4_ = "b";
            _loc5_ = "h";
            _loc6_ = "s";
         }
         var _loc7_:uint = uint(_loc3_[_loc5_]);
         var _loc8_:uint = uint(_loc3_[_loc6_]);
         var _loc9_:uint = uint(_loc3_[_loc4_]);
         return {
            "x":uint(param1[_loc5_] / _loc7_ * 255),
            "y":uint(param1[_loc6_] / _loc8_ * 255),
            "p":uint(param1[_loc4_] / _loc9_ * 255)
         };
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ColorPickerWindow._watcherSetupUtil = param1;
      }
      
      private static function position_to_hsb(param1:Object, param2:uint) : ColorHSB
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         if(param2 == 0)
         {
            _loc3_ = uint(param1.p);
            _loc4_ = uint(param1.x);
            _loc5_ = uint(param1.y);
         }
         if(param2 == 1)
         {
            _loc4_ = uint(param1.p);
            _loc3_ = uint(param1.x);
            _loc5_ = uint(param1.y);
         }
         if(param2 == 2)
         {
            _loc5_ = uint(param1.p);
            _loc3_ = uint(param1.x);
            _loc4_ = uint(param1.y);
         }
         return new ColorHSB(Math.round(_loc3_ / 255 * 360),Math.round(_loc4_ / 255 * 100),Math.round(_loc5_ / 255 * 100));
      }
      
      public static function hide_window() : void
      {
         if(wnd != null)
         {
            wnd.close_window();
         }
      }
      
      public static function show_window(param1:DisplayObject, param2:uint, param3:Boolean) : void
      {
         if(wnd == null)
         {
            wnd = new ColorPickerWindow();
            wnd.addEventListener(CloseEvent.CLOSE,on_close_event);
         }
         wnd.m_parent = param1;
         wnd._color = wnd.old_color = param2;
         if(!wnd.isPopUp)
         {
            PopUpManager.addPopUp(wnd,DisplayObject(Application.application),param3);
            PopUpManager.centerPopUp(wnd);
         }
         else
         {
            PopUpManager.bringToFront(wnd);
            wnd.start_init();
         }
      }
      
      private static function on_close_event(param1:CloseEvent) : void
      {
         if(wnd == null)
         {
            return;
         }
         wnd.with_last_preved();
         PopUpManager.removePopUp(wnd);
         wnd = null;
      }
      
      private static function zn(param1:String, param2:uint) : String
      {
         var _loc3_:int = param2 - param1.length;
         while(--_loc3_ >= 0)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      private static function rgb_to_position(param1:uint, param2:uint) : Object
      {
         var _loc3_:uint = uint(param1 >> 16 & 255);
         var _loc4_:uint = uint(param1 >> 8 & 255);
         var _loc5_:uint = uint(param1 & 255);
         if(param2 == 0)
         {
            return {
               "p":_loc3_,
               "x":_loc5_,
               "y":_loc4_
            };
         }
         if(param2 == 1)
         {
            return {
               "p":_loc4_,
               "x":_loc5_,
               "y":_loc3_
            };
         }
         if(param2 == 2)
         {
            return {
               "p":_loc5_,
               "x":_loc3_,
               "y":_loc4_
            };
         }
         return {
            "p":0,
            "x":0,
            "y":0
         };
      }
      
      public static function get current_color() : uint
      {
         return wnd != null ? uint(wnd._color) : 0;
      }
      
      private static function position_to_rgb(param1:Object, param2:uint) : uint
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         if(param2 == 0)
         {
            _loc3_ = uint(param1.p);
            _loc5_ = uint(param1.x);
            _loc4_ = uint(param1.y);
         }
         if(param2 == 1)
         {
            _loc4_ = uint(param1.p);
            _loc5_ = uint(param1.x);
            _loc3_ = uint(param1.y);
         }
         if(param2 == 2)
         {
            _loc5_ = uint(param1.p);
            _loc3_ = uint(param1.x);
            _loc4_ = uint(param1.y);
         }
         return (_loc3_ & 255) << 16 | (_loc4_ & 255) << 8 | _loc5_ & 255;
      }
      
      [Bindable(event="propertyChange")]
      public function get ccb() : ColorPickerCanvas
      {
         return this._98306ccb;
      }
      
      public function __tx_g_change(param1:NumericStepperEvent) : void
      {
         on_tx_rgb_change();
      }
      
      public function set ccb(param1:ColorPickerCanvas) : void
      {
         var _loc2_:Object = this._98306ccb;
         if(_loc2_ !== param1)
         {
            this._98306ccb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ccb",_loc2_,param1));
         }
      }
      
      public function set ccc(param1:ColorPickerCanvas) : void
      {
         var _loc2_:Object = this._98307ccc;
         if(_loc2_ !== param1)
         {
            this._98307ccc = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ccc",_loc2_,param1));
         }
      }
      
      private function redraw_bars() : void
      {
         if(mode == 0)
         {
            change_rcx1_rgb(color,sel_rgb);
            change_rcx2_rgb(color,sel_rgb);
            set_cc_marker();
         }
         else
         {
            change_rcx1_hsb(hsb,sel_hsb);
            change_rcx2_hsb(hsb,sel_hsb);
            set_cc_marker();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ccc() : ColorPickerCanvas
      {
         return this._98307ccc;
      }
      
      [Bindable(event="propertyChange")]
      public function get rb_S() : RadioButton
      {
         return this._3493380rb_S;
      }
      
      [Bindable(event="propertyChange")]
      public function get ccm() : SWFLoader
      {
         return this._98317ccm;
      }
      
      public function set rb_S(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3493380rb_S;
         if(_loc2_ !== param1)
         {
            this._3493380rb_S = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rb_S",_loc2_,param1));
         }
      }
      
      private function on_restore_color() : void
      {
         color = old_color;
         start_init();
      }
      
      [Bindable(event="propertyChange")]
      public function get rb_b() : RadioButton
      {
         return this._3493395rb_b;
      }
      
      public function __tx_b_dataChange(param1:FlexEvent) : void
      {
         on_tx_rgb_change();
      }
      
      public function close_window() : void
      {
         dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
      }
      
      private function on_ccc_mouse_down(param1:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_MOVE,on_ccc_mouse_mov,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,on_ccc_mouse_up,true);
         on_ccc_md();
      }
      
      public function set ccm(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._98317ccm;
         if(_loc2_ !== param1)
         {
            this._98317ccm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ccm",_loc2_,param1));
         }
      }
      
      public function __rb_B_click(param1:MouseEvent) : void
      {
         on_rb_hsb_change();
      }
      
      public function __OKButton_click(param1:MouseEvent) : void
      {
         ok_close_window();
      }
      
      [Bindable(event="propertyChange")]
      public function get rb_r() : RadioButton
      {
         return this._3493411rb_r;
      }
      
      public function set rb_b(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3493395rb_b;
         if(_loc2_ !== param1)
         {
            this._3493395rb_b = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rb_b",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rb_g() : RadioButton
      {
         return this._3493400rb_g;
      }
      
      private function set cc_marker(param1:Class) : void
      {
         var _loc2_:Object = this._477636359cc_marker;
         if(_loc2_ !== param1)
         {
            this._477636359cc_marker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cc_marker",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get OKButton() : Button
      {
         return this._87509038OKButton;
      }
      
      public function set rb_g(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3493400rb_g;
         if(_loc2_ !== param1)
         {
            this._3493400rb_g = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rb_g",_loc2_,param1));
         }
      }
      
      private function on_ccb_mouse_mov(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,on_ccb_mouse_mov,true);
            stage.removeEventListener(MouseEvent.MOUSE_UP,on_ccb_mouse_up,true);
            return;
         }
         on_ccb_md();
      }
      
      private function _ColorPickerWindow_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = cc_marker;
         _loc1_ = cc_r_marker;
         _loc1_ = cc_l_marker;
         _loc1_ = ob_hsb.h;
         _loc1_ = ob_hsb.s;
         _loc1_ = ob_hsb.b;
         _loc1_ = _color >> 16 & 255;
         _loc1_ = _color >> 8 & 255;
         _loc1_ = _color & 255;
         _loc1_ = _color;
         _loc1_ = old_color;
      }
      
      public function __rb_b_click(param1:MouseEvent) : void
      {
         on_rb_rgb_change();
      }
      
      private function update_hex_rgb() : void
      {
         hexrgb.text = zn(color.toString(16).toUpperCase(),6);
      }
      
      private function on_creation_complete() : void
      {
         start_init();
         focusManager.setFocus(OKButton);
      }
      
      [Bindable(event="propertyChange")]
      private function get ob_hsb() : Object
      {
         return this._1023692725ob_hsb;
      }
      
      public function set rb_r(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3493411rb_r;
         if(_loc2_ !== param1)
         {
            this._3493411rb_r = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rb_r",_loc2_,param1));
         }
      }
      
      private function on_ccc_md_draw() : void
      {
         m_timer = null;
         if(mode == 0)
         {
            change_rcx1_rgb(color,sel_rgb);
         }
         else
         {
            change_rcx1_hsb(hsb,sel_hsb);
         }
      }
      
      public function __rb_r_click(param1:MouseEvent) : void
      {
         on_rb_rgb_change();
      }
      
      public function set OKButton(param1:Button) : void
      {
         var _loc2_:Object = this._87509038OKButton;
         if(_loc2_ !== param1)
         {
            this._87509038OKButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"OKButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _color() : uint
      {
         return this._1480355228_color;
      }
      
      [Bindable(event="propertyChange")]
      private function get cc_l_marker() : Class
      {
         return this._1178112108cc_l_marker;
      }
      
      private function on_rb_rgb_change() : void
      {
         var _loc1_:Class = null;
         sel_rgb = uint(-1);
         mode = 0;
         if(rb_r.selected)
         {
            sel_rgb = 0;
            _loc1_ = osi_rgb_r;
         }
         else if(rb_g.selected)
         {
            sel_rgb = 1;
            _loc1_ = osi_rgb_g;
         }
         else if(rb_b.selected)
         {
            sel_rgb = 2;
            _loc1_ = osi_rgb_b;
         }
         osi_view.source = _loc1_;
         position = rgb_to_position(color,sel_rgb);
         update_hex_rgb();
         redraw_bars();
      }
      
      private function on_tx_hsb_change() : void
      {
         hsb = new ColorHSB(tx_H.value,tx_S.value,tx_B.value);
         color = ColorHSB.hsb_to_rgb(hsb);
         update_hex_rgb();
         update_position();
         ob_hsb = hsb.to_object();
         redraw_bars();
      }
      
      private function on_ccb_mouse_up(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,on_ccb_mouse_mov,true);
         stage.removeEventListener(MouseEvent.MOUSE_UP,on_ccb_mouse_up,true);
         on_ccb_md();
      }
      
      public function __rb_g_click(param1:MouseEvent) : void
      {
         on_rb_rgb_change();
      }
      
      public function set tx_B(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._3574087tx_B;
         if(_loc2_ !== param1)
         {
            this._3574087tx_B = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tx_B",_loc2_,param1));
         }
      }
      
      private function on_timer_redraw(param1:Function) : void
      {
         if(m_timer != null)
         {
            m_timer.stop();
            if(--m_timer_count <= 0)
            {
               m_timer = null;
               m_timer_count = m_timer_count_init;
               param1(new TimerEvent("timer"));
               return;
            }
         }
         m_timer = new Timer(10,1);
         m_timer.addEventListener("timer",param1);
         m_timer.start();
      }
      
      private function set ob_hsb(param1:Object) : void
      {
         var _loc2_:Object = this._1023692725ob_hsb;
         if(_loc2_ !== param1)
         {
            this._1023692725ob_hsb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ob_hsb",_loc2_,param1));
         }
      }
      
      public function __tx_S_change(param1:NumericStepperEvent) : void
      {
         on_tx_hsb_change();
      }
      
      private function on_ccb_md_timer(param1:TimerEvent) : void
      {
         m_timer = null;
         if(mode == 0)
         {
            change_rcx2_rgb_matrix(color,sel_rgb);
         }
         else
         {
            change_rcx2_hsb(hsb,sel_hsb);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ccrm() : SWFLoader
      {
         return this._3048091ccrm;
      }
      
      private function set old_color(param1:uint) : void
      {
         var _loc2_:Object = this._1851639627old_color;
         if(_loc2_ !== param1)
         {
            this._1851639627old_color = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"old_color",_loc2_,param1));
         }
      }
      
      public function set tx_H(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._3574093tx_H;
         if(_loc2_ !== param1)
         {
            this._3574093tx_H = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tx_H",_loc2_,param1));
         }
      }
      
      private function set sel_hsb(param1:uint) : void
      {
         var _loc2_:Object = this._1977926482sel_hsb;
         if(_loc2_ !== param1)
         {
            this._1977926482sel_hsb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sel_hsb",_loc2_,param1));
         }
      }
      
      public function set tx_S(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._3574104tx_S;
         if(_loc2_ !== param1)
         {
            this._3574104tx_S = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tx_S",_loc2_,param1));
         }
      }
      
      public function ___ColorPickerWindow_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         on_creation_complete();
      }
      
      [Bindable(event="propertyChange")]
      private function get hsb() : ColorHSB
      {
         return this._103607hsb;
      }
      
      private function colorIsErase() : void
      {
         _color = 0;
         if(m_parent != null)
         {
            m_parent.dispatchEvent(new ColorPickerEvent(ColorPickerEvent.EVENT_COLOR_CHANGE,_color));
         }
      }
      
      private function on_ccb_mouse_down(param1:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_MOVE,on_ccb_mouse_mov,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,on_ccb_mouse_up,true);
         on_ccb_md();
      }
      
      private function set color(param1:uint) : void
      {
         _color = param1 | 4278190080;
         if(m_parent != null)
         {
            m_parent.dispatchEvent(new ColorPickerEvent(ColorPickerEvent.EVENT_COLOR_CHANGE,_color));
         }
      }
      
      private function set _color(param1:uint) : void
      {
         var _loc2_:Object = this._1480355228_color;
         if(_loc2_ !== param1)
         {
            this._1480355228_color = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_color",_loc2_,param1));
         }
      }
      
      private function start_init() : void
      {
         hsb = ColorHSB.rgb_to_hsb(color);
         update_hex_rgb();
         update_position();
         ob_hsb = hsb.to_object();
         if(mode == 0)
         {
            if(sel_rgb == 0)
            {
               rb_r.selected = true;
            }
            else if(sel_rgb == 1)
            {
               rb_g.selected = true;
            }
            else if(sel_rgb == 2)
            {
               rb_b.selected = true;
            }
            on_rb_rgb_change();
         }
         else
         {
            if(sel_hsb == 0)
            {
               rb_H.selected = true;
            }
            else if(sel_hsb == 1)
            {
               rb_S.selected = true;
            }
            else if(sel_hsb == 2)
            {
               rb_B.selected = true;
            }
            on_rb_hsb_change();
         }
      }
      
      public function set tx_b(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._3574119tx_b;
         if(_loc2_ !== param1)
         {
            this._3574119tx_b = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tx_b",_loc2_,param1));
         }
      }
      
      private function set sel_rgb(param1:uint) : void
      {
         var _loc2_:Object = this._1977935720sel_rgb;
         if(_loc2_ !== param1)
         {
            this._1977935720sel_rgb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sel_rgb",_loc2_,param1));
         }
      }
      
      private function change_rcx2_hsb(param1:ColorHSB, param2:uint) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param2 > 3)
         {
            return;
         }
         var _loc3_:ColorHSB = new ColorHSB(param1.h,param1.s,param1.b);
         var _loc4_:Object = {
            "h":360,
            "s":100,
            "b":100
         };
         if(param2 == 0)
         {
            _loc5_ = "s";
            _loc6_ = "b";
         }
         if(param2 == 1)
         {
            _loc5_ = "h";
            _loc6_ = "b";
         }
         if(param2 == 2)
         {
            _loc5_ = "h";
            _loc6_ = "s";
         }
         var _loc7_:uint = uint(_loc4_[_loc5_]);
         var _loc8_:uint = uint(_loc4_[_loc6_]);
         ba.position = 0;
         if(param2 == 0)
         {
            _loc10_ = 255;
            while(_loc10_ >= 0)
            {
               _loc3_.b = Number(_loc10_) / 255 * _loc8_;
               _loc9_ = 0;
               while(_loc9_ < 256)
               {
                  _loc3_.s = Number(_loc9_) / 255 * _loc7_;
                  ba.writeInt(ColorHSB.hsb_to_rgb(_loc3_));
                  _loc9_++;
               }
               _loc10_--;
            }
         }
         else if(param2 == 1)
         {
            _loc10_ = 255;
            while(_loc10_ >= 0)
            {
               _loc3_.b = Number(_loc10_) / 255 * _loc8_;
               _loc9_ = 0;
               while(_loc9_ < 256)
               {
                  _loc3_.h = Number(_loc9_) / 255 * _loc7_;
                  ba.writeInt(ColorHSB.hsb_to_rgb(_loc3_));
                  _loc9_++;
               }
               _loc10_--;
            }
         }
         else if(param2 == 2)
         {
            _loc10_ = 255;
            while(_loc10_ >= 0)
            {
               _loc3_.s = Number(_loc10_) / 255 * _loc8_;
               _loc9_ = 0;
               while(_loc9_ < 256)
               {
                  _loc3_.h = Number(_loc9_) / 255 * _loc7_;
                  ba.writeInt(ColorHSB.hsb_to_rgb(_loc3_));
                  _loc9_++;
               }
               _loc10_--;
            }
         }
         ba.position = 0;
         ccc.bd.setPixels(new Rectangle(0,0,256,256),ba);
      }
      
      public function __tx_g_dataChange(param1:FlexEvent) : void
      {
         on_tx_rgb_change();
      }
      
      public function set tx_g(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._3574124tx_g;
         if(_loc2_ !== param1)
         {
            this._3574124tx_g = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tx_g",_loc2_,param1));
         }
      }
      
      public function __hexrgb_change(param1:Event) : void
      {
         on_tx_hex_change();
      }
      
      private function set cc_l_marker(param1:Class) : void
      {
         var _loc2_:Object = this._1178112108cc_l_marker;
         if(_loc2_ !== param1)
         {
            this._1178112108cc_l_marker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cc_l_marker",_loc2_,param1));
         }
      }
      
      private function change_rcx2_rgb(param1:uint, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         if(param2 > 3)
         {
            return;
         }
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         if(param2 == 0)
         {
            _loc5_ = uint(param1 & 16711680 | 65280);
            _loc3_ = 1;
            _loc4_ = 256;
         }
         if(param2 == 1)
         {
            _loc5_ = uint(param1 & 65280 | 16711680);
            _loc3_ = 1;
            _loc4_ = 65536;
         }
         if(param2 == 2)
         {
            _loc5_ = uint(param1 & 255 | 65280);
            _loc3_ = 65536;
            _loc4_ = 256;
         }
         var _loc6_:uint = _loc5_;
         var _loc7_:uint = 0;
         while(_loc7_ < 256)
         {
            _loc8_ = 0;
            while(_loc8_ < 256)
            {
               ba.writeInt(_loc6_);
               ccc.bd.setPixel(_loc8_,_loc7_,_loc6_);
               _loc6_ += _loc3_;
               _loc8_++;
            }
            _loc6_ = _loc5_ = uint(_loc5_ - _loc4_);
            _loc7_++;
         }
         change_rcx2_rgb_matrix(param1,param2);
      }
      
      private function on_ccc_mouse_mov(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,on_ccc_mouse_mov,true);
            stage.removeEventListener(MouseEvent.MOUSE_UP,on_ccc_mouse_up,true);
            return;
         }
         on_ccc_md();
      }
      
      public function set tx_r(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._3574135tx_r;
         if(_loc2_ !== param1)
         {
            this._3574135tx_r = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tx_r",_loc2_,param1));
         }
      }
      
      private function change_rcx2_rgb_matrix(param1:uint, param2:uint) : void
      {
         if(param2 > 3)
         {
            return;
         }
         var _loc3_:uint = uint(param1 >> 16 & 255);
         var _loc4_:uint = uint(param1 >> 8 & 255);
         var _loc5_:uint = uint(param1 & 255);
         var _loc6_:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         if(param2 == 0)
         {
            _loc6_[0] = 0;
            _loc6_[4] = _loc3_;
         }
         if(param2 == 1)
         {
            _loc6_[6] = 0;
            _loc6_[9] = _loc4_;
         }
         if(param2 == 2)
         {
            _loc6_[12] = 0;
            _loc6_[14] = _loc5_;
         }
         var _loc7_:ColorMatrixFilter = new ColorMatrixFilter(_loc6_);
         ccc.bd.applyFilter(ccc.bd,new Rectangle(0,0,256,256),new Point(0,0),_loc7_);
      }
      
      [Bindable(event="propertyChange")]
      private function get cc_marker() : Class
      {
         return this._477636359cc_marker;
      }
      
      public function ___ColorPickerWindow_Canvas3_mouseDown(param1:MouseEvent) : void
      {
         on_ccb_mouse_down(param1);
      }
      
      public function __tx_H_change(param1:NumericStepperEvent) : void
      {
         on_tx_hsb_change();
      }
      
      private function erase_close_window() : void
      {
         colorIsErase();
         f_apply_flag = true;
         close_window();
      }
      
      public function __ccb_mouseDown(param1:MouseEvent) : void
      {
         on_ccb_mouse_down(param1);
      }
      
      public function ___ColorPickerWindow_Box2_click(param1:MouseEvent) : void
      {
         on_restore_color();
      }
      
      public function set ccrm(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._3048091ccrm;
         if(_loc2_ !== param1)
         {
            this._3048091ccrm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ccrm",_loc2_,param1));
         }
      }
      
      public function set osi_view(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._2035425377osi_view;
         if(_loc2_ !== param1)
         {
            this._2035425377osi_view = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"osi_view",_loc2_,param1));
         }
      }
      
      private function set mode(param1:uint) : void
      {
         var _loc2_:Object = this._3357091mode;
         if(_loc2_ !== param1)
         {
            this._3357091mode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mode",_loc2_,param1));
         }
      }
      
      private function on_rb_hsb_change() : void
      {
         var _loc1_:Class = null;
         sel_hsb = uint(-1);
         mode = 1;
         if(rb_H.selected)
         {
            sel_hsb = 0;
            _loc1_ = osi_hsb_h;
         }
         else if(rb_S.selected)
         {
            sel_hsb = 1;
            _loc1_ = osi_hsb_s;
         }
         else if(rb_B.selected)
         {
            sel_hsb = 2;
            _loc1_ = osi_hsb_b;
         }
         osi_view.source = _loc1_;
         position = hsb_to_position(hsb,sel_hsb);
         update_hex_rgb();
         redraw_bars();
      }
      
      public function ___ColorPickerWindow_Button1_click(param1:MouseEvent) : void
      {
         erase_close_window();
      }
      
      private function set cc_r_marker(param1:Class) : void
      {
         var _loc2_:Object = this._1249927770cc_r_marker;
         if(_loc2_ !== param1)
         {
            this._1249927770cc_r_marker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cc_r_marker",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tx_H() : NumericStepper
      {
         return this._3574093tx_H;
      }
      
      [Bindable(event="propertyChange")]
      public function get tx_B() : NumericStepper
      {
         return this._3574087tx_B;
      }
      
      private function change_rcx1_hsb(param1:ColorHSB, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc8_:int = 0;
         if(param2 > 3)
         {
            return;
         }
         var _loc3_:uint = 0;
         var _loc4_:ColorHSB = new ColorHSB(param1.h,param1.s,param1.b);
         var _loc5_:String = "";
         if(param2 == 0)
         {
            _loc5_ = "h";
            _loc3_ = 360;
            _loc4_.s = 100;
            _loc4_.b = 100;
         }
         if(param2 == 1)
         {
            _loc5_ = "s";
            _loc3_ = 100;
         }
         if(param2 == 2)
         {
            _loc5_ = "b";
            _loc3_ = 100;
         }
         var _loc6_:int = 0;
         while(_loc6_ < 256)
         {
            _loc4_[_loc5_] = _loc6_ / 255 * _loc3_;
            _loc7_ = uint(ColorHSB.hsb_to_rgb(_loc4_));
            _loc8_ = 0;
            while(_loc8_ < 20)
            {
               ccb.bd.setPixel(_loc8_,255 - _loc6_,_loc7_);
               _loc8_++;
            }
            _loc6_++;
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get old_color() : uint
      {
         return this._1851639627old_color;
      }
      
      [Bindable(event="propertyChange")]
      public function get tx_S() : NumericStepper
      {
         return this._3574104tx_S;
      }
      
      [Bindable(event="propertyChange")]
      private function get sel_hsb() : uint
      {
         return this._1977926482sel_hsb;
      }
      
      private function on_ccb_md() : void
      {
         var _loc1_:int = int(ccb.mouseX);
         var _loc2_:int = int(ccb.mouseY);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(_loc1_ > 20)
         {
            _loc1_ = 20;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc2_ > 255)
         {
            _loc2_ = 255;
         }
         position.p = 255 - _loc2_;
         if(mode == 0)
         {
            color = position_to_rgb(position,sel_rgb);
            hsb = ColorHSB.rgb_to_hsb(color);
         }
         else
         {
            hsb = position_to_hsb(position,sel_hsb);
            color = ColorHSB.hsb_to_rgb(hsb);
         }
         update_hex_rgb();
         set_cc_marker();
         ob_hsb = hsb.to_object();
         if(mode == 0)
         {
            change_rcx2_rgb_matrix(color,sel_rgb);
         }
         else
         {
            on_timer_redraw(on_ccb_md_timer);
         }
      }
      
      private function set_cc_marker() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         _loc1_ = uint(position.x);
         _loc2_ = uint(position.y);
         ccm.x = _loc1_ + 8;
         ccm.y = 255 - _loc2_ + 8;
         _loc2_ = uint(position.p);
         cclm.y = ccrm.y = 255 - _loc2_ + 8 - 5;
         ccrm.x = 0;
         cclm.x = 29;
      }
      
      private function get color() : uint
      {
         return _color;
      }
      
      private function change_rcx1_rgb(param1:uint, param2:uint) : void
      {
         var _loc6_:int = 0;
         if(param2 > 3)
         {
            return;
         }
         var _loc3_:uint = 65793;
         var _loc4_:uint = 0;
         var _loc5_:int = 255;
         while(_loc5_ >= 0)
         {
            _loc6_ = 0;
            while(_loc6_ < 20)
            {
               ccb.bd.setPixel(_loc6_,_loc5_,_loc4_);
               _loc6_++;
            }
            _loc5_--;
            _loc4_ += _loc3_;
         }
         change_rcx1_rgb_matrix(param1,param2);
      }
      
      [Bindable(event="propertyChange")]
      private function get sel_rgb() : uint
      {
         return this._1977935720sel_rgb;
      }
      
      public function __rb_S_click(param1:MouseEvent) : void
      {
         on_rb_hsb_change();
      }
      
      [Bindable(event="propertyChange")]
      public function get tx_b() : NumericStepper
      {
         return this._3574119tx_b;
      }
      
      [Bindable(event="propertyChange")]
      public function get tx_g() : NumericStepper
      {
         return this._3574124tx_g;
      }
      
      private function set hsb(param1:ColorHSB) : void
      {
         var _loc2_:Object = this._103607hsb;
         if(_loc2_ !== param1)
         {
            this._103607hsb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hsb",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tx_r() : NumericStepper
      {
         return this._3574135tx_r;
      }
      
      private function on_tx_hex_change() : void
      {
         var _loc4_:int = 0;
         var _loc1_:String = hexrgb.text.toUpperCase();
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            if(!(((_loc4_ = _loc1_.charCodeAt(_loc3_)) < 48 || _loc4_ > 57) && (_loc4_ < 65 || _loc4_ > 70)))
            {
               _loc2_ += String.fromCharCode(_loc4_);
            }
            _loc3_++;
         }
         hexrgb.text = _loc2_;
         color = uint(_loc2_ == "" ? 0 : "0x" + _loc2_);
         hsb = ColorHSB.rgb_to_hsb(color);
         update_position();
         ob_hsb = hsb.to_object();
         redraw_bars();
      }
      
      private function on_ccc_mouse_up(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,on_ccc_mouse_mov,true);
         stage.removeEventListener(MouseEvent.MOUSE_UP,on_ccc_mouse_up,true);
         on_ccc_md();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ColorPickerWindow = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ColorPickerWindow_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_korax_controls_ColorPicker_ColorPickerWindowWatcherSetupUtil");
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
      
      private function change_rcx1_rgb_matrix(param1:uint, param2:uint) : void
      {
         if(param2 > 3)
         {
            return;
         }
         var _loc3_:uint = uint(param1 >> 16 & 255);
         var _loc4_:uint = uint(param1 >> 8 & 255);
         var _loc5_:uint = uint(param1 & 255);
         var _loc6_:Array = [0,0,0,0,_loc3_,0,0,0,0,_loc4_,0,0,0,0,_loc5_,0,0,0,1,0];
         if(param2 == 0)
         {
            _loc6_[0] = 1;
            _loc6_[4] = 0;
         }
         if(param2 == 1)
         {
            _loc6_[6] = 1;
            _loc6_[9] = 0;
         }
         if(param2 == 2)
         {
            _loc6_[12] = 1;
            _loc6_[14] = 0;
         }
         var _loc7_:ColorMatrixFilter = new ColorMatrixFilter(_loc6_);
         ccb.bd.applyFilter(ccb.bd,new Rectangle(0,0,20,256),new Point(0,0),_loc7_);
      }
      
      private function ok_close_window() : void
      {
         f_apply_flag = true;
         close_window();
      }
      
      private function on_tx_rgb_change() : void
      {
         color = ((tx_r.value & 255) << 16) + ((tx_g.value & 255) << 8) + (tx_b.value & 255);
         hsb = ColorHSB.rgb_to_hsb(color);
         update_hex_rgb();
         update_position();
         ob_hsb = hsb.to_object();
         redraw_bars();
      }
      
      private function _ColorPickerWindow_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return cc_marker;
         },function(param1:Object):void
         {
            ccm.source = param1;
         },"ccm.source");
         result[0] = binding;
         binding = new Binding(this,function():Object
         {
            return cc_r_marker;
         },function(param1:Object):void
         {
            ccrm.source = param1;
         },"ccrm.source");
         result[1] = binding;
         binding = new Binding(this,function():Object
         {
            return cc_l_marker;
         },function(param1:Object):void
         {
            cclm.source = param1;
         },"cclm.source");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return ob_hsb.h;
         },function(param1:Number):void
         {
            tx_H.value = param1;
         },"tx_H.value");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return ob_hsb.s;
         },function(param1:Number):void
         {
            tx_S.value = param1;
         },"tx_S.value");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return ob_hsb.b;
         },function(param1:Number):void
         {
            tx_B.value = param1;
         },"tx_B.value");
         result[5] = binding;
         binding = new Binding(this,function():Number
         {
            return _color >> 16 & 255;
         },function(param1:Number):void
         {
            tx_r.value = param1;
         },"tx_r.value");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return _color >> 8 & 255;
         },function(param1:Number):void
         {
            tx_g.value = param1;
         },"tx_g.value");
         result[7] = binding;
         binding = new Binding(this,function():Number
         {
            return _color & 255;
         },function(param1:Number):void
         {
            tx_b.value = param1;
         },"tx_b.value");
         result[8] = binding;
         binding = new Binding(this,function():uint
         {
            return _color;
         },function(param1:uint):void
         {
            _ColorPickerWindow_Box1.setStyle("backgroundColor",param1);
         },"_ColorPickerWindow_Box1.backgroundColor");
         result[9] = binding;
         binding = new Binding(this,function():uint
         {
            return old_color;
         },function(param1:uint):void
         {
            _ColorPickerWindow_Box2.setStyle("backgroundColor",param1);
         },"_ColorPickerWindow_Box2.backgroundColor");
         result[10] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get mode() : uint
      {
         return this._3357091mode;
      }
      
      public function set hexrgb(param1:TextInput) : void
      {
         var _loc2_:Object = this._1220572206hexrgb;
         if(_loc2_ !== param1)
         {
            this._1220572206hexrgb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hexrgb",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get osi_view() : SWFLoader
      {
         return this._2035425377osi_view;
      }
      
      public function __tx_r_change(param1:NumericStepperEvent) : void
      {
         on_tx_rgb_change();
      }
      
      public function __tx_b_change(param1:NumericStepperEvent) : void
      {
         on_tx_rgb_change();
      }
      
      public function __rb_H_click(param1:MouseEvent) : void
      {
         on_rb_hsb_change();
      }
      
      [Bindable(event="propertyChange")]
      private function get cc_r_marker() : Class
      {
         return this._1249927770cc_r_marker;
      }
      
      private function on_ccc_md() : void
      {
         var _loc1_:int = int(ccc.mouseX);
         var _loc2_:int = int(ccc.mouseY);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(_loc1_ > 255)
         {
            _loc1_ = 255;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc2_ > 255)
         {
            _loc2_ = 255;
         }
         position.x = _loc1_;
         position.y = 255 - _loc2_;
         if(mode == 0)
         {
            color = position_to_rgb(position,sel_rgb);
            hsb = ColorHSB.rgb_to_hsb(color);
         }
         else
         {
            hsb = position_to_hsb(position,sel_hsb);
            color = ColorHSB.hsb_to_rgb(hsb);
         }
         update_hex_rgb();
         set_cc_marker();
         ob_hsb = hsb.to_object();
         if(mode == 0)
         {
            change_rcx1_rgb_matrix(color,sel_rgb);
         }
         else
         {
            on_ccc_md_draw();
         }
      }
      
      private function cancel_close_window() : void
      {
         close_window();
      }
      
      public function set cclm(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._3047905cclm;
         if(_loc2_ !== param1)
         {
            this._3047905cclm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cclm",_loc2_,param1));
         }
      }
      
      public function ___ColorPickerWindow_TitleWindow1_initialize(param1:FlexEvent) : void
      {
         on_initialize();
      }
      
      public function __ccc_mouseDown(param1:MouseEvent) : void
      {
         on_ccc_mouse_down(param1);
      }
      
      public function ___ColorPickerWindow_Button3_click(param1:MouseEvent) : void
      {
         cancel_close_window();
      }
      
      public function __tx_B_change(param1:NumericStepperEvent) : void
      {
         on_tx_hsb_change();
      }
      
      [Bindable(event="propertyChange")]
      public function get hexrgb() : TextInput
      {
         return this._1220572206hexrgb;
      }
      
      private function update_position() : void
      {
         if(mode == 0)
         {
            position = rgb_to_position(color,sel_rgb);
         }
         else if(mode == 1)
         {
            position = hsb_to_position(hsb,sel_hsb);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cclm() : SWFLoader
      {
         return this._3047905cclm;
      }
      
      private function with_last_preved() : void
      {
         if(f_apply_flag)
         {
            if(m_parent != null)
            {
               m_parent.dispatchEvent(new ColorPickerEvent("apply",_color));
            }
            return;
         }
         if(_color != old_color)
         {
            _color = old_color;
            if(m_parent != null)
            {
               m_parent.dispatchEvent(new ColorPickerEvent("change",_color));
            }
         }
         if(m_parent != null)
         {
            m_parent.dispatchEvent(new ColorPickerEvent("cancel",_color));
         }
      }
      
      public function __tx_r_dataChange(param1:FlexEvent) : void
      {
         on_tx_rgb_change();
      }
      
      private function on_initialize() : void
      {
         var _loc1_:uint = 0;
         mode = _loc1_ >> 8 & 1;
         var _loc2_:uint = uint(_loc1_ & 255);
         if(_loc2_ > 2)
         {
            _loc2_ = 0;
         }
         if(mode == 0)
         {
            sel_rgb = _loc2_;
         }
         else
         {
            sel_hsb = _loc2_;
         }
      }
      
      public function set rb_H(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3493369rb_H;
         if(_loc2_ !== param1)
         {
            this._3493369rb_H = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rb_H",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rb_B() : RadioButton
      {
         return this._3493363rb_B;
      }
      
      public function set rb_B(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3493363rb_B;
         if(_loc2_ !== param1)
         {
            this._3493363rb_B = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rb_B",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rb_H() : RadioButton
      {
         return this._3493369rb_H;
      }
   }
}
