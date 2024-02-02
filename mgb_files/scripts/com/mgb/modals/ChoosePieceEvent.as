package com.mgb.modals
{
   import flash.events.Event;
   
   public class ChoosePieceEvent extends Event
   {
       
      
      public var pieceName:String;
      
      public var originalPieceName:String;
      
      public var activating:Boolean;
      
      public var pieceComment:String;
      
      public var username:String;
      
      public var project:String;
      
      public var contextHint:Object;
      
      public function ChoosePieceEvent(param1:String, param2:String, param3:String, param4:String, param5:Boolean, param6:String, param7:String, param8:Object)
      {
         this.username = param2;
         this.project = param3;
         this.pieceName = param4;
         this.activating = param5;
         this.originalPieceName = param6;
         this.pieceComment = param7;
         this.contextHint = param8;
         super(param1,false,false);
      }
   }
}
