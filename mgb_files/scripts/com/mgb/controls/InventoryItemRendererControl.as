package com.mgb.controls
{
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
   import mx.containers.Canvas;
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class InventoryItemRendererControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _InventoryItemRendererControl_Text1:Text;
      
      private var _205235219actorPreview:ActorPreview;
      
      mx_internal var _watchers:Array;
      
      public var _InventoryItemRendererControl_Text2:Text;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1109124993ourItem:InventoryItem;
      
      public function InventoryItemRendererControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":80,
                  "height":90,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":ActorPreview,
                     "id":"actorPreview",
                     "stylesFactory":function():void
                     {
                        this.top = "0";
                        this.horizontalCenter = "0";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "width":64,
                           "height":64
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Text,
                     "id":"_InventoryItemRendererControl_Text1",
                     "stylesFactory":function():void
                     {
                        this.fontSize = 9;
                        this.horizontalCenter = "0";
                        this.bottom = "9";
                     }
                  }),new UIComponentDescriptor({
                     "type":Text,
                     "id":"_InventoryItemRendererControl_Text2",
                     "stylesFactory":function():void
                     {
                        this.fontSize = 9;
                        this.horizontalCenter = "0";
                        this.bottom = "0";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {"text":"One equipped"};
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
         this.width = 80;
         this.height = 90;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("dataChange",___InventoryItemRendererControl_Canvas1_dataChange);
         this.addEventListener("creationComplete",___InventoryItemRendererControl_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         InventoryItemRendererControl._watcherSetupUtil = param1;
      }
      
      private function setSelectedItem(param1:Event) : void
      {
         ourItem = InventoryItem(data);
         if(Boolean(actorPreview) && Boolean(ourItem))
         {
            actorPreview.supressTooltips = true;
            if(ourItem.name == null || ourItem.name == "")
            {
               actorPreview.show(null);
               toolTip = "";
            }
            else
            {
               actorPreview.show(MgbActor(ourItem.actor));
               toolTip = ourItem.description + (!!ourItem.equippable ? " (" + ourItem.equipDescription + ")" : "") + ". Click to Select";
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPreview() : ActorPreview
      {
         return this._205235219actorPreview;
      }
      
      private function _InventoryItemRendererControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ourItem.count - (!!ourItem.equipped ? 1 : 0) + " carried";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _InventoryItemRendererControl_Text1.text = param1;
         },"_InventoryItemRendererControl_Text1.text");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ourItem.count - (!!ourItem.equipped ? 1 : 0) > 1;
         },function(param1:Boolean):void
         {
            _InventoryItemRendererControl_Text1.visible = param1;
         },"_InventoryItemRendererControl_Text1.visible");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ourItem.equipped;
         },function(param1:Boolean):void
         {
            _InventoryItemRendererControl_Text2.visible = param1;
         },"_InventoryItemRendererControl_Text2.visible");
         result[2] = binding;
         return result;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:InventoryItemRendererControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _InventoryItemRendererControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_controls_InventoryItemRendererControlWatcherSetupUtil");
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
      
      public function set actorPreview(param1:ActorPreview) : void
      {
         var _loc2_:Object = this._205235219actorPreview;
         if(_loc2_ !== param1)
         {
            this._205235219actorPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPreview",_loc2_,param1));
         }
      }
      
      public function ___InventoryItemRendererControl_Canvas1_dataChange(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      public function ___InventoryItemRendererControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      private function _InventoryItemRendererControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ourItem.count - (!!ourItem.equipped ? 1 : 0) + " carried";
         _loc1_ = ourItem.count - (!!ourItem.equipped ? 1 : 0) > 1;
         _loc1_ = ourItem.equipped;
      }
      
      private function set ourItem(param1:InventoryItem) : void
      {
         var _loc2_:Object = this._1109124993ourItem;
         if(_loc2_ !== param1)
         {
            this._1109124993ourItem = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ourItem",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get ourItem() : InventoryItem
      {
         return this._1109124993ourItem;
      }
   }
}
