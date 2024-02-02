package com.mgb.controls
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import mx.controls.*;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.printing.*;
   
   public class GameEngineTwo extends UIComponent
   {
      
      private static var transitionPlayerAA:ActiveActor;
      
      private static var transitionInProgress:Boolean = false;
      
      private static var transitionNewX:int;
      
      private static var transitionNewY:int;
      
      private static var transitionStateWaitingForActorLoadRequests:Boolean = false;
       
      
      protected var _1217010542mgbSession:MgbSession;
      
      private var G_player_action_push:Boolean = false;
      
      private var gameStatusString2Timer:Timer;
      
      private var respawnMemoryAutoRespawningActorsCurrentIndex:int = 1;
      
      private var backgroundMusicSoundChannel:SoundChannel;
      
      private var _2089343645backgroundMusicCurrentSource:String;
      
      private var respawnMemory:Array;
      
      private var _534323729showGridFlag:Boolean = true;
      
      private var redrawEventsSet:Boolean = false;
      
      protected var resizeRemove:Boolean = false;
      
      private var G_tweenCount:int = 0;
      
      private var G_player_action_up:Boolean = false;
      
      private var deferredAsk_aa:ActiveActor = null;
      
      protected const maxZoomLevel:Number = 2;
      
      private var _291707031gameEngineMode:String;
      
      private var deferredAsk_ap:MgbActor = null;
      
      private var _1729080547gameStatusString2:String = "";
      
      protected var resizeColumns:Boolean = false;
      
      protected var actorCache:PieceCache;
      
      private var G_tic:Array = null;
      
      private var backgroundBlockageMap:BlockageMap;
      
      protected var view:MgbBlitter;
      
      protected var resizeRows:Boolean = false;
      
      private var G_tweensPerTurn:int = 4;
      
      private var G_player_action_melee:Boolean = false;
      
      private var G_xMovePerTween:int = 0;
      
      private var _1947491223backgroundMusicStatus:String = null;
      
      private var _1718344779gameStatusString:String = "Please load a game";
      
      protected var mapPiece:MgbMap;
      
      private var pauseGame:Boolean = false;
      
      protected var actorLoadsPending:int = 0;
      
      private var _1548633310G_gameOver:Boolean = true;
      
      private var G_player_action_left:Boolean = false;
      
      private var _1810526780inventoryDialog:InventoryDialog = null;
      
      private var G_HSPdelta:int = 0;
      
      private var G_player_action_jump:Boolean = false;
      
      private var needToRedrawMap:Boolean = false;
      
      private var respawnMemoryAutoRespawningActors:Array;
      
      protected const minZoomLevel:Number = 0.5;
      
      protected var resizeAdd:Boolean = false;
      
      private var inventory:Inventory = null;
      
      private var G_VSPdelta:int = 0;
      
      private var G_yMovePerTween:int = 0;
      
      private var G_tweenSinceMapStarted:int = 0;
      
      private var _1634857841zoomLevel:Number = 1;
      
      protected var tileCache:PieceCache;
      
      private var initialMap:MgbMap = null;
      
      private var G_player_action_right:Boolean = false;
      
      private var G_player_action_shoot:Boolean = false;
      
      protected var resizeDirectionHintOffset:int = 0;
      
      protected var layerAlphas:Array;
      
      private var npcDialog:NpcDialog = null;
      
      protected var resizeFromX:int = -1;
      
      protected var resizeFromY:int = -1;
      
      private var G_player_action_down:Boolean = false;
      
      protected var actorLoadsFailed:int = 0;
      
      private var backgroundMusicSound:Sound;
      
      private var activeActors:Array;
      
      private var AA_player_idx:int = 0;
      
      private var G_player_action_shift:Boolean = false;
      
      private var npcDialogActor:ActiveActor = null;
      
      private var G_gameStartedAtMS:Number;
      
      public function GameEngineTwo()
      {
         mapPiece = new MgbMap();
         _1217010542mgbSession = MgbSession.getInstance();
         layerAlphas = new Array();
         backgroundBlockageMap = new BlockageMap();
         actorCache = MgbCaches.getInstance().actorCache;
         tileCache = MgbCaches.getInstance().tileCache;
         respawnMemory = new Array();
         activeActors = new Array();
         respawnMemoryAutoRespawningActors = new Array();
         trace("GE2 constructor");
         super();
         gameEngineMode = GameEngine.GE_EDIT;
         newMap();
         triggerPlayMode();
         var _loc1_:int = 0;
         while(_loc1_ < MgbMap.layerGameCount)
         {
            layerAlphas[_loc1_] = Number(1);
            _loc1_++;
         }
         MgbGlobalEventer.getInstance().addEventListener(PieceChangedEvent.CHANGE,processPieceChange);
      }
      
      public function set showGridFlag(param1:Boolean) : void
      {
         var _loc2_:Object = this._534323729showGridFlag;
         if(_loc2_ !== param1)
         {
            this._534323729showGridFlag = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showGridFlag",_loc2_,param1));
         }
      }
      
      protected function actorTileBitMapData(param1:String, param2:String = null) : BitmapData
      {
         var _loc4_:MgbActor = null;
         var _loc3_:MgbTile = null;
         if(param1 != null)
         {
            if((_loc4_ = MgbActor(actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,param1))) != null)
            {
               _loc3_ = MgbTile(tileCache.getPieceIfCached(_loc4_.userName,_loc4_.projectName,_loc4_.tilename));
            }
            else
            {
               loadActorByName(param1);
            }
         }
         return _loc3_ == null ? null : _loc3_.bitmapDataVariant(param2);
      }
      
      private function getAnimationEffectFromIndex(param1:MgbActor, param2:int) : String
      {
         return param2 == -1 ? "no effect" : String(param1.animationTable[param2].effect);
      }
      
      public function scrollMapToSeePlayer(param1:int = -1, param2:int = -1) : void
      {
         var _loc6_:Container = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc3_:int = 5;
         var _loc4_:int = param1 == -1 ? int(activeActors[AA_player_idx].x) : param1;
         var _loc5_:int = param2 == -1 ? int(activeActors[AA_player_idx].y) : param2;
         if(parent is Container)
         {
            G_HSPdelta = 0;
            G_VSPdelta = 0;
            _loc6_ = Container(parent);
            _loc7_ = width - _loc6_.maxHorizontalScrollPosition;
            _loc8_ = height - _loc6_.maxVerticalScrollPosition;
            _loc9_ = (_loc4_ - _loc3_) * MgbSystem.tileMinWidth;
            _loc10_ = (_loc5_ - _loc3_) * MgbSystem.tileMinWidth;
            if(_loc6_.horizontalScrollPosition > _loc9_)
            {
               G_HSPdelta = (_loc9_ - _loc6_.horizontalScrollPosition) / G_tweensPerTurn;
            }
            if(_loc6_.verticalScrollPosition > _loc10_)
            {
               G_VSPdelta = (_loc10_ - _loc6_.verticalScrollPosition) / G_tweensPerTurn;
            }
            _loc11_ = (_loc4_ + 1 + _loc3_) * MgbSystem.tileMinWidth - _loc7_;
            _loc12_ = (_loc5_ + 1 + _loc3_) * MgbSystem.tileMinHeight - _loc8_;
            if(_loc11_ > 0 && _loc6_.horizontalScrollPosition < _loc11_)
            {
               G_HSPdelta = (_loc11_ - _loc6_.horizontalScrollPosition) / G_tweensPerTurn;
            }
            if(_loc12_ > 0 && _loc6_.verticalScrollPosition < _loc12_)
            {
               G_VSPdelta = (_loc12_ - _loc6_.verticalScrollPosition) / G_tweensPerTurn;
            }
         }
      }
      
      private function getAnimationTileFromIndex(param1:MgbActor, param2:int) : String
      {
         var _loc3_:String = null;
         if(param2 == -1)
         {
            _loc3_ = param1.tilename;
         }
         else
         {
            _loc3_ = String(param1.animationTable[param2].tilename);
            if(_loc3_ == null || _loc3_ == "")
            {
               _loc3_ = param1.tilename;
            }
         }
         return !!_loc3_ ? _loc3_ : "";
      }
      
      private function destroyShot(param1:ActiveActor) : void
      {
         if(!param1.alive || !param1.isAShot)
         {
            MgbLogger.getInstance().logBug("destroyShot called on an actor which is not a shot");
         }
         param1.alive = false;
         param1.dyingAnimationFrameCount = 0;
         param1.renderBD = null;
         if(param1.actorWhoFiredShot != -1)
         {
            --activeActors[param1.actorWhoFiredShot].currentActiveShots;
         }
      }
      
      private function sortOnChoice(param1:ActorCollision, param2:ActorCollision) : Number
      {
         var _loc3_:int = param1.AA1 * activeActors.length + param1.AA2;
         var _loc4_:int = param2.AA1 * activeActors.length + param2.AA2;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      public function get initialMapName() : String
      {
         return !!initialMap ? String(initialMap.name) : mapPiece.name;
      }
      
      private function preloadResourcesNeededForMap() : void
      {
         actorLoadsPending = 0;
         preloadThisMap();
         transitionStateWaitingForActorLoadRequests = false;
      }
      
      private function timeToDrawMap(param1:Event = null) : void
      {
         if(needToRedrawMap)
         {
            redrawMap();
         }
         needToRedrawMap = false;
      }
      
      private function markSpawnedActorForAutoRespawn(param1:String, param2:String, param3:int, param4:int) : String
      {
         if(null == respawnMemoryAutoRespawningActors[param1])
         {
            respawnMemoryAutoRespawningActors[param1] = new Array();
         }
         var _loc5_:Array = respawnMemoryAutoRespawningActors[param1];
         var _loc6_:int = int(respawnMemoryAutoRespawningActorsCurrentIndex);
         ++respawnMemoryAutoRespawningActorsCurrentIndex;
         var _loc7_:String = String(_loc6_);
         _loc5_[_loc6_] = {
            "actorname":param2,
            "x":param3,
            "y":param4
         };
         return _loc7_;
      }
      
      private function hideInventory() : void
      {
         if(inventoryDialog)
         {
            inventoryDialog.visible = false;
         }
         pauseGame = false;
      }
      
      private function calculateNewPlayerPosition(param1:int) : void
      {
         var _loc2_:ActiveActor = activeActors[AA_player_idx];
         if(G_player_action_melee)
         {
            startMeleeIfAllowed(_loc2_,true);
         }
         if(!_loc2_.inMelee())
         {
            if(Boolean(G_player_action_shoot) && Boolean(actorCanShoot(AA_player_idx)))
            {
               actorCreateShot(AA_player_idx);
               G_player_action_shoot = false;
            }
            if((param1 == 0 || param1 == -1 && Boolean(G_player_action_up)) && _loc2_.y < mapPiece.height)
            {
               --_loc2_.y;
               _loc2_.stepStyle = 0;
            }
            if((param1 == 2 || param1 == -1 && Boolean(G_player_action_down)) && _loc2_.y >= 0)
            {
               ++_loc2_.y;
               _loc2_.stepStyle = 2;
            }
            if((param1 == 3 || param1 == -1 && Boolean(G_player_action_left)) && _loc2_.x >= 0)
            {
               --_loc2_.x;
               _loc2_.stepStyle = 3;
            }
            if((param1 == 1 || param1 == -1 && Boolean(G_player_action_right)) && _loc2_.x < mapPiece.width)
            {
               ++_loc2_.x;
               _loc2_.stepStyle = 1;
            }
         }
      }
      
      private function resizeEvent(param1:ResizeEvent) : void
      {
         fixDialogSizes();
         pleaseRedrawMapSoon();
      }
      
      private function processPieceChange(param1:PieceChangedEvent) : void
      {
         var event:PieceChangedEvent = param1;
         try
         {
            if((event.pieceType == Piece.MGB_MAP || event.pieceType == Piece.MGB_ACTOR) && event.wasPieceSavedOrDeleted())
            {
               stopGameIfPlaying();
            }
            this.pleaseRedrawMapSoon();
         }
         catch(err:Error)
         {
            MgbLogger.getInstance().logException("processPieceChange()",err);
         }
      }
      
      public function loadMapResult(param1:Event) : void
      {
         tagCheck("load_complete");
         setGameStatusString("Loading game...");
         dispatchEvent(new GameEngineEvent(GameEngineEvent.LOADING,mapPiece.userName,mapPiece.projectName,mapPiece.name));
         preloadThisMap();
         prepareMapEditResoures();
         scrollMapToSeePlayer(0,0);
      }
      
      private function nextPoint(param1:int, param2:int, param3:int, param4:int, param5:int) : Point
      {
         var _loc6_:Point = new Point(param1,param2);
         switch(param5)
         {
            case 0:
               --_loc6_.y;
               break;
            case 1:
               _loc6_.x += param3;
               break;
            case 2:
               _loc6_.y += param4;
               break;
            case 3:
               --_loc6_.x;
         }
         return _loc6_;
      }
      
      private function clearGameStatusString2(param1:Event = null) : void
      {
         setGameStatusString2(null);
      }
      
      public function setGameStatusString(param1:String) : String
      {
         gameStatusString = param1;
         return gameStatusString;
      }
      
      public function set gameStatusString2(param1:String) : void
      {
         var _loc2_:Object = this._1729080547gameStatusString2;
         if(_loc2_ !== param1)
         {
            this._1729080547gameStatusString2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameStatusString2",_loc2_,param1));
         }
      }
      
      public function toggleInventory() : void
      {
         if(inventoryDialog)
         {
            if(inventoryDialog.visible)
            {
               hideInventory();
            }
            else
            {
               showInventory();
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundMusicStatus() : String
      {
         return this._1947491223backgroundMusicStatus;
      }
      
      private function transitionToNewMap(param1:String, param2:String, param3:String, param4:int, param5:int) : void
      {
         transitionPlayerAA = activeActors[AA_player_idx];
         playCleanupActiveLayer();
         playCleanupBackgroundLayer();
         mapPiece.loadByName(param1,param2,param3,loadMapDuringGameResult);
         transitionNewX = param4;
         transitionNewY = param5;
         transitionStateWaitingForActorLoadRequests = true;
         transitionInProgress = true;
      }
      
      public function getActorResultHandler(param1:MgbActor) : void
      {
         var _loc2_:int = 0;
         if(param1.tilename == null || param1.tilename == "")
         {
            MgbLogger.getInstance().logGameBug("Actor \'" + param1.name + "\' does not have a tile - cannot use this. Please connect the actor to a tile",true);
         }
         else if(!mgbSession.userLoggedIn || param1.userName != mgbSession.userName || param1.projectName != param1.projectName)
         {
            --actorLoadsPending;
         }
         else
         {
            tileCache.getPiece(param1.userName,param1.projectName,param1.tilename,getTileHandler,false,false,true);
            _loc2_ = 0;
            while(_loc2_ < param1.animationTable.length)
            {
               tileCache.getPiece(param1.userName,param1.projectName,param1.animationTable[_loc2_].tilename,null,false,false,true);
               _loc2_++;
            }
         }
      }
      
      private function createBlitter() : void
      {
         var _loc1_:int = int(calculateRenderWidth());
         var _loc2_:int = int(calculateRenderHeight());
         if(!view)
         {
            view = new MgbBlitter(_loc1_,_loc2_);
            addChild(view);
            npcDialog = new NpcDialog();
            npcDialog.addEventListener(NpcDialogEvent.choiceMade,NpcDialogEventHandler);
            addChild(npcDialog);
            hideNpcMessage();
            inventoryDialog = new InventoryDialog();
            inventoryDialog.addEventListener(InventoryDialogEvent.INVENTORY_ACTION,InventoryDialogEventHandler);
            addChild(inventoryDialog);
            hideInventory();
         }
         redrawMap();
         if(Boolean(parent) && !redrawEventsSet)
         {
            parent.addEventListener("resize",resizeEvent);
            parent.addEventListener("scroll",redrawEvent);
            redrawEventsSet = true;
         }
      }
      
      protected function computeMapPixelWidth() : int
      {
         return MgbSystem.tileMinWidth * mapPiece.width;
      }
      
      private function generateTicTable() : void
      {
         G_tic = new Array();
         var _loc1_:int = int(activeActors.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(activeActors[_loc2_].alive)
            {
               ticAdd(activeActors[_loc2_].x,activeActors[_loc2_].y,_loc2_);
               if(activeActors[_loc2_].x != activeActors[_loc2_].fromx || activeActors[_loc2_].fromy != activeActors[_loc2_].y)
               {
                  ticAdd(activeActors[_loc2_].fromx,activeActors[_loc2_].fromy,_loc2_);
               }
            }
            _loc2_++;
         }
      }
      
      public function loadMapUsingDialog() : void
      {
         stopGameIfPlaying();
         tagCheck("load");
         mapPiece.loadUsingDialog(mgbSession.userName,mgbSession.activeProject,this.parent,loadMapResult);
         actorLoadsPending = 0;
      }
      
      protected function computeMapPixelHeight() : int
      {
         return MgbSystem.tileMinHeight * mapPiece.height;
      }
      
      private function playStopItemSliding(param1:ActiveActor) : void
      {
         param1.isSliding = false;
         param1.moveSpeed = 0;
         param1.stepCount = 0;
         param1.renderX = param1.x * MgbSystem.tileMinWidth;
         param1.renderY = param1.y * MgbSystem.tileMinHeight;
         if(param1.isAShot)
         {
            destroyShot(param1);
         }
      }
      
      private function addValidCellToCellList(param1:Array, param2:int, param3:int) : void
      {
         var _loc4_:int;
         if((_loc4_ = cell(param2,param3,true)) != -1)
         {
            param1.push(_loc4_);
         }
      }
      
      private function checkForGeneratedActorsThisSecond() : void
      {
         var _loc2_:ActiveActor = null;
         var _loc3_:MgbActor = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Point = null;
         var _loc1_:int = 0;
         while(_loc1_ < activeActors.length)
         {
            _loc2_ = activeActors[_loc1_];
            if(_loc2_.alive && _loc2_.birthTweenCount != G_tweenCount)
            {
               _loc3_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc2_.ACidx));
               if((Boolean(_loc4_ = String(_loc3_.actorXML.databag.itemOrNPC.dropsObjectRandomlyName))) && _loc4_ != "")
               {
                  _loc5_ = int(_loc3_.actorXML.databag.itemOrNPC.dropsObjectRandomlyChance);
                  if(100 * Math.random() < _loc5_)
                  {
                     if(_loc6_ = findAdjacentFreeCellForDrop(_loc1_,ActiveActor(activeActors[_loc1_]).stepStyle,true))
                     {
                        playSpawnNewActor(loadActorByName(_loc4_),_loc6_.x,_loc6_.y);
                        G_tic = null;
                     }
                  }
               }
            }
            _loc1_++;
         }
      }
      
      private function loadMapDuringGameResult(param1:Event) : void
      {
         preloadResourcesNeededForMap();
      }
      
      private function playPushItemToStartSliding(param1:int, param2:int) : void
      {
         var _loc3_:ActiveActor = activeActors[param1];
         var _loc4_:ActiveActor = activeActors[param2];
         var _loc5_:int = _loc3_.x - _loc3_.fromx;
         var _loc6_:int;
         if((_loc6_ = _loc3_.y - _loc3_.fromy) < 0 && _loc5_ == 0)
         {
            _loc4_.stepStyle = 0;
         }
         else if(_loc5_ > 0 && _loc6_ == 0)
         {
            _loc4_.stepStyle = 1;
         }
         else if(_loc6_ > 0 && _loc5_ == 0)
         {
            _loc4_.stepStyle = 2;
         }
         else
         {
            if(!(_loc5_ < 0 && _loc6_ == 0))
            {
               return;
            }
            _loc4_.stepStyle = 3;
         }
         _loc4_.isSliding = true;
         _loc4_.moveSpeed = 1;
         calculateNewEnemyPosition(param2);
         if(_loc4_.y < 0 || _loc4_.x < 0 || _loc4_.x >= mapPiece.width || _loc4_.y >= mapPiece.height || Boolean(checkIfActorObstructed(param2,true)))
         {
            _loc4_.x = _loc4_.fromx;
            _loc4_.y = _loc4_.fromy;
            _loc4_.stepCount = 0;
            _loc4_.isSliding = false;
            _loc4_.moveSpeed = 0;
            _loc3_.x = _loc3_.fromx;
            _loc3_.y = _loc3_.fromy;
            _loc3_.xMovePerTween = 0;
            _loc3_.yMovePerTween = 0;
            _loc3_.renderX = _loc3_.fromx * MgbSystem.tileMinWidth;
            _loc3_.renderY = _loc3_.fromy * MgbSystem.tileMinHeight;
         }
         else
         {
            _loc4_.xMovePerTween = (_loc4_.x - _loc4_.fromx) * (MgbSystem.tileMinWidth / (G_tweensPerTurn - (G_tweenCount - 1)));
            _loc4_.yMovePerTween = (_loc4_.y - _loc4_.fromy) * (MgbSystem.tileMinHeight / (G_tweensPerTurn - (G_tweenCount - 1)));
            G_tic = null;
         }
      }
      
      private function calculateRenderWidth(param1:Boolean = false) : int
      {
         var _loc2_:int = Math.max(128,!!parent ? Number(Container(parent).width) : 0) / zoomLevel;
         if(_loc2_ > MgbSystem.FlashLargestBitmapWidth)
         {
            _loc2_ = int(MgbSystem.FlashLargestBitmapWidth);
         }
         if(param1 && _loc2_ > mapPiece.width * MgbSystem.tileMinWidth)
         {
            _loc2_ = mapPiece.width * MgbSystem.tileMinWidth;
         }
         return _loc2_;
      }
      
      private function checkForAppearingAndDisappearingActors() : void
      {
         var _loc4_:String = null;
         var _loc5_:ActiveActor = null;
         var _loc6_:MgbActor = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:Array = new Array();
         var _loc2_:int = int(activeActors.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(activeActors[_loc3_].alive)
            {
               _loc4_ = String(activeActors[_loc3_].ACidx);
               _loc1_[_loc4_] = !!_loc1_[_loc4_] ? _loc1_[_loc4_] + 1 : 1;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = activeActors[_loc3_];
            _loc7_ = !!(_loc6_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc5_.ACidx))).actorXML.databag.itemOrNPC.conditionsActor ? String(_loc6_.actorXML.databag.itemOrNPC.conditionsActor) : null;
            _loc8_ = !!_loc6_.actorXML.databag.itemOrNPC.appearIf ? int(_loc6_.actorXML.databag.itemOrNPC.appearIf) : int(MgbActor.alAppearDisappear_NoCondition);
            _loc9_ = !!_loc6_.actorXML.databag.itemOrNPC.appearCount ? int(_loc6_.actorXML.databag.itemOrNPC.appearCount) : 0;
            if(_loc8_ != MgbActor.alAppearDisappear_NoCondition)
            {
               if(_loc6_ && _loc6_.actorXML.databag.itemOrNPC.conditionsActor && _loc7_ != "")
               {
                  _loc10_ = _loc1_[_loc7_] == null ? 0 : int(_loc1_[_loc7_]);
                  if(_loc9_ == _loc10_)
                  {
                     activeActors[_loc3_].alive = _loc8_ == MgbActor.alAppearDisappear_Appear && activeActors[_loc3_].health > 0;
                  }
                  else
                  {
                     activeActors[_loc3_].alive = _loc8_ != MgbActor.alAppearDisappear_Appear && activeActors[_loc3_].health > 0;
                  }
               }
            }
            _loc3_++;
         }
      }
      
      private function calculateNewEnemyPosition(param1:int, param2:int = -1) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:ActiveActor = activeActors[param1];
         var _loc4_:MgbActor = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc3_.ACidx));
         if(_loc3_.isSliding)
         {
            if(_loc3_.isAShot && _loc3_.stepCount > _loc3_.shotRange)
            {
               destroyShot(_loc3_);
            }
            else if(!_loc3_.isAShot && _loc3_.stepCount > int(_loc4_.actorXML.databag.item.pushToSlideNum))
            {
               playStopItemSliding(_loc3_);
            }
            else
            {
               switch(_loc3_.stepStyle)
               {
                  case 0:
                     --_loc3_.y;
                     break;
                  case 1:
                     ++_loc3_.x;
                     break;
                  case 2:
                     ++_loc3_.y;
                     break;
                  case 3:
                     --_loc3_.x;
               }
               ++_loc3_.stepCount;
            }
         }
         else if(param2 != -1)
         {
            _loc3_.stepStyle = param2;
            switch(_loc3_.stepStyle)
            {
               case 0:
                  --_loc3_.y;
                  break;
               case 1:
                  ++_loc3_.x;
                  break;
               case 2:
                  ++_loc3_.y;
                  break;
               case 3:
                  --_loc3_.x;
            }
            ++_loc3_.stepCount;
         }
         else if(_loc3_.moveSpeed > 0 || _loc3_.moveSpeed < 1 && Math.random() < _loc3_.moveSpeed)
         {
            _loc5_ = int(_loc4_.actorXML.databag.npc.movementType);
            _loc6_ = int(_loc4_.actorXML.databag.npc.aggroRange);
            _loc7_ = Math.pow(_loc3_.x - activeActors[AA_player_idx].x,2) + Math.pow(_loc3_.y - activeActors[AA_player_idx].y,2);
            if(_loc6_)
            {
               if(_loc7_ < Math.pow(_loc6_,2))
               {
                  _loc5_ = int(MgbActor.alMovementType_ToPlayer);
               }
            }
            switch(_loc5_)
            {
               case MgbActor.alMovementType_None:
                  break;
               case MgbActor.alMovementType_Random:
                  if(0 == _loc3_.stepCount || Math.random() < 0.1)
                  {
                     _loc3_.stepStyle = Math.floor(Math.random() * 4);
                  }
                  switch(_loc3_.stepStyle)
                  {
                     case 0:
                        --_loc3_.y;
                        break;
                     case 1:
                        ++_loc3_.x;
                        break;
                     case 2:
                        ++_loc3_.y;
                        break;
                     case 3:
                        --_loc3_.x;
                  }
                  ++_loc3_.stepCount;
                  break;
               case MgbActor.alMovementType_ToPlayer:
                  if(_loc3_.x < activeActors[AA_player_idx].x)
                  {
                     ++_loc3_.x;
                     _loc3_.stepStyle = 1;
                  }
                  else if(_loc3_.x > activeActors[AA_player_idx].x)
                  {
                     --_loc3_.x;
                     _loc3_.stepStyle = 3;
                  }
                  else if(_loc3_.y < activeActors[AA_player_idx].y)
                  {
                     ++_loc3_.y;
                     _loc3_.stepStyle = 2;
                  }
                  else if(_loc3_.y > activeActors[AA_player_idx].y)
                  {
                     --_loc3_.y;
                     _loc3_.stepStyle = 0;
                  }
                  break;
               case MgbActor.alMovementType_FromPlayer:
                  if(_loc3_.x < activeActors[AA_player_idx].x)
                  {
                     --_loc3_.x;
                     _loc3_.stepStyle = 1;
                  }
                  else if(_loc3_.x > activeActors[AA_player_idx].x)
                  {
                     ++_loc3_.x;
                     _loc3_.stepStyle = 3;
                  }
                  else if(_loc3_.y < activeActors[AA_player_idx].y)
                  {
                     --_loc3_.y;
                     _loc3_.stepStyle = 2;
                  }
                  else if(_loc3_.y > activeActors[AA_player_idx].y)
                  {
                     ++_loc3_.y;
                     _loc3_.stepStyle = 0;
                  }
                  break;
               default:
                  throw new Error("Unknown Actor MovementType in " + _loc4_.name);
            }
            if(_loc7_ < 36)
            {
               _loc8_ = int(_loc4_.actorXML.databag.allchar.meleeDamageToPlayerNum);
               _loc9_ = int(_loc4_.actorXML.databag.allchar.meleeDamageToNPCorItemNum);
               if(_loc8_ > 0 || _loc9_ > 0)
               {
                  startMeleeIfAllowed(_loc3_,false);
               }
            }
            if(actorCanShoot(param1))
            {
               if((_loc5_ = int(_loc4_.actorXML.databag.npc.shotAccuracyType)) == MgbActor.alShotAccuracy_random || _loc5_ == MgbActor.alShotAccuracy_poor)
               {
                  _loc10_ = int(Math.random() * 4);
               }
               else if(_loc3_.x - activeActors[AA_player_idx].x < -1)
               {
                  _loc10_ = 1;
               }
               else if(_loc3_.x - activeActors[AA_player_idx].x > 1)
               {
                  _loc10_ = 3;
               }
               else if(_loc3_.y - activeActors[AA_player_idx].y < -1)
               {
                  _loc10_ = 2;
               }
               else if(_loc3_.y - activeActors[AA_player_idx].y > 1)
               {
                  _loc10_ = 0;
               }
               actorCreateShot(param1,_loc10_);
            }
         }
      }
      
      protected function redrawResizeIndicatorOnMap(param1:BitmapData, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:int = 0;
         if(gameEngineMode == GameEngine.GE_EDIT && resizeFromX != -1 && resizeFromY != -1)
         {
            _loc8_ = 2147483903;
            if(resizeAdd)
            {
               _loc8_ = 2147548928;
            }
            if(resizeRemove)
            {
               _loc8_ = 2164195328;
            }
            if(resizeColumns)
            {
               param1.fillRect(new Rectangle((resizeFromX - param4) * MgbSystem.tileMinWidth - param6 + 1 + resizeDirectionHintOffset,1,MgbSystem.tileMinWidth - 2,param1.height - 2),_loc8_);
            }
            else if(resizeRows)
            {
               param1.fillRect(new Rectangle(1,(resizeFromY - param5) * MgbSystem.tileMinHeight - param7 + 1 + resizeDirectionHintOffset,param1.width - 2,MgbSystem.tileMinHeight - 2),_loc8_);
            }
            param1.fillRect(new Rectangle((resizeFromX - param4) * MgbSystem.tileMinWidth - param6 + 1 + resizeDirectionHintOffset,(resizeFromY - param5) * MgbSystem.tileMinHeight - param7 + 1 + resizeDirectionHintOffset,MgbSystem.tileMinWidth - 2,MgbSystem.tileMinHeight - 2),uint(_loc8_) || uint(4278190080));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundMusicCurrentSource() : String
      {
         return this._2089343645backgroundMusicCurrentSource;
      }
      
      [Bindable(event="propertyChange")]
      public function get gameEngineMode() : String
      {
         return this._291707031gameEngineMode;
      }
      
      private function transitionTick() : void
      {
         if(Boolean(transitionStateWaitingForActorLoadRequests) || actorLoadsPending > 0)
         {
            trace("transitionTick: " + actorLoadsPending + " actor loads still Pending");
            if(view.alpha > 0.1)
            {
               view.alpha -= 0.1;
            }
         }
         else
         {
            if(view.alpha < 1)
            {
               view.alpha += 0.1;
               if(view.alpha > 1)
               {
                  view.alpha = 1;
               }
               return;
            }
            playPrepareActiveLayer(mapPiece,true);
            playPrepareBackgroundLayer();
            transitionPlayerAA.x = transitionNewX;
            transitionPlayerAA.fromx = transitionNewX;
            transitionPlayerAA.y = transitionNewY;
            transitionPlayerAA.fromy = transitionNewY;
            transitionPlayerAA.renderX = transitionPlayerAA.fromx * MgbSystem.tileMinWidth;
            transitionPlayerAA.renderY = transitionPlayerAA.fromy * MgbSystem.tileMinHeight;
            transitionPlayerAA.currentActiveShots = 0;
            AA_player_idx = activeActors.length;
            activeActors[AA_player_idx] = transitionPlayerAA;
            scrollMapToSeePlayer();
            G_tic = null;
            G_tweenCount = 0;
            applyZoomLevel();
            transitionInProgress = false;
            clearPlayerKeys();
         }
      }
      
      private function clearPlayerKeys() : void
      {
         G_player_action_up = false;
         G_player_action_down = false;
         G_player_action_left = false;
         G_player_action_right = false;
         G_player_action_shift = false;
         G_player_action_push = false;
         G_player_action_melee = false;
         G_player_action_shoot = false;
         G_player_action_jump = false;
      }
      
      private function getAnimationIndex(param1:MgbActor, param2:int, param3:int, param4:int, param5:int = -1) : int
      {
         var _loc6_:int = param4 % 5;
         var _loc7_:int = G_tweenSinceMapStarted / 2 % 16;
         var _loc8_:int = -1;
         var _loc9_:int = param2 == -1 ? param3 : param2;
         if(param5 == ActiveActor.MELEESTEP_NOT_IN_MELEE)
         {
            switch(param2)
            {
               case 0:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_FACE_NORTH + _loc6_;
                  break;
               case 1:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_FACE_EAST + _loc6_;
                  break;
               case 2:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_FACE_SOUTH + _loc6_;
                  break;
               case 3:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_FACE_WEST + _loc6_;
                  break;
               case -1:
                  switch(param3)
                  {
                     case -1:
                        _loc8_ = MgbActor.ANIMATION_INDEX_BASE_STATIONARY_SOUTH + _loc7_;
                        break;
                     case 0:
                        _loc8_ = MgbActor.ANIMATION_INDEX_BASE_STATIONARY_NORTH + _loc7_;
                        break;
                     case 1:
                        _loc8_ = MgbActor.ANIMATION_INDEX_BASE_STATIONARY_EAST + _loc7_;
                        break;
                     case 2:
                        _loc8_ = MgbActor.ANIMATION_INDEX_BASE_STATIONARY_SOUTH + _loc7_;
                        break;
                     case 3:
                        _loc8_ = MgbActor.ANIMATION_INDEX_BASE_STATIONARY_WEST + _loc7_;
                  }
                  if(!isAnimationTableIndexValid(param1,_loc8_))
                  {
                     _loc8_ = MgbActor.ANIMATION_INDEX_BASE_STATIONARY_ANYDIRECTION + _loc7_;
                  }
                  if(!isAnimationTableIndexValid(param1,_loc8_))
                  {
                     _loc8_ = -1;
                  }
            }
         }
         else
         {
            switch(_loc9_)
            {
               case -1:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_MELEE_NORTH + param5;
                  break;
               case 0:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_MELEE_NORTH + param5;
                  break;
               case 1:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_MELEE_EAST + param5;
                  break;
               case 2:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_MELEE_SOUTH + param5;
                  break;
               case 3:
                  _loc8_ = MgbActor.ANIMATION_INDEX_BASE_MELEE_WEST + param5;
            }
            if(param1.animationTable[_loc8_].tilename == null || param1.animationTable[_loc8_].tilename == "")
            {
               _loc8_ = -1;
            }
         }
         return _loc8_;
      }
      
      public function triggerEditMode() : void
      {
         removeGe2Events(GameEngine.GE_PLAY);
         pleaseRedrawMapSoon();
      }
      
      private function preLoadPotentialSpawns(param1:MgbActor) : void
      {
         var _loc2_:String = String(param1.actorXML.databag.itemOrNPC.dropsObjectWhenKilledName);
         if(Boolean(_loc2_) && "" != _loc2_)
         {
            loadActorByName(_loc2_);
         }
         _loc2_ = String(param1.actorXML.databag.itemOrNPC.dropsObjectWhenKilledName2);
         if(Boolean(_loc2_) && "" != _loc2_)
         {
            loadActorByName(_loc2_);
         }
         _loc2_ = String(param1.actorXML.databag.itemOrNPC.dropsObjectRandomlyName);
         if(Boolean(_loc2_) && "" != _loc2_)
         {
            loadActorByName(_loc2_);
         }
         _loc2_ = String(param1.actorXML.databag.allchar.shotActor);
         if(Boolean(_loc2_) && _loc2_ != "")
         {
            loadActorByName(_loc2_);
         }
         _loc2_ = String(param1.actorXML.databag.npc.dropsObjectOnChoice1);
         if(Boolean(_loc2_) && _loc2_ != "")
         {
            loadActorByName(_loc2_);
         }
         _loc2_ = String(param1.actorXML.databag.npc.dropsObjectOnChoice2);
         if(Boolean(_loc2_) && _loc2_ != "")
         {
            loadActorByName(_loc2_);
         }
         _loc2_ = String(param1.actorXML.databag.npc.dropsObjectOnChoice3);
         if(Boolean(_loc2_) && _loc2_ != "")
         {
            loadActorByName(_loc2_);
         }
         _loc2_ = String(param1.actorXML.databag.item.equippedNewShotActor);
         if(Boolean(_loc2_) && _loc2_ != "")
         {
            loadActorByName(_loc2_);
         }
         _loc2_ = String(param1.actorXML.databag.item.equippedNewActorGraphics);
         if(Boolean(_loc2_) && _loc2_ != "")
         {
            loadActorByName(_loc2_);
         }
      }
      
      public function toggleGrid() : void
      {
         showGridFlag = !showGridFlag;
         pleaseRedrawMapSoon();
      }
      
      public function doPauseGame() : void
      {
         var _loc1_:MgbActor = null;
         if(!pauseGame)
         {
            _loc1_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[AA_player_idx].ACidx));
            showNpcMessage({
               "message":"Game Paused",
               "leftActor":_loc1_
            });
         }
      }
      
      private function showNpcMessage(param1:Object, param2:ActiveActor = null) : void
      {
         if(npcDialog)
         {
            fixDialogSizes();
            npcDialog.setParams(param1);
            npcDialog.visible = true;
            pauseGame = true;
            npcDialogActor = param2;
         }
      }
      
      private function notifyThatGameIsReadyToPlay() : void
      {
         setGameStatusString("Ready");
         dispatchEvent(new GameEngineEvent(GameEngineEvent.LOADED,mapPiece.userName,mapPiece.projectName,mapPiece.name));
      }
      
      private function playPrepareActiveLayer(param1:MgbMap, param2:Boolean = false) : int
      {
         var _loc4_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:MgbActor = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:ActiveActor = null;
         var _loc15_:MgbTile = null;
         var _loc16_:String = null;
         var _loc3_:int = 0;
         var _loc5_:int = int(MgbMap.layerActive);
         activeActors = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < mapPiece.height)
         {
            _loc8_ = 0;
            while(_loc8_ < mapPiece.width)
            {
               _loc9_ = String(mapPiece.mapLayerActors[_loc5_][cell(_loc8_,_loc6_)]);
               if(null != _loc9_)
               {
                  _loc10_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc9_));
                  if(null != _loc10_)
                  {
                     _loc11_ = int(activeActors.length);
                     _loc12_ = int(_loc10_.actorXML.databag.all.actorType);
                     if(!(param2 == true && _loc12_ == MgbActor.alActorType_Player))
                     {
                        _loc13_ = mapPiece.name + "/" + _loc8_ + "/" + _loc6_;
                        if(!(_loc12_ != MgbActor.alActorType_Player && Boolean(respawnMemory[_loc13_])))
                        {
                           (_loc14_ = new ActiveActor()).creationCause = ActiveActor.CREATION_BY_MAP;
                           _loc14_.respawnId = _loc13_;
                           _loc14_.birthTweenCount = G_tweenCount;
                           _loc14_.meleeStep = ActiveActor.MELEESTEP_NOT_IN_MELEE;
                           preLoadPotentialSpawns(_loc10_);
                           switch(_loc12_)
                           {
                              case MgbActor.alActorType_Shot:
                                 MgbLogger.getInstance().logGameBug("Actor " + _loc9_ + " is a shot - it shouldn\'t be placed directly on the map. Ignoring...");
                                 break;
                              case MgbActor.alActorType_NPC:
                              case MgbActor.alActorType_Player:
                                 _loc14_.moveSpeed = Number(_loc10_.actorXML.databag.allchar.movementSpeedNum);
                              case MgbActor.alActorType_Item:
                                 if(!(_loc15_ = MgbTile(tileCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc10_.tilename))))
                                 {
                                    MgbLogger.getInstance().logGameBug("Actor \'" + _loc10_.name + "\' does not have a valid tile and will not be in the game",false);
                                    _loc3_++;
                                 }
                                 else
                                 {
                                    if(_loc15_.loadFailed)
                                    {
                                       ++actorLoadsPending;
                                       getActorResultHandler(_loc10_);
                                    }
                                    _loc14_.wasStopped = false;
                                    _loc14_.startx = _loc8_;
                                    _loc14_.x = _loc8_;
                                    _loc14_.fromx = _loc8_;
                                    _loc14_.type = _loc12_;
                                    _loc14_.starty = _loc6_;
                                    _loc14_.fromy = _loc6_;
                                    _loc14_.y = _loc6_;
                                    _loc14_.health = _loc10_.actorXML.databag.all.initialHealthNum;
                                    _loc14_.maxHealth = _loc10_.actorXML.databag.all.initialMaxHealthNum;
                                    _loc14_.appearIf = !!_loc10_.actorXML.databag.itemOrNPC.appearIf ? int(_loc10_.actorXML.databag.itemOrNPC.appearIf) : int(MgbActor.alAppearDisappear_NoCondition);
                                    _loc14_.ACidx = _loc9_;
                                    _loc14_.renderBD = _loc15_.bitmapData;
                                    _loc14_.renderX = _loc8_ * MgbSystem.tileMinWidth;
                                    _loc14_.renderY = _loc6_ * MgbSystem.tileMinHeight;
                                    _loc14_.cellSpanX = (_loc15_.width + (MgbSystem.tileMinWidth - 1)) / MgbSystem.tileMinWidth;
                                    _loc14_.cellSpanY = (_loc15_.height + (MgbSystem.tileMinHeight - 1)) / MgbSystem.tileMinHeight;
                                    _loc16_ = String(_loc10_.actorXML.databag.allchar.shotActor);
                                    _loc14_.maxActiveShots = _loc16_ == null || _loc16_ == "" ? 0 : int(_loc10_.actorXML.databag.allchar.shotRateNum);
                                    _loc14_.alive = true;
                                    if(_loc14_.moveSpeed == 0)
                                    {
                                       activeActors.unshift(_loc14_);
                                    }
                                    else
                                    {
                                       activeActors.push(_loc14_);
                                    }
                                 }
                                 break;
                              default:
                                 throw new Error("Unknown Actor type " + _loc12_);
                           }
                        }
                     }
                  }
               }
               _loc8_++;
            }
            _loc6_++;
         }
         respawnRequiredActorsForMap();
         var _loc7_:int = 0;
         while(_loc7_ < activeActors.length)
         {
            if(MgbActor.alActorType_Player == activeActors[_loc7_].type)
            {
               AA_player_idx = _loc7_;
               _loc4_++;
            }
            _loc7_++;
         }
         if(_loc3_)
         {
            MgbLogger.getInstance().logGameBug(_loc3_ + " actors did not have valid tiles and so are not in the game. Check the Log for details",true);
         }
         return _loc4_;
      }
      
      private function hideNpcMessage() : void
      {
         if(npcDialog)
         {
            npcDialog.clearParams();
            npcDialog.visible = false;
            pauseGame = false;
            npcDialogActor = null;
         }
      }
      
      public function triggerPlayMode() : void
      {
         stopGameIfPlaying();
         gameEngineMode = GameEngine.GE_PLAY;
         pleaseRedrawMapSoon();
      }
      
      public function set backgroundMusicStatus(param1:String) : void
      {
         var _loc2_:Object = this._1947491223backgroundMusicStatus;
         if(_loc2_ !== param1)
         {
            this._1947491223backgroundMusicStatus = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundMusicStatus",_loc2_,param1));
         }
      }
      
      private function fixDialogSizes() : void
      {
         if(this.npcDialog)
         {
            npcDialog.width = view.width - 40;
            npcDialog.height = view.height - 60;
         }
         if(this.inventoryDialog)
         {
            inventoryDialog.width = view.width - 40;
            inventoryDialog.height = view.height - 60;
         }
      }
      
      private function checkIfActorObstructed(param1:int, param2:Boolean = false) : Boolean
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:MgbActor = null;
         var _loc17_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:ActiveActor = activeActors[param1];
         var _loc5_:MgbActor = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc4_.ACidx));
         var _loc6_:int = _loc4_.cellSpanX + _loc4_.x;
         var _loc7_:int = _loc4_.cellSpanY + _loc4_.y;
         var _loc8_:int = mapPiece.width;
         var _loc9_:int = mapPiece.height;
         var _loc10_:int = _loc4_.x;
         while(_loc10_ < _loc6_ && _loc10_ < _loc8_ && _loc3_ == false)
         {
            _loc11_ = _loc4_.y;
            while(_loc11_ < _loc7_ && _loc11_ < _loc9_ && _loc3_ == false)
            {
               _loc12_ = cell(_loc10_,_loc11_);
               if(backgroundBlockageMap.isEntityBlocked(_loc10_,_loc11_,AA_player_idx == param1 ? int(BlockageMap.ENTITY_PLAYER) : int(BlockageMap.ENTITY_NPC)))
               {
                  _loc3_ = true;
               }
               if(param2 && !_loc3_)
               {
                  if(null == G_tic)
                  {
                     generateTicTable();
                  }
                  if(Boolean(G_tic[_loc12_]) && G_tic[_loc12_].length > 0)
                  {
                     _loc13_ = 0;
                     while(_loc13_ < G_tic[_loc12_].length && !_loc3_)
                     {
                        _loc14_ = int(G_tic[_loc12_][_loc13_]);
                        _loc15_ = String(activeActors[_loc14_].ACidx);
                        _loc16_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc15_));
                        if(Boolean(activeActors[_loc14_].alive) && _loc14_ != param1)
                        {
                           _loc17_ = int(_loc16_.actorXML.databag.item.itemActivationType);
                           if(AA_player_idx == param1)
                           {
                              if((_loc17_ == MgbActor.alItemActivationType_BlocksPlayer || _loc17_ == MgbActor.alItemActivationType_BlocksPlayerAndNPC) && !(_loc16_.actorXML.databag.all.actorType == MgbActor.alActorType_NPC && _loc16_.actorXML.databag.itemOrNPC.destroyableYN == 1 && _loc5_.actorXML.databag.allchar.touchDamageToNPCorItemNum > 0) && (_loc16_.actorXML.databag.all.actorType != MgbActor.alActorType_Item || 0 == _loc16_.actorXML.databag.item.pushToSlideNum))
                              {
                                 _loc3_ = true;
                              }
                           }
                           else if(!(int(_loc5_.actorXML.databag.all.actorType) == MgbActor.alActorType_Shot && (int(_loc16_.actorXML.databag.all.actorType) == MgbActor.alActorType_Player || int(_loc16_.actorXML.databag.all.actorType) == MgbActor.alActorType_NPC)))
                           {
                              if(!(int(_loc16_.actorXML.databag.all.actorType) == MgbActor.alActorType_Shot && (int(_loc5_.actorXML.databag.all.actorType) == MgbActor.alActorType_Player || int(_loc5_.actorXML.databag.all.actorType) == MgbActor.alActorType_NPC)))
                              {
                                 if(AA_player_idx == _loc14_)
                                 {
                                    if(int(_loc5_.actorXML.databag.npc.canOccupyPlayerSpaceYN) == 1)
                                    {
                                       _loc3_ = false;
                                    }
                                    else
                                    {
                                       _loc3_ = true;
                                    }
                                 }
                                 else if(_loc17_ == MgbActor.alItemActivationType_BlocksNPC || _loc17_ == MgbActor.alItemActivationType_BlocksPlayerAndNPC)
                                 {
                                    _loc3_ = true;
                                 }
                              }
                           }
                        }
                        _loc13_++;
                     }
                  }
               }
               _loc11_++;
            }
            _loc10_++;
         }
         return _loc3_;
      }
      
      public function setGameStatusString2(param1:String, param2:int = 7) : String
      {
         gameStatusString2 = param1;
         if(gameStatusString2Timer)
         {
            gameStatusString2Timer.reset();
         }
         else
         {
            gameStatusString2Timer = new Timer(param2 * 1000,1);
            gameStatusString2Timer.addEventListener(TimerEvent.TIMER_COMPLETE,clearGameStatusString2);
         }
         if(Boolean(param1) && param1.length > 0)
         {
            gameStatusString2Timer.delay = param2 * 1000;
            gameStatusString2Timer.start();
         }
         return param1;
      }
      
      protected function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get G_gameOver() : Boolean
      {
         return this._1548633310G_gameOver;
      }
      
      private function showInventory() : void
      {
         inventoryDialog.setInventory(this.inventory);
         if(inventoryDialog.visible == false)
         {
            inventoryDialog.visible = true;
            pauseGame = true;
         }
      }
      
      private function redrawEvent(param1:Event) : void
      {
         pleaseRedrawMapSoon();
      }
      
      public function set zoomLevel(param1:Number) : void
      {
         var _loc2_:Object = this._1634857841zoomLevel;
         if(_loc2_ !== param1)
         {
            this._1634857841zoomLevel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zoomLevel",_loc2_,param1));
         }
      }
      
      private function calculateRenderHeight(param1:Boolean = false) : int
      {
         var _loc2_:int = Math.max(128,!!parent ? Number(Container(parent).height) : 0) / zoomLevel;
         if(_loc2_ > MgbSystem.FlashLargestBitmapHeight)
         {
            _loc2_ = int(MgbSystem.FlashLargestBitmapHeight);
         }
         if(param1 && _loc2_ > mapPiece.height * MgbSystem.tileMinHeight)
         {
            _loc2_ = mapPiece.height * MgbSystem.tileMinHeight;
         }
         return _loc2_;
      }
      
      public function pleaseRedrawMapSoon() : void
      {
         needToRedrawMap = true;
      }
      
      private function useItemOnPlayer(param1:int) : void
      {
         var _loc2_:MgbActor = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[param1].ACidx));
         useItemActorOnPlayer(_loc2_);
      }
      
      private function playCleanupActiveLayer() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < activeActors.length)
         {
            activeActors[_loc1_] = null;
            _loc1_++;
         }
         activeActors.length = 0;
      }
      
      private function applyDamageToActor(param1:int, param2:MgbActor, param3:int, param4:int = 100, param5:Boolean = true) : Boolean
      {
         if(param3 && param4 != 100 && param4 != 0)
         {
            param3 = 100 * Math.random() < param4 ? param3 : 0;
         }
         if(param3)
         {
            if(param1 == AA_player_idx)
            {
               param3 = int(reduceDamageByPlayerArmor(param3));
            }
            if(activeActors[param1].alive == false || MgbActor.alGainPowerType_Invulnerable == activeActors[param1].activePower && activeActors[param1].activePowerUntilTweenCount >= G_tweenSinceMapStarted)
            {
               param3 = 0;
            }
            if(param2.actorXML.databag.itemOrNPC.destroyableYN != 1)
            {
               param3 = 0;
            }
         }
         if(param3)
         {
            activeActors[param1].health -= param3;
            if(param5)
            {
               MgbActor.playCannedSound(param2.actorXML.databag.all.soundWhenHarmed);
            }
         }
         return param3 != 0;
      }
      
      public function togglePause() : void
      {
         if(pauseGame)
         {
            hideNpcMessage();
         }
         else
         {
            doPauseGame();
         }
      }
      
      private function addCellsActorIsFacingToCellList(param1:Array, param2:ActiveActor, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:int = 1;
         var _loc7_:int = 1;
         switch(param3)
         {
            case 0:
               _loc4_ = param2.x;
               _loc5_ = param2.y - 1;
               _loc6_ = param2.cellSpanX;
               break;
            case 1:
               _loc4_ = param2.x + param2.cellSpanX;
               _loc5_ = param2.y;
               _loc7_ = param2.cellSpanY;
               break;
            case 2:
               _loc4_ = param2.x;
               _loc5_ = param2.y + param2.cellSpanY;
               _loc6_ = param2.cellSpanX;
               break;
            case 3:
               _loc4_ = param2.x - 1;
               _loc5_ = param2.y;
               _loc7_ = param2.cellSpanY;
         }
         var _loc8_:int = _loc4_;
         while(_loc8_ < _loc4_ + _loc6_)
         {
            _loc9_ = _loc5_;
            while(_loc9_ < _loc5_ + _loc7_)
            {
               addValidCellToCellList(param1,_loc8_,_loc9_);
               _loc9_++;
            }
            _loc8_++;
         }
      }
      
      private function isObstructedForThisDrop(param1:int, param2:int, param3:Boolean) : Boolean
      {
         var _loc7_:MgbActor = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:ActiveActor = null;
         var _loc4_:Boolean = false;
         if(param1 < 0 || param1 >= mapPiece.width || param2 < 0 || param2 >= mapPiece.height)
         {
            return true;
         }
         var _loc5_:int = cell(param1,param2);
         var _loc6_:String;
         if(_loc6_ = String(mapPiece.mapLayerActors[MgbMap.layerBackground][_loc5_]))
         {
            if(_loc7_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc6_)))
            {
               if((_loc8_ = int(_loc7_.actorXML.databag.item.itemActivationType)) == MgbActor.alItemActivationType_BlocksPlayer || _loc8_ == MgbActor.alItemActivationType_BlocksPlayerAndNPC)
               {
                  _loc4_ = true;
               }
            }
         }
         if(param3 && !_loc4_)
         {
            _loc9_ = 0;
            while(_loc9_ < activeActors.length && !_loc4_)
            {
               if((_loc10_ = activeActors[_loc9_]).alive && _loc10_.x == param1 && _loc10_.y == param2)
               {
                  _loc4_ = true;
               }
               _loc9_++;
            }
         }
         return _loc4_;
      }
      
      private function playPrepareBackgroundLayer() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:MgbActor = null;
         var _loc6_:int = 0;
         var _loc7_:MgbTile = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         backgroundBlockageMap.reset(mapPiece.width,mapPiece.height);
         var _loc1_:int = 0;
         while(_loc1_ < mapPiece.height)
         {
            _loc2_ = 0;
            while(_loc2_ < mapPiece.width)
            {
               _loc3_ = cell(_loc2_,_loc1_);
               _loc4_ = String(mapPiece.mapLayerActors[MgbMap.layerBackground][_loc3_]);
               if(null != _loc4_)
               {
                  _loc5_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc4_));
                  if(null != _loc5_)
                  {
                     if((_loc6_ = int(_loc5_.actorXML.databag.all.actorType)) == MgbActor.alActorType_Item)
                     {
                        if(!(_loc7_ = MgbTile(tileCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc5_.tilename))))
                        {
                           trace("playPrepareBackgroundLayer() can\'t measure background actor \'" + _loc5_.name + "\' - unknown tile \'" + _loc5_.tilename + "\'. Assuming 1x1.");
                        }
                        _loc8_ = !!_loc7_ ? int(_loc7_.width / MgbSystem.tileMinWidth) : 1;
                        _loc9_ = !!_loc7_ ? int(_loc7_.height / MgbSystem.tileMinHeight) : 1;
                        if((_loc10_ = int(_loc5_.actorXML.databag.item.itemActivationType)) == MgbActor.alItemActivationType_BlocksPlayer || _loc10_ == MgbActor.alItemActivationType_BlocksPlayerAndNPC)
                        {
                           backgroundBlockageMap.blockEntity(_loc2_,_loc1_,BlockageMap.ENTITY_PLAYER,_loc8_,_loc9_);
                        }
                        if(_loc10_ == MgbActor.alItemActivationType_BlocksNPC || _loc10_ == MgbActor.alItemActivationType_BlocksPlayerAndNPC)
                        {
                           backgroundBlockageMap.blockEntity(_loc2_,_loc1_,BlockageMap.ENTITY_NPC,_loc8_,_loc9_);
                        }
                     }
                  }
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      private function loadActorByName(param1:String) : String
      {
         var _loc3_:MgbTile = null;
         var _loc2_:MgbActor = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,param1));
         if(null == _loc2_)
         {
            ++actorLoadsPending;
            actorCache.getPiece(mapPiece.userName,mapPiece.projectName,param1,getActorResultHandler);
         }
         else if(_loc2_.tilename != null)
         {
            _loc3_ = MgbTile(tileCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc2_.tilename));
            if(_loc3_ == null || _loc3_.loadFailed)
            {
               ++actorLoadsPending;
               getActorResultHandler(_loc2_);
            }
         }
         return param1;
      }
      
      private function redrawAddGameStatusString2(param1:BitmapData, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:TextFormat = null;
         var _loc8_:TextField = null;
         var _loc9_:Matrix = null;
         if(gameEngineMode == GameEngine.GE_PLAY && gameStatusString2 && gameStatusString2.length > 0)
         {
            _loc5_ = 16;
            _loc6_ = 32;
            _loc7_ = new TextFormat();
            (_loc8_ = new TextField()).text = gameStatusString2;
            _loc8_.embedFonts = true;
            _loc8_.wordWrap = true;
            _loc7_.font = "titlefont";
            _loc7_.size = 14;
            _loc8_.background = true;
            _loc8_.backgroundColor = 16777215;
            _loc8_.setTextFormat(_loc7_);
            _loc8_.width = param4 - _loc5_;
            _loc8_.height = _loc8_.textHeight + 4;
            _loc7_.color = 0;
            _loc9_ = new Matrix(1,0,0,1,_loc5_,_loc6_);
            if(param2 < 0)
            {
               _loc9_.translate(-param2,0);
            }
            if(param3 < 0)
            {
               _loc9_.translate(0,-param3);
            }
            param1.draw(_loc8_,_loc9_,new ColorTransform(1,1,1,0.6));
            _loc9_.translate(0,0);
            _loc7_.color = 0;
            _loc8_.background = false;
            _loc8_.setTextFormat(_loc7_);
            param1.draw(_loc8_,_loc9_);
         }
      }
      
      private function InventoryDialogEventHandler(param1:InventoryDialogEvent) : void
      {
         var _loc2_:Point = null;
         switch(param1.action)
         {
            case InventoryDialogEvent.ACTION_CLOSE:
               hideInventory();
               break;
            case InventoryDialogEvent.ACTION_DESTROY:
               inventory.remove(param1.item);
               break;
            case InventoryDialogEvent.ACTION_DROP:
               _loc2_ = findAdjacentFreeCellForDrop(AA_player_idx,ActiveActor(activeActors[AA_player_idx]).stepStyle);
               if(_loc2_)
               {
                  playSpawnNewActor(param1.item.actor.name,_loc2_.x,_loc2_.y,true,true);
                  inventory.remove(param1.item);
               }
               hideInventory();
               break;
            case InventoryDialogEvent.ACTION_EQUIP:
               inventory.equip(param1.item,!param1.item.equipped);
               break;
            case InventoryDialogEvent.ACTION_USE:
               useItemActorOnPlayer(param1.item.actor);
               inventory.remove(param1.item);
               hideInventory();
         }
      }
      
      private function respawnRequiredActorsForMap() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:Object = null;
         if(null != respawnMemoryAutoRespawningActors[mapPiece.name])
         {
            _loc1_ = respawnMemoryAutoRespawningActors[mapPiece.name];
            for(_loc2_ in _loc1_)
            {
               _loc3_ = _loc1_[_loc2_];
               if(_loc3_.actorname)
               {
                  playSpawnNewActor(_loc3_.actorname,_loc3_.x,_loc3_.y,false,true,_loc2_);
               }
            }
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createBlitter();
         startTimedRedraws();
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_PROJECT_CHANGED,processProjectChange);
      }
      
      [Bindable(event="propertyChange")]
      public function get gameStatusString2() : String
      {
         return this._1729080547gameStatusString2;
      }
      
      protected function redrawGridOnMap(param1:BitmapData, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(Boolean(param1) && zoomLevel >= 0.5)
         {
            _loc4_ = mapPiece.width * MgbSystem.tileMinWidth - param2;
            _loc5_ = mapPiece.height * MgbSystem.tileMinHeight - param3;
            _loc6_ = zoomLevel >= 1 ? 1 : 2;
            if(showGrid())
            {
               _loc7_ = 0;
               while(_loc7_ <= _loc4_)
               {
                  param1.fillRect(new Rectangle(_loc7_ - param2 % MgbSystem.tileMinWidth,0,_loc6_,_loc5_ + 1),4026531840);
                  _loc7_ += MgbSystem.tileMinWidth;
               }
               _loc8_ = 0;
               while(_loc8_ <= _loc5_)
               {
                  param1.fillRect(new Rectangle(0,_loc8_ - param3 % MgbSystem.tileMinHeight,_loc4_ + 1,_loc6_),4026531840);
                  _loc8_ += MgbSystem.tileMinHeight;
               }
            }
            param1.fillRect(new Rectangle(_loc4_,0,1,_loc5_ + 1),4026531840);
            param1.fillRect(new Rectangle(0,_loc5_,_loc4_ + 1,1),4026531840);
         }
      }
      
      public function next_zoomLevel(param1:Number = -1) : void
      {
         if(-1 == param1)
         {
            zoomLevel *= 2;
         }
         else
         {
            zoomLevel = param1;
         }
         if(zoomLevel > maxZoomLevel)
         {
            zoomLevel = minZoomLevel;
         }
         applyZoomLevel();
      }
      
      public function set gameEngineMode(param1:String) : void
      {
         var _loc2_:Object = this._291707031gameEngineMode;
         if(_loc2_ !== param1)
         {
            this._291707031gameEngineMode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameEngineMode",_loc2_,param1));
         }
      }
      
      protected function removeGe2Events(param1:String) : void
      {
         switch(param1)
         {
            case GameEngine.GE_EDIT:
               throw new Error("Should be handled by subclass");
            case GameEngine.GE_PLAY:
         }
      }
      
      private function enablePlayerControls() : void
      {
         clearPlayerKeys();
         stage.addEventListener(KeyboardEvent.KEY_DOWN,playHandleKeyEvents);
         stage.addEventListener(KeyboardEvent.KEY_UP,playHandleKeyEvents);
      }
      
      private function ticAdd(param1:int, param2:int, param3:int) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc4_:ActiveActor = activeActors[param3];
         var _loc5_:int = mapPiece.width;
         var _loc6_:int = mapPiece.height;
         var _loc7_:int = _loc4_.cellSpanX;
         var _loc8_:int = _loc4_.cellSpanY;
         param1 += _loc4_.renderOffsetCellsX;
         param2 += _loc4_.renderOffsetCellsY;
         _loc7_ += _loc4_.renderOffsetCellsWidth;
         _loc8_ += _loc4_.renderOffsetCellsHeight;
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_ && param1 + _loc9_ < _loc5_)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc8_ && param2 + _loc10_ < _loc6_)
            {
               if(param1 + _loc9_ >= 0 && param2 + _loc10_ >= 0)
               {
                  _loc11_ = param1 + _loc9_ + (param2 + _loc10_) * _loc5_;
                  if(G_tic[_loc11_] == null)
                  {
                     G_tic[_loc11_] = new Array();
                  }
                  G_tic[_loc11_][G_tic[_loc11_].length] = param3;
               }
               _loc10_++;
            }
            _loc9_++;
         }
      }
      
      public function set backgroundMusicCurrentSource(param1:String) : void
      {
         var _loc2_:Object = this._2089343645backgroundMusicCurrentSource;
         if(_loc2_ !== param1)
         {
            this._2089343645backgroundMusicCurrentSource = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundMusicCurrentSource",_loc2_,param1));
         }
      }
      
      private function playHandleKeyEvents(param1:KeyboardEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:MgbActor = null;
         if(!G_gameOver && !transitionInProgress)
         {
            _loc2_ = param1.type == KeyboardEvent.KEY_DOWN ? true : false;
            _loc3_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[AA_player_idx].ACidx));
            switch(param1.keyCode)
            {
               case Keyboard.DELETE:
                  if(_loc2_)
                  {
                     toggleInventory();
                  }
                  break;
               case Keyboard.LEFT:
                  if(_loc3_.actorXML.databag.allchar.leftYN)
                  {
                     G_player_action_left = _loc2_;
                  }
                  ++mgbSession.activityPerHeartbeat;
                  break;
               case Keyboard.RIGHT:
                  if(_loc3_.actorXML.databag.allchar.rightYN)
                  {
                     G_player_action_right = _loc2_;
                  }
                  ++mgbSession.activityPerHeartbeat;
                  break;
               case Keyboard.UP:
                  if(_loc3_.actorXML.databag.allchar.upYN)
                  {
                     G_player_action_up = _loc2_;
                  }
                  ++mgbSession.activityPerHeartbeat;
                  break;
               case Keyboard.DOWN:
                  if(_loc3_.actorXML.databag.allchar.downYN)
                  {
                     G_player_action_down = _loc2_;
                  }
                  ++mgbSession.activityPerHeartbeat;
                  break;
               case Keyboard.SPACE:
                  if(_loc3_.actorXML.databag.allchar.pushYN)
                  {
                     G_player_action_push = _loc2_;
                  }
                  ++mgbSession.activityPerHeartbeat;
                  break;
               case Keyboard.END:
               case 77:
                  G_player_action_melee = _loc2_;
                  ++mgbSession.activityPerHeartbeat;
                  break;
               case Keyboard.CONTROL:
                  if(Boolean(pauseGame) && _loc2_)
                  {
                     hideNpcMessage();
                  }
                  else if(!pauseGame && _loc2_)
                  {
                     doPauseGame();
                  }
                  ++mgbSession.activityPerHeartbeat;
                  break;
               case Keyboard.ENTER:
                  if(_loc3_.actorXML.databag.allchar.shotRateNum)
                  {
                     G_player_action_shoot = _loc2_;
                  }
                  ++mgbSession.activityPerHeartbeat;
            }
         }
      }
      
      private function stopMusic() : void
      {
         if(backgroundMusicSoundChannel)
         {
            backgroundMusicSoundChannel.stop();
            backgroundMusicSoundChannel = null;
         }
         backgroundMusicCurrentSource = null;
         backgroundMusicStatus = null;
      }
      
      private function actorCanShoot(param1:int) : Boolean
      {
         var _loc2_:int = param1 == AA_player_idx ? int(inventory.equipmentShotRateBonus) : 0;
         return Boolean(activeActors[param1].alive) && _loc2_ + activeActors[param1].maxActiveShots > activeActors[param1].currentActiveShots;
      }
      
      public function playGame() : Boolean
      {
         var _loc3_:MgbActor = null;
         setGameStatusString("Starting game");
         clearGameStatusString2();
         pauseGame = false;
         hideNpcMessage();
         respawnMemory = new Array();
         cancelAllSpawnedActorsForAutoRespawn();
         initialMap = new MgbMap();
         initialMap.loadPieceFromPiece(mapPiece);
         var _loc1_:int = int(playPrepareActiveLayer(mapPiece));
         if(0 == _loc1_)
         {
            Alert.show(setGameStatusString("No player defined for this map"));
            return false;
         }
         if(_loc1_ > 1)
         {
            Alert.show(setGameStatusString("A map can only have one player on it; this map has " + _loc1_ + " player actors on the map"));
            return false;
         }
         playPrepareBackgroundLayer();
         transitionStateWaitingForActorLoadRequests = false;
         transitionInProgress = false;
         G_tweenCount = 0;
         enablePlayerControls();
         addEventListener("enterFrame",onTickGameDo);
         G_gameOver = false;
         var _loc2_:Date = new Date();
         G_gameStartedAtMS = _loc2_.getTime();
         inventory = new Inventory();
         if(!mgbSession.alertOnceAboutKeys)
         {
            _loc3_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[AA_player_idx].ACidx));
            showNpcMessage({
               "message":"Use the arrow keys to move/push and \'Enter\' to shoot (if allowed)",
               "leftActor":_loc3_
            });
            mgbSession.alertOnceAboutKeys = true;
         }
         return true;
      }
      
      private function playFindAACollisions() : Array
      {
         var _loc6_:int = 0;
         var _loc7_:ActiveActor = null;
         var _loc8_:ActiveActor = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Array = null;
         var _loc1_:Array = new Array();
         if(null == G_tic)
         {
            generateTicTable();
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < G_tic.length)
         {
            if(Boolean(G_tic[_loc5_]) && G_tic[_loc5_].length > 1)
            {
               _loc2_ = 0;
               while(_loc2_ < G_tic[_loc5_].length)
               {
                  _loc6_ = int(G_tic[_loc5_][_loc2_]);
                  if((_loc7_ = activeActors[_loc6_]).alive)
                  {
                     _loc3_ = _loc2_;
                     while(_loc3_ < G_tic[_loc5_].length)
                     {
                        _loc4_ = int(G_tic[_loc5_][_loc3_]);
                        if((_loc8_ = activeActors[_loc4_]).alive && _loc6_ < _loc4_)
                        {
                           _loc9_ = _loc7_.renderX + _loc7_.renderOffsetCellsX * MgbSystem.tileMinWidth;
                           _loc10_ = _loc7_.renderY + _loc7_.renderOffsetCellsY * MgbSystem.tileMinHeight;
                           _loc11_ = _loc7_.renderBD.width - 1 + _loc7_.renderOffsetCellsWidth * MgbSystem.tileMinWidth;
                           _loc12_ = _loc7_.renderBD.height - 1 + _loc7_.renderOffsetCellsHeight * MgbSystem.tileMinHeight;
                           _loc13_ = _loc8_.renderX + _loc8_.renderOffsetCellsX * MgbSystem.tileMinWidth;
                           _loc14_ = _loc8_.renderBD.width - 1 + _loc8_.renderOffsetCellsWidth * MgbSystem.tileMinWidth;
                           if(_loc9_ >= _loc13_ && _loc9_ < _loc13_ + _loc14_ || _loc13_ >= _loc9_ && _loc13_ < _loc9_ + _loc11_)
                           {
                              _loc15_ = _loc8_.renderY + _loc8_.renderOffsetCellsY * MgbSystem.tileMinHeight;
                              _loc16_ = _loc8_.renderBD.height - 1 + _loc8_.renderOffsetCellsHeight * MgbSystem.tileMinHeight;
                              if(_loc10_ >= _loc15_ && _loc10_ < _loc15_ + _loc16_ || _loc15_ >= _loc10_ && _loc15_ < _loc10_ + _loc12_)
                              {
                                 if(_loc7_.renderBD.hitTest(new Point(_loc9_,_loc10_),240,_loc8_.renderBD,new Point(_loc13_,_loc15_),240))
                                 {
                                    if(_loc4_ == AA_player_idx)
                                    {
                                       _loc1_.push(new ActorCollision(_loc4_,_loc6_));
                                    }
                                    else
                                    {
                                       _loc1_.push(new ActorCollision(_loc6_,_loc4_));
                                    }
                                 }
                              }
                           }
                        }
                        _loc3_++;
                     }
                  }
                  _loc2_++;
               }
            }
            _loc5_++;
         }
         if(_loc1_.length > 1)
         {
            _loc1_.sort(sortOnChoice);
            (_loc17_ = new Array())[0] = _loc1_[0];
            _loc2_ = 1;
            while(_loc2_ < _loc1_.length)
            {
               if(_loc1_[_loc2_].AA1 != _loc17_[_loc17_.length - 1].AA1 || _loc1_[_loc2_].AA2 != _loc17_[_loc17_.length - 1].AA2)
               {
                  _loc17_.push(_loc1_[_loc2_]);
               }
               _loc2_++;
            }
            _loc1_ = _loc17_;
         }
         return _loc1_;
      }
      
      private function askDeferredNpcQuestion() : void
      {
         if(deferredAsk_aa != null && deferredAsk_ap != null)
         {
            askNpcQuestion(deferredAsk_aa,deferredAsk_ap);
            deferredAsk_aa = null;
            deferredAsk_ap = null;
         }
      }
      
      private function playMusic(param1:String) : void
      {
         var _loc2_:String = String(MgbMusicUrls.musicUrlFromMusicFileName(param1));
         if(backgroundMusicCurrentSource != param1)
         {
            if(backgroundMusicSound)
            {
               backgroundMusicSound.removeEventListener(Event.COMPLETE,musicLoadedHandler);
               backgroundMusicSound.removeEventListener(IOErrorEvent.IO_ERROR,musicLoadFailedHandler);
               backgroundMusicSound.removeEventListener(IOErrorEvent.IO_ERROR,musicProgressHandler);
            }
            stopMusic();
            backgroundMusicSound = new Sound();
            backgroundMusicSound.addEventListener(Event.COMPLETE,musicLoadedHandler);
            backgroundMusicSound.addEventListener(IOErrorEvent.IO_ERROR,musicLoadFailedHandler);
            backgroundMusicSound.addEventListener(ProgressEvent.PROGRESS,musicProgressHandler);
            backgroundMusicSound.load(new URLRequest(_loc2_));
            backgroundMusicCurrentSource = param1;
         }
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:int = GameEngine.GE_EDIT == gameEngineMode ? 1 : 0;
         measuredHeight = zoomLevel * computeMapPixelHeight() + _loc1_;
         measuredMinHeight = measuredHeight;
         measuredWidth = zoomLevel * computeMapPixelWidth() + _loc1_;
         measuredMinWidth = measuredWidth;
         redrawMap();
      }
      
      private function musicLoadedHandler(param1:Event) : void
      {
         backgroundMusicSoundChannel = backgroundMusicSound.play(0,10000);
         backgroundMusicStatus = "Playing music";
      }
      
      private function musicLoadFailedHandler(param1:IOErrorEvent) : void
      {
         trace("music load failed");
         backgroundMusicStatus = "Music file not found";
      }
      
      private function NpcDialogEventHandler(param1:NpcDialogEvent) : void
      {
         var _loc7_:MgbActor = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:InventoryItem = null;
         var _loc12_:String = null;
         var _loc2_:String = null;
         var _loc3_:* = null;
         var _loc4_:int = 1;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         if(npcDialogActor != null && npcDialogActor.ACidx != null)
         {
            _loc7_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,npcDialogActor.ACidx));
         }
         switch(param1.choice)
         {
            case 0:
               break;
            case 1:
               _loc2_ = String(_loc7_.actorXML.databag.npc.dropsObjectOnChoice1);
               _loc4_ = int(_loc7_.actorXML.databag.npc.responseChoice1StayYN);
               _loc5_ = int(_loc7_.actorXML.databag.npc.responseChoice1DropPersistsYN);
               _loc3_ = String(_loc7_.actorXML.databag.npc.saysWhatOnChoice1);
               _loc8_ = String(_loc7_.actorXML.databag.npc.takesObjectOnChoice1);
               _loc9_ = int(_loc7_.actorXML.databag.npc.takeObjectTypeOnChoice1);
               _loc10_ = int(_loc7_.actorXML.databag.npc.takesObjectCountOnChoice1Num);
               break;
            case 2:
               _loc2_ = String(_loc7_.actorXML.databag.npc.dropsObjectOnChoice2);
               _loc4_ = int(_loc7_.actorXML.databag.npc.responseChoice2StayYN);
               _loc5_ = int(_loc7_.actorXML.databag.npc.responseChoice2DropPersistsYN);
               _loc3_ = String(_loc7_.actorXML.databag.npc.saysWhatOnChoice2);
               _loc8_ = String(_loc7_.actorXML.databag.npc.takesObjectOnChoice2);
               _loc9_ = int(_loc7_.actorXML.databag.npc.takeObjectTypeOnChoice2);
               _loc10_ = int(_loc7_.actorXML.databag.npc.takesObjectCountOnChoice2Num);
               break;
            case 3:
               _loc2_ = String(_loc7_.actorXML.databag.npc.dropsObjectOnChoice3);
               _loc4_ = int(_loc7_.actorXML.databag.npc.responseChoice3StayYN);
               _loc5_ = int(_loc7_.actorXML.databag.npc.responseChoice3DropPersistsYN);
               _loc3_ = String(_loc7_.actorXML.databag.npc.saysWhatOnChoice3);
               _loc8_ = String(_loc7_.actorXML.databag.npc.takesObjectOnChoice3);
               _loc9_ = int(_loc7_.actorXML.databag.npc.takeObjectTypeOnChoice3);
               _loc10_ = int(_loc7_.actorXML.databag.npc.takesObjectCountOnChoice3Num);
         }
         if(Boolean(_loc8_) && _loc8_ == "")
         {
            _loc8_ = null;
         }
         if(_loc8_)
         {
            if(_loc10_ <= 0)
            {
               _loc10_ = 1;
            }
            if(!(_loc11_ = inventory.get(_loc8_)) || _loc11_.count < _loc10_)
            {
               if(_loc10_ == 1)
               {
                  _loc3_ = "You don\'t have the " + _loc8_ + " to give me.";
               }
               else
               {
                  _loc3_ = "You don\'t have enough " + _loc8_ + " to give me. I want " + String(_loc10_);
               }
               _loc2_ = null;
               _loc4_ = 1;
            }
            else
            {
               switch(_loc9_)
               {
                  case MgbActor.alNpcTakeType_Take:
                     if(false == inventory.removeByName(_loc8_,_loc10_))
                     {
                        _loc3_ = "You don\'t have the " + _loc8_ + " to give me...";
                        _loc2_ = null;
                        _loc4_ = 1;
                     }
                     break;
                  case MgbActor.alNpcTakeType_Require:
                     if(null == inventory.get(_loc8_))
                     {
                        _loc3_ = "You don\'t have the " + _loc8_ + " with you...";
                        _loc2_ = null;
                        _loc4_ = 1;
                     }
               }
            }
         }
         switch(_loc4_)
         {
            case MgbActor.alNpcDialogFinalAction_disappear:
               npcDialogActor.health = 0;
               break;
            case MgbActor.alNpcDialogFinalAction_stay:
               break;
            case MgbActor.alNpcDialogFinalAction_repeat:
               _loc6_ = true;
         }
         if(_loc2_)
         {
            playSpawnNewActor(_loc2_,npcDialogActor.x,npcDialogActor.y + (npcDialogActor.health == 0 ? 0 : npcDialogActor.cellSpanY),true,!!_loc5_ ? true : false);
         }
         if(_loc3_)
         {
            _loc12_ = String(MgbSystem.gameFonts[int(_loc7_.actorXML.databag.npc.talkTextFontIndex)]);
            showNpcMessage({
               "message":_loc3_,
               "leftActor":_loc7_,
               "font":_loc12_
            },npcDialogActor);
            if(_loc6_)
            {
               askNpcQuestion(npcDialogActor,_loc7_,true);
            }
         }
         else if(_loc6_)
         {
            askNpcQuestion(npcDialogActor,_loc7_);
         }
         else
         {
            hideNpcMessage();
         }
      }
      
      protected function cell(param1:int, param2:int, param3:Boolean = false) : int
      {
         if(param3 && param2 > mapPiece.height || param1 > mapPiece.width || param2 < 0 || param1 < 0)
         {
            return -1;
         }
         return param2 * mapPiece.width + param1;
      }
      
      private function endGame() : void
      {
         stopMusic();
         pauseGame = false;
         hideNpcMessage();
         hideInventory();
         disablePlayerControls();
         removeEventListener("enterFrame",onTickGameDo);
         G_gameOver = true;
         G_tic = null;
         gameEngineMode = GameEngine.GE_EDIT;
         playCleanupActiveLayer();
         playCleanupBackgroundLayer();
         mapPiece.loadPieceFromPiece(initialMap);
         initialMap = null;
         var _loc1_:Container = Container(parent);
         _loc1_.horizontalScrollPosition = 0;
         _loc1_.verticalScrollPosition = 0;
         view.alpha = 1;
         applyZoomLevel();
         setGameStatusString("Game Over");
         clearGameStatusString2();
         activeActors = new Array();
         respawnMemory = new Array();
         cancelAllSpawnedActorsForAutoRespawn();
      }
      
      [Bindable(event="propertyChange")]
      protected function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function printMap() : void
      {
         var printJob:FlexPrintJob = null;
         var z:Number = NaN;
         var ow:Number = NaN;
         var oh:Number = NaN;
         try
         {
            printJob = new FlexPrintJob();
            if(printJob.start())
            {
               z = zoomLevel;
               ow = width;
               oh = height;
               redrawMap(width = Math.min(MgbSystem.FlashLargestBitmapWidth,mapPiece.width * MgbSystem.tileMinWidth),height = Math.min(MgbSystem.FlashLargestBitmapHeight,mapPiece.width * MgbSystem.tileMinHeight),0,0);
               printJob.addObject(this,FlexPrintJobScaleType.SHOW_ALL);
               view.scaleX = 1;
               view.scaleY = 1;
               printJob.send();
               width = ow;
               height = oh;
               view.scaleX = z;
               view.scaleY = z;
               redrawMap();
            }
         }
         catch(err:Error)
         {
            MgbLogger.getInstance().logException("printMap()",err);
         }
         tagCheck("print");
      }
      
      private function checkForTouchDamageAtStartOfTween() : void
      {
         var _loc2_:ActiveActor = null;
         var _loc3_:MgbActor = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:MgbActor = null;
         var _loc15_:int = 0;
         G_tic = null;
         generateTicTable();
         var _loc1_:int = 0;
         while(_loc1_ < activeActors.length)
         {
            _loc2_ = activeActors[_loc1_];
            _loc3_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc2_.ACidx));
            _loc4_ = int(_loc3_.actorXML.databag.allchar.touchDamageToNPCorItemNum);
            _loc5_ = int(_loc3_.actorXML.databag.allchar.touchDamageToPlayerNum);
            if((_loc6_ = int(_loc3_.actorXML.databag.allchar.touchDamageCases)) != MgbActor.alTouchDamageCases_WhenOverlapped && _loc2_.alive == true && (_loc4_ != 0 || _loc5_ != 0))
            {
               _loc7_ = new Array();
               if(_loc6_ == MgbActor.alTouchDamageCases_WhenAdjacent)
               {
                  _loc9_ = 0;
                  while(_loc9_ < 4)
                  {
                     addCellsActorIsFacingToCellList(_loc7_,_loc2_,_loc9_);
                     _loc9_++;
                  }
               }
               else
               {
                  addCellsActorIsFacingToCellList(_loc7_,_loc2_,_loc2_.stepStyle);
               }
               _loc8_ = 0;
               while(_loc8_ < _loc7_.length)
               {
                  _loc10_ = int(_loc7_[_loc8_]);
                  if(Boolean(G_tic[_loc10_]) && G_tic[_loc10_].length > 0)
                  {
                     _loc11_ = 0;
                     while(_loc11_ < G_tic[_loc10_].length)
                     {
                        _loc12_ = int(G_tic[_loc10_][_loc11_]);
                        _loc13_ = String(activeActors[_loc12_].ACidx);
                        _loc14_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc13_));
                        _loc15_ = _loc12_ == this.AA_player_idx ? _loc5_ : _loc4_;
                        if(_loc12_ != _loc1_ && 0 == _loc14_.actorXML.databag.item.pushToSlideNum)
                        {
                           applyDamageToActor(_loc12_,_loc14_,_loc15_,int(_loc3_.actorXML.databag.allchar.touchDamageAttackChance));
                        }
                        _loc11_++;
                     }
                  }
                  _loc8_++;
               }
            }
            _loc1_++;
         }
      }
      
      private function musicProgressHandler(param1:ProgressEvent) : void
      {
         var _loc2_:int = 100 * param1.bytesLoaded / param1.bytesTotal;
         backgroundMusicStatus = new String("Loading Music ... " + String(_loc2_) + "%");
      }
      
      [Bindable(event="propertyChange")]
      public function get zoomLevel() : Number
      {
         return this._1634857841zoomLevel;
      }
      
      public function set gameStatusString(param1:String) : void
      {
         var _loc2_:Object = this._1718344779gameStatusString;
         if(_loc2_ !== param1)
         {
            this._1718344779gameStatusString = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameStatusString",_loc2_,param1));
         }
      }
      
      private function chooseActiveActorDisplayTile(param1:int) : void
      {
         var _loc2_:MgbActor = null;
         var _loc6_:MgbTile = null;
         activeActors[param1].renderOffsetCellsX = 0;
         activeActors[param1].renderOffsetCellsY = 0;
         activeActors[param1].renderOffsetCellsWidth = 0;
         activeActors[param1].renderOffsetCellsHeight = 0;
         if(param1 == AA_player_idx && Boolean(inventory.equipmentNewActorGraphics))
         {
            _loc2_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,inventory.equipmentNewActorGraphics));
         }
         else
         {
            _loc2_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[param1].ACidx));
         }
         var _loc3_:int = int(getAnimationIndex(_loc2_,activeActors[param1].xMovePerTween == 0 && activeActors[param1].yMovePerTween == 0 ? -1 : int(activeActors[param1].stepStyle),activeActors[param1].stepStyle,G_tweenCount,activeActors[param1].meleeStep));
         if(activeActors[param1].inMelee())
         {
            if(_loc3_ == -1)
            {
               _loc3_ = int(getAnimationIndex(_loc2_,activeActors[param1].xMovePerTween == 0 && activeActors[param1].yMovePerTween == 0 ? -1 : int(activeActors[param1].stepStyle),activeActors[param1].stepStyle,G_tweenCount));
            }
            else if(activeActors[param1].inMelee())
            {
               activeActors[param1].renderOffsetCellsX = -1;
               activeActors[param1].renderOffsetCellsY = -1;
               activeActors[param1].renderOffsetCellsWidth = 2;
               activeActors[param1].renderOffsetCellsHeight = 2;
            }
         }
         var _loc4_:String = String(getAnimationTileFromIndex(_loc2_,_loc3_));
         var _loc5_:String = String(getAnimationEffectFromIndex(_loc2_,_loc3_));
         if(_loc4_ != "")
         {
            if((_loc6_ = MgbTile(tileCache.getPiece(mapPiece.userName,mapPiece.projectName,_loc4_))) && _loc6_.loadPending == false && Boolean(_loc6_.bitmapData))
            {
               activeActors[param1].renderBD = _loc6_.bitmapDataVariant(_loc5_);
            }
         }
      }
      
      private function getTileHandler(param1:MgbTile) : void
      {
         --actorLoadsPending;
         pleaseRedrawMapSoon();
         if(0 == actorLoadsPending && 0 == actorLoadsFailed)
         {
            notifyThatGameIsReadyToPlay();
         }
         else if(0 != actorLoadsFailed)
         {
            setGameStatusString("Failed to load " + actorLoadsFailed + " actors in this map. They may have been deleted");
         }
         else
         {
            setGameStatusString("Loading game... " + actorLoadsPending + " actors still to be loaded");
         }
      }
      
      public function tagCheck(param1:String) : void
      {
         ActiveTutorial.getInstance().tutorialTagCheck("mapmaker_" + param1);
      }
      
      private function set inventoryDialog(param1:InventoryDialog) : void
      {
         var _loc2_:Object = this._1810526780inventoryDialog;
         if(_loc2_ !== param1)
         {
            this._1810526780inventoryDialog = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inventoryDialog",_loc2_,param1));
         }
      }
      
      private function reduceDamageByPlayerArmor(param1:int) : int
      {
         var _loc2_:Number = param1 * (100 - inventory.equipmentArmorEffect) / 100;
         if(_loc2_ < 1 && param1 >= 1)
         {
            _loc2_ = Math.random() < _loc2_ ? 1 : 0;
         }
         return _loc2_ > 0 ? int(_loc2_) : 0;
      }
      
      private function preloadThisMap() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         actorLoadsPending = 0;
         var _loc1_:String = mapPiece.userName;
         var _loc2_:String = mapPiece.projectName;
         var _loc3_:int = 0;
         while(_loc3_ < MgbMap.layerVisibleActorsCount)
         {
            _loc4_ = mapPiece.width * mapPiece.height;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if((_loc6_ = String(mapPiece.mapLayerActors[_loc3_][_loc5_])) != null && MgbActor(actorCache.getPieceIfCached(_loc1_,_loc2_,_loc6_)) == null)
               {
                  loadActorByName(_loc6_);
               }
               _loc5_++;
            }
            _loc3_++;
         }
         if(actorLoadsPending == 0)
         {
            notifyThatGameIsReadyToPlay();
         }
      }
      
      public function newMap(param1:int = 64, param2:int = 48) : void
      {
         initialMap = null;
         mapPiece.mapInitialize(param1,param2);
         mapPiece.userName = mgbSession.userName;
         mapPiece.projectName = mgbSession.activeProject;
         prepareMapEditResoures();
      }
      
      public function stopGameIfPlaying() : void
      {
         if(GameEngine.GE_PLAY == gameEngineMode && false == G_gameOver)
         {
            endGame();
         }
      }
      
      private function onTickGameDo(param1:Event) : void
      {
         var _loc9_:ActiveActor = null;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:Object = null;
         var _loc14_:ActiveActor = null;
         var _loc15_:MgbActor = null;
         var _loc16_:int = 0;
         var _loc17_:* = 0;
         var _loc18_:MgbActor = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:String = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:String = null;
         var _loc27_:MgbActor = null;
         var _loc28_:int = 0;
         var _loc29_:String = null;
         var _loc30_:InventoryItem = null;
         var _loc31_:* = false;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:MgbActor = null;
         var _loc36_:Boolean = false;
         var _loc37_:String = null;
         var _loc38_:int = 0;
         var _loc39_:Point = null;
         var _loc40_:GameEngineEvent = null;
         if(transitionInProgress)
         {
            transitionTick();
            return;
         }
         if(pauseGame)
         {
            return;
         }
         if(G_tweenSinceMapStarted % stage.frameRate == 0)
         {
            checkForGeneratedActorsThisSecond();
         }
         if(0 == G_tweenCount)
         {
            askDeferredNpcQuestion();
            _loc9_ = activeActors[AA_player_idx];
            _loc10_ = cell(_loc9_.x,_loc9_.y);
            if(_loc11_ = String(mapPiece.mapLayerActors[MgbMap.layerEvents][_loc10_]))
            {
               if((_loc13_ = CommandEngine.parse(_loc11_)).command == "jump")
               {
                  trace("event: " + _loc11_);
                  transitionToNewMap(mapPiece.userName,mapPiece.projectName,_loc13_.mapname,_loc13_.x,_loc13_.y);
                  return;
               }
               if(_loc13_.command == "music")
               {
                  if(MgbActor.isSoundNonNull(_loc13_.source))
                  {
                     playMusic(_loc13_.source);
                  }
                  else
                  {
                     stopMusic();
                  }
               }
            }
            G_tic = null;
            checkForTouchDamageAtStartOfTween();
            _loc12_ = 0;
            while(_loc12_ < activeActors.length)
            {
               _loc14_ = activeActors[_loc12_];
               _loc15_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc14_.ACidx));
               if(_loc14_.alive == true && _loc14_.moveSpeed > 0)
               {
                  _loc16_ = _loc14_.stepStyle;
                  _loc17_ = -1;
                  _loc14_.fromx = _loc14_.x;
                  _loc14_.fromy = _loc14_.y;
                  _loc18_ = null;
                  _loc19_ = 0;
                  while(_loc19_ < _loc14_.cellSpanX)
                  {
                     _loc20_ = 0;
                     while(_loc20_ < _loc14_.cellSpanY)
                     {
                        if((_loc21_ = cell(_loc14_.x + _loc19_,_loc14_.y + _loc20_,true)) >= 0)
                        {
                           if((_loc18_ = !!(_loc22_ = String(mapPiece.mapLayerActors[MgbMap.layerBackground][_loc21_])) ? MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc22_)) : null) && _loc18_.actorXML && _loc18_.actorXML.databag.all.actorType == MgbActor.alActorType_Item && (int(_loc18_.actorXML.databag.item.itemActivationType) == MgbActor.alItemActivationType_CausesDamage || int(_loc18_.actorXML.databag.item.itemActivationType) == MgbActor.alItemActivationType_PushesActors))
                           {
                              break;
                           }
                           _loc18_ = null;
                        }
                        _loc20_++;
                     }
                     _loc19_++;
                  }
                  if(Boolean(_loc18_) && Boolean(int(_loc18_.actorXML.databag.item.itemActivationType == MgbActor.alItemActivationType_PushesActors)))
                  {
                     switch(int(_loc18_.actorXML.databag.item.itemPushesActorType))
                     {
                        case MgbActor.alItemPushesActorType_up:
                        case MgbActor.alItemPushesActorType_right:
                        case MgbActor.alItemPushesActorType_down:
                        case MgbActor.alItemPushesActorType_left:
                           _loc17_ = int(_loc18_.actorXML.databag.item.itemPushesActorType);
                           break;
                        case MgbActor.alItemPushesActorType_onwards:
                           if(!_loc14_.wasStopped)
                           {
                              _loc17_ = _loc16_;
                           }
                           break;
                        case MgbActor.alItemPushesActorType_backwards:
                           if(_loc16_ >= 0)
                           {
                              _loc17_ = _loc16_ ^ 2;
                           }
                           break;
                        case MgbActor.alItemPushesActorType_random:
                           _loc17_ = Math.floor(Math.random() * 4);
                     }
                  }
                  if(Boolean(_loc18_) && int(_loc18_.actorXML.databag.item.itemActivationType) == MgbActor.alItemActivationType_CausesDamage)
                  {
                     applyDamageToActor(_loc12_,_loc15_,int(_loc18_.actorXML.databag.item.healOrHarmWhenUsedNum));
                  }
                  if(_loc12_ == AA_player_idx)
                  {
                     calculateNewPlayerPosition(_loc17_);
                  }
                  else
                  {
                     calculateNewEnemyPosition(_loc12_,_loc17_);
                  }
                  if(_loc14_.alive == true && (Boolean(checkIfActorObstructed(_loc12_,true)) || _loc14_.y < 0 || _loc14_.x < 0 || _loc14_.x + _loc14_.cellSpanX > mapPiece.width || _loc14_.y + _loc14_.cellSpanY > mapPiece.height))
                  {
                     _loc23_ = cell(_loc14_.x,_loc14_.y);
                     _loc14_.x = _loc14_.fromx;
                     _loc14_.y = _loc14_.fromy;
                     _loc14_.wasStopped = true;
                     _loc14_.stepCount = 0;
                     if(_loc12_ == AA_player_idx)
                     {
                        if(G_tic == null)
                        {
                           generateTicTable();
                        }
                        if(Boolean(G_tic[_loc23_]) && G_tic[_loc23_].length > 0)
                        {
                           _loc24_ = 0;
                           while(_loc24_ < G_tic[_loc23_].length)
                           {
                              _loc25_ = int(G_tic[_loc23_][_loc24_]);
                              _loc26_ = String(activeActors[_loc25_].ACidx);
                              _loc27_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc26_));
                              _loc28_ = int(_loc27_.actorXML.databag.item.itemActivationType);
                              if(Boolean(activeActors[_loc25_].alive) && _loc25_ != _loc12_)
                              {
                                 if(activeActors[_loc25_].type == MgbActor.alActorType_NPC)
                                 {
                                    askNpcQuestion(activeActors[_loc25_],_loc27_);
                                 }
                                 else if(activeActors[_loc25_].type == MgbActor.alActorType_Item && (_loc28_ == MgbActor.alItemActivationType_BlocksPlayer || _loc28_ == MgbActor.alItemActivationType_BlocksPlayerAndNPC))
                                 {
                                    if((_loc29_ = String(_loc27_.actorXML.databag.item.keyForThisDoor)) != null && _loc29_ != "")
                                    {
                                       if(_loc30_ = inventory.get(_loc29_))
                                       {
                                          _loc31_ = 1 == int(_loc27_.actorXML.databag.item.keyForThisDoorConsumedYN);
                                          setGameStatusString2(_loc31_ ? "You use your " + _loc29_ + " to pass" : "Since you are carrying the " + _loc29_ + " you are able to pass through");
                                          if(_loc31_)
                                          {
                                             inventory.remove(_loc30_);
                                          }
                                          activeActors[_loc25_].health = 0;
                                       }
                                    }
                                 }
                              }
                              _loc24_++;
                           }
                        }
                     }
                     if(_loc14_.isSliding)
                     {
                        if(1 == int(_loc15_.actorXML.databag.item.squishNPCYN) || _loc14_.isAShot && (_loc14_.shotDamageToNPC != 0 || _loc14_.shotDamageToPlayer != 0))
                        {
                           if(G_tic == null)
                           {
                              generateTicTable();
                           }
                           if(Boolean(G_tic[_loc23_]) && G_tic[_loc23_].length > 0)
                           {
                              _loc24_ = 0;
                              while(_loc24_ < G_tic[_loc23_].length)
                              {
                                 _loc25_ = int(G_tic[_loc23_][_loc24_]);
                                 _loc26_ = String(activeActors[_loc25_].ACidx);
                                 _loc27_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc26_));
                                 _loc32_ = 0;
                                 if(activeActors[_loc25_].alive && _loc25_ != _loc12_ && (activeActors[_loc25_].type == MgbActor.alActorType_NPC || activeActors[_loc25_].type == MgbActor.alActorType_Player))
                                 {
                                    if(_loc14_.isAShot)
                                    {
                                       if(_loc25_ == AA_player_idx)
                                       {
                                          if(!(activeActors[_loc25_].activePowerUntilTweenCount >= G_tweenSinceMapStarted && MgbActor.alGainPowerType_Invulnerable == activeActors[_loc25_].activePower))
                                          {
                                             _loc32_ = _loc14_.shotDamageToPlayer;
                                          }
                                       }
                                       else
                                       {
                                          _loc32_ = _loc14_.shotDamageToNPC;
                                       }
                                    }
                                    else
                                    {
                                       _loc32_ = int(activeActors[_loc25_].health);
                                    }
                                 }
                                 if(_loc32_)
                                 {
                                    applyDamageToActor(_loc25_,_loc27_,_loc32_);
                                 }
                                 _loc24_++;
                              }
                           }
                        }
                        if(_loc14_.alive)
                        {
                           playStopItemSliding(_loc14_);
                        }
                     }
                  }
                  else
                  {
                     _loc14_.wasStopped = false;
                  }
                  _loc14_.xMovePerTween = (_loc14_.x - _loc14_.fromx) * (MgbSystem.tileMinWidth / G_tweensPerTurn);
                  _loc14_.yMovePerTween = (_loc14_.y - _loc14_.fromy) * (MgbSystem.tileMinHeight / G_tweensPerTurn);
                  if(_loc14_.turnsBeforeMeleeReady > 0)
                  {
                     --_loc14_.turnsBeforeMeleeReady;
                  }
               }
               _loc12_++;
            }
            G_tic = null;
            scrollMapToSeePlayer();
            ++G_tweenCount;
            ++G_tweenSinceMapStarted;
         }
         _loc12_ = 0;
         while(_loc12_ < activeActors.length)
         {
            if(activeActors[_loc12_].alive)
            {
               chooseActiveActorDisplayTile(_loc12_);
               if(Boolean(activeActors[_loc12_].xMovePerTween) || Boolean(activeActors[_loc12_].yMovePerTween))
               {
                  _loc33_ = activeActors[_loc12_].xMovePerTween * G_tweenCount;
                  _loc34_ = activeActors[_loc12_].yMovePerTween * G_tweenCount;
                  activeActors[_loc12_].renderX = activeActors[_loc12_].fromx * MgbSystem.tileMinWidth + _loc33_;
                  activeActors[_loc12_].renderY = activeActors[_loc12_].fromy * MgbSystem.tileMinHeight + _loc34_;
               }
            }
            _loc12_++;
         }
         playProcessAACollisions();
         if(G_VSPdelta)
         {
            Container(parent).verticalScrollPosition = Container(parent).verticalScrollPosition + G_VSPdelta;
         }
         if(G_HSPdelta)
         {
            Container(parent).horizontalScrollPosition = Container(parent).horizontalScrollPosition + G_HSPdelta;
         }
         _loc12_ = 0;
         for(; _loc12_ < activeActors.length; _loc12_++)
         {
            if(!activeActors[_loc12_].alive)
            {
               continue;
            }
            _loc35_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[_loc12_].ACidx));
            if(activeActors[_loc12_].maxHealth != 0 && activeActors[_loc12_].health > activeActors[_loc12_].maxHealth)
            {
               activeActors[_loc12_].health = activeActors[_loc12_].maxHealth;
            }
            switch(activeActors[_loc12_].meleeStep)
            {
               case ActiveActor.MELEESTEP_NOT_IN_MELEE:
                  break;
               case 7:
                  activeActors[_loc12_].meleeStep = ActiveActor.MELEESTEP_NOT_IN_MELEE;
                  activeActors[_loc12_].turnsBeforeMeleeReady = _loc35_.actorXML.databag.allchar.meleeRepeatDelay;
                  if(_loc12_ == AA_player_idx && Boolean(inventory.equipmentMeleeRepeatDelayModifier))
                  {
                     activeActors[_loc12_].turnsBeforeMeleeReady += int(inventory.equipmentMeleeRepeatDelayModifier);
                  }
                  if(activeActors[_loc12_].turnsBeforeMeleeReady < 0)
                  {
                     activeActors[_loc12_].turnsBeforeMeleeReady = 0;
                  }
                  break;
               default:
                  ++activeActors[_loc12_].meleeStep;
            }
            switch(activeActors[_loc12_].type)
            {
               case MgbActor.alActorType_Player:
                  if(activeActors[_loc12_].health <= 0)
                  {
                     G_gameOver = true;
                  }
                  else if(activeActors[_loc12_].winLevel)
                  {
                     G_gameOver = true;
                  }
                  break;
               case MgbActor.alActorType_NPC:
               case MgbActor.alActorType_Item:
                  if(activeActors[_loc12_].health <= 0)
                  {
                     activeActors[_loc12_].health = 0;
                     activeActors[_loc12_].alive = false;
                     activeActors[_loc12_].dyingAnimationFrameCount = 1;
                     activeActors[AA_player_idx].score += int(_loc35_.actorXML.databag.itemOrNPC.scoreOrLosePointsWhenKilledByPlayerNum);
                     activeActors[_loc12_].renderBD = null;
                     switch(activeActors[_loc12_].creationCause)
                     {
                        case ActiveActor.CREATION_BY_MAP:
                           if(int(_loc35_.actorXML.databag.itemOrNPC.respawnOption) == MgbActor.alRespawnOption_Never && Boolean(activeActors[_loc12_].respawnId))
                           {
                              respawnMemory[activeActors[_loc12_].respawnId] = {
                                 "x":activeActors[_loc12_].x,
                                 "y":activeActors[_loc12_].y
                              };
                           }
                           break;
                        case ActiveActor.CREATION_BY_SPAWN:
                           cancelSpawnedActorForAutoRespawn(mapPiece.name,activeActors[_loc12_].respawnId);
                     }
                     _loc36_ = false;
                     if((Boolean(_loc37_ = String(_loc35_.actorXML.databag.itemOrNPC.dropsObjectWhenKilledName))) && _loc37_ != "")
                     {
                        if((_loc38_ = int(_loc35_.actorXML.databag.itemOrNPC.dropsObjectWhenKilledChance)) == 0 || 100 * Math.random() < _loc38_)
                        {
                           playSpawnNewActor(loadActorByName(_loc37_),activeActors[_loc12_].x,activeActors[_loc12_].y);
                           G_tic = null;
                           _loc36_ = true;
                        }
                     }
                     if((Boolean(_loc37_ = String(_loc35_.actorXML.databag.itemOrNPC.dropsObjectWhenKilledName2))) && _loc37_ != "")
                     {
                        if((_loc38_ = int(_loc35_.actorXML.databag.itemOrNPC.dropsObjectWhenKilledChance2)) == 0 || 100 * Math.random() < _loc38_)
                        {
                           _loc39_ = _loc36_ ? findAdjacentFreeCellForDrop(_loc12_,ActiveActor(activeActors[_loc12_]).stepStyle) : new Point(activeActors[_loc12_].x,activeActors[_loc12_].y);
                           playSpawnNewActor(loadActorByName(_loc37_),_loc39_.x,_loc39_.y);
                           G_tic = null;
                        }
                     }
                  }
                  break;
            }
         }
         checkForAppearingAndDisappearingActors();
         G_tweenCount = (G_tweenCount + 1) % (G_tweensPerTurn + 1);
         ++G_tweenSinceMapStarted;
         var _loc2_:String = "";
         if(Boolean(activeActors[AA_player_idx].activePower) && activeActors[AA_player_idx].activePowerUntilTweenCount >= G_tweenSinceMapStarted)
         {
            _loc2_ = "  Active Power = " + MgbActor.alGainPower[activeActors[AA_player_idx].activePower];
         }
         var _loc3_:Date = new Date();
         var _loc5_:int;
         var _loc4_:int;
         var _loc6_:int = (_loc5_ = (_loc4_ = (_loc3_.getTime() - G_gameStartedAtMS) / 1000) / 60) / 60;
         var _loc7_:String = "";
         if(_loc6_)
         {
            _loc7_ += _loc6_ + ":";
         }
         _loc7_ = (_loc7_ += (_loc5_ % 60 < 10 ? "0" : "") + _loc5_ % 60 + ".") + ((_loc4_ % 60 < 10 ? "0" : "") + _loc4_ % 60);
         var _loc8_:String = activeActors[AA_player_idx].maxHealth == 0 ? "" : "/" + activeActors[AA_player_idx].maxHealth;
         setGameStatusString("Health " + activeActors[AA_player_idx].health + _loc8_ + "     Score " + activeActors[AA_player_idx].score + _loc2_ + "     Time " + _loc7_);
         pleaseRedrawMapSoon();
         if(G_gameOver)
         {
            _loc40_ = new GameEngineEvent(GameEngineEvent.COMPLETED,initialMap.userName,initialMap.projectName,initialMap.name,true,_loc4_,activeActors[AA_player_idx].score);
            if(activeActors[this.AA_player_idx].winLevel)
            {
               Alert.show("Final Score: " + activeActors[AA_player_idx].score + ", Time: " + _loc7_,"You Win!");
            }
            else
            {
               Alert.show("G A M E   O V E R\n","They got you...");
               _loc40_.completedVictory = false;
            }
            dispatchEvent(_loc40_);
            endGame();
         }
      }
      
      private function applyZoomLevel() : void
      {
         if(view)
         {
            view.scaleX = view.scaleY = zoomLevel;
         }
         invalidateSize();
      }
      
      private function cancelSpawnedActorForAutoRespawn(param1:String, param2:String) : void
      {
         var _loc3_:Array = null;
         if(param2 != null && null != respawnMemoryAutoRespawningActors[param1])
         {
            _loc3_ = respawnMemoryAutoRespawningActors[param1];
            if(_loc3_[param2] != null)
            {
               _loc3_[param2].actorname = null;
            }
         }
      }
      
      private function startTimedRedraws() : void
      {
         addEventListener("enterFrame",timeToDrawMap);
      }
      
      private function useItemActorOnPlayer(param1:MgbActor) : void
      {
         var _loc6_:MgbActor = null;
         var _loc7_:int = 0;
         var _loc2_:int = int(param1.actorXML.databag.item.increasesMaxHealthNum);
         if(Boolean(_loc2_) && activeActors[AA_player_idx].maxHealth != 0)
         {
            activeActors[AA_player_idx].maxHealth += _loc2_;
            _loc6_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[AA_player_idx].ACidx));
            MgbActor.playCannedSound(_loc2_ > 0 ? String(_loc6_.actorXML.databag.all.soundWhenHealed) : String(_loc6_.actorXML.databag.all.soundWhenHarmed));
         }
         var _loc3_:int = int(param1.actorXML.databag.item.healOrHarmWhenUsedNum);
         if(_loc3_)
         {
            activeActors[AA_player_idx].health += _loc3_;
            _loc6_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[AA_player_idx].ACidx));
            MgbActor.playCannedSound(_loc3_ > 0 ? String(_loc6_.actorXML.databag.all.soundWhenHealed) : String(_loc6_.actorXML.databag.all.soundWhenHarmed));
         }
         if(1 == int(param1.actorXML.databag.item.gainExtraLifeYN))
         {
            ++activeActors[AA_player_idx].extraLives;
         }
         var _loc4_:int;
         if(_loc4_ = int(param1.actorXML.databag.item.gainOrLosePointsNum))
         {
            activeActors[AA_player_idx].score += _loc4_;
         }
         if(1 == int(param1.actorXML.databag.item.winLevelYN))
         {
            activeActors[AA_player_idx].winLevel = true;
         }
         var _loc5_:int;
         if(_loc5_ = int(param1.actorXML.databag.item.gainPowerType))
         {
            activeActors[AA_player_idx].activePower = _loc5_;
            _loc7_ = int(param1.actorXML.databag.item.gainPowerSecondsNum);
            if(0 == _loc7_)
            {
               activeActors[AA_player_idx].activePowerUntilTweenCount = int.MAX_VALUE;
            }
            else
            {
               activeActors[AA_player_idx].activePowerUntilTweenCount = G_tweenSinceMapStarted + stage.frameRate * _loc7_;
            }
         }
      }
      
      protected function addGe2Events(param1:String) : void
      {
         switch(param1)
         {
            case GameEngine.GE_EDIT:
               throw new Error("Should be handled by subclass");
            case GameEngine.GE_PLAY:
         }
      }
      
      private function askNpcQuestion(param1:ActiveActor, param2:MgbActor, param3:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         if(param3)
         {
            deferredAsk_aa = param1;
            deferredAsk_ap = param2;
         }
         else
         {
            _loc4_ = String(param2.actorXML.databag.npc.talkText);
            _loc5_ = String(MgbSystem.gameFonts[int(param2.actorXML.databag.npc.talkTextFontIndex)]);
            _loc6_ = String(param2.actorXML.databag.npc.responseChoice1);
            _loc7_ = String(param2.actorXML.databag.npc.responseChoice2);
            _loc8_ = String(param2.actorXML.databag.npc.responseChoice3);
            if(Boolean(_loc4_) && _loc4_.length > 0)
            {
               showNpcMessage({
                  "leftActor":param2,
                  "message":_loc4_,
                  "font":_loc5_,
                  "choice1":_loc6_,
                  "choice2":_loc7_,
                  "choice3":_loc8_
               },param1);
            }
         }
      }
      
      private function destroyBlitter() : void
      {
         removeChild(view);
         view.dispose();
         view = null;
      }
      
      private function startMeleeIfAllowed(param1:ActiveActor, param2:Boolean) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:MgbActor = null;
         if(!param1.inMelee() && param1.turnsBeforeMeleeReady == 0)
         {
            _loc3_ = null;
            param1.meleeStep = 0;
            _loc4_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,param1.ACidx));
            if(param2)
            {
               _loc3_ = String(inventory.equipmentMeleeSoundOverride);
            }
            MgbActor.playCannedSound(!!MgbActor.isSoundNonNull(_loc3_) ? _loc3_ : String(_loc4_.actorXML.databag.allchar.soundWhenMelee));
            return true;
         }
         return false;
      }
      
      public function loadMapByName(param1:String, param2:String, param3:String) : void
      {
         this.setGameStatusString("Loading game \'" + param3 + "\'... Please wait...");
         mapPiece.loadByName(param1,param2,param3,loadMapResult);
         tagCheck("load_from_doubleclick");
      }
      
      public function triggerLobbyMode() : void
      {
         removeGe2Events(GameEngine.GE_PLAY);
         gameEngineMode = GameEngine.GE_LOBBY;
         pleaseRedrawMapSoon();
      }
      
      public function set G_gameOver(param1:Boolean) : void
      {
         var _loc2_:Object = this._1548633310G_gameOver;
         if(_loc2_ !== param1)
         {
            this._1548633310G_gameOver = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"G_gameOver",_loc2_,param1));
         }
      }
      
      private function disablePlayerControls() : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,playHandleKeyEvents);
         stage.removeEventListener(KeyboardEvent.KEY_UP,playHandleKeyEvents);
      }
      
      [Bindable(event="propertyChange")]
      private function get inventoryDialog() : InventoryDialog
      {
         return this._1810526780inventoryDialog;
      }
      
      [Bindable(event="propertyChange")]
      public function get gameStatusString() : String
      {
         return this._1718344779gameStatusString;
      }
      
      private function playCleanupBackgroundLayer() : void
      {
         this.backgroundBlockageMap.reset(1,1);
      }
      
      private function playProcessAACollisions() : void
      {
         var _loc3_:int = 0;
         var _loc4_:ActiveActor = null;
         var _loc5_:MgbActor = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:ActiveActor = null;
         var _loc9_:MgbActor = null;
         var _loc10_:int = 0;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:int = 0;
         var _loc1_:Array = playFindAACollisions();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = int(_loc1_[_loc2_].AA1);
            _loc4_ = activeActors[_loc3_];
            _loc5_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[_loc1_[_loc2_].AA1].ACidx));
            _loc6_ = _loc4_.type;
            _loc7_ = int(_loc1_[_loc2_].AA2);
            _loc8_ = activeActors[_loc7_];
            _loc9_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[_loc1_[_loc2_].AA2].ACidx));
            _loc10_ = _loc8_.type;
            if(MgbActor.alActorType_Player == _loc6_)
            {
               switch(_loc10_)
               {
                  case MgbActor.alActorType_Player:
                     throw new Error("Program error: player/player collision - should not happen");
                  case MgbActor.alActorType_NPC:
                     if(_loc8_.inMelee())
                     {
                        applyDamageToActor(_loc3_,_loc5_,int(_loc9_.actorXML.databag.allchar.meleeDamageToPlayerNum));
                     }
                     else
                     {
                        applyDamageToActor(_loc3_,_loc5_,int(_loc9_.actorXML.databag.allchar.touchDamageToPlayerNum),int(_loc9_.actorXML.databag.allchar.touchDamageAttackChance));
                     }
                     if(_loc4_.inMelee())
                     {
                        applyDamageToActor(_loc7_,_loc9_,Math.max(0,int(_loc5_.actorXML.databag.allchar.meleeDamageToNPCorItemNum) + inventory.equipmentMeleeDamageBonus));
                     }
                     else
                     {
                        applyDamageToActor(_loc7_,_loc9_,int(_loc5_.actorXML.databag.allchar.touchDamageToNPCorItemNum),int(_loc5_.actorXML.databag.allchar.touchDamageAttackChance));
                     }
                     break;
                  case MgbActor.alActorType_Shot:
                     if(_loc8_.actorWhoFiredShot != AA_player_idx && _loc8_.shotDamageToPlayer > 0)
                     {
                        applyDamageToActor(_loc3_,_loc5_,_loc8_.shotDamageToPlayer);
                        playStopItemSliding(_loc8_);
                     }
                     break;
                  case MgbActor.alActorType_Item:
                     _loc11_ = false;
                     _loc12_ = false;
                     _loc13_ = false;
                     _loc14_ = int(_loc9_.actorXML.databag.item.itemActivationType);
                     switch(_loc14_)
                     {
                        case MgbActor.alItemActivationType_PlayerPicksUpUsesNow:
                           useItemOnPlayer(_loc1_[_loc2_].AA2);
                           _loc11_ = true;
                           _loc12_ = true;
                           _loc13_ = true;
                           break;
                        case MgbActor.alItemActivationType_PlayerUsesAndLeavesItem:
                           useItemOnPlayer(_loc1_[_loc2_].AA2);
                           _loc11_ = true;
                           break;
                        case MgbActor.alItemActivationType_PlayerPicksUpUsesLater:
                           inventory.add(new InventoryItem(MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[_loc1_[_loc2_].AA2].ACidx))));
                           _loc12_ = true;
                           _loc13_ = true;
                           break;
                        case MgbActor.alItemActivationType_BlocksPlayer:
                        case MgbActor.alItemActivationType_BlocksPlayerAndNPC:
                           if(int(_loc9_.actorXML.databag.item.pushToSlideNum) > 0)
                           {
                              playPushItemToStartSliding(_loc1_[_loc2_].AA1,_loc1_[_loc2_].AA2);
                           }
                     }
                     if(_loc4_.inMelee())
                     {
                        if(Boolean(_loc5_.actorXML.databag.allchar.meleeDamageToNPCorItemNum) && 0 == _loc9_.actorXML.databag.item.pushToSlideNum)
                        {
                           applyDamageToActor(_loc7_,_loc9_,Math.max(0,_loc5_.actorXML.databag.allchar.meleeDamageToNPCorItemNum + inventory.equipmentMeleeDamageBonus));
                        }
                     }
                     else if(Boolean(_loc5_.actorXML.databag.allchar.touchDamageToNPCorItemNum) && 0 == _loc9_.actorXML.databag.item.pushToSlideNum)
                     {
                        applyDamageToActor(_loc7_,_loc9_,_loc5_.actorXML.databag.allchar.touchDamageToNPCorItemNum,int(_loc5_.actorXML.databag.allchar.touchDamageAttackChance));
                     }
                     if(_loc12_)
                     {
                        _loc8_.health = 0;
                     }
                     if(_loc11_)
                     {
                     }
                     if(_loc13_)
                     {
                        if((Boolean(_loc15_ = String(_loc9_.actorXML.databag.item.useText))) && _loc15_.length > 0)
                        {
                           setGameStatusString2(_loc15_);
                        }
                     }
                     break;
                  default:
                     throw new Error("Program error: Unknown actor type " + _loc10_);
               }
            }
            else
            {
               _loc16_ = 0;
               while(_loc16_ < 2)
               {
                  if(_loc16_)
                  {
                     _loc3_ = int(_loc1_[_loc2_].AA2);
                     _loc4_ = activeActors[_loc3_];
                     _loc5_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[_loc1_[_loc2_].AA2].ACidx));
                     _loc6_ = _loc4_.type;
                     _loc7_ = int(_loc1_[_loc2_].AA1);
                     _loc8_ = activeActors[_loc7_];
                     _loc9_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,activeActors[_loc1_[_loc2_].AA1].ACidx));
                     _loc10_ = _loc8_.type;
                  }
                  switch(_loc6_)
                  {
                     case MgbActor.alActorType_NPC:
                        applyDamageToActor(_loc7_,_loc9_,int(_loc5_.actorXML.databag.allchar.touchDamageToNPCorItemNum),int(_loc5_.actorXML.databag.allchar.touchDamageAttackChance));
                        break;
                     case MgbActor.alActorType_Item:
                     case MgbActor.alActorType_Shot:
                        if(_loc4_.isSliding)
                        {
                           if(_loc4_.isAShot)
                           {
                              if(_loc4_.shotDamageToNPC != 0)
                              {
                                 applyDamageToActor(_loc7_,_loc9_,_loc4_.shotDamageToNPC);
                                 playStopItemSliding(_loc4_);
                              }
                           }
                           else if(_loc10_ == MgbActor.alActorType_NPC && 1 == int(_loc5_.actorXML.databag.item.squishNPCYN))
                           {
                              _loc8_.health = 0;
                              MgbActor.playCannedSound(_loc9_.actorXML.databag.all.soundWhenHarmed);
                           }
                           else
                           {
                              _loc4_.x = _loc4_.fromx;
                              _loc4_.y = _loc4_.fromy;
                              playStopItemSliding(_loc4_);
                              if(_loc10_ == MgbActor.alActorType_NPC && 0 == int(_loc5_.actorXML.databag.item.squishNPCYN && _loc8_.x == _loc4_.x && _loc8_.y == _loc4_.y))
                              {
                                 _loc8_.x = _loc8_.fromx;
                                 _loc8_.y = _loc8_.fromy;
                                 _loc8_.xMovePerTween = 0;
                                 _loc8_.yMovePerTween = 0;
                                 _loc8_.renderX = _loc8_.fromx * MgbSystem.tileMinWidth;
                                 _loc8_.renderY = _loc8_.fromy * MgbSystem.tileMinHeight;
                              }
                           }
                        }
                        break;
                  }
                  _loc16_++;
               }
            }
            _loc2_++;
         }
      }
      
      private function cancelAllSpawnedActorsForAutoRespawn() : void
      {
         respawnMemoryAutoRespawningActors = new Array();
      }
      
      private function showGrid() : Boolean
      {
         return GameEngine.GE_EDIT == gameEngineMode && true == showGridFlag;
      }
      
      protected function redrawMap(param1:int = -1, param2:int = -1, param3:int = -1, param4:int = -1) : void
      {
         var container:Container;
         var renderWidth:int;
         var hScroll:int;
         var renderHeight:int;
         var vScroll:int;
         var x:int = 0;
         var y:int = 0;
         var p:Point = null;
         var startX:int = 0;
         var endX:int = 0;
         var pixelShiftLeftX:int = 0;
         var startY:int = 0;
         var endY:int = 0;
         var pixelShiftUpY:int = 0;
         var layer:int = 0;
         var aalen:int = 0;
         var AAi:int = 0;
         var aa:ActiveActor = null;
         var actorName:String = null;
         var tf:TextField = null;
         var ct:ColorTransform = null;
         var matrix:Matrix = null;
         var effect:String = null;
         var ap2:MgbActor = null;
         var animationTableIndex:int = 0;
         var newTileName:String = null;
         var t:MgbTile = null;
         var b:BitmapData = null;
         var overrideWidth:int = param1;
         var overrideHeight:int = param2;
         var overrideHScroll:int = param3;
         var overrideVScroll:int = param4;
         needToRedrawMap = false;
         container = Container(parent);
         if(Boolean(container) && container.verticalScrollPosition > container.maxVerticalScrollPosition)
         {
            container.verticalScrollPosition = container.maxVerticalScrollPosition;
         }
         if(Boolean(container) && container.horizontalScrollPosition > container.maxHorizontalScrollPosition)
         {
            container.horizontalScrollPosition = container.maxHorizontalScrollPosition;
         }
         renderWidth = overrideWidth != -1 ? overrideWidth : int(calculateRenderWidth());
         renderHeight = overrideHeight != -1 ? overrideHeight : int(calculateRenderHeight());
         hScroll = overrideHScroll != -1 ? overrideHScroll : (!!parent ? int(Number(container.horizontalScrollPosition) / zoomLevel) : 0);
         vScroll = overrideVScroll != -1 ? overrideVScroll : (!!parent ? int(Number(container.verticalScrollPosition) / zoomLevel) : 0);
         if(npcDialog)
         {
            npcDialog.x = hScroll;
            npcDialog.y = vScroll;
         }
         if(inventoryDialog)
         {
            inventoryDialog.x = hScroll;
            inventoryDialog.y = vScroll;
         }
         if(!view)
         {
            createBlitter();
         }
         else if(view.frameBuffer != null)
         {
            if(view.frameBuffer.width != renderWidth || view.frameBuffer.height != renderHeight)
            {
               view.updateSize(renderWidth,renderHeight);
            }
         }
         if(view && view.frameBuffer && Boolean(view.bitmapData))
         {
            view.frameBuffer.lock();
            view.frameBuffer.fillRect(new Rectangle(0,0,view.frameBuffer.width,view.frameBuffer.height),4294967295);
            p = new Point();
            startX = Math.max(hScroll / MgbSystem.tileMinWidth - (MgbSystem.tileMaxSizeInCells - 1),0);
            endX = 1 + int((hScroll + renderWidth) / MgbSystem.tileMinWidth);
            if(endX > mapPiece.width)
            {
               endX = mapPiece.width;
            }
            pixelShiftLeftX = hScroll % MgbSystem.tileMinWidth + Math.min(MgbSystem.tileMaxSizeInCells - 1,int(hScroll / MgbSystem.tileMinWidth)) * MgbSystem.tileMinWidth;
            startY = Math.max(vScroll / MgbSystem.tileMinHeight - (MgbSystem.tileMaxSizeInCells - 1),0);
            endY = 1 + int((vScroll + renderHeight) / MgbSystem.tileMinHeight);
            if(endY > mapPiece.height)
            {
               endY = mapPiece.height;
            }
            pixelShiftUpY = vScroll % MgbSystem.tileMinHeight + Math.min(MgbSystem.tileMaxSizeInCells - 1,int(vScroll / MgbSystem.tileMinWidth)) * MgbSystem.tileMinWidth;
            layer = 0;
            while(layer < MgbMap.layerGameCount)
            {
               if(layer == MgbMap.layerActive && gameEngineMode == GameEngine.GE_PLAY)
               {
                  aalen = int(activeActors.length);
                  AAi = 0;
                  for(; AAi < aalen; AAi++)
                  {
                     aa = activeActors[AAi];
                     if(aa.alive && Boolean(aa.renderBD))
                     {
                        x = aa.renderX - hScroll;
                        y = aa.renderY - vScroll;
                        x += aa.renderOffsetCellsX * MgbSystem.tileMinWidth;
                        y += aa.renderOffsetCellsY * MgbSystem.tileMinWidth;
                        if(!(x + MgbSystem.tileMaxWidth < 0 || x > renderWidth || y + MgbSystem.tileMaxHeight < 0 || y > renderHeight))
                        {
                           p.x = x;
                           p.y = y;
                           try
                           {
                              view.frameBuffer.copyPixels(aa.renderBD,new Rectangle(0,0,aa.renderBD.width,aa.renderBD.height),p,null,null,true);
                           }
                           catch(err:Error)
                           {
                              trace("renderBD not ready for actor \'" + aa.ACidx + "\'");
                           }
                           continue;
                        }
                     }
                  }
               }
               else if(layerAlphas[layer] > 0)
               {
                  y = startY;
                  while(y < endY)
                  {
                     x = startX;
                     while(x < endX)
                     {
                        actorName = String(mapPiece.mapLayerActors[layer][cell(x,y)]);
                        if(actorName)
                        {
                           p.x = (x - startX) * MgbSystem.tileMinWidth - pixelShiftLeftX;
                           p.y = (y - startY) * MgbSystem.tileMinHeight - pixelShiftUpY;
                           if(layer == MgbMap.layerEvents)
                           {
                              if(gameEngineMode == GameEngine.GE_EDIT && actorName != null && actorName != "")
                              {
                                 tf = new TextField();
                                 tf.textColor = 16711680;
                                 tf.background = true;
                                 tf.backgroundColor = 65535;
                                 tf.text = " **  ";
                                 tf.width = tf.textWidth;
                                 tf.height = tf.textHeight;
                                 ct = new ColorTransform(1,1,1,layerAlphas[layer]);
                                 matrix = new Matrix(1,0,0,1,p.x + (MgbSystem.tileMinWidth - tf.textWidth) / 2,p.y + (MgbSystem.tileMinHeight - tf.textHeight) / 2);
                                 view.frameBuffer.draw(tf,matrix,ct,"normal",null,false);
                              }
                           }
                           else
                           {
                              effect = null;
                              ap2 = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,actorName));
                              if(ap2)
                              {
                                 animationTableIndex = int(getAnimationIndex(ap2,-1,-1,G_tweenCount));
                                 newTileName = String(getAnimationTileFromIndex(ap2,animationTableIndex));
                                 effect = String(getAnimationEffectFromIndex(ap2,animationTableIndex));
                                 t = !!newTileName ? MgbTile(tileCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,newTileName)) : null;
                                 if(t)
                                 {
                                    b = t.bitmapDataVariant(effect);
                                    if(b)
                                    {
                                       if(layerAlphas[layer] == 1 || gameEngineMode != GameEngine.GE_EDIT)
                                       {
                                          view.frameBuffer.copyPixels(b,new Rectangle(0,0,b.width,b.height),p,null,null,true);
                                       }
                                       else
                                       {
                                          ct = new ColorTransform(1,1,1,layerAlphas[layer]);
                                          matrix = new Matrix(1,0,0,1,p.x,p.y);
                                          view.frameBuffer.draw(b,matrix,ct,"normal",null,false);
                                       }
                                    }
                                 }
                              }
                              else
                              {
                                 loadActorByName(actorName);
                              }
                           }
                        }
                        x++;
                     }
                     y++;
                  }
               }
               layer++;
            }
            redrawResizeIndicatorOnMap(view.frameBuffer,hScroll,vScroll,startX,startY,pixelShiftLeftX,pixelShiftUpY);
            redrawGridOnMap(view.frameBuffer,hScroll,vScroll);
            redrawAddGameStatusString2(view.frameBuffer,pixelShiftLeftX,pixelShiftUpY,renderWidth);
            view.x = Number(hScroll) * zoomLevel;
            view.y = Number(vScroll) * zoomLevel;
            view.frameBuffer.unlock();
            view.blit();
         }
      }
      
      private function actorCreateShot(param1:int, param2:Number = NaN) : void
      {
         var _loc7_:ActiveActor = null;
         var _loc8_:String = null;
         var _loc3_:ActiveActor = activeActors[param1];
         var _loc4_:MgbActor;
         var _loc5_:String = String((_loc4_ = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc3_.ACidx))).actorXML.databag.allchar.shotActor);
         if(param1 == AA_player_idx && Boolean(inventory.equipmentShotActorOverride))
         {
            _loc5_ = String(inventory.equipmentShotActorOverride);
         }
         if(!_loc5_ || _loc5_ == "")
         {
            MgbLogger.getInstance().logGameBug("Shot not defined for actor \'" + _loc4_.name + "\'");
            return;
         }
         var _loc6_:int = int(playSpawnNewActor(loadActorByName(_loc5_),_loc3_.x + (_loc3_.cellSpanX > 2 ? 1 : 0),_loc3_.y + (_loc3_.cellSpanY > 2 ? 1 : 0),true));
         if(-1 != _loc6_)
         {
            _loc7_ = activeActors[_loc6_];
            if(isNaN(param2))
            {
               _loc7_.stepStyle = _loc3_.stepStyle;
            }
            else
            {
               _loc7_.stepStyle = param2;
            }
            _loc7_.stepCount = 1;
            _loc7_.isSliding = true;
            _loc7_.isAShot = true;
            _loc7_.moveSpeed = 1;
            ++_loc3_.currentActiveShots;
            _loc7_.actorWhoFiredShot = param1;
            _loc7_.shotRange = int(_loc4_.actorXML.databag.allchar.shotRangeNum);
            if(param1 == AA_player_idx)
            {
               _loc7_.shotRange += inventory.equipmentShotRangeBonus;
            }
            if((Boolean(_loc3_.yMovePerTween) || Boolean(_loc3_.xMovePerTween)) && _loc7_.stepStyle == _loc3_.stepStyle)
            {
               calculateNewEnemyPosition(_loc6_);
               if(checkIfActorObstructed(_loc6_,true))
               {
                  destroyShot(_loc7_);
                  return;
               }
            }
            if(_loc7_.y < 0 || _loc7_.x < 0 || _loc7_.x > mapPiece.width - 1 || _loc7_.y > mapPiece.height - 1)
            {
               destroyShot(_loc7_);
               return;
            }
            _loc7_.shotDamageToNPC = _loc4_.actorXML.databag.allchar.shotDamageToNPCorItemNum;
            if(param1 == AA_player_idx)
            {
               _loc7_.shotDamageToNPC += inventory.equipmentShotDamageBonus;
            }
            _loc7_.shotDamageToPlayer = _loc4_.actorXML.databag.allchar.shotDamageToPlayerNum;
            G_tic = null;
            _loc8_ = String(_loc4_.actorXML.databag.allchar.soundWhenShooting);
            if(param1 == AA_player_idx && Boolean(inventory.equipmentShotSoundOverride))
            {
               _loc8_ = String(inventory.equipmentShotSoundOverride);
            }
            MgbActor.playCannedSound(_loc8_);
         }
      }
      
      private function isAnimationTableIndexValid(param1:MgbActor, param2:int) : Boolean
      {
         var _loc3_:Object = param1.animationTable[param2];
         return _loc3_.effect != "no effect" && _loc3_.effect != "" || _loc3_.tilename != "";
      }
      
      private function findAdjacentFreeCellForDrop(param1:int, param2:int, param3:Boolean = false) : Point
      {
         var _loc7_:Point = null;
         var _loc4_:ActiveActor = activeActors[param1];
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         while(_loc6_ < 4)
         {
            _loc7_ = nextPoint(_loc4_.x,_loc4_.y,_loc4_.cellSpanX,_loc4_.cellSpanY,_loc6_);
            if(false == isObstructedForThisDrop(_loc7_.x,_loc7_.y,param3))
            {
               if(_loc6_ == param2)
               {
                  return _loc7_;
               }
               _loc5_ = _loc7_;
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      [Bindable(event="propertyChange")]
      public function get showGridFlag() : Boolean
      {
         return this._534323729showGridFlag;
      }
      
      private function prepareMapEditResoures() : void
      {
         redrawMap();
         applyZoomLevel();
      }
      
      private function processProjectChange(param1:Event) : void
      {
         trace("GameEngineTwo::processProjectChange() -> " + mgbSession.activeProject);
         stopGameIfPlaying();
         newMap();
      }
      
      private function playSpawnNewActor(param1:String, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false, param6:String = null) : int
      {
         var _loc10_:int = 0;
         var _loc11_:ActiveActor = null;
         var _loc12_:MgbTile = null;
         var _loc13_:String = null;
         if(param2 < 0)
         {
            param2 = 0;
         }
         if(param3 < 0)
         {
            param3 = 0;
         }
         if(param2 >= mapPiece.width)
         {
            param2 = mapPiece.width - 1;
         }
         if(param3 >= mapPiece.height)
         {
            param3 = mapPiece.height - 1;
         }
         var _loc7_:int = int(activeActors.length);
         if(param4)
         {
            _loc10_ = 0;
            while(_loc10_ < activeActors.length)
            {
               if(activeActors[_loc10_].alive == false && activeActors[_loc10_].dyingAnimationFrameCount == 0 && activeActors[_loc10_].appearIf == MgbActor.alAppearDisappear_NoCondition)
               {
                  _loc7_ = _loc10_;
                  break;
               }
               _loc10_++;
            }
         }
         var _loc8_:MgbActor = MgbActor(actorCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,param1));
         if(null == _loc8_ || null == _loc8_.actorXML)
         {
            throw new Error("Can\'t spawn an actor that hasn\'t been pre-loaded");
         }
         var _loc9_:int = int(_loc8_.actorXML.databag.all.actorType);
         if(MgbActor.alActorType_Player == _loc9_)
         {
            MgbLogger.getInstance().logGameBug("Can\'t spawn additional players");
            return -1;
         }
         (_loc11_ = new ActiveActor()).meleeStep = ActiveActor.MELEESTEP_NOT_IN_MELEE;
         _loc11_.creationCause = ActiveActor.CREATION_BY_SPAWN;
         if(_loc9_ == MgbActor.alActorType_NPC)
         {
            _loc11_.moveSpeed = Number(_loc8_.actorXML.databag.allchar.movementSpeedNum);
         }
         _loc11_.type = _loc9_;
         _loc11_.wasStopped = false;
         _loc11_.startx = _loc11_.x = _loc11_.fromx = param2;
         _loc11_.starty = _loc11_.y = _loc11_.fromy = param3;
         _loc11_.health = _loc8_.actorXML.databag.all.initialHealthNum;
         _loc11_.maxHealth = _loc8_.actorXML.databag.all.initialMaxHealthNum;
         _loc11_.ACidx = param1;
         if(!(_loc12_ = MgbTile(tileCache.getPieceIfCached(mapPiece.userName,mapPiece.projectName,_loc8_.tilename))))
         {
            throw new Error("Can\'t spawn new actor - unknown tile");
         }
         _loc11_.renderBD = _loc12_.bitmapData;
         _loc11_.appearIf = MgbActor.alAppearDisappear_NoCondition;
         _loc11_.renderX = param2 * MgbSystem.tileMinWidth;
         _loc11_.renderY = param3 * MgbSystem.tileMinHeight;
         _loc11_.cellSpanX = (_loc12_.width + (MgbSystem.tileMinWidth - 1)) / MgbSystem.tileMinWidth;
         _loc11_.cellSpanY = (_loc12_.height + (MgbSystem.tileMinHeight - 1)) / MgbSystem.tileMinHeight;
         _loc13_ = String(_loc8_.actorXML.databag.allchar.shotActor);
         _loc11_.maxActiveShots = _loc13_ == null || _loc13_ == "" ? 0 : int(_loc8_.actorXML.databag.allchar.shotRateNum);
         _loc11_.alive = true;
         _loc11_.birthTweenCount = G_tweenCount;
         activeActors[_loc7_] = _loc11_;
         preLoadPotentialSpawns(_loc8_);
         if(param5)
         {
            _loc11_.respawnId = !!param6 ? param6 : String(markSpawnedActorForAutoRespawn(this.mapPiece.name,param1,_loc11_.startx,_loc11_.starty));
         }
         return _loc7_;
      }
   }
}

import com.mgb.data.*;
import flash.display.BitmapData;

class ActiveActor
{
   
   public static const CREATION_BY_SPAWN:String = "spawned";
   
   public static const CREATION_BY_MAP:String = "mapped";
   
   public static const MELEESTEP_NOT_IN_MELEE:int = -1;
    
   
   public var renderX:int;
   
   public var renderY:int;
   
   public var winLevel:Boolean;
   
   public var cellSpanX:int;
   
   public var cellSpanY:int;
   
   public var fromx:int;
   
   public var fromy:int;
   
   public var appearIf:int;
   
   public var score:int;
   
   public var birthTweenCount:int;
   
   public var activePower:int;
   
   public var currentActiveShots:int;
   
   public var stepCount:int;
   
   public var turnsBeforeMeleeReady:int;
   
   public var renderOffsetCellsWidth:int;
   
   public var isSliding:Boolean;
   
   public var type:int;
   
   public var activePowerUntilTweenCount:int;
   
   public var stepStyle:int;
   
   public var creationCause:String;
   
   public var renderOffsetCellsHeight:int;
   
   public var renderOffsetCellsX:int;
   
   public var renderOffsetCellsY:int;
   
   public var alive:Boolean;
   
   public var startx:int;
   
   public var starty:int;
   
   public var renderBD:BitmapData;
   
   public var ACidx:String;
   
   public var health:int;
   
   public var wasStopped:Boolean;
   
   public var xMovePerTween:int;
   
   public var yMovePerTween:int;
   
   public var meleeStep:int;
   
   public var respawnId:String;
   
   public var shotDamageToNPC:int;
   
   public var shotDamageToPlayer:int;
   
   public var extraLives:int;
   
   public var maxHealth:int;
   
   public var dyingAnimationFrameCount:int;
   
   public var isAShot:Boolean;
   
   public var moveSpeed:Number;
   
   public var x:int;
   
   public var y:int;
   
   public var shotRange:int;
   
   public var maxActiveShots:int;
   
   public var actorWhoFiredShot:int;
   
   public function ActiveActor()
   {
      super();
   }
   
   public function inMelee() : Boolean
   {
      return meleeStep != MELEESTEP_NOT_IN_MELEE;
   }
}

import com.mgb.data.MgbActor;
import com.mgb.data.MgbTile;

class MapItem
{
    
   
   public var actorName:String;
   
   public var tilePiece:MgbTile;
   
   public var actorPiece:MgbActor;
   
   public function MapItem()
   {
      super();
   }
}

import com.mgb.data.*;

class BlockageMap
{
   
   public static const ENTITY_NPC:int = 1;
   
   public static const ENTITY_PLAYER:int = 0;
    
   
   private var cells:Array;
   
   private var width:int;
   
   private var height:int;
   
   public function BlockageMap()
   {
      super();
   }
   
   public function blockEntity(param1:int, param2:int, param3:int, param4:int = 1, param5:int = 1) : void
   {
      var _loc7_:int = 0;
      var _loc8_:int = 0;
      var _loc9_:int = 0;
      var _loc6_:int = 0;
      while(_loc6_ < param4)
      {
         _loc7_ = 0;
         while(_loc7_ < param5)
         {
            if(param1 + _loc6_ < width && param2 + _loc7_ < height)
            {
               _loc8_ = int(cell(param1 + _loc6_,param2 + _loc7_));
               _loc9_ = int(cells[_loc8_]);
               cells[_loc8_] = _loc9_ | 1 << param3;
            }
            _loc7_++;
         }
         _loc6_++;
      }
   }
   
   public function isEntityBlocked(param1:int, param2:int, param3:int) : Boolean
   {
      var _loc4_:int = int(cell(param1,param2));
      var _loc5_:int;
      return ((_loc5_ = int(cells[_loc4_])) & 1 << param3) != 0;
   }
   
   private function cell(param1:int, param2:int) : int
   {
      if(param1 > width || param2 > height)
      {
         trace("Incorrect size in BlockageMap");
      }
      return param2 * width + param1;
   }
   
   public function reset(param1:int, param2:int) : void
   {
      cells = new Array(param1 * param2);
      width = param1;
      height = param2;
   }
}

import com.mgb.data.*;

class ActorCollision
{
    
   
   public var AA1:int;
   
   public var AA2:int;
   
   public function ActorCollision(param1:int, param2:int)
   {
      super();
      AA1 = param1;
      AA2 = param2;
   }
}

import com.mgb.controls.Inventory;
import com.mgb.data.*;
import flash.utils.*;

class SavedGame
{
    
   
   private const hdrString:String = "MGB_SAVED_GAME_V001";
   
   private var ba:ByteArray;
   
   public function SavedGame()
   {
      super();
   }
   
   public function encodeGameState(param1:ActiveActor, param2:Inventory, param3:String, param4:int, param5:int, param6:Array, param7:String) : void
   {
      ba = new ByteArray();
      ba.writeUTF(hdrString);
      param2.writeBytes(ba);
   }
}
