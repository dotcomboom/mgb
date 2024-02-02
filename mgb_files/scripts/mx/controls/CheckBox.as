package mx.controls
{
   import mx.core.FlexVersion;
   import mx.core.IToggleButton;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class CheckBox extends Button implements IToggleButton
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      mx_internal static var createAccessibilityImplementation:Function;
       
      
      public function CheckBox()
      {
         super();
         mx_internal::_toggle = true;
         mx_internal::centerContent = false;
         mx_internal::extraSpacing = 8;
      }
      
      override public function set toggle(param1:Boolean) : void
      {
      }
      
      override public function set emphasized(param1:Boolean) : void
      {
      }
      
      override protected function initializeAccessibility() : void
      {
         if(CheckBox.mx_internal::createAccessibilityImplementation != null)
         {
            CheckBox.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         super.measure();
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
         {
            _loc1_ = measureText(label).height;
            _loc2_ = !!mx_internal::currentIcon ? Number(mx_internal::currentIcon.height) : 0;
            _loc3_ = 0;
            if(labelPlacement == ButtonLabelPlacement.LEFT || labelPlacement == ButtonLabelPlacement.RIGHT)
            {
               _loc3_ = Math.max(_loc1_,_loc2_);
            }
            else
            {
               _loc3_ = _loc1_ + _loc2_;
               _loc4_ = getStyle("verticalGap");
               if(_loc2_ != 0 && !isNaN(_loc4_))
               {
                  _loc3_ += _loc4_;
               }
            }
            measuredMinHeight = measuredHeight = Math.max(_loc3_,18);
         }
      }
   }
}
