package mx.controls
{
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventPhase;
   import flash.events.KeyboardEvent;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import mx.core.FlexSprite;
   import mx.core.FlexVersion;
   import mx.core.IFlexModuleFactory;
   import mx.core.IFontContextComponent;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.CalendarLayoutChangeEvent;
   import mx.events.DateChooserEvent;
   import mx.events.FlexEvent;
   import mx.graphics.RectangularDropShadow;
   import mx.managers.IFocusManagerComponent;
   import mx.styles.StyleManager;
   import mx.styles.StyleProxy;
   import mx.utils.GraphicsUtil;
   
   use namespace mx_internal;
   
   public class DateChooser extends UIComponent implements IFocusManagerComponent, IFontContextComponent
   {
      
      private static var _prevYearStyleFilters:Object = {
         "highlightAlphas":"highlightAlphas",
         "prevYearUpSkin":"prevYearUpSkin",
         "prevYearOverSkin":"prevYearOverSkin",
         "prevYearDownSkin":"prevYearDownSkin",
         "prevYearDisabledSkin":"prevYearDisabledSkin",
         "prevYearSkin":"prevYearSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      private static var _nextMonthStyleFilters:Object = {
         "highlightAlphas":"highlightAlphas",
         "nextMonthUpSkin":"nextMonthUpSkin",
         "nextMonthOverSkin":"nextMonthOverSkin",
         "nextMonthDownSkin":"nextMonthDownSkin",
         "nextMonthDisabledSkin":"nextMonthDisabledSkin",
         "nextMonthSkin":"nextMonthSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var _nextYearStyleFilters:Object = {
         "highlightAlphas":"highlightAlphas",
         "nextYearUpSkin":"nextYearUpSkin",
         "nextYearOverSkin":"nextYearOverSkin",
         "nextYearDownSkin":"nextYearDownSkin",
         "nextYearDisabledSkin":"nextYearDisabledSkin",
         "nextYearSkin":"nextYearSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
      
      private static var _prevMonthStyleFilters:Object = {
         "highlightAlphas":"highlightAlphas",
         "prevMonthUpSkin":"prevMonthUpSkin",
         "prevMonthOverSkin":"prevMonthOverSkin",
         "prevMonthDownSkin":"prevMonthDownSkin",
         "prevMonthDisabledSkin":"prevMonthDisabledSkin",
         "prevMonthSkin":"prevMonthSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
       
      
      private var _enabled:Boolean = true;
      
      private var dayNamesChanged:Boolean = false;
      
      mx_internal var calHeader:UIComponent;
      
      mx_internal var downYearButton:Button;
      
      mx_internal var dateGrid:CalendarLayout;
      
      private var displayedYearChanged:Boolean = false;
      
      private var headerHeight:Number = 30;
      
      private var SKIN_WIDTH_PAD:Number = 6;
      
      private var allowMultipleSelectionChanged:Boolean = false;
      
      mx_internal var monthDisplay:IUITextField;
      
      private var selectedRangesChanged:Boolean = false;
      
      private var monthSymbolOverride:String;
      
      mx_internal var fwdMonthButton:Button;
      
      mx_internal var border:UIComponent;
      
      private var selectableRangeChanged:Boolean = false;
      
      private var _allowMultipleSelection:Boolean = false;
      
      private var enabledChanged:Boolean = false;
      
      private var disabledDaysChanged:Boolean = false;
      
      private var _displayedMonth:int;
      
      private var _monthNames:Array;
      
      private var _selectableRange:Object;
      
      private var firstDayOfWeekChanged:Boolean = false;
      
      mx_internal var backMonthButton:Button;
      
      private var _minYear:int = 1900;
      
      private var _dayNames:Array;
      
      private var _firstDayOfWeek:Object;
      
      private var _monthSymbol:String;
      
      private var yearSkinWidth:Number = 10;
      
      private var _disabledRanges:Array;
      
      private var monthNamesOverride:Array;
      
      private var _maxYear:int = 2100;
      
      private var _displayedYear:int;
      
      private var yearNavigationEnabledChanged:Boolean = false;
      
      private var _showToday:Boolean = true;
      
      private var yearSymbolChanged:Boolean = false;
      
      private var _selectedDate:Date;
      
      mx_internal var upYearButton:Button;
      
      private var allowDisjointSelectionChanged:Boolean = false;
      
      private var _yearNavigationEnabled:Boolean = false;
      
      private var _disabledDays:Array;
      
      mx_internal var dropShadow:RectangularDropShadow;
      
      private var monthNamesChanged:Boolean = false;
      
      private var dayNamesOverride:Array;
      
      mx_internal var upYearHit:Sprite;
      
      mx_internal var backMonthHit:Sprite;
      
      private var _allowDisjointSelection:Boolean = true;
      
      mx_internal var downYearHit:Sprite;
      
      private var yearSkinHeight:Number = 8;
      
      private var HEADER_WIDTH_PAD:Number = 5;
      
      mx_internal var background:UIComponent;
      
      private var yearSymbolOverride:String;
      
      private var firstDayOfWeekOverride:Object;
      
      private var monthSymbolChanged:Boolean = false;
      
      private var SKIN_HEIGHT_PAD:Number = 4;
      
      private var _selectedRanges:Array;
      
      mx_internal var headerDisplay:UIComponent;
      
      private var selectedDateChanged:Boolean = false;
      
      private var YEAR_BUTTONS_PAD:Number = 6;
      
      private var displayedMonthChanged:Boolean = false;
      
      private var monthSkinHeight:Number = 11;
      
      private var monthSkinWidth:Number = 6;
      
      mx_internal var yearDisplay:IUITextField;
      
      mx_internal var fwdMonthHit:Sprite;
      
      private var showTodayChanged:Boolean = false;
      
      private var _yearSymbol:String;
      
      private var disabledRangesChanged:Boolean = false;
      
      private var previousSelectedCellIndex:Number = NaN;
      
      public function DateChooser()
      {
         _disabledDays = [];
         _disabledRanges = [];
         _displayedMonth = new Date().getMonth();
         _displayedYear = new Date().getFullYear();
         _selectedRanges = [];
         super();
         tabEnabled = true;
         tabChildren = false;
      }
      
      public function set dayNames(param1:Array) : void
      {
         dayNamesOverride = param1;
         _dayNames = param1 != null ? param1 : resourceManager.getStringArray("controls","dayNamesShortest");
         _dayNames = !!_dayNames ? _dayNames.slice(0) : null;
         dayNamesChanged = true;
         invalidateProperties();
      }
      
      [Bindable("viewChanged")]
      [Bindable("scroll")]
      public function get displayedMonth() : int
      {
         if(Boolean(mx_internal::dateGrid) && _displayedMonth != mx_internal::dateGrid.displayedMonth)
         {
            return mx_internal::dateGrid.displayedMonth;
         }
         return _displayedMonth;
      }
      
      public function set allowMultipleSelection(param1:Boolean) : void
      {
         _allowMultipleSelection = param1;
         allowMultipleSelectionChanged = true;
         invalidateProperties();
      }
      
      [Bindable("monthSymbolChanged")]
      public function get monthSymbol() : String
      {
         return _monthSymbol;
      }
      
      [Bindable("yearSymbolChanged")]
      public function get yearSymbol() : String
      {
         return _yearSymbol;
      }
      
      [Bindable("showTodayChanged")]
      public function get showToday() : Boolean
      {
         return _showToday;
      }
      
      public function set displayedMonth(param1:int) : void
      {
         if(isNaN(param1) || displayedMonth == param1)
         {
            return;
         }
         _displayedMonth = param1;
         displayedMonthChanged = true;
         invalidateProperties();
         if(mx_internal::dateGrid)
         {
            mx_internal::dateGrid.displayedMonth = param1;
         }
      }
      
      protected function get prevYearStyleFilters() : Object
      {
         return _prevYearStyleFilters;
      }
      
      [Bindable("firstDayOfWeekChanged")]
      public function get firstDayOfWeek() : Object
      {
         return _firstDayOfWeek;
      }
      
      public function get fontContext() : IFlexModuleFactory
      {
         return moduleFactory;
      }
      
      private function getYearNavigationButtons() : void
      {
         if(!mx_internal::upYearButton)
         {
            mx_internal::upYearButton = new Button();
            mx_internal::upYearButton.styleName = new StyleProxy(this,nextYearStyleFilters);
            mx_internal::upYearButton.autoRepeat = true;
            mx_internal::upYearButton.focusEnabled = false;
            mx_internal::upYearButton.mx_internal::upSkinName = "nextYearUpSkin";
            mx_internal::upYearButton.mx_internal::overSkinName = "nextYearOverSkin";
            mx_internal::upYearButton.mx_internal::downSkinName = "nextYearDownSkin";
            mx_internal::upYearButton.mx_internal::disabledSkinName = "nextYearDisabledSkin";
            mx_internal::upYearButton.mx_internal::skinName = "nextYearSkin";
            mx_internal::upYearButton.mx_internal::upIconName = "";
            mx_internal::upYearButton.mx_internal::overIconName = "";
            mx_internal::upYearButton.mx_internal::downIconName = "";
            mx_internal::upYearButton.mx_internal::disabledIconName = "";
            mx_internal::upYearButton.addEventListener(FlexEvent.BUTTON_DOWN,upYearButton_buttonDownHandler);
            addChild(mx_internal::upYearButton);
         }
         if(!mx_internal::downYearButton)
         {
            mx_internal::downYearButton = new Button();
            mx_internal::downYearButton.styleName = new StyleProxy(this,prevYearStyleFilters);
            mx_internal::downYearButton.focusEnabled = false;
            mx_internal::downYearButton.autoRepeat = true;
            mx_internal::downYearButton.mx_internal::upSkinName = "prevYearUpSkin";
            mx_internal::downYearButton.mx_internal::overSkinName = "prevYearOverSkin";
            mx_internal::downYearButton.mx_internal::downSkinName = "prevYearDownSkin";
            mx_internal::downYearButton.mx_internal::disabledSkinName = "prevYearDisabledSkin";
            mx_internal::downYearButton.mx_internal::skinName = "prevYearSkin";
            mx_internal::downYearButton.mx_internal::upIconName = "";
            mx_internal::downYearButton.mx_internal::overIconName = "";
            mx_internal::downYearButton.mx_internal::downIconName = "";
            mx_internal::downYearButton.mx_internal::disabledIconName = "";
            mx_internal::downYearButton.addEventListener(FlexEvent.BUTTON_DOWN,downYearButton_buttonDownHandler);
            addChild(mx_internal::downYearButton);
         }
         if(!mx_internal::upYearHit)
         {
            mx_internal::upYearHit = new FlexSprite();
            mx_internal::upYearHit.name = "upYearHit";
            addChild(mx_internal::upYearHit);
            mx_internal::upYearHit.visible = false;
            mx_internal::upYearButton.hitArea = mx_internal::upYearHit;
         }
         if(!mx_internal::downYearHit)
         {
            mx_internal::downYearHit = new FlexSprite();
            mx_internal::downYearHit.name = "downYearHit";
            addChild(mx_internal::downYearHit);
            mx_internal::downYearHit.visible = false;
            mx_internal::downYearButton.hitArea = mx_internal::downYearHit;
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.eventPhase != EventPhase.AT_TARGET)
         {
            return;
         }
         if(param1.keyCode == Keyboard.PAGE_UP)
         {
            backMonthButton_buttonDownHandler(param1);
         }
         else if(param1.keyCode == Keyboard.PAGE_DOWN)
         {
            fwdMonthButton_buttonDownHandler(param1);
         }
         else if(param1.keyCode == 189)
         {
            if(_yearNavigationEnabled)
            {
               downYearButton_buttonDownHandler(param1);
            }
         }
         else if(param1.keyCode == 187)
         {
            if(_yearNavigationEnabled)
            {
               upYearButton_buttonDownHandler(param1);
            }
         }
         mx_internal::dateGrid.dispatchEvent(param1);
         param1.stopPropagation();
      }
      
      public function set yearSymbol(param1:String) : void
      {
         yearSymbolOverride = param1;
         _yearSymbol = param1 != null ? param1 : String(resourceManager.getString("controls","yearSymbol"));
         yearSymbolChanged = true;
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
      
      private function dateGrid_changeHandler(param1:CalendarLayoutChangeEvent) : void
      {
         _selectedDate = CalendarLayout(param1.target).selectedDate;
         var _loc2_:CalendarLayoutChangeEvent = new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE);
         _loc2_.newDate = param1.newDate;
         _loc2_.triggerEvent = param1.triggerEvent;
         dispatchEvent(_loc2_);
      }
      
      override public function get baselinePosition() : Number
      {
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
         {
            return super.baselinePosition;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         return mx_internal::monthDisplay.y + mx_internal::monthDisplay.baselinePosition;
      }
      
      mx_internal function removeYearDisplay() : void
      {
         if(mx_internal::yearDisplay)
         {
            removeChild(DisplayObject(mx_internal::yearDisplay));
            mx_internal::yearDisplay = null;
         }
      }
      
      public function set selectedRanges(param1:Array) : void
      {
         _selectedRanges = mx_internal::scrubTimeValues(param1);
         selectedRangesChanged = true;
         invalidateProperties();
      }
      
      [Bindable("monthNamesChanged")]
      public function get monthNames() : Array
      {
         return _monthNames;
      }
      
      mx_internal function updateDateDisplay() : void
      {
         var _loc1_:String = !!monthNames ? String(monthNames[mx_internal::dateGrid.displayedMonth]) : "";
         mx_internal::monthDisplay.text = _loc1_ + monthSymbol;
         mx_internal::yearDisplay.text = displayedYear.toString() + yearSymbol;
      }
      
      public function set firstDayOfWeek(param1:Object) : void
      {
         firstDayOfWeekOverride = param1;
         _firstDayOfWeek = param1 != null ? int(param1) : resourceManager.getInt("controls","firstDayOfWeek");
         firstDayOfWeekChanged = true;
         invalidateProperties();
      }
      
      [Bindable("viewChanged")]
      [Bindable("scroll")]
      public function get displayedYear() : int
      {
         if(mx_internal::dateGrid)
         {
            return mx_internal::dateGrid.displayedYear;
         }
         return _displayedYear;
      }
      
      public function set fontContext(param1:IFlexModuleFactory) : void
      {
         this.moduleFactory = param1;
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         dayNames = dayNamesOverride;
         firstDayOfWeek = firstDayOfWeekOverride;
         monthNames = monthNamesOverride;
         monthSymbol = monthSymbolOverride;
         yearSymbol = yearSymbolOverride;
      }
      
      mx_internal function removeMonthDisplay() : void
      {
         if(mx_internal::monthDisplay)
         {
            removeChild(DisplayObject(mx_internal::monthDisplay));
            mx_internal::monthDisplay = null;
         }
      }
      
      private function dateGrid_scrollHandler(param1:DateChooserEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function backMonthButton_buttonDownHandler(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Date = null;
         if(minYear > displayedYear - 1 && displayedMonth == 0)
         {
            return;
         }
         if(Boolean(selectableRange) && (mx_internal::dateGrid.mx_internal::selRangeMode == 1 || mx_internal::dateGrid.mx_internal::selRangeMode == 2))
         {
            _loc2_ = CalendarLayout.mx_internal::getNewIncrementDate(displayedYear,displayedMonth,0,-1);
            _loc3_ = new Date(_loc2_.year,_loc2_.month,selectableRange.rangeStart.getDate());
            if(selectableRange.rangeStart <= _loc3_)
            {
               mx_internal::dateGrid.mx_internal::stepDate(0,-1,param1);
               invalidateDisplayList();
            }
         }
         else if(mx_internal::dateGrid.mx_internal::selRangeMode != 4 || !selectableRange)
         {
            mx_internal::dateGrid.mx_internal::stepDate(0,-1,param1);
            invalidateDisplayList();
         }
      }
      
      public function set disabledRanges(param1:Array) : void
      {
         _disabledRanges = mx_internal::scrubTimeValues(param1);
         disabledRangesChanged = true;
         invalidateProperties();
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedDate() : Date
      {
         return _selectedDate;
      }
      
      protected function get nextMonthStyleFilters() : Object
      {
         return _nextMonthStyleFilters;
      }
      
      protected function get nextYearStyleFilters() : Object
      {
         return _nextYearStyleFilters;
      }
      
      [Bindable("disabledDaysChanged")]
      public function get disabledDays() : Array
      {
         return _disabledDays;
      }
      
      private function downYearButton_buttonDownHandler(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Date = null;
         if(minYear > displayedYear - 1)
         {
            return;
         }
         if(Boolean(selectableRange) && (mx_internal::dateGrid.mx_internal::selRangeMode == 1 || mx_internal::dateGrid.mx_internal::selRangeMode == 2))
         {
            _loc2_ = CalendarLayout.mx_internal::getNewIncrementDate(displayedYear,displayedMonth,-1,0);
            _loc3_ = new Date(_loc2_.year,_loc2_.month,selectableRange.rangeStart.getDate());
            if(selectableRange.rangeStart <= _loc3_)
            {
               mx_internal::dateGrid.mx_internal::stepDate(-1,0,param1);
               invalidateDisplayList();
            }
         }
         else if(mx_internal::dateGrid.mx_internal::selRangeMode != 4 || !selectableRange)
         {
            mx_internal::dateGrid.mx_internal::stepDate(-1,0,param1);
            invalidateDisplayList();
         }
      }
      
      [Bindable("dayNamesChanged")]
      public function get dayNames() : Array
      {
         return _dayNames;
      }
      
      public function set selectableRange(param1:Object) : void
      {
         _selectableRange = mx_internal::scrubTimeValue(param1);
         selectableRangeChanged = true;
         invalidateProperties();
      }
      
      [Bindable("allowMultipleSelectionChanged")]
      public function get allowMultipleSelection() : Boolean
      {
         return _allowMultipleSelection;
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(!mx_internal::background)
         {
            mx_internal::background = new UIComponent();
            addChild(mx_internal::background);
            UIComponent(mx_internal::background).styleName = this;
         }
         if(!mx_internal::border)
         {
            mx_internal::border = new UIComponent();
            addChild(mx_internal::border);
            UIComponent(mx_internal::border).styleName = this;
         }
         if(!mx_internal::dateGrid)
         {
            mx_internal::dateGrid = new CalendarLayout();
            mx_internal::dateGrid.styleName = new StyleProxy(this,calendarLayoutStyleFilters);
            addChild(mx_internal::dateGrid);
            mx_internal::dateGrid.addEventListener(CalendarLayoutChangeEvent.CHANGE,dateGrid_changeHandler);
            mx_internal::dateGrid.addEventListener(DateChooserEvent.SCROLL,dateGrid_scrollHandler);
         }
         if(!mx_internal::calHeader)
         {
            mx_internal::calHeader = new UIComponent();
            addChild(mx_internal::calHeader);
            UIComponent(mx_internal::calHeader).styleName = this;
         }
         mx_internal::createMonthDisplay(-1);
         mx_internal::createYearDisplay(-1);
         if(_yearNavigationEnabled)
         {
            getYearNavigationButtons();
         }
         if(!mx_internal::fwdMonthButton)
         {
            mx_internal::fwdMonthButton = new Button();
            mx_internal::fwdMonthButton.styleName = new StyleProxy(this,nextMonthStyleFilters);
            mx_internal::fwdMonthButton.autoRepeat = true;
            mx_internal::fwdMonthButton.focusEnabled = false;
            mx_internal::fwdMonthButton.mx_internal::upSkinName = "nextMonthUpSkin";
            mx_internal::fwdMonthButton.mx_internal::overSkinName = "nextMonthOverSkin";
            mx_internal::fwdMonthButton.mx_internal::downSkinName = "nextMonthDownSkin";
            mx_internal::fwdMonthButton.mx_internal::disabledSkinName = "nextMonthDisabledSkin";
            mx_internal::fwdMonthButton.mx_internal::skinName = "nextMonthSkin";
            mx_internal::fwdMonthButton.mx_internal::upIconName = "";
            mx_internal::fwdMonthButton.mx_internal::overIconName = "";
            mx_internal::fwdMonthButton.mx_internal::downIconName = "";
            mx_internal::fwdMonthButton.mx_internal::disabledIconName = "";
            mx_internal::fwdMonthButton.addEventListener(FlexEvent.BUTTON_DOWN,fwdMonthButton_buttonDownHandler);
            addChild(mx_internal::fwdMonthButton);
         }
         if(!mx_internal::backMonthButton)
         {
            mx_internal::backMonthButton = new Button();
            mx_internal::backMonthButton.styleName = new StyleProxy(this,prevMonthStyleFilters);
            mx_internal::backMonthButton.focusEnabled = false;
            mx_internal::backMonthButton.autoRepeat = true;
            mx_internal::backMonthButton.mx_internal::upSkinName = "prevMonthUpSkin";
            mx_internal::backMonthButton.mx_internal::overSkinName = "prevMonthOverSkin";
            mx_internal::backMonthButton.mx_internal::downSkinName = "prevMonthDownSkin";
            mx_internal::backMonthButton.mx_internal::disabledSkinName = "prevMonthDisabledSkin";
            mx_internal::backMonthButton.mx_internal::skinName = "prevMonthSkin";
            mx_internal::backMonthButton.mx_internal::upIconName = "";
            mx_internal::backMonthButton.mx_internal::overIconName = "";
            mx_internal::backMonthButton.mx_internal::downIconName = "";
            mx_internal::backMonthButton.mx_internal::disabledIconName = "";
            mx_internal::backMonthButton.addEventListener(FlexEvent.BUTTON_DOWN,backMonthButton_buttonDownHandler);
            addChild(mx_internal::backMonthButton);
         }
         if(!mx_internal::fwdMonthHit)
         {
            mx_internal::fwdMonthHit = new FlexSprite();
            mx_internal::fwdMonthHit.name = "fwdMonthHit";
            addChild(mx_internal::fwdMonthHit);
            mx_internal::fwdMonthHit.visible = false;
            mx_internal::fwdMonthButton.hitArea = mx_internal::fwdMonthHit;
         }
         if(!mx_internal::backMonthHit)
         {
            mx_internal::backMonthHit = new FlexSprite();
            mx_internal::backMonthHit.name = "backMonthHit";
            addChild(mx_internal::backMonthHit);
            mx_internal::backMonthHit.visible = false;
            mx_internal::backMonthButton.hitArea = mx_internal::backMonthHit;
         }
      }
      
      mx_internal function createYearDisplay(param1:int) : void
      {
         var _loc2_:TextFormat = null;
         var _loc3_:Object = null;
         if(!mx_internal::yearDisplay)
         {
            mx_internal::yearDisplay = IUITextField(createInFontContext(UITextField));
            _loc2_ = determineTextFormatFromStyles();
            mx_internal::yearDisplay.defaultTextFormat = _loc2_;
            mx_internal::yearDisplay.visible = false;
            mx_internal::yearDisplay.selectable = false;
            if(param1 == -1)
            {
               addChild(DisplayObject(mx_internal::yearDisplay));
            }
            else
            {
               addChildAt(DisplayObject(mx_internal::yearDisplay),param1);
            }
            _loc3_ = getStyle("headerStyleName");
            if(!_loc3_)
            {
               _loc3_ = this;
            }
            mx_internal::yearDisplay.styleName = _loc3_;
         }
      }
      
      protected function get calendarLayoutStyleFilters() : Object
      {
         return null;
      }
      
      mx_internal function scrubTimeValue(param1:Object) : Object
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
      
      mx_internal function setMonthWidth() : void
      {
         var _loc2_:int = 0;
         var _loc8_:String = null;
         var _loc1_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < 12)
         {
            _loc8_ = !!monthNames ? String(monthNames[_loc4_]) : "";
            _loc1_ = measureText(_loc8_ + monthSymbol).width;
            if(_loc3_ < _loc1_)
            {
               _loc3_ = _loc1_;
               _loc2_ = _loc4_;
            }
            _loc4_++;
         }
         var _loc5_:String;
         var _loc6_:String = (_loc5_ = !!monthNames ? String(monthNames[_loc2_]) : "") + monthSymbol;
         var _loc7_:IUITextField;
         (_loc7_ = mx_internal::monthDisplay).text = _loc6_;
         mx_internal::monthDisplay.width = _loc3_ * _loc7_.getExplicitOrMeasuredWidth() / measureText(_loc6_).width;
      }
      
      mx_internal function createMonthDisplay(param1:int) : void
      {
         var _loc2_:TextFormat = null;
         var _loc3_:Object = null;
         if(!mx_internal::monthDisplay)
         {
            mx_internal::monthDisplay = IUITextField(createInFontContext(UITextField));
            _loc2_ = determineTextFormatFromStyles();
            mx_internal::monthDisplay.defaultTextFormat = _loc2_;
            mx_internal::monthDisplay.visible = false;
            mx_internal::monthDisplay.selectable = false;
            if(param1 == -1)
            {
               addChild(DisplayObject(mx_internal::monthDisplay));
            }
            else
            {
               addChildAt(DisplayObject(mx_internal::monthDisplay),param1);
            }
            _loc3_ = getStyle("headerStyleName");
            if(!_loc3_)
            {
               _loc3_ = this;
            }
            mx_internal::monthDisplay.styleName = _loc3_;
            mx_internal::setMonthWidth();
         }
      }
      
      [Bindable("enabledChanged")]
      override public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedRanges() : Array
      {
         _selectedRanges = mx_internal::dateGrid.selectedRanges;
         return _selectedRanges;
      }
      
      public function set monthNames(param1:Array) : void
      {
         monthNamesOverride = param1;
         _monthNames = param1 != null ? param1 : resourceManager.getStringArray("SharedResources","monthNames");
         _monthNames = !!_monthNames ? monthNames.slice(0) : null;
         monthNamesChanged = true;
         invalidateProperties();
         invalidateSize();
      }
      
      public function set minYear(param1:int) : void
      {
         if(_minYear == param1)
         {
            return;
         }
         _minYear = param1;
      }
      
      override protected function measure() : void
      {
         super.measure();
         mx_internal::updateDateDisplay();
         mx_internal::setMonthWidth();
         var _loc1_:Number = getStyle("borderThickness");
         monthSkinWidth = mx_internal::fwdMonthButton.getExplicitOrMeasuredWidth();
         monthSkinHeight = mx_internal::fwdMonthButton.getExplicitOrMeasuredHeight();
         if(_yearNavigationEnabled)
         {
            yearSkinWidth = mx_internal::upYearButton.getExplicitOrMeasuredWidth();
            yearSkinHeight = mx_internal::upYearButton.getExplicitOrMeasuredHeight();
         }
         else
         {
            yearSkinWidth = 0;
            yearSkinHeight = 0;
         }
         headerHeight = Math.max(monthSkinHeight,mx_internal::monthDisplay.getExplicitOrMeasuredHeight()) + SKIN_HEIGHT_PAD * 2;
         measuredWidth = Math.max(mx_internal::dateGrid.getExplicitOrMeasuredWidth() + _loc1_ * 2,mx_internal::monthDisplay.width + mx_internal::yearDisplay.getExplicitOrMeasuredWidth() + HEADER_WIDTH_PAD + yearSkinWidth + YEAR_BUTTONS_PAD + (monthSkinWidth + SKIN_WIDTH_PAD * 2) * 2);
         measuredHeight = headerHeight + mx_internal::dateGrid.getExplicitOrMeasuredHeight() + _loc1_ * 2;
         measuredMinWidth = mx_internal::dateGrid.minWidth;
         measuredMinHeight = mx_internal::dateGrid.minHeight + headerHeight;
      }
      
      public function set displayedYear(param1:int) : void
      {
         if(isNaN(param1) || displayedYear == param1)
         {
            return;
         }
         _displayedYear = param1;
         displayedYearChanged = true;
         invalidateProperties();
         if(mx_internal::dateGrid)
         {
            mx_internal::dateGrid.displayedYear = param1;
         }
      }
      
      private function upYearButton_buttonDownHandler(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Date = null;
         if(maxYear < displayedYear + 1)
         {
            return;
         }
         if(Boolean(selectableRange) && (mx_internal::dateGrid.mx_internal::selRangeMode == 1 || mx_internal::dateGrid.mx_internal::selRangeMode == 3))
         {
            _loc2_ = CalendarLayout.mx_internal::getNewIncrementDate(displayedYear,displayedMonth,1,0);
            _loc3_ = new Date(_loc2_.year,_loc2_.month,selectableRange.rangeEnd.getDate());
            if(selectableRange.rangeEnd >= _loc3_)
            {
               mx_internal::dateGrid.mx_internal::stepDate(1,0,param1);
               invalidateDisplayList();
            }
         }
         else if(mx_internal::dateGrid.mx_internal::selRangeMode != 4 || !selectableRange)
         {
            mx_internal::dateGrid.mx_internal::stepDate(1,0,param1);
            invalidateDisplayList();
         }
      }
      
      public function set maxYear(param1:int) : void
      {
         if(_maxYear == param1)
         {
            return;
         }
         _maxYear = param1;
      }
      
      private function fwdMonthButton_buttonDownHandler(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Date = null;
         if(maxYear < displayedYear + 1 && displayedMonth == 11)
         {
            return;
         }
         if(Boolean(selectableRange) && (mx_internal::dateGrid.mx_internal::selRangeMode == 1 || mx_internal::dateGrid.mx_internal::selRangeMode == 3))
         {
            _loc2_ = CalendarLayout.mx_internal::getNewIncrementDate(displayedYear,displayedMonth,0,1);
            _loc3_ = new Date(_loc2_.year,_loc2_.month,selectableRange.rangeEnd.getDate());
            if(selectableRange.rangeEnd >= _loc3_)
            {
               mx_internal::dateGrid.mx_internal::stepDate(0,1,param1);
               invalidateDisplayList();
            }
         }
         else if(mx_internal::dateGrid.mx_internal::selRangeMode != 4 || !selectableRange)
         {
            mx_internal::dateGrid.mx_internal::stepDate(0,1,param1);
            invalidateDisplayList();
         }
      }
      
      override protected function initializeAccessibility() : void
      {
         if(DateChooser.mx_internal::createAccessibilityImplementation != null)
         {
            DateChooser.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      public function set yearNavigationEnabled(param1:Boolean) : void
      {
         _yearNavigationEnabled = param1;
         yearNavigationEnabledChanged = true;
         invalidateProperties();
      }
      
      public function get minYear() : int
      {
         return _minYear;
      }
      
      protected function get prevMonthStyleFilters() : Object
      {
         return _prevMonthStyleFilters;
      }
      
      public function get maxYear() : int
      {
         return _maxYear;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Object = null;
         super.styleChanged(param1);
         if(param1 == null || param1 == "styleName" || param1 == "borderColor" || param1 == "headerColor" || param1 == "headerColors" || param1 == "backgroundColor" || param1 == "horizontalGap" || param1 == "verticalGap" || param1 == "backgroundAlpha")
         {
            invalidateDisplayList();
         }
         if(param1 == null || param1 == "styleName" || param1 == "headerStyleName" && mx_internal::monthDisplay)
         {
            _loc2_ = getStyle("headerStyleName");
            if(!_loc2_)
            {
               _loc2_ = this;
            }
            if(mx_internal::monthDisplay)
            {
               mx_internal::monthDisplay.styleName = _loc2_;
            }
            if(mx_internal::yearDisplay)
            {
               mx_internal::yearDisplay.styleName = _loc2_;
            }
            if(mx_internal::backMonthButton)
            {
               mx_internal::backMonthButton.styleName = new StyleProxy(this,prevMonthStyleFilters);
            }
            if(mx_internal::fwdMonthButton)
            {
               mx_internal::fwdMonthButton.styleName = new StyleProxy(this,nextMonthStyleFilters);
            }
            if(mx_internal::upYearButton)
            {
               mx_internal::upYearButton.styleName = new StyleProxy(this,nextYearStyleFilters);
            }
            if(mx_internal::downYearButton)
            {
               mx_internal::downYearButton.styleName = new StyleProxy(this,prevYearStyleFilters);
            }
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:int = 0;
         super.commitProperties();
         if(hasFontContextChanged() && mx_internal::yearDisplay != null)
         {
            _loc1_ = getChildIndex(DisplayObject(mx_internal::yearDisplay));
            mx_internal::removeYearDisplay();
            mx_internal::createYearDisplay(_loc1_);
            _loc1_ = getChildIndex(DisplayObject(mx_internal::monthDisplay));
            mx_internal::removeMonthDisplay();
            mx_internal::createMonthDisplay(_loc1_);
         }
         if(showTodayChanged)
         {
            showTodayChanged = false;
            mx_internal::dateGrid.showToday = _showToday;
            dispatchEvent(new Event("showTodayChanged"));
         }
         if(enabledChanged)
         {
            enabledChanged = false;
            mx_internal::fwdMonthButton.enabled = _enabled;
            mx_internal::backMonthButton.enabled = _enabled;
            mx_internal::monthDisplay.enabled = _enabled;
            mx_internal::yearDisplay.enabled = _enabled;
            if(_yearNavigationEnabled)
            {
               mx_internal::upYearButton.enabled = _enabled;
               mx_internal::downYearButton.enabled = _enabled;
            }
            mx_internal::dateGrid.enabled = _enabled;
            dispatchEvent(new Event("enabledChanged"));
         }
         if(firstDayOfWeekChanged)
         {
            firstDayOfWeekChanged = false;
            mx_internal::dateGrid.firstDayOfWeek = int(_firstDayOfWeek);
            dispatchEvent(new Event("firstDayOfWeekChanged"));
         }
         if(displayedMonthChanged)
         {
            displayedMonthChanged = false;
            mx_internal::dateGrid.displayedMonth = _displayedMonth;
            invalidateDisplayList();
            dispatchEvent(new Event("viewChanged"));
         }
         if(displayedYearChanged)
         {
            displayedYearChanged = false;
            mx_internal::dateGrid.displayedYear = _displayedYear;
            invalidateDisplayList();
            dispatchEvent(new Event("viewChanged"));
         }
         if(dayNamesChanged)
         {
            dayNamesChanged = false;
            mx_internal::dateGrid.dayNames = !!_dayNames ? _dayNames.slice(0) : null;
            dispatchEvent(new Event("dayNamesChanged"));
         }
         if(disabledDaysChanged)
         {
            disabledDaysChanged = false;
            mx_internal::dateGrid.disabledDays = _disabledDays.slice(0);
            dispatchEvent(new Event("disabledDaysChanged"));
         }
         if(selectableRangeChanged)
         {
            selectableRangeChanged = false;
            mx_internal::dateGrid.selectableRange = _selectableRange is Array ? _selectableRange.slice(0) : _selectableRange;
            dispatchEvent(new Event("selectableRangeChanged"));
            invalidateDisplayList();
         }
         if(disabledRangesChanged)
         {
            disabledRangesChanged = false;
            mx_internal::dateGrid.disabledRanges = _disabledRanges.slice(0);
            dispatchEvent(new Event("disabledRangesChanged"));
         }
         if(selectedDateChanged)
         {
            selectedDateChanged = false;
            mx_internal::dateGrid.selectedDate = _selectedDate;
            invalidateDisplayList();
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
         }
         if(selectedRangesChanged)
         {
            selectedRangesChanged = false;
            mx_internal::dateGrid.selectedRanges = _selectedRanges;
            invalidateDisplayList();
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
         }
         if(allowMultipleSelectionChanged)
         {
            allowMultipleSelectionChanged = false;
            mx_internal::dateGrid.allowMultipleSelection = _allowMultipleSelection;
            invalidateDisplayList();
            dispatchEvent(new Event("allowMultipleSelectionChanged"));
         }
         if(allowDisjointSelectionChanged)
         {
            allowDisjointSelectionChanged = false;
            mx_internal::dateGrid.allowDisjointSelection = _allowDisjointSelection;
            invalidateDisplayList();
            dispatchEvent(new Event("allowDisjointSelectionChanged"));
         }
         if(monthNamesChanged)
         {
            monthNamesChanged = false;
            mx_internal::setMonthWidth();
            invalidateDisplayList();
            dispatchEvent(new Event("monthNamesChanged"));
         }
         if(yearNavigationEnabledChanged)
         {
            if(_yearNavigationEnabled)
            {
               getYearNavigationButtons();
            }
            else if(Boolean(mx_internal::upYearButton) && Boolean(mx_internal::downYearButton))
            {
               removeChild(mx_internal::upYearButton);
               removeChild(mx_internal::downYearButton);
               removeChild(mx_internal::upYearHit);
               removeChild(mx_internal::downYearHit);
               mx_internal::upYearButton = null;
               mx_internal::downYearButton = null;
               mx_internal::upYearHit = null;
               mx_internal::downYearHit = null;
            }
            yearNavigationEnabledChanged = false;
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("yearNavigationEnabledChanged"));
         }
         if(yearSymbolChanged)
         {
            yearSymbolChanged = false;
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("yearSymbolChanged"));
         }
         if(monthSymbolChanged)
         {
            monthSymbolChanged = false;
            mx_internal::setMonthWidth();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("monthSymbolChanged"));
         }
      }
      
      private function yearBeforeMonth(param1:String) : Boolean
      {
         var _loc2_:int = param1 != null ? param1.length : 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1.charAt(_loc3_) == "M")
            {
               return false;
            }
            if(param1.charAt(_loc3_) == "Y")
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function set allowDisjointSelection(param1:Boolean) : void
      {
         _allowDisjointSelection = param1;
         allowDisjointSelectionChanged = true;
         invalidateProperties();
      }
      
      public function set selectedDate(param1:Date) : void
      {
         _selectedDate = mx_internal::scrubTimeValue(param1) as Date;
         selectedDateChanged = true;
         invalidateProperties();
      }
      
      [Bindable("yearNavigationEnabledChanged")]
      public function get yearNavigationEnabled() : Boolean
      {
         return _yearNavigationEnabled;
      }
      
      mx_internal function scrubTimeValues(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_] = mx_internal::scrubTimeValue(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function set disabledDays(param1:Array) : void
      {
         _disabledDays = param1;
         disabledDaysChanged = true;
         invalidateProperties();
      }
      
      [Bindable("allowDisjointSelectionChanged")]
      public function get allowDisjointSelection() : Boolean
      {
         return _allowDisjointSelection;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc12_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc26_:Graphics = null;
         var _loc27_:Graphics = null;
         var _loc28_:Number = NaN;
         var _loc29_:String = null;
         var _loc30_:Number = NaN;
         super.updateDisplayList(param1,param2);
         mx_internal::updateDateDisplay();
         var _loc3_:Number = getStyle("borderThickness");
         var _loc4_:Number = getStyle("cornerRadius");
         var _loc5_:Number = getStyle("borderColor");
         var _loc6_:Number = param1 - _loc3_ * 2;
         var _loc7_:Number = param2 - _loc3_ * 2;
         monthSkinWidth = mx_internal::fwdMonthButton.getExplicitOrMeasuredWidth();
         monthSkinHeight = mx_internal::fwdMonthButton.getExplicitOrMeasuredHeight();
         var _loc8_:Number = Number(mx_internal::monthDisplay.getExplicitOrMeasuredHeight());
         var _loc9_:Number = Number(mx_internal::yearDisplay.getExplicitOrMeasuredWidth());
         if(_yearNavigationEnabled)
         {
            yearSkinWidth = mx_internal::upYearButton.getExplicitOrMeasuredWidth();
            yearSkinHeight = mx_internal::upYearButton.getExplicitOrMeasuredHeight();
         }
         var _loc10_:String = String(resourceManager.getString("SharedResources","dateFormat"));
         var _loc11_:Boolean;
         if(_loc11_ = yearBeforeMonth(_loc10_))
         {
            _loc12_ = _loc3_ + monthSkinWidth + SKIN_WIDTH_PAD + HEADER_WIDTH_PAD;
         }
         else
         {
            _loc12_ = _loc6_ - (monthSkinWidth + HEADER_WIDTH_PAD + yearSkinWidth + YEAR_BUTTONS_PAD) + _loc3_;
         }
         var _loc13_:Number = _loc3_ + (headerHeight - _loc8_) / 2;
         var _loc14_:Number = HEADER_WIDTH_PAD + yearSkinWidth + (monthSkinWidth + SKIN_WIDTH_PAD * 2) * 2;
         mx_internal::monthDisplay.setActualSize(Math.max(_loc6_ - _loc14_ - _loc9_,0),_loc8_);
         if(_loc11_)
         {
            mx_internal::monthDisplay.move(_loc12_ + _loc9_ + YEAR_BUTTONS_PAD + yearSkinWidth,_loc13_);
         }
         else
         {
            mx_internal::monthDisplay.move(_loc3_ + monthSkinWidth + SKIN_WIDTH_PAD + HEADER_WIDTH_PAD,_loc13_);
         }
         mx_internal::monthDisplay.visible = true;
         mx_internal::yearDisplay.setActualSize(_loc9_ + YEAR_BUTTONS_PAD,_loc8_);
         if(_loc11_)
         {
            mx_internal::yearDisplay.move(_loc12_ + YEAR_BUTTONS_PAD,_loc13_);
         }
         else
         {
            mx_internal::yearDisplay.move(_loc12_ - _loc9_ - YEAR_BUTTONS_PAD,_loc13_);
         }
         mx_internal::yearDisplay.visible = true;
         mx_internal::dateGrid.setActualSize(_loc6_,_loc7_ - headerHeight);
         mx_internal::dateGrid.move(_loc3_,headerHeight + _loc3_);
         var _loc15_:Graphics;
         (_loc15_ = mx_internal::background.graphics).clear();
         _loc15_.beginFill(16777215);
         _loc15_.drawRoundRect(0,0,_loc6_,_loc7_,_loc4_ * 2,_loc4_ * 2);
         _loc15_.endFill();
         mx_internal::background.mx_internal::$visible = true;
         (_loc15_ = mx_internal::border.graphics).clear();
         _loc15_.beginFill(_loc5_);
         _loc15_.drawRoundRect(0,0,param1,param2,_loc4_ * 2,_loc4_ * 2);
         _loc15_.endFill();
         var _loc16_:uint = StyleManager.NOT_A_COLOR;
         if((_loc16_ = getStyle("backgroundColor")) == StyleManager.NOT_A_COLOR)
         {
            _loc16_ = 16777215;
         }
         var _loc17_:Number = 1;
         _loc17_ = getStyle("backgroundAlpha");
         _loc15_.beginFill(_loc16_,_loc17_);
         _loc15_.drawRoundRect(_loc3_,_loc3_,_loc6_,_loc7_,_loc4_ > 0 ? (_loc4_ - 1) * 2 : 0,_loc4_ > 0 ? (_loc4_ - 1) * 2 : 0);
         _loc15_.endFill();
         mx_internal::border.visible = true;
         var _loc18_:Array = getStyle("headerColors");
         StyleManager.getColorNames(_loc18_);
         var _loc19_:Graphics;
         (_loc19_ = mx_internal::calHeader.graphics).clear();
         var _loc20_:Matrix;
         (_loc20_ = new Matrix()).createGradientBox(_loc6_,headerHeight,Math.PI / 2,0,0);
         _loc19_.beginGradientFill(GradientType.LINEAR,_loc18_,[1,1],[0,255],_loc20_);
         GraphicsUtil.drawRoundRectComplex(_loc19_,_loc3_,_loc3_,_loc6_,headerHeight,_loc4_,_loc4_,0,0);
         _loc19_.endFill();
         _loc19_.lineStyle(_loc3_,_loc5_);
         _loc19_.moveTo(_loc3_,headerHeight + _loc3_);
         _loc19_.lineTo(_loc6_ + _loc3_,headerHeight + _loc3_);
         mx_internal::calHeader.mx_internal::$visible = true;
         mx_internal::fwdMonthButton.setActualSize(monthSkinWidth,monthSkinHeight);
         mx_internal::backMonthButton.setActualSize(monthSkinWidth,monthSkinHeight);
         mx_internal::fwdMonthButton.move(_loc6_ - (monthSkinWidth + HEADER_WIDTH_PAD) + _loc3_,Math.round(_loc3_ + (headerHeight - monthSkinHeight) / 2));
         mx_internal::backMonthButton.move(HEADER_WIDTH_PAD + _loc3_,Math.round(_loc3_ + (headerHeight - monthSkinHeight) / 2));
         if(_yearNavigationEnabled)
         {
            mx_internal::upYearButton.setActualSize(yearSkinWidth,yearSkinHeight);
            mx_internal::downYearButton.setActualSize(yearSkinWidth,yearSkinHeight);
            mx_internal::upYearButton.x = _loc12_;
            mx_internal::upYearButton.y = headerHeight / 2 - yearSkinHeight / 2 - 2;
            mx_internal::downYearButton.x = _loc12_;
            mx_internal::downYearButton.y = headerHeight / 2 + yearSkinHeight / 2 - 2;
            _loc21_ = mx_internal::upYearButton.x - SKIN_WIDTH_PAD / 2;
            _loc22_ = mx_internal::upYearButton.y - SKIN_HEIGHT_PAD / 2;
            (_loc26_ = mx_internal::upYearHit.graphics).clear();
            _loc26_.beginFill(13369344,0);
            _loc26_.moveTo(_loc21_,_loc22_);
            _loc26_.lineTo(_loc21_ + yearSkinWidth + SKIN_WIDTH_PAD,_loc22_);
            _loc26_.lineTo(_loc21_ + yearSkinWidth + SKIN_WIDTH_PAD,_loc22_ + yearSkinHeight + SKIN_HEIGHT_PAD / 2);
            _loc26_.lineTo(_loc21_,_loc22_ + yearSkinHeight + SKIN_HEIGHT_PAD / 2);
            _loc26_.lineTo(_loc21_,_loc22_);
            _loc26_.endFill();
            _loc21_ = mx_internal::downYearButton.x - SKIN_WIDTH_PAD / 2;
            _loc22_ = mx_internal::downYearButton.y;
            (_loc27_ = mx_internal::downYearHit.graphics).clear();
            _loc27_.beginFill(13369344,0);
            _loc27_.moveTo(_loc21_,_loc22_);
            _loc27_.lineTo(_loc21_ + yearSkinWidth + SKIN_WIDTH_PAD,_loc22_);
            _loc27_.lineTo(_loc21_ + yearSkinWidth + SKIN_WIDTH_PAD,_loc22_ + yearSkinHeight + SKIN_HEIGHT_PAD / 2);
            _loc27_.lineTo(_loc21_,_loc22_ + yearSkinHeight + SKIN_HEIGHT_PAD / 2);
            _loc27_.lineTo(_loc21_,_loc22_);
            _loc27_.endFill();
         }
         _loc21_ = mx_internal::fwdMonthButton.x - SKIN_WIDTH_PAD / 2;
         _loc22_ = mx_internal::fwdMonthButton.y - SKIN_HEIGHT_PAD;
         var _loc23_:Graphics;
         (_loc23_ = mx_internal::fwdMonthHit.graphics).clear();
         _loc23_.beginFill(13369344,0);
         _loc23_.moveTo(_loc21_,_loc22_);
         _loc23_.lineTo(_loc21_ + monthSkinWidth + SKIN_WIDTH_PAD / 2,_loc22_);
         _loc23_.lineTo(_loc21_ + monthSkinWidth + SKIN_WIDTH_PAD / 2,_loc22_ + monthSkinHeight + SKIN_HEIGHT_PAD);
         _loc23_.lineTo(_loc21_,_loc22_ + monthSkinHeight + SKIN_HEIGHT_PAD);
         _loc23_.lineTo(_loc21_,_loc22_);
         _loc23_.endFill();
         _loc21_ = mx_internal::backMonthButton.x - SKIN_WIDTH_PAD / 2;
         _loc22_ = mx_internal::backMonthButton.y - SKIN_HEIGHT_PAD;
         var _loc24_:Graphics;
         (_loc24_ = mx_internal::backMonthHit.graphics).clear();
         _loc24_.beginFill(13369344,0);
         _loc24_.moveTo(_loc21_,_loc22_);
         _loc24_.lineTo(_loc21_ + monthSkinWidth + SKIN_WIDTH_PAD / 2,_loc22_);
         _loc24_.lineTo(_loc21_ + monthSkinWidth + SKIN_WIDTH_PAD / 2,_loc22_ + monthSkinHeight + SKIN_HEIGHT_PAD);
         _loc24_.lineTo(_loc21_,_loc22_ + monthSkinHeight + SKIN_HEIGHT_PAD);
         _loc24_.lineTo(_loc21_,_loc22_);
         _loc24_.endFill();
         var _loc25_:Object = getStyle("dropShadowEnabled");
         graphics.clear();
         if(_loc25_ == true || _loc25_ is String && String(_loc25_).toLowerCase() == "true")
         {
            _loc28_ = getStyle("shadowDistance");
            _loc29_ = getStyle("shadowDirection");
            _loc30_ = 90;
            _loc28_ = Math.abs(_loc28_) + 2;
            if(!mx_internal::dropShadow)
            {
               mx_internal::dropShadow = new RectangularDropShadow();
            }
            mx_internal::dropShadow.distance = _loc28_;
            mx_internal::dropShadow.angle = _loc30_;
            mx_internal::dropShadow.color = getStyle("dropShadowColor");
            mx_internal::dropShadow.alpha = 0.4;
            mx_internal::dropShadow.tlRadius = _loc4_;
            mx_internal::dropShadow.trRadius = _loc4_;
            mx_internal::dropShadow.blRadius = _loc4_;
            mx_internal::dropShadow.brRadius = _loc4_;
            mx_internal::dropShadow.drawShadow(graphics,_loc3_,_loc3_,_loc6_,_loc7_);
         }
      }
   }
}
