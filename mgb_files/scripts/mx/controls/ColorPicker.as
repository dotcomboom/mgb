package mx.controls
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import mx.controls.colorPickerClasses.SwatchPanel;
   import mx.controls.colorPickerClasses.WebSafePalette;
   import mx.core.FlexVersion;
   import mx.core.UIComponent;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.effects.Tween;
   import mx.events.ColorPickerEvent;
   import mx.events.DropdownEvent;
   import mx.events.FlexEvent;
   import mx.events.FlexMouseEvent;
   import mx.events.InterManagerRequest;
   import mx.events.SandboxMouseEvent;
   import mx.managers.IFocusManager;
   import mx.managers.ISystemManager;
   import mx.managers.PopUpManager;
   import mx.skins.halo.SwatchSkin;
   import mx.styles.StyleProxy;
   
   use namespace mx_internal;
   
   public class ColorPicker extends ComboBase
   {
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      private static const _swatchStyleFilters:Object = {
         "swatchBorderColor":"swatchBorderColor",
         "swatchBorderSize":"swatchBorderSize"
      };
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var dropdownGap:Number = 6;
      
      private var _selectedColor:uint = 0;
      
      private var _labelField:String = "label";
      
      mx_internal var showingDropdown:Boolean = false;
      
      private var swatchPreview:SwatchSkin;
      
      private var dropdownSwatch:SwatchPanel;
      
      private var isModelInited:Boolean = false;
      
      private var collectionChanged:Boolean = false;
      
      private var triggerEvent:Event;
      
      [Bindable("editableChanged")]
      private var _editable:Boolean = true;
      
      private var initializing:Boolean = true;
      
      mx_internal var isOpening:Boolean = false;
      
      private var _showTextField:Boolean = true;
      
      private var indexFlag:Boolean = false;
      
      mx_internal var isDown:Boolean = false;
      
      private var _colorField:String = "color";
      
      public function ColorPicker()
      {
         super();
         if(!isModelInited)
         {
            loadDefaultPalette();
         }
         super.editable = false;
         addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
      }
      
      private function loadDefaultPalette() : void
      {
         var _loc1_:WebSafePalette = null;
         if(!dataProvider || dataProvider.length < 1)
         {
            _loc1_ = new WebSafePalette();
            dataProvider = _loc1_.getList();
         }
         selectedIndex = findColorByName(selectedColor);
      }
      
      private function dropdownSwatch_itemRollOverHandler(param1:ColorPickerEvent) : void
      {
         dispatchEvent(param1);
      }
      
      mx_internal function getDropdown() : SwatchPanel
      {
         var _loc1_:Object = null;
         if(initializing)
         {
            return null;
         }
         if(!dropdownSwatch)
         {
            dropdownSwatch = new SwatchPanel();
            dropdownSwatch.owner = this;
            dropdownSwatch.editable = editable;
            dropdownSwatch.colorField = colorField;
            dropdownSwatch.labelField = labelField;
            dropdownSwatch.dataProvider = dataProvider;
            dropdownSwatch.showTextField = showTextField;
            dropdownSwatch.selectedColor = selectedColor;
            dropdownSwatch.selectedIndex = selectedIndex;
            _loc1_ = getStyle("swatchPanelStyleName");
            if(_loc1_)
            {
               dropdownSwatch.styleName = _loc1_;
            }
            else if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
            {
               dropdownSwatch.styleName = this;
            }
            dropdownSwatch.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER,dropdownSwatch_itemRollOverHandler);
            dropdownSwatch.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT,dropdownSwatch_itemRollOutHandler);
            dropdownSwatch.cacheAsBitmap = true;
            dropdownSwatch.scrollRect = new Rectangle(0,0,0,0);
         }
         dropdownSwatch.scaleX = scaleX;
         dropdownSwatch.scaleY = scaleY;
         return dropdownSwatch;
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedColor() : uint
      {
         return _selectedColor;
      }
      
      public function set selectedColor(param1:uint) : void
      {
         if(!indexFlag)
         {
            super.selectedIndex = findColorByName(param1);
         }
         else
         {
            indexFlag = false;
         }
         if(param1 != selectedColor)
         {
            _selectedColor = param1;
            updateColor(param1);
            if(dropdownSwatch)
            {
               dropdownSwatch.selectedColor = param1;
            }
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      mx_internal function get dropdown() : SwatchPanel
      {
         return dropdownSwatch;
      }
      
      override protected function downArrowButton_buttonDownHandler(param1:FlexEvent) : void
      {
         mx_internal::displayDropdown(!mx_internal::showingDropdown,param1);
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(!swatchPreview)
         {
            swatchPreview = new SwatchSkin();
            swatchPreview.styleName = new StyleProxy(this,swatchStyleFilters);
            swatchPreview.mx_internal::color = selectedColor;
            swatchPreview.name = "colorPickerSwatch";
            if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
            {
               swatchPreview.setStyle("swatchBorderSize",0);
            }
            addChild(swatchPreview);
         }
         setChildIndex(swatchPreview,getChildIndex(mx_internal::downArrowButton));
         textInput.visible = false;
         if(!enabled)
         {
            super.enabled = enabled;
         }
         initializing = false;
      }
      
      override protected function initializeAccessibility() : void
      {
         if(ColorPicker.mx_internal::createAccessibilityImplementation != null)
         {
            ColorPicker.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      public function set showTextField(param1:Boolean) : void
      {
         _showTextField = param1;
         if(dropdownSwatch)
         {
            dropdownSwatch.showTextField = param1;
         }
      }
      
      private function updateColor(param1:Number) : void
      {
         if(initializing || isNaN(param1))
         {
            return;
         }
         swatchPreview.mx_internal::updateSkin(param1);
      }
      
      [Bindable("collectionChange")]
      [Bindable("change")]
      override public function set selectedItem(param1:Object) : void
      {
         if(param1 != selectedItem)
         {
            super.selectedItem = param1;
            if(typeof param1 == "object")
            {
               selectedColor = Number(param1[colorField]);
            }
            else if(typeof param1 == "number")
            {
               selectedColor = Number(param1);
            }
            indexFlag = true;
            if(dropdownSwatch)
            {
               dropdownSwatch.selectedItem = param1;
            }
         }
      }
      
      private function dropdownSwatch_mouseDownOutsideHandler(param1:Event) : void
      {
         var _loc2_:MouseEvent = null;
         if(param1 is MouseEvent)
         {
            _loc2_ = MouseEvent(param1);
            if(!hitTestPoint(_loc2_.stageX,_loc2_.stageY,true))
            {
               close(param1);
            }
         }
         else if(param1 is SandboxMouseEvent)
         {
            close(param1);
         }
      }
      
      public function set colorField(param1:String) : void
      {
         _colorField = param1;
         if(dropdownSwatch)
         {
            dropdownSwatch.colorField = param1;
         }
         dispatchEvent(new Event("colorFieldChanged"));
      }
      
      private function getColor(param1:int) : Number
      {
         if(!dataProvider || dataProvider.length < 1 || param1 < 0 || param1 >= dataProvider.length)
         {
            return -1;
         }
         return Number(typeof dataProvider.getItemAt(param1) == "object" ? dataProvider.getItemAt(param1)[colorField] : dataProvider.getItemAt(param1));
      }
      
      private function dropdownSwatch_itemRollOutHandler(param1:ColorPickerEvent) : void
      {
         dispatchEvent(param1);
      }
      
      mx_internal function onTweenUpdate(param1:Number) : void
      {
         dropdownSwatch.scrollRect = new Rectangle(0,param1,dropdownSwatch.width,dropdownSwatch.height);
      }
      
      override public function set editable(param1:Boolean) : void
      {
         _editable = param1;
         if(dropdownSwatch)
         {
            dropdownSwatch.editable = param1;
         }
         dispatchEvent(new Event("editableChanged"));
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(collectionChanged)
         {
            if(findColorByName(selectedColor) == -1)
            {
               if(dataProvider.length > 0 && selectedIndex > dataProvider.length)
               {
                  selectedIndex = 0;
               }
               if(getColor(selectedIndex) >= 0)
               {
                  selectedColor = getColor(selectedIndex);
                  swatchPreview.mx_internal::color = selectedColor;
               }
               else if(dropdownSwatch)
               {
                  swatchPreview.mx_internal::color = dropdownSwatch.selectedColor;
               }
            }
            else
            {
               selectedIndex = findColorByName(selectedColor);
            }
            collectionChanged = false;
         }
      }
      
      public function set labelField(param1:String) : void
      {
         _labelField = param1;
         if(dropdownSwatch)
         {
            dropdownSwatch.labelField = param1;
         }
         dispatchEvent(new Event("labelFieldChanged"));
      }
      
      public function get showTextField() : Boolean
      {
         return _showTextField;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Object = null;
         if(dropdownSwatch)
         {
            if(FlexVersion.compatibilityVersion >= FlexVersion.VERSION_3_0)
            {
               if(param1 == "swatchPanelStyleName")
               {
                  _loc2_ = getStyle("swatchPanelStyleName");
                  if(_loc2_)
                  {
                     dropdownSwatch.styleName = _loc2_;
                  }
               }
            }
            dropdownSwatch.styleChanged(param1);
         }
         super.styleChanged(param1);
         invalidateDisplayList();
      }
      
      private function findColorByName(param1:Number) : int
      {
         if(param1 == getColor(selectedIndex))
         {
            return selectedIndex;
         }
         var _loc2_:int = int(dataProvider.length);
         var _loc3_:int = 0;
         while(_loc3_ < dataProvider.length)
         {
            if(param1 == getColor(_loc3_))
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      [Bindable("colorFieldChanged")]
      public function get colorField() : String
      {
         return _colorField;
      }
      
      public function open() : void
      {
         mx_internal::displayDropdown(true);
      }
      
      override public function get editable() : Boolean
      {
         return _editable;
      }
      
      override protected function measure() : void
      {
         measuredMinWidth = measuredWidth = DEFAULT_MEASURED_MIN_HEIGHT;
         measuredMinHeight = measuredHeight = DEFAULT_MEASURED_MIN_HEIGHT;
      }
      
      [Bindable("labelFieldChanged")]
      public function get labelField() : String
      {
         return _labelField;
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:ColorPickerEvent = null;
         if(param1.ctrlKey && param1.keyCode == Keyboard.DOWN)
         {
            mx_internal::displayDropdown(true,param1);
         }
         else if(param1.ctrlKey && param1.keyCode == Keyboard.UP || param1.keyCode == Keyboard.ESCAPE)
         {
            if(Boolean(dropdownSwatch) && dropdownSwatch.enabled)
            {
               close(param1);
            }
         }
         else if(mx_internal::showingDropdown && param1.keyCode == Keyboard.ENTER && dropdownSwatch.enabled)
         {
            if(!dropdownSwatch.mx_internal::isOverGrid && editable)
            {
               if(selectedColor != dropdownSwatch.selectedColor)
               {
                  selectedColor = dropdownSwatch.selectedColor;
                  _loc2_ = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                  _loc2_.index = selectedIndex;
                  _loc2_.color = selectedColor;
                  dispatchEvent(_loc2_);
                  _loc2_ = new ColorPickerEvent(ColorPickerEvent.ENTER);
                  _loc2_.color = selectedColor;
                  dispatchEvent(_loc2_);
               }
            }
            else if(selectedIndex != dropdownSwatch.mx_internal::focusedIndex)
            {
               dropdownSwatch.selectedIndex = dropdownSwatch.mx_internal::focusedIndex;
               selectedIndex = dropdownSwatch.selectedIndex;
               _loc2_ = new ColorPickerEvent(ColorPickerEvent.CHANGE);
               _loc2_.index = selectedIndex;
               _loc2_.color = selectedColor;
               dispatchEvent(_loc2_);
            }
            close();
            param1.stopPropagation();
         }
         else if(mx_internal::showingDropdown && (param1.keyCode == Keyboard.HOME || param1.keyCode == Keyboard.END || param1.keyCode == Keyboard.PAGE_UP || param1.keyCode == Keyboard.PAGE_DOWN || param1.keyCode == Keyboard.LEFT || param1.keyCode == Keyboard.RIGHT || param1.keyCode == Keyboard.UP || param1.keyCode == Keyboard.DOWN))
         {
            dropdownSwatch.dispatchEvent(param1);
         }
         else if(param1.keyCode == Keyboard.LEFT)
         {
            if(selectedIndex == -1)
            {
               selectedIndex = findColorByName(selectedColor);
            }
            if(selectedIndex - 1 >= 0)
            {
               --selectedIndex;
               _loc2_ = new ColorPickerEvent(ColorPickerEvent.CHANGE);
               _loc2_.index = selectedIndex;
               _loc2_.color = selectedColor;
               dispatchEvent(_loc2_);
            }
         }
         else if(param1.keyCode == Keyboard.RIGHT)
         {
            if(selectedIndex == -1)
            {
               selectedIndex = findColorByName(selectedColor);
            }
            if(selectedIndex + 1 < dataProvider.length)
            {
               ++selectedIndex;
               _loc2_ = new ColorPickerEvent(ColorPickerEvent.CHANGE);
               _loc2_.index = selectedIndex;
               _loc2_.color = selectedColor;
               dispatchEvent(_loc2_);
            }
         }
      }
      
      protected function get swatchStyleFilters() : Object
      {
         return _swatchStyleFilters;
      }
      
      [Bindable("collectionChange")]
      [Bindable("change")]
      override public function set selectedIndex(param1:int) : void
      {
         if((selectedIndex != -1 || !isNaN(selectedColor)) && param1 != selectedIndex)
         {
            if(param1 >= 0)
            {
               indexFlag = true;
               selectedColor = getColor(param1);
               super.selectedIndex = param1;
            }
            if(dropdownSwatch)
            {
               dropdownSwatch.selectedIndex = param1;
            }
         }
      }
      
      mx_internal function onTweenEnd(param1:Number) : void
      {
         if(mx_internal::showingDropdown)
         {
            dropdownSwatch.scrollRect = null;
         }
         else
         {
            mx_internal::onTweenUpdate(param1);
            dropdownSwatch.visible = false;
            mx_internal::isOpening = false;
         }
         UIComponent.resumeBackgroundProcessing();
         if(mx_internal::showingDropdown && showTextField)
         {
            dropdownSwatch.setFocus();
         }
         else
         {
            setFocus();
         }
         dropdownSwatch.enabled = true;
         dispatchEvent(new DropdownEvent(mx_internal::showingDropdown ? DropdownEvent.OPEN : DropdownEvent.CLOSE,false,false,triggerEvent));
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         var _loc2_:IFocusManager = focusManager;
         if(_loc2_)
         {
            _loc2_.showFocusIndicator = true;
         }
         if(mx_internal::isDown && !mx_internal::isOpening)
         {
            close();
         }
         else if(mx_internal::isOpening)
         {
            mx_internal::isOpening = false;
         }
         super.focusInHandler(param1);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         swatchPreview.mx_internal::color = selectedColor;
         swatchPreview.setActualSize(param1,param2);
         mx_internal::downArrowButton.move(0,0);
         mx_internal::downArrowButton.setActualSize(param1,param2);
         if(dropdownSwatch)
         {
            dropdownSwatch.setActualSize(dropdownSwatch.getExplicitOrMeasuredWidth(),dropdownSwatch.getExplicitOrMeasuredHeight());
         }
      }
      
      public function close(param1:Event = null) : void
      {
         mx_internal::displayDropdown(false,param1);
      }
      
      mx_internal function displayDropdown(param1:Boolean, param2:Event = null) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc7_:Function = null;
         var _loc8_:Number = NaN;
         var _loc9_:ISystemManager = null;
         var _loc10_:DisplayObject = null;
         var _loc11_:Rectangle = null;
         var _loc12_:InterManagerRequest = null;
         if(param1 == mx_internal::showingDropdown)
         {
            return;
         }
         var _loc3_:Point = new Point(0,0);
         _loc3_ = localToGlobal(_loc3_);
         var _loc6_:Tween = null;
         triggerEvent = param2;
         if(param1)
         {
            mx_internal::getDropdown();
            if(dropdownSwatch.parent == null)
            {
               PopUpManager.addPopUp(dropdownSwatch,parent,false);
            }
            else
            {
               PopUpManager.bringToFront(dropdownSwatch);
            }
            dropdownSwatch.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE,dropdownSwatch_mouseDownOutsideHandler);
            dropdownSwatch.addEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE,dropdownSwatch_mouseDownOutsideHandler);
            dropdownSwatch.addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,dropdownSwatch_mouseDownOutsideHandler);
            dropdownSwatch.addEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE,dropdownSwatch_mouseDownOutsideHandler);
            dropdownSwatch.mx_internal::isOpening = true;
            dropdownSwatch.showTextField = showTextField;
            dropdownSwatch.selectedColor = selectedColor;
            dropdownSwatch.owner = this;
            _loc10_ = (_loc9_ = systemManager.topLevelSystemManager).getSandboxRoot();
            if(_loc9_ != _loc10_)
            {
               _loc12_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"getVisibleApplicationRect");
               _loc10_.dispatchEvent(_loc12_);
               _loc11_ = Rectangle(_loc12_.value);
            }
            else
            {
               _loc11_ = _loc9_.getVisibleApplicationRect();
            }
            if(_loc3_.y + height + dropdownGap + dropdownSwatch.height > _loc11_.bottom && _loc3_.y > _loc11_.top + dropdownGap + dropdownSwatch.height)
            {
               _loc3_.y -= dropdownGap + dropdownSwatch.height;
               _loc4_ = -dropdownSwatch.height / scaleY;
               dropdownSwatch.mx_internal::tweenUp = true;
            }
            else
            {
               _loc3_.y += dropdownGap + height;
               _loc4_ = dropdownSwatch.height / scaleY;
               dropdownSwatch.mx_internal::tweenUp = false;
            }
            if(_loc3_.x + dropdownSwatch.width > _loc11_.right && _loc3_.x > _loc11_.left + dropdownSwatch.width)
            {
               _loc3_.x -= dropdownSwatch.width - width;
            }
            _loc3_ = dropdownSwatch.parent.globalToLocal(_loc3_);
            dropdownSwatch.move(_loc3_.x,_loc3_.y);
            mx_internal::isDown = true;
            mx_internal::isOpening = true;
            _loc5_ = 0;
            _loc8_ = getStyle("openDuration");
            _loc7_ = getStyle("openEasingFunction") as Function;
            mx_internal::showingDropdown = param1;
         }
         else
         {
            _loc4_ = 0;
            _loc5_ = dropdownSwatch.mx_internal::tweenUp ? -dropdownSwatch.height / scaleY : dropdownSwatch.height / scaleY;
            mx_internal::isDown = false;
            _loc8_ = getStyle("closeDuration");
            _loc7_ = getStyle("closeEasingFunction") as Function;
            mx_internal::showingDropdown = param1;
            dropdownSwatch.removeEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE,dropdownSwatch_mouseDownOutsideHandler);
            dropdownSwatch.removeEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE,dropdownSwatch_mouseDownOutsideHandler);
            dropdownSwatch.removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,dropdownSwatch_mouseDownOutsideHandler);
            dropdownSwatch.removeEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE,dropdownSwatch_mouseDownOutsideHandler);
            PopUpManager.removePopUp(dropdownSwatch);
         }
         if(dropdownSwatch)
         {
            dropdownSwatch.visible = true;
            dropdownSwatch.enabled = false;
         }
         UIComponentGlobals.mx_internal::layoutManager.validateNow();
         UIComponent.suspendBackgroundProcessing();
         _loc6_ = new Tween(this,_loc4_,_loc5_,_loc8_);
         if(_loc7_ != null)
         {
            _loc6_.easingFunction = _loc7_;
         }
      }
      
      override protected function collectionChangeHandler(param1:Event) : void
      {
         if(!initializing)
         {
            if(dataProvider.length > 0)
            {
               invalidateProperties();
            }
            else
            {
               selectedColor = 0;
               selectedIndex = -1;
            }
            collectionChanged = true;
         }
         if(dropdownSwatch)
         {
            dropdownSwatch.dataProvider = dataProvider;
         }
      }
      
      [Bindable("collectionChange")]
      override public function set dataProvider(param1:Object) : void
      {
         super.dataProvider = param1;
         isModelInited = true;
         if(dropdownSwatch)
         {
            dropdownSwatch.dataProvider = param1;
         }
      }
   }
}
