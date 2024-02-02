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
   import mx.collections.*;
   import mx.containers.Canvas;
   import mx.controls.HorizontalList;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class Badge extends Canvas implements IBindingClient
   {
      
      public static const SILVER_COIN:String = "Silver coin";
      
      public static const GAME_WITH_500_PLAYS:String = "Game with 500 plays";
      
      public static const GAME_WITH_1000_PLAYS:String = "Game with 1000 plays";
      
      public static const GOLD_COIN:String = "Gold coin";
      
      public static const BRONZE_COIN:String = "Bronze coin";
      
      public static const COMPETITION_WINNER:String = "Competition winner";
      
      public static const COMPLETED_ALL_TUTORIALS:String = "Completed All Tutorials";
      
      public static const MODERATOR:String = "Moderator";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      public static const GAME_WITH_2000_PLAYS:String = "Game with 2000 plays";
      
      public static const COMPETITION_3RD_PLACE:String = "Competition 3rd Place";
      
      public static const COMPETITION_2ND_PLACE:String = "Competition 2nd Place";
       
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _3032115bsAC:ArrayCollection;
      
      private var _3322014list:HorizontalList;
      
      mx_internal var _watchers:Array;
      
      private var _97808bsA:Array;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function Badge()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":128,
                  "height":96,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":HorizontalList,
                     "id":"list",
                     "stylesFactory":function():void
                     {
                        this.borderStyle = "none";
                        this.backgroundAlpha = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "itemRenderer":_Badge_ClassFactory1_c(),
                           "verticalScrollPolicy":"off",
                           "horizontalScrollPolicy":"auto",
                           "selectable":false,
                           "columnWidth":72
                        };
                     }
                  })]
               };
            }
         });
         _97808bsA = new Array();
         _3032115bsAC = new ArrayCollection(bsA);
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 128;
         this.height = 96;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         Badge._watcherSetupUtil = param1;
      }
      
      public static function utilHasBadge(param1:String, param2:String) : Boolean
      {
         param1 = "," + param1 + ",";
         return param1.search("," + param2 + ",") >= 0;
      }
      
      public static function utilCountBadgesInString(param1:String) : int
      {
         return Boolean(param1) && param1.length > 0 ? int(param1.split(",").length) : 0;
      }
      
      [Bindable(event="propertyChange")]
      public function get bsAC() : ArrayCollection
      {
         return this._3032115bsAC;
      }
      
      private function _Badge_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BadgeRenderer;
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Badge = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _Badge_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_controls_BadgeWatcherSetupUtil");
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
      
      private function _Badge_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return bsAC;
         },function(param1:Object):void
         {
            list.dataProvider = param1;
         },"list.dataProvider");
         result[0] = binding;
         return result;
      }
      
      public function setBadgeString(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         bsAC.removeAll();
         if(param1)
         {
            _loc2_ = param1.split(",");
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               bsAC.addItem({"name":String(_loc2_[_loc3_])});
               _loc3_++;
            }
         }
         bsAC.refresh();
      }
      
      [Bindable(event="propertyChange")]
      public function get list() : HorizontalList
      {
         return this._3322014list;
      }
      
      [Bindable(event="propertyChange")]
      private function get bsA() : Array
      {
         return this._97808bsA;
      }
      
      private function set bsA(param1:Array) : void
      {
         var _loc2_:Object = this._97808bsA;
         if(_loc2_ !== param1)
         {
            this._97808bsA = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bsA",_loc2_,param1));
         }
      }
      
      public function set bsAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._3032115bsAC;
         if(_loc2_ !== param1)
         {
            this._3032115bsAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bsAC",_loc2_,param1));
         }
      }
      
      public function get badgeCount() : int
      {
         return !!bsAC ? bsAC.length : 0;
      }
      
      private function _Badge_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = bsAC;
      }
      
      public function set list(param1:HorizontalList) : void
      {
         var _loc2_:Object = this._3322014list;
         if(_loc2_ !== param1)
         {
            this._3322014list = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"list",_loc2_,param1));
         }
      }
   }
}
