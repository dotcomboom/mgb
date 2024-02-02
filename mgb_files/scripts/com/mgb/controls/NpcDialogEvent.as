package com.mgb.controls
{
   import flash.events.Event;
   
   public class NpcDialogEvent extends Event
   {
      
      public static const choiceMade:String = "choiceMade";
       
      
      public var choice:int;
      
      public function NpcDialogEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         this.choice = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new NpcDialogEvent(type,choice,bubbles,cancelable);
      }
   }
}
