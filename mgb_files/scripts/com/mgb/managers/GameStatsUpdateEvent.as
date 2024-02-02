package com.mgb.managers
{
   import flash.events.Event;
   
   public class GameStatsUpdateEvent extends Event
   {
      
      public static const GAME_STATS_UPDATE:String = "gameStatsUpdate";
       
      
      public var gameStatResult:GameStatResult;
      
      public function GameStatsUpdateEvent(param1:String, param2:GameStatResult)
      {
         this.gameStatResult = param2;
         super(param1,false,false);
      }
   }
}
