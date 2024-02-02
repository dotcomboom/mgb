package
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
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class RendererTutorialPiece extends Canvas
   {
       
      
      private var _1714148973displayName:Text;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function RendererTutorialPiece()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":64,
                  "height":120,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Text,
                     "id":"displayName",
                     "stylesFactory":function():void
                     {
                        this.textAlign = "center";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "text":"",
                           "styleName":"denseTable"
                        };
                     }
                  })]
               };
            }
         });
         super();
         mx_internal::_document = this;
         this.width = 64;
         this.height = 120;
         this.addEventListener("dataChange",___RendererTutorialPiece_Canvas1_dataChange);
         this.addEventListener("creationComplete",___RendererTutorialPiece_Canvas1_creationComplete);
      }
      
      [Bindable(event="propertyChange")]
      public function get displayName() : Text
      {
         return this._1714148973displayName;
      }
      
      public function ___RendererTutorialPiece_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      public function ___RendererTutorialPiece_Canvas1_dataChange(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      public function set displayName(param1:Text) : void
      {
         var _loc2_:Object = this._1714148973displayName;
         if(_loc2_ !== param1)
         {
            this._1714148973displayName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayName",_loc2_,param1));
         }
      }
      
      private function setSelectedItem(param1:Event) : void
      {
         if(Boolean(displayName) && Boolean(data))
         {
            displayName.text = data.name;
         }
      }
   }
}
