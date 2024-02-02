package com.mgb.controls
{
   import mx.controls.Label;
   
   public class AutoTruncatedLabel extends Label
   {
       
      
      public function AutoTruncatedLabel()
      {
         super();
      }
      
      override protected function measure() : void
      {
         super.measure();
         if(truncateToFit)
         {
            measuredMinWidth = 0;
            measuredWidth = NaN;
         }
      }
   }
}
