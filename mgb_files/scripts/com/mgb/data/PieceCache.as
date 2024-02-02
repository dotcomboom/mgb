package com.mgb.data
{
   import com.mgb.managers.*;
   import flash.events.Event;
   import mx.rpc.events.ResultEvent;
   
   public class PieceCache
   {
       
      
      private var hits:int = 0;
      
      private var projectName:String = null;
      
      private var pieces:Array;
      
      private var callbacks:Array;
      
      private var pieceType:String;
      
      public var flushOnProjectChange:Boolean = true;
      
      private var misses:int = 0;
      
      private var mgbSession:MgbSession;
      
      public function PieceCache(param1:String)
      {
         pieces = new Array();
         callbacks = new Array();
         mgbSession = MgbSession.getInstance();
         super();
         this.pieceType = param1;
         MgbGlobalEventer.getInstance().addEventListener(PieceChangedEvent.CHANGE,processPieceChange);
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_PROJECT_CHANGED,processProjectChange);
      }
      
      public function loadPendingCount() : int
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         for(_loc2_ in pieces)
         {
            if(Piece(pieces[_loc2_]).loadPending)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function pieceCacheCompletionCallbackMultiplexer(param1:ResultEvent) : void
      {
         var _loc2_:Piece = Piece(param1.result.piece);
         var _loc3_:String = String(makeCacheIndexField(_loc2_.name,_loc2_.userName,_loc2_.projectName));
         var _loc4_:Function = null;
         if(callbacks[_loc3_])
         {
            while((_loc4_ = callbacks[_loc3_].pop()) != null)
            {
               _loc4_(_loc2_);
            }
         }
         callbacks[_loc3_] = null;
      }
      
      private function processPieceChange(param1:PieceChangedEvent) : void
      {
         if(param1.pieceType == this.pieceType && param1.pieceProject == mgbSession.activeProject)
         {
            switch(param1.operation)
            {
               case Piece.MGB_OP_DELETE:
                  destroyPiece(param1.pieceName,mgbSession.userName,mgbSession.activeProject);
                  break;
               case Piece.MGB_OP_SAVE:
                  setPiece(param1.piece,param1.piece.userName,param1.piece.projectName);
                  break;
               case Piece.MGB_OP_LOAD:
            }
         }
      }
      
      public function destroyPiece(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:String = String(makeCacheIndexField(param1,param2,param3));
         trace("PieceCache.destroyPiece(" + param2 + "," + param3 + "," + param1 + ")");
         pieces[_loc4_] = null;
      }
      
      private function makePiece(param1:String) : Piece
      {
         switch(param1)
         {
            case Piece.MGB_TILE:
               return new MgbTile();
            case Piece.MGB_ACTOR:
               return new MgbActor();
            case Piece.MGB_MAP:
               return new MgbMap();
            case Piece.MGB_TUTORIAL:
               return new MgbTutorial();
            case Piece.MGB_PROFILE:
               return new MgbProfile();
            case Piece.MGB_SCREENSHOT:
               return new MgbScreenshot();
            default:
               throw new Error("unknown pieceType \'" + param1 + "\' in PieceCache.makePiece()");
         }
      }
      
      private function makeCacheIndexField(param1:String, param2:String, param3:String) : String
      {
         return (!!param2 ? param2 + "!!" : "") + (!!param3 ? param3 + "##" : "") + param1;
      }
      
      public function setPiece(param1:Piece, param2:String, param3:String) : void
      {
         trace("PieceCache::setPiece(" + param2 + "," + param3 + "," + param1.name + ")");
         var _loc4_:String = String(makeCacheIndexField(param1.name,param2,param3));
         if(pieces[_loc4_] == null)
         {
            pieces[_loc4_] = makePiece(this.pieceType);
         }
         pieces[_loc4_].loadPieceFromPiece(param1);
      }
      
      public function getPieceIfCached(param1:String, param2:String, param3:String) : Piece
      {
         if(!param3 || param3 == "")
         {
            return null;
         }
         var _loc4_:String = String(makeCacheIndexField(param3,param1,param2));
         if(pieces[_loc4_])
         {
            ++hits;
            return pieces[_loc4_];
         }
         ++misses;
         return null;
      }
      
      public function getPiece(param1:String, param2:String, param3:String, param4:Function = null, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Piece
      {
         if(!param3 || param3 == "")
         {
            return null;
         }
         var _loc8_:String = String(makeCacheIndexField(param3,param1,param2));
         if(pieces[_loc8_] && !param5 && !(param7 == true && pieces[_loc8_].loadFailed == true))
         {
            ++hits;
            if(param4 != null)
            {
               if(!pieces[_loc8_].loadPending)
               {
                  param4(pieces[_loc8_]);
                  param4 = null;
               }
            }
         }
         else
         {
            ++misses;
            if(pieces[_loc8_] == null)
            {
               pieces[_loc8_] = makePiece(this.pieceType);
            }
            pieces[_loc8_].loadByName(param1,param2,param3,pieceCacheCompletionCallbackMultiplexer,param6,2);
         }
         if(param4 != null)
         {
            if(callbacks[_loc8_] == null)
            {
               callbacks[_loc8_] = new Array();
            }
            callbacks[_loc8_].push(param4);
         }
         return Piece(pieces[_loc8_]);
      }
      
      private function processProjectChange(param1:Event) : void
      {
      }
      
      public function flushcache() : void
      {
         pieces = new Array();
         callbacks = new Array();
      }
   }
}
