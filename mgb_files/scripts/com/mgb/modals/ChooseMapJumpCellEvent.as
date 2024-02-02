package com.mgb.modals
{
   import flash.events.Event;
   
   public class ChooseMapJumpCellEvent extends Event
   {
       
      
      public var jumpToY:int;
      
      public var jumpToX:int;
      
      public function ChooseMapJumpCellEvent(param1:String, param2:int, param3:int)
      {
         this.jumpToX = param2;
         this.jumpToY = param3;
         super(param1,false,false);
      }
      
      override public function clone() : Event
      {
         return new ChooseMapJumpCellEvent(type,jumpToX,jumpToY);
      }
   }
}
