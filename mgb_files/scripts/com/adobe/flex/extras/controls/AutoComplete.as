package com.adobe.flex.extras.controls
{
   import flash.events.*;
   import flash.net.*;
   import flash.ui.*;
   import mx.collections.*;
   import mx.controls.ComboBox;
   import mx.core.UIComponent;
   
   public class AutoComplete extends ComboBox
   {
       
      
      private var keepLocalHistoryChanged:Boolean = true;
      
      private var _filterFunction:Function;
      
      private var removeHighlight:Boolean = false;
      
      private var tempCollection:Object;
      
      private var cursorPosition:Number = 0;
      
      private var filterFunctionChanged:Boolean = true;
      
      private var _keepLocalHistory:Boolean = false;
      
      private var showDropdown:Boolean = false;
      
      private var _typedText:String = "";
      
      private var usingLocalHistory:Boolean = false;
      
      private var dropdownClosed:Boolean = true;
      
      private var prevIndex:Number = -1;
      
      private var _lookAhead:Boolean = false;
      
      private var lookAheadChanged:Boolean;
      
      private var showingDropdown:Boolean = false;
      
      private var typedTextChanged:Boolean;
      
      public function AutoComplete()
      {
         _filterFunction = defaultFilterFunction;
         super();
         editable = true;
         if(keepLocalHistory)
         {
            addEventListener("focusOut",focusOutHandler);
         }
         setStyle("arrowButtonWidth",0);
         setStyle("fontWeight","normal");
         setStyle("cornerRadius",0);
         setStyle("paddingLeft",0);
         setStyle("paddingRight",0);
         rowCount = 7;
      }
      
      override public function getStyle(param1:String) : *
      {
         if(param1 != "openDuration")
         {
            return super.getStyle(param1);
         }
         if(dropdownClosed)
         {
            return super.getStyle(param1);
         }
         return 0;
      }
      
      override public function set dataProvider(param1:Object) : void
      {
         super.dataProvider = param1;
         if(!usingLocalHistory)
         {
            tempCollection = param1;
         }
      }
      
      private function templateFilterFunction(param1:*) : Boolean
      {
         var _loc2_:Boolean = false;
         if(filterFunction != null)
         {
            _loc2_ = filterFunction(param1,typedText);
         }
         return _loc2_;
      }
      
      private function defaultFilterFunction(param1:*, param2:String) : Boolean
      {
         var _loc3_:String = itemToLabel(param1);
         return _loc3_.toLowerCase().substring(0,param2.length) == param2.toLowerCase();
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         if(keepLocalHistory && dataProvider.length == 0)
         {
            addToLocalHistory();
         }
      }
      
      public function set keepLocalHistory(param1:Boolean) : void
      {
         _keepLocalHistory = param1;
      }
      
      [Bindable("typedTextChange")]
      public function get typedText() : String
      {
         return _typedText;
      }
      
      private function updateDataProvider() : void
      {
         var _loc1_:SharedObject = null;
         dataProvider = tempCollection;
         collection.filterFunction = templateFilterFunction;
         collection.refresh();
         if(collection.length == 0 && keepLocalHistory)
         {
            _loc1_ = SharedObject.getLocal("AutoCompleteData");
            usingLocalHistory = true;
            dataProvider = _loc1_.data.suggestions;
            usingLocalHistory = false;
            collection.filterFunction = templateFilterFunction;
            collection.refresh();
         }
      }
      
      public function set lookAhead(param1:Boolean) : void
      {
         _lookAhead = param1;
         lookAheadChanged = true;
      }
      
      override public function set editable(param1:Boolean) : void
      {
         super.editable = true;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(!dropdown)
         {
            selectedIndex = -1;
         }
         if(dropdown)
         {
            if(typedTextChanged)
            {
               cursorPosition = textInput.selectionBeginIndex;
               updateDataProvider();
               if(collection.length == 0 || typedText == "" || typedText == null)
               {
                  dropdownClosed = true;
                  showDropdown = false;
               }
               else
               {
                  showDropdown = true;
                  selectedIndex = 0;
               }
            }
         }
      }
      
      override public function set labelField(param1:String) : void
      {
         super.labelField = param1;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      [Bindable("keepLocalHistoryChange")]
      public function get keepLocalHistory() : Boolean
      {
         return _keepLocalHistory;
      }
      
      private function addToLocalHistory() : void
      {
         var _loc1_:SharedObject = null;
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         if(id != null && id != "" && text != null && text != "")
         {
            _loc1_ = SharedObject.getLocal("AutoCompleteData");
            _loc2_ = _loc1_.data.suggestions;
            if(_loc2_ == null)
            {
               _loc2_ = new Array();
            }
            _loc3_ = 0;
            _loc4_ = false;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(_loc2_[_loc3_] == text)
               {
                  _loc4_ = true;
                  break;
               }
               _loc3_++;
            }
            if(!_loc4_)
            {
               _loc3_ = 0;
               while(_loc3_ < collection.length)
               {
                  if(defaultFilterFunction(itemToLabel(ListCollectionView(collection).getItemAt(_loc3_)),text))
                  {
                     _loc4_ = true;
                     break;
                  }
                  _loc3_++;
               }
            }
            if(!_loc4_)
            {
               _loc2_.push(text);
            }
            _loc1_.data.suggestions = _loc2_;
            _loc1_.flush();
         }
      }
      
      override protected function textInput_changeHandler(param1:Event) : void
      {
         super.textInput_changeHandler(param1);
         typedText = text;
      }
      
      override protected function measure() : void
      {
         super.measure();
         measuredWidth = UIComponent.DEFAULT_MEASURED_WIDTH;
      }
      
      public function set filterFunction(param1:Function) : void
      {
         if(param1 != null)
         {
            _filterFunction = param1;
            filterFunctionChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            dispatchEvent(new Event("filterFunctionChange"));
         }
         else
         {
            _filterFunction = defaultFilterFunction;
         }
      }
      
      [Bindable("lookAheadChange")]
      public function get lookAhead() : Boolean
      {
         return _lookAhead;
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         super.keyDownHandler(param1);
         if(!param1.ctrlKey)
         {
            if(param1.keyCode == Keyboard.UP && prevIndex == 0)
            {
               textInput.text = _typedText;
               textInput.setSelection(textInput.text.length,textInput.text.length);
               selectedIndex = -1;
            }
            else if(param1.keyCode == Keyboard.ESCAPE && Boolean(showingDropdown))
            {
               textInput.text = _typedText;
               textInput.setSelection(textInput.text.length,textInput.text.length);
               showingDropdown = false;
               dropdownClosed = true;
            }
            else if(param1.keyCode == Keyboard.ENTER)
            {
               if(keepLocalHistory && dataProvider.length == 0)
               {
                  addToLocalHistory();
               }
            }
            else if(lookAhead && param1.keyCode == Keyboard.BACKSPACE || param1.keyCode == Keyboard.DELETE)
            {
               removeHighlight = true;
            }
         }
         else if(param1.ctrlKey && param1.keyCode == Keyboard.UP)
         {
            dropdownClosed = true;
         }
         prevIndex = selectedIndex;
      }
      
      public function set typedText(param1:String) : void
      {
         _typedText = param1;
         typedTextChanged = true;
         invalidateProperties();
         invalidateDisplayList();
         dispatchEvent(new Event("typedTextChange"));
      }
      
      [Bindable("filterFunctionChange")]
      public function get filterFunction() : Function
      {
         return _filterFunction;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         super.updateDisplayList(param1,param2);
         if(selectedIndex == -1)
         {
            textInput.text = typedText;
         }
         if(dropdown)
         {
            if(typedTextChanged)
            {
               if(lookAhead && Boolean(showDropdown) && typedText != "" && !removeHighlight)
               {
                  _loc3_ = itemToLabel(collection[0]);
                  if((_loc4_ = _loc3_.toLowerCase().indexOf(_typedText.toLowerCase())) == 0)
                  {
                     textInput.text = _typedText + _loc3_.substr(_typedText.length);
                     textInput.setSelection(textInput.text.length,_typedText.length);
                  }
                  else
                  {
                     textInput.text = _typedText;
                     textInput.setSelection(cursorPosition,cursorPosition);
                     removeHighlight = false;
                  }
               }
               else
               {
                  textInput.text = _typedText;
                  textInput.setSelection(cursorPosition,cursorPosition);
                  removeHighlight = false;
               }
               typedTextChanged = false;
            }
            else if(typedText)
            {
               textInput.setSelection(_typedText.length,textInput.text.length);
            }
         }
         if(Boolean(showDropdown) && !dropdown.visible)
         {
            super.open();
            showDropdown = false;
            showingDropdown = true;
            if(dropdownClosed)
            {
               dropdownClosed = false;
            }
         }
      }
   }
}
