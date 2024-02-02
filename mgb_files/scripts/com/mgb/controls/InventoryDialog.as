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
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.TabNavigator;
   import mx.containers.VBox;
   import mx.controls.Image;
   import mx.controls.LinkButton;
   import mx.controls.Text;
   import mx.controls.TileList;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class InventoryDialog extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _108835nav:TabNavigator;
      
      private var _2020599460inventory:Inventory = null;
      
      private var _1102661043borderImgCls:Class;
      
      mx_internal var _watchers:Array;
      
      public var _InventoryDialog_Text3:Text;
      
      private var _embed_mxml__________Resources_CloseIcon_PNG_1777034285:Class;
      
      private var _1525665766inventoryList:TileList;
      
      private var _3433268pan1:Panel;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var _InventoryDialog_HBox1:HBox;
      
      private var _1812812345inventoryItemPreview:ActorPreview;
      
      private var _956697018inventoryItemName:Text;
      
      private var _282641836equipDescription:Text;
      
      private var _737814469activeTabTileList:TileList = null;
      
      public var _InventoryDialog_LinkButton1:LinkButton;
      
      public var _InventoryDialog_LinkButton2:LinkButton;
      
      public var _InventoryDialog_LinkButton3:LinkButton;
      
      public var _InventoryDialog_LinkButton4:LinkButton;
      
      public var _InventoryDialog_Image1:Image;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1384261499equippedInventoryList:TileList;
      
      public function InventoryDialog()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"_InventoryDialog_Image1",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "toolTip":"Close",
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
                           "id":"_InventoryDialog_HBox1",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "height":80,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":ActorPreview,
                                    "id":"inventoryItemPreview",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":64,
                                          "height":64
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function():void
                                    {
                                       this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":Text,
                                          "id":"inventoryItemName",
                                          "stylesFactory":function():void
                                          {
                                             this.textAlign = "left";
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "percentWidth":100,
                                                "styleName":"denseTable"
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Text,
                                          "id":"equipDescription",
                                          "stylesFactory":function():void
                                          {
                                             this.textAlign = "left";
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "percentWidth":100,
                                                "styleName":"denseTable"
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":HBox,
                                          "propertiesFactory":function():Object
                                          {
                                             return {"childDescriptors":[new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_InventoryDialog_LinkButton1",
                                                "events":{"click":"___InventoryDialog_LinkButton1_click"}
                                             }),new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_InventoryDialog_LinkButton2",
                                                "events":{"click":"___InventoryDialog_LinkButton2_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"label":"Use"};
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_InventoryDialog_LinkButton3",
                                                "events":{"click":"___InventoryDialog_LinkButton3_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"label":"Drop"};
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_InventoryDialog_LinkButton4",
                                                "events":{"click":"___InventoryDialog_LinkButton4_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"label":"Destroy"};
                                                }
                                             })]};
                                          }
                                       })]};
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_InventoryDialog_Text3",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "styleName":"denseTable"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":TabNavigator,
                           "id":"nav",
                           "events":{"change":"__nav_change"},
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
                                          "label":"Inventory",
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":TileList,
                                             "id":"inventoryList",
                                             "events":{"change":"__inventoryList_change"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "itemRenderer":_InventoryDialog_ClassFactory1_c(),
                                                   "columnWidth":80,
                                                   "rowHeight":90,
                                                   "allowMultipleSelection":false,
                                                   "dragEnabled":false
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "label":"Equipped items",
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":TileList,
                                             "id":"equippedInventoryList",
                                             "events":{"change":"__equippedInventoryList_change"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "itemRenderer":_InventoryDialog_ClassFactory2_c(),
                                                   "columnWidth":80,
                                                   "rowHeight":90,
                                                   "allowMultipleSelection":false,
                                                   "dragEnabled":false
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
               }),new UIComponentDescriptor({
                  "type":Image,
                  "events":{"click":"___InventoryDialog_Image2_click"},
                  "stylesFactory":function():void
                  {
                     this.top = "28";
                     this.right = "34";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"source":_embed_mxml__________Resources_CloseIcon_PNG_1777034285};
                  }
               })]};
            }
         });
         _1102661043borderImgCls = InventoryDialog_borderImgCls;
         _embed_mxml__________Resources_CloseIcon_PNG_1777034285 = InventoryDialog__embed_mxml__________Resources_CloseIcon_PNG_1777034285;
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
         this.addEventListener("show",___InventoryDialog_Canvas1_show);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         InventoryDialog._watcherSetupUtil = param1;
      }
      
      public function __equippedInventoryList_change(param1:ListEvent) : void
      {
         updateImage();
      }
      
      public function __inventoryList_change(param1:ListEvent) : void
      {
         updateImage();
      }
      
      public function set equippedInventoryList(param1:TileList) : void
      {
         var _loc2_:Object = this._1384261499equippedInventoryList;
         if(_loc2_ !== param1)
         {
            this._1384261499equippedInventoryList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"equippedInventoryList",_loc2_,param1));
         }
      }
      
      public function set inventoryItemPreview(param1:ActorPreview) : void
      {
         var _loc2_:Object = this._1812812345inventoryItemPreview;
         if(_loc2_ !== param1)
         {
            this._1812812345inventoryItemPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inventoryItemPreview",_loc2_,param1));
         }
      }
      
      public function set inventoryItemName(param1:Text) : void
      {
         var _loc2_:Object = this._956697018inventoryItemName;
         if(_loc2_ !== param1)
         {
            this._956697018inventoryItemName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inventoryItemName",_loc2_,param1));
         }
      }
      
      private function set activeTabTileList(param1:TileList) : void
      {
         var _loc2_:Object = this._737814469activeTabTileList;
         if(_loc2_ !== param1)
         {
            this._737814469activeTabTileList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTabTileList",_loc2_,param1));
         }
      }
      
      public function ___InventoryDialog_LinkButton1_click(param1:MouseEvent) : void
      {
         dispatchEvent(new InventoryDialogEvent(InventoryDialogEvent.INVENTORY_ACTION,InventoryDialogEvent.ACTION_EQUIP,InventoryItem(activeTabTileList.selectedItem)));
      }
      
      public function ___InventoryDialog_LinkButton3_click(param1:MouseEvent) : void
      {
         dispatchEvent(new InventoryDialogEvent(InventoryDialogEvent.INVENTORY_ACTION,InventoryDialogEvent.ACTION_DROP,InventoryItem(activeTabTileList.selectedItem)));
      }
      
      private function updateImage() : void
      {
         if(Boolean(activeTabTileList) && Boolean(activeTabTileList.selectedItem))
         {
            inventoryItemPreview.show(InventoryItem(activeTabTileList.selectedItem).actor);
         }
      }
      
      public function setInventory(param1:Inventory) : void
      {
         this.inventory = param1;
         if(inventoryList.selectedIndex == -1 && param1.invAC.length > 0)
         {
            selectTab(0);
            activeTabTileList.selectedIndex = 0;
            updateImage();
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:InventoryDialog = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _InventoryDialog_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_controls_InventoryDialogWatcherSetupUtil");
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
      public function get inventoryList() : TileList
      {
         return this._1525665766inventoryList;
      }
      
      [Bindable(event="propertyChange")]
      public function get nav() : TabNavigator
      {
         return this._108835nav;
      }
      
      private function _InventoryDialog_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = InventoryItemRendererControl;
         return _loc1_;
      }
      
      public function closeMe() : void
      {
         dispatchEvent(new InventoryDialogEvent(InventoryDialogEvent.INVENTORY_ACTION,InventoryDialogEvent.ACTION_CLOSE,null));
      }
      
      public function set inventoryList(param1:TileList) : void
      {
         var _loc2_:Object = this._1525665766inventoryList;
         if(_loc2_ !== param1)
         {
            this._1525665766inventoryList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inventoryList",_loc2_,param1));
         }
      }
      
      private function _InventoryDialog_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return borderImgCls;
         },function(param1:Object):void
         {
            _InventoryDialog_Image1.source = param1;
         },"_InventoryDialog_Image1.source");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return pan1.height;
         },function(param1:Number):void
         {
            _InventoryDialog_Image1.height = param1;
         },"_InventoryDialog_Image1.height");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return pan1.width;
         },function(param1:Number):void
         {
            _InventoryDialog_Image1.width = param1;
         },"_InventoryDialog_Image1.width");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return activeTabTileList.selectedItem != null;
         },function(param1:Boolean):void
         {
            _InventoryDialog_HBox1.visible = param1;
         },"_InventoryDialog_HBox1.visible");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Description: " + activeTabTileList.selectedItem.description;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            inventoryItemName.text = param1;
         },"inventoryItemName.text");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = InventoryItem(activeTabTileList.selectedItem).equipDescription;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            equipDescription.text = param1;
         },"equipDescription.text");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !!activeTabTileList.selectedItem.equipped ? "Un-Equip" : "Equip";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _InventoryDialog_LinkButton1.label = param1;
         },"_InventoryDialog_LinkButton1.label");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return Boolean(activeTabTileList.selectedItem.equippable) && !activeTabTileList.selectedItem.autoEquippable;
         },function(param1:Boolean):void
         {
            _InventoryDialog_LinkButton1.visible = param1;
         },"_InventoryDialog_LinkButton1.visible");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return activeTabTileList.selectedItem.usable;
         },function(param1:Boolean):void
         {
            _InventoryDialog_LinkButton2.visible = param1;
         },"_InventoryDialog_LinkButton2.visible");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !activeTabTileList.selectedItem.autoEquippable;
         },function(param1:Boolean):void
         {
            _InventoryDialog_LinkButton3.visible = param1;
         },"_InventoryDialog_LinkButton3.visible");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !activeTabTileList.selectedItem.autoEquippable;
         },function(param1:Boolean):void
         {
            _InventoryDialog_LinkButton4.visible = param1;
         },"_InventoryDialog_LinkButton4.visible");
         result[10] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Equipment Effect: " + inventory.fullEquipmentEffectSummary;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _InventoryDialog_Text3.text = param1;
         },"_InventoryDialog_Text3.text");
         result[11] = binding;
         binding = new Binding(this,function():Object
         {
            return inventory.invAC;
         },function(param1:Object):void
         {
            inventoryList.dataProvider = param1;
         },"inventoryList.dataProvider");
         result[12] = binding;
         binding = new Binding(this,function():Object
         {
            return inventory.invAC;
         },function(param1:Object):void
         {
            equippedInventoryList.dataProvider = param1;
         },"equippedInventoryList.dataProvider");
         result[13] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get inventoryItemPreview() : ActorPreview
      {
         return this._1812812345inventoryItemPreview;
      }
      
      private function _InventoryDialog_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = borderImgCls;
         _loc1_ = pan1.height;
         _loc1_ = pan1.width;
         _loc1_ = activeTabTileList.selectedItem != null;
         _loc1_ = "Description: " + activeTabTileList.selectedItem.description;
         _loc1_ = InventoryItem(activeTabTileList.selectedItem).equipDescription;
         _loc1_ = !!activeTabTileList.selectedItem.equipped ? "Un-Equip" : "Equip";
         _loc1_ = activeTabTileList.selectedItem.equippable && !activeTabTileList.selectedItem.autoEquippable;
         _loc1_ = activeTabTileList.selectedItem.usable;
         _loc1_ = !activeTabTileList.selectedItem.autoEquippable;
         _loc1_ = !activeTabTileList.selectedItem.autoEquippable;
         _loc1_ = "Equipment Effect: " + inventory.fullEquipmentEffectSummary;
         _loc1_ = inventory.invAC;
         _loc1_ = inventory.invAC;
      }
      
      public function __nav_change(param1:IndexChangedEvent) : void
      {
         selectTab(nav.selectedIndex);
      }
      
      private function set inventory(param1:Inventory) : void
      {
         var _loc2_:Object = this._2020599460inventory;
         if(_loc2_ !== param1)
         {
            this._2020599460inventory = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inventory",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inventoryItemName() : Text
      {
         return this._956697018inventoryItemName;
      }
      
      [Bindable(event="propertyChange")]
      public function get pan1() : Panel
      {
         return this._3433268pan1;
      }
      
      private function fF_onlyIfNotEquipped(param1:Object) : Boolean
      {
         return InventoryItem(param1).equipped == false || InventoryItem(param1).equipped == true && InventoryItem(param1).count > 1;
      }
      
      [Bindable(event="propertyChange")]
      public function get borderImgCls() : Class
      {
         return this._1102661043borderImgCls;
      }
      
      public function set nav(param1:TabNavigator) : void
      {
         var _loc2_:Object = this._108835nav;
         if(_loc2_ !== param1)
         {
            this._108835nav = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nav",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get equipDescription() : Text
      {
         return this._282641836equipDescription;
      }
      
      [Bindable(event="propertyChange")]
      private function get activeTabTileList() : TileList
      {
         return this._737814469activeTabTileList;
      }
      
      public function ___InventoryDialog_LinkButton2_click(param1:MouseEvent) : void
      {
         dispatchEvent(new InventoryDialogEvent(InventoryDialogEvent.INVENTORY_ACTION,InventoryDialogEvent.ACTION_USE,InventoryItem(activeTabTileList.selectedItem)));
      }
      
      public function ___InventoryDialog_LinkButton4_click(param1:MouseEvent) : void
      {
         dispatchEvent(new InventoryDialogEvent(InventoryDialogEvent.INVENTORY_ACTION,InventoryDialogEvent.ACTION_DESTROY,InventoryItem(activeTabTileList.selectedItem)));
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
      
      private function fF_onlyIfEquipped(param1:Object) : Boolean
      {
         return InventoryItem(param1).equipped == true;
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
      
      public function ___InventoryDialog_Image2_click(param1:MouseEvent) : void
      {
         closeMe();
      }
      
      private function _InventoryDialog_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = InventoryEquippedItemRendererControl;
         return _loc1_;
      }
      
      private function initDialog() : void
      {
         nav.selectedIndex = 0;
      }
      
      private function selectTab(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               activeTabTileList = inventoryList;
               inventory.invAC.filterFunction = fF_onlyIfNotEquipped;
               break;
            case 1:
               activeTabTileList = equippedInventoryList;
               inventory.invAC.filterFunction = fF_onlyIfEquipped;
         }
         inventory.invAC.refresh();
      }
      
      public function set equipDescription(param1:Text) : void
      {
         var _loc2_:Object = this._282641836equipDescription;
         if(_loc2_ !== param1)
         {
            this._282641836equipDescription = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"equipDescription",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get equippedInventoryList() : TileList
      {
         return this._1384261499equippedInventoryList;
      }
      
      public function ___InventoryDialog_Canvas1_show(param1:FlexEvent) : void
      {
         initDialog();
      }
      
      [Bindable(event="propertyChange")]
      private function get inventory() : Inventory
      {
         return this._2020599460inventory;
      }
   }
}
