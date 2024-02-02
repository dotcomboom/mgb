package com.mgb.data
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class MgbFriendshipListsCache extends EventDispatcher
   {
       
      
      private var friendshipsListCache:Object;
      
      public function MgbFriendshipListsCache(param1:IEventDispatcher = null)
      {
         friendshipsListCache = new Object();
         super(param1);
      }
      
      private function constructKey(param1:String) : String
      {
         return "Key!!" + param1 + "!!";
      }
      
      public function flushAllFriendships() : void
      {
         friendshipsListCache = new Object();
      }
      
      public function getFriendships(param1:String, param2:Boolean = false) : MgbFriendshipsList
      {
         var _loc3_:String = String(constructKey(param1));
         if(!friendshipsListCache.hasOwnProperty(_loc3_))
         {
            friendshipsListCache[_loc3_] = new MgbFriendshipsList(param1);
            param2 = true;
         }
         if(param2)
         {
            MgbFriendshipsList(friendshipsListCache[_loc3_]).refresh();
         }
         return friendshipsListCache[_loc3_];
      }
   }
}
