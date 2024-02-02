package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   
   use namespace mx_internal;
   
   public class DateChooserIndicator extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      mx_internal var indicatorColor:String = "rollOverColor";
      
      public function DateChooserIndicator()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.lineStyle(0,getStyle("themeColor"),0);
         _loc3_.beginFill(getStyle(mx_internal::indicatorColor));
         _loc3_.drawRect(1,0,param1 - 2,param2);
         _loc3_.endFill();
      }
   }
}
