package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class CalendarLayoutChangeEvent extends Event
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      public static const CHANGE:String = "change";
       
      
      public var triggerEvent:Event;
      
      public var newDate:Date;
      
      public function CalendarLayoutChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Date = null, param5:Event = null)
      {
         super(param1,param2,param3);
         this.newDate = param4;
         this.triggerEvent = param5;
      }
      
      override public function clone() : Event
      {
         return new CalendarLayoutChangeEvent(type,bubbles,cancelable,newDate,triggerEvent);
      }
   }
}
