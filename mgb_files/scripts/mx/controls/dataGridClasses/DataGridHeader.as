package mx.controls.dataGridClasses
{
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.controls.DataGrid;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.EdgeMetrics;
   import mx.core.FlexSprite;
   import mx.core.FlexVersion;
   import mx.core.IFlexDisplayObject;
   import mx.core.UIComponent;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.events.DataGridEvent;
   import mx.events.SandboxMouseEvent;
   import mx.managers.CursorManagerPriority;
   import mx.skins.halo.DataGridColumnDropIndicator;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.StyleManager;
   
   use namespace mx_internal;
   
   public class DataGridHeader extends DataGridHeaderBase
   {
       
      
      private var headerBGSkinChanged:Boolean = false;
      
      private var lastItemDown:IListItemRenderer;
      
      protected var dataGrid:DataGrid;
      
      private var resizeGraphic:IFlexDisplayObject;
      
      protected var cachedPaddingBottom:Number = 0;
      
      private var headerSepSkinChanged:Boolean = false;
      
      mx_internal var columnDropIndicator:IFlexDisplayObject;
      
      private var separators:Array;
      
      protected var headerItems:Array;
      
      private var startX:Number;
      
      mx_internal var sortArrow:IFlexDisplayObject;
      
      private var dropColumnIndex:int = -1;
      
      private var allowItemSizeChangeNotification:Boolean = true;
      
      public var bottomOffset:Number = 0;
      
      private var lastPt:Point;
      
      private var resizeCursorID:int = 0;
      
      protected var cachedPaddingTop:Number = 0;
      
      public var topOffset:Number = 0;
      
      private var minX:Number;
      
      public var rightOffset:Number = 0;
      
      protected var cachedHeaderHeight:Number = 0;
      
      public var needRightSeparatorEvents:Boolean = false;
      
      public var needRightSeparator:Boolean = false;
      
      private var separatorAffordance:Number = 3;
      
      public var leftOffset:Number = 0;
      
      public function DataGridHeader()
      {
         headerItems = [];
         super();
         addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
         addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
         addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(mx_internal::sortArrow)
         {
            removeChild(DisplayObject(mx_internal::sortArrow));
            mx_internal::sortArrow = null;
            placeSortArrow();
         }
      }
      
      protected function mouseUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:DataGridEvent = null;
         var _loc3_:IListItemRenderer = null;
         var _loc4_:Sprite = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Point = null;
         _loc4_ = Sprite(getChildByName("sortArrowHitArea"));
         if(param1.target == _loc4_)
         {
            _loc5_ = int(mx_internal::visibleColumns.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               if(mx_internal::visibleColumns[_loc6_].colNum == dataGrid.mx_internal::sortIndex)
               {
                  _loc3_ = headerItems[_loc6_];
                  break;
               }
               _loc6_++;
            }
         }
         else
         {
            _loc6_ = 0;
            while(_loc6_ < separators.length)
            {
               if(param1.target == separators[_loc6_] && Boolean(mx_internal::visibleColumns[_loc6_].resizable))
               {
                  return;
               }
               _loc6_++;
            }
            _loc7_ = new Point(param1.stageX,param1.stageY);
            _loc7_ = globalToLocal(_loc7_);
            _loc6_ = 0;
            while(_loc6_ < headerItems.length)
            {
               if(headerItems[_loc6_].x + headerItems[_loc6_].width >= _loc7_.x)
               {
                  _loc3_ = headerItems[_loc6_];
                  break;
               }
               _loc6_++;
            }
            if(_loc6_ >= headerItems.length)
            {
               return;
            }
         }
         if(dataGrid.enabled && (dataGrid.sortableColumns || dataGrid.draggableColumns) && dataGrid.dataProvider && Boolean(dataGrid.mx_internal::headerVisible))
         {
            if(_loc3_ == lastItemDown)
            {
               if(dataGrid.sortableColumns && Boolean(mx_internal::visibleColumns[_loc6_].sortable))
               {
                  lastItemDown = null;
                  _loc2_ = new DataGridEvent(DataGridEvent.HEADER_RELEASE,false,true);
                  _loc2_.columnIndex = mx_internal::visibleColumns[_loc6_].colNum;
                  _loc2_.dataField = mx_internal::visibleColumns[_loc6_].dataField;
                  _loc2_.itemRenderer = _loc3_;
                  dataGrid.dispatchEvent(_loc2_);
               }
            }
         }
      }
      
      protected function drawSeparators() : void
      {
         var _loc4_:UIComponent = null;
         var _loc5_:IFlexDisplayObject = null;
         var _loc6_:Array = null;
         var _loc7_:Class = null;
         if(!separators)
         {
            separators = [];
         }
         var _loc1_:UIComponent = UIComponent(getChildByName("lines"));
         if(!_loc1_)
         {
            _loc1_ = new UIComponent();
            _loc1_.name = "lines";
            addChild(_loc1_);
         }
         else
         {
            setChildIndex(_loc1_,numChildren - 1);
         }
         _loc1_.scrollRect = new Rectangle(0,0,unscaledWidth,unscaledHeight + 1);
         if(headerSepSkinChanged)
         {
            headerSepSkinChanged = false;
            clearSeparators();
         }
         var _loc2_:int = !!mx_internal::visibleColumns ? int(mx_internal::visibleColumns.length) : 0;
         if(!needRightSeparator && _loc2_ > 0)
         {
            _loc2_--;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc3_ < _loc1_.numChildren)
            {
               _loc4_ = UIComponent(_loc1_.getChildAt(_loc3_));
               _loc5_ = IFlexDisplayObject(_loc4_.getChildAt(0));
            }
            else
            {
               if((_loc5_ = new (_loc7_ = getStyle("headerSeparatorSkin"))()) is ISimpleStyleClient)
               {
                  ISimpleStyleClient(_loc5_).styleName = this;
               }
               (_loc4_ = new UIComponent()).addChild(DisplayObject(_loc5_));
               _loc1_.addChild(_loc4_);
               UIComponentGlobals.mx_internal::layoutManager.validateClient(_loc4_,true);
               separators.push(_loc4_);
            }
            if(!(_loc3_ == mx_internal::visibleColumns.length - 1 && !needRightSeparatorEvents))
            {
               DisplayObject(_loc4_).addEventListener(MouseEvent.MOUSE_OVER,columnResizeMouseOverHandler);
               DisplayObject(_loc4_).addEventListener(MouseEvent.MOUSE_OUT,columnResizeMouseOutHandler);
               DisplayObject(_loc4_).addEventListener(MouseEvent.MOUSE_DOWN,columnResizeMouseDownHandler);
            }
            else if(_loc3_ == mx_internal::visibleColumns.length - 1 && !needRightSeparatorEvents)
            {
               DisplayObject(_loc4_).removeEventListener(MouseEvent.MOUSE_OVER,columnResizeMouseOverHandler);
               DisplayObject(_loc4_).removeEventListener(MouseEvent.MOUSE_OUT,columnResizeMouseOutHandler);
               DisplayObject(_loc4_).removeEventListener(MouseEvent.MOUSE_DOWN,columnResizeMouseDownHandler);
            }
            if(!((Boolean(_loc6_ = mx_internal::visibleColumns)) && _loc6_.length > 0 || dataGrid.mx_internal::headerVisible))
            {
               _loc4_.visible = false;
            }
            else
            {
               _loc4_.visible = true;
               _loc4_.x = headerItems[_loc3_].x + mx_internal::visibleColumns[_loc3_].width - Math.round(_loc5_.measuredWidth / 2);
               if(_loc3_ > 0)
               {
                  _loc4_.x = Math.max(_loc4_.x,separators[_loc3_ - 1].x + Math.round(_loc5_.measuredWidth / 2));
               }
               _loc4_.y = 0;
               _loc5_.setActualSize(_loc5_.measuredWidth,Math.ceil(cachedHeaderHeight));
               _loc4_.graphics.clear();
               _loc4_.graphics.beginFill(16777215,0);
               _loc4_.graphics.drawRect(-separatorAffordance,0,_loc5_.measuredWidth + separatorAffordance,cachedHeaderHeight);
               _loc4_.graphics.endFill();
               _loc4_.mouseEnabled = true;
            }
            _loc3_++;
         }
         while(_loc1_.numChildren > _loc2_)
         {
            _loc1_.removeChildAt(_loc1_.numChildren - 1);
            separators.pop();
         }
         UIComponentGlobals.mx_internal::layoutManager.validateClient(_loc1_,true);
      }
      
      private function columnResizeMouseOutHandler(param1:MouseEvent) : void
      {
         if(!enabled || !dataGrid.resizableColumns)
         {
            return;
         }
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         var _loc3_:int = _loc2_.parent.getChildIndex(_loc2_);
         if(!mx_internal::visibleColumns[_loc3_].resizable)
         {
            return;
         }
         cursorManager.removeCursor(resizeCursorID);
      }
      
      override protected function createChildren() : void
      {
         dataGrid = parent as DataGrid;
         mx_internal::selectionLayer = new UIComponent();
         addChild(mx_internal::selectionLayer);
      }
      
      mx_internal function _clearSeparators() : void
      {
         clearSeparators();
      }
      
      protected function drawHeaderIndicator(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:Number, param6:uint, param7:IListItemRenderer) : void
      {
         var _loc8_:Graphics;
         (_loc8_ = param1.graphics).clear();
         _loc8_.beginFill(param6);
         _loc8_.drawRect(0,0,param4,param5);
         _loc8_.endFill();
         param1.x = param2;
         param1.y = param3;
      }
      
      protected function mouseOutHandler(param1:MouseEvent) : void
      {
         var _loc2_:IListItemRenderer = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc6_:Sprite = null;
         if(Boolean(resizeGraphic) || Boolean(dataGrid.mx_internal::movingColumn))
         {
            return;
         }
         if(dataGrid.enabled && dataGrid.sortableColumns && Boolean(dataGrid.mx_internal::headerVisible))
         {
            _loc6_ = Sprite(getChildByName("sortArrowHitArea"));
            if(param1.target == _loc6_)
            {
               _loc4_ = int(mx_internal::visibleColumns.length);
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  if(mx_internal::visibleColumns[_loc3_].colNum == dataGrid.mx_internal::sortIndex)
                  {
                     _loc2_ = headerItems[_loc3_];
                     break;
                  }
                  _loc3_++;
               }
               if(_loc3_ >= mx_internal::visibleColumns.length)
               {
                  return;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < separators.length)
               {
                  if(param1.target == separators[_loc3_] && Boolean(mx_internal::visibleColumns[_loc3_].resizable))
                  {
                     return;
                  }
                  _loc3_++;
               }
               _loc5_ = new Point(param1.stageX,param1.stageY);
               _loc5_ = globalToLocal(_loc5_);
               _loc3_ = 0;
               while(_loc3_ < headerItems.length)
               {
                  if(headerItems[_loc3_].x + headerItems[_loc3_].width >= _loc5_.x)
                  {
                     _loc2_ = headerItems[_loc3_];
                     break;
                  }
                  _loc3_++;
               }
               if(_loc3_ >= headerItems.length)
               {
                  _loc3_ = int(headerItems.length - 1);
               }
            }
            if(mx_internal::visibleColumns.length > 0 && Boolean(mx_internal::visibleColumns[_loc3_].sortable))
            {
               if(_loc6_ = Sprite(mx_internal::selectionLayer.getChildByName("headerSelection")))
               {
                  mx_internal::selectionLayer.removeChild(_loc6_);
               }
            }
         }
         if(param1.buttonDown)
         {
            lastItemDown = _loc2_;
         }
         else
         {
            lastItemDown = null;
         }
      }
      
      private function drawHeaderBackgroundSkin(param1:IFlexDisplayObject) : void
      {
         param1.setActualSize(unscaledWidth,Math.ceil(cachedHeaderHeight));
      }
      
      mx_internal function getSeparators() : Array
      {
         return separators;
      }
      
      private function get resizingColumn() : DataGridColumn
      {
         return dataGrid.mx_internal::resizingColumn;
      }
      
      private function columnResizeMouseDownHandler(param1:MouseEvent) : void
      {
         if(!enabled || !dataGrid.resizableColumns)
         {
            return;
         }
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         var _loc3_:int = _loc2_.parent.getChildIndex(_loc2_);
         if(!mx_internal::visibleColumns[_loc3_].resizable)
         {
            return;
         }
         startX = DisplayObject(param1.target).x + x;
         lastPt = new Point(param1.stageX,param1.stageY);
         lastPt = dataGrid.globalToLocal(lastPt);
         var _loc4_:int = int(separators.length);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            if(separators[_loc6_] == param1.target)
            {
               resizingColumn = mx_internal::visibleColumns[_loc6_];
               _loc5_ = _loc6_;
            }
            else
            {
               separators[_loc6_].mouseEnabled = false;
            }
            _loc6_++;
         }
         if(!resizingColumn)
         {
            return;
         }
         minX = headerItems[_loc5_].x + x + resizingColumn.minWidth;
         var _loc7_:DisplayObject;
         (_loc7_ = systemManager.getSandboxRoot()).addEventListener(MouseEvent.MOUSE_MOVE,columnResizingHandler,true);
         _loc7_.addEventListener(MouseEvent.MOUSE_UP,columnResizeMouseUpHandler,true);
         _loc7_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,columnResizeMouseUpHandler);
         systemManager.deployMouseShields(true);
         var _loc8_:Class = getStyle("columnResizeSkin");
         resizeGraphic = new _loc8_();
         if(resizeGraphic is Sprite)
         {
            Sprite(resizeGraphic).mouseEnabled = false;
         }
         dataGrid.addChild(DisplayObject(resizeGraphic));
         resizeGraphic.move(DisplayObject(param1.target).x + x,0);
         resizeGraphic.setActualSize(resizeGraphic.measuredWidth,dataGrid.height / dataGrid.scaleY);
      }
      
      private function columnDraggingMouseUpHandler(param1:Event) : void
      {
         if(!dataGrid.mx_internal::movingColumn)
         {
            return;
         }
         var _loc2_:int = dataGrid.mx_internal::movingColumn.mx_internal::colNum;
         var _loc3_:Array = dataGrid.mx_internal::getAllVisibleColumns();
         if(dropColumnIndex >= 0)
         {
            if(dropColumnIndex >= _loc3_.length)
            {
               dropColumnIndex = _loc3_.length - 1;
            }
            else if(_loc2_ < _loc3_[dropColumnIndex].colNum)
            {
               --dropColumnIndex;
            }
            dropColumnIndex = _loc3_[dropColumnIndex].colNum;
         }
         dataGrid.mx_internal::shiftColumns(_loc2_,dropColumnIndex,param1 as MouseEvent);
         var _loc4_:DisplayObject;
         (_loc4_ = systemManager.getSandboxRoot()).removeEventListener(MouseEvent.MOUSE_MOVE,columnDraggingMouseMoveHandler,true);
         _loc4_.removeEventListener(MouseEvent.MOUSE_UP,columnDraggingMouseUpHandler,true);
         _loc4_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,columnDraggingMouseUpHandler);
         systemManager.deployMouseShields(false);
         var _loc5_:Sprite;
         if(!(_loc5_ = Sprite(dataGrid.getChildByName("columnDragSelectionLayer"))))
         {
            startX = NaN;
            dataGrid.mx_internal::movingColumn = null;
            dropColumnIndex = -1;
            return;
         }
         var _loc6_:IListItemRenderer;
         if(_loc6_ = IListItemRenderer(getChildByName("headerDragProxy")))
         {
            _loc5_.removeChild(DisplayObject(_loc6_));
         }
         var _loc7_:Sprite;
         if(_loc7_ = Sprite(_loc5_.getChildByName("headerSelection")))
         {
            _loc5_.removeChild(_loc7_);
         }
         if(mx_internal::columnDropIndicator)
         {
            mx_internal::columnDropIndicator.visible = false;
         }
         if(_loc7_ = Sprite(dataGrid.getChildByName("columnDragOverlay")))
         {
            dataGrid.removeChild(_loc7_);
         }
         dataGrid.removeChild(_loc5_);
         startX = NaN;
         dataGrid.mx_internal::movingColumn = null;
         dropColumnIndex = -1;
         invalidateDisplayList();
      }
      
      mx_internal function _drawSeparators() : void
      {
         drawSeparators();
      }
      
      private function columnDraggingMouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:IListItemRenderer = null;
         var _loc4_:Sprite = null;
         var _loc7_:Sprite = null;
         var _loc12_:Number = NaN;
         var _loc13_:EdgeMetrics = null;
         var _loc14_:IListItemRenderer = null;
         var _loc15_:DataGridListData = null;
         var _loc16_:Class = null;
         var _loc17_:Shape = null;
         if(!param1.buttonDown)
         {
            columnDraggingMouseUpHandler(param1);
            return;
         }
         var _loc3_:DataGridColumn = dataGrid.mx_internal::movingColumn;
         var _loc5_:int = 0;
         var _loc6_:int = int(headerItems.length);
         if(isNaN(startX))
         {
            startX = param1.stageX;
            lastItemDown = null;
            _loc13_ = dataGrid.viewMetrics;
            (_loc7_ = new UIComponent()).name = "columnDragSelectionLayer";
            _loc7_.alpha = 0.6;
            dataGrid.addChild(_loc7_);
            _loc7_.x = _loc13_.left;
            _loc7_.y = _loc13_.top;
            (_loc14_ = dataGrid.createColumnItemRenderer(_loc3_,true,_loc3_)).name = "headerDragProxy";
            _loc15_ = new DataGridListData(_loc3_.headerText != null ? _loc3_.headerText : _loc3_.dataField,_loc3_.dataField,_loc3_.mx_internal::colNum,uid,dataGrid,0);
            if(_loc14_ is IDropInListItemRenderer)
            {
               IDropInListItemRenderer(_loc14_).listData = _loc15_;
            }
            _loc7_.addChild(DisplayObject(_loc14_));
            _loc14_.data = _loc3_;
            _loc14_.styleName = getStyle("headerDragProxyStyleName");
            UIComponentGlobals.mx_internal::layoutManager.validateClient(_loc14_,true);
            _loc14_.setActualSize(_loc3_.width,!!dataGrid.mx_internal::_explicitHeaderHeight ? dataGrid.headerHeight : Number(_loc14_.getExplicitOrMeasuredHeight()));
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc2_ = headerItems[_loc5_];
               if(_loc2_.data == dataGrid.mx_internal::movingColumn)
               {
                  break;
               }
               _loc5_++;
            }
            _loc14_.move(_loc2_.x + x,_loc2_.y);
            (_loc4_ = new FlexSprite()).name = "columnDragOverlay";
            _loc4_.alpha = 0.6;
            dataGrid.addChild(_loc4_);
            if(_loc3_.width > 0)
            {
               drawColumnDragOverlay(_loc4_,_loc2_.x + x,0,_loc3_.width,dataGrid.height / dataGrid.scaleY - _loc13_.bottom - _loc4_.y,getStyle("disabledColor"),_loc2_);
            }
            if(_loc4_ = Sprite(mx_internal::selectionLayer.getChildByName("headerSelection")))
            {
               _loc4_.width = dataGrid.mx_internal::movingColumn.width;
               _loc7_.addChild(_loc4_);
               _loc4_.x += x;
            }
            _loc7_.scrollRect = new Rectangle(0,0,dataGrid.width / dataGrid.scaleX,unscaledHeight);
            return;
         }
         var _loc8_:Number = param1.stageX - startX;
         _loc7_ = Sprite(dataGrid.getChildByName("columnDragSelectionLayer"));
         if(_loc4_ = Sprite(_loc7_.getChildByName("headerSelection")))
         {
            _loc4_.x += _loc8_;
         }
         _loc2_ = IListItemRenderer(_loc7_.getChildByName("headerDragProxy"));
         if(_loc2_)
         {
            _loc2_.move(_loc2_.x + _loc8_,_loc2_.y);
         }
         startX += _loc8_;
         var _loc9_:Array = dataGrid.mx_internal::getAllVisibleColumns();
         var _loc10_:Point = new Point(param1.stageX,param1.stageY);
         _loc10_ = dataGrid.globalToLocal(_loc10_);
         lastPt = _loc10_;
         _loc6_ = int(_loc9_.length);
         var _loc11_:Number = dataGrid.viewMetrics.left;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc12_ = Number(_loc9_[_loc5_].width);
            if(_loc10_.x < _loc11_ + _loc12_)
            {
               if(_loc10_.x > _loc11_ + _loc12_ / 2)
               {
                  _loc5_++;
                  _loc11_ += _loc12_;
               }
               if(dropColumnIndex != _loc5_)
               {
                  dropColumnIndex = _loc5_;
                  if(!mx_internal::columnDropIndicator)
                  {
                     if(!(_loc16_ = getStyle("columnDropIndicatorSkin")))
                     {
                        _loc16_ = DataGridColumnDropIndicator;
                     }
                     mx_internal::columnDropIndicator = IFlexDisplayObject(new _loc16_());
                     if(mx_internal::columnDropIndicator is ISimpleStyleClient)
                     {
                        ISimpleStyleClient(mx_internal::columnDropIndicator).styleName = this;
                     }
                     dataGrid.addChild(DisplayObject(mx_internal::columnDropIndicator));
                     (_loc17_ = new Shape()).graphics.beginFill(16777215);
                     _loc17_.graphics.drawRect(0,0,10,10);
                     _loc17_.graphics.endFill();
                     dataGrid.addChild(_loc17_);
                     mx_internal::columnDropIndicator.mask = _loc17_;
                  }
                  dataGrid.setChildIndex(DisplayObject(mx_internal::columnDropIndicator),dataGrid.numChildren - 1);
                  mx_internal::columnDropIndicator.visible = true;
                  (_loc17_ = mx_internal::columnDropIndicator.mask as Shape).x = dataGrid.viewMetrics.left;
                  _loc17_.y = dataGrid.viewMetrics.top;
                  _loc17_.width = dataGrid.width / dataGrid.scaleX - _loc17_.x - dataGrid.viewMetrics.right;
                  _loc17_.height = dataGrid.height / dataGrid.scaleY - _loc17_.x - dataGrid.viewMetrics.bottom;
                  mx_internal::columnDropIndicator.x = _loc11_ - mx_internal::columnDropIndicator.width;
                  mx_internal::columnDropIndicator.y = 0;
                  mx_internal::columnDropIndicator.setActualSize(3,dataGrid.height / dataGrid.scaleY);
               }
               break;
            }
            _loc11_ += _loc12_;
            _loc5_++;
         }
      }
      
      private function columnResizeMouseOverHandler(param1:MouseEvent) : void
      {
         if(!enabled || !dataGrid.resizableColumns)
         {
            return;
         }
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         var _loc3_:int = _loc2_.parent.getChildIndex(_loc2_);
         if(!mx_internal::visibleColumns[_loc3_].resizable)
         {
            return;
         }
         var _loc4_:Class = getStyle("stretchCursor");
         resizeCursorID = cursorManager.setCursor(_loc4_,CursorManagerPriority.HIGH,0,0);
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(param1 == "headerBackgroundSkin")
         {
            headerBGSkinChanged = true;
         }
         else if(param1 == "headerSeparatorSkin")
         {
            headerSepSkinChanged = true;
         }
      }
      
      protected function placeSortArrow() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:Class = null;
         var _loc9_:Graphics = null;
         var _loc10_:int = 0;
         var _loc1_:Sprite = Sprite(getChildByName("sortArrowHitArea"));
         if(dataGrid.mx_internal::sortIndex == -1 && dataGrid.mx_internal::lastSortIndex == -1)
         {
            if(mx_internal::sortArrow)
            {
               mx_internal::sortArrow.visible = false;
            }
            if(_loc1_)
            {
               _loc1_.visible = false;
            }
            return;
         }
         if(!dataGrid.mx_internal::headerVisible)
         {
            if(mx_internal::sortArrow)
            {
               mx_internal::sortArrow.visible = false;
            }
            if(_loc1_)
            {
               _loc1_.visible = false;
            }
            return;
         }
         if(!mx_internal::sortArrow)
         {
            _loc8_ = getStyle("sortArrowSkin");
            mx_internal::sortArrow = new _loc8_();
            DisplayObject(mx_internal::sortArrow).name = enabled ? "sortArrow" : "sortArrowDisabled";
            if(mx_internal::sortArrow is ISimpleStyleClient)
            {
               ISimpleStyleClient(mx_internal::sortArrow).styleName = this;
            }
            addChild(DisplayObject(mx_internal::sortArrow));
         }
         var _loc5_:Boolean = false;
         if(Boolean(headerItems) && Boolean(headerItems.length))
         {
            _loc3_ = int(headerItems.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(mx_internal::visibleColumns[_loc4_].colNum == dataGrid.mx_internal::sortIndex)
               {
                  _loc2_ = headerItems[_loc4_].x + mx_internal::visibleColumns[_loc4_].width;
                  headerItems[_loc4_].setActualSize(mx_internal::visibleColumns[_loc4_].width - mx_internal::sortArrow.measuredWidth - 8,headerItems[_loc4_].height);
                  if(!isNaN(headerItems[_loc4_].explicitWidth))
                  {
                     headerItems[_loc4_].explicitWidth = headerItems[_loc4_].width;
                  }
                  UIComponentGlobals.mx_internal::layoutManager.validateClient(headerItems[_loc4_],true);
                  if(!_loc1_)
                  {
                     _loc1_ = new FlexSprite();
                     _loc1_.name = "sortArrowHitArea";
                     addChild(_loc1_);
                  }
                  else
                  {
                     _loc1_.visible = true;
                  }
                  _loc1_.x = headerItems[_loc4_].x + headerItems[_loc4_].width;
                  _loc1_.y = headerItems[_loc4_].y;
                  (_loc9_ = _loc1_.graphics).clear();
                  _loc9_.beginFill(0,0);
                  _loc9_.drawRect(0,0,mx_internal::sortArrow.measuredWidth + 8,headerItems[_loc4_].height);
                  _loc9_.endFill();
                  _loc5_ = true;
                  break;
               }
               _loc4_++;
            }
         }
         if(isNaN(_loc2_))
         {
            mx_internal::sortArrow.visible = false;
         }
         else
         {
            mx_internal::sortArrow.visible = true;
         }
         if(mx_internal::visibleColumns.length && dataGrid.mx_internal::lastSortIndex >= 0 && dataGrid.mx_internal::lastSortIndex != dataGrid.mx_internal::sortIndex)
         {
            if(mx_internal::visibleColumns[0].colNum <= dataGrid.mx_internal::lastSortIndex && dataGrid.mx_internal::lastSortIndex <= mx_internal::visibleColumns[mx_internal::visibleColumns.length - 1].colNum)
            {
               _loc3_ = int(headerItems.length);
               _loc10_ = 0;
               while(_loc10_ < _loc3_)
               {
                  if(mx_internal::visibleColumns[_loc10_].colNum == dataGrid.mx_internal::lastSortIndex)
                  {
                     headerItems[_loc10_].setActualSize(mx_internal::visibleColumns[_loc10_].width,headerItems[_loc10_].height);
                     UIComponentGlobals.mx_internal::layoutManager.validateClient(headerItems[_loc10_],true);
                     break;
                  }
                  _loc10_++;
               }
            }
         }
         var _loc6_:* = dataGrid.mx_internal::sortDirection == "ASC";
         mx_internal::sortArrow.width = mx_internal::sortArrow.measuredWidth;
         mx_internal::sortArrow.height = mx_internal::sortArrow.measuredHeight;
         DisplayObject(mx_internal::sortArrow).scaleY = _loc6_ ? -1 : 1;
         mx_internal::sortArrow.x = _loc2_ - mx_internal::sortArrow.measuredWidth - 8;
         var _loc7_:Number = cachedHeaderHeight;
         mx_internal::sortArrow.y = (_loc7_ - mx_internal::sortArrow.measuredHeight) / 2 + (_loc6_ ? mx_internal::sortArrow.measuredHeight : 0);
         if(_loc5_ && mx_internal::sortArrow.x < headerItems[_loc4_].x)
         {
            mx_internal::sortArrow.visible = false;
         }
         if(!mx_internal::sortArrow.visible && Boolean(_loc1_))
         {
            _loc1_.visible = false;
         }
      }
      
      protected function drawSelectionIndicator(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:Number, param6:uint, param7:IListItemRenderer) : void
      {
         var _loc8_:Graphics;
         (_loc8_ = param1.graphics).clear();
         _loc8_.beginFill(param6);
         _loc8_.drawRect(0,0,param4,param5);
         _loc8_.endFill();
         param1.x = param2;
         param1.y = param3;
      }
      
      private function set resizingColumn(param1:DataGridColumn) : void
      {
         dataGrid.mx_internal::resizingColumn = param1;
      }
      
      override mx_internal function clearSelectionLayer() : void
      {
         while(mx_internal::selectionLayer.numChildren > 0)
         {
            mx_internal::selectionLayer.removeChildAt(0);
         }
      }
      
      private function columnResizeMouseUpHandler(param1:Event) : void
      {
         var _loc6_:Point = null;
         if(!enabled || !dataGrid.resizableColumns)
         {
            return;
         }
         lastItemDown = null;
         var _loc2_:DisplayObject = systemManager.getSandboxRoot();
         _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,columnResizingHandler,true);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,columnResizeMouseUpHandler,true);
         _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,columnResizeMouseUpHandler);
         systemManager.deployMouseShields(false);
         dataGrid.removeChild(DisplayObject(resizeGraphic));
         resizeGraphic = null;
         cursorManager.removeCursor(resizeCursorID);
         var _loc3_:DataGridColumn = resizingColumn;
         resizingColumn = null;
         var _loc4_:int = !!dataGrid.mx_internal::vScrollBar ? int(dataGrid.mx_internal::vScrollBar.width) : 0;
         var _loc5_:MouseEvent;
         if(_loc5_ = param1 as MouseEvent)
         {
            _loc6_ = new Point(_loc5_.stageX,_loc5_.stageY);
            _loc6_ = dataGrid.globalToLocal(_loc6_);
         }
         else
         {
            _loc6_ = lastPt;
         }
         var _loc7_:Number = Math.min(Math.max(minX,_loc6_.x),dataGrid.width / dataGrid.scaleX - separators[0].width - _loc4_) - startX;
         dataGrid.mx_internal::resizeColumn(_loc3_.mx_internal::colNum,Math.floor(_loc3_.width + _loc7_));
         invalidateDisplayList();
         var _loc8_:DataGridEvent;
         (_loc8_ = new DataGridEvent(DataGridEvent.COLUMN_STRETCH)).columnIndex = _loc3_.mx_internal::colNum;
         _loc8_.dataField = _loc3_.dataField;
         _loc8_.localX = _loc6_.x;
         dataGrid.dispatchEvent(_loc8_);
      }
      
      protected function clearSeparators() : void
      {
         if(!separators)
         {
            return;
         }
         var _loc1_:Sprite = Sprite(getChildByName("lines"));
         while(_loc1_.numChildren)
         {
            _loc1_.removeChildAt(_loc1_.numChildren - 1);
            separators.pop();
         }
      }
      
      mx_internal function get rendererArray() : Array
      {
         return headerItems;
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:Number = dataGrid.mx_internal::calculateHeaderHeight();
         cachedHeaderHeight = !!dataGrid.mx_internal::_explicitHeaderHeight ? dataGrid.headerHeight : _loc1_;
         cachedPaddingBottom = getStyle("paddingBottom");
         cachedPaddingTop = getStyle("paddingTop");
         measuredHeight = cachedHeaderHeight;
      }
      
      protected function drawColumnDragOverlay(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:Number, param6:uint, param7:IListItemRenderer) : void
      {
         var _loc8_:Graphics;
         (_loc8_ = param1.graphics).clear();
         _loc8_.beginFill(param6);
         _loc8_.drawRect(0,0,param4,param5);
         _loc8_.endFill();
         param1.x = param2;
         param1.y = param3;
      }
      
      mx_internal function _placeSortArrow() : void
      {
         placeSortArrow();
      }
      
      mx_internal function _drawHeaderBackground(param1:UIComponent) : void
      {
         drawHeaderBackground(param1);
      }
      
      private function columnResizingHandler(param1:MouseEvent) : void
      {
         if(!MouseEvent(param1).buttonDown)
         {
            columnResizeMouseUpHandler(param1);
            return;
         }
         var _loc2_:int = !!dataGrid.mx_internal::vScrollBar ? int(dataGrid.mx_internal::vScrollBar.width) : 0;
         var _loc3_:Point = new Point(param1.stageX,param1.stageY);
         _loc3_ = dataGrid.globalToLocal(_loc3_);
         lastPt = _loc3_;
         resizeGraphic.move(Math.min(Math.max(minX,_loc3_.x),dataGrid.width / dataGrid.scaleX - separators[0].width - _loc2_),0);
      }
      
      override public function invalidateSize() : void
      {
         if(allowItemSizeChangeNotification)
         {
            super.invalidateSize();
         }
      }
      
      protected function mouseOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:IListItemRenderer = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc6_:Sprite = null;
         if(Boolean(resizingColumn) || Boolean(dataGrid.mx_internal::movingColumn))
         {
            return;
         }
         if(dataGrid.enabled && dataGrid.sortableColumns && Boolean(dataGrid.mx_internal::headerVisible))
         {
            _loc6_ = Sprite(getChildByName("sortArrowHitArea"));
            if(param1.target == _loc6_)
            {
               _loc4_ = int(mx_internal::visibleColumns.length);
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  if(mx_internal::visibleColumns[_loc3_].colNum == dataGrid.mx_internal::sortIndex)
                  {
                     _loc2_ = headerItems[_loc3_];
                     break;
                  }
                  _loc3_++;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < separators.length)
               {
                  if(param1.target == separators[_loc3_] && Boolean(mx_internal::visibleColumns[_loc3_].resizable))
                  {
                     return;
                  }
                  _loc3_++;
               }
               _loc5_ = new Point(param1.stageX,param1.stageY);
               _loc5_ = globalToLocal(_loc5_);
               _loc3_ = 0;
               while(_loc3_ < headerItems.length)
               {
                  if(headerItems[_loc3_].x + headerItems[_loc3_].width >= _loc5_.x)
                  {
                     _loc2_ = headerItems[_loc3_];
                     break;
                  }
                  _loc3_++;
               }
               if(_loc3_ >= headerItems.length)
               {
                  return;
               }
            }
            _loc6_ = Sprite(getChildByName("sortArrowHitArea"));
            if(mx_internal::visibleColumns[_loc3_].sortable)
            {
               if(!(_loc6_ = Sprite(mx_internal::selectionLayer.getChildByName("headerSelection"))))
               {
                  (_loc6_ = new FlexSprite()).name = "headerSelection";
                  _loc6_.mouseEnabled = false;
                  mx_internal::selectionLayer.addChild(_loc6_);
               }
               drawHeaderIndicator(_loc6_,_loc2_.x,0,mx_internal::visibleColumns[_loc3_].width,cachedHeaderHeight - 0.5,getStyle("rollOverColor"),_loc2_);
            }
         }
         if(param1.buttonDown)
         {
            lastItemDown = _loc2_;
         }
         else
         {
            lastItemDown = null;
         }
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:IListItemRenderer = null;
         var _loc3_:Sprite = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Point = null;
         var _loc7_:DisplayObject = null;
         _loc3_ = Sprite(getChildByName("sortArrowHitArea"));
         if(param1.target == _loc3_)
         {
            _loc5_ = int(mx_internal::visibleColumns.length);
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               if(mx_internal::visibleColumns[_loc4_].colNum == dataGrid.mx_internal::sortIndex)
               {
                  _loc2_ = headerItems[_loc4_];
                  break;
               }
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < separators.length)
            {
               if(param1.target == separators[_loc4_] && Boolean(mx_internal::visibleColumns[_loc4_].resizable))
               {
                  return;
               }
               _loc4_++;
            }
            _loc6_ = new Point(param1.stageX,param1.stageY);
            _loc6_ = globalToLocal(_loc6_);
            _loc4_ = 0;
            while(_loc4_ < headerItems.length)
            {
               if(headerItems[_loc4_].x + headerItems[_loc4_].width >= _loc6_.x)
               {
                  _loc2_ = headerItems[_loc4_];
                  break;
               }
               _loc4_++;
            }
            if(_loc4_ >= headerItems.length)
            {
               return;
            }
         }
         if(dataGrid.enabled && (dataGrid.sortableColumns || dataGrid.draggableColumns) && Boolean(dataGrid.mx_internal::headerVisible))
         {
            if(dataGrid.sortableColumns && Boolean(mx_internal::visibleColumns[_loc4_].sortable))
            {
               lastItemDown = _loc2_;
               _loc3_ = Sprite(mx_internal::selectionLayer.getChildByName("headerSelection"));
               if(!_loc3_)
               {
                  _loc3_ = new FlexSprite();
                  _loc3_.name = "headerSelection";
                  mx_internal::selectionLayer.addChild(_loc3_);
               }
               drawSelectionIndicator(_loc3_,_loc2_.x,0,mx_internal::visibleColumns[_loc4_].width,cachedHeaderHeight - 0.5,getStyle("selectionColor"),_loc2_);
            }
            if(dataGrid.draggableColumns && Boolean(mx_internal::visibleColumns[_loc4_].draggable))
            {
               startX = NaN;
               (_loc7_ = systemManager.getSandboxRoot()).addEventListener(MouseEvent.MOUSE_MOVE,columnDraggingMouseMoveHandler,true);
               _loc7_.addEventListener(MouseEvent.MOUSE_UP,columnDraggingMouseUpHandler,true);
               _loc7_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,columnDraggingMouseUpHandler);
               systemManager.deployMouseShields(true);
               dataGrid.mx_internal::movingColumn = mx_internal::visibleColumns[_loc4_];
            }
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:DataGridListData = null;
         var _loc12_:IListItemRenderer = null;
         var _loc13_:IListItemRenderer = null;
         var _loc14_:Object = null;
         var _loc15_:String = null;
         var _loc16_:DataGridColumn = null;
         var _loc17_:Number = NaN;
         var _loc18_:Array = null;
         var _loc19_:int = 0;
         var _loc20_:Class = null;
         var _loc21_:IFlexDisplayObject = null;
         allowItemSizeChangeNotification = false;
         var _loc3_:Array = mx_internal::visibleColumns;
         if(Boolean(mx_internal::headerItemsChanged) && (_loc3_ && _loc3_.length > 0 || dataGrid.mx_internal::headerVisible))
         {
            mx_internal::headerItemsChanged = false;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            _loc10_ = 0;
            _loc17_ = 0;
            _loc18_ = headerItems.slice();
            while(Boolean(_loc3_) && _loc10_ < _loc3_.length)
            {
               if(!(_loc12_ = (_loc16_ = _loc3_[_loc10_]).mx_internal::cachedHeaderRenderer))
               {
                  (_loc12_ = dataGrid.createColumnItemRenderer(_loc16_,true,_loc16_)).styleName = _loc16_;
                  _loc16_.mx_internal::cachedHeaderRenderer = _loc12_;
               }
               _loc11_ = new DataGridListData(_loc16_.headerText != null ? _loc16_.headerText : _loc16_.dataField,_loc16_.dataField,_loc10_,_loc15_,dataGrid,0);
               if(_loc12_ is IDropInListItemRenderer)
               {
                  IDropInListItemRenderer(_loc12_).listData = _loc11_;
               }
               _loc12_.data = _loc16_;
               _loc12_.visible = true;
               if(_loc12_.parent != this)
               {
                  addChild(DisplayObject(_loc12_));
               }
               headerItems[_loc10_] = _loc12_;
               _loc12_.explicitWidth = _loc8_ = _loc16_.width;
               UIComponentGlobals.mx_internal::layoutManager.validateClient(_loc12_,true);
               _loc9_ = Number(_loc12_.getExplicitOrMeasuredHeight());
               _loc12_.setActualSize(_loc8_,!!dataGrid.mx_internal::_explicitHeaderHeight ? cachedHeaderHeight - cachedPaddingTop - cachedPaddingBottom : _loc9_);
               _loc12_.move(_loc5_,_loc6_ + cachedPaddingTop);
               _loc5_ += _loc8_;
               _loc10_++;
               _loc7_ = Math.ceil(Math.max(_loc7_,!!dataGrid.mx_internal::_explicitHeaderHeight ? cachedHeaderHeight : _loc9_ + cachedPaddingBottom + cachedPaddingTop));
               _loc17_ = Math.max(_loc17_,!!dataGrid.mx_internal::_explicitHeaderHeight ? cachedHeaderHeight - cachedPaddingTop - cachedPaddingBottom : _loc9_);
            }
            _loc19_ = 0;
            while(_loc19_ < headerItems.length)
            {
               headerItems[_loc19_].setActualSize(headerItems[_loc19_].width,_loc17_);
               _loc19_++;
            }
            _loc19_ = 0;
            while(_loc19_ < _loc18_.length)
            {
               if((Boolean(_loc12_ = _loc18_[_loc19_])) && headerItems.indexOf(_loc12_) == -1)
               {
                  if(_loc12_.parent == this)
                  {
                     removeChild(DisplayObject(_loc12_));
                  }
               }
               _loc19_++;
            }
            while(headerItems.length > _loc10_)
            {
               if((_loc13_ = headerItems.pop()).parent == this)
               {
                  if(headerItems.indexOf(_loc13_) == -1)
                  {
                     removeChild(DisplayObject(_loc13_));
                  }
               }
            }
         }
         var _loc4_:UIComponent = UIComponent(getChildByName("headerBG"));
         if(headerBGSkinChanged)
         {
            headerBGSkinChanged = false;
            if(_loc4_)
            {
               removeChild(_loc4_);
            }
            _loc4_ = null;
         }
         if(!_loc4_)
         {
            (_loc4_ = new UIComponent()).name = "headerBG";
            addChildAt(DisplayObject(_loc4_),0);
            if(FlexVersion.compatibilityVersion >= FlexVersion.VERSION_3_0)
            {
               if((_loc21_ = new (_loc20_ = getStyle("headerBackgroundSkin"))()) is ISimpleStyleClient)
               {
                  ISimpleStyleClient(_loc21_).styleName = this;
               }
               _loc4_.addChild(DisplayObject(_loc21_));
            }
         }
         if(dataGrid.mx_internal::headerVisible)
         {
            _loc4_.visible = true;
            if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
            {
               dataGrid.mx_internal::_drawHeaderBackground(_loc4_);
            }
            else
            {
               drawHeaderBackgroundSkin(IFlexDisplayObject(_loc4_.getChildAt(0)));
            }
            dataGrid.mx_internal::_drawSeparators();
         }
         else
         {
            _loc4_.visible = false;
            dataGrid.mx_internal::_clearSeparators();
         }
         dataGrid.mx_internal::_placeSortArrow();
         allowItemSizeChangeNotification = true;
      }
      
      protected function drawHeaderBackground(param1:UIComponent) : void
      {
         var _loc2_:Number = width;
         var _loc3_:Number = cachedHeaderHeight;
         var _loc4_:Graphics;
         (_loc4_ = param1.graphics).clear();
         var _loc5_:Array = getStyle("headerColors");
         StyleManager.getColorNames(_loc5_);
         var _loc6_:Matrix;
         (_loc6_ = new Matrix()).createGradientBox(_loc2_,_loc3_ + 1,Math.PI / 2,0,0);
         _loc5_ = [_loc5_[0],_loc5_[0],_loc5_[1]];
         var _loc7_:Array = [0,60,255];
         var _loc8_:Array = [1,1,1];
         _loc4_.beginGradientFill(GradientType.LINEAR,_loc5_,_loc8_,_loc7_,_loc6_);
         _loc4_.lineStyle(0,0,0);
         _loc4_.moveTo(0,0);
         _loc4_.lineTo(_loc2_,0);
         _loc4_.lineTo(_loc2_,_loc3_ - 0.5);
         _loc4_.lineStyle(0,getStyle("borderColor"),100);
         _loc4_.lineTo(0,_loc3_ - 0.5);
         _loc4_.lineStyle(0,0,0);
         _loc4_.endFill();
      }
   }
}
