package com.mgb.data
{
   import com.mgb.utils.*;
   import flash.display.DisplayObject;
   import flash.media.*;
   import flash.net.*;
   import flash.utils.*;
   import mx.collections.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.ResultEvent;
   
   public class MgbActor extends Piece
   {
      
      public static const alTouchDamageCases_WhenAdjacent:int = 2;
      
      public static const ANIMATION_INDEX_BASE_MELEE_EAST:int = 44;
      
      public static const alItemActivationType_PlayerPicksUpUsesNow:int = 5;
      
      public static const alItemActivationType_PlayerShootsItemToUse:int = 7;
      
      public static const alMovementType_FromPlayer:int = 3;
      
      public static const alNpcTakeTypes:Array = ["Take","Require"];
      
      public static const alAppearDisappear_Disappear:int = 1;
      
      public static const alTemplatePlayer_MeleeDamage:String = "player (melee damage)";
      
      public static const alNpcDialogFinalAction_repeat:int = 2;
      
      public static const ANIMATION_INDEX_BASE_STATIONARY_WEST:int = 116;
      
      public static const alNpcTakeType_Require:int = 1;
      
      public static const alShotAccuracy_random:int = 0;
      
      public static const alShotRate:Array = ["Cannot Shoot","Shoot rarely","One shot at at time","Many shots at a time"];
      
      private static var alSoundsArray:Array;
      
      public static const alTemplateWall_BlocksNPC:String = "wall (blocks NPC)";
      
      public static const alTemplatePusher_North:String = "push north";
      
      public static const alTemplateShotModifier:String = "shot modifier";
      
      public static const alItemActivationType_PushesActors:int = 8;
      
      public static const alMovementType:Array = ["No automatic movement","Moves randomly","Moves towards player","Moves away from player"];
      
      public static const alTemplateItem_HealLater:String = "heal (later)";
      
      public static const alTemplateShot:String = "shot";
      
      public static const ANIMATION_INDEX_BASE_STATIONARY_EAST:int = 84;
      
      public static const alMovementType_None:int = 0;
      
      public static const alTemplateEnemy_MeleeDamage:String = "enemy (melee damage)";
      
      public static const alItemPushesActorType_down:int = 2;
      
      public static const alTemplateItem:String = "item";
      
      public static const alTemplateArmor:String = "armor";
      
      public static const alShotAccuracy_good:int = 2;
      
      public static const alTemplateIce:String = "ice";
      
      public static const ANIMATION_INDEX_BASE_STATIONARY_ANYDIRECTION:int = 20;
      
      public static const alTemplateBlank:String = "blank";
      
      public static const alTemplateItem_InvincibilityLater:String = "Temporary Invicibility (later)";
      
      public static const ANIMATION_INDEX_BASE_FACE_NORTH:int = 0;
      
      public static const alTouchDamageCases:Array = ["When overlapping target","When facing target","When adjacent to target"];
      
      public static const alGainPowerType_None:int = 0;
      
      public static const alItemPushesActorType:Array = ["Up","Right","Down","Left","Onwards","Backwards","Random"];
      
      public static const alTemplateBounce:String = "bounce";
      
      public static const alNpcTakeType_Take:int = 0;
      
      public static const alTemplateItem_ScorePoints:String = "score points";
      
      public static const alActorType_Player:int = 0;
      
      public static const alTemplateEnemy:String = "enemy";
      
      public static const alTemplatePusher_West:String = "push west";
      
      public static const alTemplateFriend:String = "friend";
      
      public static const alItemActivationType_Inactive:int = 0;
      
      public static const alNpcDialogFinalAction:Array = ["Disappears","Stays","Repeat Question"];
      
      public static const alItemPushesActorType_backwards:int = 5;
      
      public static const alGainPower:Array = ["No power","Cannot be harmed"];
      
      public static const alVisualEffect:Array = ["none","glow","fade-out","explode"];
      
      public static const alActorType:Array = ["Player","Non-Player Character (NPC)","Item, wall or scenery","Shot"];
      
      public static const alActorType_NPC:int = 1;
      
      public static const alMovementType_ToPlayer:int = 2;
      
      public static const alShotAccuracy_great:int = 3;
      
      public static const alTemplateItem_HealNow:String = "heal (instant)";
      
      public static const alTemplateEnemy_TouchDamageHuntsPlayer:String = "enemy (touch damage, hunts player)";
      
      public static const ANIMATION_INDEX_BASE_MELEE_NORTH:int = 36;
      
      public static const alItemPushesActorType_right:int = 1;
      
      public static const alTemplatePlayer:String = "player";
      
      public static const alTemplatePusher_East:String = "push east";
      
      public static const alItemActivationType_CausesDamage:int = 9;
      
      public static const alTemplateDoor:String = "door";
      
      public static const alTemplatePusher_Random:String = "push random";
      
      public static const alItemPushesActorType_random:int = 6;
      
      public static const alTemplatePusher_South:String = "push south";
      
      public static const ANIMATION_INDEX_BASE_STATIONARY_NORTH:int = 68;
      
      public static const alNpcDialogFinalAction_stay:int = 1;
      
      public static const alMovementType_Random:int = 1;
      
      public static const alTemplateWall:String = "wall";
      
      public static const alTemplateWall_BlocksPlayer:String = "wall (blocks Player)";
      
      public static const alRespawnOption_Never:int = 1;
      
      public static const alTemplateFloor:String = "floor";
      
      public static const alRespawnOption_MapReload:int = 0;
      
      public static const alItemActivationType_BlocksNPC:int = 2;
      
      public static const alItemActivationType_PlayerUsesAndLeavesItem:int = 6;
      
      public static const alTemplateEnemy_Shoots:String = "enemy (shoots)";
      
      public static const alTemplateProjectileWeapon:String = "projectile weapon";
      
      public static const alTemplateEnemy_ShootsFromAfar:String = "enemy (shoots from afar)";
      
      public static const alTemplateItem_InvincibilityNow:String = "Temporary Invicibility (instant)";
      
      public static const alTemplateWall_Conditional:String = "wall (conditional)";
      
      public static const alTemplateEnemyGenerator:String = "enemy generator";
      
      public static const alRespawnOptions:Array = ["Respawn on map reload","Never respawn"];
      
      public static const alItemPushesActorType_onwards:int = 4;
      
      public static const alTemplateSlidingBlock:String = "slidingblock";
      
      public static const alTouchDamageCases_WhenFacingAndAdjacent:int = 1;
      
      public static const alTemplateItem_MaxHealthBoost:String = "max health boost";
      
      public static const alNpcDialogFinalAction_disappear:int = 0;
      
      public static const ANIMATION_INDEX_BASE_FACE_SOUTH:int = 10;
      
      public static const alItemActivationType_BlocksPlayerAndNPC:int = 3;
      
      public static const alItemActivationType_PlayerPicksUpUsesLater:int = 4;
      
      public static const ANIMATION_INDEX_BASE_FACE_WEST:int = 15;
      
      public static const alTemplateItem_PoisonNow:String = "Poison (instant)";
      
      public static const alAppearDisappear_Appear:int = 2;
      
      public static const alItemActivation:Array = ["inactive","Blocks Player","Blocks NPC","Blocks Player+NPC","Player picks up, uses later","Player picks up, uses immediately","Player uses, but leaves item","Player shoots item to use it","Pushes actors in a direction","Floor that causes damage"];
      
      public static const alActorType_Shot:int = 3;
      
      public static const alGainPowerType_Invulnerable:int = 1;
      
      public static const alTemplateMeleeWeaponModifier:String = "melee modifier";
      
      public static const alTemplateMeleeWeapon:String = "melee weapon";
      
      public static const alTemplatePlayer_Shoots:String = "player (shoots)";
      
      public static const alActorType_Item:int = 2;
      
      public static const alTemplateItem_VictoryNow:String = "victory (instant)";
      
      public static const alTemplatePlayer_TouchDamage:String = "player (touch damage)";
      
      public static const alTemplateEnemy_stationary:String = "enemy_stationary";
      
      public static const ANIMATION_INDEX_BASE_MELEE_WEST:int = 60;
      
      public static const alTemplateFloor_Damager:String = "floor with damage";
      
      public static const alItemActivationType_BlocksPlayer:int = 1;
      
      public static const ANIMATION_INDEX_BASE_FACE_EAST:int = 5;
      
      public static const alItemPushesActorType_left:int = 3;
      
      public static const alAppearDisappear_NoCondition:int = 0;
      
      public static const alTouchDamageCases_WhenOverlapped:int = 0;
      
      public static const alAppearDisappear:Array = ["No condition","Disappear","Appear"];
      
      public static const alShotAccuracy:Array = ["Random shot","Poor shot","Good shot","Great Shot"];
      
      public static const ANIMATION_INDEX_BASE_MELEE_SOUTH:int = 52;
      
      public static const alCannedSoundsList:Array = ["none","Arrow1","Arrow2","Beep1","Beep2","Beep3","Beep4","Bounce1","Bounce2","Bounce3","Burp1","Burp2","Chime1","Chomp1","Chomp2","Gasp1","Gasp2","Laser1","Laser2","Laser3","Money1","Money2","Money3","Money4","Scream1","Scream2","Scream3","Scream4","Shot1","Shot2","Shot3","Shot4","Shot5","Shot6","Shot7","Shot8","Siren1","Siren2","Slurp1","Slurp2","Slurp3","Melee1","Melee2","Melee3","Melee4","Melee5","Melee6"];
      
      public static const ANIMATION_INDEX_BASE_STATIONARY_SOUTH:int = 100;
      
      public static const alItemPushesActorType_up:int = 0;
      
      public static const alShotAccuracy_poor:int = 1;
      
      public static const alActorTypeShort:Array = ["Player","NPC","Item","Shot"];
      
      public static const alTemplateEnemy_TouchDamage:String = "enemy (touch damage)";
      
      public static const alNoYes:Array = ["No","Yes"];
       
      
      private var loadChoiceCallback:Function = null;
      
      private var _1457864022animationTable:ArrayCollection = null;
      
      private var DGArray:Array = null;
      
      private var actorLoadCallback:Function = null;
      
      private var _1650562590actorXML:XML = null;
      
      public function MgbActor()
      {
         super(MGB_ACTOR);
         newActor();
      }
      
      public static function isSoundNonNull(param1:String) : Boolean
      {
         return Boolean(param1) && param1 != "" && param1 != "none";
      }
      
      public static function initSoundsArray() : void
      {
         var _loc1_:String = null;
         var _loc2_:Sound = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(!alSoundsArray)
         {
            alSoundsArray = new Array();
            for(_loc1_ in alCannedSoundsList)
            {
               _loc2_ = new Sound();
               _loc3_ = String(alCannedSoundsList[_loc1_]);
               if(_loc4_ = cannedSoundUrl(_loc3_))
               {
                  _loc2_.load(new URLRequest(_loc4_));
                  alSoundsArray[_loc3_] = _loc2_;
               }
            }
         }
      }
      
      public static function soundIndexToName(param1:int) : String
      {
         return alCannedSoundsList[param1];
      }
      
      public static function cannedSoundUrl(param1:String) : String
      {
         return param1 == "none" ? null : "http://s3.amazonaws.com/apphost/sounds/" + param1 + ".mp3";
      }
      
      public static function soundNameToIndex(param1:String) : int
      {
         var _loc2_:String = null;
         if(param1)
         {
            initSoundsArray();
            for(_loc2_ in alCannedSoundsList)
            {
               if(alCannedSoundsList[_loc2_] == param1)
               {
                  return int(_loc2_);
               }
            }
         }
         return 0;
      }
      
      public static function playCannedSound(param1:String) : void
      {
         var _loc2_:Sound = null;
         initSoundsArray();
         if(param1)
         {
            _loc2_ = alSoundsArray[param1];
            if(Boolean(_loc2_) && !_loc2_.isBuffering)
            {
               _loc2_.play();
            }
         }
      }
      
      public function set actorXML(param1:XML) : void
      {
         var _loc2_:Object = this._1650562590actorXML;
         if(_loc2_ !== param1)
         {
            this._1650562590actorXML = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorXML",_loc2_,param1));
         }
      }
      
      public function getDescription(param1:Boolean = false) : String
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = "";
         if(actorXML == null)
         {
            return "Loading...";
         }
         if(param1)
         {
            switch(int(actorXML.databag.all.actorType))
            {
               case MgbActor.alActorType_Item:
                  _loc3_ = ". " + MgbActor.alItemActivation[actorXML.databag.item.itemActivationType] + ".";
                  if((actorXML.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksPlayer || actorXML.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksPlayerAndNPC || actorXML.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksNPC) && int(actorXML.databag.item.pushToSlideNum) != 0)
                  {
                     _loc3_ += " Slides " + int(actorXML.databag.item.pushToSlideNum) + " spaces.";
                  }
                  break;
               case MgbActor.alActorType_Player:
                  break;
               case MgbActor.alActorType_NPC:
                  _loc3_ = ". " + MgbActor.alMovementType[actorXML.databag.npc.movementType] + ".";
            }
            if(int(actorXML.databag.all.actorType != MgbActor.alActorType_Player))
            {
               _loc3_ += " " + MgbActor.alRespawnOptions[int(actorXML.databag.itemOrNPC.respawnOption)];
            }
         }
         return (param1 ? name + ": " : "") + alActorTypeShort[int(actorXML.databag.all.actorType)] + _loc3_;
      }
      
      private function addDGArrayItem(param1:String, param2:String = "no effect", param3:String = "") : void
      {
         DGArray[getDGArrayItemIndex(param1)] = {
            "action":param1,
            "effect":param2,
            "tilename":param3
         };
      }
      
      private function createDefaultDGArray() : void
      {
         DGArray = new Array();
         addDGArrayItem("face north");
         addDGArrayItem("step north 1");
         addDGArrayItem("step north 2");
         addDGArrayItem("step north 3");
         addDGArrayItem("step north 4");
         addDGArrayItem("face east");
         addDGArrayItem("step east 1");
         addDGArrayItem("step east 2");
         addDGArrayItem("step east 3");
         addDGArrayItem("step east 4");
         addDGArrayItem("face south");
         addDGArrayItem("step south 1");
         addDGArrayItem("step south 2");
         addDGArrayItem("step south 3");
         addDGArrayItem("step south 4");
         addDGArrayItem("face west");
         addDGArrayItem("step west 1");
         addDGArrayItem("step west 2");
         addDGArrayItem("step west 3");
         addDGArrayItem("step west 4");
         addDGArrayItem("stationary 1");
         addDGArrayItem("stationary 2");
         addDGArrayItem("stationary 3");
         addDGArrayItem("stationary 4");
         addDGArrayItem("stationary 5");
         addDGArrayItem("stationary 6");
         addDGArrayItem("stationary 7");
         addDGArrayItem("stationary 8");
         addDGArrayItem("stationary 9");
         addDGArrayItem("stationary 10");
         addDGArrayItem("stationary 11");
         addDGArrayItem("stationary 12");
         addDGArrayItem("stationary 13");
         addDGArrayItem("stationary 14");
         addDGArrayItem("stationary 15");
         addDGArrayItem("stationary 16");
         addDGArrayItem("melee north 1");
         addDGArrayItem("melee north 2");
         addDGArrayItem("melee north 3");
         addDGArrayItem("melee north 4");
         addDGArrayItem("melee north 5");
         addDGArrayItem("melee north 6");
         addDGArrayItem("melee north 7");
         addDGArrayItem("melee north 8");
         addDGArrayItem("melee east 1");
         addDGArrayItem("melee east 2");
         addDGArrayItem("melee east 3");
         addDGArrayItem("melee east 4");
         addDGArrayItem("melee east 5");
         addDGArrayItem("melee east 6");
         addDGArrayItem("melee east 7");
         addDGArrayItem("melee east 8");
         addDGArrayItem("melee south 1");
         addDGArrayItem("melee south 2");
         addDGArrayItem("melee south 3");
         addDGArrayItem("melee south 4");
         addDGArrayItem("melee south 5");
         addDGArrayItem("melee south 6");
         addDGArrayItem("melee south 7");
         addDGArrayItem("melee south 8");
         addDGArrayItem("melee west 1");
         addDGArrayItem("melee west 2");
         addDGArrayItem("melee west 3");
         addDGArrayItem("melee west 4");
         addDGArrayItem("melee west 5");
         addDGArrayItem("melee west 6");
         addDGArrayItem("melee west 7");
         addDGArrayItem("melee west 8");
         addDGArrayItem("stationary north 1");
         addDGArrayItem("stationary north 2");
         addDGArrayItem("stationary north 3");
         addDGArrayItem("stationary north 4");
         addDGArrayItem("stationary north 5");
         addDGArrayItem("stationary north 6");
         addDGArrayItem("stationary north 7");
         addDGArrayItem("stationary north 8");
         addDGArrayItem("stationary north 9");
         addDGArrayItem("stationary north 10");
         addDGArrayItem("stationary north 11");
         addDGArrayItem("stationary north 12");
         addDGArrayItem("stationary north 13");
         addDGArrayItem("stationary north 14");
         addDGArrayItem("stationary north 15");
         addDGArrayItem("stationary north 16");
         addDGArrayItem("stationary east 1");
         addDGArrayItem("stationary east 2");
         addDGArrayItem("stationary east 3");
         addDGArrayItem("stationary east 4");
         addDGArrayItem("stationary east 5");
         addDGArrayItem("stationary east 6");
         addDGArrayItem("stationary east 7");
         addDGArrayItem("stationary east 8");
         addDGArrayItem("stationary east 9");
         addDGArrayItem("stationary east 10");
         addDGArrayItem("stationary east 11");
         addDGArrayItem("stationary east 12");
         addDGArrayItem("stationary east 13");
         addDGArrayItem("stationary east 14");
         addDGArrayItem("stationary east 15");
         addDGArrayItem("stationary east 16");
         addDGArrayItem("stationary south 1");
         addDGArrayItem("stationary south 2");
         addDGArrayItem("stationary south 3");
         addDGArrayItem("stationary south 4");
         addDGArrayItem("stationary south 5");
         addDGArrayItem("stationary south 6");
         addDGArrayItem("stationary south 7");
         addDGArrayItem("stationary south 8");
         addDGArrayItem("stationary south 9");
         addDGArrayItem("stationary south 10");
         addDGArrayItem("stationary south 11");
         addDGArrayItem("stationary south 12");
         addDGArrayItem("stationary south 13");
         addDGArrayItem("stationary south 14");
         addDGArrayItem("stationary south 15");
         addDGArrayItem("stationary south 16");
         addDGArrayItem("stationary west 1");
         addDGArrayItem("stationary west 2");
         addDGArrayItem("stationary west 3");
         addDGArrayItem("stationary west 4");
         addDGArrayItem("stationary west 5");
         addDGArrayItem("stationary west 6");
         addDGArrayItem("stationary west 7");
         addDGArrayItem("stationary west 8");
         addDGArrayItem("stationary west 9");
         addDGArrayItem("stationary west 10");
         addDGArrayItem("stationary west 11");
         addDGArrayItem("stationary west 12");
         addDGArrayItem("stationary west 13");
         addDGArrayItem("stationary west 14");
         addDGArrayItem("stationary west 15");
         addDGArrayItem("stationary west 16");
      }
      
      public function set animationTable(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1457864022animationTable;
         if(_loc2_ !== param1)
         {
            this._1457864022animationTable = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animationTable",_loc2_,param1));
         }
      }
      
      override public function loadByName(param1:String, param2:String, param3:String, param4:Function = null, param5:Boolean = false, param6:int = 3) : void
      {
         actorLoadCallback = param4;
         super.loadByName(param1,param2,param3,actorLoadHandler,param5,param6);
      }
      
      override public function loadPieceFromPiece(param1:Piece) : void
      {
         super.loadPieceFromPiece(param1);
         actorXML = new XML(MgbActor(param1).actorXML);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(MgbActor(param1).DGArray);
         _loc2_.position = 0;
         DGArray = _loc2_.readObject();
         animationTable = new ArrayCollection(DGArray);
      }
      
      private function actorLoadHandler(param1:ResultEvent) : void
      {
         var _loc3_:ByteArray = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc2_:Boolean = false;
         if(!param1.result.hasOwnProperty("mgb_error"))
         {
            _loc3_ = Base64ByteArray.Decode(String(param1.result.piece.blob));
            _loc3_.uncompress();
            _loc4_ = _loc3_.readUTF();
            actorXML = new XML(_loc4_.replace(/{{{/g,"<").replace(/}}}/g,">"));
            createDefaultDGArray();
            animationTable = new ArrayCollection(DGArray);
            if((Boolean(_loc5_ = actorXML.animationTable)) && _loc5_ != "")
            {
               _loc6_ = _loc5_.split("#");
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc8_ = String(_loc6_[_loc7_]).split("|");
                  addDGArrayItem(_loc8_[0],_loc8_[2],_loc8_[1]);
                  _loc7_++;
               }
               animationTable.refresh();
            }
            actorXML.animationTable = null;
            _loc2_ = true;
            this.blob = null;
         }
         if(null != actorLoadCallback)
         {
            actorLoadCallback(param1);
         }
         if(_loc2_)
         {
            issuePieceChangedEventOpSuccessful();
         }
      }
      
      private function getDGArrayItemIndex(param1:String) : int
      {
         switch(param1)
         {
            case "face north":
               return 0;
            case "step north 1":
               return 1;
            case "step north 2":
               return 2;
            case "step north 3":
               return 3;
            case "step north 4":
               return 4;
            case "face east":
               return 5;
            case "step east 1":
               return 6;
            case "step east 2":
               return 7;
            case "step east 3":
               return 8;
            case "step east 4":
               return 9;
            case "face south":
               return 10;
            case "step south 1":
               return 11;
            case "step south 2":
               return 12;
            case "step south 3":
               return 13;
            case "step south 4":
               return 14;
            case "face west":
               return 15;
            case "step west 1":
               return 16;
            case "step west 2":
               return 17;
            case "step west 3":
               return 18;
            case "step west 4":
               return 19;
            case "stationary 1":
               return 20;
            case "stationary 2":
               return 21;
            case "stationary 3":
               return 22;
            case "stationary 4":
               return 23;
            case "stationary 5":
               return 24;
            case "stationary 6":
               return 25;
            case "stationary 7":
               return 26;
            case "stationary 8":
               return 27;
            case "stationary 9":
               return 28;
            case "stationary 10":
               return 29;
            case "stationary 11":
               return 30;
            case "stationary 12":
               return 31;
            case "stationary 13":
               return 32;
            case "stationary 14":
               return 33;
            case "stationary 15":
               return 34;
            case "stationary 16":
               return 35;
            case "melee north 1":
               return 36;
            case "melee north 2":
               return 37;
            case "melee north 3":
               return 38;
            case "melee north 4":
               return 39;
            case "melee north 5":
               return 40;
            case "melee north 6":
               return 41;
            case "melee north 7":
               return 42;
            case "melee north 8":
               return 43;
            case "melee east 1":
               return 44;
            case "melee east 2":
               return 45;
            case "melee east 3":
               return 46;
            case "melee east 4":
               return 47;
            case "melee east 5":
               return 48;
            case "melee east 6":
               return 49;
            case "melee east 7":
               return 50;
            case "melee east 8":
               return 51;
            case "melee south 1":
               return 52;
            case "melee south 2":
               return 53;
            case "melee south 3":
               return 54;
            case "melee south 4":
               return 55;
            case "melee south 5":
               return 56;
            case "melee south 6":
               return 57;
            case "melee south 7":
               return 58;
            case "melee south 8":
               return 59;
            case "melee west 1":
               return 60;
            case "melee west 2":
               return 61;
            case "melee west 3":
               return 62;
            case "melee west 4":
               return 63;
            case "melee west 5":
               return 64;
            case "melee west 6":
               return 65;
            case "melee west 7":
               return 66;
            case "melee west 8":
               return 67;
            case "stationary north 1":
               return 68;
            case "stationary north 2":
               return 69;
            case "stationary north 3":
               return 70;
            case "stationary north 4":
               return 71;
            case "stationary north 5":
               return 72;
            case "stationary north 6":
               return 73;
            case "stationary north 7":
               return 74;
            case "stationary north 8":
               return 75;
            case "stationary north 9":
               return 76;
            case "stationary north 10":
               return 77;
            case "stationary north 11":
               return 78;
            case "stationary north 12":
               return 79;
            case "stationary north 13":
               return 80;
            case "stationary north 14":
               return 81;
            case "stationary north 15":
               return 82;
            case "stationary north 16":
               return 83;
            case "stationary east 1":
               return 84;
            case "stationary east 2":
               return 85;
            case "stationary east 3":
               return 86;
            case "stationary east 4":
               return 87;
            case "stationary east 5":
               return 88;
            case "stationary east 6":
               return 89;
            case "stationary east 7":
               return 90;
            case "stationary east 8":
               return 91;
            case "stationary east 9":
               return 92;
            case "stationary east 10":
               return 93;
            case "stationary east 11":
               return 94;
            case "stationary east 12":
               return 95;
            case "stationary east 13":
               return 96;
            case "stationary east 14":
               return 97;
            case "stationary east 15":
               return 98;
            case "stationary east 16":
               return 99;
            case "stationary south 1":
               return 100;
            case "stationary south 2":
               return 101;
            case "stationary south 3":
               return 102;
            case "stationary south 4":
               return 103;
            case "stationary south 5":
               return 104;
            case "stationary south 6":
               return 105;
            case "stationary south 7":
               return 106;
            case "stationary south 8":
               return 107;
            case "stationary south 9":
               return 108;
            case "stationary south 10":
               return 109;
            case "stationary south 11":
               return 110;
            case "stationary south 12":
               return 111;
            case "stationary south 13":
               return 112;
            case "stationary south 14":
               return 113;
            case "stationary south 15":
               return 114;
            case "stationary south 16":
               return 115;
            case "stationary west 1":
               return 116;
            case "stationary west 2":
               return 117;
            case "stationary west 3":
               return 118;
            case "stationary west 4":
               return 119;
            case "stationary west 5":
               return 120;
            case "stationary west 6":
               return 121;
            case "stationary west 7":
               return 122;
            case "stationary west 8":
               return 123;
            case "stationary west 9":
               return 124;
            case "stationary west 10":
               return 125;
            case "stationary west 11":
               return 126;
            case "stationary west 12":
               return 127;
            case "stationary west 13":
               return 128;
            case "stationary west 14":
               return 129;
            case "stationary west 15":
               return 130;
            case "stationary west 16":
               return 131;
            default:
               throw new Error("Unknown animation action \'" + param1 + "\'");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actorXML() : XML
      {
         return this._1650562590actorXML;
      }
      
      public function loadUsingDialogChoiceHandler(param1:String, param2:String, param3:String) : void
      {
         this.loadByName(param1,param2,param3,loadChoiceCallback);
         loadChoiceCallback = null;
      }
      
      override public function loadUsingDialog(param1:String, param2:String, param3:DisplayObject, param4:Function = null) : void
      {
         loadChoiceCallback = param4;
         super.loadUsingDialog(param1,param2,param3,loadUsingDialogChoiceHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get animationTable() : ArrayCollection
      {
         return this._1457864022animationTable;
      }
      
      public function newActor() : void
      {
         createDefaultDGArray();
         this.animationTable = new ArrayCollection(DGArray);
         this.actorXML = new XML();
         this.name = "";
         this.comment = "";
      }
      
      override public function save(param1:Function = null) : void
      {
         XML.prettyPrinting = false;
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < animationTable.length)
         {
            _loc2_ += (!!_loc3_ ? "#" : "") + animationTable[_loc3_].action + "|" + animationTable[_loc3_].tilename + "|" + animationTable[_loc3_].effect;
            _loc3_++;
         }
         actorXML.animationTable = _loc2_;
         var _loc4_:String = new String();
         _loc4_ = actorXML.toXMLString().replace(/</g,"{{{").replace(/>/g,"}}}");
         var _loc5_:ByteArray;
         (_loc5_ = new ByteArray()).writeUTF(_loc4_);
         _loc5_.compress();
         this.blob = Base64ByteArray.Encode(_loc5_);
         this.blobencoding = 0;
         actorXML.animationTable = null;
         this.width = 0;
         this.height = 0;
         super.save(param1);
      }
   }
}
