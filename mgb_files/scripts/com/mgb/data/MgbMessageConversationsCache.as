package com.mgb.data
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class MgbMessageConversationsCache extends EventDispatcher
   {
       
      
      private var conversationCache:Object;
      
      public function MgbMessageConversationsCache(param1:IEventDispatcher = null)
      {
         conversationCache = new Object();
         super(param1);
      }
      
      private function constructKey(param1:String, param2:String) : String
      {
         return "Key!!" + param1 + "!!" + param2;
      }
      
      public function getConversation(param1:String, param2:String, param3:Boolean = true) : MgbMessageConversation
      {
         var _loc4_:String = null;
         if(Boolean(param2) && param2 != "")
         {
            _loc4_ = String(constructKey(param1,param2));
            if(!conversationCache.hasOwnProperty(_loc4_))
            {
               conversationCache[_loc4_] = new MgbMessageConversation(param1,param2);
               if(param3)
               {
                  MgbMessageConversation(conversationCache[_loc4_]).refresh();
               }
            }
            return conversationCache[_loc4_];
         }
         return null;
      }
      
      public function markAllStale() : void
      {
         conversationCache = new Object();
      }
      
      public function addMessageToConversationCache(param1:String, param2:MgbMessage) : void
      {
         var _loc3_:MgbMessageConversation = getConversation(param1,param2.conversationId,false);
         _loc3_.addMessageToConversation(param2);
      }
   }
}
