package com.mgb.modals
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
   import mx.containers.TitleWindow;
   import mx.controls.Button;
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ChooseNewMapSizeForm extends TitleWindow implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _watchers:Array;
      
      private var _1943857145visibleBox:Canvas;
      
      public var _ChooseNewMapSizeForm_Text2:Text;
      
      public var _ChooseNewMapSizeForm_Text1:Text;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _410956671container:Canvas;
      
      private var _1778480418invisibleBox:Canvas;
      
      public function ChooseNewMapSizeForm()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Text,
                  "id":"_ChooseNewMapSizeForm_Text1"
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"container",
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"visibleBox",
                        "stylesFactory":function():void
                        {
                           this.backgroundColor = 0;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "autoLayout":true,
                              "verticalScrollPolicy":"off",
                              "horizontalScrollPolicy":"off",
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Text,
                                 "id":"_ChooseNewMapSizeForm_Text2",
                                 "stylesFactory":function():void
                                 {
                                    this.textAlign = "center";
                                    this.horizontalCenter = "0";
                                    this.verticalCenter = "0";
                                    this.color = 16777215;
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":96,
                                       "selectable":false
                                    };
                                 }
                              })]
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"invisibleBox",
                        "events":{
                           "mouseMove":"__invisibleBox_mouseMove",
                           "mouseDown":"__invisibleBox_mouseDown",
                           "mouseOut":"__invisibleBox_mouseOut"
                        },
                        "stylesFactory":function():void
                        {
                           this.backgroundColor = 255;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "autoLayout":true,
                              "alpha":0.3
                           };
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___ChooseNewMapSizeForm_Button1_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"OK"};
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___ChooseNewMapSizeForm_Button2_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Cancel"};
                        }
                     })]};
                  }
               })]};
            }
         });
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.title = "Choose a size for your new map";
         this.showCloseButton = true;
         this.autoLayout = true;
         this.layout = "vertical";
         this.addEventListener("creationComplete",___ChooseNewMapSizeForm_TitleWindow1_creationComplete);
         this.addEventListener("close",___ChooseNewMapSizeForm_TitleWindow1_close);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ChooseNewMapSizeForm._watcherSetupUtil = param1;
      }
      
      private function doChoose(param1:int, param2:int) : void
      {
         dispatchEvent(new ChooseNewMapSizeEvent("select",param1,param2));
         PopUpManager.removePopUp(this);
      }
      
      public function ___ChooseNewMapSizeForm_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      private function _ChooseNewMapSizeForm_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "Map size: " + visibleBox.width + " x " + visibleBox.height + "  (click in the box to resize)";
         _loc1_ = MgbSystem.newMapMaxWidth;
         _loc1_ = MgbSystem.newMapMaxHeight;
         _loc1_ = MgbSystem.newMapDefaultWidth;
         _loc1_ = MgbSystem.newMapDefaultHeight;
         _loc1_ = visibleBox.width + " x " + visibleBox.height;
         _loc1_ = MgbSystem.newMapMaxWidth;
         _loc1_ = MgbSystem.newMapMaxHeight;
      }
      
      public function set container(param1:Canvas) : void
      {
         var _loc2_:Object = this._410956671container;
         if(_loc2_ !== param1)
         {
            this._410956671container = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
         }
      }
      
      public function __invisibleBox_mouseOut(param1:MouseEvent) : void
      {
         setVisibleBoxSize(param1);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ChooseNewMapSizeForm = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ChooseNewMapSizeForm_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_modals_ChooseNewMapSizeFormWatcherSetupUtil");
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
      
      public function __invisibleBox_mouseMove(param1:MouseEvent) : void
      {
         setVisibleBoxSize(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : Canvas
      {
         return this._410956671container;
      }
      
      private function setVisibleBoxSize(param1:MouseEvent) : void
      {
         if(param1.buttonDown)
         {
            visibleBox.width = MgbMath.bound(param1.localX,MgbSystem.newMapMinWidth,MgbSystem.newMapMaxWidth);
            visibleBox.height = MgbMath.bound(param1.localY,MgbSystem.newMapMinHeight,MgbSystem.newMapMaxHeight);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get invisibleBox() : Canvas
      {
         return this._1778480418invisibleBox;
      }
      
      public function ___ChooseNewMapSizeForm_Button1_click(param1:MouseEvent) : void
      {
         doChoose(visibleBox.width,visibleBox.height);
      }
      
      public function ___ChooseNewMapSizeForm_Button2_click(param1:MouseEvent) : void
      {
         doCancel();
      }
      
      private function doCancel() : void
      {
         dispatchEvent(new ChooseNewMapSizeEvent("cancel"));
         PopUpManager.removePopUp(this);
      }
      
      private function _ChooseNewMapSizeForm_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Map size: " + visibleBox.width + " x " + visibleBox.height + "  (click in the box to resize)";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ChooseNewMapSizeForm_Text1.text = param1;
         },"_ChooseNewMapSizeForm_Text1.text");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.newMapMaxWidth;
         },function(param1:Number):void
         {
            container.width = param1;
         },"container.width");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.newMapMaxHeight;
         },function(param1:Number):void
         {
            container.height = param1;
         },"container.height");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.newMapDefaultWidth;
         },function(param1:Number):void
         {
            visibleBox.width = param1;
         },"visibleBox.width");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.newMapDefaultHeight;
         },function(param1:Number):void
         {
            visibleBox.height = param1;
         },"visibleBox.height");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = visibleBox.width + " x " + visibleBox.height;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ChooseNewMapSizeForm_Text2.text = param1;
         },"_ChooseNewMapSizeForm_Text2.text");
         result[5] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.newMapMaxWidth;
         },function(param1:Number):void
         {
            invisibleBox.width = param1;
         },"invisibleBox.width");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.newMapMaxHeight;
         },function(param1:Number):void
         {
            invisibleBox.height = param1;
         },"invisibleBox.height");
         result[7] = binding;
         return result;
      }
      
      public function ___ChooseNewMapSizeForm_TitleWindow1_close(param1:CloseEvent) : void
      {
         doCancel();
      }
      
      public function __invisibleBox_mouseDown(param1:MouseEvent) : void
      {
         setVisibleBoxSize(param1);
      }
      
      public function set visibleBox(param1:Canvas) : void
      {
         var _loc2_:Object = this._1943857145visibleBox;
         if(_loc2_ !== param1)
         {
            this._1943857145visibleBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visibleBox",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get visibleBox() : Canvas
      {
         return this._1943857145visibleBox;
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
      }
      
      public function set invisibleBox(param1:Canvas) : void
      {
         var _loc2_:Object = this._1778480418invisibleBox;
         if(_loc2_ !== param1)
         {
            this._1778480418invisibleBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"invisibleBox",_loc2_,param1));
         }
      }
   }
}
