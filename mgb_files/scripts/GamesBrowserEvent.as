package
{
   import flash.events.Event;
   
   public class GamesBrowserEvent extends Event
   {
      
      public static const PLAY_GAME:String = "playGame";
       
      
      public var username:String;
      
      public var project:String;
      
      public var map:String;
      
      public function GamesBrowserEvent(param1:String, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         this.username = param2;
         this.project = param3;
         this.map = param4;
         super(param1,param5,param6);
      }
      
      override public function clone() : Event
      {
         return new GamesBrowserEvent(type,username,project,map,bubbles,cancelable);
      }
   }
}
