package mx.skins.halo
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   use namespace mx_internal;
   
   public class NumericStepperUpSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var cache:Object = {};
       
      
      public function NumericStepperUpSkin()
      {
         super();
      }
      
      private static function calcDerivedStyles(param1:uint, param2:uint, param3:uint, param4:uint) : Object
      {
         var _loc6_:Object = null;
         var _loc5_:String = HaloColors.getCacheKey(param1,param2,param3,param4);
         if(!cache[_loc5_])
         {
            _loc6_ = cache[_loc5_] = {};
            HaloColors.addHaloColors(_loc6_,param1,param3,param4);
            _loc6_.borderColorDrk1 = ColorUtil.adjustBrightness2(param2,-50);
            _loc6_.borderColorDrk2 = ColorUtil.adjustBrightness2(param2,-25);
         }
         return cache[_loc5_];
      }
      
      override public function get measuredWidth() : Number
      {
         return 19;
      }
      
      override public function get measuredHeight() : Number
      {
         return 11;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         super.updateDisplayList(param1,param2);
         var _loc3_:uint = getStyle("iconColor");
         var _loc4_:uint = getStyle("borderColor");
         var _loc5_:Number = getStyle("cornerRadius");
         var _loc6_:Array = getStyle("fillAlphas");
         var _loc7_:Array = getStyle("fillColors");
         StyleManager.getColorNames(_loc7_);
         var _loc8_:Array = getStyle("highlightAlphas");
         var _loc9_:uint = getStyle("themeColor");
         var _loc10_:Object = calcDerivedStyles(_loc9_,_loc4_,_loc7_[0],_loc7_[1]);
         var _loc11_:Object = {
            "tl":0,
            "tr":_loc5_,
            "bl":0,
            "br":0
         };
         var _loc12_:Object = {
            "tl":0,
            "tr":Math.max(_loc5_ - 1,0),
            "bl":0,
            "br":0
         };
         var _loc13_:Graphics;
         (_loc13_ = graphics).clear();
         switch(name)
         {
            case "upArrowUpSkin":
               _loc14_ = [_loc7_[0],_loc7_[1]];
               _loc15_ = [_loc6_[0],_loc6_[1]];
               drawRoundRect(0,0,param1,param2,_loc11_,[_loc4_,_loc10_.borderColorDrk2],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":_loc12_
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc12_,_loc14_,_loc15_,verticalGradientMatrix(1,1,param1 - 2,param2 * 2));
               drawRoundRect(1,1,param1 - 2,param2 - 3,_loc12_,[16777215,16777215],_loc8_,verticalGradientMatrix(1,1,param1 - 2,param2 - 3));
               break;
            case "upArrowOverSkin":
               if(_loc7_.length > 2)
               {
                  _loc16_ = [_loc7_[2],_loc7_[3]];
               }
               else
               {
                  _loc16_ = [_loc7_[0],_loc7_[1]];
               }
               if(_loc6_.length > 2)
               {
                  _loc17_ = [_loc6_[2],_loc6_[3]];
               }
               else
               {
                  _loc17_ = [_loc6_[0],_loc6_[1]];
               }
               drawRoundRect(0,0,param1,param2,_loc11_,[_loc9_,_loc10_.themeColDrk2],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":_loc12_
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc12_,[_loc10_.fillColorBright1,_loc10_.fillColorBright2],1,verticalGradientMatrix(1,1,param1 - 2,param2 * 2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc12_,[16777215,16777215],_loc8_,verticalGradientMatrix(0,0,param1 - 2,param2 * 2));
               break;
            case "upArrowDownSkin":
               drawRoundRect(0,0,param1,param2,_loc11_,[_loc9_,_loc10_.themeColDrk2],1,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc12_,[_loc10_.fillColorPress1,_loc10_.fillColorPress2],1,verticalGradientMatrix(1,1,param1 - 2,param2 * 2));
               drawRoundRect(1,1,param1 - 2,param2 - 3,_loc12_,[16777215,16777215],_loc8_,verticalGradientMatrix(1,1,param1 - 2,param2 - 3));
               break;
            case "upArrowDisabledSkin":
               _loc18_ = [_loc7_[0],_loc7_[1]];
               _loc19_ = [Math.max(0,_loc6_[0] - 0.15),Math.max(0,_loc6_[1] - 0.15)];
               drawRoundRect(0,0,param1,param2,_loc11_,[_loc4_,_loc10_.borderColorDrk2],0.5,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":_loc12_
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc12_,_loc18_,_loc19_,verticalGradientMatrix(1,1,param1 - 2,param2 * 2));
               _loc3_ = getStyle("disabledIconColor");
         }
         _loc13_.beginFill(_loc3_);
         _loc13_.moveTo(param1 / 2,param2 / 2 - 2.5);
         _loc13_.lineTo(param1 / 2 - 3.5,param2 / 2 + 1.5);
         _loc13_.lineTo(param1 / 2 + 3.5,param2 / 2 + 1.5);
         _loc13_.lineTo(param1 / 2,param2 / 2 - 2.5);
         _loc13_.endFill();
      }
   }
}
