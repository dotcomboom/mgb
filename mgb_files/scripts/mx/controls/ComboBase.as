package mx.controls
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import mx.collections.ArrayCollection;
   import mx.collections.CursorBookmark;
   import mx.collections.ICollectionView;
   import mx.collections.IList;
   import mx.collections.IViewCursor;
   import mx.collections.ListCollectionView;
   import mx.collections.XMLListCollection;
   import mx.core.EdgeMetrics;
   import mx.core.FlexVersion;
   import mx.core.IFlexDisplayObject;
   import mx.core.IIMESupport;
   import mx.core.IRectangularBorder;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.FlexEvent;
   import mx.managers.IFocusManager;
   import mx.managers.IFocusManagerComponent;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.StyleProxy;
   import mx.utils.UIDUtil;
   
   use namespace mx_internal;
   
   public class ComboBase extends UIComponent implements IIMESupport, IFocusManagerComponent
   {
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var _textInputStyleFilters:Object = {
         "backgroundAlpha":"backgroundAlpha",
         "backgroundColor":"backgroundColor",
         "backgroundImage":"backgroundImage",
         "backgroundDisabledColor":"backgroundDisabledColor",
         "backgroundSize":"backgroundSize",
         "borderAlpha":"borderAlpha",
         "borderColor":"borderColor",
         "borderSides":"borderSides",
         "borderSkin":"borderSkin",
         "borderStyle":"borderStyle",
         "borderThickness":"borderThickness",
         "dropShadowColor":"dropShadowColor",
         "dropShadowEnabled":"dropShadowEnabled",
         "embedFonts":"embedFonts",
         "focusAlpha":"focusAlpha",
         "focusBlendMode":"focusBlendMode",
         "focusRoundedCorners":"focusRoundedCorners",
         "focusThickness":"focusThickness",
         "leading":"leading",
         "paddingLeft":"paddingLeft",
         "paddingRight":"paddingRight",
         "shadowDirection":"shadowDirection",
         "shadowDistance":"shadowDistance",
         "textDecoration":"textDecoration"
      };
       
      
      private var _enabled:Boolean = false;
      
      mx_internal var useFullDropdownSkin:Boolean = false;
      
      mx_internal var selectedItemChanged:Boolean = false;
      
      mx_internal var selectionChanged:Boolean = false;
      
      mx_internal var downArrowButton:Button;
      
      private var _restrict:String;
      
      protected var collection:ICollectionView;
      
      private var _text:String = "";
      
      mx_internal var border:IFlexDisplayObject;
      
      private var _selectedItem:Object;
      
      mx_internal var editableChanged:Boolean = true;
      
      private var enabledChanged:Boolean = false;
      
      private var selectedUID:String;
      
      mx_internal var selectedIndexChanged:Boolean = false;
      
      mx_internal var oldBorderStyle:String;
      
      protected var textInput:TextInput;
      
      private var _editable:Boolean = false;
      
      mx_internal var collectionIterator:IViewCursor;
      
      mx_internal var textChanged:Boolean;
      
      private var _imeMode:String = null;
      
      protected var iterator:IViewCursor;
      
      mx_internal var wrapDownArrowButton:Boolean = true;
      
      private var _selectedIndex:int = -1;
      
      public function ComboBase()
      {
         super();
         tabEnabled = true;
      }
      
      protected function collectionChangeHandler(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Number = NaN;
         var _loc4_:Object = null;
         var _loc5_:CollectionEvent = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         if(param1 is CollectionEvent)
         {
            _loc2_ = false;
            if((_loc5_ = CollectionEvent(param1)).kind == CollectionEventKind.ADD)
            {
               if(selectedIndex >= _loc5_.location)
               {
                  ++_selectedIndex;
               }
            }
            if(_loc5_.kind == CollectionEventKind.REMOVE)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc5_.items.length)
               {
                  _loc7_ = itemToUID(_loc5_.items[_loc6_]);
                  if(selectedUID == _loc7_)
                  {
                     mx_internal::selectionChanged = true;
                  }
                  _loc6_++;
               }
               if(mx_internal::selectionChanged)
               {
                  if(_selectedIndex >= collection.length)
                  {
                     _selectedIndex = collection.length - 1;
                  }
                  mx_internal::selectedIndexChanged = true;
                  _loc2_ = true;
                  invalidateDisplayList();
               }
               else if(selectedIndex >= _loc5_.location)
               {
                  --_selectedIndex;
                  mx_internal::selectedIndexChanged = true;
                  _loc2_ = true;
                  invalidateDisplayList();
               }
            }
            if(_loc5_.kind == CollectionEventKind.REFRESH)
            {
               mx_internal::selectedItemChanged = true;
               _loc2_ = true;
            }
            invalidateDisplayList();
            if(_loc2_)
            {
               dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            }
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         _enabled = param1;
         enabledChanged = true;
         invalidateProperties();
      }
      
      public function get imeMode() : String
      {
         return _imeMode;
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         var _loc2_:IFocusManager = focusManager;
         if(_loc2_)
         {
            _loc2_.defaultButtonEnabled = true;
         }
         if(_editable)
         {
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
         }
      }
      
      override public function get baselinePosition() : Number
      {
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
         {
            return textInput.y + textInput.baselinePosition;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         return textInput.y + textInput.baselinePosition;
      }
      
      public function set imeMode(param1:String) : void
      {
         _imeMode = param1;
         if(textInput)
         {
            textInput.imeMode = _imeMode;
         }
      }
      
      protected function itemToUID(param1:Object) : String
      {
         if(!param1)
         {
            return "null";
         }
         return UIDUtil.getUID(param1);
      }
      
      protected function downArrowButton_buttonDownHandler(param1:FlexEvent) : void
      {
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:Class = null;
         var _loc2_:Object = null;
         super.createChildren();
         if(!mx_internal::border)
         {
            _loc1_ = getStyle("borderSkin");
            if(_loc1_)
            {
               mx_internal::border = new _loc1_();
               if(mx_internal::border is IFocusManagerComponent)
               {
                  IFocusManagerComponent(mx_internal::border).focusEnabled = false;
               }
               if(mx_internal::border is ISimpleStyleClient)
               {
                  ISimpleStyleClient(mx_internal::border).styleName = this;
               }
               addChild(DisplayObject(mx_internal::border));
            }
         }
         if(!mx_internal::downArrowButton)
         {
            mx_internal::downArrowButton = new Button();
            mx_internal::downArrowButton.styleName = new StyleProxy(this,arrowButtonStyleFilters);
            mx_internal::downArrowButton.focusEnabled = false;
            addChild(mx_internal::downArrowButton);
            mx_internal::downArrowButton.addEventListener(FlexEvent.BUTTON_DOWN,downArrowButton_buttonDownHandler);
         }
         if(!textInput)
         {
            _loc2_ = getStyle("textInputStyleName");
            if(!_loc2_)
            {
               _loc2_ = new StyleProxy(this,textInputStyleFilters);
            }
            textInput = new TextInput();
            textInput.editable = _editable;
            mx_internal::editableChanged = true;
            textInput.restrict = "^\x1b";
            textInput.focusEnabled = false;
            textInput.imeMode = _imeMode;
            textInput.styleName = _loc2_;
            textInput.addEventListener(Event.CHANGE,textInput_changeHandler);
            textInput.addEventListener(FlexEvent.ENTER,textInput_enterHandler);
            textInput.addEventListener(FocusEvent.FOCUS_IN,focusInHandler);
            textInput.addEventListener(FocusEvent.FOCUS_OUT,focusOutHandler);
            textInput.addEventListener(FlexEvent.VALUE_COMMIT,textInput_valueCommitHandler);
            addChild(textInput);
            textInput.move(0,0);
            textInput.mx_internal::parentDrawsFocus = true;
         }
      }
      
      public function set selectedItem(param1:Object) : void
      {
         setSelectedItem(param1);
      }
      
      override protected function initializeAccessibility() : void
      {
         if(ComboBase.mx_internal::createAccessibilityImplementation != null)
         {
            ComboBase.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      private function textInput_enterHandler(param1:FlexEvent) : void
      {
         dispatchEvent(param1);
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      protected function calculatePreferredSizeFromData(param1:int) : Object
      {
         return null;
      }
      
      override public function setFocus() : void
      {
         if(Boolean(textInput) && _editable)
         {
            textInput.setFocus();
         }
         else
         {
            super.setFocus();
         }
      }
      
      private function textInput_valueCommitHandler(param1:FlexEvent) : void
      {
         _text = textInput.text;
         dispatchEvent(param1);
      }
      
      [NonCommittingChangeEvent("change")]
      [Bindable("valueCommit")]
      [Bindable("collectionChange")]
      public function get text() : String
      {
         return _text;
      }
      
      [Bindable("collectionChange")]
      public function get dataProvider() : Object
      {
         return collection;
      }
      
      protected function get arrowButtonStyleFilters() : Object
      {
         return null;
      }
      
      public function set editable(param1:Boolean) : void
      {
         _editable = param1;
         mx_internal::editableChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("editableChanged"));
      }
      
      override public function styleChanged(param1:String) : void
      {
         if(mx_internal::downArrowButton)
         {
            mx_internal::downArrowButton.styleChanged(param1);
         }
         if(textInput)
         {
            textInput.styleChanged(param1);
         }
         if(Boolean(mx_internal::border) && mx_internal::border is ISimpleStyleClient)
         {
            ISimpleStyleClient(mx_internal::border).styleChanged(param1);
         }
         super.styleChanged(param1);
      }
      
      [Bindable("restrictChanged")]
      public function get restrict() : String
      {
         return _restrict;
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedItem() : Object
      {
         return _selectedItem;
      }
      
      mx_internal function get ComboDownArrowButton() : Button
      {
         return mx_internal::downArrowButton;
      }
      
      private function setSelectedItem(param1:Object, param2:Boolean = true) : void
      {
         if(!collection || collection.length == 0)
         {
            _selectedItem = param1;
            mx_internal::selectedItemChanged = true;
            invalidateDisplayList();
            return;
         }
         var _loc3_:Boolean = false;
         var _loc4_:IViewCursor = collection.createCursor();
         var _loc5_:int = 0;
         do
         {
            if(param1 == _loc4_.current)
            {
               _selectedIndex = _loc5_;
               _selectedItem = param1;
               selectedUID = itemToUID(param1);
               mx_internal::selectionChanged = true;
               _loc3_ = true;
               break;
            }
            _loc5_++;
         }
         while(_loc4_.moveNext());
         
         if(!_loc3_)
         {
            selectedIndex = -1;
            _selectedItem = null;
            selectedUID = null;
         }
         invalidateDisplayList();
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:Boolean = false;
         super.commitProperties();
         textInput.restrict = _restrict;
         if(mx_internal::textChanged)
         {
            textInput.text = _text;
            mx_internal::textChanged = false;
         }
         if(enabledChanged)
         {
            textInput.enabled = _enabled;
            mx_internal::editableChanged = true;
            mx_internal::downArrowButton.enabled = _enabled;
            enabledChanged = false;
         }
         if(mx_internal::editableChanged)
         {
            mx_internal::editableChanged = false;
            _loc1_ = _editable;
            if(mx_internal::wrapDownArrowButton == false)
            {
               if(_loc1_)
               {
                  if(mx_internal::oldBorderStyle)
                  {
                     setStyle("borderStyle",mx_internal::oldBorderStyle);
                  }
               }
               else
               {
                  mx_internal::oldBorderStyle = getStyle("borderStyle");
                  setStyle("borderStyle","comboNonEdit");
               }
            }
            if(mx_internal::useFullDropdownSkin)
            {
               mx_internal::downArrowButton.mx_internal::upSkinName = _loc1_ ? "editableUpSkin" : "upSkin";
               mx_internal::downArrowButton.mx_internal::overSkinName = _loc1_ ? "editableOverSkin" : "overSkin";
               mx_internal::downArrowButton.mx_internal::downSkinName = _loc1_ ? "editableDownSkin" : "downSkin";
               mx_internal::downArrowButton.mx_internal::disabledSkinName = _loc1_ ? "editableDisabledSkin" : "disabledSkin";
               mx_internal::downArrowButton.mx_internal::changeSkins();
               mx_internal::downArrowButton.invalidateDisplayList();
            }
            if(textInput)
            {
               textInput.editable = _loc1_;
               textInput.mx_internal::selectable = _loc1_;
               if(_loc1_)
               {
                  textInput.removeEventListener(MouseEvent.MOUSE_DOWN,textInput_mouseEventHandler);
                  textInput.removeEventListener(MouseEvent.MOUSE_UP,textInput_mouseEventHandler);
                  textInput.removeEventListener(MouseEvent.ROLL_OVER,textInput_mouseEventHandler);
                  textInput.removeEventListener(MouseEvent.ROLL_OUT,textInput_mouseEventHandler);
                  textInput.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
               }
               else
               {
                  textInput.addEventListener(MouseEvent.MOUSE_DOWN,textInput_mouseEventHandler);
                  textInput.addEventListener(MouseEvent.MOUSE_UP,textInput_mouseEventHandler);
                  textInput.addEventListener(MouseEvent.ROLL_OVER,textInput_mouseEventHandler);
                  textInput.addEventListener(MouseEvent.ROLL_OUT,textInput_mouseEventHandler);
                  textInput.removeEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
               }
            }
         }
      }
      
      protected function get textInputStyleFilters() : Object
      {
         return _textInputStyleFilters;
      }
      
      public function set text(param1:String) : void
      {
         _text = param1;
         mx_internal::textChanged = true;
         invalidateProperties();
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      override protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == textInput || super.isOurFocus(param1);
      }
      
      [Bindable("editableChanged")]
      public function get editable() : Boolean
      {
         return _editable;
      }
      
      override protected function measure() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Object = null;
         var _loc4_:EdgeMetrics = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         super.measure();
         var _loc1_:Number = getStyle("arrowButtonWidth");
         _loc2_ = mx_internal::downArrowButton.getExplicitOrMeasuredHeight();
         if(Boolean(collection) && collection.length > 0)
         {
            _loc3_ = calculatePreferredSizeFromData(collection.length);
            _loc4_ = borderMetrics;
            _loc5_ = _loc3_.width + _loc4_.left + _loc4_.right + 8;
            _loc6_ = _loc3_.height + _loc4_.top + _loc4_.bottom + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
            measuredMinWidth = measuredWidth = _loc5_ + _loc1_;
            measuredMinHeight = measuredHeight = Math.max(_loc6_,_loc2_);
         }
         else
         {
            measuredMinWidth = DEFAULT_MEASURED_MIN_WIDTH;
            measuredWidth = DEFAULT_MEASURED_WIDTH;
            measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredHeight = DEFAULT_MEASURED_HEIGHT;
         }
         if(FlexVersion.compatibilityVersion >= FlexVersion.VERSION_3_0)
         {
            _loc7_ = getStyle("paddingTop") + getStyle("paddingBottom");
            measuredMinHeight += _loc7_;
            measuredHeight += _loc7_;
         }
      }
      
      protected function textInput_changeHandler(param1:Event) : void
      {
         _text = textInput.text;
         if(_selectedIndex != -1)
         {
            _selectedIndex = -1;
            _selectedItem = null;
            selectedUID = null;
         }
      }
      
      mx_internal function getTextInput() : TextInput
      {
         return textInput;
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         super.focusInHandler(param1);
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get value() : Object
      {
         if(_editable)
         {
            return text;
         }
         var _loc1_:Object = selectedItem;
         if(_loc1_ == null || typeof _loc1_ != "object")
         {
            return _loc1_;
         }
         return _loc1_.data != null ? _loc1_.data : _loc1_.label;
      }
      
      private function textInput_mouseEventHandler(param1:Event) : void
      {
         mx_internal::downArrowButton.dispatchEvent(param1);
      }
      
      public function set selectedIndex(param1:int) : void
      {
         var _loc2_:CursorBookmark = null;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         _selectedIndex = param1;
         if(param1 == -1)
         {
            _selectedItem = null;
            selectedUID = null;
         }
         if(!collection || collection.length == 0)
         {
            mx_internal::selectedIndexChanged = true;
         }
         else if(param1 != -1)
         {
            param1 = Math.min(param1,collection.length - 1);
            _loc2_ = iterator.bookmark;
            _loc3_ = param1;
            iterator.seek(CursorBookmark.FIRST,_loc3_);
            _loc4_ = iterator.current;
            _loc5_ = itemToUID(_loc4_);
            iterator.seek(_loc2_,0);
            _selectedIndex = param1;
            _selectedItem = _loc4_;
            selectedUID = _loc5_;
         }
         mx_internal::selectionChanged = true;
         invalidateDisplayList();
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      public function set dataProvider(param1:Object) : void
      {
         var _loc3_:Array = null;
         if(param1 is Array)
         {
            collection = new ArrayCollection(param1 as Array);
         }
         else if(param1 is ICollectionView)
         {
            collection = ICollectionView(param1);
         }
         else if(param1 is IList)
         {
            collection = new ListCollectionView(IList(param1));
         }
         else if(param1 is XMLList)
         {
            collection = new XMLListCollection(param1 as XMLList);
         }
         else
         {
            _loc3_ = [param1];
            collection = new ArrayCollection(_loc3_);
         }
         iterator = collection.createCursor();
         mx_internal::collectionIterator = collection.createCursor();
         collection.addEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangeHandler,false,0,true);
         var _loc2_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
         _loc2_.kind = CollectionEventKind.RESET;
         collectionChangeHandler(_loc2_);
         dispatchEvent(_loc2_);
         invalidateSize();
         invalidateDisplayList();
      }
      
      protected function get borderMetrics() : EdgeMetrics
      {
         if(Boolean(mx_internal::border) && mx_internal::border is IRectangularBorder)
         {
            return IRectangularBorder(mx_internal::border).borderMetrics;
         }
         return EdgeMetrics.EMPTY;
      }
      
      public function set restrict(param1:String) : void
      {
         _restrict = param1;
         invalidateProperties();
         dispatchEvent(new Event("restrictChanged"));
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc7_:EdgeMetrics = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         var _loc5_:Number = getStyle("arrowButtonWidth");
         var _loc6_:Number = textInput.getExplicitOrMeasuredHeight();
         if(isNaN(_loc5_))
         {
            _loc5_ = 0;
         }
         if(mx_internal::wrapDownArrowButton)
         {
            _loc7_ = borderMetrics;
            _loc8_ = _loc4_ - _loc7_.top - _loc7_.bottom;
            mx_internal::downArrowButton.setActualSize(_loc8_,_loc8_);
            mx_internal::downArrowButton.move(_loc3_ - _loc5_ - _loc7_.right,_loc7_.top);
            mx_internal::border.setActualSize(_loc3_,_loc4_);
            textInput.setActualSize(_loc3_ - _loc5_,_loc6_);
         }
         else if(!_editable && mx_internal::useFullDropdownSkin)
         {
            _loc9_ = getStyle("paddingTop");
            _loc10_ = getStyle("paddingBottom");
            mx_internal::downArrowButton.move(0,0);
            mx_internal::border.setActualSize(_loc3_,_loc4_);
            textInput.setActualSize(_loc3_ - _loc5_,_loc6_);
            textInput.mx_internal::border.visible = false;
            if(FlexVersion.compatibilityVersion >= FlexVersion.VERSION_3_0)
            {
               textInput.move(textInput.x,(_loc4_ - _loc6_ - _loc9_ - _loc10_) / 2 + _loc9_);
            }
            mx_internal::downArrowButton.setActualSize(param1,param2);
         }
         else
         {
            mx_internal::downArrowButton.move(_loc3_ - _loc5_,0);
            mx_internal::border.setActualSize(_loc3_ - _loc5_,_loc4_);
            textInput.setActualSize(_loc3_ - _loc5_,_loc4_);
            mx_internal::downArrowButton.setActualSize(_loc5_,param2);
            textInput.mx_internal::border.visible = true;
         }
         if(mx_internal::selectedItemChanged)
         {
            selectedItem = selectedItem;
            mx_internal::selectedItemChanged = false;
            mx_internal::selectedIndexChanged = false;
         }
         if(mx_internal::selectedIndexChanged)
         {
            selectedIndex = selectedIndex;
            mx_internal::selectedIndexChanged = false;
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedIndex() : int
      {
         return _selectedIndex;
      }
   }
}
