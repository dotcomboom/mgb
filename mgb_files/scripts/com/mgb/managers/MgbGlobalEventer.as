package com.mgb.managers
{
   import flash.events.EventDispatcher;
   
   public class MgbGlobalEventer extends EventDispatcher
   {
      
      private static var _instance:MgbGlobalEventer;
       
      
      public function MgbGlobalEventer(param1:MgbGlobalEventerSingletonEnforcer)
      {
         super();
         if(null == param1)
         {
            throw new Error("Assertion failure - multiple instantiations of MgbGlobalEventer singleton");
         }
      }
      
      public static function getInstance() : MgbGlobalEventer
      {
         if(MgbGlobalEventer._instance == null)
         {
            MgbGlobalEventer._instance = new MgbGlobalEventer(new MgbGlobalEventerSingletonEnforcer());
         }
         return MgbGlobalEventer._instance;
      }
   }
}

class MgbGlobalEventerSingletonEnforcer
{
    
   
   public function MgbGlobalEventerSingletonEnforcer()
   {
      super();
   }
}
