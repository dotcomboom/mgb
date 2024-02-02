package mx.controls
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextLineMetrics;
   import flash.ui.Keyboard;
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IFontContextComponent;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.CalendarLayoutChangeEvent;
   import mx.events.DateChooserEvent;
   import mx.events.DateChooserEventDetail;
   import mx.managers.IFocusManagerComponent;
   import mx.skins.halo.DateChooserIndicator;
   import mx.styles.ISimpleStyleClient;
   
   use namespace mx_internal;
   
   public class CalendarLayout extends UIComponent implements IFocusManagerComponent, IFontContextComponent
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var dcis:Object = {};
       
      
      private var _enabled:Boolean = true;
      
      private var enabledDaysInMonth:Array;
      
      private var _allowDisjointSelection:Boolean = true;
      
      private var dayNamesChanged:Boolean = false;
      
      private var rollOverIndicator:IFlexDisplayObject;
      
      private var cellHeight:Number = 14;
      
      private var _allowMultipleSelection:Boolean = false;
      
      mx_internal var dayBlocksArray:Array;
      
      private var enabledChanged:Boolean = false;
      
      private var _proposedDisplayedMonth:int = -1;
      
      private var _displayedMonth:int;
      
      mx_internal var selRangeMode:int = 1;
      
      private var _selectableRange:Object = null;
      
      private var disabledRangeMode:Array;
      
      private var yOffset:Number = -1;
      
      private var _selectedRanges:Array;
      
      private var _dayNames:Array;
      
      private var rangeStartDate:Date = null;
      
      private var _firstDayOfWeek:int = 0;
      
      private var cellWidth:Number = 14;
      
      private var _disabledRanges:Array;
      
      private var lastSelectedDate:Date;
      
      private var todaysLabelReference:IUITextField = null;
      
      private var _displayedYear:int;
      
      private var _showToday:Boolean = true;
      
      private var selectedRangeCount:int = 0;
      
      private var todayIndicator:IFlexDisplayObject;
      
      private var selectedMonthYearChanged:Boolean = false;
      
      private var disabledArrays:Array;
      
      private var todayRow:int = -1;
      
      private var _disabledDays:Array;
      
      private var selectionIndicator:Array;
      
      private var todayColumn:int = -1;
      
      private var dayNamesOverride:Array;
      
      private var _proposedDisplayedYear:int = -1;
      
      public function CalendarLayout()
      {
         enabledDaysInMonth = [];
         mx_internal::dayBlocksArray = [];
         disabledArrays = [];
         selectionIndicator = [];
         _disabledDays = [];
         _disabledRanges = [];
         _displayedMonth = new Date().getMonth();
         _displayedYear = new Date().getFullYear();
         _selectedRanges = [];
         super();
         addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
         addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
         addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
      }
      
      mx_internal static function getNewIncrementDate(param1:int, param2:int, param3:int, param4:int) : Object
      {
         var _loc5_:int = param1 + param3;
         var _loc6_:int = param2 + param4;
         while(_loc6_ < 0)
         {
            _loc5_--;
            _loc6_ += 12;
         }
         while(_loc6_ > 11)
         {
            _loc5_++;
            _loc6_ -= 12;
         }
         return {
            "month":_loc6_,
            "year":_loc5_
         };
      }
      
      private static function isDateChooserIndicator(param1:Object) : Boolean
      {
         var xmllist:XMLList;
         var s:String = null;
         var x:XML = null;
         var parent:Object = param1;
         s = getQualifiedClassName(parent);
         if(dcis[s] == 1)
         {
            return true;
         }
         if(dcis[s] == 0)
         {
            return false;
         }
         if(s == "mx.skins.halo::DateChooserIndicator")
         {
            dcis[s] == 1;
            return true;
         }
         x = describeType(parent);
         xmllist = x.extendsClass.(@type == "mx.skins.halo::DateChooserIndicator");
         if(xmllist.length() == 0)
         {
            dcis[s] = 0;
            return false;
         }
         dcis[s] = 1;
         return true;
      }
      
      mx_internal function isDateInRange(param1:Date, param2:Object, param3:int, param4:Boolean = false) : Boolean
      {
         var _loc6_:Object = null;
         var _loc7_:Date = null;
         var _loc8_:Date = null;
         var _loc5_:Boolean = true;
         if(param2)
         {
            if(param4)
            {
               _loc6_ = {};
               if(param2.rangeStart)
               {
                  _loc7_ = param2.rangeStart;
                  _loc6_.rangeStart = new Date(_loc7_.fullYear,_loc7_.month,1);
               }
               if(param2.rangeEnd)
               {
                  _loc8_ = param2.rangeEnd;
                  _loc6_.rangeEnd = new Date(_loc8_.fullYear,_loc8_.month,mx_internal::getNumberOfDaysInMonth(_loc8_.fullYear,_loc8_.month));
               }
               param2 = _loc6_;
            }
            switch(param3)
            {
               case 1:
                  if(param1 < param2.rangeStart || param1 > param2.rangeEnd)
                  {
                     _loc5_ = false;
                  }
                  break;
               case 2:
                  if(param1 < param2.rangeStart)
                  {
                     _loc5_ = false;
                  }
                  break;
               case 3:
                  if(param1 > param2.rangeEnd)
                  {
                     _loc5_ = false;
                  }
                  break;
               case 4:
                  if(param1 > param2 || param1 < param2)
                  {
                     _loc5_ = false;
                  }
            }
         }
         return _loc5_;
      }
      
      private function mouseOverHandler(param1:MouseEvent) : void
      {
         if(Boolean(param1.relatedObject) && param1.relatedObject.parent != this)
         {
            addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         }
         else
         {
            param1.stopImmediatePropagation();
         }
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         var _loc13_:Date = null;
         var _loc14_:Boolean = false;
         var _loc15_:Date = null;
         var _loc2_:Number = getStyle("paddingLeft");
         var _loc3_:Number = getStyle("paddingTop");
         var _loc4_:Number = Number(mx_internal::dayBlocksArray[0][0].x);
         var _loc5_:Number = Number(mx_internal::dayBlocksArray[6][0].x);
         var _loc6_:Number = mx_internal::dayBlocksArray[6][0].y + cellHeight;
         var _loc7_:Point = new Point(param1.stageX,param1.stageY);
         var _loc8_:Number = (_loc7_ = globalToLocal(_loc7_)).y;
         var _loc9_:Number;
         if((_loc9_ = _loc7_.x) < _loc4_ && _loc9_ >= _loc5_ + cellWidth || _loc8_ < _loc6_)
         {
            return;
         }
         var _loc10_:int;
         if((_loc10_ = Math.floor((_loc8_ - _loc3_) / cellHeight)) <= 0)
         {
            return;
         }
         _loc10_ = Math.min(_loc10_,6);
         var _loc11_:int = Math.floor((_loc9_ - _loc2_) / cellWidth);
         _loc11_ = Math.min(_loc11_,6);
         var _loc12_:IUITextField = mx_internal::dayBlocksArray[_loc11_][_loc10_];
         if(disabledArrays[_loc11_][_loc10_])
         {
            return;
         }
         if(_loc8_ >= _loc12_.y && _loc8_ <= _loc12_.y + cellHeight && _loc9_ >= _loc12_.x && _loc9_ <= _loc12_.x + cellWidth)
         {
            _loc13_ = new Date(displayedYear,displayedMonth,int(_loc12_.text));
            if(param1.shiftKey && _allowMultipleSelection)
            {
               mx_internal::addToSelected(_loc13_,true);
               mx_internal::setSelectedIndicators();
            }
            else
            {
               _loc14_ = !!selectionIndicator[_loc11_][_loc10_] ? true : false;
               if(param1.ctrlKey && _allowMultipleSelection && _allowDisjointSelection)
               {
                  if(_loc14_)
                  {
                     mx_internal::removeSelectionIndicator(_loc11_,_loc10_);
                     mx_internal::removeRangeFromSelection(_loc13_,_loc13_);
                  }
                  else
                  {
                     mx_internal::addSelectionIndicator(_loc11_,_loc10_);
                     mx_internal::addToSelected(_loc13_);
                  }
               }
               else
               {
                  rangeStartDate = null;
                  if(_loc14_)
                  {
                     if(selectedRangeCount > 1 || selectedRangeCount == 1 && _selectedRanges[0].rangeStart != _selectedRanges[0].rangeEnd)
                     {
                        selectedRangeCount = 0;
                        mx_internal::addSelectionIndicator(_loc11_,_loc10_);
                        mx_internal::addToSelected(_loc13_);
                        mx_internal::setSelectedIndicators();
                     }
                     else if(param1.ctrlKey)
                     {
                        mx_internal::removeSelectionIndicator(_loc11_,_loc10_);
                        mx_internal::removeRangeFromSelection(_loc13_,_loc13_);
                     }
                  }
                  else
                  {
                     selectedRangeCount = 0;
                     mx_internal::addSelectionIndicator(_loc11_,_loc10_);
                     mx_internal::addToSelected(_loc13_);
                     mx_internal::setSelectedIndicators();
                  }
               }
            }
            mx_internal::dispatchChangeEvent(param1);
            if(todayColumn != -1 && todayRow != -1 && !disabledArrays[todayColumn][todayRow])
            {
               _loc15_ = new Date();
               todayIndicator.alpha = mx_internal::isSelected(_loc15_) ? 0.6 : 1;
            }
            if(selectionIndicator[_loc11_][_loc10_])
            {
               rollOverIndicator.visible = false;
            }
         }
      }
      
      public function set selectableRange(param1:Object) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!param1)
         {
            _selectableRange = null;
            selectedMonthYearChanged = true;
            invalidateProperties();
            return;
         }
         var _loc2_:Date = new Date();
         var _loc3_:int = _loc2_.getMonth();
         var _loc4_:int = _loc2_.getFullYear();
         if(param1 is Date)
         {
            mx_internal::selRangeMode = 4;
            _selectableRange = new Date(param1.getFullYear(),param1.getMonth(),param1.getDate());
            _loc5_ = int(param1.getMonth());
            _loc6_ = int(param1.getFullYear());
         }
         else if(param1 is Object)
         {
            _selectableRange = {};
            if(!param1.rangeStart && Boolean(param1.rangeEnd))
            {
               mx_internal::selRangeMode = 3;
               _selectableRange.rangeEnd = param1.rangeEnd;
               if(_loc4_ <= _selectableRange.rangeEnd.getFullYear())
               {
                  if(_loc3_ >= _selectableRange.rangeEnd.getMonth())
                  {
                     _loc5_ = int(_selectableRange.rangeEnd.getMonth());
                     _loc6_ = int(_selectableRange.rangeEnd.getFullYear());
                  }
                  else if(_loc3_ <= _selectableRange.rangeEnd.getMonth())
                  {
                     _loc5_ = _loc3_;
                     _loc6_ = _loc4_;
                  }
               }
               else if(_loc4_ > _selectableRange.rangeEnd.getFullYear())
               {
                  _loc5_ = int(_selectableRange.rangeEnd.getMonth());
                  _loc6_ = int(_selectableRange.rangeEnd.getFullYear());
               }
            }
            else if(!param1.rangeEnd && Boolean(param1.rangeStart))
            {
               mx_internal::selRangeMode = 2;
               _selectableRange.rangeStart = param1.rangeStart;
               if(_loc4_ >= _selectableRange.rangeStart.getFullYear())
               {
                  if(_loc3_ <= _selectableRange.rangeStart.getMonth())
                  {
                     _loc5_ = int(_selectableRange.rangeStart.getMonth());
                     _loc6_ = int(_selectableRange.rangeStart.getFullYear());
                  }
                  else if(_loc3_ >= _selectableRange.rangeStart.getMonth())
                  {
                     _loc5_ = _loc3_;
                     _loc6_ = _loc4_;
                  }
               }
               else if(_loc4_ < _selectableRange.rangeStart.getFullYear())
               {
                  _loc5_ = int(_selectableRange.rangeStart.getMonth());
                  _loc6_ = int(_selectableRange.rangeStart.getFullYear());
               }
            }
            else if(Boolean(param1.rangeStart) && Boolean(param1.rangeEnd))
            {
               mx_internal::selRangeMode = 1;
               _selectableRange.rangeStart = param1.rangeStart;
               _selectableRange.rangeEnd = param1.rangeEnd;
               if(_loc2_ >= _selectableRange.rangeStart && _loc2_ <= _selectableRange.rangeEnd)
               {
                  _loc5_ = _loc3_;
                  _loc6_ = _loc4_;
               }
               else if(_loc2_ < _selectableRange.rangeStart)
               {
                  _loc5_ = int(_selectableRange.rangeStart.getMonth());
                  _loc6_ = int(_selectableRange.rangeStart.getFullYear());
               }
               else if(_loc2_ > _selectableRange.rangeEnd)
               {
                  _loc5_ = int(_selectableRange.rangeEnd.getMonth());
                  _loc6_ = int(_selectableRange.rangeEnd.getFullYear());
               }
            }
         }
         _displayedMonth = _loc5_;
         _displayedYear = _loc6_;
         selectedMonthYearChanged = true;
         invalidateProperties();
         var _loc7_:Array = selectedRanges;
      }
      
      public function get dayNames() : Array
      {
         return _dayNames;
      }
      
      public function set dayNames(param1:Array) : void
      {
         dayNamesOverride = param1;
         _dayNames = param1 != null ? param1 : resourceManager.getStringArray("controls","dayNamesShortest");
         _dayNames = !!_dayNames ? _dayNames.slice(0) : null;
         dayNamesChanged = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get allowMultipleSelection() : Boolean
      {
         return _allowMultipleSelection;
      }
      
      override protected function createChildren() : void
      {
         var _loc2_:Class = null;
         super.createChildren();
         var _loc1_:Number = 0;
         mx_internal::createDayLabels(-1);
         mx_internal::createTodayIndicator(0);
         if(!rollOverIndicator)
         {
            _loc2_ = getStyle("rollOverIndicatorSkin");
            if(!_loc2_)
            {
               _loc2_ = DateChooserIndicator;
            }
            rollOverIndicator = IFlexDisplayObject(new _loc2_());
            if(isDateChooserIndicator(rollOverIndicator))
            {
               Object(rollOverIndicator).indicatorColor = "rollOverColor";
            }
            if(rollOverIndicator is ISimpleStyleClient)
            {
               ISimpleStyleClient(rollOverIndicator).styleName = this;
            }
            addChildAt(DisplayObject(rollOverIndicator),0);
            rollOverIndicator.visible = false;
         }
         dayNamesChanged = true;
         selectedMonthYearChanged = true;
      }
      
      public function get displayedMonth() : int
      {
         return _proposedDisplayedMonth == -1 ? _displayedMonth : _proposedDisplayedMonth;
      }
      
      mx_internal function getOffsetOfMonth(param1:int, param2:int) : int
      {
         var _loc3_:Date = new Date(param1,param2,1);
         var _loc4_:int;
         return (_loc4_ = _loc3_.getDay() - _firstDayOfWeek) < 0 ? _loc4_ + 7 : _loc4_;
      }
      
      public function set allowMultipleSelection(param1:Boolean) : void
      {
         _allowMultipleSelection = param1;
      }
      
      mx_internal function createDayLabels(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:IUITextField = null;
         var _loc2_:Object = getStyle("weekDayStyleName");
         var _loc3_:int = 0;
         while(_loc3_ < 7)
         {
            mx_internal::dayBlocksArray[_loc3_] = [];
            selectionIndicator[_loc3_] = [];
            _loc4_ = 0;
            while(_loc4_ < 7)
            {
               (_loc5_ = mx_internal::dayBlocksArray[_loc3_][_loc4_] = IUITextField(createInFontContext(UITextField))).selectable = false;
               _loc5_.ignorePadding = true;
               if(param1 == -1)
               {
                  addChild(DisplayObject(_loc5_));
               }
               else
               {
                  addChildAt(DisplayObject(_loc5_),param1++);
               }
               if(_loc4_ == 0)
               {
                  _loc5_.styleName = !!_loc2_ ? _loc2_ : this;
               }
               else
               {
                  _loc5_.styleName = this;
               }
               _loc4_++;
            }
            disabledArrays[_loc3_] = new Array(7);
            _loc3_++;
         }
      }
      
      override public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      mx_internal function checkDateIsDisabled(param1:Date) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!param1)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         if(_selectableRange)
         {
            if(!mx_internal::isDateInRange(param1,_selectableRange,mx_internal::selRangeMode))
            {
               _loc2_ = true;
            }
         }
         if(_disabledRanges.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _disabledRanges.length)
            {
               if(mx_internal::isDateInRange(param1,_disabledRanges[_loc3_],disabledRangeMode[_loc3_]))
               {
                  _loc2_ = true;
               }
               _loc3_++;
            }
         }
         if(_disabledDays.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _disabledDays.length)
            {
               if(param1.getDay() == _disabledDays[_loc4_])
               {
                  _loc2_ = true;
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function get showToday() : Boolean
      {
         return _showToday;
      }
      
      public function set displayedMonth(param1:int) : void
      {
         if(param1 < 0 || param1 > 11)
         {
            return;
         }
         if(param1 == _displayedMonth)
         {
            return;
         }
         _proposedDisplayedMonth = param1;
         selectedMonthYearChanged = true;
         invalidateProperties();
      }
      
      public function get selectedRanges() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:Date = null;
         var _loc3_:Date = null;
         var _loc4_:Date = null;
         var _loc5_:int = 0;
         if(_selectableRange)
         {
            switch(mx_internal::selRangeMode)
            {
               case 1:
                  mx_internal::removeRangeFromSelection(null,_selectableRange.rangeStart);
                  mx_internal::removeRangeFromSelection(_selectableRange.rangeEnd,null);
                  break;
               case 2:
               case 3:
                  mx_internal::removeRangeFromSelection(_selectableRange.rangeEnd,_selectableRange.rangeStart);
                  break;
               case 4:
                  mx_internal::removeRangeFromSelection(null,_selectableRange as Date);
                  mx_internal::removeRangeFromSelection(_selectableRange as Date,null);
            }
         }
         _loc1_ = 0;
         while(_loc1_ < _disabledRanges.length)
         {
            switch(disabledRangeMode[_loc1_])
            {
               case 1:
               case 2:
               case 3:
                  mx_internal::removeRangeFromSelection(_disabledRanges[_loc1_].rangeStart,_disabledRanges[_loc1_].rangeEnd);
                  break;
               case 4:
                  mx_internal::removeRangeFromSelection(_disabledRanges[_loc1_],_disabledRanges[_loc1_]);
                  break;
            }
            _loc1_++;
         }
         if(_disabledDays.length > 0 && Boolean(selectedRangeCount))
         {
            _loc2_ = _selectedRanges[0].rangeStart;
            _loc3_ = _selectedRanges[0].rangeEnd;
            _loc1_ = 1;
            while(_loc1_ < selectedRangeCount)
            {
               if(_loc2_ > _selectedRanges[_loc1_].rangeStart)
               {
                  _loc2_ = _selectedRanges[_loc1_].rangeStart;
               }
               if(_loc3_ < _selectedRanges[_loc1_].rangeEnd)
               {
                  _loc3_ = _selectedRanges[_loc1_].rangeEnd;
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < _disabledDays.length)
            {
               _loc4_ = _loc2_;
               if((_loc5_ = _disabledDays[_loc1_] - _loc4_.getDay()) < 0)
               {
                  _loc5_ += 7;
               }
               _loc4_ = mx_internal::incrementDate(_loc4_,_loc5_);
               while(_loc4_ < _loc3_)
               {
                  mx_internal::removeRangeFromSelection(_loc4_,_loc4_);
                  _loc4_ = mx_internal::incrementDate(_loc4_,7);
               }
               _loc1_++;
            }
         }
         _selectedRanges.length = selectedRangeCount;
         return _selectedRanges;
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc13_:Date = null;
         var _loc2_:Number = getStyle("paddingLeft");
         var _loc3_:Number = getStyle("paddingTop");
         var _loc4_:Number = Number(mx_internal::dayBlocksArray[0][0].x);
         var _loc5_:Number = Number(mx_internal::dayBlocksArray[6][0].x);
         var _loc6_:Number = mx_internal::dayBlocksArray[6][0].y + cellHeight;
         var _loc7_:Point = new Point(param1.stageX,param1.stageY);
         var _loc8_:Number = (_loc7_ = globalToLocal(_loc7_)).y;
         var _loc9_:Number;
         if((_loc9_ = _loc7_.x) < _loc4_ || _loc9_ > _loc5_ + cellWidth || _loc8_ < _loc6_)
         {
            return;
         }
         var _loc10_:int = Math.floor((_loc8_ - _loc3_) / cellHeight);
         var _loc11_:int = Math.floor((_loc9_ - _loc2_) / cellWidth);
         _loc11_ = Math.min(_loc11_,6);
         _loc10_ = Math.min(_loc10_,6);
         var _loc12_:IUITextField = mx_internal::dayBlocksArray[_loc11_][_loc10_];
         if(Boolean(disabledArrays[_loc11_][_loc10_]) || _loc10_ == 0)
         {
            return;
         }
         if(_loc8_ >= _loc12_.y && _loc8_ <= _loc12_.y + cellHeight && _loc9_ >= _loc12_.x && _loc9_ <= _loc12_.x + cellWidth)
         {
            rollOverIndicator.move(_loc12_.x,_loc12_.y + yOffset);
            rollOverIndicator.visible = true;
            if(selectionIndicator[_loc11_][_loc10_])
            {
               rollOverIndicator.visible = false;
            }
            if(todayColumn != -1 && todayRow != -1 && !disabledArrays[todayColumn][todayRow])
            {
               _loc13_ = new Date();
               if(rollOverIndicator.x == todayIndicator.x && rollOverIndicator.y == todayIndicator.y)
               {
                  todayIndicator.alpha = 0.6;
               }
               else if(!mx_internal::isSelected(_loc13_))
               {
                  todayIndicator.alpha = 1;
               }
            }
         }
      }
      
      public function get firstDayOfWeek() : int
      {
         return _firstDayOfWeek;
      }
      
      override protected function measure() : void
      {
         var _loc7_:TextLineMetrics = null;
         var _loc9_:String = null;
         super.measure();
         var _loc1_:Number = getStyle("verticalGap");
         var _loc2_:Number = getStyle("horizontalGap");
         var _loc3_:Number = getStyle("paddingLeft");
         var _loc4_:Number = getStyle("paddingRight");
         var _loc5_:Number = getStyle("paddingBottom");
         var _loc6_:Number = getStyle("paddingTop");
         cellWidth = 0;
         cellHeight = 0;
         var _loc8_:int = 0;
         while(_loc8_ < 7)
         {
            _loc9_ = !!dayNames ? String(dayNames[_loc8_]) : "";
            if((_loc7_ = measureText(_loc9_)).width > cellWidth)
            {
               cellWidth = _loc7_.width;
            }
            if(_loc7_.height > cellHeight)
            {
               cellHeight = _loc7_.height;
            }
            _loc8_++;
         }
         if((_loc7_ = measureText("30")).width > cellWidth)
         {
            cellWidth = _loc7_.width;
         }
         if(_loc7_.height > cellHeight)
         {
            cellHeight = _loc7_.height;
         }
         measuredWidth = _loc3_ + _loc2_ * 6 + cellWidth * 7 + _loc4_;
         measuredHeight = _loc1_ * 6 + cellHeight * 7 + _loc5_ + _loc6_;
         measuredMinWidth = cellWidth * 7;
         measuredMinHeight = cellHeight * 7;
      }
      
      mx_internal function setSelectedIndicators() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:Date = null;
         var _loc1_:int = mx_internal::getOffsetOfMonth(displayedYear,displayedMonth);
         var _loc2_:int = mx_internal::getNumberOfDaysInMonth(displayedYear,displayedMonth);
         var _loc6_:int = 1;
         while(_loc6_ <= _loc2_)
         {
            _loc8_ = new Date(displayedYear,displayedMonth,_loc6_);
            _loc3_ = (_loc5_ = _loc1_ + _loc6_ - 1) % 7;
            _loc4_ = 1 + Math.floor(_loc5_ / 7);
            if(mx_internal::isSelected(_loc8_) && disabledArrays[_loc3_][_loc4_] == false)
            {
               mx_internal::addSelectionIndicator(_loc3_,_loc4_);
            }
            else
            {
               mx_internal::removeSelectionIndicator(_loc3_,_loc4_);
            }
            _loc6_++;
         }
         var _loc7_:Date = new Date();
         if(mx_internal::isSelected(_loc7_))
         {
            todayIndicator.alpha = 1;
         }
      }
      
      public function get fontContext() : IFlexModuleFactory
      {
         return moduleFactory;
      }
      
      mx_internal function removeRangeFromSelection(param1:Date, param2:Date) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Date = null;
         var _loc3_:int = 0;
         while(_loc3_ < selectedRangeCount)
         {
            if(!param1 || param1 <= _selectedRanges[_loc3_].rangeStart)
            {
               _loc4_ = 1;
            }
            else if(param1 <= _selectedRanges[_loc3_].rangeEnd)
            {
               _loc4_ = 2;
            }
            else if(param1 > _selectedRanges[_loc3_].rangeEnd)
            {
               _loc4_ = 3;
            }
            if(param2 < _selectedRanges[_loc3_].rangeStart)
            {
               _loc4_ *= 5;
            }
            else if(param2 < _selectedRanges[_loc3_].rangeEnd)
            {
               _loc4_ *= 7;
            }
            else if(!param2 || param2 >= _selectedRanges[_loc3_].rangeEnd)
            {
               _loc4_ *= 11;
            }
            switch(_loc4_)
            {
               case 5:
               case 33:
                  break;
               case 14:
                  _loc5_ = _selectedRanges[_loc3_].rangeEnd;
                  _selectedRanges[_loc3_].rangeEnd = mx_internal::incrementDate(param1,-1);
                  _selectedRanges[selectedRangeCount] = {};
                  _selectedRanges[selectedRangeCount].rangeStart = mx_internal::incrementDate(param2);
                  _selectedRanges[selectedRangeCount].rangeEnd = _loc5_;
                  selectedRangeCount += 1;
                  break;
               case 7:
                  _selectedRanges[_loc3_].rangeStart = mx_internal::incrementDate(param2);
                  break;
               case 22:
                  _selectedRanges[_loc3_].rangeEnd = mx_internal::incrementDate(param1,-1);
                  break;
               case 11:
                  _selectedRanges[_loc3_] = _selectedRanges[selectedRangeCount - 1];
                  _selectedRanges[selectedRangeCount - 1] = null;
                  --selectedRangeCount;
                  break;
            }
            _loc3_++;
         }
      }
      
      mx_internal function drawDayNames() : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc1_:int = 0;
         while(_loc1_ < 7)
         {
            _loc2_ = (_loc1_ + firstDayOfWeek) % 7;
            _loc3_ = !!dayNames ? String(dayNames[_loc2_]) : "";
            mx_internal::dayBlocksArray[_loc1_][0].text = _loc3_;
            _loc1_++;
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc6_:Date = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = !!lastSelectedDate ? int(lastSelectedDate.getDate()) : 1;
         var _loc4_:int = mx_internal::getNumberOfDaysInMonth(displayedYear,displayedMonth);
         var _loc5_:uint = 0;
         while(_loc5_ < 31)
         {
            if(param1.keyCode == Keyboard.LEFT)
            {
               if(_loc3_ <= 1)
               {
                  return;
               }
               _loc3_--;
               _loc2_ = true;
            }
            else if(param1.keyCode == Keyboard.RIGHT)
            {
               if(_loc3_ >= _loc4_)
               {
                  return;
               }
               _loc3_++;
               _loc2_ = true;
            }
            else if(param1.keyCode == Keyboard.UP)
            {
               if(_loc3_ <= 7)
               {
                  return;
               }
               _loc3_ -= 7;
               _loc2_ = true;
            }
            else if(param1.keyCode == Keyboard.DOWN)
            {
               if(_loc3_ + 7 > _loc4_)
               {
                  return;
               }
               _loc3_ += 7;
               _loc2_ = true;
            }
            else if(param1.keyCode == Keyboard.HOME)
            {
               if(_loc5_ == 0)
               {
                  _loc3_ = 1;
               }
               else
               {
                  _loc3_++;
               }
               _loc2_ = true;
            }
            else if(param1.keyCode == Keyboard.END)
            {
               if(_loc5_ == 0)
               {
                  _loc3_ = _loc4_;
               }
               else
               {
                  _loc3_--;
               }
               _loc2_ = true;
            }
            else if(lastSelectedDate && param1.shiftKey && (param1.keyCode == Keyboard.PAGE_UP || param1.keyCode == Keyboard.PAGE_DOWN))
            {
               _loc2_ = true;
            }
            else if(Boolean(lastSelectedDate) && (param1.keyCode == 189 || param1.keyCode == 187))
            {
               _loc2_ = true;
            }
            if(param1.keyCode >= Keyboard.PAGE_UP && param1.keyCode <= Keyboard.DOWN)
            {
               param1.stopPropagation();
            }
            if(_loc2_)
            {
               _loc6_ = new Date(displayedYear,displayedMonth,_loc3_);
               if(!(mx_internal::checkDateIsDisabled(_loc6_) && !param1.shiftKey))
               {
                  if(!(param1.shiftKey && _allowMultipleSelection))
                  {
                     selectedRangeCount = 0;
                  }
                  mx_internal::addToSelected(_loc6_,param1.shiftKey && _allowMultipleSelection);
                  mx_internal::setSelectedIndicators();
                  mx_internal::dispatchChangeEvent(param1);
                  return;
               }
            }
            _loc5_++;
         }
      }
      
      public function get disabledRanges() : Array
      {
         return _disabledRanges.slice(0);
      }
      
      mx_internal function removeTodayIndicator() : void
      {
         if(todayIndicator)
         {
            removeChild(DisplayObject(todayIndicator));
            todayIndicator = null;
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         _enabled = param1;
         enabledChanged = true;
         invalidateProperties();
      }
      
      public function set displayedYear(param1:int) : void
      {
         if(param1 <= 0)
         {
            return;
         }
         if(param1 == _displayedYear)
         {
            return;
         }
         _proposedDisplayedYear = param1;
         selectedMonthYearChanged = true;
         invalidateProperties();
      }
      
      mx_internal function addSelectionIndicator(param1:int, param2:int) : void
      {
         var _loc3_:Class = null;
         var _loc4_:IUITextField = null;
         if(!selectionIndicator[param1][param2])
         {
            _loc3_ = getStyle("selectionIndicatorSkin");
            if(!_loc3_)
            {
               _loc3_ = DateChooserIndicator;
            }
            selectionIndicator[param1][param2] = IFlexDisplayObject(new _loc3_());
            if(isDateChooserIndicator(selectionIndicator[param1][param2]))
            {
               Object(selectionIndicator[param1][param2]).indicatorColor = "selectionColor";
            }
            if(selectionIndicator[param1][param2] is ISimpleStyleClient)
            {
               ISimpleStyleClient(selectionIndicator[param1][param2]).styleName = this;
            }
            addChildAt(DisplayObject(selectionIndicator[param1][param2]),0);
            _loc4_ = mx_internal::dayBlocksArray[param1][param2];
            selectionIndicator[param1][param2].move(_loc4_.x,_loc4_.y + yOffset);
            selectionIndicator[param1][param2].setActualSize(cellWidth,cellHeight);
         }
         selectionIndicator[param1][param2].visible = true;
      }
      
      public function get selectableRange() : Object
      {
         return _selectableRange;
      }
      
      public function set showToday(param1:Boolean) : void
      {
         if(_showToday != param1)
         {
            _showToday = param1;
         }
         selectedMonthYearChanged = true;
         invalidateProperties();
      }
      
      mx_internal function removeDayLabels() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < 7)
         {
            _loc2_ = 0;
            while(_loc2_ < 7)
            {
               removeChild(mx_internal::dayBlocksArray[_loc1_][_loc2_]);
               mx_internal::dayBlocksArray[_loc1_][_loc2_] = null;
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      mx_internal function stepDate(param1:int, param2:int, param3:Event = null) : void
      {
         var _loc4_:int = displayedYear;
         var _loc5_:int = displayedMonth;
         var _loc6_:Object;
         var _loc7_:int = int((_loc6_ = mx_internal::getNewIncrementDate(_loc4_,_loc5_,param1,param2)).year);
         var _loc8_:int = int(_loc6_.month);
         _displayedMonth = _loc8_;
         _displayedYear = _loc7_;
         selectedMonthYearChanged = true;
         invalidateProperties();
         var _loc9_:DateChooserEvent;
         (_loc9_ = new DateChooserEvent(DateChooserEvent.SCROLL)).triggerEvent = param3;
         if(_loc7_ > _loc4_)
         {
            _loc9_.detail = DateChooserEventDetail.NEXT_YEAR;
         }
         else if(_loc7_ < _loc4_)
         {
            _loc9_.detail = DateChooserEventDetail.PREVIOUS_YEAR;
         }
         else if(_loc8_ > _loc5_)
         {
            _loc9_.detail = DateChooserEventDetail.NEXT_MONTH;
         }
         else if(_loc8_ < _loc5_)
         {
            _loc9_.detail = DateChooserEventDetail.PREVIOUS_MONTH;
         }
         dispatchEvent(_loc9_);
      }
      
      public function set selectedRanges(param1:Array) : void
      {
         _selectedRanges = param1;
         selectedRangeCount = _selectedRanges.length;
         mx_internal::setSelectedIndicators();
      }
      
      private function mouseOutHandler(param1:MouseEvent) : void
      {
         var _loc2_:Date = null;
         if(Boolean(param1.relatedObject) && param1.relatedObject.parent != this)
         {
            removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
            rollOverIndicator.visible = false;
            if(todayColumn != -1 && todayRow != -1 && !disabledArrays[todayColumn][todayRow])
            {
               _loc2_ = new Date();
               if(!mx_internal::isSelected(_loc2_))
               {
                  todayIndicator.alpha = 1;
               }
            }
         }
         else
         {
            param1.stopImmediatePropagation();
         }
      }
      
      public function set firstDayOfWeek(param1:int) : void
      {
         if(param1 < 0 || param1 > 6)
         {
            return;
         }
         if(param1 == _firstDayOfWeek)
         {
            return;
         }
         _firstDayOfWeek = param1;
         dayNamesChanged = true;
         selectedMonthYearChanged = true;
         invalidateProperties();
      }
      
      mx_internal function removeSelectionIndicator(param1:int, param2:int) : void
      {
         if(selectionIndicator[param1][param2])
         {
            removeChild(selectionIndicator[param1][param2]);
            selectionIndicator[param1][param2] = null;
         }
      }
      
      mx_internal function getNumberOfDaysInMonth(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         if(param2 == 1)
         {
            if(param1 % 4 == 0 && param1 % 100 != 0 || param1 % 400 == 0)
            {
               _loc3_ = 29;
            }
            else
            {
               _loc3_ = 28;
            }
         }
         else if(param2 == 3 || param2 == 5 || param2 == 8 || param2 == 10)
         {
            _loc3_ = 30;
         }
         else
         {
            _loc3_ = 31;
         }
         return _loc3_;
      }
      
      mx_internal function addToSelected(param1:Date, param2:Boolean = false) : void
      {
         if(!selectedRangeCount)
         {
            rangeStartDate = null;
         }
         lastSelectedDate = param1;
         if(param2 == false)
         {
            _selectedRanges[selectedRangeCount] = {};
            _selectedRanges[selectedRangeCount].rangeStart = new Date(param1);
            _selectedRanges[selectedRangeCount].rangeEnd = _selectedRanges[selectedRangeCount].rangeStart;
            ++selectedRangeCount;
         }
         else
         {
            if(selectedRangeCount == 0)
            {
               _selectedRanges[0] = {};
               _selectedRanges[0].rangeStart = new Date(param1);
            }
            else
            {
               selectedRangeCount = 1;
               if(!rangeStartDate)
               {
                  rangeStartDate = _selectedRanges[0].rangeStart;
               }
               _selectedRanges[0].rangeStart = new Date(rangeStartDate);
               if(param1 < _selectedRanges[0].rangeStart)
               {
                  _selectedRanges[0].rangeEnd = _selectedRanges[0].rangeStart;
                  _selectedRanges[0].rangeStart = new Date(param1);
                  return;
               }
            }
            _selectedRanges[0].rangeEnd = new Date(param1);
         }
      }
      
      mx_internal function incrementDate(param1:Date, param2:int = 1) : Date
      {
         var _loc3_:Date = new Date(param1);
         var _loc4_:Number = _loc3_.getTime();
         _loc3_.setTime(_loc4_ + param2 * 86400000);
         return _loc3_;
      }
      
      public function get displayedYear() : int
      {
         return _proposedDisplayedYear == -1 ? _displayedYear : _proposedDisplayedYear;
      }
      
      public function set fontContext(param1:IFlexModuleFactory) : void
      {
         this.moduleFactory = param1;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc2_:Boolean = !param1 || param1 == "styleName";
         if(_loc2_ || param1 == "todayStyleName")
         {
            selectedMonthYearChanged = true;
            invalidateProperties();
         }
         if(_loc2_ || param1 == "weekDayStyleName")
         {
            _loc3_ = getStyle("weekDayStyleName");
            if(!_loc3_)
            {
               _loc3_ = this;
            }
            if(mx_internal::dayBlocksArray)
            {
               _loc4_ = 0;
               while(_loc4_ < 7)
               {
                  if(Boolean(mx_internal::dayBlocksArray[_loc4_]) && Boolean(mx_internal::dayBlocksArray[_loc4_][0]))
                  {
                     mx_internal::dayBlocksArray[_loc4_][0].styleName = _loc3_;
                  }
                  _loc4_++;
               }
            }
         }
         super.styleChanged(param1);
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Date = null;
         super.commitProperties();
         if(hasFontContextChanged() && todayIndicator != null)
         {
            mx_internal::removeSelectionIndicators();
            _loc1_ = getChildIndex(DisplayObject(todayIndicator));
            mx_internal::removeTodayIndicator();
            mx_internal::createTodayIndicator(_loc1_);
            _loc1_ = getChildIndex(mx_internal::dayBlocksArray[0][0]);
            mx_internal::removeDayLabels();
            mx_internal::createDayLabels(_loc1_);
            enabledChanged = true;
            dayNamesChanged = true;
            selectedMonthYearChanged = true;
         }
         if(enabledChanged)
         {
            enabledChanged = false;
            _loc2_ = 0;
            while(_loc2_ < 7)
            {
               _loc3_ = 0;
               while(_loc3_ < 7)
               {
                  mx_internal::dayBlocksArray[_loc2_][_loc3_].enabled = _enabled;
                  disabledArrays[_loc2_][_loc3_] = _enabled;
                  _loc3_++;
               }
               _loc2_++;
            }
            if(!_enabled)
            {
               if(todayIndicator)
               {
                  todayIndicator.alpha = 0.3;
               }
               removeEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
               removeEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
               removeEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
               removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
            }
            else
            {
               if(todayIndicator)
               {
                  todayIndicator.alpha = 1;
               }
               selectedMonthYearChanged = true;
               addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
               addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
               addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
               addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
            }
         }
         if(dayNamesChanged)
         {
            dayNamesChanged = false;
            mx_internal::drawDayNames();
         }
         if(selectedMonthYearChanged)
         {
            selectedMonthYearChanged = false;
            _loc4_ = new Date(_proposedDisplayedYear == -1 ? _displayedYear : _proposedDisplayedYear,_proposedDisplayedMonth == -1 ? _displayedMonth : _proposedDisplayedMonth);
            if(mx_internal::isDateInRange(_loc4_,_selectableRange,mx_internal::selRangeMode,true))
            {
               mx_internal::setSelectedMonthAndYear();
            }
            _proposedDisplayedYear = -1;
            _proposedDisplayedMonth = -1;
         }
      }
      
      mx_internal function removeSelectionIndicators() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < 7)
         {
            _loc2_ = 0;
            while(_loc2_ < 7)
            {
               mx_internal::removeSelectionIndicator(_loc1_,_loc2_);
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         dayNames = dayNamesOverride;
      }
      
      mx_internal function setSelectedMonthAndYear(param1:int = -1, param2:int = -1) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc17_:Date = null;
         var _loc18_:IUITextField = null;
         var _loc19_:String = null;
         var _loc20_:Object = null;
         var _loc21_:int = 0;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc8_:Date = null;
         var _loc9_:int = param1 == -1 ? displayedMonth : param1;
         var _loc10_:int = param2 == -1 ? displayedYear : param2;
         enabledDaysInMonth = [];
         var _loc11_:int = mx_internal::getOffsetOfMonth(_loc10_,_loc9_);
         var _loc12_:int = mx_internal::getNumberOfDaysInMonth(_loc10_,_loc9_);
         var _loc13_:Date;
         var _loc14_:Boolean = (_loc13_ = new Date()).getFullYear() == _loc10_ && _loc13_.getMonth() == _loc9_;
         var _loc15_:int = Math.max(_loc9_ - 1,0);
         var _loc16_:Date = new Date(_loc10_,_loc15_,1);
         _loc3_ = mx_internal::getNumberOfDaysInMonth(_loc16_.getFullYear(),_loc16_.getMonth());
         _loc5_ = 1;
         _loc4_ = 0;
         while(_loc4_ < _loc11_)
         {
            mx_internal::dayBlocksArray[_loc4_][_loc5_].text = "";
            disabledArrays[_loc4_][_loc5_] = true;
            mx_internal::removeSelectionIndicator(_loc4_,_loc5_);
            _loc4_++;
         }
         _loc3_ = 1;
         while(_loc3_ <= _loc12_)
         {
            _loc17_ = new Date(_loc10_,_loc9_,_loc3_);
            _loc4_ = (_loc6_ = _loc11_ + _loc3_ - 1) % 7;
            _loc5_ = 1 + Math.floor(_loc6_ / 7);
            (_loc18_ = mx_internal::dayBlocksArray[_loc4_][_loc5_]).text = _loc3_.toString();
            if(_enabled)
            {
               disabledArrays[_loc4_][_loc5_] = false;
               _loc18_.enabled = true;
            }
            if(!_loc18_.styleName)
            {
               _loc18_.styleName = this;
            }
            if(_loc14_ && _loc17_.getDate() == _loc13_.getDate() && _showToday)
            {
               todayRow = _loc5_;
               todayColumn = _loc4_;
               _loc7_ = true;
               todayIndicator.visible = _showToday;
               _loc18_.styleName = getStyle("todayStyleName");
               todayIndicator.move(_loc18_.x,_loc18_.y + yOffset);
               todaysLabelReference = _loc18_;
            }
            else if(!_loc7_)
            {
               if(todaysLabelReference)
               {
                  todaysLabelReference.styleName = this;
               }
               todayIndicator.visible = false;
            }
            if(_selectableRange)
            {
               if(!mx_internal::isDateInRange(_loc17_,_selectableRange,mx_internal::selRangeMode))
               {
                  _loc18_.enabled = false;
                  disabledArrays[_loc4_][_loc5_] = true;
               }
            }
            if(_disabledRanges.length > 0)
            {
               _loc21_ = 0;
               while(_loc21_ < _disabledRanges.length)
               {
                  if(mx_internal::isDateInRange(_loc17_,_disabledRanges[_loc21_],disabledRangeMode[_loc21_]))
                  {
                     _loc18_.enabled = false;
                     disabledArrays[_loc4_][_loc5_] = true;
                  }
                  _loc21_++;
               }
            }
            _loc20_ = {};
            if(_loc18_.enabled)
            {
               _loc20_.name = _loc18_.name;
               _loc20_.text = _loc18_.text;
               _loc20_.x = _loc18_.x;
               _loc20_.y = _loc18_.y;
            }
            enabledDaysInMonth.push(_loc20_);
            _loc3_++;
         }
         _loc3_ = 1;
         _loc6_ = _loc11_ + _loc12_;
         while(_loc6_ < 42)
         {
            _loc4_ = _loc6_ % 7;
            _loc5_ = 1 + Math.floor(_loc6_ / 7);
            mx_internal::dayBlocksArray[_loc4_][_loc5_].text = "";
            disabledArrays[_loc4_][_loc5_] = true;
            mx_internal::removeSelectionIndicator(_loc4_,_loc5_);
            _loc6_++;
         }
         if(_disabledDays.length > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _disabledDays.length)
            {
               if(_disabledDays[_loc6_] >= 0 && _disabledDays[_loc6_] <= 6 && _disabledDays[_loc6_] != -1)
               {
                  _loc4_ = (7 + _disabledDays[_loc6_] - _firstDayOfWeek) % 7;
                  _loc5_ = 1;
                  while(_loc5_ < 7)
                  {
                     disabledArrays[_loc4_][_loc5_] = true;
                     _loc22_ = Number(mx_internal::dayBlocksArray[_loc4_][_loc5_].text);
                     if(!isNaN(_loc22_))
                     {
                        _loc23_ = _loc11_ + _loc22_ % 7;
                        enabledDaysInMonth[_loc22_ - 1] = null;
                     }
                     mx_internal::dayBlocksArray[_loc4_][_loc5_].enabled = false;
                     _loc5_++;
                  }
               }
               _loc6_++;
            }
         }
         _displayedMonth = _loc9_;
         _displayedYear = _loc10_;
         _loc8_ = new Date(_loc10_,_loc9_,1);
         todayIndicator.alpha = !!todaysLabelReference ? (todaysLabelReference.enabled == false ? 0.3 : 1) : 1;
         mx_internal::setSelectedIndicators();
         invalidateDisplayList();
      }
      
      public function set allowDisjointSelection(param1:Boolean) : void
      {
         _allowDisjointSelection = param1;
      }
      
      public function set disabledRanges(param1:Array) : void
      {
         _disabledRanges = param1.slice(0);
         disabledRangeMode = [];
         var _loc2_:int = 0;
         while(_loc2_ < _disabledRanges.length)
         {
            if(_disabledRanges[_loc2_] is Date)
            {
               disabledRangeMode[_loc2_] = 4;
               _disabledRanges[_loc2_] = new Date(param1[_loc2_].getFullYear(),param1[_loc2_].getMonth(),param1[_loc2_].getDate());
            }
            else if(_disabledRanges[_loc2_] is Object)
            {
               _disabledRanges[_loc2_] = {};
               _disabledRanges[_loc2_] = param1[_loc2_];
               if(!_disabledRanges[_loc2_].rangeStart && Boolean(_disabledRanges[_loc2_].rangeEnd))
               {
                  disabledRangeMode[_loc2_] = 3;
               }
               else if(Boolean(_disabledRanges[_loc2_].rangeStart) && !_disabledRanges[_loc2_].rangeEnd)
               {
                  disabledRangeMode[_loc2_] = 2;
               }
               else if(Boolean(_disabledRanges[_loc2_].rangeStart) && Boolean(_disabledRanges[_loc2_].rangeEnd))
               {
                  disabledRangeMode[_loc2_] = 1;
               }
            }
            _loc2_++;
         }
         selectedMonthYearChanged = true;
         invalidateProperties();
         var _loc3_:Array = selectedRanges;
      }
      
      mx_internal function isSelected(param1:Date) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < selectedRangeCount)
         {
            if(param1 >= _selectedRanges[_loc2_].rangeStart && param1 <= _selectedRanges[_loc2_].rangeEnd)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get allowDisjointSelection() : Boolean
      {
         return _allowDisjointSelection;
      }
      
      public function get selectedDate() : Date
      {
         return !!selectedRangeCount ? _selectedRanges[0].rangeStart : null;
      }
      
      public function set selectedDate(param1:Date) : void
      {
         selectedRangeCount = 0;
         if(Boolean(param1) && !mx_internal::checkDateIsDisabled(param1))
         {
            mx_internal::addToSelected(param1);
            _displayedMonth = param1.getMonth();
            _displayedYear = param1.getFullYear();
            selectedMonthYearChanged = true;
            invalidateProperties();
         }
         else
         {
            mx_internal::setSelectedIndicators();
         }
      }
      
      public function set disabledDays(param1:Array) : void
      {
         _disabledDays = param1.slice(0);
         selectedMonthYearChanged = true;
         invalidateProperties();
         var _loc2_:Array = selectedRanges;
      }
      
      mx_internal function createTodayIndicator(param1:int) : void
      {
         var _loc2_:Class = null;
         if(!todayIndicator)
         {
            _loc2_ = getStyle("todayIndicatorSkin");
            if(!_loc2_)
            {
               _loc2_ = DateChooserIndicator;
            }
            todayIndicator = IFlexDisplayObject(new _loc2_());
            if(isDateChooserIndicator(todayIndicator))
            {
               Object(todayIndicator).indicatorColor = "todayColor";
            }
            if(todayIndicator is ISimpleStyleClient)
            {
               ISimpleStyleClient(todayIndicator).styleName = this;
            }
            addChildAt(DisplayObject(todayIndicator),param1);
            todayIndicator.visible = false;
         }
      }
      
      public function get disabledDays() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc2_ < _disabledDays.length)
         {
            if(_disabledDays[_loc2_] >= 0 && _disabledDays[_loc2_] <= 6)
            {
               _loc1_[_loc3_] = _disabledDays[_loc2_];
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc10_:int = 0;
         var _loc11_:IUITextField = null;
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("paddingLeft");
         var _loc4_:Number = getStyle("paddingRight");
         var _loc5_:Number = getStyle("paddingBottom");
         var _loc6_:Number = getStyle("paddingTop");
         var _loc7_:Number = _loc3_;
         cellWidth = Math.max((param1 - (_loc3_ + _loc4_)) / 7,4);
         cellHeight = Math.max((param2 - _loc5_) / 7,4);
         var _loc8_:Number = _loc6_;
         rollOverIndicator.setActualSize(cellWidth,cellHeight);
         todayIndicator.setActualSize(cellWidth,cellHeight);
         var _loc9_:int = 0;
         while(_loc9_ < 7)
         {
            _loc10_ = 0;
            while(_loc10_ < 7)
            {
               _loc11_ = mx_internal::dayBlocksArray[_loc9_][_loc10_];
               if(_loc10_ == 0)
               {
                  _loc8_ = _loc6_;
               }
               else
               {
                  _loc8_ += cellHeight;
               }
               _loc11_.setActualSize(cellWidth,cellHeight);
               _loc11_.move(_loc7_,_loc8_);
               if(selectionIndicator[_loc9_][_loc10_])
               {
                  selectionIndicator[_loc9_][_loc10_].setActualSize(cellWidth,cellHeight);
                  selectionIndicator[_loc9_][_loc10_].move(_loc7_,_loc8_ + yOffset);
               }
               _loc10_++;
            }
            _loc7_ += cellWidth;
            _loc9_++;
         }
         mx_internal::drawDayNames();
         mx_internal::setSelectedMonthAndYear();
      }
      
      mx_internal function dispatchChangeEvent(param1:Event = null) : void
      {
         var _loc2_:CalendarLayoutChangeEvent = new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE);
         _loc2_.newDate = lastSelectedDate;
         _loc2_.triggerEvent = param1;
         dispatchEvent(_loc2_);
      }
   }
}
