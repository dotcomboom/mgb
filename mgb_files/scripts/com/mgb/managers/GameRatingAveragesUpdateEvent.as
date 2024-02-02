package com.mgb.managers
{
   import flash.events.Event;
   
   public class GameRatingAveragesUpdateEvent extends Event
   {
      
      public static const GAME_RATING_UPDATE:String = "gameRatingsUpdate";
       
      
      public var game:String;
      
      public var gameplayCount:Number;
      
      public var gameplayRatingByAuthUser:Number;
      
      public var graphicsAverage:Number;
      
      public var graphicsCount:Number;
      
      public var username:String;
      
      public var gameplayAverage:Number;
      
      public var graphicsRatingByAuthUser:Number;
      
      public function GameRatingAveragesUpdateEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number)
      {
         this.username = param2;
         this.game = param3;
         this.graphicsRatingByAuthUser = param4;
         this.gameplayRatingByAuthUser = param5;
         this.graphicsAverage = param6;
         this.graphicsCount = param7;
         this.gameplayAverage = param8;
         this.gameplayCount = param9;
         super(param1,false,false);
      }
   }
}
