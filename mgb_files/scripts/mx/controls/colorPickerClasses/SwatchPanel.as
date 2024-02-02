package mx.controls.colorPickerClasses
{
   import flash.events.Event;
   import flash.events.EventPhase;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import mx.collections.ArrayList;
   import mx.collections.IList;
   import mx.controls.ColorPicker;
   import mx.controls.TextInput;
   import mx.core.FlexVersion;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.ColorPickerEvent;
   import mx.managers.IFocusManagerContainer;
   import mx.skins.halo.SwatchPanelSkin;
   import mx.skins.halo.SwatchSkin;
   import mx.styles.StyleManager;
   
   use namespace mx_internal;
   
   public class SwatchPanel extends UIComponent implements IFocusManagerContainer
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var _labelField:String = "label";
      
      private var horizontalGap:Number;
      
      private var previewHeight:Number;
      
      private var border:SwatchPanelSkin;
      
      private var grid:Rectangle;
      
      private var initializing:Boolean = true;
      
      private var _showTextField:Boolean = true;
      
      private var columnCount:int;
      
      private var indexFlag:Boolean = false;
      
      mx_internal var tweenUp:Boolean = false;
      
      private var verticalGap:Number;
      
      private var swatchHeight:Number;
      
      mx_internal var isOverGrid:Boolean = false;
      
      private var itemOffset:Number = 3;
      
      private var _selectedColor:uint = 0;
      
      private var paddingRight:Number;
      
      private var swatchGridBorderSize:Number;
      
      private var paddingTop:Number;
      
      private var cellOffset:Number = 1;
      
      mx_internal var focusedIndex:int = -1;
      
      mx_internal var textInput:TextInput;
      
      private var _dataProvider:IList;
      
      private var paddingBottom:Number;
      
      private var highlight:SwatchSkin;
      
      private var paddingLeft:Number;
      
      private var preview:SwatchSkin;
      
      private var _editable:Boolean = true;
      
      mx_internal var isOpening:Boolean = false;
      
      private var rows:int;
      
      private var lastIndex:int = -1;
      
      private var previewWidth:Number;
      
      private var swatchWidth:Number;
      
      private var swatches:SwatchSkin;
      
      private var _colorField:String = "color";
      
      private var _selectedIndex:int = 0;
      
      private var textFieldWidth:Number;
      
      public function SwatchPanel()
      {
         super();
         addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
         addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
      }
      
      public function set selectedColor(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(!indexFlag)
         {
            _loc2_ = findColorByName(param1);
            if(_loc2_ != -1)
            {
               mx_internal::focusedIndex = findColorByName(param1);
               _selectedIndex = mx_internal::focusedIndex;
            }
            else
            {
               selectedIndex = -1;
            }
         }
         else
         {
            indexFlag = false;
         }
         if(param1 != selectedColor || !mx_internal::isOverGrid || mx_internal::isOpening)
         {
            _selectedColor = param1;
            updateColor(param1);
            if(mx_internal::isOverGrid || mx_internal::isOpening)
            {
               setFocusOnSwatch(selectedIndex);
            }
            if(mx_internal::isOpening)
            {
               mx_internal::isOpening = false;
            }
         }
      }
      
      private function updateColor(param1:uint) : void
      {
         var _loc2_:String = null;
         if(initializing || isNaN(param1))
         {
            return;
         }
         preview.mx_internal::updateSkin(param1);
         if(mx_internal::isOverGrid)
         {
            _loc2_ = null;
            if(mx_internal::focusedIndex >= 0 && typeof dataProvider.getItemAt(mx_internal::focusedIndex) == "object")
            {
               _loc2_ = String(dataProvider.getItemAt(mx_internal::focusedIndex)[labelField]);
            }
            mx_internal::textInput.text = _loc2_ != null && _loc2_.length != 0 ? _loc2_ : rgbToHex(param1);
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(!border)
         {
            border = new SwatchPanelSkin();
            border.styleName = this;
            border.name = "swatchPanelBorder";
            addChild(border);
         }
         if(!preview)
         {
            preview = new SwatchSkin();
            preview.styleName = this;
            preview.mx_internal::color = selectedColor;
            preview.name = "swatchPreview";
            preview.setStyle("swatchBorderSize",0);
            addChild(preview);
         }
         if(!mx_internal::textInput)
         {
            mx_internal::textInput = new TextInput();
            if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
            {
               mx_internal::textInput.styleName = this;
               mx_internal::textInput.setStyle("borderCapColor",9542041);
               mx_internal::textInput.setStyle("buttonColor",7305079);
               mx_internal::textInput.setStyle("highlightColor",12897484);
               mx_internal::textInput.setStyle("shadowColor",12);
               mx_internal::textInput.setStyle("shadowCapColor",14015965);
               mx_internal::textInput.setStyle("borderStyle","inset");
               mx_internal::textInput.setStyle("backgroundColor",16777215);
               mx_internal::textInput.setStyle("borderColor",14015965);
            }
            else
            {
               mx_internal::textInput.styleName = getStyle("textFieldStyleName");
            }
            mx_internal::textInput.editable = _editable;
            mx_internal::textInput.maxChars = 6;
            mx_internal::textInput.name = "inset";
            mx_internal::textInput.text = rgbToHex(selectedColor);
            mx_internal::textInput.restrict = "#xa-fA-F0-9";
            mx_internal::textInput.addEventListener(Event.CHANGE,textInput_changeHandler);
            mx_internal::textInput.addEventListener(KeyboardEvent.KEY_DOWN,textInput_keyDownHandler);
            addChild(mx_internal::textInput);
         }
         if(!swatches)
         {
            swatches = new SwatchSkin();
            swatches.styleName = this;
            swatches.mx_internal::colorField = colorField;
            swatches.name = "swatchGrid";
            swatches.addEventListener(MouseEvent.CLICK,swatches_clickHandler);
            addChild(swatches);
         }
         if(!highlight)
         {
            highlight = new SwatchSkin();
            highlight.styleName = this;
            highlight.visible = false;
            highlight.name = "swatchHighlight";
            addChild(highlight);
         }
         refresh();
         initializing = false;
      }
      
      override public function get height() : Number
      {
         return getExplicitOrMeasuredHeight();
      }
      
      private function textInput_keyDownHandler(param1:KeyboardEvent) : void
      {
         ColorPicker(owner).dispatchEvent(param1);
      }
      
      private function findColorByName(param1:Number) : int
      {
         if(param1 == getColor(selectedIndex))
         {
            return selectedIndex;
         }
         var _loc2_:int = 0;
         while(_loc2_ < length)
         {
            if(param1 == getColor(_loc2_))
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      override public function set height(param1:Number) : void
      {
      }
      
      public function get showTextField() : Boolean
      {
         return _showTextField;
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:ColorPickerEvent = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(ColorPicker(owner).mx_internal::isDown && enabled)
         {
            if(mouseX > grid.left && mouseX < grid.right && mouseY > grid.top && mouseY < grid.bottom)
            {
               _loc3_ = Math.floor((Math.floor(mouseX) - (grid.left + verticalGap)) / (swatchWidth + horizontalGap - cellOffset));
               _loc5_ = (_loc4_ = Math.floor((Math.floor(mouseY) - grid.top) / (swatchHeight + verticalGap - cellOffset))) * columnCount + _loc3_;
               if(_loc3_ == -1)
               {
                  _loc5_++;
               }
               else if(_loc3_ > columnCount - 1)
               {
                  _loc5_--;
               }
               else if(_loc4_ > rows - 1)
               {
                  _loc5_ -= columnCount;
               }
               else if(_loc5_ < 0)
               {
                  _loc5_ += columnCount;
               }
               if((lastIndex != _loc5_ || highlight.visible == false) && _loc5_ < length)
               {
                  if(lastIndex != -1 && lastIndex != _loc5_)
                  {
                     _loc2_ = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OUT);
                     _loc2_.index = lastIndex;
                     _loc2_.color = getColor(lastIndex);
                     dispatchEvent(_loc2_);
                  }
                  mx_internal::focusedIndex = _loc5_;
                  lastIndex = mx_internal::focusedIndex;
                  setFocusOnSwatch(mx_internal::focusedIndex);
                  _loc2_ = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OVER);
                  _loc2_.index = mx_internal::focusedIndex;
                  _loc2_.color = getColor(mx_internal::focusedIndex);
                  dispatchEvent(_loc2_);
               }
            }
            else
            {
               if(highlight.visible == true && mx_internal::isOverGrid && lastIndex != -1)
               {
                  highlight.visible = false;
                  _loc2_ = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OUT);
                  _loc2_.index = lastIndex;
                  _loc2_.color = getColor(lastIndex);
                  dispatchEvent(_loc2_);
               }
               mx_internal::isOverGrid = false;
            }
         }
      }
      
      public function get colorField() : String
      {
         return _colorField;
      }
      
      public function get selectedItem() : Object
      {
         return !!dataProvider ? dataProvider.getItemAt(selectedIndex) : null;
      }
      
      private function textInput_changeHandler(param1:Event) : void
      {
         var _loc2_:String = TextInput(param1.target).text;
         if(_loc2_.charAt(0) == "#")
         {
            mx_internal::textInput.maxChars = 7;
            _loc2_ = "0x" + _loc2_.substring(1);
         }
         else if(_loc2_.substring(0,2) == "0x")
         {
            mx_internal::textInput.maxChars = 8;
         }
         else
         {
            mx_internal::textInput.maxChars = 6;
            _loc2_ = "0x" + _loc2_;
         }
         highlight.visible = false;
         mx_internal::isOverGrid = false;
         selectedColor = Number(_loc2_);
         dispatchEvent(new Event("change"));
      }
      
      public function get editable() : Boolean
      {
         return _editable;
      }
      
      override protected function measure() : void
      {
         super.measure();
         swatches.mx_internal::updateGrid(IList(dataProvider));
         measuredWidth = Math.max(paddingLeft + paddingRight + swatches.width,100);
         measuredHeight = Math.max(paddingTop + previewHeight + itemOffset + paddingBottom + swatches.height,100);
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.eventPhase != EventPhase.AT_TARGET || !enabled)
         {
            return;
         }
         if(mx_internal::focusedIndex == -1 || isNaN(mx_internal::focusedIndex))
         {
            mx_internal::focusedIndex = 0;
         }
         var _loc2_:int = Math.floor(mx_internal::focusedIndex / columnCount);
         switch(param1.keyCode)
         {
            case Keyboard.UP:
               mx_internal::focusedIndex = mx_internal::focusedIndex - columnCount < 0 ? (rows - 1) * columnCount + mx_internal::focusedIndex + 1 : mx_internal::focusedIndex - columnCount;
               mx_internal::isOverGrid = true;
               break;
            case Keyboard.DOWN:
               mx_internal::focusedIndex = mx_internal::focusedIndex + columnCount > length ? mx_internal::focusedIndex - 1 - (rows - 1) * columnCount : mx_internal::focusedIndex + columnCount;
               mx_internal::isOverGrid = true;
               break;
            case Keyboard.LEFT:
               mx_internal::focusedIndex = mx_internal::focusedIndex < 1 ? length - 1 : mx_internal::focusedIndex - 1;
               mx_internal::isOverGrid = true;
               break;
            case Keyboard.RIGHT:
               mx_internal::focusedIndex = mx_internal::focusedIndex >= length - 1 ? 0 : mx_internal::focusedIndex + 1;
               mx_internal::isOverGrid = true;
               break;
            case Keyboard.PAGE_UP:
               mx_internal::focusedIndex -= _loc2_ * columnCount;
               mx_internal::isOverGrid = true;
               break;
            case Keyboard.PAGE_DOWN:
               mx_internal::focusedIndex = mx_internal::focusedIndex + (rows - 1) * columnCount - _loc2_ * columnCount;
               mx_internal::isOverGrid = true;
               break;
            case Keyboard.HOME:
               mx_internal::focusedIndex -= mx_internal::focusedIndex - _loc2_ * columnCount;
               mx_internal::isOverGrid = true;
               break;
            case Keyboard.END:
               mx_internal::focusedIndex = mx_internal::focusedIndex + (_loc2_ * columnCount - mx_internal::focusedIndex) + (columnCount - 1);
               mx_internal::isOverGrid = true;
         }
         if(mx_internal::focusedIndex < length && mx_internal::isOverGrid)
         {
            setFocusOnSwatch(mx_internal::focusedIndex);
            dispatchEvent(new Event("change"));
         }
      }
      
      public function get labelField() : String
      {
         return _labelField;
      }
      
      public function set dataProvider(param1:Object) : void
      {
         var _loc2_:IList = null;
         if(param1 is IList)
         {
            _dataProvider = IList(param1);
         }
         else if(param1 is Array)
         {
            _loc2_ = new ArrayList(param1 as Array);
            param1 = _loc2_;
         }
         else
         {
            _dataProvider = null;
         }
         if(!initializing)
         {
            if(length == 0 || isNaN(length))
            {
               highlight.visible = false;
               _selectedIndex = -1;
            }
            refresh();
         }
      }
      
      public function get selectedColor() : uint
      {
         return _selectedColor;
      }
      
      override public function setFocus() : void
      {
         if(showTextField && editable)
         {
            mx_internal::textInput.setFocus();
            mx_internal::textInput.text = rgbToHex(selectedColor);
         }
      }
      
      public function set showTextField(param1:Boolean) : void
      {
         _showTextField = param1;
         if(!initializing)
         {
            mx_internal::textInput.visible = param1;
         }
      }
      
      override public function set width(param1:Number) : void
      {
      }
      
      public function set selectedItem(param1:Object) : void
      {
         var _loc2_:Number = NaN;
         if(param1 != selectedItem)
         {
            if(typeof param1 == "object")
            {
               _loc2_ = Number(param1[colorField]);
            }
            else if(typeof param1 == "number")
            {
               _loc2_ = Number(param1);
            }
            selectedIndex = findColorByName(_loc2_);
         }
      }
      
      private function getColor(param1:int) : uint
      {
         if(!dataProvider || dataProvider.length < 1 || param1 < 0 || param1 >= length)
         {
            return StyleManager.NOT_A_COLOR;
         }
         return uint(typeof dataProvider.getItemAt(param1) == "object" ? dataProvider.getItemAt(param1)[colorField] : dataProvider.getItemAt(param1));
      }
      
      public function set colorField(param1:String) : void
      {
         _colorField = param1;
      }
      
      private function setFocusOnSwatch(param1:int) : void
      {
         if(param1 < 0 || param1 > length - 1)
         {
            highlight.visible = false;
            return;
         }
         var _loc2_:Number = Math.floor(param1 / columnCount);
         var _loc3_:Number = param1 - _loc2_ * columnCount;
         var _loc4_:Number = swatchWidth * _loc3_ + horizontalGap * _loc3_ - cellOffset * _loc3_ + paddingLeft + swatchGridBorderSize;
         var _loc5_:Number = swatchHeight * _loc2_ + verticalGap * _loc2_ - cellOffset * _loc2_ + paddingTop + previewHeight + itemOffset + swatchGridBorderSize;
         highlight.move(_loc4_,_loc5_);
         highlight.visible = true;
         mx_internal::isOverGrid = true;
         updateColor(getColor(param1));
      }
      
      public function get dataProvider() : Object
      {
         return _dataProvider;
      }
      
      override public function get width() : Number
      {
         return getExplicitOrMeasuredWidth();
      }
      
      public function set editable(param1:Boolean) : void
      {
         _editable = param1;
         if(!initializing)
         {
            mx_internal::textInput.editable = param1;
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         if(!initializing)
         {
            refresh();
         }
      }
      
      public function set labelField(param1:String) : void
      {
         _labelField = param1;
      }
      
      private function swatches_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ColorPickerEvent = null;
         if(!enabled)
         {
            return;
         }
         if(mouseX > grid.left && mouseX < grid.right && mouseY > grid.top && mouseY < grid.bottom)
         {
            selectedIndex = mx_internal::focusedIndex;
            if(ColorPicker(owner).selectedIndex != selectedIndex)
            {
               ColorPicker(owner).selectedIndex = selectedIndex;
               _loc2_ = new ColorPickerEvent(ColorPickerEvent.CHANGE);
               _loc2_.index = selectedIndex;
               _loc2_.color = getColor(selectedIndex);
               ColorPicker(owner).dispatchEvent(_loc2_);
            }
            ColorPicker(owner).close();
         }
      }
      
      private function rgbToHex(param1:uint) : String
      {
         var _loc2_:String = param1.toString(16);
         var _loc3_:String = "00000" + _loc2_;
         var _loc4_:int = _loc3_.length;
         _loc3_ = _loc3_.substring(_loc4_ - 6,_loc4_);
         return _loc3_.toUpperCase();
      }
      
      private function refresh() : void
      {
         updateStyleCache();
         updateDisplayList(unscaledWidth,unscaledHeight);
         invalidateSize();
      }
      
      public function get length() : int
      {
         return !!_dataProvider ? _dataProvider.length : 0;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(param1 != selectedIndex && !initializing)
         {
            mx_internal::focusedIndex = param1;
            _selectedIndex = mx_internal::focusedIndex;
            if(param1 >= 0)
            {
               indexFlag = true;
               selectedColor = getColor(param1);
            }
         }
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
      }
      
      public function get selectedIndex() : int
      {
         return _selectedIndex;
      }
      
      private function updateStyleCache() : void
      {
         horizontalGap = getStyle("horizontalGap");
         verticalGap = getStyle("verticalGap");
         columnCount = getStyle("columnCount");
         paddingLeft = getStyle("paddingLeft");
         paddingRight = getStyle("paddingRight");
         paddingTop = getStyle("paddingTop");
         paddingBottom = getStyle("paddingBottom");
         textFieldWidth = getStyle("textFieldWidth");
         previewWidth = getStyle("previewWidth");
         previewHeight = getStyle("previewHeight");
         swatchWidth = getStyle("swatchWidth");
         swatchHeight = getStyle("swatchHeight");
         swatchGridBorderSize = getStyle("swatchGridBorderSize");
         if(columnCount > length)
         {
            columnCount = length;
         }
         rows = Math.ceil(length / columnCount);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         preview.mx_internal::updateSkin(selectedColor);
         preview.move(paddingLeft,paddingTop);
         mx_internal::textInput.setActualSize(textFieldWidth,previewHeight);
         mx_internal::textInput.move(paddingLeft + previewWidth + itemOffset,paddingTop);
         swatches.mx_internal::updateGrid(IList(dataProvider));
         swatches.move(paddingLeft,paddingTop + previewHeight + itemOffset);
         highlight.mx_internal::updateSkin(0);
         border.setActualSize(param1,param2);
         if(!grid)
         {
            grid = new Rectangle();
         }
         grid.left = swatches.x + swatchGridBorderSize;
         grid.top = swatches.y + swatchGridBorderSize;
         grid.right = swatches.x + swatchGridBorderSize + (swatchWidth - 1) * columnCount + 1 + horizontalGap * (columnCount - 1);
         grid.bottom = swatches.y + swatchGridBorderSize + (swatchHeight - 1) * rows + 1 + verticalGap * (rows - 1);
      }
   }
}
