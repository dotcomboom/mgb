package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   use namespace mx_internal;
   
   public class DateChooserMonthArrowSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var cache:Object = {};
       
      
      public function DateChooserMonthArrowSkin()
      {
         super();
      }
      
      private static function calcDerivedStyles(param1:uint, param2:uint, param3:uint) : Object
      {
         var _loc5_:Object = null;
         var _loc4_:String = HaloColors.getCacheKey(param1,param2,param3);
         if(!cache[_loc4_])
         {
            _loc5_ = cache[_loc4_] = {};
            HaloColors.addHaloColors(_loc5_,param1,param2,param3);
         }
         return cache[_loc4_];
      }
      
      override public function get measuredWidth() : Number
      {
         return 19;
      }
      
      override public function get measuredHeight() : Number
      {
         return 20;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:uint = getStyle("iconColor");
         var _loc4_:uint = getStyle("borderColor");
         var _loc5_:Number = getStyle("cornerRadius");
         var _loc6_:Array = getStyle("fillColors");
         StyleManager.getColorNames(_loc6_);
         var _loc7_:Array = getStyle("highlightAlphas");
         var _loc8_:uint = getStyle("themeColor");
         var _loc9_:Object = calcDerivedStyles(_loc8_,_loc6_[0],_loc6_[1]);
         var _loc10_:Number = ColorUtil.adjustBrightness2(_loc4_,-50);
         var _loc11_:Number = ColorUtil.adjustBrightness2(_loc8_,-25);
         var _loc12_:Number = Math.max(0,_loc5_ - 1);
         var _loc13_:Number = Math.max(0,_loc5_ - 2);
         var _loc14_:Graphics;
         (_loc14_ = graphics).clear();
         switch(name)
         {
            case "prevMonthUpSkin":
            case "nextMonthUpSkin":
               drawRoundRect(0,0,param1,param2,_loc12_,[_loc4_,_loc10_],1,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc13_,[_loc6_[0],_loc6_[1]],1,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,{
                  "tl":_loc13_,
                  "tr":_loc12_,
                  "bl":0,
                  "br":0
               },[16777215,16777215],_loc7_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               break;
            case "prevMonthOverSkin":
            case "nextMonthOverSkin":
               drawRoundRect(0,0,param1,param2,_loc12_,[_loc8_,_loc11_],1,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc13_,[_loc9_.fillColorBright1,_loc9_.fillColorBright2],1,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,{
                  "tl":_loc13_,
                  "tr":_loc12_,
                  "bl":0,
                  "br":0
               },[16777215,16777215],_loc7_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               break;
            case "prevMonthDownSkin":
            case "nextMonthDownSkin":
               drawRoundRect(0,0,param1,param2,_loc12_,[_loc8_,_loc11_],1,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc13_,[_loc9_.fillColorPress1,_loc9_.fillColorPress2],1,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,{
                  "tl":_loc13_,
                  "tr":_loc12_,
                  "bl":0,
                  "br":0
               },[16777215,16777215],_loc7_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               break;
            case "prevMonthDisabledSkin":
            case "nextMonthDisabledSkin":
               drawRoundRect(0,0,param1,param2,_loc12_,[_loc4_,_loc10_],0.6,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc13_,[_loc6_[0],_loc6_[1]],0.8,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               _loc3_ = getStyle("disabledIconColor");
         }
         _loc14_.beginFill(_loc3_);
         if(name.charAt(0) == "p")
         {
            _loc14_.moveTo(param1 - 8,param2 - 14);
            _loc14_.lineTo(param1 - 13,param2 / 2 + 0.5);
            _loc14_.lineTo(param1 - 8,param2 - 5);
            _loc14_.moveTo(param1 - 8,param2 - 14);
         }
         else
         {
            _loc14_.moveTo(param1 - 11,param2 - 14);
            _loc14_.lineTo(param1 - 6,param2 / 2 + 0.5);
            _loc14_.lineTo(param1 - 11,param2 - 5);
            _loc14_.moveTo(param1 - 11,param2 - 14);
         }
         _loc14_.endFill();
      }
   }
}
