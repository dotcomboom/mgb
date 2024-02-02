package korax.controls.ColorPicker
{
   import flash.display.*;
   import mx.core.UIComponent;
   
   public class ColorPickerCanvas extends UIComponent
   {
       
      
      public var bd:BitmapData = null;
      
      public var bm:Bitmap = null;
      
      public function ColorPickerCanvas()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         bd = new BitmapData(width,height,false,0);
         bm = new Bitmap(bd);
         addChild(bm);
      }
   }
}
