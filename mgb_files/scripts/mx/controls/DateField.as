package mx.controls
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import mx.controls.dataGridClasses.DataGridListData;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.controls.listClasses.ListData;
   import mx.core.ClassFactory;
   import mx.core.FlexVersion;
   import mx.core.IDataRenderer;
   import mx.core.IFactory;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.events.CalendarLayoutChangeEvent;
   import mx.events.DateChooserEvent;
   import mx.events.DropdownEvent;
   import mx.events.FlexEvent;
   import mx.events.FlexMouseEvent;
   import mx.events.InterManagerRequest;
   import mx.events.SandboxMouseEvent;
   import mx.managers.IFocusManagerComponent;
   import mx.managers.ISystemManager;
   import mx.managers.PopUpManager;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   import mx.styles.StyleProxy;
   import mx.utils.ObjectUtil;
   
   use namespace mx_internal;
   
   public class DateField extends ComboBase implements IDataRenderer, IDropInListItemRenderer, IFocusManagerComponent, IListItemRenderer
   {
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var _enabled:Boolean = true;
      
      private var minYearChanged:Boolean = false;
      
      private var dayNamesChanged:Boolean = false;
      
      private var monthNamesChanged:Boolean = false;
      
      private var isMouseOver:Boolean = false;
      
      private var displayedYearChanged:Boolean = false;
      
      private var yearSymbolOverride:String;
      
      private var monthSymbolOverride:String;
      
      private var selectableRangeChanged:Boolean = false;
      
      private var enabledChanged:Boolean = false;
      
      [Bindable("firstDayOfWeekChanged")]
      private var firstDayOfWeekOverride:Object;
      
      private var _displayedMonth:int;
      
      private var _monthNames:Array;
      
      private var disabledDaysChanged:Boolean = false;
      
      private var monthSymbolChanged:Boolean = false;
      
      private var firstDayOfWeekChanged:Boolean = false;
      
      private var _selectableRange:Object = null;
      
      private var updateDateFiller:Boolean = false;
      
      private var _dayNames:Array;
      
      private var _dropdown:DateChooser;
      
      private var _firstDayOfWeek:Object;
      
      private var _minYear:int = 1900;
      
      private var _dropdownFactory:IFactory;
      
      private var _monthSymbol:String;
      
      private var _data:Object;
      
      private var selectedDateChanged:Boolean = false;
      
      private var monthNamesOverride:Array;
      
      private var displayedMonthChanged:Boolean = false;
      
      private var isPressed:Boolean;
      
      private var addedToPopupManager:Boolean = false;
      
      private var lastSelectedDate:Date;
      
      private var _disabledRanges:Array;
      
      private var _parseFunction:Function;
      
      private var _maxYear:int = 2100;
      
      private var maxYearChanged:Boolean = false;
      
      private var yearChangedWithKeys:Boolean = false;
      
      private var selectedDateSet:Boolean;
      
      private var inKeyDown:Boolean = false;
      
      private var _displayedYear:int;
      
      private var openPos:Number = 0;
      
      private var _showToday:Boolean = true;
      
      private var yearSymbolChanged:Boolean = false;
      
      private var _listData:BaseListData;
      
      private var _selectedDate:Date = null;
      
      private var yearNavigationEnabledChanged:Boolean = false;
      
      private var _formatString:String = null;
      
      private var _yearNavigationEnabled:Boolean = false;
      
      private var _disabledDays:Array;
      
      [Bindable("formatStringChanged")]
      private var formatStringOverride:String;
      
      private var disabledRangesChanged:Boolean = false;
      
      private var _yearSymbol:String;
      
      private var creatingDropdown:Boolean = false;
      
      private var _labelFunction:Function;
      
      mx_internal var showingDropdown:Boolean = false;
      
      private var dayNamesOverride:Array;
      
      private var showTodayChanged:Boolean = false;
      
      public function DateField()
      {
         _disabledDays = [];
         _disabledRanges = [];
         _displayedMonth = new Date().getMonth();
         _displayedYear = new Date().getFullYear();
         _dropdownFactory = new ClassFactory(DateChooser);
         _parseFunction = DateField.stringToDate;
         super();
         addEventListener(Event.REMOVED_FROM_STAGE,removedFromStageHandler);
      }
      
      public static function dateToString(param1:Date, param2:String) : String
      {
         var _loc7_:String = null;
         if(!param1)
         {
            return "";
         }
         var _loc3_:String = String(param1.getDate());
         if(_loc3_.length < 2)
         {
            _loc3_ = "0" + _loc3_;
         }
         var _loc4_:String;
         if((_loc4_ = String(param1.getMonth() + 1)).length < 2)
         {
            _loc4_ = "0" + _loc4_;
         }
         var _loc5_:String = String(param1.getFullYear());
         var _loc6_:String = "";
         var _loc8_:int = param2 != null ? param2.length : 0;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            if((_loc7_ = param2.charAt(_loc9_)) == "M")
            {
               if(param2.charAt(_loc9_ + 1) == "/" && param1.getMonth() < 9)
               {
                  _loc6_ += _loc4_.substring(1) + "/";
               }
               else
               {
                  _loc6_ += _loc4_;
               }
               _loc9_++;
            }
            else if(_loc7_ == "D")
            {
               if(param2.charAt(_loc9_ + 1) == "/" && param1.getDate() < 10)
               {
                  _loc6_ += _loc3_.substring(1) + "/";
               }
               else
               {
                  _loc6_ += _loc3_;
               }
               _loc9_++;
            }
            else if(_loc7_ == "Y")
            {
               if(param2.charAt(_loc9_ + 2) == "Y")
               {
                  _loc6_ += _loc5_;
                  _loc9_ += 3;
               }
               else
               {
                  _loc6_ += _loc5_.substring(2,4);
                  _loc9_++;
               }
            }
            else
            {
               _loc6_ += _loc7_;
            }
            _loc9_++;
         }
         return _loc6_;
      }
      
      public static function stringToDate(param1:String, param2:String) : Date
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = "";
         var _loc6_:String = "";
         var _loc7_:String = "";
         var _loc8_:int = 0;
         var _loc9_:int = param2.length;
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            _loc4_ = "" + param1.charAt(_loc8_);
            _loc3_ = "" + param2.charAt(_loc10_);
            if(_loc3_ == "M")
            {
               if(isNaN(Number(_loc4_)) || _loc4_ == " ")
               {
                  _loc8_--;
               }
               else
               {
                  _loc6_ += _loc4_;
               }
            }
            else if(_loc3_ == "D")
            {
               if(isNaN(Number(_loc4_)) || _loc4_ == " ")
               {
                  _loc8_--;
               }
               else
               {
                  _loc5_ += _loc4_;
               }
            }
            else if(_loc3_ == "Y")
            {
               _loc7_ += _loc4_;
            }
            else if(!isNaN(Number(_loc4_)) && _loc4_ != " ")
            {
               return null;
            }
            _loc10_++;
            _loc8_++;
         }
         if((_loc4_ = "" + param1.charAt(param2.length - _loc10_ + _loc8_)) != "" && _loc4_ != " ")
         {
            return null;
         }
         var _loc11_:Number = Number(_loc6_);
         var _loc12_:Number = Number(_loc5_);
         var _loc13_:Number = Number(_loc7_);
         if(isNaN(_loc13_) || isNaN(_loc11_) || isNaN(_loc12_))
         {
            return null;
         }
         if(_loc7_.length == 2 && _loc13_ < 70)
         {
            _loc13_ += 2000;
         }
         var _loc14_:Date = new Date(_loc13_,_loc11_ - 1,_loc12_);
         if(_loc12_ != _loc14_.getDate() || _loc11_ - 1 != _loc14_.getMonth())
         {
            return null;
         }
         return _loc14_;
      }
      
      [Bindable("yearNavigationEnabledChanged")]
      public function get yearNavigationEnabled() : Boolean
      {
         return _yearNavigationEnabled;
      }
      
      [Bindable("dayNamesChanged")]
      public function get dayNames() : Array
      {
         return _dayNames;
      }
      
      public function get dropdown() : DateChooser
      {
         return _dropdown;
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         if(mx_internal::showingDropdown && param1 != null)
         {
            displayDropdown(false);
         }
         super.focusOutHandler(param1);
         if(_parseFunction != null)
         {
            _selectedDate = _parseFunction(text,formatString);
         }
         selectedDate_changeHandler(param1);
      }
      
      public function set selectableRange(param1:Object) : void
      {
         _selectableRange = scrubTimeValue(param1);
         selectableRangeChanged = true;
         updateDateFiller = true;
         invalidateProperties();
      }
      
      public function set dayNames(param1:Array) : void
      {
         dayNamesOverride = param1;
         _dayNames = param1 != null ? param1 : resourceManager.getStringArray("controls","dayNamesShortest");
         _dayNames = !!_dayNames ? _dayNames.slice(0) : null;
         dayNamesChanged = true;
         invalidateProperties();
      }
      
      override public function regenerateStyleCache(param1:Boolean) : void
      {
         super.regenerateStyleCache(param1);
         if(dropdown)
         {
            dropdown.regenerateStyleCache(param1);
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createDropdown();
         mx_internal::downArrowButton.setStyle("paddingLeft",0);
         mx_internal::downArrowButton.setStyle("paddingRight",0);
         textInput.editable = false;
         textInput.addEventListener(TextEvent.TEXT_INPUT,textInput_textInputHandler);
         mx_internal::border.visible = false;
      }
      
      override public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
         super.notifyStyleChangeInChildren(param1,param2);
         if(dropdown)
         {
            dropdown.notifyStyleChangeInChildren(param1,param2);
         }
      }
      
      [Bindable("displayedMonthChanged")]
      public function get displayedMonth() : int
      {
         if(Boolean(dropdown) && dropdown.displayedMonth != _displayedMonth)
         {
            return dropdown.displayedMonth;
         }
         return _displayedMonth;
      }
      
      private function dropdown_scrollHandler(param1:DateChooserEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function createDropdown() : void
      {
         var _loc3_:CSSStyleDeclaration = null;
         if(creatingDropdown)
         {
            return;
         }
         creatingDropdown = true;
         _dropdown = dropdownFactory.newInstance();
         _dropdown.focusEnabled = false;
         _dropdown.owner = this;
         _dropdown.moduleFactory = moduleFactory;
         var _loc1_:Date = new Date();
         _dropdown.displayedMonth = _loc1_.getMonth();
         _dropdown.displayedYear = _loc1_.getFullYear();
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
         {
            _dropdown.styleName = this;
         }
         else
         {
            _dropdown.styleName = new StyleProxy(this,{});
         }
         var _loc2_:Object = getStyle("dateChooserStyleName");
         if(_loc2_)
         {
            _loc3_ = StyleManager.getStyleDeclaration("." + _loc2_);
            if(_loc3_)
            {
               _dropdown.styleDeclaration = _loc3_;
            }
         }
         _dropdown.visible = false;
         _dropdown.addEventListener(CalendarLayoutChangeEvent.CHANGE,dropdown_changeHandler);
         _dropdown.addEventListener(DateChooserEvent.SCROLL,dropdown_scrollHandler);
         _dropdown.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE,dropdown_mouseDownOutsideHandler);
         _dropdown.addEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE,dropdown_mouseDownOutsideHandler);
         _dropdown.addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,dropdown_mouseDownOutsideHandler);
         _dropdown.addEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE,dropdown_mouseDownOutsideHandler);
         creatingDropdown = false;
      }
      
      [Bindable("yearSymbolChanged")]
      public function get yearSymbol() : String
      {
         return _yearSymbol;
      }
      
      private function displayDropdown(param1:Boolean, param2:Event = null) : void
      {
         var _loc5_:DateChooser = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:ISystemManager = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:Rectangle = null;
         var _loc11_:InterManagerRequest = null;
         if(!_enabled)
         {
            return;
         }
         if(param1 == mx_internal::showingDropdown)
         {
            return;
         }
         if(!addedToPopupManager)
         {
            addedToPopupManager = true;
            PopUpManager.addPopUp(_dropdown,this,false);
         }
         else
         {
            PopUpManager.bringToFront(_dropdown);
         }
         var _loc3_:Point = new Point(unscaledWidth - mx_internal::downArrowButton.width,0);
         _loc3_ = localToGlobal(_loc3_);
         if(param1)
         {
            if(_parseFunction != null)
            {
               _selectedDate = _parseFunction(text,formatString);
            }
            lastSelectedDate = _selectedDate;
            selectedDate_changeHandler(param2);
            _loc5_ = dropdown;
            if(_dropdown.selectedDate)
            {
               _dropdown.displayedMonth = _dropdown.selectedDate.getMonth();
               _dropdown.displayedYear = _dropdown.selectedDate.getFullYear();
            }
            _loc5_.visible = param1;
            _loc5_.scaleX = scaleX;
            _loc5_.scaleY = scaleY;
            _loc6_ = _loc3_.x;
            _loc7_ = _loc3_.y;
            _loc9_ = (_loc8_ = systemManager.topLevelSystemManager).getSandboxRoot();
            if(_loc8_ != _loc9_)
            {
               _loc11_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"getVisibleApplicationRect");
               _loc9_.dispatchEvent(_loc11_);
               _loc10_ = Rectangle(_loc11_.value);
            }
            else
            {
               _loc10_ = _loc8_.getVisibleApplicationRect();
            }
            if(_loc10_.right > _loc5_.getExplicitOrMeasuredWidth() + _loc3_.x && _loc10_.bottom < _loc5_.getExplicitOrMeasuredHeight() + _loc3_.y)
            {
               _loc6_ = _loc3_.x;
               _loc7_ = _loc3_.y - _loc5_.getExplicitOrMeasuredHeight();
               openPos = 1;
            }
            else if(_loc10_.right < _loc5_.getExplicitOrMeasuredWidth() + _loc3_.x && _loc10_.bottom < _loc5_.getExplicitOrMeasuredHeight() + _loc3_.y)
            {
               _loc6_ = _loc3_.x - _loc5_.getExplicitOrMeasuredWidth() + mx_internal::downArrowButton.width;
               _loc7_ = _loc3_.y - _loc5_.getExplicitOrMeasuredHeight();
               openPos = 2;
            }
            else if(_loc10_.right < _loc5_.getExplicitOrMeasuredWidth() + _loc3_.x && _loc10_.bottom > _loc5_.getExplicitOrMeasuredHeight() + _loc3_.y)
            {
               _loc6_ = _loc3_.x - _loc5_.getExplicitOrMeasuredWidth() + mx_internal::downArrowButton.width;
               _loc7_ = _loc3_.y + unscaledHeight;
               openPos = 3;
            }
            else
            {
               openPos = 0;
            }
            _loc3_.x = _loc6_;
            _loc3_.y = _loc7_;
            _loc3_ = _loc5_.parent.globalToLocal(_loc3_);
            UIComponentGlobals.mx_internal::layoutManager.validateClient(_loc5_,true);
            _loc5_.move(_loc3_.x,_loc3_.y);
            Object(_loc5_).setActualSize(_loc5_.getExplicitOrMeasuredWidth(),_loc5_.getExplicitOrMeasuredHeight());
         }
         else
         {
            _dropdown.visible = false;
         }
         mx_internal::showingDropdown = param1;
         var _loc4_:DropdownEvent;
         (_loc4_ = new DropdownEvent(param1 ? DropdownEvent.OPEN : DropdownEvent.CLOSE)).triggerEvent = param2;
         dispatchEvent(_loc4_);
      }
      
      private function scrubTimeValue(param1:Object) : Object
      {
         var _loc2_:Object = null;
         if(param1 is Date)
         {
            return new Date(param1.getFullYear(),param1.getMonth(),param1.getDate());
         }
         if(param1 is Object)
         {
            _loc2_ = {};
            if(param1.rangeStart)
            {
               _loc2_.rangeStart = new Date(param1.rangeStart.getFullYear(),param1.rangeStart.getMonth(),param1.rangeStart.getDate());
            }
            if(param1.rangeEnd)
            {
               _loc2_.rangeEnd = new Date(param1.rangeEnd.getFullYear(),param1.rangeEnd.getMonth(),param1.rangeEnd.getDate());
            }
            return _loc2_;
         }
         return null;
      }
      
      [Bindable("monthSymbolChanged")]
      public function get monthSymbol() : String
      {
         return _monthSymbol;
      }
      
      [Bindable("enabledChanged")]
      override public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      [Bindable("showTodayChanged")]
      public function get showToday() : Boolean
      {
         return _showToday;
      }
      
      public function open() : void
      {
         displayDropdown(true);
      }
      
      public function set displayedMonth(param1:int) : void
      {
         _displayedMonth = param1;
         displayedMonthChanged = true;
         invalidateProperties();
      }
      
      public function set parseFunction(param1:Function) : void
      {
         _parseFunction = param1;
         dispatchEvent(new Event("parseFunctionChanged"));
      }
      
      public function get firstDayOfWeek() : Object
      {
         return _firstDayOfWeek;
      }
      
      public function set minYear(param1:int) : void
      {
         if(_displayedYear == param1)
         {
            return;
         }
         _minYear = param1;
         minYearChanged = true;
         invalidateProperties();
      }
      
      public function set monthNames(param1:Array) : void
      {
         monthNamesOverride = param1;
         _monthNames = param1 != null ? param1 : resourceManager.getStringArray("SharedResources","monthNames");
         _monthNames = !!_monthNames ? _monthNames.slice(0) : null;
         monthNamesChanged = true;
         invalidateProperties();
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:Date = null;
         _data = param1;
         if(Boolean(_listData) && _listData is DataGridListData)
         {
            _loc2_ = _data[DataGridListData(_listData).dataField];
         }
         else if(_listData is ListData && ListData(_listData).labelField in _data)
         {
            _loc2_ = _data[ListData(_listData).labelField];
         }
         else if(_data is String)
         {
            _loc2_ = new Date(Date.parse(data as String));
         }
         else
         {
            _loc2_ = _data as Date;
         }
         if(!selectedDateSet)
         {
            selectedDate = _loc2_;
            selectedDateSet = false;
         }
         dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = Number(mx_internal::downArrowButton.getExplicitOrMeasuredWidth());
         var _loc2_:Number = Number(mx_internal::downArrowButton.getExplicitOrMeasuredHeight());
         var _loc3_:Date = new Date(2004,12,31);
         var _loc4_:String = _labelFunction != null ? _labelFunction(_loc3_) : dateToString(_loc3_,formatString);
         measuredMinWidth = measuredWidth = measureText(_loc4_).width + 8 + 2 + _loc1_;
         if(FlexVersion.compatibilityVersion >= FlexVersion.VERSION_3_0)
         {
            measuredMinWidth = measuredWidth = measuredWidth + (getStyle("paddingLeft") + getStyle("paddingRight"));
         }
         measuredMinHeight = measuredHeight = textInput.getExplicitOrMeasuredHeight();
      }
      
      [Bindable("dataChange")]
      public function get listData() : BaseListData
      {
         return _listData;
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.ctrlKey && param1.keyCode == Keyboard.DOWN)
         {
            displayDropdown(true,param1);
            param1.stopPropagation();
         }
         else if(param1.ctrlKey && param1.keyCode == Keyboard.UP)
         {
            if(mx_internal::showingDropdown)
            {
               selectedDate = lastSelectedDate;
            }
            displayDropdown(false,param1);
            param1.stopPropagation();
         }
         else if(param1.keyCode == Keyboard.ESCAPE)
         {
            if(mx_internal::showingDropdown)
            {
               selectedDate = lastSelectedDate;
            }
            displayDropdown(false,param1);
            param1.stopPropagation();
         }
         else if(param1.keyCode == Keyboard.ENTER)
         {
            if(mx_internal::showingDropdown)
            {
               _selectedDate = _dropdown.selectedDate;
               displayDropdown(false,param1);
               param1.stopPropagation();
            }
            else if(editable)
            {
               if(_parseFunction != null)
               {
                  _selectedDate = _parseFunction(text,formatString);
               }
            }
            selectedDate_changeHandler(param1);
         }
         else if(param1.keyCode == Keyboard.UP || param1.keyCode == Keyboard.DOWN || param1.keyCode == Keyboard.LEFT || param1.keyCode == Keyboard.RIGHT || param1.keyCode == Keyboard.PAGE_UP || param1.keyCode == Keyboard.PAGE_DOWN || param1.keyCode == 189 || param1.keyCode == 187 || param1.keyCode == Keyboard.HOME || param1.keyCode == Keyboard.END)
         {
            if(mx_internal::showingDropdown)
            {
               if(yearNavigationEnabled && (param1.keyCode == 189 || param1.keyCode == 187))
               {
                  yearChangedWithKeys = true;
               }
               inKeyDown = true;
               dropdown.dispatchEvent(param1);
               inKeyDown = false;
               param1.stopPropagation();
            }
         }
      }
      
      public function set yearSymbol(param1:String) : void
      {
         yearSymbolOverride = param1;
         _yearSymbol = param1 != null ? param1 : String(resourceManager.getString("controls","yearSymbol"));
         yearSymbolChanged = true;
         invalidateProperties();
      }
      
      mx_internal function isShowingDropdown() : Boolean
      {
         return mx_internal::showingDropdown;
      }
      
      private function textInput_textInputHandler(param1:TextEvent) : void
      {
         if(yearChangedWithKeys)
         {
            param1.preventDefault();
            yearChangedWithKeys = false;
         }
      }
      
      public function set dropdownFactory(param1:IFactory) : void
      {
         _dropdownFactory = param1;
         dispatchEvent(new Event("dropdownFactoryChanged"));
      }
      
      public function set displayedYear(param1:int) : void
      {
         _displayedYear = param1;
         displayedYearChanged = true;
         invalidateProperties();
      }
      
      public function set monthSymbol(param1:String) : void
      {
         monthSymbolOverride = param1;
         _monthSymbol = param1 != null ? param1 : String(resourceManager.getString("SharedResources","monthSymbol"));
         monthSymbolChanged = true;
         invalidateProperties();
      }
      
      [Bindable("disabledRangesChanged")]
      public function get disabledRanges() : Array
      {
         return _disabledRanges;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(param1 == _enabled)
         {
            return;
         }
         _enabled = param1;
         super.enabled = param1;
         enabledChanged = true;
         invalidateProperties();
      }
      
      [Bindable("selectableRangeChanged")]
      public function get selectableRange() : Object
      {
         return _selectableRange;
      }
      
      public function set showToday(param1:Boolean) : void
      {
         _showToday = param1;
         showTodayChanged = true;
         invalidateProperties();
      }
      
      private function dropdown_mouseDownOutsideHandler(param1:Event) : void
      {
         var _loc2_:MouseEvent = null;
         if(param1 is MouseEvent)
         {
            _loc2_ = MouseEvent(param1);
            if(!hitTestPoint(_loc2_.stageX,_loc2_.stageY,true))
            {
               displayDropdown(false,param1);
            }
         }
         else if(param1 is SandboxMouseEvent)
         {
            displayDropdown(false,param1);
         }
      }
      
      override protected function initializeAccessibility() : void
      {
         if(DateField.mx_internal::createAccessibilityImplementation != null)
         {
            DateField.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return _data;
      }
      
      [Bindable("parseFunctionChanged")]
      public function get parseFunction() : Function
      {
         return _parseFunction;
      }
      
      public function set firstDayOfWeek(param1:Object) : void
      {
         firstDayOfWeekOverride = param1;
         _firstDayOfWeek = param1 != null ? int(param1) : resourceManager.getInt("controls","firstDayOfWeek");
         firstDayOfWeekChanged = true;
         invalidateProperties();
      }
      
      override protected function downArrowButton_buttonDownHandler(param1:FlexEvent) : void
      {
         callLater(displayDropdown,[!mx_internal::showingDropdown,param1]);
         mx_internal::downArrowButton.mx_internal::phase = "up";
      }
      
      public function get minYear() : int
      {
         if(dropdown)
         {
            return dropdown.minYear;
         }
         return _minYear;
      }
      
      [Bindable("monthNamesChanged")]
      public function get monthNames() : Array
      {
         return _monthNames;
      }
      
      public function set maxYear(param1:int) : void
      {
         if(_maxYear == param1)
         {
            return;
         }
         _maxYear = param1;
         maxYearChanged = true;
         invalidateProperties();
      }
      
      private function removedFromStageHandler(param1:Event) : void
      {
         addedToPopupManager = false;
         PopUpManager.removePopUp(_dropdown);
      }
      
      [Bindable("displayedYearChanged")]
      public function get displayedYear() : int
      {
         if(Boolean(dropdown) && dropdown.displayedYear != _displayedYear)
         {
            return dropdown.displayedYear;
         }
         return _displayedYear;
      }
      
      [Bindable("dropdownFactoryChanged")]
      public function get dropdownFactory() : IFactory
      {
         return _dropdownFactory;
      }
      
      public function get maxYear() : int
      {
         if(dropdown)
         {
            return dropdown.maxYear;
         }
         return _maxYear;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:CSSStyleDeclaration = null;
         super.styleChanged(param1);
         if(dropdown)
         {
            dropdown.styleChanged(param1);
         }
         if(param1 == null || param1 == "styleName" || param1 == "dateChooserStyleName")
         {
            if(dropdown)
            {
               _loc2_ = getStyle("dateChooserStyleName");
               if(_loc2_)
               {
                  _loc3_ = StyleManager.getStyleDeclaration("." + _loc2_);
                  if(_loc3_)
                  {
                     _dropdown.styleDeclaration = _loc3_;
                     _dropdown.regenerateStyleCache(true);
                  }
               }
            }
         }
      }
      
      private function dropdown_changeHandler(param1:CalendarLayoutChangeEvent) : void
      {
         if(!inKeyDown)
         {
            displayDropdown(false);
         }
         if(ObjectUtil.dateCompare(_selectedDate,dropdown.selectedDate) == 0)
         {
            return;
         }
         _selectedDate = dropdown.selectedDate;
         if(_selectedDate)
         {
            dateFiller(_selectedDate);
         }
         else
         {
            textInput.text = "";
         }
         var _loc2_:CalendarLayoutChangeEvent = new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE);
         _loc2_.newDate = param1.newDate;
         _loc2_.triggerEvent = param1.triggerEvent;
         dispatchEvent(_loc2_);
      }
      
      public function set yearNavigationEnabled(param1:Boolean) : void
      {
         _yearNavigationEnabled = param1;
         yearNavigationEnabledChanged = true;
         invalidateProperties();
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         dayNames = dayNamesOverride;
         firstDayOfWeek = firstDayOfWeekOverride;
         formatString = formatStringOverride;
         monthNames = monthNamesOverride;
         monthSymbol = monthSymbolOverride;
         yearSymbol = yearSymbolOverride;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         _listData = param1;
      }
      
      public function set labelFunction(param1:Function) : void
      {
         _labelFunction = param1;
         updateDateFiller = true;
         invalidateProperties();
         dispatchEvent(new Event("labelFunctionChanged"));
      }
      
      public function set selectedDate(param1:Date) : void
      {
         if(ObjectUtil.dateCompare(_selectedDate,param1) == 0)
         {
            return;
         }
         selectedDateSet = true;
         _selectedDate = scrubTimeValue(param1) as Date;
         updateDateFiller = true;
         selectedDateChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("selectedDateChanged"));
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      override protected function textInput_changeHandler(param1:Event) : void
      {
         super.textInput_changeHandler(param1);
         var _loc2_:Date = _parseFunction(text,formatString);
         if(_loc2_)
         {
            _selectedDate = _loc2_;
         }
      }
      
      private function selectedDate_changeHandler(param1:Event) : void
      {
         if(!dropdown.selectedDate && !_selectedDate)
         {
            return;
         }
         if(_selectedDate)
         {
            dateFiller(_selectedDate);
         }
         if(dropdown.selectedDate && _selectedDate && dropdown.selectedDate.getFullYear() == _selectedDate.getFullYear() && dropdown.selectedDate.getMonth() == _selectedDate.getMonth() && dropdown.selectedDate.getDate() == _selectedDate.getDate())
         {
            return;
         }
         dropdown.selectedDate = _selectedDate;
         var _loc2_:CalendarLayoutChangeEvent = new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE);
         _loc2_.newDate = _selectedDate;
         _loc2_.triggerEvent = param1;
         dispatchEvent(_loc2_);
      }
      
      private function scrubTimeValues(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_] = scrubTimeValue(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function set formatString(param1:String) : void
      {
         formatStringOverride = param1;
         _formatString = param1 != null ? param1 : String(resourceManager.getString("SharedResources","dateFormat"));
         updateDateFiller = true;
         invalidateProperties();
         invalidateSize();
         dispatchEvent(new Event("formatStringChanged"));
      }
      
      public function set disabledRanges(param1:Array) : void
      {
         _disabledRanges = scrubTimeValues(param1);
         disabledRangesChanged = true;
         updateDateFiller = true;
         invalidateProperties();
      }
      
      public function set disabledDays(param1:Array) : void
      {
         _disabledDays = param1;
         disabledDaysChanged = true;
         updateDateFiller = true;
         invalidateProperties();
      }
      
      public function get formatString() : String
      {
         return _formatString;
      }
      
      [Bindable("selectedDateChanged")]
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedDate() : Date
      {
         return _selectedDate;
      }
      
      private function dateFiller(param1:Date) : void
      {
         if(_labelFunction != null)
         {
            textInput.text = labelFunction(param1);
         }
         else
         {
            textInput.text = dateToString(param1,formatString);
         }
      }
      
      [Bindable("labelFunctionChanged")]
      public function get labelFunction() : Function
      {
         return _labelFunction;
      }
      
      override protected function commitProperties() : void
      {
         if(enabledChanged)
         {
            enabledChanged = false;
            dispatchEvent(new Event("enabledChanged"));
         }
         if(dayNamesChanged)
         {
            dayNamesChanged = false;
            dropdown.dayNames = !!_dayNames ? _dayNames.slice(0) : null;
            dispatchEvent(new Event("dayNamesChanged"));
         }
         if(disabledDaysChanged)
         {
            disabledDaysChanged = false;
            dropdown.disabledDays = _disabledDays.slice(0);
            dispatchEvent(new Event("disabledDaysChanged"));
         }
         if(disabledRangesChanged)
         {
            disabledRangesChanged = false;
            dropdown.disabledRanges = _disabledRanges.slice(0);
            dispatchEvent(new Event("disabledRangesChanged"));
         }
         if(displayedMonthChanged)
         {
            displayedMonthChanged = false;
            dropdown.displayedMonth = _displayedMonth;
            dispatchEvent(new Event("displayedMonthChanged"));
         }
         if(displayedYearChanged)
         {
            displayedYearChanged = false;
            dropdown.displayedYear = _displayedYear;
            dispatchEvent(new Event("displayedYearChanged"));
         }
         if(firstDayOfWeekChanged)
         {
            firstDayOfWeekChanged = false;
            dropdown.firstDayOfWeek = _firstDayOfWeek;
            dispatchEvent(new Event("firstDayOfWeekChanged"));
         }
         if(minYearChanged)
         {
            minYearChanged = false;
            dropdown.minYear = _minYear;
         }
         if(maxYearChanged)
         {
            maxYearChanged = false;
            dropdown.maxYear = _maxYear;
         }
         if(monthNamesChanged)
         {
            monthNamesChanged = false;
            dropdown.monthNames = !!_monthNames ? _monthNames.slice(0) : null;
            dispatchEvent(new Event("monthNamesChanged"));
         }
         if(selectableRangeChanged)
         {
            selectableRangeChanged = false;
            dropdown.selectableRange = _selectableRange is Array ? _selectableRange.slice(0) : _selectableRange;
            dispatchEvent(new Event("selectableRangeChanged"));
         }
         if(selectedDateChanged)
         {
            selectedDateChanged = false;
            dropdown.selectedDate = _selectedDate;
         }
         if(showTodayChanged)
         {
            showTodayChanged = false;
            dropdown.showToday = _showToday;
            dispatchEvent(new Event("showTodayChanged"));
         }
         if(updateDateFiller)
         {
            updateDateFiller = false;
            dateFiller(_selectedDate);
         }
         if(yearNavigationEnabledChanged)
         {
            yearNavigationEnabledChanged = false;
            dropdown.yearNavigationEnabled = _yearNavigationEnabled;
            dispatchEvent(new Event("yearNavigationEnabledChanged"));
         }
         if(yearSymbolChanged)
         {
            yearSymbolChanged = false;
            dropdown.yearSymbol = _yearSymbol;
            dispatchEvent(new Event("yearSymbolChanged"));
         }
         if(monthSymbolChanged)
         {
            monthSymbolChanged = false;
            dropdown.monthSymbol = _monthSymbol;
            dispatchEvent(new Event("monthSymbolChanged"));
         }
         super.commitProperties();
      }
      
      [Bindable("disabledDaysChanged")]
      public function get disabledDays() : Array
      {
         return _disabledDays;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         var _loc5_:Number = Number(mx_internal::downArrowButton.getExplicitOrMeasuredWidth());
         var _loc6_:Number = Number(mx_internal::downArrowButton.getExplicitOrMeasuredHeight());
         mx_internal::downArrowButton.setActualSize(_loc5_,_loc6_);
         mx_internal::downArrowButton.move(_loc3_ - _loc5_,Math.round((_loc4_ - _loc6_) / 2));
         textInput.setActualSize(_loc3_ - _loc5_ - 2,_loc4_);
      }
      
      public function close() : void
      {
         displayDropdown(false);
      }
   }
}
