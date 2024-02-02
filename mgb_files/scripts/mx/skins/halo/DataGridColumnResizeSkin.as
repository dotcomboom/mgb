package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   
   use namespace mx_internal;
   
   public class DataGridColumnResizeSkin extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function DataGridColumnResizeSkin()
      {
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 2;
      }
      
      override public function get measuredHeight() : Number
      {
         return 10;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.beginFill(0,0.4);
         _loc3_.drawRect(0,0,param1,param2);
         _loc3_.endFill();
      }
   }
}
