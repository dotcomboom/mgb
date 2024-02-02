package mx.skins.halo
{
   import flash.display.GradientType;
   import mx.core.EdgeMetrics;
   import mx.core.FlexVersion;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   use namespace mx_internal;
   
   public class AccordionHeaderSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var cache:Object = {};
       
      
      private var _borderMetrics:EdgeMetrics;
      
      public function AccordionHeaderSkin()
      {
         _borderMetrics = new EdgeMetrics(1,1,1,1);
         super();
      }
      
      private static function calcDerivedStyles(param1:uint, param2:uint, param3:uint, param4:uint, param5:uint, param6:uint) : Object
      {
         var _loc8_:Object = null;
         var _loc7_:String = HaloColors.getCacheKey(param1,param2,param3,param4,param5,param6);
         if(!cache[_loc7_])
         {
            _loc8_ = cache[_loc7_] = {};
            HaloColors.addHaloColors(_loc8_,param1,param5,param6);
         }
         return cache[_loc7_];
      }
      
      override public function get measuredWidth() : Number
      {
         return 10;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         super.updateDisplayList(param1,param2);
         var _loc3_:uint = getStyle("borderColor");
         var _loc4_:Array = getStyle("fillAlphas");
         var _loc5_:Array = getStyle("fillColors");
         StyleManager.getColorNames(_loc5_);
         var _loc6_:Array = getStyle("highlightAlphas");
         var _loc7_:Array = getStyle("selectedFillColors");
         var _loc8_:uint = getStyle("themeColor");
         var _loc9_:Array;
         (_loc9_ = [])[0] = ColorUtil.adjustBrightness2(_loc5_[0],-8);
         _loc9_[1] = ColorUtil.adjustBrightness2(_loc5_[1],-10);
         var _loc10_:Number = ColorUtil.adjustBrightness2(_loc3_,-15);
         var _loc11_:Number = ColorUtil.adjustBrightness2(_loc5_[0],-4);
         var _loc12_:Number = ColorUtil.adjustBrightness2(_loc5_[1],-6);
         if(!_loc7_)
         {
            (_loc7_ = [])[0] = ColorUtil.adjustBrightness2(_loc5_[0],5);
            _loc7_[1] = ColorUtil.adjustBrightness2(_loc5_[1],15);
         }
         var _loc13_:Object = calcDerivedStyles(_loc8_,_loc3_,_loc9_[0],_loc9_[1],_loc5_[0],_loc5_[1]);
         graphics.clear();
         switch(name)
         {
            case "upSkin":
            case "disabledSkin":
            case "selectedDisabledSkin":
               _loc14_ = [_loc9_[0],_loc9_[1]];
               _loc15_ = [_loc4_[0],_loc4_[1]];
               drawRoundRect(0,0,param1,param2,0,[_loc3_,_loc10_],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,_loc14_,_loc15_,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,0,[16777215,16777215],_loc6_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               drawRoundRect(1,param2 - 2,param1 - 2,1,0,_loc3_,0.1);
               break;
            case "overSkin":
               if(_loc5_.length > 2)
               {
                  _loc16_ = [ColorUtil.adjustBrightness2(_loc5_[2],-4),ColorUtil.adjustBrightness2(_loc5_[3],-6)];
               }
               else
               {
                  _loc16_ = [_loc11_,_loc12_];
               }
               if(_loc4_.length > 2)
               {
                  _loc17_ = [_loc4_[2],_loc4_[3]];
               }
               else
               {
                  _loc17_ = [_loc4_[0],_loc4_[1]];
               }
               drawRoundRect(0,0,param1,param2,0,[_loc8_,_loc13_.themeColDrk1],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,_loc16_,_loc17_,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,0,[16777215,16777215],_loc6_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               drawRoundRect(1,param2 - 2,param1 - 2,1,0,_loc3_,0.1);
               break;
            case "downSkin":
               drawRoundRect(0,0,param1,param2,0,[_loc8_,_loc13_.themeColDrk1],1,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,[_loc13_.fillColorPress1,_loc13_.fillColorPress2],1,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,0,[16777215,16777215],_loc6_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               break;
            case "selectedUpSkin":
            case "selectedOverSkin":
            case "selectedDownSkin":
               _loc18_ = [_loc4_[0],_loc4_[1]];
               drawRoundRect(0,0,param1,param2,0,[_loc3_,_loc10_],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,[_loc7_[0],_loc7_[1]],_loc18_,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,0,[16777215,16777215],_loc6_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               drawRoundRect(1,param2 - 2,param1 - 2,1,0,_loc3_,0.05);
         }
      }
      
      override public function get measuredHeight() : Number
      {
         return 22;
      }
      
      override public function get borderMetrics() : EdgeMetrics
      {
         return FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0 ? _borderMetrics : super.borderMetrics;
      }
   }
}
