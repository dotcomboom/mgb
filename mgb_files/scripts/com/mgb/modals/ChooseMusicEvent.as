package com.mgb.modals
{
   import flash.events.Event;
   
   public class ChooseMusicEvent extends Event
   {
       
      
      public var activating:Boolean;
      
      public var originalMusicString:String;
      
      public var newMusicString:String;
      
      public var sourceX:int;
      
      public var sourceY:int;
      
      public function ChooseMusicEvent(param1:String, param2:String, param3:Boolean, param4:String, param5:int = -1, param6:int = -1)
      {
         this.newMusicString = param2;
         this.activating = param3;
         this.originalMusicString = param4;
         this.sourceX = param5;
         this.sourceY = param6;
         super(param1,false,false);
      }
      
      override public function clone() : Event
      {
         return new ChooseMusicEvent(type,newMusicString,activating,originalMusicString,sourceX,sourceY);
      }
   }
}
