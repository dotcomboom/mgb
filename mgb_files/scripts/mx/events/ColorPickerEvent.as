package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class ColorPickerEvent extends Event
   {
      
      public static const ITEM_ROLL_OVER:String = "itemRollOver";
      
      public static const CHANGE:String = "change";
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      public static const ITEM_ROLL_OUT:String = "itemRollOut";
      
      public static const ENTER:String = "enter";
       
      
      public var index:int;
      
      public var color:uint;
      
      public function ColorPickerEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:uint = 4294967295)
      {
         super(param1,param2,param3);
         this.index = param4;
         this.color = param5;
      }
      
      override public function clone() : Event
      {
         return new ColorPickerEvent(type,bubbles,cancelable,index,color);
      }
   }
}
