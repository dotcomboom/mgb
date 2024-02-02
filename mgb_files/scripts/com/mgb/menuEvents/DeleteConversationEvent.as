package com.mgb.menuEvents
{
   import flash.events.Event;
   
   public class DeleteConversationEvent extends Event
   {
      
      public static const DELETE_CONVERSATION:String = "deleteConversation";
       
      
      public var conversationId:String;
      
      public function DeleteConversationEvent(param1:String, param2:String, param3:Boolean = true, param4:Boolean = false)
      {
         this.conversationId = new String(param2);
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new DeleteConversationEvent(type,conversationId,bubbles,cancelable);
      }
   }
}
