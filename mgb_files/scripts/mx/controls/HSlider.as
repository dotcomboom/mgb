package mx.controls
{
   import mx.controls.sliderClasses.Slider;
   import mx.controls.sliderClasses.SliderDirection;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class HSlider extends Slider
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function HSlider()
      {
         super();
         direction = SliderDirection.HORIZONTAL;
      }
   }
}
