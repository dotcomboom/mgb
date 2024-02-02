package com.mgb.menuEvents
{
   import flash.events.Event;
   
   public class ViewConversationEvent extends Event
   {
      
      public static const VIEW_CONVERSATION:String = "viewConversation";
       
      
      public var conversationId:String;
      
      public function ViewConversationEvent(param1:String, param2:String, param3:Boolean = true, param4:Boolean = false)
      {
         this.conversationId = new String(param2);
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new ViewConversationEvent(type,conversationId,bubbles,cancelable);
      }
   }
}
