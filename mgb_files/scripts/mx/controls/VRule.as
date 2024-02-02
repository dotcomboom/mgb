package mx.controls
{
   import flash.display.Graphics;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class VRule extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static const DEFAULT_PREFERRED_HEIGHT:Number = 100;
       
      
      public function VRule()
      {
         super();
      }
      
      override protected function measure() : void
      {
         super.measure();
         measuredWidth = getStyle("strokeWidth");
         measuredHeight = DEFAULT_PREFERRED_HEIGHT;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         var _loc4_:Number = getStyle("strokeColor");
         var _loc5_:Number = getStyle("shadowColor");
         var _loc6_:Number;
         if((_loc6_ = getStyle("strokeWidth")) > param1)
         {
            _loc6_ = param1;
         }
         var _loc7_:Number = (param1 - _loc6_) / 2;
         var _loc8_:Number = 0;
         var _loc9_:Number = _loc7_ + _loc6_;
         var _loc10_:Number = param2;
         if(_loc6_ == 1)
         {
            _loc3_.beginFill(_loc4_);
            _loc3_.drawRect(_loc7_,_loc8_,_loc9_ - _loc7_,param2);
            _loc3_.endFill();
         }
         else if(_loc6_ == 2)
         {
            _loc3_.beginFill(_loc4_);
            _loc3_.drawRect(_loc7_,_loc8_,1,param2);
            _loc3_.endFill();
            _loc3_.beginFill(_loc5_);
            _loc3_.drawRect(_loc9_ - 1,_loc8_,1,param2);
            _loc3_.endFill();
         }
         else if(_loc6_ > 2)
         {
            _loc3_.beginFill(_loc4_);
            _loc3_.drawRect(_loc7_,_loc8_,_loc9_ - _loc7_ - 1,1);
            _loc3_.endFill();
            _loc3_.beginFill(_loc5_);
            _loc3_.drawRect(_loc9_ - 1,_loc8_,1,param2 - 1);
            _loc3_.drawRect(_loc7_,_loc10_ - 1,_loc9_ - _loc7_,1);
            _loc3_.endFill();
            _loc3_.beginFill(_loc4_);
            _loc3_.drawRect(_loc7_,_loc8_ + 1,1,param2 - 2);
            _loc3_.endFill();
         }
      }
   }
}
