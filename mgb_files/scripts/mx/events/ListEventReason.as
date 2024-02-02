package mx.events
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public final class ListEventReason
   {
      
      public static const OTHER:String = "other";
      
      public static const CANCELLED:String = "cancelled";
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      public static const NEW_ROW:String = "newRow";
       
      
      public function ListEventReason()
      {
         super();
      }
   }
}
