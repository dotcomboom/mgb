package
{
   import com.mgb.controls.BitmapDuper;
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
   
   public class BadgeRenderer extends Canvas
   {
       
      
      private var _data:Object;
      
      private var _2101909190tilePreview:BitmapDuper;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function BadgeRenderer()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":72,
                  "height":64,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":BitmapDuper,
                     "id":"tilePreview",
                     "stylesFactory":function():void
                     {
                        this.left = "4";
                        this.top = "0";
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
         this.width = 72;
         this.height = 64;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.addEventListener("creationComplete",___BadgeRenderer_Canvas1_creationComplete);
      }
      
      private function draw() : void
      {
         if(Boolean(tilePreview) && Boolean(data))
         {
            if(data.name == null || data.name == "")
            {
               tilePreview.drawDupe(null);
               toolTip = "";
            }
            else
            {
               tilePreview.drawDupeFromName(MgbSystem.reservedSystemUserName,MgbSystem.reservedSystemBadgeTilesProjectName,data.name,"",false);
               toolTip = data.name;
            }
         }
      }
      
      override public function get data() : Object
      {
         return _data;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      public function set tilePreview(param1:BitmapDuper) : void
      {
         var _loc2_:Object = this._2101909190tilePreview;
         if(_loc2_ !== param1)
         {
            this._2101909190tilePreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilePreview",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePreview() : BitmapDuper
      {
         return this._2101909190tilePreview;
      }
      
      [Bindable(event="propertyChange")]
      override public function set data(param1:Object) : void
      {
         var _loc2_:Object = this.data;
         if(_loc2_ !== param1)
         {
            this._3076010data = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"data",_loc2_,param1));
         }
      }
      
      public function set _3076010data(param1:Object) : void
      {
         _data = param1;
         draw();
      }
      
      public function ___BadgeRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         draw();
      }
   }
}
