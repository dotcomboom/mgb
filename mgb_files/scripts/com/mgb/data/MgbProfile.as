package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.display.DisplayObject;
   import flash.utils.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.ResultEvent;
   import mx.utils.*;
   
   public class MgbProfile extends Piece
   {
      
      public static const USER_PROFILE:String = "user";
       
      
      private var loadChoiceCallback:Function = null;
      
      private var _1102651762profileObj:ObjectProxy;
      
      private var profileLoadCallback:Function = null;
      
      public function MgbProfile()
      {
         _1102651762profileObj = new ObjectProxy();
         super(MGB_PROFILE);
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
      
      public function set profileObj(param1:ObjectProxy) : void
      {
         var _loc2_:Object = this._1102651762profileObj;
         if(_loc2_ !== param1)
         {
            this._1102651762profileObj = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"profileObj",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get profileObj() : ObjectProxy
      {
         return this._1102651762profileObj;
      }
      
      override public function loadByName(param1:String, param2:String, param3:String, param4:Function = null, param5:Boolean = false, param6:int = 3) : void
      {
         profileLoadCallback = param4;
         super.loadByName(param1,param2,param3,profileLoadHandler,param5,param6);
      }
      
      private function profileLoadHandler(param1:ResultEvent) : void
      {
         var pack2:ByteArray = null;
         var uncompressedOK:Boolean = false;
         var pack:String = null;
         var R:Array = null;
         var row:int = 0;
         var C:Array = null;
         var event:ResultEvent = param1;
         var loadedOK:Boolean = false;
         if(!event.result.hasOwnProperty("mgb_error"))
         {
            pack2 = Base64ByteArray.Decode(String(event.result.piece.blob));
            uncompressedOK = false;
            try
            {
               pack2.uncompress();
               uncompressedOK = true;
            }
            catch(err:Error)
            {
               MgbLogger.getInstance().logException("Could not uncompress profile string",err);
            }
            if(uncompressedOK)
            {
               pack = pack2.readUTF();
               R = pack.split("#");
               this.profileObj = new ObjectProxy();
               row = 0;
               while(row < R.length)
               {
                  C = String(R[row]).split("|");
                  profileObj[C[0]] = C[1];
                  row++;
               }
               loadedOK = true;
               this.blob = null;
            }
         }
         if(null != profileLoadCallback)
         {
            profileLoadCallback(event);
         }
         if(loadedOK)
         {
            issuePieceChangedEventOpSuccessful();
         }
      }
      
      override public function loadPieceFromPiece(param1:Piece) : void
      {
         super.loadPieceFromPiece(param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(MgbProfile(param1).profileObj);
         _loc2_.position = 0;
         this.profileObj = _loc2_.readObject();
      }
      
      override public function save(param1:Function = null) : void
      {
         var _loc4_:String = null;
         var _loc5_:ByteArray = null;
         var _loc2_:Boolean = false;
         var _loc3_:String = new String();
         for(_loc4_ in profileObj)
         {
            _loc3_ += (_loc2_ ? "" : "#") + _loc4_ + "|" + profileObj[_loc4_];
            _loc2_ = false;
         }
         (_loc5_ = new ByteArray()).writeUTF(_loc3_);
         _loc5_.compress();
         this.blob = Base64ByteArray.Encode(_loc5_);
         this.blobencoding = 0;
         this.width = 0;
         this.height = 0;
         super.save(param1);
      }
   }
}
