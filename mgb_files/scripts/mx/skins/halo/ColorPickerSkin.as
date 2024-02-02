package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.Border;
   
   use namespace mx_internal;
   
   public class ColorPickerSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var borderHighlightColor:uint = 16711422;
      
      private var borderSize:Number = 1;
      
      private var arrowHeight:Number = 5;
      
      private var backgroundColor:uint = 15066855;
      
      private var borderShadowColor:uint = 10132381;
      
      private var bevelSize:Number = 1;
      
      private var arrowWidth:Number = 7;
      
      public function ColorPickerSkin()
      {
         super();
      }
      
      private function drawFill(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Graphics;
         (_loc7_ = graphics).moveTo(param1,param2);
         _loc7_.beginFill(param5,param6);
         _loc7_.lineTo(param1 + param3,param2);
         _loc7_.lineTo(param1 + param3,param4 + param2);
         _loc7_.lineTo(param1,param4 + param2);
         _loc7_.lineTo(param1,param2);
         _loc7_.endFill();
      }
      
      private function drawArrow(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Graphics;
         (_loc7_ = graphics).moveTo(param1,param2);
         _loc7_.beginFill(param5,param6);
         _loc7_.lineTo(param1 + param3,param2);
         _loc7_.lineTo(param1 + param3 / 2,param4 + param2);
         _loc7_.lineTo(param1,param2);
         _loc7_.endFill();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:uint = getStyle("iconColor");
         var _loc4_:Number = param1 - arrowWidth - bevelSize;
         var _loc5_:Number = param2 - arrowHeight - bevelSize;
         graphics.clear();
         if(name == "upSkin" || name == "overSkin")
         {
            drawFill(x,y,param1 + bevelSize,param2 + bevelSize,13421772,0);
            drawBorder(x,y,param1,param2,borderHighlightColor,borderShadowColor,bevelSize,1);
            drawBorder(x + bevelSize,y + bevelSize,param1 - bevelSize * 2,param2 - bevelSize * 2,backgroundColor,backgroundColor,borderSize,1);
            drawBorder(x + bevelSize + borderSize,y + bevelSize + borderSize,param1 - (bevelSize + borderSize) * 2,param2 - (bevelSize + borderSize) * 2,borderShadowColor,borderHighlightColor,bevelSize,1);
            drawFill(_loc4_,_loc5_,arrowWidth,arrowHeight,backgroundColor,1);
            drawArrow(_loc4_ + 1.5,_loc5_ + 1.5,arrowWidth - 3,arrowHeight - 3,_loc3_,1);
         }
         else if(name == "downSkin")
         {
            drawFill(x,y,param1,param2,13421772,0);
            drawBorder(x,y,param1,param2,borderHighlightColor,13421772,bevelSize,1);
            drawBorder(x + bevelSize,y + bevelSize,param1 - 2 * bevelSize,param2 - 2 * bevelSize,backgroundColor,backgroundColor,borderSize,1);
            drawBorder(x + bevelSize + borderSize,y + bevelSize + borderSize,param1 - 2 * (bevelSize + borderSize),param2 - 2 * (bevelSize + borderSize),borderShadowColor,borderHighlightColor,bevelSize,1);
            drawFill(_loc4_,_loc5_,arrowWidth,arrowHeight,backgroundColor,1);
            drawArrow(_loc4_ + 1.5,_loc5_ + 1.5,arrowWidth - 3,arrowHeight - 3,_loc3_,1);
         }
         else if(name == "disabledSkin")
         {
            _loc3_ = getStyle("disabledIconColor");
            drawRoundRect(x,y,param1,param2,0,16777215,0.6);
            drawFill(x,y,param1,param2,16777215,0.25);
            drawBorder(x,y,param1,param2,borderHighlightColor,13421772,bevelSize,1);
            drawBorder(x + bevelSize,y + bevelSize,param1 - bevelSize * 2,param2 - bevelSize * 2,backgroundColor,backgroundColor,borderSize,1);
            drawBorder(x + bevelSize + borderSize,y + bevelSize + borderSize,param1 - 2 * (bevelSize + borderSize),param2 - 2 * (bevelSize + borderSize),borderShadowColor,borderHighlightColor,bevelSize,1);
            drawFill(_loc4_,_loc5_,arrowWidth,arrowHeight,backgroundColor,1);
            drawArrow(_loc4_ + 1.5,_loc5_ + 1.5,arrowWidth - 3,arrowHeight - 3,_loc3_,1);
         }
      }
      
      private function drawBorder(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         drawFill(param1,param2,param7,param4,param5,param8);
         drawFill(param1,param2,param3,param7,param5,param8);
         drawFill(param1 + (param3 - param7),param2,param7,param4,param6,param8);
         drawFill(param1,param2 + (param4 - param7),param3,param7,param6,param8);
      }
   }
}
