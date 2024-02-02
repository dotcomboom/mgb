package com.mgb.managers
{
   public class MgbMath
   {
       
      
      public function MgbMath()
      {
         super();
      }
      
      public static function bound(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 < param2 ? param2 : (param1 > param3 ? param3 : param1);
      }
   }
}
