package com.mgb.controls
{
   import flash.events.Event;
   
   public class GameEngineEvent extends Event
   {
      
      public static const LOADED:String = "gameLoaded";
      
      public static const COMPLETED:String = "gameCompleted";
      
      public static const LOADING:String = "gameLoading";
       
      
      public var completedScore:int;
      
      public var completedSeconds:int;
      
      public var userName:String;
      
      public var project:String;
      
      public var map:String;
      
      public var completedVictory:Boolean;
      
      public function GameEngineEvent(param1:String, param2:String, param3:String, param4:String, param5:Boolean = false, param6:int = 0, param7:int = 0)
      {
         this.userName = param2;
         this.project = param3;
         this.map = param4;
         this.completedVictory = param5;
         this.completedSeconds = param6;
         this.completedScore = param7;
         this.userName = param2;
         super(param1,false,false);
      }
      
      override public function clone() : Event
      {
         return new GameEngineEvent(type,userName,project,map,completedVictory,completedSeconds,completedScore);
      }
   }
}
