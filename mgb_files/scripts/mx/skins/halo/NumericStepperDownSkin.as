package mx.skins.halo
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   use namespace mx_internal;
   
   public class NumericStepperDownSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var cache:Object = {};
       
      
      public function NumericStepperDownSkin()
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
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         super.updateDisplayList(param1,param2);
         var _loc3_:uint = getStyle("iconColor");
         var _loc4_:uint = getStyle("borderColor");
         var _loc5_:Number = getStyle("cornerRadius");
         var _loc6_:Array = getStyle("fillAlphas");
         var _loc7_:Array = getStyle("fillColors");
         StyleManager.getColorNames(_loc7_);
         var _loc8_:uint = getStyle("themeColor");
         var _loc9_:Object = calcDerivedStyles(_loc8_,_loc4_,_loc7_[0],_loc7_[1]);
         var _loc10_:Object = {
            "tl":0,
            "tr":0,
            "bl":0,
            "br":_loc5_
         };
         var _loc11_:Object = {
            "tl":0,
            "tr":0,
            "bl":0,
            "br":Math.max(_loc5_ - 1,0)
         };
         var _loc12_:Graphics;
         (_loc12_ = graphics).clear();
         switch(name)
         {
            case "downArrowUpSkin":
               _loc13_ = [_loc7_[0],_loc7_[1]];
               _loc14_ = [_loc6_[0],_loc6_[1]];
               drawRoundRect(0,0,param1,param2,_loc10_,[_loc9_.borderColorDrk2,_loc9_.borderColorDrk1],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":0,
                  "w":param1 - 2,
                  "h":param2 - 1,
                  "r":_loc11_
               });
               drawRoundRect(1,0,param1 - 2,param2 - 1,_loc11_,_loc13_,_loc14_,verticalGradientMatrix(1,1 - param2,param1 - 2,2 * param2 - 2));
               break;
            case "downArrowOverSkin":
               if(_loc7_.length > 2)
               {
                  _loc15_ = [_loc7_[2],_loc7_[3]];
               }
               else
               {
                  _loc15_ = [_loc7_[0],_loc7_[1]];
               }
               if(_loc6_.length > 2)
               {
                  _loc16_ = [_loc6_[2],_loc6_[3]];
               }
               else
               {
                  _loc16_ = [_loc6_[0],_loc6_[1]];
               }
               drawRoundRect(0,0,param1,param2,_loc10_,[_loc9_.themeColDrk2,_loc9_.themeColDrk1],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":0,
                  "w":param1 - 2,
                  "h":param2 - 1,
                  "r":_loc11_
               });
               drawRoundRect(1,0,param1 - 2,param2 - 1,_loc11_,_loc15_,_loc16_,verticalGradientMatrix(1,1 - param2,param1 - 2,2 * param2 - 2));
               break;
            case "downArrowDownSkin":
               drawRoundRect(0,0,param1,param2,_loc10_,[_loc9_.themeColDrk2,_loc9_.themeColDrk1],1,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,0,param1 - 2,param2 - 1,_loc11_,[_loc9_.fillColorPress1,_loc9_.fillColorPress2],1,verticalGradientMatrix(1,1 - param2,param1 - 2,2 * param2 - 2));
               break;
            case "downArrowDisabledSkin":
               _loc17_ = [_loc7_[0],_loc7_[1]];
               _loc18_ = [Math.max(0,_loc6_[0] - 0.15),Math.max(0,_loc6_[1] - 0.15)];
               drawRoundRect(0,0,param1,param2,_loc10_,[_loc9_.borderColorDrk2,_loc9_.borderColorDrk1],0.5,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":0,
                  "w":param1 - 2,
                  "h":param2 - 1,
                  "r":_loc11_
               });
               drawRoundRect(1,0,param1 - 2,param2 - 1,_loc11_,_loc17_,_loc18_,verticalGradientMatrix(1,1 - param2,param1 - 2,2 * param2 - 2));
               _loc3_ = getStyle("disabledIconColor");
         }
         _loc12_.beginFill(_loc3_);
         _loc12_.moveTo(param1 / 2,param2 / 2 + 1.5);
         _loc12_.lineTo(param1 / 2 - 3.5,param2 / 2 - 2.5);
         _loc12_.lineTo(param1 / 2 + 3.5,param2 / 2 - 2.5);
         _loc12_.lineTo(param1 / 2,param2 / 2 + 1.5);
         _loc12_.endFill();
      }
   }
}
