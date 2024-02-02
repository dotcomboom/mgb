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
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class InventoryEquippedItemRendererControl extends Canvas
   {
       
      
      private var _205235219actorPreview:ActorPreview;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1109124993ourItem:InventoryItem;
      
      public function InventoryEquippedItemRendererControl()
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
                  })]
               };
            }
         });
         super();
         mx_internal::_document = this;
         this.width = 80;
         this.height = 90;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("dataChange",___InventoryEquippedItemRendererControl_Canvas1_dataChange);
         this.addEventListener("creationComplete",___InventoryEquippedItemRendererControl_Canvas1_creationComplete);
      }
      
      [Bindable(event="propertyChange")]
      private function get ourItem() : InventoryItem
      {
         return this._1109124993ourItem;
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
      
      public function set actorPreview(param1:ActorPreview) : void
      {
         var _loc2_:Object = this._205235219actorPreview;
         if(_loc2_ !== param1)
         {
            this._205235219actorPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPreview",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      public function ___InventoryEquippedItemRendererControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      public function ___InventoryEquippedItemRendererControl_Canvas1_dataChange(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPreview() : ActorPreview
      {
         return this._205235219actorPreview;
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
   }
}
