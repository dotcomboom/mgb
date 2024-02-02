package com.mgb.data
{
   import com.mgb.managers.*;
   import flash.events.*;
   import mx.collections.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.ResultEvent;
   
   public class PieceList extends EventDispatcher
   {
      
      private static const state_LISTREADY:int = 1;
      
      private static const state_LOADINGLIST:int = 2;
      
      public static var EVENT_LOAD_COMPLETE:String = "MgbPieceListLoadComplete";
       
      
      private var projectName:String = null;
      
      private var pieces:Array;
      
      private var pieceType:String = null;
      
      private var state:int = 1;
      
      private var loadSuccessful:Boolean = false;
      
      private var _1260658248mgbLogger:MgbLogger;
      
      private var _689037785piecesAC:ArrayCollection;
      
      public function PieceList(param1:String)
      {
         pieces = new Array();
         _689037785piecesAC = new ArrayCollection(pieces);
         _1260658248mgbLogger = MgbLogger.getInstance();
         super();
         this.pieceType = new String(param1);
         MgbGlobalEventer.getInstance().addEventListener(PieceChangedEvent.CHANGE,processPieceChange);
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_PROJECT_CHANGED,processProjectChange);
      }
      
      private function cancelLoad() : void
      {
         MgbLogger.getInstance().logBug("need to code the cancel handler for PieceList");
      }
      
      public function set piecesAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._689037785piecesAC;
         if(_loc2_ !== param1)
         {
            this._689037785piecesAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"piecesAC",_loc2_,param1));
         }
      }
      
      private function removePieceFromList(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < piecesAC.length)
         {
            if(piecesAC[_loc2_].name == param1)
            {
               piecesAC.removeItemAt(_loc2_);
               return;
            }
            _loc2_++;
         }
      }
      
      private function processPieceChange(param1:PieceChangedEvent) : void
      {
         if(param1.pieceType == this.pieceType && param1.pieceProject == this.projectName)
         {
            switch(param1.operation)
            {
               case Piece.MGB_OP_DELETE:
                  removePieceFromList(param1.pieceName);
                  break;
               case Piece.MGB_OP_SAVE:
                  addPieceToList(param1.piece);
                  break;
               case Piece.MGB_OP_LOAD:
            }
         }
      }
      
      private function doLoad(param1:String = null) : void
      {
         var _loc2_:S3Service = new S3Service();
         var _loc3_:Object = new Object();
         this.projectName = MgbSession.getInstance().activeProject;
         _loc3_.piecetype = pieceType;
         if(param1)
         {
            _loc3_.marker = param1;
         }
         if(this.pieceType == Piece.MGB_TUTORIAL)
         {
            _loc3_.overrideUsername = MgbSystem.reservedSystemUserName;
            _loc3_.overrideProject = MgbSystem.reservedSystemProjectName;
         }
         else
         {
            _loc3_.overrideUsername = MgbSession.getInstance().userName;
            _loc3_.overrideProject = MgbSession.getInstance().activeProject;
         }
         _loc2_.request("list",s3ListResult,_loc3_);
      }
      
      private function s3ListResult(param1:ResultEvent) : void
      {
         if(param1.result.hasOwnProperty("mgb_error") && 0 != param1.result.mgb_error)
         {
            mgbLogger.logError("Could not list " + this.pieceType + "s in project \'" + projectName + "\' (error #" + param1.result.mgb_error + ")",false);
         }
         else
         {
            updatePieceList(param1.result.pieceList);
            if(param1.result.truncated)
            {
               trace("Loading piecelist - continuation from key: " + param1.result.lastKey);
               doLoad(MgbSession.getInstance().userName + "/" + param1.result.lastKey);
            }
            else
            {
               state = state_LISTREADY;
               loadSuccessful = true;
               this.dispatchEvent(new Event(PieceList.EVENT_LOAD_COMPLETE));
            }
         }
      }
      
      public function ready() : Boolean
      {
         return state == state_LISTREADY && loadSuccessful == true;
      }
      
      public function load(param1:String = null) : void
      {
         if(param1)
         {
            this.pieceType = new String(param1);
         }
         if(state != state_LOADINGLIST)
         {
            state = state_LOADINGLIST;
            piecesAC.removeAll();
            loadSuccessful = false;
            piecesAC.sort = new Sort();
            piecesAC.sort.fields = [new SortField("name",true)];
            piecesAC.refresh();
            doLoad();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get piecesAC() : ArrayCollection
      {
         return this._689037785piecesAC;
      }
      
      private function updatePieceList(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            piecesAC.addItem({
               "name":_loc2_,
               "date":param1[_loc2_]
            });
         }
         piecesAC.refresh();
      }
      
      public function addPieceToList(param1:Piece, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < piecesAC.length)
         {
            if(piecesAC[_loc3_].name == param1.name)
            {
               piecesAC.setItemAt({
                  "name":param1.name,
                  "date":param1.lastSaved
               },_loc3_);
               return;
            }
            _loc3_++;
         }
         piecesAC.addItem({
            "name":param1.name,
            "date":param1.lastSaved
         });
         piecesAC.refresh();
      }
      
      private function set mgbLogger(param1:MgbLogger) : void
      {
         var _loc2_:Object = this._1260658248mgbLogger;
         if(_loc2_ !== param1)
         {
            this._1260658248mgbLogger = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbLogger",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbLogger() : MgbLogger
      {
         return this._1260658248mgbLogger;
      }
      
      private function processProjectChange(param1:Event) : void
      {
         trace("processProjectChange(" + pieceType + ") -> " + MgbSession.getInstance().activeProject);
         piecesAC.removeAll();
         piecesAC.refresh();
         if(MgbSession.getInstance().activeProject != null && MgbSession.getInstance().userName != null)
         {
            state = state_LISTREADY;
            this.load();
         }
      }
   }
}
