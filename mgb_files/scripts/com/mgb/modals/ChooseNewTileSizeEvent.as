package com.mgb.modals
{
   import flash.events.Event;
   
   public class ChooseNewTileSizeEvent extends Event
   {
       
      
      public var width:int;
      
      public var height:int;
      
      public function ChooseNewTileSizeEvent(param1:String, param2:int = 0, param3:int = 0)
      {
         this.width = param2;
         this.height = param3;
         super(param1,false,false);
      }
   }
}
