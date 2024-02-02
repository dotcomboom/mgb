package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class DateChooserEvent extends Event
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      public static const SCROLL:String = "scroll";
       
      
      public var detail:String;
      
      public var triggerEvent:Event;
      
      public function DateChooserEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:Event = null)
      {
         super(param1,param2,param3);
         this.detail = param4;
         this.triggerEvent = param5;
      }
      
      override public function clone() : Event
      {
         return new DateChooserEvent(type,bubbles,cancelable,detail,triggerEvent);
      }
   }
}
