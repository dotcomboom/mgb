package korax.controls.ColorPicker
{
   import flash.events.Event;
   
   public class ColorPickerEvent extends Event
   {
      
      public static const EVENT_COLOR_CHANGE:String = "change";
       
      
      public var color:uint;
      
      public function ColorPickerEvent(param1:String, param2:uint)
      {
         this.color = param2;
         super(param1,false,false);
      }
   }
}
