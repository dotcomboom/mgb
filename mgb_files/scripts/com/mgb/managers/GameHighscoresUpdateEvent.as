package com.mgb.managers
{
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   
   public class GameHighscoresUpdateEvent extends Event
   {
      
      public static const GAME_HIGHSCORES_UPDATE:String = "gameHighscoresUpdate";
       
      
      public var scores:ArrayCollection;
      
      public var game:String;
      
      public var scoreType:String;
      
      public var userName:String;
      
      public var project:String;
      
      public function GameHighscoresUpdateEvent(param1:String, param2:String, param3:String, param4:String, param5:String, param6:ArrayCollection)
      {
         this.scores = param6;
         this.userName = param2;
         this.project = param3;
         this.game = param4;
         this.scoreType = param5;
         super(param1,false,false);
      }
   }
}
