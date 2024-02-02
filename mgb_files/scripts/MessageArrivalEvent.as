package
{
   import com.mgb.data.MgbMessage;
   import flash.events.Event;
   
   public class MessageArrivalEvent extends Event
   {
      
      public static const LOADED:String = "messageLoaded";
       
      
      public var msg:MgbMessage;
      
      public function MessageArrivalEvent(param1:String, param2:MgbMessage)
      {
         super(param1,false,false);
         this.msg = param2;
      }
      
      override public function clone() : Event
      {
         return new MessageArrivalEvent(type,msg);
      }
   }
}
