package com.mgb.controls
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import mx.core.Application;
   import mx.core.UIComponent;
   
   public class BitmapDuper extends UIComponent
   {
       
      
      private var intendedMaxWidth:int = 64;
      
      private var _shrinkToFitEnabled:Boolean = true;
      
      private var selectArea:Bitmap = null;
      
      private var selectWidth:int;
      
      public var bitmap:Bitmap;
      
      private const selectVisibleColor:uint = 0;
      
      private var activeEffect:String = "";
      
      private var expectedTileName:String;
      
      private const selectMaskColor:uint = 2415919104;
      
      private var selectHeight:int;
      
      private var intendedMaxHeight:int = 64;
      
      private var selectAligned:Boolean = false;
      
      private var expectedUserName:String;
      
      public var tessBitmaps:Array = null;
      
      private var tesselating:Boolean = false;
      
      private var selectX:int;
      
      private var selectY:int;
      
      private var tilePiece:MgbTile;
      
      private var intendedMaxSizesKnown:Boolean = false;
      
      public function BitmapDuper()
      {
         tilePiece = new MgbTile();
         super();
      }
      
      public function set avatarName(param1:String) : void
      {
         drawAvatar(param1);
      }
      
      private function drawSelectArea() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         selectArea.bitmapData.fillRect(new Rectangle(0,0,bitmap.width,bitmap.height),selectMaskColor);
         selectArea.bitmapData.fillRect(new Rectangle(selectX,selectY,selectWidth,selectHeight),selectVisibleColor);
         if(selectAligned)
         {
            _loc1_ = 0;
            while(_loc1_ <= bitmap.width)
            {
               selectArea.bitmapData.fillRect(new Rectangle(_loc1_,0,1,bitmap.height),4278190080);
               _loc1_ += selectWidth;
            }
            _loc2_ = 0;
            while(_loc2_ <= bitmap.height)
            {
               selectArea.bitmapData.fillRect(new Rectangle(0,_loc2_,bitmap.width,1),4278190080);
               _loc2_ += selectHeight;
            }
         }
      }
      
      public function getScreenshotResult(param1:MgbTile) : void
      {
         drawDupe(param1.bitmapDataVariant(activeEffect));
      }
      
      public function drawDupeFromName(param1:String, param2:String, param3:String, param4:String = "", param5:Boolean = false) : void
      {
         drawDupe(null);
         activeEffect = param4;
         if(Boolean(param3) && param3 != "")
         {
            expectedTileName = new String(param3);
            tilePiece = MgbTile(MgbCaches.getInstance().tileCache.getPiece(param1,param2,param3,getTileResult,false,param5));
         }
      }
      
      public function tesselate(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         if(bitmap)
         {
            if(param1 != tesselating)
            {
               if(param1)
               {
                  tessBitmaps = new Array();
                  _loc2_ = 0;
                  while(_loc2_ < 3)
                  {
                     tessBitmaps[_loc2_] = new Bitmap(bitmap.bitmapData);
                     tessBitmaps[_loc2_].x = _loc2_ % 2 * bitmap.bitmapData.width;
                     tessBitmaps[_loc2_].y = int(_loc2_ / 2) * bitmap.bitmapData.height;
                     addChild(tessBitmaps[_loc2_]);
                     _loc2_++;
                  }
                  bitmap.x = bitmap.bitmapData.width;
                  bitmap.y = bitmap.bitmapData.height;
                  bitmap.scaleX = 1;
                  bitmap.scaleY = 1;
               }
               else
               {
                  _loc2_ = 0;
                  while(_loc2_ < 3)
                  {
                     removeChild(tessBitmaps[_loc2_]);
                     tessBitmaps[_loc2_] = null;
                     _loc2_++;
                  }
                  width = intendedMaxWidth;
                  height = intendedMaxHeight;
               }
               tesselating = param1;
               ScaleSizeAndCenterMe();
            }
         }
      }
      
      public function updateBitmapData(param1:BitmapData) : void
      {
         if(bitmap)
         {
            bitmap.bitmapData = param1;
            ScaleSizeAndCenterMe();
         }
      }
      
      public function tesselationToggle() : void
      {
         tesselate(!tesselating);
      }
      
      public function drawDupe(param1:BitmapData = null) : void
      {
         var _loc2_:Boolean = Boolean(tesselating);
         if(!intendedMaxSizesKnown)
         {
            intendedMaxWidth = width == 0 ? int(MgbSystem.tilePreviewWidth) : int(width);
            intendedMaxHeight = height == 0 ? int(MgbSystem.tilePreviewHeight) : int(height);
            intendedMaxSizesKnown = true;
         }
         if(!bitmap)
         {
            bitmap = new Bitmap(new BitmapData(intendedMaxWidth,intendedMaxHeight,true,0));
            addChild(bitmap);
         }
         if(_loc2_)
         {
            tesselate(false);
         }
         if(param1 == null || param1.width == 0 || param1.height == 0)
         {
            updateBitmapData(new BitmapData(intendedMaxWidth,intendedMaxHeight,false,4294967295));
         }
         else
         {
            updateBitmapData(param1);
         }
         if(_loc2_)
         {
            tesselate(true);
         }
      }
      
      public function drawAvatar(param1:String) : void
      {
         drawDupe(null);
         if(Boolean(param1) && param1 != "")
         {
            expectedUserName = new String(param1);
            tilePiece = MgbTile(MgbCaches.getInstance().avatarCache.getPiece(param1,MgbSystem.defaultProject,MgbSystem.avatarName,getAvatarResult,false,true));
         }
      }
      
      public function toggleGrid() : void
      {
         selectAligned = !selectAligned;
         drawSelectArea();
      }
      
      public function drawScreenshot(param1:String, param2:String, param3:String) : void
      {
         drawDupe(null);
         if(Boolean(param1) && param1 != "")
         {
            tilePiece = MgbTile(MgbCaches.getInstance().screenshotCache.getPiece(param1,param2,param3,getScreenshotResult,false,true));
         }
      }
      
      public function getAvatarResult(param1:MgbTile) : void
      {
         if(param1.userName == expectedUserName)
         {
            drawDupe(param1.bitmapDataVariant(activeEffect));
         }
      }
      
      public function getTileResult(param1:MgbTile) : void
      {
         if(param1.name == expectedTileName)
         {
            drawDupe(param1.bitmapDataVariant(activeEffect));
         }
      }
      
      public function set messageAttachmentToView(param1:MgbMessageAttachment) : void
      {
         switch(param1.itemType)
         {
            case Piece.MGB_TILE:
               drawDupeFromName(param1.userName,param1.project,param1.itemName);
               break;
            default:
               drawDupe(null);
         }
      }
      
      protected function onMousePress(param1:MouseEvent) : void
      {
         var _loc2_:BitmapData = new BitmapData(selectWidth,selectHeight,true,0);
         _loc2_.copyPixels(bitmap.bitmapData,new Rectangle(selectX,selectY,selectWidth,selectHeight),new Point(0,0),null,null,param1.shiftKey);
         Application.application.tileMaker.dpad.markUndoPoint();
         Application.application.tileMaker.dpad.updateBitmapData(_loc2_);
         Application.application.tileMaker.dpad.tilePiece.comment = "Imported from " + parentDocument.fname.text;
         Application.application.tileMaker.dpad.tagCheck("use_import" + (param1.shiftKey ? "_shifted" : ""));
         param1.updateAfterEvent();
      }
      
      public function set shrinkToFitEnabled(param1:Boolean) : void
      {
         _shrinkToFitEnabled = param1;
         invalidateSize();
      }
      
      public function chooseTileFromImage(param1:int = 64, param2:int = 64) : void
      {
         var _loc3_:BitmapData = null;
         if(!selectArea)
         {
            selectWidth = param1;
            selectHeight = param2;
            _loc3_ = new BitmapData(bitmap.width,bitmap.height,true,0);
            selectArea = new Bitmap(_loc3_);
            drawSelectArea();
            addChild(selectArea);
            if(false == hasEventListener(MouseEvent.MOUSE_DOWN))
            {
               addEventListener(MouseEvent.MOUSE_DOWN,onMousePress);
            }
            if(hasEventListener(MouseEvent.MOUSE_MOVE) == false)
            {
               addEventListener(MouseEvent.MOUSE_MOVE,onMouseMoving);
            }
         }
      }
      
      protected function onMouseMoving(param1:MouseEvent) : void
      {
         var _loc2_:int = int(selectX);
         var _loc3_:int = int(selectY);
         if(selectAligned)
         {
            selectX = int(mouseX / selectWidth) * selectWidth;
            if(selectX > bitmap.width - selectWidth)
            {
               selectX = int(bitmap.width / selectWidth) * selectWidth;
            }
         }
         else
         {
            selectX = mouseX - selectWidth / 2;
            if(selectX > bitmap.width - selectWidth)
            {
               selectX = bitmap.width - selectWidth;
            }
         }
         if(selectX < 0)
         {
            selectX = 0;
         }
         if(selectAligned)
         {
            selectY = int(mouseY / selectHeight) * selectHeight;
            if(selectY > bitmap.height - selectHeight)
            {
               selectY = int(bitmap.height / selectHeight) * selectHeight;
            }
         }
         else
         {
            selectY = mouseY - selectHeight / 2;
            if(selectY > bitmap.height - selectHeight)
            {
               selectY = bitmap.height - selectHeight;
            }
         }
         if(selectY < 0)
         {
            selectY = 0;
         }
         if(_loc2_ != selectX || _loc3_ != selectY)
         {
            drawSelectArea();
         }
         param1.updateAfterEvent();
      }
      
      private function ScaleSizeAndCenterMe() : void
      {
         if(tesselating)
         {
            bitmap.scaleX = 1;
            bitmap.scaleY = 1;
            width = 2 * bitmap.bitmapData.width;
            height = 2 * bitmap.bitmapData.height;
            bitmap.x = bitmap.bitmapData.width;
            bitmap.y = bitmap.bitmapData.height;
         }
         else
         {
            bitmap.scaleX = 1;
            bitmap.scaleY = 1;
            if(bitmap.width > intendedMaxWidth && Boolean(_shrinkToFitEnabled))
            {
               bitmap.scaleX = intendedMaxWidth / bitmap.width;
            }
            if(bitmap.height > intendedMaxHeight && Boolean(_shrinkToFitEnabled))
            {
               bitmap.scaleY = intendedMaxHeight / bitmap.height;
            }
            width = intendedMaxWidth;
            height = intendedMaxHeight;
            bitmap.x = Math.max(0,(intendedMaxWidth - bitmap.width) / 2);
            bitmap.y = Math.max(0,(intendedMaxHeight - bitmap.height) / 2);
         }
      }
   }
}
