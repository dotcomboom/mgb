package com.mgb.managers
{
   import flash.events.EventDispatcher;
   import mx.collections.*;
   import mx.controls.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.AsyncToken;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.*;
   import mx.utils.*;
   
   public class GameStats extends EventDispatcher
   {
      
      public static const GAMETYPES_CONCEPT_VALUE:int = 0;
      
      public static const GAMESTATUS_READY_VALUE:int = 1;
      
      public static const GAMETYPES_GAME:String = "Playable Game";
      
      public static const GAMESTATUS_NOTREADY_VALUE:int = 0;
      
      public static const GAMETYPES_GAME_VALUE:int = 1;
      
      public static const GAMESTATUS_READY:String = "Ready to play";
      
      public static const GAMESTATUS_NOTREADY:String = "Still working on it";
      
      public static const GAMETYPES_CONCEPT:String = "Concept demo";
      
      public static const GAMETYPES_COMPETITIONENTRY:String = "Competition Entry";
      
      public static const HS_SPEED:String = "speed";
      
      public static const GAMETYPES_COMPETITIONENTRY_VALUE:int = 2;
      
      public static const HS_SCORE:String = "score";
       
      
      private var prior_gameTime_bump:Number = 0;
      
      private var _1769344611gameName:String;
      
      private var prior_UserGameName:String = null;
      
      public function GameStats()
      {
         super();
      }
      
      public static function makeGameName(param1:String, param2:String = null) : String
      {
         return param1 + (!!param2 ? "/" + param2 : "");
      }
      
      public static function makeProjectName(param1:String) : String
      {
         return param1.split("/")[0];
      }
      
      public static function makeMapName(param1:String) : String
      {
         return param1.split("/")[1];
      }
      
      private function gamestatsResultHandler(param1:ResultEvent) : void
      {
         var _loc2_:GameStatResult = new GameStatResult(param1.result.gamestat["user"],param1.result.gamestat["game"],param1.result.gamestat["plays-counter"],param1.result.gamestat["completions-counter"],param1.result.gamestat["rating_average_graphics"],param1.result.gamestat["rating_count_graphics"],param1.result.gamestat["rating_average_gameplay"],param1.result.gamestat["rating_count_gameplay"],param1.result.gamestat["gamestatus"],param1.result.gamestat["gametype"],param1.result.gamestat["gamegenre"],param1.result.gamestat["description"]);
         this.dispatchEvent(new GameStatsUpdateEvent(GameStatsUpdateEvent.GAME_STATS_UPDATE,_loc2_));
      }
      
      private function set gameName(param1:String) : void
      {
         var _loc2_:Object = this._1769344611gameName;
         if(_loc2_ !== param1)
         {
            this._1769344611gameName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameName",_loc2_,param1));
         }
      }
      
      private function signalRatingResultHandler(param1:ResultEvent) : void
      {
         trace("rating ok");
         var _loc2_:Array = String(param1.result.rating.game).split("/");
         getLatestRatings(param1.result.rating.user,_loc2_[0],_loc2_[1]);
      }
      
      private function gamestatsMessageFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Could not get/set gamestats. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      private function highScoresMessageFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Could not get/set high score. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      private function getRatingsResultHandler(param1:ResultEvent) : void
      {
         this.dispatchEvent(new GameRatingAveragesUpdateEvent(GameRatingAveragesUpdateEvent.GAME_RATING_UPDATE,param1.result.user,param1.result.game,param1.result.grme,param1.result.gpme,param1.result.graphics_average,param1.result.graphics_count,param1.result.gameplay_average,param1.result.gameplay_count));
      }
      
      public function signalHighScore(param1:String, param2:String, param3:String, param4:Boolean, param5:int, param6:int) : void
      {
         var _loc7_:HTTPService;
         (_loc7_ = new HTTPService()).url = MgbSystem.idServerUrl + "/user/flex_record_high_score";
         _loc7_.useProxy = false;
         _loc7_.method = "POST";
         _loc7_.addEventListener("result",signalHighScoresResultHandler);
         _loc7_.addEventListener("fault",highScoresMessageFaultHandler);
         _loc7_.contentType = "application/x-www-form-urlencoded";
         var _loc8_:Object;
         (_loc8_ = new Object()).username = param1;
         _loc8_.gamename = makeGameName(param2,param3);
         _loc8_.completed = param4 ? 1 : 0;
         _loc8_.finalscore = param5;
         _loc8_.elapsedtime = param6;
         _loc8_.playername = MgbSession.getInstance().authenticatedName;
         if(!_loc8_.playername)
         {
            _loc8_.playername = "?";
         }
         _loc7_.send(_loc8_);
      }
      
      private function signalHighScoresResultHandler(param1:ResultEvent) : void
      {
         var _loc2_:String = "";
         if(int(param1.result.scoreposition) != 0)
         {
            _loc2_ += "Position #" + String(param1.result.scoreposition) + " on the high score table";
         }
         if(int(param1.result.speedposition) != 0)
         {
            _loc2_ += (!!_loc2_ ? " and p" : "P") + "osition #" + String(param1.result.speedposition) + " on the fastest-finish table";
         }
         if(_loc2_)
         {
            Alert.show("You earned a place on the high score table.. " + _loc2_,"High Score!!!");
         }
         trace("Score position: " + int(param1.result.scoreposition));
         trace("Speed position: " + int(param1.result.speedposition));
      }
      
      private function signalRatingFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Could not get/set rating. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      public function getHighScores(param1:String, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:HTTPService;
         (_loc5_ = new HTTPService()).url = MgbSystem.idServerUrl + "/user/flex_get_highscores";
         _loc5_.useProxy = false;
         _loc5_.method = "POST";
         _loc5_.addEventListener("result",getHighScoresResultHandler);
         _loc5_.addEventListener("fault",highScoresMessageFaultHandler);
         _loc5_.contentType = "application/x-www-form-urlencoded";
         var _loc6_:Object;
         (_loc6_ = new Object()).username = param1;
         _loc6_.gamename = makeGameName(param2,param3);
         _loc6_.scoretype = param4;
         var _loc7_:AsyncToken;
         (_loc7_ = _loc5_.send(_loc6_)).hs_userName = param1;
         _loc7_.hs_project = param2;
         _loc7_.hs_game = param3;
         _loc7_.hs_scoreType = param4;
      }
      
      private function getHighScoresResultHandler(param1:ResultEvent) : void
      {
         var _loc3_:ArrayCollection = null;
         var _loc2_:AsyncToken = param1.token;
         if(param1.result.highscores != null)
         {
            if(param1.result.highscores.highscore is ObjectProxy)
            {
               _loc3_ = new ArrayCollection(new Array());
               _loc3_.addItem(param1.result.highscores.highscore);
            }
            else
            {
               _loc3_ = param1.result.highscores.highscore;
            }
         }
         this.dispatchEvent(new GameHighscoresUpdateEvent(GameHighscoresUpdateEvent.GAME_HIGHSCORES_UPDATE,_loc2_.hs_userName,_loc2_.hs_project,_loc2_.hs_game,_loc2_.hs_scoreType,_loc3_));
      }
      
      [Bindable(event="propertyChange")]
      private function get gameName() : String
      {
         return this._1769344611gameName;
      }
      
      public function getLatestStats(param1:String, param2:String, param3:String) : void
      {
         sendGameStatsMessage(param1,param2,param3);
      }
      
      public function signalRating(param1:String, param2:String, param3:String, param4:int, param5:int) : void
      {
         var _loc6_:HTTPService;
         (_loc6_ = new HTTPService()).url = MgbSystem.idServerUrl + "/user/flex_record_rating";
         _loc6_.useProxy = false;
         _loc6_.method = "POST";
         _loc6_.addEventListener("result",signalRatingResultHandler);
         _loc6_.addEventListener("fault",signalRatingFaultHandler);
         _loc6_.contentType = "application/x-www-form-urlencoded";
         var _loc7_:Object;
         (_loc7_ = new Object()).username = param1;
         _loc7_.gamename = makeGameName(param2,param3);
         _loc7_.graphicsrating = param4;
         _loc7_.gameplayrating = param5;
         _loc7_.ratername = MgbSession.getInstance().authenticatedName;
         if(!_loc7_.ratername && (param4 > 0 || param5 > 0))
         {
            Alert.show("You must sign in to rate");
         }
         else
         {
            _loc6_.send(_loc7_);
         }
      }
      
      public function signalGameStarted(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         if(param1 != MgbSession.getInstance().authenticatedName)
         {
            _loc4_ = param1 + "/" + makeGameName(param2,param3);
            _loc5_ = new Date().getTime();
            if(_loc4_ != prior_UserGameName || _loc5_ > prior_gameTime_bump + 30 * 1000)
            {
               prior_gameTime_bump = _loc5_;
               prior_UserGameName = _loc4_;
               sendGameStatsMessage(param1,param2,param3,1);
               trace("incrementing game play count for " + _loc4_);
            }
         }
      }
      
      private function sendGameStatsMessage(param1:String, param2:String, param3:String, param4:int = 0, param5:int = 0) : void
      {
         var _loc6_:HTTPService;
         (_loc6_ = new HTTPService()).url = MgbSystem.idServerUrl + "/user/flex_bump_play_counter";
         _loc6_.useProxy = false;
         _loc6_.method = "POST";
         _loc6_.addEventListener("result",gamestatsResultHandler);
         _loc6_.addEventListener("fault",gamestatsMessageFaultHandler);
         _loc6_.contentType = "application/x-www-form-urlencoded";
         var _loc7_:Object;
         (_loc7_ = new Object()).username = param1;
         _loc7_.gamename = makeGameName(param2,param3);
         _loc7_.bumpplayscount = param4;
         _loc7_.bumpcompletionscount = param5;
         _loc6_.send(_loc7_);
      }
      
      public function updateGameMetadata(param1:GameStatResult) : void
      {
         var _loc2_:HTTPService = new HTTPService();
         _loc2_.url = MgbSystem.idServerUrl + "/user/flex_update_game_metadata";
         _loc2_.useProxy = false;
         _loc2_.method = "POST";
         _loc2_.addEventListener("result",gamestatsResultHandler);
         _loc2_.addEventListener("fault",gamestatsMessageFaultHandler);
         _loc2_.contentType = "application/x-www-form-urlencoded";
         var _loc3_:Object = new Object();
         _loc3_.username = param1.username;
         _loc3_.gamename = param1.game;
         _loc3_.gamestatus = param1.gamestatus;
         _loc3_.gametype = param1.gametype;
         _loc3_.gamegenre = param1.gamegenre;
         _loc3_.description = param1.description;
         _loc2_.send(_loc3_);
      }
      
      private function getRatingsFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Could not get ratings. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      public function deleteGamestatusIfExists(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:HTTPService;
         (_loc4_ = new HTTPService()).url = MgbSystem.idServerUrl + "/user/flex_delete_gamestatus_if_exists";
         _loc4_.useProxy = false;
         _loc4_.method = "POST";
         _loc4_.addEventListener("result",gamestatsResultHandler);
         _loc4_.addEventListener("fault",gamestatsMessageFaultHandler);
         _loc4_.contentType = "application/x-www-form-urlencoded";
         var _loc5_:Object;
         (_loc5_ = new Object()).username = param1;
         _loc5_.gamename = makeGameName(param2,param3);
         _loc4_.send(_loc5_);
      }
      
      public function getLatestRatings(param1:String, param2:String, param3:String, param4:String = null) : void
      {
         var _loc5_:HTTPService;
         (_loc5_ = new HTTPService()).url = MgbSystem.idServerUrl + "/user/flex_get_ratings";
         _loc5_.useProxy = false;
         _loc5_.method = "POST";
         _loc5_.addEventListener("result",getRatingsResultHandler);
         _loc5_.addEventListener("fault",getRatingsFaultHandler);
         _loc5_.contentType = "application/x-www-form-urlencoded";
         var _loc6_:Object;
         (_loc6_ = new Object()).username = param1;
         _loc6_.gamename = makeGameName(param2,param3);
         _loc6_.ratername = !!param4 ? param4 : "";
         _loc5_.send(_loc6_);
      }
      
      public function signalGameWon(param1:String, param2:String, param3:String) : void
      {
         sendGameStatsMessage(param1,param2,param3,0,1);
      }
   }
}
