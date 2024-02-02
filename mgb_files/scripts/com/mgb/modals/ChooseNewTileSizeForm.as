package com.mgb.modals
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
   import mx.containers.Canvas;
   import mx.containers.TabNavigator;
   import mx.containers.TitleWindow;
   import mx.controls.Button;
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   public class ChooseNewTileSizeForm extends TitleWindow
   {
       
      
      private var _3649235wide:int = 0;
      
      private var _3552429tall:int = 0;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ChooseNewTileSizeForm()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "height":440,
                  "width":440,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":TabNavigator,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "label":"Squares",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button1_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"32x",
                                             "width":32,
                                             "height":32,
                                             "x":10,
                                             "y":4
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button2_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"64 x 64",
                                             "width":64,
                                             "height":64,
                                             "x":10,
                                             "y":44
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button3_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"96 x 96",
                                             "width":96,
                                             "height":96,
                                             "x":10,
                                             "y":116
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button4_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"128 x 128",
                                             "width":128,
                                             "height":128,
                                             "x":10,
                                             "y":220
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.right = "10";
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":0,
                                             "text":"32 x 32: This is the best size for making floors, walls, and small characters",
                                             "height":48,
                                             "width":360
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.right = "10";
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":46,
                                             "text":"64 x 64: This is good for large characters, small bosses and bigger wall/floor tiles",
                                             "height":64,
                                             "width":328
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.right = "10";
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":116,
                                             "text":"96 x 96: This is good for bosses or larger buildings. \n\nThis is also the correct size for a melee animation tile for a 32x32 player",
                                             "height":96,
                                             "width":296
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "stylesFactory":function():void
                                       {
                                          this.right = "10";
                                          this.fontWeight = "bold";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":220,
                                             "text":"128 x 128: This is the largest tile available. It is good for bosses, large buildings etc. \n\nThis is also the correct size for a melee animation tile for a 64x64 player",
                                             "height":128,
                                             "width":264
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "events":{"click":"___ChooseNewTileSizeForm_Canvas2_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.right = "0";
                                          this.bottom = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "width":16,
                                             "height":16
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
                                    "label":"All sizes",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button5_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"32 x 32",
                                             "width":88,
                                             "height":80,
                                             "x":16,
                                             "y":4
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button6_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"64 x 32",
                                             "width":88,
                                             "height":80,
                                             "x":112,
                                             "y":4
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button7_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"96 x 32",
                                             "width":88,
                                             "height":80,
                                             "x":208,
                                             "y":4
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button8_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"128 x 32",
                                             "width":88,
                                             "height":80,
                                             "x":304,
                                             "y":4
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button9_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"32 x 64",
                                             "width":88,
                                             "height":80,
                                             "x":16,
                                             "y":92
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button10_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"64 x 64",
                                             "width":88,
                                             "height":80,
                                             "x":112,
                                             "y":92
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button11_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"96 x 64",
                                             "width":88,
                                             "height":80,
                                             "x":208,
                                             "y":92
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button12_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"128 x 64",
                                             "width":88,
                                             "height":80,
                                             "x":304,
                                             "y":92
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button13_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"32 x 96",
                                             "width":88,
                                             "height":80,
                                             "x":16,
                                             "y":180
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button14_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"64 x 96",
                                             "width":88,
                                             "height":80,
                                             "x":112,
                                             "y":180
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button15_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"96 x 96",
                                             "width":88,
                                             "height":80,
                                             "x":208,
                                             "y":180
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button16_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"128 x 96",
                                             "width":88,
                                             "height":80,
                                             "x":304,
                                             "y":180
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button17_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"32 x 128",
                                             "width":88,
                                             "height":80,
                                             "x":16,
                                             "y":268
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button18_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"64 x 128",
                                             "width":88,
                                             "height":80,
                                             "x":112,
                                             "y":268
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button19_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"96 x 128",
                                             "width":88,
                                             "height":80,
                                             "x":208,
                                             "y":268
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___ChooseNewTileSizeForm_Button20_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                          this.paddingRight = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"128 x 128",
                                             "width":88,
                                             "height":80,
                                             "x":304,
                                             "y":268
                                          };
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
         });
         super();
         mx_internal::_document = this;
         this.height = 440;
         this.width = 440;
         this.title = "Choose a size for your new tile";
         this.showCloseButton = true;
         this.autoLayout = false;
         this.layout = "absolute";
         this.addEventListener("creationComplete",___ChooseNewTileSizeForm_TitleWindow1_creationComplete);
         this.addEventListener("close",___ChooseNewTileSizeForm_TitleWindow1_close);
      }
      
      private function doChoose(param1:int, param2:int) : void
      {
         dispatchEvent(new ChooseNewTileSizeEvent("select",param1,param2));
         PopUpManager.removePopUp(this);
      }
      
      public function ___ChooseNewTileSizeForm_TitleWindow1_close(param1:CloseEvent) : void
      {
         doCancel();
      }
      
      public function ___ChooseNewTileSizeForm_Button1_click(param1:MouseEvent) : void
      {
         doChoose(32,32);
      }
      
      public function ___ChooseNewTileSizeForm_Button3_click(param1:MouseEvent) : void
      {
         doChoose(96,96);
      }
      
      public function ___ChooseNewTileSizeForm_Button4_click(param1:MouseEvent) : void
      {
         doChoose(128,128);
      }
      
      public function ___ChooseNewTileSizeForm_Button6_click(param1:MouseEvent) : void
      {
         doChoose(64,32);
      }
      
      public function ___ChooseNewTileSizeForm_Button7_click(param1:MouseEvent) : void
      {
         doChoose(96,32);
      }
      
      public function ___ChooseNewTileSizeForm_Button8_click(param1:MouseEvent) : void
      {
         doChoose(128,32);
      }
      
      public function ___ChooseNewTileSizeForm_Button2_click(param1:MouseEvent) : void
      {
         doChoose(64,64);
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      public function ___ChooseNewTileSizeForm_Button5_click(param1:MouseEvent) : void
      {
         doChoose(32,32);
      }
      
      public function ___ChooseNewTileSizeForm_Button20_click(param1:MouseEvent) : void
      {
         doChoose(128,128);
      }
      
      public function ___ChooseNewTileSizeForm_Button9_click(param1:MouseEvent) : void
      {
         doChoose(32,64);
      }
      
      [Bindable(event="propertyChange")]
      private function get wide() : int
      {
         return this._3649235wide;
      }
      
      public function ___ChooseNewTileSizeForm_Button10_click(param1:MouseEvent) : void
      {
         doChoose(64,64);
      }
      
      public function ___ChooseNewTileSizeForm_Button11_click(param1:MouseEvent) : void
      {
         doChoose(96,64);
      }
      
      public function ___ChooseNewTileSizeForm_Button12_click(param1:MouseEvent) : void
      {
         doChoose(128,64);
      }
      
      public function ___ChooseNewTileSizeForm_Button13_click(param1:MouseEvent) : void
      {
         doChoose(32,96);
      }
      
      public function ___ChooseNewTileSizeForm_Button14_click(param1:MouseEvent) : void
      {
         doChoose(64,96);
      }
      
      public function ___ChooseNewTileSizeForm_Canvas2_click(param1:MouseEvent) : void
      {
         doChoose(512,512);
      }
      
      public function ___ChooseNewTileSizeForm_Button16_click(param1:MouseEvent) : void
      {
         doChoose(128,96);
      }
      
      public function ___ChooseNewTileSizeForm_Button17_click(param1:MouseEvent) : void
      {
         doChoose(32,128);
      }
      
      public function ___ChooseNewTileSizeForm_Button18_click(param1:MouseEvent) : void
      {
         doChoose(64,128);
      }
      
      private function doCancel() : void
      {
         dispatchEvent(new ChooseNewTileSizeEvent("cancel"));
         PopUpManager.removePopUp(this);
      }
      
      private function set wide(param1:int) : void
      {
         var _loc2_:Object = this._3649235wide;
         if(_loc2_ !== param1)
         {
            this._3649235wide = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wide",_loc2_,param1));
         }
      }
      
      public function ___ChooseNewTileSizeForm_Button15_click(param1:MouseEvent) : void
      {
         doChoose(96,96);
      }
      
      private function set tall(param1:int) : void
      {
         var _loc2_:Object = this._3552429tall;
         if(_loc2_ !== param1)
         {
            this._3552429tall = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tall",_loc2_,param1));
         }
      }
      
      public function ___ChooseNewTileSizeForm_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      [Bindable(event="propertyChange")]
      private function get tall() : int
      {
         return this._3552429tall;
      }
      
      public function ___ChooseNewTileSizeForm_Button19_click(param1:MouseEvent) : void
      {
         doChoose(96,128);
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
      }
   }
}
