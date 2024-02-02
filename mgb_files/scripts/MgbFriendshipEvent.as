package
{
   import flash.events.Event;
   
   public class MgbFriendshipEvent extends Event
   {
      
      public static const FRIENDSHIP_ESTABLISHED:String = "friendshipEstablished";
       
      
      public var username:String;
      
      public var friendname:String;
      
      public var conversationId:String;
      
      public function MgbFriendshipEvent(param1:String, param2:String, param3:String, param4:String)
      {
         super(param1,false,false);
         this.username = param2;
         this.friendname = param3;
         this.conversationId = param4;
      }
      
      override public function clone() : Event
      {
         return new MgbFriendshipEvent(type,username,friendname,conversationId);
      }
   }
}
