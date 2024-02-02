package mx.skins.halo
{
   import mx.core.mx_internal;
   import mx.skins.Border;
   
   use namespace mx_internal;
   
   public class SwatchPanelSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function SwatchPanelSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         super.updateDisplayList(param1,param2);
         if(name == "swatchPanelBorder")
         {
            _loc3_ = getStyle("backgroundColor");
            _loc4_ = getStyle("borderColor");
            _loc5_ = getStyle("highlightColor");
            _loc6_ = getStyle("shadowColor");
            _loc7_ = 0;
            _loc8_ = 0;
            graphics.clear();
            drawRoundRect(_loc7_,_loc8_,param1,param2,0,_loc4_,1);
            drawRoundRect(_loc7_ + 1,_loc8_ + 1,param1 - 1,param2 - 1,0,_loc6_,1);
            drawRoundRect(_loc7_ + 1,_loc8_ + 1,param1 - 2,param2 - 2,0,_loc5_,1);
            drawRoundRect(_loc7_ + 2,_loc8_ + 2,param1 - 4,param2 - 4,0,[_loc3_,_loc5_],1,verticalGradientMatrix(_loc7_ + 2,_loc8_ + 2,param1 - 4,param2 - 4));
         }
      }
   }
}
