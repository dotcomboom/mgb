package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class NumericStepperEvent extends Event
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      public static const CHANGE:String = "change";
       
      
      public var value:Number;
      
      public var triggerEvent:Event;
      
      public function NumericStepperEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Number = NaN, param5:Event = null)
      {
         super(param1,param2,param3);
         this.value = param4;
         this.triggerEvent = param5;
      }
      
      override public function clone() : Event
      {
         return new NumericStepperEvent(type,bubbles,cancelable,value);
      }
   }
}
