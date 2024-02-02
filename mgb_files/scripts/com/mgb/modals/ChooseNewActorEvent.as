package com.mgb.modals
{
   import flash.events.Event;
   
   public class ChooseNewActorEvent extends Event
   {
       
      
      public var actorTemplate:String;
      
      public function ChooseNewActorEvent(param1:String, param2:String = null)
      {
         this.actorTemplate = param2;
         super(param1,false,false);
      }
   }
}
