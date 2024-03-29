package mx.logging
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public final class LogEventLevel
   {
      
      public static const ALL:int = 0;
      
      public static const FATAL:int = 1000;
      
      public static const WARN:int = 6;
      
      public static const INFO:int = 4;
      
      public static const ERROR:int = 8;
      
      public static const DEBUG:int = 2;
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function LogEventLevel()
      {
         super();
      }
   }
}
