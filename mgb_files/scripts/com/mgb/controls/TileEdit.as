package com.mgb.controls
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import mx.controls.*;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.rpc.events.ResultEvent;
   
   public class TileEdit extends UIComponent
   {
       
      
      private var _1506796230Gxpad_color:uint = 4278190080;
      
      private var selectCornerX:int;
      
      private var selectCornerY:int;
      
      private var _camOn:Boolean = false;
      
      private var vid:Video;
      
      private const default_tileheight:int = 32;
      
      private var gridBitmap:Bitmap;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var cursor_eraser_img:Class;
      
      private const maxUndos:int = 20;
      
      private var cursor_picker_img:Class;
      
      private var _372057037allowUndo:Boolean = false;
      
      private var undoTilenameArray:Array;
      
      private var camera:Camera;
      
      private var noted_x:int = 0;
      
      private var noted_y:int = 0;
      
      private var _69314714Gzoom:int;
      
      private var _371522142allowCopy:Boolean = false;
      
      private const minZoomLevel:int = 2;
      
      private var pasteRotation:Number = 0;
      
      private var _1813100089allowCut:Boolean = false;
      
      private var myBitmapData:BitmapData;
      
      private var undoHeadIndex:int = 0;
      
      private var handLastX:int;
      
      private var handLastY:int;
      
      private var selectOriginX:int;
      
      private var selectOriginY:int;
      
      private var _tilewidth:int = 32;
      
      private const default_tilewidth:int = 32;
      
      public var isSelecting:Boolean = false;
      
      private var gridBitmapData:BitmapData;
      
      private var showPasteImage:Boolean = false;
      
      private const maxZoomLevel:int = 12;
      
      private var cursor_paste_img:Class;
      
      private var _CursorID:Number = 0;
      
      private var zoomLevel:int = 4;
      
      public var previewControl:BitmapDuper = null;
      
      private var _tool:String = "pen";
      
      private const minZoomLevelForGrid:int = 4;
      
      private var _999188901allowSelect:Boolean = true;
      
      private var pasteScale:Number = 1;
      
      private var cursor_select_img:Class;
      
      private var pasteBufferBitmapData:BitmapData = null;
      
      private var _toolWidth:int = 1;
      
      private var cursor_brush_img:Class;
      
      private var _1356123958allowPaste:Boolean = false;
      
      private var pasteLastX:int = 0;
      
      private var pasteLastY:int = 0;
      
      private var pasteFlipY:int = 1;
      
      private var cursor_pen_img:Class;
      
      private var cursor_hand_img:Class;
      
      private var pasteFlipX:int = 1;
      
      private var cursor_fill_img:Class;
      
      private const _erase_color:uint = 0;
      
      private var undoArray:Array;
      
      private var undoCurrentIndex:int = 0;
      
      private var undoTailIndex:int = 0;
      
      private var _371959015allowRedo:Boolean = false;
      
      private var _865024800tilePiece:MgbTile;
      
      private var _tileheight:int = 32;
      
      private var myBitmap:Bitmap;
      
      public function TileEdit()
      {
         cursor_pen_img = TileEdit_cursor_pen_img;
         cursor_brush_img = TileEdit_cursor_brush_img;
         cursor_fill_img = TileEdit_cursor_fill_img;
         cursor_eraser_img = TileEdit_cursor_eraser_img;
         cursor_picker_img = TileEdit_cursor_picker_img;
         cursor_hand_img = TileEdit_cursor_hand_img;
         cursor_select_img = TileEdit_cursor_select_img;
         cursor_paste_img = TileEdit_cursor_paste_img;
         _1217010542mgbSession = MgbSession.getInstance();
         _69314714Gzoom = zoomLevel;
         _865024800tilePiece = new MgbTile();
         undoArray = new Array();
         undoTilenameArray = new Array();
         super();
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_LOGIN_LOGOUT,mgbLoginLogout);
         newTile();
      }
      
      private function tileLoadResult(param1:ResultEvent) : void
      {
         var _loc2_:MgbTile = MgbTile(param1.result.piece);
         updateBitmapData(tilePiece.bitmapData);
         tagCheck("load_complete");
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePiece() : MgbTile
      {
         return this._865024800tilePiece;
      }
      
      public function get camOn() : Boolean
      {
         return _camOn;
      }
      
      private function wipeUndoInfo() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < undoArray.length)
         {
            if(undoArray[_loc1_])
            {
               undoArray[_loc1_].dispose();
               undoArray[_loc1_] = null;
            }
            _loc1_++;
         }
         undoArray = new Array();
         undoTilenameArray = new Array();
         undoTailIndex = 0;
         undoHeadIndex = 0;
         undoCurrentIndex = 0;
         setUndoButtons();
      }
      
      public function saveTileUsingDialog() : void
      {
         tagCheck("save");
         tilePiece.bitmapData = myBitmapData;
         tilePiece.savePieceUsingDialog(mgbSession.userName,mgbSession.activeProject,this.parent,saveTileUsingDialog_ConfirmHandler);
      }
      
      public function updateBitmapData(param1:BitmapData) : void
      {
         if(param1 != myBitmapData)
         {
            if(myBitmapData)
            {
               myBitmapData.dispose();
            }
            myBitmapData = param1;
            if(myBitmap)
            {
               myBitmap.bitmapData = myBitmapData;
            }
         }
         if(previewControl)
         {
            previewControl.drawDupe(myBitmapData);
         }
         _tilewidth = myBitmapData.width;
         _tileheight = myBitmapData.height;
         set_zoomLevel(zoomLevel);
      }
      
      public function set allowCopy(param1:Boolean) : void
      {
         var _loc2_:Object = this._371522142allowCopy;
         if(_loc2_ !== param1)
         {
            this._371522142allowCopy = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowCopy",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set tool(param1:String) : void
      {
         var _loc2_:Object = this.tool;
         if(_loc2_ !== param1)
         {
            this._3565976tool = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tool",_loc2_,param1));
         }
      }
      
      private function onMouseOverPad(param1:MouseEvent) : void
      {
         updateMouseCursorForTool();
         param1.updateAfterEvent();
      }
      
      public function get toolWidth() : int
      {
         return _toolWidth;
      }
      
      [Bindable(event="propertyChange")]
      public function set camOn(param1:Boolean) : void
      {
         var _loc2_:Object = this.camOn;
         if(_loc2_ !== param1)
         {
            this._94425614camOn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"camOn",_loc2_,param1));
         }
      }
      
      protected function getOverCanvas() : Boolean
      {
         var _loc1_:Number = 0;
         if(mouseX >= _loc1_ && mouseX <= _tilewidth * zoomLevel - _loc1_ && mouseY >= _loc1_ && mouseY <= _tileheight * zoomLevel - _loc1_)
         {
            return true;
         }
         return false;
      }
      
      public function mgbLoginLogout(param1:Event) : void
      {
         newTile();
      }
      
      protected function onMouseOutPad(param1:MouseEvent) : void
      {
         hidePasteImageIfShown();
         removeActiveCursors();
         param1.updateAfterEvent();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         newTile();
         addChild(myBitmap);
         updateGrid();
         addChild(gridBitmap);
         addEventListener(MouseEvent.MOUSE_DOWN,onPadPress);
         addEventListener(MouseEvent.ROLL_OVER,onMouseOverPad);
         addEventListener(MouseEvent.ROLL_OUT,onMouseOutPad);
         addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
      }
      
      [Bindable(event="propertyChange")]
      public function set toolWidth(param1:int) : void
      {
         var _loc2_:Object = this.toolWidth;
         if(_loc2_ !== param1)
         {
            this._423685362toolWidth = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolWidth",_loc2_,param1));
         }
      }
      
      private function onPadRelease(param1:MouseEvent) : void
      {
         if("paste" != _tool)
         {
            stopDragging();
         }
         param1.updateAfterEvent();
      }
      
      private function hidePasteImageIfShown() : void
      {
         if(showPasteImage)
         {
            showPasteImage = false;
            updateGrid();
         }
      }
      
      private function _doCutCopy(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(isSelecting)
         {
            _loc2_ = selectOriginX > selectCornerX ? int(selectCornerX) : int(selectOriginX);
            _loc3_ = selectOriginX > selectCornerX ? int(selectOriginX) : int(selectCornerX);
            _loc4_ = selectOriginY > selectCornerY ? int(selectCornerY) : int(selectOriginY);
            _loc5_ = selectOriginY > selectCornerY ? int(selectOriginY) : int(selectCornerY);
            _loc6_ = _loc3_ - _loc2_;
            _loc7_ = _loc5_ - _loc4_;
            if(Boolean(_loc6_) && Boolean(_loc7_))
            {
               if(pasteBufferBitmapData)
               {
                  pasteBufferBitmapData.dispose();
               }
               pasteBufferBitmapData = new BitmapData(_loc6_,_loc7_,true,_erase_color);
               pasteBufferBitmapData.copyPixels(myBitmapData,new Rectangle(_loc2_,_loc4_,_loc6_,_loc7_),new Point(0,0));
               if(param1)
               {
                  markUndoPoint();
                  myBitmapData.fillRect(new Rectangle(_loc2_,_loc4_,_loc3_ - _loc2_,_loc5_ - _loc4_),_erase_color);
                  cancelSelection();
               }
               allowPaste = true;
            }
         }
      }
      
      public function set allowSelect(param1:Boolean) : void
      {
         var _loc2_:Object = this._999188901allowSelect;
         if(_loc2_ !== param1)
         {
            this._999188901allowSelect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowSelect",_loc2_,param1));
         }
      }
      
      public function next_zoomLevel(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            _loc2_ = zoomLevel - 2;
            if(_loc2_ < minZoomLevel)
            {
               _loc2_ = int(maxZoomLevel);
            }
         }
         else
         {
            _loc2_ = zoomLevel + 2;
            if(_loc2_ > maxZoomLevel)
            {
               _loc2_ = int(minZoomLevel);
            }
         }
         set_zoomLevel(_loc2_);
         tagCheck("use_zoombutton");
      }
      
      public function get tileheight() : int
      {
         return _tileheight;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowCut() : Boolean
      {
         return this._1813100089allowCut;
      }
      
      public function set Gzoom(param1:int) : void
      {
         var _loc2_:Object = this._69314714Gzoom;
         if(_loc2_ !== param1)
         {
            this._69314714Gzoom = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"Gzoom",_loc2_,param1));
         }
      }
      
      private function cancelSelection() : void
      {
         if(isSelecting)
         {
            isSelecting = false;
            allowCut = allowCopy = false;
            updateGrid();
         }
      }
      
      private function setUndoButtons() : void
      {
         allowUndo = undoCurrentIndex != undoTailIndex;
         allowRedo = undoCurrentIndex != undoHeadIndex;
      }
      
      override protected function measure() : void
      {
         super.measure();
         measuredHeight = _tileheight * zoomLevel + 1;
         measuredMinHeight = measuredHeight;
         measuredWidth = _tilewidth * zoomLevel + 1;
         measuredMinWidth = measuredWidth;
         previewControl.drawDupe(myBitmapData);
         updateGrid();
      }
      
      public function set allowCut(param1:Boolean) : void
      {
         var _loc2_:Object = this._1813100089allowCut;
         if(_loc2_ !== param1)
         {
            this._1813100089allowCut = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowCut",_loc2_,param1));
         }
      }
      
      public function newTile(param1:int = 32, param2:int = 32) : void
      {
         tilePiece.name = "";
         tilePiece.comment = "";
         tilePiece.width = param1;
         tilePiece.height = param2;
         if(!myBitmap)
         {
            myBitmap = new Bitmap();
            myBitmap.scaleX = zoomLevel;
            myBitmap.scaleY = zoomLevel;
         }
         if(myBitmapData)
         {
            markUndoPoint();
         }
         updateBitmapData(new BitmapData(param1,param2,true,_erase_color));
         tagCheck("new");
      }
      
      private function stopDragging() : void
      {
         removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingWhilePressed);
      }
      
      public function loadTileByName(param1:String, param2:Boolean = true, param3:String = null, param4:String = null) : void
      {
         markUndoPoint();
         tagCheck("load_from_doubleclick");
         var _loc5_:PieceCache = MgbCaches.getInstance().tileCache;
         if(param3 == null)
         {
            param3 = String(mgbSession.userName);
         }
         if(param4 == null)
         {
            param4 = String(mgbSession.activeProject);
         }
         if(_loc5_.getPieceIfCached(param3,param4,param1) == null || param2 == false)
         {
            tilePiece.loadByName(param3,param4,param1,tileLoadResult);
         }
         else
         {
            tilePiece.loadPieceFromPiece(_loc5_.getPieceIfCached(param3,param4,param1));
            updateBitmapData(tilePiece.bitmapData);
         }
      }
      
      protected function onPadPress(param1:MouseEvent) : void
      {
         var _loc4_:Matrix = null;
         var _loc2_:int = param1.localX / zoomLevel;
         var _loc3_:int = param1.localY / zoomLevel;
         note_xy(_loc2_,_loc3_);
         switch(_tool)
         {
            case "pen":
            case "eraser":
            case "brush":
               markUndoPoint();
               drawLineWithTool(_loc2_,_loc3_,_loc2_,_loc3_);
               startDragging();
               break;
            case "picker":
               Gxpad_color = myBitmap.bitmapData.getPixel32(_loc2_,_loc3_);
               break;
            case "fill":
               markUndoPoint();
               myBitmap.bitmapData.floodFill(_loc2_,_loc3_,effective_xpad_color());
               break;
            case "hand":
               markUndoPoint();
               handLastX = param1.localX;
               handLastY = param1.localY;
               startDragging();
               break;
            case "select":
               selectOriginX = _loc2_;
               selectOriginY = _loc3_;
               isSelecting = true;
               allowCut = allowCopy = true;
               startDragging();
               break;
            case "paste":
               if(pasteBufferBitmapData)
               {
                  markUndoPoint();
                  (_loc4_ = new Matrix()).createBox(pasteScale * pasteFlipX,pasteScale * pasteFlipY,pasteRotation,pasteLastX,pasteLastY);
                  myBitmapData.draw(pasteBufferBitmapData,_loc4_);
               }
               break;
            default:
               throw new ArgumentError("Unknown tool");
         }
         tagCheck("use_" + _tool);
         param1.updateAfterEvent();
      }
      
      [Bindable(event="propertyChange")]
      public function get allowCopy() : Boolean
      {
         return this._371522142allowCopy;
      }
      
      public function tagCheck(param1:String) : void
      {
         ActiveTutorial.getInstance().tutorialTagCheck("tilemaker_" + param1);
      }
      
      private function note_xy(param1:int, param2:int) : void
      {
         noted_x = param1;
         noted_y = param2;
      }
      
      public function set Gxpad_color(param1:uint) : void
      {
         var _loc2_:Object = this._1506796230Gxpad_color;
         if(_loc2_ !== param1)
         {
            this._1506796230Gxpad_color = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"Gxpad_color",_loc2_,param1));
         }
      }
      
      public function set allowPaste(param1:Boolean) : void
      {
         var _loc2_:Object = this._1356123958allowPaste;
         if(_loc2_ !== param1)
         {
            this._1356123958allowPaste = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowPaste",_loc2_,param1));
         }
      }
      
      public function get tool() : String
      {
         return _tool;
      }
      
      private function saveTileUsingDialog_SaveCompletedHandler(param1:MgbTile, param2:int, param3:String) : void
      {
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function loadTileUsingDialog() : void
      {
         tagCheck("load");
         tilePiece.loadUsingDialog(mgbSession.userName,mgbSession.activeProject,this,tileLoadResult);
      }
      
      private function saveTileUsingDialog_ConfirmHandler() : void
      {
         tilePiece.save(saveTileUsingDialog_SaveCompletedHandler);
         tagCheck("save_complete");
      }
      
      private function set _94425614camOn(param1:Boolean) : void
      {
         _camOn = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowSelect() : Boolean
      {
         return this._999188901allowSelect;
      }
      
      public function doCopy() : void
      {
         _doCutCopy(false);
         tagCheck("use_copy");
      }
      
      [Bindable(event="propertyChange")]
      public function get Gzoom() : int
      {
         return this._69314714Gzoom;
      }
      
      private function camDraw(param1:Event) : void
      {
         myBitmapData.draw(vid);
      }
      
      private function updateGrid() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Matrix = null;
         if(gridBitmapData)
         {
            gridBitmapData.dispose();
         }
         var _loc1_:int = _tilewidth * zoomLevel;
         var _loc2_:int = _tileheight * zoomLevel;
         gridBitmapData = new BitmapData(_loc1_ + 1,_loc2_ + 1,true,0);
         gridBitmapData.floodFill(1,1,0);
         if(zoomLevel >= minZoomLevelForGrid)
         {
            gridBitmapData.fillRect(new Rectangle(_loc1_ / 2 - 1,0,3,_loc2_ + 1),4294967295);
            gridBitmapData.fillRect(new Rectangle(0,_loc2_ / 2 - 1,_loc1_ + 1,3),4294967295);
            _loc3_ = 0;
            while(_loc3_ <= _loc1_)
            {
               gridBitmapData.fillRect(new Rectangle(_loc3_,0,1,_loc2_ + 1),_loc3_ == _loc1_ / 2 ? uint(4278190080) : uint(4282400832));
               _loc3_ += zoomLevel;
            }
            _loc4_ = 0;
            while(_loc4_ <= _loc2_)
            {
               gridBitmapData.fillRect(new Rectangle(0,_loc4_,_loc1_ + 1,1),_loc4_ == _loc2_ / 2 ? uint(4278190080) : uint(4282400832));
               _loc4_ += zoomLevel;
            }
         }
         else
         {
            gridBitmapData.fillRect(new Rectangle(_loc1_,0,1,_loc2_ + 1),4278190080);
            gridBitmapData.fillRect(new Rectangle(0,_loc2_,_loc1_ + 1,1),4278190080);
         }
         if(isSelecting)
         {
            _loc5_ = zoomLevel * (selectOriginX > selectCornerX ? selectCornerX : selectOriginX);
            _loc6_ = zoomLevel * (selectOriginX > selectCornerX ? selectOriginX : selectCornerX);
            _loc7_ = zoomLevel * (selectOriginY > selectCornerY ? selectCornerY : selectOriginY);
            _loc8_ = zoomLevel * (selectOriginY > selectCornerY ? selectOriginY : selectCornerY);
            gridBitmapData.fillRect(new Rectangle(_loc5_,_loc7_,_loc6_ - _loc5_,_loc8_ - _loc7_),1073741824);
            gridBitmapData.fillRect(new Rectangle(_loc5_,_loc7_,1,_loc8_ - _loc7_),4294967295);
            gridBitmapData.fillRect(new Rectangle(_loc6_,_loc7_,1,_loc8_ - _loc7_),4294967295);
            gridBitmapData.fillRect(new Rectangle(_loc5_,_loc7_,_loc6_ - _loc5_,1),4294967295);
            gridBitmapData.fillRect(new Rectangle(_loc5_,_loc8_,_loc6_ - _loc5_,1),4294967295);
         }
         if("paste" == _tool && pasteBufferBitmapData && Boolean(showPasteImage))
         {
            (_loc9_ = new Matrix()).createBox(zoomLevel * pasteScale * pasteFlipX,zoomLevel * pasteScale * pasteFlipY,pasteRotation,pasteLastX * zoomLevel,pasteLastY * zoomLevel);
            gridBitmapData.draw(pasteBufferBitmapData,_loc9_);
         }
         if(gridBitmap)
         {
            gridBitmap.bitmapData = gridBitmapData;
         }
         else
         {
            gridBitmap = new Bitmap(gridBitmapData);
         }
         gridBitmap.alpha = 0.4;
      }
      
      public function doCut() : void
      {
         _doCutCopy(true);
         tagCheck("use_cut");
      }
      
      public function set tilePiece(param1:MgbTile) : void
      {
         var _loc2_:Object = this._865024800tilePiece;
         if(_loc2_ !== param1)
         {
            this._865024800tilePiece = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilePiece",_loc2_,param1));
         }
      }
      
      protected function onMouseMovingWhilePressed(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(getOverCanvas())
         {
            switch(_tool)
            {
               case "pen":
               case "eraser":
               case "brush":
                  _loc2_ = param1.localX / zoomLevel;
                  _loc3_ = param1.localY / zoomLevel;
                  if(param1.shiftKey && !param1.ctrlKey)
                  {
                     _loc2_ = int(noted_x);
                     tagCheck("use_" + _tool + "_vertical");
                  }
                  else if(!param1.shiftKey && param1.ctrlKey)
                  {
                     _loc3_ = int(noted_y);
                     tagCheck("use_" + _tool + "_horizontal");
                  }
                  else if(param1.shiftKey && param1.ctrlKey)
                  {
                     _loc3_ = noted_y + (_loc3_ > noted_y ? 1 : -1) * Math.abs(_loc2_ - noted_x);
                     tagCheck("use_" + _tool + "_diagonal");
                  }
                  else
                  {
                     tagCheck("use_" + _tool);
                  }
                  drawLineWithTool(noted_x,noted_y,_loc2_,_loc3_);
                  note_xy(_loc2_,_loc3_);
                  break;
               case "hand":
                  _loc4_ = (param1.localX - handLastX) / zoomLevel;
                  _loc5_ = (param1.localY - handLastY) / zoomLevel;
                  if(Boolean(_loc4_) || Boolean(_loc5_))
                  {
                     handLastY = param1.localY;
                     handLastX = param1.localX;
                     myBitmap.bitmapData.scroll(_loc4_,_loc5_);
                     if(Boolean(_loc4_) || Boolean(_loc5_))
                     {
                        if(!param1.shiftKey)
                        {
                           if(_loc4_)
                           {
                              myBitmap.bitmapData.fillRect(new Rectangle(_loc4_ > 0 ? 0 : _tilewidth + _loc4_,0,Math.abs(_loc4_),_tileheight),_erase_color);
                           }
                           if(_loc5_)
                           {
                              myBitmap.bitmapData.fillRect(new Rectangle(0,_loc5_ > 0 ? 0 : _tileheight + _loc5_,_tilewidth,Math.abs(_loc5_)),_erase_color);
                           }
                           tagCheck("use_" + _tool);
                        }
                        else
                        {
                           tagCheck("use_" + _tool + "_shifted");
                        }
                     }
                  }
                  break;
               case "select":
                  if(selectCornerX != int(param1.localX / zoomLevel) || selectCornerY != int(param1.localY / zoomLevel))
                  {
                     selectCornerX = param1.localX / zoomLevel;
                     selectCornerY = param1.localY / zoomLevel;
                     updateGrid();
                  }
                  break;
               case "paste":
                  if(pasteLastX != int(param1.localX / zoomLevel) || pasteLastY != int(param1.localY / zoomLevel))
                  {
                     pasteLastX = param1.localX / zoomLevel;
                     pasteLastY = param1.localY / zoomLevel;
                     updateGrid();
                  }
                  break;
               default:
                  throw new ArgumentError("Unknown tool");
            }
         }
         param1.updateAfterEvent();
      }
      
      public function markUndoPoint() : void
      {
         var _loc1_:int = (1 + undoCurrentIndex) % maxUndos;
         if(undoArray[_loc1_])
         {
            undoArray[_loc1_].dispose();
            undoArray[_loc1_] = null;
         }
         undoArray[_loc1_] = myBitmapData.clone();
         undoTilenameArray[_loc1_] = tilePiece.name;
         if(_loc1_ == undoTailIndex)
         {
            undoTailIndex = (undoTailIndex + 1) % maxUndos;
         }
         undoHeadIndex = _loc1_;
         undoCurrentIndex = _loc1_;
         setUndoButtons();
      }
      
      public function set allowUndo(param1:Boolean) : void
      {
         var _loc2_:Object = this._372057037allowUndo;
         if(_loc2_ !== param1)
         {
            this._372057037allowUndo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowUndo",_loc2_,param1));
         }
      }
      
      public function selectTool(param1:String) : void
      {
         var _loc2_:String = new String(_tool);
         this.tool = param1;
         tagCheck("choose_" + param1);
         if(_CursorID != CursorManager.NO_CURSOR)
         {
            updateMouseCursorForTool();
         }
         if(_loc2_ == "paste" && _tool != "paste")
         {
            hidePasteImageIfShown();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get Gxpad_color() : uint
      {
         return this._1506796230Gxpad_color;
      }
      
      public function set allowRedo(param1:Boolean) : void
      {
         var _loc2_:Object = this._371959015allowRedo;
         if(_loc2_ !== param1)
         {
            this._371959015allowRedo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowRedo",_loc2_,param1));
         }
      }
      
      protected function updateMouseCursorForTool() : void
      {
         removeActiveCursors();
         switch(_tool)
         {
            case "pen":
               _CursorID = CursorManager.setCursor(cursor_pen_img,CursorManagerPriority.LOW,-2,-16);
               break;
            case "brush":
               _CursorID = CursorManager.setCursor(cursor_brush_img,CursorManagerPriority.LOW,-2,-16);
               break;
            case "fill":
               _CursorID = CursorManager.setCursor(cursor_fill_img,CursorManagerPriority.LOW,-2,-16);
               break;
            case "eraser":
               _CursorID = CursorManager.setCursor(cursor_eraser_img,CursorManagerPriority.LOW,-2,-16);
               break;
            case "picker":
               _CursorID = CursorManager.setCursor(cursor_picker_img,CursorManagerPriority.LOW,-2,-16);
               break;
            case "hand":
               _CursorID = CursorManager.setCursor(cursor_hand_img,CursorManagerPriority.LOW,-2,-16);
               break;
            case "select":
               _CursorID = CursorManager.setCursor(cursor_select_img,CursorManagerPriority.LOW,-16,-16);
               break;
            case "paste":
               _CursorID = CursorManager.setCursor(cursor_paste_img,CursorManagerPriority.LOW,-16,-16);
               startDragging();
               showPasteImage = true;
         }
      }
      
      private function startDragging() : void
      {
         addEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingWhilePressed);
         stage.addEventListener(MouseEvent.MOUSE_UP,onPadRelease);
      }
      
      private function removeActiveCursors() : void
      {
         if(_CursorID != CursorManager.NO_CURSOR)
         {
            CursorManager.removeCursor(_CursorID);
            _CursorID = CursorManager.NO_CURSOR;
         }
      }
      
      private function set_zoomLevel(param1:int) : void
      {
         if(myBitmap.bitmapData.width * param1 >= 2880 - 80)
         {
            param1 = int(minZoomLevel);
         }
         zoomLevel = param1;
         myBitmap.scaleX = param1;
         myBitmap.scaleY = param1;
         updateGrid();
         Gzoom = param1;
         invalidateSize();
      }
      
      private function effective_xpad_color() : uint
      {
         return "eraser" == _tool ? uint(_erase_color) : Gxpad_color;
      }
      
      public function get tilewidth() : int
      {
         return _tilewidth;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowPaste() : Boolean
      {
         return this._1356123958allowPaste;
      }
      
      public function toggleCam(param1:Boolean = false) : void
      {
         if(camOn)
         {
            removeEventListener("enterFrame",camDraw);
            vid.clear();
            camera = null;
            vid = null;
            camOn = false;
         }
         else if(!param1)
         {
            camera = Camera.getCamera();
            if(camera)
            {
               vid = new Video(tilewidth,tileheight);
               vid.attachCamera(camera);
               if(vid)
               {
                  markUndoPoint();
                  addEventListener("enterFrame",camDraw);
                  camOn = true;
               }
               else
               {
                  camera = null;
               }
            }
            else
            {
               Alert.show("Could not find an attached webcam");
            }
         }
      }
      
      private function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      public function undo(param1:Boolean = false) : void
      {
         if(undoCurrentIndex == undoTailIndex)
         {
            if(!param1)
            {
               Alert.show("No more undo available");
            }
         }
         else
         {
            if(undoCurrentIndex == undoHeadIndex)
            {
               markUndoPoint();
               --undoCurrentIndex;
               if(undoCurrentIndex < 0)
               {
                  undoCurrentIndex += maxUndos;
               }
            }
            tilePiece.name = undoTilenameArray[undoCurrentIndex];
            updateBitmapData(undoArray[undoCurrentIndex].clone());
            --undoCurrentIndex;
            if(undoCurrentIndex < 0)
            {
               undoCurrentIndex += maxUndos;
            }
            tagCheck("undo");
         }
         setUndoButtons();
      }
      
      [Bindable(event="propertyChange")]
      public function get allowUndo() : Boolean
      {
         return this._372057037allowUndo;
      }
      
      public function protectTileFromCopying() : void
      {
         newTile();
         wipeUndoInfo();
         if(pasteBufferBitmapData)
         {
            pasteBufferBitmapData.dispose();
            pasteBufferBitmapData = null;
         }
      }
      
      private function set _3565976tool(param1:String) : void
      {
         var _loc2_:Boolean = false;
         switch(param1)
         {
            case "paste":
               pasteRotation = 0;
               pasteFlipX = 1;
               pasteFlipY = 1;
               pasteScale = 1;
            case "pen":
            case "brush":
            case "fill":
            case "eraser":
            case "picker":
            case "hand":
            case "select":
               _loc2_ = true;
               break;
            default:
               MgbLogger.getInstance().logBug("MGB tried to select the unknown tile edit tool \'" + param1 + "\'");
         }
         if(_loc2_)
         {
            stopDragging();
            _tool = param1;
            toggleCam(true);
            cancelSelection();
         }
      }
      
      private function set _423685362toolWidth(param1:int) : void
      {
         if(param1 < 1)
         {
            _toolWidth = 8;
         }
         else if(param1 > 8)
         {
            _toolWidth = 1;
         }
         else
         {
            _toolWidth = param1;
         }
         tagCheck("use_thickbutton");
      }
      
      protected function onMouseWheel(param1:MouseEvent) : void
      {
         switch(_tool)
         {
            case "paste":
               if(param1.ctrlKey)
               {
                  pasteFlipX = -pasteFlipX;
                  tagCheck("use_paste_flip_horizontal");
               }
               else if(param1.shiftKey)
               {
                  pasteFlipY = -pasteFlipY;
                  tagCheck("use_paste_flip_vertical");
               }
               else if(param1.altKey)
               {
                  if(param1.delta < 0)
                  {
                     tagCheck("use_paste_scale_shrink");
                     pasteScale -= 0.1;
                  }
                  else if(param1.delta > 0)
                  {
                     pasteScale += 0.1;
                     tagCheck("use_paste_scale_grow");
                  }
               }
               else if(param1.delta < 0)
               {
                  pasteRotation += Math.PI / 8;
                  tagCheck("use_paste_rotate_right");
               }
               else if(param1.delta > 0)
               {
                  pasteRotation -= Math.PI / 8;
                  tagCheck("use_paste_rotate_left");
               }
               updateGrid();
               break;
            default:
               if(param1.ctrlKey)
               {
                  next_zoomLevel(param1.delta < 0);
                  tagCheck("use_zoomwheel");
               }
         }
      }
      
      private function drawLineWithTool(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc6_:BitmapData = null;
         var _loc5_:Shape;
         (_loc5_ = new Shape()).graphics.moveTo(param1,param2);
         if(param1 == param3 && param2 == param4)
         {
            if(toolWidth < 3)
            {
               myBitmap.bitmapData.fillRect(new Rectangle(param1,param2,toolWidth,toolWidth),this.effective_xpad_color());
            }
         }
         else if(_tool == "brush")
         {
            _loc5_.graphics.lineStyle(toolWidth,effective_xpad_color(),1,true,"normal");
            _loc5_.graphics.lineTo(param3,param4);
            myBitmap.bitmapData.draw(_loc5_,null,null,"normal",null,false);
         }
         else
         {
            _loc5_.graphics.lineStyle(toolWidth,0,1,true,"normal");
            _loc5_.graphics.lineTo(param3,param4);
            (_loc6_ = new BitmapData(tilewidth,tileheight,true,_erase_color)).draw(_loc5_,null,null,"normal",null,false);
            myBitmap.bitmapData.threshold(_loc6_,new Rectangle(0,0,tilewidth,tileheight),new Point(0,0),">=",1073741824,effective_xpad_color());
            _loc6_.dispose();
         }
      }
      
      public function redo(param1:Boolean = false) : void
      {
         var _loc2_:int = (1 + undoCurrentIndex) % maxUndos;
         if(undoCurrentIndex == undoHeadIndex)
         {
            if(!param1)
            {
               Alert.show("No more redo available");
            }
         }
         else
         {
            if(undoCurrentIndex == undoTailIndex)
            {
               undoCurrentIndex = (1 + undoCurrentIndex) % maxUndos;
            }
            updateBitmapData(undoArray[_loc2_].clone());
            tilePiece.name = undoTilenameArray[_loc2_];
            undoCurrentIndex = _loc2_;
            tagCheck("redo");
         }
         setUndoButtons();
      }
      
      [Bindable(event="propertyChange")]
      public function get allowRedo() : Boolean
      {
         return this._371959015allowRedo;
      }
   }
}
