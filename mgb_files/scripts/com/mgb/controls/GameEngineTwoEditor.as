package com.mgb.controls
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import com.mgb.modals.*;
   import com.mgb.utils.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import mx.controls.*;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   
   public class GameEngineTwoEditor extends GameEngineTwo
   {
       
      
      private var cursor_music_img:Class;
      
      private var _745923825toolTipVisible:Boolean = false;
      
      private var _1813112582allowPut:Boolean = false;
      
      private var cursor_eraser_img:Class;
      
      private const maxUndos:int = 30;
      
      private var _372207292allowZoom:Boolean = false;
      
      private var _372057037allowUndo:Boolean = false;
      
      private var _tool_before_inspect:String = "pen";
      
      private var _371522142allowCopy:Boolean = false;
      
      private var _1365793571allowErase:Boolean = false;
      
      private var cursor_resize_img:Class;
      
      private var _371789775allowLoad:Boolean = false;
      
      private var _1813100089allowCut:Boolean = false;
      
      private var _695545418cursorCol:Number;
      
      private var undoArrayMapHeight:Array;
      
      private var undoHeadIndex:int = 0;
      
      private var _1792120912toolTipText:String = "";
      
      protected var _CursorID:Number;
      
      private var noted_col:int = 0;
      
      private var _tool:String = "pen";
      
      private var _371985510allowSave:Boolean = false;
      
      private var cursor_select_img:Class;
      
      private var rmf:GameEngineMapResizePopup = null;
      
      private var _695559844cursorRow:Number;
      
      private var _1356123958allowPaste:Boolean = false;
      
      private var _999188901allowSelect:Boolean = false;
      
      private var _970772829allowResize:Boolean = false;
      
      private var _371643951allowGrid:Boolean = false;
      
      private var currentActorName:String = null;
      
      private var _889438859allowInspect:Boolean = false;
      
      private var _1813110167allowNew:Boolean = false;
      
      private var cursor_pen_img:Class;
      
      private var currentActorLayer:int = 1;
      
      private var undoArrayMapWidth:Array;
      
      private var noted_row:int = 0;
      
      private var undoArray:Array;
      
      private var undoCurrentIndex:int = 0;
      
      private var undoTailIndex:int = 0;
      
      private var _371959015allowRedo:Boolean = false;
      
      private var cursor_jump_img:Class;
      
      public function GameEngineTwoEditor()
      {
         cursor_pen_img = GameEngineTwoEditor_cursor_pen_img;
         cursor_eraser_img = GameEngineTwoEditor_cursor_eraser_img;
         cursor_select_img = GameEngineTwoEditor_cursor_select_img;
         cursor_resize_img = GameEngineTwoEditor_cursor_resize_img;
         cursor_jump_img = GameEngineTwoEditor_cursor_jump_img;
         cursor_music_img = GameEngineTwoEditor_cursor_music_img;
         undoArray = new Array();
         undoArrayMapWidth = new Array();
         undoArrayMapHeight = new Array();
         super();
         triggerEditMode();
      }
      
      public static function actorOkForLayer(param1:int, param2:MgbActor) : String
      {
         if(null == param2 || null == param2.actorXML)
         {
            return "?...";
         }
         return actorXMLOkForLayer(param1,param2.actorXML);
      }
      
      public static function actorXMLOkForLayer(param1:int, param2:XML) : String
      {
         var _loc3_:Boolean = false;
         if(null == param2)
         {
            return "?...";
         }
         var _loc4_:Boolean = false;
         if(Boolean(param2.databag.itemOrNPC.appearIf) && int(param2.databag.itemOrNPC.appearIf) != MgbActor.alAppearDisappear_NoCondition)
         {
            _loc4_ = true;
         }
         var _loc5_:Boolean = false;
         var _loc6_:String;
         if((_loc6_ = String(param2.databag.item.keyForThisDoor)) == "")
         {
            _loc6_ = null;
         }
         if((param2.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksPlayer || param2.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksPlayerAndNPC) && _loc6_ != null && int(param2.databag.item.pushToSlideNum) == 0)
         {
            _loc5_ = true;
         }
         switch(param1)
         {
            case MgbMap.layerBackground:
               if(param2.databag.all.actorType == MgbActor.alActorType_Item && !_loc4_ && (param2.databag.item.itemActivationType == MgbActor.alItemActivationType_Inactive || param2.databag.item.itemActivationType == MgbActor.alItemActivationType_PushesActors || param2.databag.item.itemActivationType == MgbActor.alItemActivationType_CausesDamage || param2.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksNPC || (param2.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksPlayer || param2.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksPlayerAndNPC) && (_loc5_ == false && int(param2.databag.item.pushToSlideNum) == 0)))
               {
                  _loc3_ = true;
               }
               break;
            case MgbMap.layerActive:
               if(param2.databag.all.actorType == MgbActor.alActorType_Player || param2.databag.all.actorType == MgbActor.alActorType_NPC || _loc4_ || _loc5_ || param2.databag.all.actorType == MgbActor.alActorType_Item && param2.databag.item.itemActivationType != MgbActor.alItemActivationType_CausesDamage && param2.databag.item.itemActivationType != MgbActor.alItemActivationType_PushesActors && !((param2.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksNPC || param2.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksPlayer || param2.databag.item.itemActivationType == MgbActor.alItemActivationType_BlocksPlayerAndNPC) && int(param2.databag.item.pushToSlideNum) == 0) && param2.databag.item.itemActivationType != MgbActor.alItemActivationType_Inactive)
               {
                  _loc3_ = true;
               }
               break;
            case MgbMap.layerForeground:
               if(param2.databag.all.actorType == MgbActor.alActorType_Item && param2.databag.item.itemActivationType == MgbActor.alItemActivationType_Inactive)
               {
                  _loc3_ = true;
               }
         }
         return _loc3_ ? "Yes" : "No";
      }
      
      [Bindable(event="propertyChange")]
      public function get allowPut() : Boolean
      {
         return this._1813112582allowPut;
      }
      
      public function set allowPut(param1:Boolean) : void
      {
         var _loc2_:Object = this._1813112582allowPut;
         if(_loc2_ !== param1)
         {
            this._1813112582allowPut = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowPut",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolTipVisible() : Boolean
      {
         return this._745923825toolTipVisible;
      }
      
      private function updateMapView(param1:Event = null) : void
      {
         resizeAdd = rmf.rAdd.selected;
         resizeRemove = rmf.rRemove.selected;
         resizeColumns = rmf.rColumn.selected;
         resizeRows = rmf.rRow.selected;
         if(resizeAdd && Boolean(rmf.rColumn.selected) && Boolean(rmf.rRight.selected))
         {
            resizeDirectionHintOffset = MgbSystem.tileMinWidth / 2;
         }
         else if(resizeAdd && Boolean(rmf.rColumn.selected) && Boolean(rmf.rLeft.selected))
         {
            resizeDirectionHintOffset = -(MgbSystem.tileMinWidth / 2);
         }
         else if(resizeAdd && Boolean(rmf.rRow.selected) && Boolean(rmf.rAbove.selected))
         {
            resizeDirectionHintOffset = -(MgbSystem.tileMinHeight / 2);
         }
         else if(resizeAdd && Boolean(rmf.rRow.selected) && Boolean(rmf.rBelow.selected))
         {
            resizeDirectionHintOffset = MgbSystem.tileMinHeight / 2;
         }
         else
         {
            resizeDirectionHintOffset = 0;
         }
         redrawMap();
      }
      
      public function set toolTipVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._745923825toolTipVisible;
         if(_loc2_ !== param1)
         {
            this._745923825toolTipVisible = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipVisible",_loc2_,param1));
         }
      }
      
      private function doResize(param1:int, param2:int) : void
      {
         resizeFromX = param1;
         resizeFromY = param2;
         resizeAdd = false;
         resizeRemove = false;
         resizeColumns = false;
         resizeRows = false;
         resizeDirectionHintOffset = 0;
         rmf = GameEngineMapResizePopup(PopUpManager.createPopUp(this.parent,GameEngineMapResizePopup,true));
         rmf["okButton"].addEventListener("click",doResizeTask);
         rmf["cancelButton"].addEventListener("click",endResizeTask);
         rmf.title = "Resize map (" + mapPiece.width + " x " + mapPiece.height + ")";
         rmf.addEventListener("MGB_updateMapView",updateMapView);
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         addEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingUpdateCursorRowCol);
      }
      
      private function showToolTip() : void
      {
         var _loc4_:String = null;
         var _loc5_:MgbActor = null;
         var _loc1_:int = int(mouseCol(mouseX));
         var _loc2_:int = int(mouseRow(mouseY));
         toolTipText = "<b>Inspecting cell (" + _loc1_ + "," + _loc2_ + ")</b>\n\n";
         var _loc3_:int = 0;
         while(_loc3_ < MgbMap.layerEditGrid)
         {
            toolTipText += "<b>" + MgbMap.layerNames[_loc3_] + " layer:</b>\n";
            if((_loc4_ = String(mapPiece.mapLayerActors[_loc3_][cell(_loc1_,_loc2_)])) != null)
            {
               if(_loc3_ == MgbMap.layerEvents)
               {
                  toolTipText += "Event: " + _loc4_ + "\n";
               }
               else
               {
                  _loc5_ = MgbActor(actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,_loc4_));
                  toolTipText += !!_loc5_ ? _loc5_.getDescription(true) : "\n";
               }
            }
            toolTipText += "\n";
            _loc3_++;
         }
         toolTipVisible = toolTipText.length > 0;
      }
      
      public function clear_inspect() : void
      {
         if(hasEventListener(MouseEvent.MOUSE_MOVE))
         {
            removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingInspect);
         }
         toolTipVisible = false;
      }
      
      protected function onMouseOutPad(param1:MouseEvent) : void
      {
         CursorManager.removeCursor(_CursorID);
         if(hasEventListener(MouseEvent.MOUSE_MOVE) == true)
         {
            removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingWhilePressed);
         }
         entireMapToolTip();
         param1.updateAfterEvent();
      }
      
      public function set allowInspect(param1:Boolean) : void
      {
         var _loc2_:Object = this._889438859allowInspect;
         if(_loc2_ !== param1)
         {
            this._889438859allowInspect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowInspect",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowGrid() : Boolean
      {
         return this._371643951allowGrid;
      }
      
      override protected function removeGe2Events(param1:String) : void
      {
         switch(param1)
         {
            case GameEngine.GE_EDIT:
               if(hasEventListener(MouseEvent.MOUSE_DOWN))
               {
                  removeEventListener(MouseEvent.MOUSE_DOWN,onPadPress);
               }
               if(hasEventListener(MouseEvent.MOUSE_UP))
               {
                  removeEventListener(MouseEvent.MOUSE_UP,onPadRelease);
               }
               if(hasEventListener(MouseEvent.MOUSE_OVER))
               {
                  removeEventListener(MouseEvent.MOUSE_OVER,onMouseOverPad);
               }
               if(hasEventListener(MouseEvent.MOUSE_OUT))
               {
                  removeEventListener(MouseEvent.MOUSE_OUT,onMouseOutPad);
               }
               break;
            case GameEngine.GE_PLAY:
               super.removeGe2Events(param1);
         }
      }
      
      public function select_tool_setJumpTarget() : void
      {
         clear_inspect();
         _tool = "setJumpTarget";
      }
      
      protected function onMouseOverPad(param1:MouseEvent) : void
      {
         if(GameEngine.GE_EDIT != gameEngineMode)
         {
            _CursorID = CursorManager.setCursor(cursor_select_img,CursorManagerPriority.LOW,-2,-16);
         }
         else
         {
            switch(_tool)
            {
               case "pen":
                  _CursorID = CursorManager.setCursor(cursor_pen_img,CursorManagerPriority.LOW,-2,-16);
                  break;
               case "eraser":
                  _CursorID = CursorManager.setCursor(cursor_eraser_img,CursorManagerPriority.LOW,-2,-16);
                  break;
               case "resize":
                  _CursorID = CursorManager.setCursor(cursor_resize_img,CursorManagerPriority.LOW,-16,-16);
                  break;
               case "jump":
                  _CursorID = CursorManager.setCursor(cursor_jump_img,CursorManagerPriority.LOW,-16,-16);
                  break;
               case "music":
                  _CursorID = CursorManager.setCursor(cursor_music_img,CursorManagerPriority.LOW,-16,-16);
                  break;
               case "setJumpTarget":
                  _CursorID = CursorManager.setCursor(cursor_select_img,CursorManagerPriority.LOW,-16,-16);
            }
         }
         param1.updateAfterEvent();
      }
      
      private function saveMapUsingDialog_ConfirmHandler() : void
      {
         mapPiece.save(saveMapUsingDialog_SaveCompletedHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get allowCut() : Boolean
      {
         return this._1813100089allowCut;
      }
      
      public function set allowNew(param1:Boolean) : void
      {
         var _loc2_:Object = this._1813110167allowNew;
         if(_loc2_ !== param1)
         {
            this._1813110167allowNew = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowNew",_loc2_,param1));
         }
      }
      
      private function setUndoButtons() : void
      {
         switch(gameEngineMode)
         {
            case GameEngine.GE_EDIT:
               allowUndo = undoCurrentIndex != undoTailIndex;
               allowRedo = undoCurrentIndex != undoHeadIndex;
               break;
            case GameEngine.GE_PLAY:
            case GameEngine.GE_LOBBY:
               allowUndo = false;
               allowRedo = false;
         }
      }
      
      private function doResizeTask(param1:Event = null) : void
      {
         markUndoPoint();
         if(Boolean(rmf.rRemove.selected) && Boolean(rmf.rColumn.selected))
         {
            mapPiece.RemoveColumn(resizeFromX);
         }
         else if(Boolean(rmf.rRemove.selected) && Boolean(rmf.rRow.selected))
         {
            mapPiece.RemoveRow(resizeFromY);
         }
         else if(Boolean(rmf.rAdd.selected) && Boolean(rmf.rColumn.selected))
         {
            mapPiece.AddColumn(resizeFromX,rmf.rRight.selected);
         }
         else if(Boolean(rmf.rAdd.selected) && Boolean(rmf.rRow.selected))
         {
            mapPiece.AddRow(resizeFromY,rmf.rBelow.selected);
         }
         redrawMap();
         rmf.title = "Resize map (" + mapPiece.width + " x " + mapPiece.height + ")";
      }
      
      public function set cursorRow(param1:Number) : void
      {
         var _loc2_:Object = this._695559844cursorRow;
         if(_loc2_ !== param1)
         {
            this._695559844cursorRow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cursorRow",_loc2_,param1));
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
      
      public function select_tool_eraser() : void
      {
         _tool = "eraser";
         tagCheck("choose_eraser");
         clear_inspect();
      }
      
      private function entireMapToolTip() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         toolTipText = "<b>Inspect mode on</b>\nMap size is " + mapPiece.width + "x" + mapPiece.height + "\n\n";
         var _loc1_:int = 0;
         while(_loc1_ < MgbMap.layerEditGrid)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < mapPiece.width)
            {
               _loc4_ = 0;
               while(_loc4_ < mapPiece.height)
               {
                  if(mapPiece.mapLayerActors[_loc1_][cell(_loc3_,_loc4_)] > 0)
                  {
                     _loc2_++;
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            toolTipText += "<b>" + MgbMap.layerNames[_loc1_] + " layer:</b>\n    " + _loc2_ + " actor" + (_loc2_ == 1 ? "" : "s") + "\n";
            _loc1_++;
         }
      }
      
      public function selectActor(param1:String = null) : void
      {
         currentActorName = param1;
         tagCheck("choose_actor");
      }
      
      override protected function measure() : void
      {
         super.measure();
      }
      
      protected function onPadRelease(param1:MouseEvent) : void
      {
         if(hasEventListener(MouseEvent.MOUSE_MOVE) == true)
         {
            removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingWhilePressed);
         }
         param1.updateAfterEvent();
      }
      
      [Bindable(event="propertyChange")]
      public function get cursorCol() : Number
      {
         return this._695545418cursorCol;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowResize() : Boolean
      {
         return this._970772829allowResize;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowCopy() : Boolean
      {
         return this._371522142allowCopy;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowSave() : Boolean
      {
         return this._371985510allowSave;
      }
      
      public function set allowGrid(param1:Boolean) : void
      {
         var _loc2_:Object = this._371643951allowGrid;
         if(_loc2_ !== param1)
         {
            this._371643951allowGrid = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowGrid",_loc2_,param1));
         }
      }
      
      private function saveMapUsingDialog_SaveCompletedHandler(param1:MgbMap, param2:int, param3:String) : void
      {
         MgbLogger.getInstance().logInfo("Saved map \'" + param1.name + "\' to project \'" + param1.projectName + "\' OK");
         saveMapScreenShot();
      }
      
      protected function onPadPress(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:int = int(mouseCol(mouseX));
         var _loc3_:int = int(mouseRow(mouseY));
         if(_loc2_ >= mapPiece.width || _loc3_ >= mapPiece.height)
         {
            return;
         }
         switch(_tool)
         {
            case "setJumpTarget":
               dispatchEvent(new ChooseMapJumpCellEvent("change",_loc2_,_loc3_));
               tagCheck("use_jump");
               break;
            case "pen":
               if(null != currentActorName)
               {
                  if(param1.shiftKey)
                  {
                     _loc4_ = Math.min(_loc2_,noted_col);
                     _loc5_ = Math.max(_loc2_,noted_col);
                     _loc6_ = Math.min(_loc3_,noted_row);
                     _loc7_ = Math.max(_loc3_,noted_row);
                     _loc8_ = _loc4_;
                     while(_loc8_ <= _loc5_)
                     {
                        _loc9_ = _loc6_;
                        while(_loc9_ <= _loc7_)
                        {
                           mapPiece.mapLayerActors[currentActorLayer][cell(_loc8_,_loc9_)] = new String(currentActorName);
                           _loc9_++;
                        }
                        _loc8_++;
                     }
                     tagCheck("use_penbox");
                     redrawMap();
                  }
                  else if(actorTileBitMapData(currentActorName) != null && mapPiece.mapLayerActors[currentActorLayer][cell(_loc2_,_loc3_)] != currentActorName)
                  {
                     if(param1.type != MouseEvent.MOUSE_MOVE)
                     {
                        markUndoPoint();
                     }
                     mapPiece.mapLayerActors[currentActorLayer][cell(_loc2_,_loc3_)] = new String(currentActorName);
                     tagCheck("use_pen");
                     redrawMap();
                     note_xy(_loc2_,_loc3_);
                  }
                  else
                  {
                     note_xy(_loc2_,_loc3_);
                  }
               }
               addEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingWhilePressed);
               break;
            case "eraser":
               if(null != mapPiece.mapLayerActors[currentActorLayer][cell(_loc2_,_loc3_)])
               {
                  if(param1.type != MouseEvent.MOUSE_MOVE)
                  {
                     markUndoPoint();
                  }
                  mapPiece.mapLayerActors[currentActorLayer][cell(_loc2_,_loc3_)] = null;
                  tagCheck("use_eraser");
                  redrawMap();
               }
               addEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingWhilePressed);
               break;
            case "resize":
               doResize(_loc2_,_loc3_);
               tagCheck("use_resize");
               break;
            case "jump":
               setJump(_loc2_,_loc3_);
               break;
            case "music":
               setMusic(_loc2_,_loc3_);
         }
         param1.updateAfterEvent();
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
      
      public function changeView(param1:String, param2:Number) : void
      {
         switch(param1)
         {
            case "foreground":
               layerAlphas[MgbMap.layerForeground] = param2;
               break;
            case "background":
               layerAlphas[MgbMap.layerBackground] = param2;
               break;
            default:
               throw new Error("changeView(" + param1 + ") not supported");
         }
         tagCheck(param1 + "Layer" + param2.toString());
         redrawMap();
      }
      
      public function select_tool_resize() : void
      {
         _tool = "resize";
         tagCheck("choose_resize");
         clear_inspect();
      }
      
      private function note_xy(param1:int, param2:int) : void
      {
         noted_col = param1;
         noted_row = param2;
      }
      
      public function set allowZoom(param1:Boolean) : void
      {
         var _loc2_:Object = this._372207292allowZoom;
         if(_loc2_ !== param1)
         {
            this._372207292allowZoom = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowZoom",_loc2_,param1));
         }
      }
      
      protected function onMouseMovingInspect(param1:MouseEvent) : void
      {
         if("inspect" == _tool)
         {
            showToolTip();
         }
         param1.updateAfterEvent();
      }
      
      public function saveMapScreenShot() : void
      {
         var _loc2_:MgbScreenshot = null;
         var _loc4_:int = 0;
         var _loc1_:String = String(TimeUtils.humanTimeDateNow(false,true));
         _loc2_ = new MgbScreenshot();
         var _loc3_:int = Math.min(336,view.bitmapData.width);
         _loc4_ = Math.min(176,view.bitmapData.height);
         _loc2_.bitmapData = new BitmapData(_loc3_,_loc4_);
         _loc2_.bitmapData.draw(view.bitmapData,null,null,null,new Rectangle(0,0,_loc3_,_loc4_));
         _loc2_.userName = this.mapPiece.userName;
         _loc2_.projectName = this.mapPiece.projectName;
         _loc2_.name = this.mapPiece.name;
         _loc2_.width = _loc3_;
         _loc2_.height = _loc4_;
         _loc2_.comment = _loc1_;
         _loc2_.save();
      }
      
      public function set toolTipText(param1:String) : void
      {
         var _loc2_:Object = this._1792120912toolTipText;
         if(_loc2_ !== param1)
         {
            this._1792120912toolTipText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipText",_loc2_,param1));
         }
      }
      
      private function endResizeTask(param1:Event = null) : void
      {
         resizeFromX = resizeFromY = -1;
         rmf["okButton"].removeEventListener("click",doResizeTask);
         rmf["cancelButton"].removeEventListener("click",endResizeTask);
         rmf.removeEventListener("MGB_updateMapView",updateMapView);
         PopUpManager.removePopUp(rmf);
         rmf = null;
         redrawMap();
      }
      
      [Bindable(event="propertyChange")]
      public function get allowNew() : Boolean
      {
         return this._1813110167allowNew;
      }
      
      private function mouseCol(param1:int) : int
      {
         return Math.min(param1 / zoomLevel / MgbSystem.tileMinWidth,mapPiece.width - 1);
      }
      
      public function set allowLoad(param1:Boolean) : void
      {
         var _loc2_:Object = this._371789775allowLoad;
         if(_loc2_ !== param1)
         {
            this._371789775allowLoad = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowLoad",_loc2_,param1));
         }
      }
      
      override public function triggerEditMode() : void
      {
         gameEngineMode = GameEngine.GE_EDIT;
         super.triggerEditMode();
         setUndoButtons();
         allowPut = true;
         allowErase = true;
         allowInspect = true;
         allowResize = true;
         allowZoom = true;
         allowGrid = true;
         allowNew = true;
         allowLoad = true;
         allowSave = true;
         setUndoButtons();
         addGe2Events(GameEngine.GE_EDIT);
      }
      
      override public function newMap(param1:int = 64, param2:int = 48) : void
      {
         markUndoPoint();
         super.newMap(param1,param2);
      }
      
      override protected function addGe2Events(param1:String) : void
      {
         switch(param1)
         {
            case GameEngine.GE_EDIT:
               if(false == hasEventListener(MouseEvent.MOUSE_DOWN))
               {
                  addEventListener(MouseEvent.MOUSE_DOWN,onPadPress);
               }
               if(false == hasEventListener(MouseEvent.MOUSE_UP))
               {
                  addEventListener(MouseEvent.MOUSE_UP,onPadRelease);
               }
               if(false == hasEventListener(MouseEvent.MOUSE_OVER))
               {
                  addEventListener(MouseEvent.MOUSE_OVER,onMouseOverPad);
               }
               if(false == hasEventListener(MouseEvent.MOUSE_OUT))
               {
                  addEventListener(MouseEvent.MOUSE_OUT,onMouseOutPad);
               }
               break;
            case GameEngine.GE_PLAY:
               super.addGe2Events(param1);
         }
      }
      
      private function processSetMapJumpFromSelection(param1:ChooseMapJumpEvent) : void
      {
         if(param1.activating)
         {
            mapPiece.mapLayerActors[MgbMap.layerEvents][cell(param1.sourceX,param1.sourceY)] = param1.newJumpString;
            redrawMap();
         }
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
      
      [Bindable(event="propertyChange")]
      public function get cursorRow() : Number
      {
         return this._695559844cursorRow;
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
      
      private function processSetMusicFromSelection(param1:ChooseMusicEvent) : void
      {
         if(param1.activating)
         {
            mapPiece.mapLayerActors[MgbMap.layerEvents][cell(param1.sourceX,param1.sourceY)] = param1.newMusicString;
            redrawMap();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowInspect() : Boolean
      {
         return this._889438859allowInspect;
      }
      
      protected function onMouseMovingUpdateCursorRowCol(param1:MouseEvent) : void
      {
         cursorCol = mouseCol(mouseX);
         cursorRow = mouseRow(mouseY);
         param1.updateAfterEvent();
      }
      
      public function selectLayer(param1:int) : void
      {
         currentActorLayer = param1;
         tagCheck("choose_layer");
      }
      
      [Bindable(event="propertyChange")]
      public function get allowSelect() : Boolean
      {
         return this._999188901allowSelect;
      }
      
      public function set allowErase(param1:Boolean) : void
      {
         var _loc2_:Object = this._1365793571allowErase;
         if(_loc2_ !== param1)
         {
            this._1365793571allowErase = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowErase",_loc2_,param1));
         }
      }
      
      protected function onMouseMovingWhilePressed(param1:MouseEvent) : void
      {
         onPadPress(param1);
      }
      
      private function markUndoPoint() : void
      {
         var _loc1_:int = 0;
         if(Boolean(mapPiece.width) && Boolean(mapPiece.height))
         {
            _loc1_ = (1 + undoCurrentIndex) % maxUndos;
            if(undoArray[_loc1_])
            {
               undoArray[_loc1_] = "";
            }
            undoArray[_loc1_] = mapPiece.encodeMap();
            undoArrayMapWidth[_loc1_] = mapPiece.width;
            undoArrayMapHeight[_loc1_] = mapPiece.height;
            if(_loc1_ == undoTailIndex)
            {
               undoTailIndex = (undoTailIndex + 1) % maxUndos;
            }
            undoHeadIndex = _loc1_;
            undoCurrentIndex = _loc1_;
         }
         setUndoButtons();
      }
      
      private function setJump(param1:int, param2:int) : void
      {
         var _loc3_:ChooseMapJumpForm = ChooseMapJumpForm(PopUpManager.createPopUp(parent,ChooseMapJumpForm,true));
         _loc3_.configure(parent,mapPiece.name,mapPiece.mapLayerActors[MgbMap.layerEvents][cell(param2,param1)],param1,param2);
         _loc3_.addEventListener("change",processSetMapJumpFromSelection);
      }
      
      public function set allowResize(param1:Boolean) : void
      {
         var _loc2_:Object = this._970772829allowResize;
         if(_loc2_ !== param1)
         {
            this._970772829allowResize = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowResize",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowPaste() : Boolean
      {
         return this._1356123958allowPaste;
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
      
      public function set allowSave(param1:Boolean) : void
      {
         var _loc2_:Object = this._371985510allowSave;
         if(_loc2_ !== param1)
         {
            this._371985510allowSave = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowSave",_loc2_,param1));
         }
      }
      
      override public function triggerPlayMode() : void
      {
         removeGe2Events(GameEngine.GE_EDIT);
         super.triggerPlayMode();
         setUndoButtons();
         allowPut = false;
         allowErase = false;
         allowInspect = false;
         allowResize = false;
         allowZoom = false;
         allowGrid = false;
         allowNew = false;
         allowLoad = false;
         allowSave = false;
      }
      
      public function select_tool_inspect() : void
      {
         if(_tool == "inspect")
         {
            _tool = _tool_before_inspect;
            clear_inspect();
            tagCheck("inspect_off");
         }
         else
         {
            _tool_before_inspect = _tool;
            _tool = "inspect";
            addEventListener(MouseEvent.MOUSE_MOVE,onMouseMovingInspect);
            entireMapToolTip();
            toolTipVisible = true;
            tagCheck("inspect_on");
         }
      }
      
      public function getMapName() : String
      {
         return mapPiece == null || mapPiece.name == null || mapPiece.name == "" ? null : mapPiece.name;
      }
      
      [Bindable(event="propertyChange")]
      public function get toolTipText() : String
      {
         return this._1792120912toolTipText;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowUndo() : Boolean
      {
         return this._372057037allowUndo;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowLoad() : Boolean
      {
         return this._371789775allowLoad;
      }
      
      public function set cursorCol(param1:Number) : void
      {
         var _loc2_:Object = this._695545418cursorCol;
         if(_loc2_ !== param1)
         {
            this._695545418cursorCol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cursorCol",_loc2_,param1));
         }
      }
      
      public function select_tool_pen() : void
      {
         _tool = "pen";
         tagCheck("choose_pen");
         clear_inspect();
      }
      
      public function select_tool_music() : void
      {
         _tool = "music";
         tagCheck("choose_music");
         clear_inspect();
      }
      
      private function setMusic(param1:int, param2:int) : void
      {
         var _loc3_:ChooseMusicForm = ChooseMusicForm(PopUpManager.createPopUp(parent,ChooseMusicForm,true));
         _loc3_.configure(parent,mapPiece.name,mapPiece.mapLayerActors[MgbMap.layerEvents][cell(param2,param1)],param1,param2);
         _loc3_.addEventListener("change",processSetMusicFromSelection);
      }
      
      public function undo() : void
      {
         if(undoCurrentIndex == undoTailIndex)
         {
            Alert.show("No more undo available");
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
            mapPiece.width = undoArrayMapWidth[undoCurrentIndex];
            mapPiece.height = undoArrayMapHeight[undoCurrentIndex];
            mapPiece.decodeMap(undoArray[undoCurrentIndex]);
            redrawMap();
            --undoCurrentIndex;
            if(undoCurrentIndex < 0)
            {
               undoCurrentIndex += maxUndos;
            }
         }
         setUndoButtons();
         tagCheck("undo");
      }
      
      [Bindable(event="propertyChange")]
      public function get allowRedo() : Boolean
      {
         return this._371959015allowRedo;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowZoom() : Boolean
      {
         return this._372207292allowZoom;
      }
      
      [Bindable(event="propertyChange")]
      public function get allowErase() : Boolean
      {
         return this._1365793571allowErase;
      }
      
      public function SaveMapUsingDialog() : void
      {
         mapPiece.savePieceUsingDialog(mgbSession.userName,mgbSession.activeProject,this.parent,saveMapUsingDialog_ConfirmHandler);
         tagCheck("save");
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
      
      public function select_tool_jump() : void
      {
         _tool = "jump";
         tagCheck("choose_jump");
         clear_inspect();
      }
      
      private function mouseRow(param1:int) : int
      {
         return Math.min(param1 / zoomLevel / MgbSystem.tileMinHeight,mapPiece.height - 1);
      }
      
      public function redo() : void
      {
         var _loc1_:int = (1 + undoCurrentIndex) % maxUndos;
         if(undoCurrentIndex == undoHeadIndex)
         {
            Alert.show("No more redo available");
         }
         else
         {
            if(undoCurrentIndex == undoTailIndex)
            {
               undoCurrentIndex = (1 + undoCurrentIndex) % maxUndos;
            }
            mapPiece.width = undoArrayMapWidth[_loc1_];
            mapPiece.height = undoArrayMapHeight[_loc1_];
            mapPiece.decodeMap(undoArray[_loc1_]);
            redrawMap();
            undoCurrentIndex = _loc1_;
         }
         setUndoButtons();
         tagCheck("redo");
      }
   }
}
