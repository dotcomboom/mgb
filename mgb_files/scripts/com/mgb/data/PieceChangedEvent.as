package com.mgb.data
{
   import com.mgb.managers.*;
   import flash.events.Event;
   
   public class PieceChangedEvent extends Event
   {
      
      public static const CHANGE:String = "pieceChanged";
       
      
      public var operation:String;
      
      public var pieceType:String;
      
      public var pieceProject:String;
      
      public var piece:Piece;
      
      public var pieceName:String;
      
      public function PieceChangedEvent(param1:String, param2:String, param3:String, param4:String, param5:String, param6:Piece)
      {
         if(param1 != CHANGE)
         {
            MgbLogger.getInstance().logBug("Unexpected eventType \'" + param1 + "\' for PieceChangedEvent()");
         }
         this.operation = param2;
         this.pieceName = param3;
         this.pieceType = param4;
         this.pieceProject = param5;
         this.piece = param6;
         super(param1,false,false);
      }
      
      public function wasPieceSavedOrDeleted() : Boolean
      {
         return operation == Piece.MGB_OP_DELETE || operation == Piece.MGB_OP_SAVE;
      }
      
      override public function clone() : Event
      {
         return new PieceChangedEvent(type,operation,pieceName,pieceType,pieceProject,piece);
      }
   }
}
