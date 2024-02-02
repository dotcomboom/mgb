package com.mgb.modals
{
   import flash.events.Event;
   
   public class ChooseMapJumpEvent extends Event
   {
       
      
      public var activating:Boolean;
      
      public var sourceY:int;
      
      public var newJumpString:String;
      
      public var originalJumpString:String;
      
      public var sourceX:int;
      
      public function ChooseMapJumpEvent(param1:String, param2:String, param3:Boolean, param4:String, param5:int = -1, param6:int = -1)
      {
         this.newJumpString = param2;
         this.activating = param3;
         this.originalJumpString = param4;
         this.sourceX = param5;
         this.sourceY = param6;
         super(param1,false,false);
      }
      
      override public function clone() : Event
      {
         return new ChooseMapJumpEvent(type,newJumpString,activating,originalJumpString,sourceX,sourceY);
      }
   }
}
