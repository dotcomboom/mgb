package com.mgb.data
{
   import com.mgb.utils.*;
   import flash.display.DisplayObject;
   import flash.utils.*;
   import mx.collections.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.ResultEvent;
   
   public class MgbTutorial extends Piece
   {
       
      
      private var tutorialLoadCallback:Function = null;
      
      private var loadChoiceCallback:Function = null;
      
      private var _113558tAC:ArrayCollection;
      
      public function MgbTutorial()
      {
         super(MGB_TUTORIAL);
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
      
      override public function loadByName(param1:String, param2:String, param3:String, param4:Function = null, param5:Boolean = false, param6:int = 3) : void
      {
         tutorialLoadCallback = param4;
         super.loadByName(param1,param2,param3,tutorialLoadHandler,param5,param6);
      }
      
      private function tutorialLoadHandler(param1:ResultEvent) : void
      {
         var _loc3_:ByteArray = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc2_:Boolean = false;
         if(!param1.result.hasOwnProperty("mgb_error"))
         {
            _loc3_ = Base64ByteArray.Decode(String(param1.result.piece.blob));
            _loc3_.uncompress();
            _loc5_ = (_loc4_ = _loc3_.readUTF()).split("#");
            this.tAC = new ArrayCollection();
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc7_ = String(_loc5_[_loc6_]).split("|");
               this.tAC.addItem({
                  "message":_loc7_[0],
                  "graphic":_loc7_[1],
                  "completionTag":_loc7_[2],
                  "rewardResult":_loc7_[3]
               });
               _loc6_++;
            }
            _loc2_ = true;
            this.blob = null;
         }
         if(null != tutorialLoadCallback)
         {
            tutorialLoadCallback(param1);
         }
         if(_loc2_)
         {
            issuePieceChangedEventOpSuccessful();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tAC() : ArrayCollection
      {
         return this._113558tAC;
      }
      
      public function set tAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._113558tAC;
         if(_loc2_ !== param1)
         {
            this._113558tAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tAC",_loc2_,param1));
         }
      }
      
      override public function loadPieceFromPiece(param1:Piece) : void
      {
         super.loadPieceFromPiece(param1);
         throw new Error("TODO: Complete loadPieceFromPiece(tutorial:Piece)");
      }
      
      override public function save(param1:Function = null) : void
      {
         this.blobencoding = 0;
         this.width = 1;
         this.height = tAC.length;
         this.tilename = "";
         var _loc2_:String = new String();
         var _loc3_:int = 0;
         while(_loc3_ < tAC.length)
         {
            _loc2_ += (!!_loc3_ ? "#" : "") + tAC[_loc3_].message + "|" + tAC[_loc3_].graphic + "|" + tAC[_loc3_].completionTag + "|" + tAC[_loc3_].rewardResult;
            _loc3_++;
         }
         var _loc4_:ByteArray;
         (_loc4_ = new ByteArray()).writeUTF(_loc2_);
         _loc4_.compress();
         this.blob = Base64ByteArray.Encode(_loc4_);
         super.save(param1);
      }
   }
}
