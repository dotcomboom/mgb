package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.collections.IList;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class SwatchSkin extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      mx_internal var color:uint = 0;
      
      mx_internal var colorField:String = "color";
      
      public function SwatchSkin()
      {
         super();
      }
      
      private function drawSwatch(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:uint = getStyle("swatchBorderColor");
         var _loc7_:Number;
         if((_loc7_ = getStyle("swatchBorderSize")) == 0)
         {
            drawFill(param1,param2,param3,param4,param5,1);
         }
         else if(_loc7_ < 0 || isNaN(_loc7_))
         {
            drawFill(param1,param2,param3,param4,_loc6_,1);
            drawFill(param1 + 1,param2 + 1,param3 - 2,param4 - 2,param5,1);
         }
         else
         {
            drawFill(param1,param2,param3,param4,_loc6_,1);
            drawFill(param1 + _loc7_,param2 + _loc7_,param3 - 2 * _loc7_,param4 - 2 * _loc7_,param5,1);
         }
      }
      
      mx_internal function updateGrid(param1:IList) : void
      {
         if(name == "swatchGrid")
         {
            graphics.clear();
            drawGrid(param1,mx_internal::colorField);
         }
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
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         mx_internal::updateSkin(mx_internal::color);
      }
      
      private function drawBorder(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         drawFill(param1,param2,param7,param4,param5,param8);
         drawFill(param1,param2,param3,param7,param5,param8);
         drawFill(param1 + (param3 - param7),param2,param7,param4,param6,param8);
         drawFill(param1,param2 + (param4 - param7),param3,param7,param6,param8);
      }
      
      private function drawGrid(param1:IList, param2:String) : void
      {
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc3_:int = getStyle("columnCount");
         var _loc4_:Number = getStyle("horizontalGap");
         var _loc5_:Number = getStyle("previewWidth");
         var _loc6_:uint = getStyle("swatchGridBackgroundColor");
         var _loc7_:Number = getStyle("swatchGridBorderSize");
         var _loc8_:Number = getStyle("swatchHeight");
         var _loc9_:Number = getStyle("swatchWidth");
         var _loc10_:Number = getStyle("textFieldWidth");
         var _loc11_:Number = getStyle("verticalGap");
         var _loc12_:int = 1;
         var _loc13_:int = 3;
         var _loc14_:int = param1.length;
         if(_loc3_ > _loc14_)
         {
            _loc3_ = _loc14_;
         }
         var _loc15_:Number = Math.ceil(_loc14_ / _loc3_);
         if(isNaN(_loc15_))
         {
            _loc15_ = 0;
         }
         var _loc16_:Number = _loc3_ * (_loc9_ - _loc12_) + _loc12_ + (_loc3_ - 1) * _loc4_ + 2 * _loc7_;
         var _loc17_:Number = _loc15_ * (_loc8_ - _loc12_) + _loc12_ + (_loc15_ - 1) * _loc11_ + 2 * _loc7_;
         var _loc18_:Number = _loc5_ + _loc10_ + _loc13_;
         if(_loc16_ < _loc18_)
         {
            _loc16_ = _loc18_;
         }
         drawFill(0,0,_loc16_,_loc17_,_loc6_,100);
         setActualSize(_loc16_,_loc17_);
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         while(_loc21_ < _loc14_)
         {
            _loc22_ = _loc7_ + _loc19_ * (_loc9_ + _loc4_ - _loc12_);
            _loc23_ = _loc7_ + _loc20_ * (_loc8_ + _loc11_ - _loc12_);
            _loc24_ = typeof param1.getItemAt(_loc21_) != "object" ? Number(param1.getItemAt(_loc21_)) : Number(param1.getItemAt(_loc21_)[mx_internal::colorField]);
            drawSwatch(_loc22_,_loc23_,_loc9_,_loc8_,_loc24_);
            if(_loc19_ < _loc3_ - 1)
            {
               _loc19_++;
            }
            else
            {
               _loc19_ = 0;
               _loc20_++;
            }
            _loc21_++;
         }
      }
      
      mx_internal function updateSkin(param1:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:uint = 0;
         var _loc10_:Number = NaN;
         var _loc2_:Graphics = graphics;
         switch(name)
         {
            case "colorPickerSwatch":
               _loc3_ = UIComponent(parent).width / Math.abs(UIComponent(parent).scaleX);
               _loc4_ = UIComponent(parent).height / Math.abs(UIComponent(parent).scaleY);
               _loc2_.clear();
               drawSwatch(0,0,_loc3_,_loc4_,param1);
               break;
            case "swatchPreview":
               _loc5_ = getStyle("previewWidth");
               _loc6_ = getStyle("previewHeight");
               _loc2_.clear();
               drawSwatch(0,0,_loc5_,_loc6_,param1);
               drawBorder(0,0,_loc5_,_loc6_,10066329,16777215,1,1);
               break;
            case "swatchHighlight":
               _loc7_ = getStyle("swatchWidth");
               _loc8_ = getStyle("swatchHeight");
               _loc9_ = getStyle("swatchHighlightColor");
               _loc10_ = getStyle("swatchHighlightSize");
               _loc2_.clear();
               drawBorder(0,0,_loc7_,_loc8_,_loc9_,_loc9_,_loc10_,1);
         }
      }
   }
}
