package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.utils.*;
   import mx.rpc.events.*;
   
   public class MgbTile extends Piece
   {
       
      
      private var tileLoadCallback:Function = null;
      
      private var loadChoiceCallback:Function = null;
      
      public var effectedBitmapDataArray:Array;
      
      public var bitmapData:BitmapData = null;
      
      private var _loader:Loader;
      
      public function MgbTile()
      {
         effectedBitmapDataArray = new Array();
         _loader = new Loader();
         super(MGB_TILE);
         this.bitmapData = new BitmapData(MgbSystem.tileMinWidth,MgbSystem.tileMinHeight);
      }
      
      private function setBitmapData(param1:BitmapData) : void
      {
         if(param1)
         {
            if(bitmapData)
            {
               bitmapData.dispose();
            }
            bitmapData = param1.clone();
         }
         else
         {
            if(bitmapData)
            {
               bitmapData.dispose();
            }
            bitmapData = null;
         }
         clearVariants();
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
      
      public function bitmapDataVariant(param1:String) : BitmapData
      {
         if(param1 == null || param1 == "" || param1 == "no effect" || null == bitmapData)
         {
            return bitmapData;
         }
         if(effectedBitmapDataArray[param1])
         {
            return effectedBitmapDataArray[param1];
         }
         var _loc2_:int = bitmapData.width;
         var _loc3_:int = bitmapData.height;
         var _loc4_:BitmapData = new BitmapData(_loc2_,_loc3_,bitmapData.transparent,16777215);
         var _loc5_:Matrix = new Matrix();
         switch(param1)
         {
            case "rotate90":
               _loc5_.createBox(1,1,Math.PI * 0.5,_loc2_,0);
               break;
            case "rotate180":
               _loc5_.createBox(1,1,Math.PI,_loc2_,_loc3_);
               break;
            case "rotate270":
               _loc5_.createBox(1,1,Math.PI * 1.5,0,_loc3_);
               break;
            case "flipX":
               _loc5_.createBox(-1,1,0,_loc2_,0);
               break;
            case "flipY":
               _loc5_.createBox(1,-1,0,0,_loc3_);
               break;
            default:
               throw new Error("Unknown tile effect \'" + param1 + "\'");
         }
         _loc4_.draw(bitmapData,_loc5_);
         effectedBitmapDataArray[param1] = _loc4_;
         return _loc4_;
      }
      
      override public function loadByName(param1:String, param2:String, param3:String, param4:Function = null, param5:Boolean = false, param6:int = 3) : void
      {
         tileLoadCallback = param4;
         super.loadByName(param1,param2,param3,tileLoadHandler,param5,param6);
      }
      
      private function loadedImageHandler(param1:Event) : void
      {
         var _loc2_:ResultEvent = null;
         setBitmapData(Bitmap(_loader.content).bitmapData);
         if(null != tileLoadCallback)
         {
            _loc2_ = new ResultEvent(ResultEvent.RESULT,false,true,new Object());
            _loc2_.result.piece = this;
            tileLoadCallback(_loc2_);
         }
         issuePieceChangedEventOpSuccessful();
      }
      
      private function tileLoadHandler(param1:ResultEvent) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:String = null;
         if(!param1.result.hasOwnProperty("mgb_error") || param1.result.hasOwnProperty("mgb_error") && 0 == param1.result.mgb_error)
         {
            if(param1.result.piece.name != this.name)
            {
               trace("@@@@@ " + param1.result.piece.name + " != " + this.name);
            }
            _loc2_ = new ByteArray();
            _loc3_ = String(this.blob.toString());
            _loc2_ = Base64ByteArray.Decode(_loc3_);
            _loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadedImageHandler);
            _loader.loadBytes(_loc2_);
            this.blob = null;
         }
      }
      
      public function clearVariants() : void
      {
         effectedBitmapDataArray = new Array();
      }
      
      override public function loadPieceFromPiece(param1:Piece) : void
      {
         super.loadPieceFromPiece(param1);
         setBitmapData(MgbTile(param1).bitmapData);
         this.blob = null;
      }
      
      override public function save(param1:Function = null) : void
      {
         var _loc2_:ByteArray = PNGEncoder.encodeAsPNG(bitmapData);
         this.tilename = "";
         this.blob = Base64ByteArray.Encode(_loc2_);
         this.blobencoding = 0;
         this.width = bitmapData.width;
         this.height = bitmapData.height;
         super.save(param1);
      }
   }
}
