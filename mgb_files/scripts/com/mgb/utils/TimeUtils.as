package com.mgb.utils
{
   public class TimeUtils
   {
       
      
      public function TimeUtils()
      {
         super();
      }
      
      public static function rfc1123DateNow() : String
      {
         var _loc4_:String = null;
         var _loc1_:Array = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
         var _loc2_:Array = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
         var _loc3_:Date = new Date();
         return _loc1_[_loc3_.dayUTC] + ", " + padZeroes(_loc3_.dateUTC,2) + " " + _loc2_[_loc3_.monthUTC] + " " + padZeroes(_loc3_.fullYearUTC,4) + " " + padZeroes(_loc3_.hoursUTC,2) + ":" + padZeroes(_loc3_.minutesUTC,2) + ":" + padZeroes(_loc3_.secondsUTC,2) + " GMT";
      }
      
      private static function padZeroes(param1:Number, param2:int) : String
      {
         var _loc3_:String = param1.toString();
         while(_loc3_.length < param2)
         {
            _loc3_ = "0" + _loc3_;
         }
         return _loc3_;
      }
      
      public static function railsDatetimeToFlexDate(param1:String) : Date
      {
         var _loc2_:* = param1.slice(0,4) + "/" + param1.slice(5,7) + "/" + param1.slice(8,10) + " " + param1.slice(11,13) + ":" + param1.slice(14,16) + ":" + param1.slice(17,19) + " UTC";
         var _loc3_:Number = Date.parse(_loc2_);
         return new Date(_loc3_);
      }
      
      public static function humanTimeDateNow(param1:Boolean = false, param2:Boolean = false) : String
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc3_:Date = new Date();
         _loc4_ = padZeroes(_loc3_.hours,2) + ":" + padZeroes(_loc3_.minutes,2) + ":" + padZeroes(_loc3_.seconds,2) + " ";
         if(param1 == false)
         {
            _loc4_ += padZeroes(_loc3_.month + 1,2) + "/" + padZeroes(_loc3_.date,2) + "/" + padZeroes(_loc3_.fullYear,4);
         }
         if(param2)
         {
            _loc5_ = _loc3_.timezoneOffset / 60;
            _loc4_ += " (GMT" + (_loc5_ >= 0 ? "+" : "") + _loc5_ + ")";
         }
         return _loc4_;
      }
      
      public static function soapDateTimeNow() : String
      {
         var _loc2_:String = null;
         var _loc1_:Date = new Date();
         return padZeroes(_loc1_.fullYearUTC,4) + "-" + padZeroes(_loc1_.monthUTC + 1,2) + "-" + padZeroes(_loc1_.dateUTC,2) + "T" + padZeroes(_loc1_.hoursUTC,2) + ":" + padZeroes(_loc1_.minutesUTC,2) + ":" + padZeroes(_loc1_.secondsUTC,2) + "." + padZeroes(_loc1_.millisecondsUTC,3) + "Z";
      }
   }
}
