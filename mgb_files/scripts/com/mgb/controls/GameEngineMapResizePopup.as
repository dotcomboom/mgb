package com.mgb.controls
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
   import mx.containers.TitleWindow;
   import mx.controls.Button;
   import mx.controls.HRule;
   import mx.controls.Label;
   import mx.controls.RadioButton;
   import mx.controls.RadioButtonGroup;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class GameEngineMapResizePopup extends TitleWindow implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1508100583actionString:String = "";
      
      mx_internal var _watchers:Array;
      
      private var _2109881054ruleLine2:HRule;
      
      private var _1641788370okButton:Button;
      
      private var _102362566lType:Label;
      
      private var _962590849direction:RadioButtonGroup;
      
      private var _2109881055ruleLine1:HRule;
      
      private var _967175457rBelow:RadioButton;
      
      private var _992361235rowOrColumn:RadioButtonGroup;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1990131276cancelButton:Button;
      
      private var _968185269rAbove:RadioButton;
      
      private var _3461839rAdd:RadioButton;
      
      private var _540428182rRemove:RadioButton;
      
      private var _107645849rLeft:RadioButton;
      
      private var _3478536rRow:RadioButton;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _952284982rRight:RadioButton;
      
      mx_internal var _bindings:Array;
      
      private var _255432696addOrRemove:RadioButtonGroup;
      
      private var _3286145lDir:Label;
      
      private var _120201832rColumn:RadioButton;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function GameEngineMapResizePopup()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "width":280,
                  "height":270,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Label,
                     "stylesFactory":function():void
                     {
                        this.fontWeight = "bold";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":10,
                           "y":10,
                           "text":"Add or Remove cells?"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RadioButton,
                     "id":"rAdd",
                     "events":{"click":"__rAdd_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":21,
                           "y":36,
                           "label":"Add",
                           "groupName":"addOrRemove"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RadioButton,
                     "id":"rRemove",
                     "events":{"click":"__rRemove_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":102,
                           "y":36,
                           "label":"Remove",
                           "groupName":"addOrRemove"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":HRule,
                     "id":"ruleLine1",
                     "stylesFactory":function():void
                     {
                        this.left = "10";
                        this.right = "10";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {"y":66};
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"lType",
                     "stylesFactory":function():void
                     {
                        this.fontWeight = "bold";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":10,
                           "y":76
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RadioButton,
                     "id":"rRow",
                     "events":{"click":"__rRow_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":21,
                           "y":102,
                           "label":"Row",
                           "groupName":"rowOrColumn"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RadioButton,
                     "id":"rColumn",
                     "events":{"click":"__rColumn_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":103,
                           "y":102,
                           "label":"Column",
                           "groupName":"rowOrColumn"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":HRule,
                     "id":"ruleLine2",
                     "stylesFactory":function():void
                     {
                        this.left = "10";
                        this.right = "10";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {"y":124};
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"lDir",
                     "stylesFactory":function():void
                     {
                        this.fontWeight = "bold";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":10,
                           "y":132,
                           "text":"In which direction?"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RadioButton,
                     "id":"rRight",
                     "events":{"click":"__rRight_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":21,
                           "y":160,
                           "label":"Right",
                           "groupName":"direction"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RadioButton,
                     "id":"rAbove",
                     "events":{"click":"__rAbove_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":21,
                           "y":160,
                           "label":"Above",
                           "groupName":"direction"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RadioButton,
                     "id":"rLeft",
                     "events":{"click":"__rLeft_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":103,
                           "y":160,
                           "label":"Left",
                           "groupName":"direction"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RadioButton,
                     "id":"rBelow",
                     "events":{"click":"__rBelow_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":103,
                           "y":160,
                           "label":"Below",
                           "groupName":"direction"
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Button,
                     "id":"okButton",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":10,
                           "y":196
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Button,
                     "id":"cancelButton",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "label":"Close",
                           "x":90,
                           "y":196
                        };
                     }
                  })]
               };
            }
         });
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.title = "Resize map";
         this.layout = "absolute";
         this.width = 280;
         this.height = 270;
         _GameEngineMapResizePopup_RadioButtonGroup1_i();
         _GameEngineMapResizePopup_RadioButtonGroup3_i();
         _GameEngineMapResizePopup_RadioButtonGroup2_i();
         this.addEventListener("creationComplete",___GameEngineMapResizePopup_TitleWindow1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         GameEngineMapResizePopup._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get lDir() : Label
      {
         return this._3286145lDir;
      }
      
      public function __rAbove_click(param1:MouseEvent) : void
      {
         updateControls();
      }
      
      public function set direction(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._962590849direction;
         if(_loc2_ !== param1)
         {
            this._962590849direction = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"direction",_loc2_,param1));
         }
      }
      
      public function __rBelow_click(param1:MouseEvent) : void
      {
         updateControls();
      }
      
      public function __rLeft_click(param1:MouseEvent) : void
      {
         updateControls();
      }
      
      public function set ruleLine2(param1:HRule) : void
      {
         var _loc2_:Object = this._2109881054ruleLine2;
         if(_loc2_ !== param1)
         {
            this._2109881054ruleLine2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ruleLine2",_loc2_,param1));
         }
      }
      
      public function set lType(param1:Label) : void
      {
         var _loc2_:Object = this._102362566lType;
         if(_loc2_ !== param1)
         {
            this._102362566lType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get addOrRemove() : RadioButtonGroup
      {
         return this._255432696addOrRemove;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:GameEngineMapResizePopup = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _GameEngineMapResizePopup_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_controls_GameEngineMapResizePopupWatcherSetupUtil");
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
      public function get rowOrColumn() : RadioButtonGroup
      {
         return this._992361235rowOrColumn;
      }
      
      private function _GameEngineMapResizePopup_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         addOrRemove = _loc1_;
         _loc1_.initialized(this,"addOrRemove");
         return _loc1_;
      }
      
      public function set lDir(param1:Label) : void
      {
         var _loc2_:Object = this._3286145lDir;
         if(_loc2_ !== param1)
         {
            this._3286145lDir = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lDir",_loc2_,param1));
         }
      }
      
      private function _GameEngineMapResizePopup_RadioButtonGroup3_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         direction = _loc1_;
         _loc1_.initialized(this,"direction");
         return _loc1_;
      }
      
      public function set rAdd(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3461839rAdd;
         if(_loc2_ !== param1)
         {
            this._3461839rAdd = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rAdd",_loc2_,param1));
         }
      }
      
      private function updateControls(param1:Boolean = false) : void
      {
         rRow.visible = rColumn.visible = rRight.visible = rLeft.visible = rAbove.visible = rBelow.visible = okButton.visible = lType.visible = lDir.visible = ruleLine2.visible = ruleLine1.visible = false;
         if(rAdd.selected || rRemove.selected)
         {
            actionString = rRemove.selected ? rRemove.label : rAdd.label;
            lType.visible = rRow.visible = rColumn.visible = ruleLine1.visible = true;
         }
         if(rRemove.selected)
         {
            lDir.visible = ruleLine2.visible = false;
            rAbove.visible = rBelow.visible = false;
            rLeft.visible = rRight.visible = false;
            okButton.visible = true;
         }
         if(rAdd.selected && (rRow.selected || rColumn.selected))
         {
            lDir.visible = ruleLine2.visible = true;
            if(rRow.selected)
            {
               rAbove.visible = rBelow.visible = true;
               okButton.visible = rAbove.selected || rBelow.selected;
            }
            if(rColumn.selected)
            {
               rLeft.visible = rRight.visible = true;
               okButton.visible = rLeft.selected || rRight.selected;
            }
         }
         dispatchEvent(new Event("MGB_updateMapView"));
      }
      
      public function __rColumn_click(param1:MouseEvent) : void
      {
         updateControls();
      }
      
      private function _GameEngineMapResizePopup_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = actionString + " Rows or Columns?";
         _loc1_ = actionString;
      }
      
      public function set rRight(param1:RadioButton) : void
      {
         var _loc2_:Object = this._952284982rRight;
         if(_loc2_ !== param1)
         {
            this._952284982rRight = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rRight",_loc2_,param1));
         }
      }
      
      public function set rAbove(param1:RadioButton) : void
      {
         var _loc2_:Object = this._968185269rAbove;
         if(_loc2_ !== param1)
         {
            this._968185269rAbove = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rAbove",_loc2_,param1));
         }
      }
      
      public function set addOrRemove(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._255432696addOrRemove;
         if(_loc2_ !== param1)
         {
            this._255432696addOrRemove = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addOrRemove",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ruleLine2() : HRule
      {
         return this._2109881054ruleLine2;
      }
      
      [Bindable(event="propertyChange")]
      public function get rRow() : RadioButton
      {
         return this._3478536rRow;
      }
      
      public function set rowOrColumn(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._992361235rowOrColumn;
         if(_loc2_ !== param1)
         {
            this._992361235rowOrColumn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowOrColumn",_loc2_,param1));
         }
      }
      
      private function _GameEngineMapResizePopup_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = actionString + " Rows or Columns?";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            lType.text = param1;
         },"lType.text");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = actionString;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            okButton.label = param1;
         },"okButton.label");
         result[1] = binding;
         return result;
      }
      
      public function set cancelButton(param1:Button) : void
      {
         var _loc2_:Object = this._1990131276cancelButton;
         if(_loc2_ !== param1)
         {
            this._1990131276cancelButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rBelow() : RadioButton
      {
         return this._967175457rBelow;
      }
      
      public function set rLeft(param1:RadioButton) : void
      {
         var _loc2_:Object = this._107645849rLeft;
         if(_loc2_ !== param1)
         {
            this._107645849rLeft = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rLeft",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get okButton() : Button
      {
         return this._1641788370okButton;
      }
      
      [Bindable(event="propertyChange")]
      public function get ruleLine1() : HRule
      {
         return this._2109881055ruleLine1;
      }
      
      public function set rRow(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3478536rRow;
         if(_loc2_ !== param1)
         {
            this._3478536rRow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rRow",_loc2_,param1));
         }
      }
      
      public function __rRemove_click(param1:MouseEvent) : void
      {
         updateControls();
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
         updateControls(true);
      }
      
      [Bindable(event="propertyChange")]
      public function get rRemove() : RadioButton
      {
         return this._540428182rRemove;
      }
      
      public function set rBelow(param1:RadioButton) : void
      {
         var _loc2_:Object = this._967175457rBelow;
         if(_loc2_ !== param1)
         {
            this._967175457rBelow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rBelow",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lType() : Label
      {
         return this._102362566lType;
      }
      
      public function __rRight_click(param1:MouseEvent) : void
      {
         updateControls();
      }
      
      [Bindable(event="propertyChange")]
      public function get rAdd() : RadioButton
      {
         return this._3461839rAdd;
      }
      
      public function set rColumn(param1:RadioButton) : void
      {
         var _loc2_:Object = this._120201832rColumn;
         if(_loc2_ !== param1)
         {
            this._120201832rColumn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rColumn",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rRight() : RadioButton
      {
         return this._952284982rRight;
      }
      
      private function set actionString(param1:String) : void
      {
         var _loc2_:Object = this._1508100583actionString;
         if(_loc2_ !== param1)
         {
            this._1508100583actionString = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionString",_loc2_,param1));
         }
      }
      
      public function set rRemove(param1:RadioButton) : void
      {
         var _loc2_:Object = this._540428182rRemove;
         if(_loc2_ !== param1)
         {
            this._540428182rRemove = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rRemove",_loc2_,param1));
         }
      }
      
      public function set okButton(param1:Button) : void
      {
         var _loc2_:Object = this._1641788370okButton;
         if(_loc2_ !== param1)
         {
            this._1641788370okButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okButton",_loc2_,param1));
         }
      }
      
      private function _GameEngineMapResizePopup_RadioButtonGroup2_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         rowOrColumn = _loc1_;
         _loc1_.initialized(this,"rowOrColumn");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get rAbove() : RadioButton
      {
         return this._968185269rAbove;
      }
      
      [Bindable(event="propertyChange")]
      private function get actionString() : String
      {
         return this._1508100583actionString;
      }
      
      public function set ruleLine1(param1:HRule) : void
      {
         var _loc2_:Object = this._2109881055ruleLine1;
         if(_loc2_ !== param1)
         {
            this._2109881055ruleLine1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ruleLine1",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rColumn() : RadioButton
      {
         return this._120201832rColumn;
      }
      
      public function __rRow_click(param1:MouseEvent) : void
      {
         updateControls();
      }
      
      public function __rAdd_click(param1:MouseEvent) : void
      {
         updateControls();
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelButton() : Button
      {
         return this._1990131276cancelButton;
      }
      
      [Bindable(event="propertyChange")]
      public function get rLeft() : RadioButton
      {
         return this._107645849rLeft;
      }
      
      public function ___GameEngineMapResizePopup_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      [Bindable(event="propertyChange")]
      public function get direction() : RadioButtonGroup
      {
         return this._962590849direction;
      }
   }
}
