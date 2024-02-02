package com.mgb.data
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class MgbWallsCache extends EventDispatcher
   {
       
      
      private var wallsCache:Object;
      
      public function MgbWallsCache(param1:IEventDispatcher = null)
      {
         wallsCache = new Object();
         super(param1);
      }
      
      public function getWall(param1:String, param2:Boolean = false) : MgbWall
      {
         var _loc3_:String = String(constructKey(param1));
         if(!wallsCache.hasOwnProperty(_loc3_))
         {
            wallsCache[_loc3_] = new MgbWall(param1);
            param2 = true;
         }
         if(param2)
         {
            MgbWall(wallsCache[_loc3_]).refresh();
         }
         return wallsCache[_loc3_];
      }
      
      public function flushWalls() : void
      {
         wallsCache = new Object();
      }
      
      private function constructKey(param1:String) : String
      {
         return "Key!!" + param1 + "!!";
      }
   }
}
