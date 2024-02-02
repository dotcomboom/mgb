package mx.containers
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import mx.automation.IAutomationObject;
   import mx.containers.accordionClasses.AccordionHeader;
   import mx.controls.Button;
   import mx.core.ClassFactory;
   import mx.core.ComponentDescriptor;
   import mx.core.Container;
   import mx.core.ContainerCreationPolicy;
   import mx.core.EdgeMetrics;
   import mx.core.FlexVersion;
   import mx.core.IDataRenderer;
   import mx.core.IFactory;
   import mx.core.IInvalidating;
   import mx.core.IUIComponent;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.effects.Effect;
   import mx.effects.Tween;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.graphics.RoundedRectangle;
   import mx.managers.HistoryManager;
   import mx.managers.IFocusManagerComponent;
   import mx.managers.IHistoryManagerClient;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   use namespace mx_internal;
   
   public class Accordion extends Container implements IHistoryManagerClient, IFocusManagerComponent
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static const HEADER_NAME_BASE:String = "_header";
       
      
      private var historyManagementEnabledChanged:Boolean = false;
      
      private var layoutStyleChanged:Boolean = false;
      
      private var initialSelectedIndex:int = -1;
      
      private var childAddedOrRemoved:Boolean = false;
      
      private var overlayTargetArea:RoundedRectangle;
      
      private var proposedSelectedIndex:int = -1;
      
      private var accMinWidth:Number;
      
      private var currentDissolveEffect:Effect;
      
      private var accPreferredHeight:Number;
      
      private var tweenContentHeight:Number;
      
      private var tween:Tween;
      
      private var bSliding:Boolean = false;
      
      private var showFocusIndicator:Boolean = false;
      
      private var _focusedIndex:int = -1;
      
      private var _headerRenderer:IFactory;
      
      private var accMinHeight:Number;
      
      private var tweenOldSelectedIndex:int;
      
      private var firstTime:Boolean = true;
      
      private var accPreferredWidth:Number;
      
      private var _historyManagementEnabled:Boolean = true;
      
      private var overlayChild:IUIComponent;
      
      private var tweenNewSelectedIndex:int;
      
      private var bSaveState:Boolean = false;
      
      private var tweenContentWidth:Number;
      
      private var bInLoadState:Boolean = false;
      
      private var _resizeToContent:Boolean = false;
      
      private var tweenViewMetrics:EdgeMetrics;
      
      private var _selectedIndex:int = -1;
      
      public function Accordion()
      {
         super();
         headerRenderer = new ClassFactory(AccordionHeader);
         tabEnabled = true;
         super.clipContent = false;
         addEventListener(ChildExistenceChangedEvent.CHILD_ADD,childAddHandler);
         addEventListener(ChildExistenceChangedEvent.CHILD_REMOVE,childRemoveHandler);
         showInAutomationHierarchy = true;
      }
      
      protected function get contentHeight() : Number
      {
         var _loc1_:Number = unscaledHeight;
         var _loc2_:EdgeMetrics = viewMetricsAndPadding;
         _loc1_ -= _loc2_.top + _loc2_.bottom;
         var _loc3_:Number = getStyle("verticalGap");
         var _loc4_:int = numChildren;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ -= getHeaderAt(_loc5_).height;
            if(_loc5_ > 0)
            {
               _loc1_ -= _loc3_;
            }
            _loc5_++;
         }
         return _loc1_;
      }
      
      private function commitSelectedIndex() : void
      {
         var _loc3_:Class = null;
         var _loc4_:int = 0;
         if(proposedSelectedIndex == -1)
         {
            return;
         }
         var _loc1_:int = proposedSelectedIndex;
         proposedSelectedIndex = -1;
         if(numChildren == 0)
         {
            _selectedIndex = -1;
            return;
         }
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         else if(_loc1_ > numChildren - 1)
         {
            _loc1_ = numChildren - 1;
         }
         var _loc2_:int = _selectedIndex;
         if(_loc1_ == _loc2_)
         {
            return;
         }
         currentDissolveEffect = null;
         if(mx_internal::isEffectStarted)
         {
            _loc3_ = Class(systemManager.getDefinitionByName("mx.effects.effectClasses.DissolveInstance"));
            _loc4_ = 0;
            while(_loc4_ < mx_internal::_effectsStarted.length)
            {
               if(Boolean(_loc3_) && mx_internal::_effectsStarted[_loc4_] is _loc3_)
               {
                  currentDissolveEffect = mx_internal::_effectsStarted[_loc4_].effect;
                  mx_internal::_effectsStarted[_loc4_].end();
                  break;
               }
               _loc4_++;
            }
         }
         if(_focusedIndex != _loc1_)
         {
            drawHeaderFocus(_focusedIndex,false);
         }
         if(_loc2_ != -1)
         {
            getHeaderAt(_loc2_).selected = false;
         }
         _selectedIndex = _loc1_;
         if(initialSelectedIndex == -1)
         {
            initialSelectedIndex = _selectedIndex;
         }
         getHeaderAt(_loc1_).selected = true;
         if(_focusedIndex != _loc1_)
         {
            _focusedIndex = _loc1_;
            drawHeaderFocus(_focusedIndex,showFocusIndicator);
         }
         if(bSaveState)
         {
            HistoryManager.save();
            bSaveState = false;
         }
         if(getStyle("openDuration") == 0 || _loc2_ == -1)
         {
            Container(getChildAt(_loc1_)).setVisible(true);
            Container(getChildAt(_loc1_)).setVisible(false,true);
            if(_loc2_ != -1)
            {
               Container(getChildAt(_loc2_)).setVisible(false);
            }
            instantiateChild(selectedChild);
         }
         else
         {
            if(tween)
            {
               tween.endTween();
            }
            startTween(_loc2_,_loc1_);
         }
      }
      
      private function dispatchChangeEvent(param1:int, param2:int, param3:Event = null) : void
      {
         var _loc4_:IndexChangedEvent;
         (_loc4_ = new IndexChangedEvent(IndexChangedEvent.CHANGE)).oldIndex = param1;
         _loc4_.newIndex = param2;
         _loc4_.relatedObject = getChildAt(param2);
         _loc4_.triggerEvent = param3;
         dispatchEvent(_loc4_);
      }
      
      override public function get clipContent() : Boolean
      {
         return true;
      }
      
      private function labelChangedHandler(param1:Event) : void
      {
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         var _loc3_:int = getChildIndex(_loc2_);
         var _loc4_:Button;
         (_loc4_ = getHeaderAt(_loc3_)).label = Container(param1.target).label;
      }
      
      override public function set clipContent(param1:Boolean) : void
      {
      }
      
      public function getHeaderAt(param1:int) : Button
      {
         return Button(rawChildren.getChildByName(HEADER_NAME_BASE + param1));
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         var _loc3_:int = getChildIndex(param1);
         if(_loc3_ == -1 || param2 < 0)
         {
            return;
         }
         var _loc4_:int = numChildren;
         if(param2 >= _loc4_)
         {
            param2 = _loc4_ - 1;
         }
         if(param2 == _loc3_)
         {
            return;
         }
         var _loc5_:Button;
         if(_loc5_ = getHeaderAt(selectedIndex))
         {
            _loc5_.selected = false;
            drawHeaderFocus(_focusedIndex,false);
         }
         super.setChildIndex(param1,param2);
         shuffleHeaders(_loc3_,param2);
         var _loc6_:Button;
         if(_loc6_ = getHeaderAt(selectedIndex))
         {
            _loc6_.selected = true;
            drawHeaderFocus(_focusedIndex,showFocusIndicator);
         }
         instantiateChild(selectedChild);
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         showFocusIndicator = false;
         if(Boolean(focusManager) && param1.target == this)
         {
            focusManager.defaultButtonEnabled = true;
         }
      }
      
      public function saveState() : Object
      {
         var _loc1_:int = _selectedIndex == -1 ? 0 : _selectedIndex;
         return {"selectedIndex":_loc1_};
      }
      
      private function startTween(param1:int, param2:int) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         bSliding = true;
         tweenViewMetrics = viewMetricsAndPadding;
         tweenContentWidth = calcContentWidth();
         tweenContentHeight = calcContentHeight();
         tweenOldSelectedIndex = param1;
         tweenNewSelectedIndex = param2;
         var _loc3_:Number = getStyle("openDuration");
         tween = new Tween(this,0,tweenContentHeight,_loc3_);
         var _loc4_:Function;
         if((_loc4_ = getStyle("openEasingFunction") as Function) != null)
         {
            tween.easingFunction = _loc4_;
         }
         if(param1 != -1)
         {
            Container(getChildAt(param1)).tweeningProperties = ["x","y","width","height"];
         }
         Container(getChildAt(param2)).tweeningProperties = ["x","y","width","height"];
         var _loc5_:Container;
         if((_loc5_ = Container(getChildAt(param2))).numChildren == 0)
         {
            _loc6_ = getStyle("paddingLeft");
            _loc7_ = borderMetrics.left + (_loc6_ > 0 ? _loc6_ : 0);
            _loc5_.move(_loc7_,_loc5_.y);
            _loc5_.setActualSize(tweenContentWidth,tweenContentHeight);
         }
         UIComponent.suspendBackgroundProcessing();
      }
      
      public function get resizeToContent() : Boolean
      {
         return _resizeToContent;
      }
      
      override mx_internal function removeOverlay() : void
      {
         if(overlayChild)
         {
            UIComponent(overlayChild).mx_internal::removeOverlay();
            overlayChild = null;
         }
      }
      
      [Bindable("valueCommit")]
      public function get selectedChild() : Container
      {
         if(selectedIndex == -1)
         {
            return null;
         }
         return Container(getChildAt(selectedIndex));
      }
      
      override public function set horizontalScrollPolicy(param1:String) : void
      {
      }
      
      override public function createComponentsFromDescriptors(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:ComponentDescriptor = null;
         if(actualCreationPolicy == ContainerCreationPolicy.ALL)
         {
            super.createComponentsFromDescriptors();
            return;
         }
         var _loc2_:int = numChildren;
         if(childDescriptors)
         {
            _loc3_ = int(childDescriptors.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = ComponentDescriptor(childDescriptors[_loc4_]);
               createComponentFromDescriptor(_loc5_,false);
               _loc4_++;
            }
         }
         mx_internal::numChildrenCreated = numChildren - _loc2_;
         processedDescriptors = true;
      }
      
      public function get historyManagementEnabled() : Boolean
      {
         return _historyManagementEnabled;
      }
      
      public function loadState(param1:Object) : void
      {
         var _loc2_:int = !!param1 ? int(param1.selectedIndex) : 0;
         if(_loc2_ == -1)
         {
            _loc2_ = initialSelectedIndex;
         }
         if(_loc2_ == -1)
         {
            _loc2_ = 0;
         }
         if(_loc2_ != _selectedIndex)
         {
            bInLoadState = true;
            selectedIndex = _loc2_;
            bInLoadState = false;
         }
      }
      
      private function shuffleHeaders(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Button = getHeaderAt(param1);
         if(param2 < param1)
         {
            _loc3_ = param1;
            while(_loc3_ > param2)
            {
               getHeaderAt(_loc3_ - 1).name = HEADER_NAME_BASE + _loc3_;
               _loc3_--;
            }
         }
         else
         {
            _loc3_ = param1;
            while(_loc3_ < param2)
            {
               getHeaderAt(_loc3_ + 1).name = HEADER_NAME_BASE + _loc3_;
               _loc3_++;
            }
         }
         _loc4_.name = HEADER_NAME_BASE + param2;
      }
      
      public function set resizeToContent(param1:Boolean) : void
      {
         if(param1 != _resizeToContent)
         {
            _resizeToContent = param1;
            if(param1)
            {
               invalidateSize();
            }
         }
      }
      
      private function instantiateChild(param1:Container) : void
      {
         if(!param1)
         {
            return;
         }
         if(Boolean(param1) && param1.mx_internal::numChildrenCreated == -1)
         {
            param1.createComponentsFromDescriptors();
         }
         invalidateSize();
         invalidateDisplayList();
         if(param1 is IInvalidating)
         {
            IInvalidating(param1).invalidateSize();
         }
      }
      
      override protected function measure() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc13_:Button = null;
         var _loc14_:IUIComponent = null;
         super.measure();
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         _loc3_ = 0;
         _loc4_ = 0;
         var _loc5_:Number = getStyle("paddingLeft");
         var _loc6_:Number = getStyle("paddingRight");
         var _loc7_:Number = getHeaderHeight();
         if(accPreferredWidth && !_resizeToContent && !layoutStyleChanged && !childAddedOrRemoved)
         {
            measuredMinWidth = accMinWidth;
            measuredMinHeight = accMinHeight;
            measuredWidth = accPreferredWidth;
            measuredHeight = accPreferredHeight;
            return;
         }
         layoutStyleChanged = false;
         childAddedOrRemoved = false;
         var _loc8_:int = numChildren;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc13_ = getHeaderAt(_loc9_);
            _loc14_ = IUIComponent(getChildAt(_loc9_));
            _loc1_ = Math.max(_loc1_,_loc13_.minWidth);
            _loc2_ += _loc7_;
            _loc3_ = Math.max(_loc3_,_loc1_);
            _loc4_ += _loc7_;
            if(_loc9_ == selectedIndex)
            {
               _loc3_ = Math.max(_loc3_,_loc14_.getExplicitOrMeasuredWidth());
               _loc4_ += _loc14_.getExplicitOrMeasuredHeight();
               _loc1_ = Math.max(_loc1_,_loc14_.minWidth);
               _loc2_ += _loc14_.minHeight;
            }
            _loc9_++;
         }
         var _loc10_:EdgeMetrics;
         var _loc11_:Number = (_loc10_ = viewMetricsAndPadding).left + _loc10_.right;
         var _loc12_:Number = _loc10_.top + _loc10_.bottom;
         if(_loc5_ < 0)
         {
            _loc11_ -= _loc5_;
         }
         if(_loc6_ < 0)
         {
            _loc11_ -= _loc6_;
         }
         _loc1_ += _loc11_;
         _loc3_ += _loc11_;
         _loc2_ += _loc12_;
         _loc4_ += _loc12_;
         measuredMinWidth = _loc1_;
         measuredMinHeight = _loc2_;
         measuredWidth = _loc3_;
         measuredHeight = _loc4_;
         if(Boolean(selectedChild) && Container(selectedChild).mx_internal::numChildrenCreated == -1)
         {
            return;
         }
         if(numChildren == 0)
         {
            return;
         }
         accMinWidth = _loc1_;
         accMinHeight = _loc2_;
         accPreferredWidth = _loc3_;
         accPreferredHeight = _loc4_;
      }
      
      private function drawHeaderFocus(param1:int, param2:Boolean) : void
      {
         if(param1 != -1)
         {
            getHeaderAt(param1).drawFocus(param2);
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.target != this)
         {
            return;
         }
         var _loc2_:int = selectedIndex;
         switch(param1.keyCode)
         {
            case Keyboard.PAGE_DOWN:
               drawHeaderFocus(_focusedIndex,false);
               _focusedIndex = selectedIndex = selectedIndex < numChildren - 1 ? selectedIndex + 1 : 0;
               drawHeaderFocus(_focusedIndex,true);
               param1.stopPropagation();
               dispatchChangeEvent(_loc2_,selectedIndex,param1);
               break;
            case Keyboard.PAGE_UP:
               drawHeaderFocus(_focusedIndex,false);
               _focusedIndex = selectedIndex = selectedIndex > 0 ? selectedIndex - 1 : numChildren - 1;
               drawHeaderFocus(_focusedIndex,true);
               param1.stopPropagation();
               dispatchChangeEvent(_loc2_,selectedIndex,param1);
               break;
            case Keyboard.HOME:
               drawHeaderFocus(_focusedIndex,false);
               _focusedIndex = selectedIndex = 0;
               drawHeaderFocus(_focusedIndex,true);
               param1.stopPropagation();
               dispatchChangeEvent(_loc2_,selectedIndex,param1);
               break;
            case Keyboard.END:
               drawHeaderFocus(_focusedIndex,false);
               _focusedIndex = selectedIndex = numChildren - 1;
               drawHeaderFocus(_focusedIndex,true);
               param1.stopPropagation();
               dispatchChangeEvent(_loc2_,selectedIndex,param1);
               break;
            case Keyboard.DOWN:
            case Keyboard.RIGHT:
               drawHeaderFocus(_focusedIndex,false);
               _focusedIndex = _focusedIndex < numChildren - 1 ? _focusedIndex + 1 : 0;
               drawHeaderFocus(_focusedIndex,true);
               param1.stopPropagation();
               break;
            case Keyboard.UP:
            case Keyboard.LEFT:
               drawHeaderFocus(_focusedIndex,false);
               _focusedIndex = _focusedIndex > 0 ? _focusedIndex - 1 : numChildren - 1;
               drawHeaderFocus(_focusedIndex,true);
               param1.stopPropagation();
               break;
            case Keyboard.SPACE:
            case Keyboard.ENTER:
               param1.stopPropagation();
               if(_focusedIndex != selectedIndex)
               {
                  selectedIndex = _focusedIndex;
                  dispatchChangeEvent(_loc2_,selectedIndex,param1);
               }
         }
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         super.focusInHandler(param1);
         showFocusIndicator = focusManager.showFocusIndicator;
         if(param1.target == this)
         {
            focusManager.defaultButtonEnabled = false;
         }
      }
      
      override mx_internal function addOverlay(param1:uint, param2:RoundedRectangle = null) : void
      {
         if(overlayChild)
         {
            mx_internal::removeOverlay();
         }
         overlayChild = selectedChild as IUIComponent;
         if(!overlayChild)
         {
            return;
         }
         mx_internal::overlayColor = param1;
         overlayTargetArea = param2;
         if(Boolean(selectedChild) && selectedChild.mx_internal::numChildrenCreated == -1)
         {
            selectedChild.addEventListener(FlexEvent.INITIALIZE,initializeHandler);
         }
         else
         {
            initializeHandler(null);
         }
      }
      
      [Bindable("headerRendererChanged")]
      public function get headerRenderer() : IFactory
      {
         return _headerRenderer;
      }
      
      private function childRemoveHandler(param1:ChildExistenceChangedEvent) : void
      {
         var _loc4_:int = 0;
         var _loc8_:Button = null;
         childAddedOrRemoved = true;
         if(numChildren == 0)
         {
            return;
         }
         var _loc2_:DisplayObject = param1.relatedObject;
         var _loc3_:int = selectedIndex;
         var _loc5_:int = getChildIndex(_loc2_);
         _loc2_.removeEventListener("labelChanged",labelChangedHandler);
         _loc2_.removeEventListener("iconChanged",iconChangedHandler);
         var _loc6_:int = numChildren - 1;
         rawChildren.removeChild(getHeaderAt(_loc5_));
         var _loc7_:int = _loc5_;
         while(_loc7_ < _loc6_)
         {
            getHeaderAt(_loc7_ + 1).name = HEADER_NAME_BASE + _loc7_;
            _loc7_++;
         }
         if(_loc6_ == 0)
         {
            _loc4_ = _focusedIndex = -1;
         }
         else
         {
            if(_loc5_ > selectedIndex)
            {
               return;
            }
            if(_loc5_ < selectedIndex)
            {
               _loc4_ = _loc3_ - 1;
            }
            else if(_loc5_ == selectedIndex)
            {
               if(_loc5_ == _loc6_)
               {
                  if((_loc4_ = _loc3_ - 1) != -1)
                  {
                     instantiateChild(Container(getChildAt(_loc4_)));
                  }
               }
               else
               {
                  _loc4_ = _loc3_;
                  instantiateChild(Container(getChildAt(_loc4_ + 1)));
               }
               (_loc8_ = getHeaderAt(_loc4_)).selected = true;
            }
         }
         if(_focusedIndex > _loc5_)
         {
            --_focusedIndex;
            drawHeaderFocus(_focusedIndex,showFocusIndicator);
         }
         else if(_focusedIndex == _loc5_)
         {
            if(_loc5_ == _loc6_)
            {
               --_focusedIndex;
            }
            drawHeaderFocus(_focusedIndex,showFocusIndicator);
         }
         _selectedIndex = _loc4_;
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      override public function set autoLayout(param1:Boolean) : void
      {
      }
      
      mx_internal function onTweenEnd(param1:Number) : void
      {
         var _loc9_:Container = null;
         var _loc12_:Button = null;
         bSliding = false;
         var _loc2_:int = tweenOldSelectedIndex;
         var _loc3_:EdgeMetrics = tweenViewMetrics;
         var _loc4_:Number = getStyle("verticalGap");
         var _loc5_:Number = getHeaderHeight();
         var _loc6_:Number = calcContentWidth();
         var _loc7_:Number = calcContentHeight();
         var _loc8_:Number = _loc3_.top;
         var _loc10_:int = numChildren;
         var _loc11_:int = 0;
         while(_loc11_ < _loc10_)
         {
            (_loc12_ = getHeaderAt(_loc11_)).mx_internal::$y = _loc8_;
            _loc8_ += _loc5_;
            if(_loc11_ == selectedIndex)
            {
               (_loc9_ = Container(getChildAt(_loc11_))).cacheAsBitmap = false;
               _loc9_.scrollRect = null;
               _loc9_.visible = true;
               _loc8_ += _loc7_;
            }
            _loc8_ += _loc4_;
            _loc11_++;
         }
         if(_loc2_ != -1)
         {
            (_loc9_ = Container(getChildAt(_loc2_))).cacheAsBitmap = false;
            _loc9_.scrollRect = null;
            _loc9_.visible = false;
            _loc9_.tweeningProperties = null;
         }
         tweenViewMetrics = null;
         tweenContentWidth = NaN;
         tweenContentHeight = NaN;
         tweenOldSelectedIndex = 0;
         tweenNewSelectedIndex = 0;
         tween = null;
         UIComponent.resumeBackgroundProcessing();
         Container(getChildAt(selectedIndex)).tweeningProperties = null;
         if(currentDissolveEffect)
         {
            if(currentDissolveEffect.target != null)
            {
               currentDissolveEffect.play();
            }
            else
            {
               currentDissolveEffect.play([this]);
            }
         }
         callLater(instantiateChild,[selectedChild]);
      }
      
      public function set selectedChild(param1:Container) : void
      {
         var _loc2_:int = getChildIndex(DisplayObject(param1));
         if(_loc2_ >= 0 && _loc2_ < numChildren)
         {
            selectedIndex = _loc2_;
         }
      }
      
      private function getHeaderHeight() : Number
      {
         var _loc1_:Number = getStyle("headerHeight");
         if(isNaN(_loc1_))
         {
            _loc1_ = 0;
            if(numChildren > 0)
            {
               _loc1_ = getHeaderAt(0).measuredHeight;
            }
         }
         return _loc1_;
      }
      
      public function set historyManagementEnabled(param1:Boolean) : void
      {
         if(param1 != _historyManagementEnabled)
         {
            _historyManagementEnabled = param1;
            historyManagementEnabledChanged = true;
            invalidateProperties();
         }
      }
      
      private function initializeHandler(param1:FlexEvent) : void
      {
         UIComponent(overlayChild).mx_internal::addOverlay(mx_internal::overlayColor,overlayTargetArea);
      }
      
      mx_internal function get focusedIndex() : int
      {
         return _focusedIndex;
      }
      
      override public function get horizontalScrollPolicy() : String
      {
         return ScrollPolicy.OFF;
      }
      
      private function childAddHandler(param1:ChildExistenceChangedEvent) : void
      {
         var _loc3_:Button = null;
         childAddedOrRemoved = true;
         var _loc2_:DisplayObject = param1.relatedObject;
         _loc2_.visible = false;
         createHeader(_loc2_,getChildIndex(_loc2_));
         _loc2_.addEventListener("labelChanged",labelChangedHandler,false,0,true);
         _loc2_.addEventListener("iconChanged",iconChangedHandler,false,0,true);
         if(numChildren == 1 && proposedSelectedIndex == -1)
         {
            selectedIndex = 0;
            _loc3_ = getHeaderAt(0);
            _loc3_.selected = true;
            _focusedIndex = 0;
            drawHeaderFocus(_focusedIndex,showFocusIndicator);
         }
         if(_loc2_ as IAutomationObject)
         {
            IAutomationObject(_loc2_).showInAutomationHierarchy = true;
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         if(historyManagementEnabled)
         {
            HistoryManager.register(this);
         }
      }
      
      private function calcContentHeight() : Number
      {
         var _loc1_:Number = unscaledHeight;
         var _loc2_:EdgeMetrics = viewMetricsAndPadding;
         _loc1_ -= _loc2_.top + _loc2_.bottom;
         var _loc3_:Number = getStyle("verticalGap");
         var _loc4_:Number = getHeaderHeight();
         var _loc5_:int = numChildren;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc1_ -= _loc4_;
            if(_loc6_ > 0)
            {
               _loc1_ -= _loc3_;
            }
            _loc6_++;
         }
         return _loc1_;
      }
      
      mx_internal function onTweenUpdate(param1:Number) : void
      {
         var _loc15_:Button = null;
         var _loc16_:Container = null;
         var _loc2_:EdgeMetrics = tweenViewMetrics;
         var _loc3_:Number = tweenContentWidth;
         var _loc4_:Number = tweenContentHeight;
         var _loc5_:int = tweenOldSelectedIndex;
         var _loc6_:int = tweenNewSelectedIndex;
         var _loc7_:Number = param1;
         var _loc8_:Number = _loc4_ - param1;
         var _loc9_:Number = _loc5_ < _loc6_ ? -_loc7_ : _loc7_;
         var _loc10_:Number = _loc6_ > _loc5_ ? _loc8_ : -_loc8_;
         var _loc11_:Number = _loc2_.top;
         var _loc12_:Number = getStyle("verticalGap");
         var _loc13_:int = numChildren;
         var _loc14_:int = 0;
         while(_loc14_ < _loc13_)
         {
            _loc15_ = getHeaderAt(_loc14_);
            _loc16_ = Container(getChildAt(_loc14_));
            _loc15_.mx_internal::$y = _loc11_;
            _loc11_ += _loc15_.height;
            if(_loc14_ == _loc5_)
            {
               _loc16_.cacheAsBitmap = true;
               _loc16_.scrollRect = new Rectangle(0,-_loc9_,_loc3_,_loc4_);
               _loc16_.visible = true;
               _loc11_ += _loc8_;
            }
            else if(_loc14_ == _loc6_)
            {
               _loc16_.cacheAsBitmap = true;
               _loc16_.scrollRect = new Rectangle(0,-_loc10_,_loc3_,_loc4_);
               _loc16_.visible = true;
               _loc11_ += _loc7_;
            }
            _loc11_ += _loc12_;
            _loc14_++;
         }
      }
      
      private function removedFromStageHandler(param1:Event) : void
      {
         HistoryManager.unregister(this);
      }
      
      private function createHeader(param1:DisplayObject, param2:int) : void
      {
         var _loc5_:CSSStyleDeclaration = null;
         var _loc6_:Container = null;
         var _loc7_:String = null;
         if(selectedIndex != -1 && Boolean(getHeaderAt(selectedIndex)))
         {
            getHeaderAt(selectedIndex).selected = false;
         }
         var _loc3_:Button = Button(headerRenderer.newInstance());
         _loc3_.name = HEADER_NAME_BASE + (numChildren - 1);
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
         {
            _loc3_.styleName = this;
         }
         var _loc4_:String;
         if(_loc4_ = getStyle("headerStyleName"))
         {
            if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
            {
               if(_loc5_ = StyleManager.getStyleDeclaration("." + _loc4_))
               {
                  _loc3_.styleDeclaration = _loc5_;
               }
            }
            else
            {
               _loc3_.styleName = _loc4_;
            }
         }
         _loc3_.addEventListener(MouseEvent.CLICK,headerClickHandler);
         IDataRenderer(_loc3_).data = param1;
         if(param1 is Container)
         {
            _loc6_ = Container(param1);
            _loc3_.label = _loc6_.label;
            if(_loc6_.icon)
            {
               _loc3_.setStyle("icon",_loc6_.icon);
            }
            if((Boolean(_loc7_ = _loc6_.toolTip)) && _loc7_ != "")
            {
               _loc3_.toolTip = _loc7_;
               _loc6_.toolTip = null;
            }
         }
         rawChildren.addChild(_loc3_);
         if(param2 != numChildren - 1)
         {
            shuffleHeaders(numChildren - 1,param2);
         }
         if(selectedIndex != -1 && Boolean(getHeaderAt(selectedIndex)))
         {
            getHeaderAt(selectedIndex).selected = true;
         }
      }
      
      override public function get autoLayout() : Boolean
      {
         return true;
      }
      
      override public function get baselinePosition() : Number
      {
         var _loc4_:Container = null;
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
         {
            return super.baselinePosition;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         var _loc1_:* = numChildren == 0;
         if(_loc1_)
         {
            _loc4_ = new Container();
            addChild(_loc4_);
            validateNow();
         }
         var _loc2_:Button = getHeaderAt(0);
         var _loc3_:Number = _loc2_.y + _loc2_.baselinePosition;
         if(_loc1_)
         {
            removeChildAt(0);
            validateNow();
         }
         return _loc3_;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Button = null;
         var _loc4_:CSSStyleDeclaration = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         super.styleChanged(param1);
         if(!param1 || param1 == "headerStyleName" || param1 == "styleName")
         {
            _loc2_ = getStyle("headerStyleName");
            if(_loc2_)
            {
               if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
               {
                  if(_loc4_ = StyleManager.getStyleDeclaration("." + _loc2_))
                  {
                     _loc5_ = 0;
                     while(_loc5_ < numChildren)
                     {
                        _loc3_ = getHeaderAt(_loc5_);
                        if(_loc3_)
                        {
                           _loc3_.styleDeclaration = _loc4_;
                           _loc3_.regenerateStyleCache(true);
                           _loc3_.styleChanged(null);
                        }
                        _loc5_++;
                     }
                  }
               }
               else
               {
                  _loc6_ = 0;
                  while(_loc6_ < numChildren)
                  {
                     _loc3_ = getHeaderAt(_loc6_);
                     if(_loc3_)
                     {
                        _loc3_.styleName = _loc2_;
                     }
                     _loc6_++;
                  }
               }
            }
         }
         else if(StyleManager.isSizeInvalidatingStyle(param1))
         {
            layoutStyleChanged = true;
         }
      }
      
      private function calcContentWidth() : Number
      {
         var _loc1_:Number = unscaledWidth;
         var _loc2_:EdgeMetrics = viewMetricsAndPadding;
         return _loc1_ - (_loc2_.left + _loc2_.right);
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(historyManagementEnabledChanged)
         {
            if(historyManagementEnabled)
            {
               HistoryManager.register(this);
            }
            else
            {
               HistoryManager.unregister(this);
            }
            historyManagementEnabledChanged = false;
         }
         commitSelectedIndex();
         if(firstTime)
         {
            firstTime = false;
            addEventListener(Event.ADDED_TO_STAGE,addedToStageHandler,false,0,true);
            addEventListener(Event.REMOVED_FROM_STAGE,removedFromStageHandler,false,0,true);
         }
      }
      
      protected function get contentWidth() : Number
      {
         var _loc1_:Number = unscaledWidth;
         var _loc2_:EdgeMetrics = viewMetricsAndPadding;
         _loc1_ -= _loc2_.left + _loc2_.right;
         return _loc1_ - (getStyle("paddingLeft") + getStyle("paddingRight"));
      }
      
      private function headerClickHandler(param1:Event) : void
      {
         var _loc2_:Button = Button(param1.currentTarget);
         var _loc3_:int = selectedIndex;
         selectedChild = Container(IDataRenderer(_loc2_).data);
         var _loc4_:int = selectedIndex;
         if(_loc3_ != _loc4_)
         {
            dispatchChangeEvent(_loc3_,_loc4_,param1);
         }
      }
      
      private function iconChangedHandler(param1:Event) : void
      {
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         var _loc3_:int = getChildIndex(_loc2_);
         var _loc4_:Button;
         (_loc4_ = getHeaderAt(_loc3_)).setStyle("icon",Container(param1.target).icon);
      }
      
      public function set headerRenderer(param1:IFactory) : void
      {
         _headerRenderer = param1;
         dispatchEvent(new Event("headerRendererChanged"));
      }
      
      override public function set verticalScrollPolicy(param1:String) : void
      {
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(param1 == -1)
         {
            return;
         }
         if(param1 == _selectedIndex)
         {
            return;
         }
         proposedSelectedIndex = param1;
         invalidateProperties();
         if(historyManagementEnabled && _selectedIndex != -1 && !bInLoadState)
         {
            bSaveState = true;
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      override public function get verticalScrollPolicy() : String
      {
         return ScrollPolicy.OFF;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc17_:Button = null;
         var _loc18_:IUIComponent = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         super.updateDisplayList(param1,param2);
         if(tween)
         {
            return;
         }
         var _loc3_:EdgeMetrics = borderMetrics;
         var _loc4_:Number = getStyle("paddingLeft");
         var _loc5_:Number = getStyle("paddingRight");
         var _loc6_:Number = getStyle("paddingTop");
         var _loc7_:Number = getStyle("verticalGap");
         var _loc8_:Number = calcContentWidth();
         var _loc9_:Number = calcContentHeight();
         var _loc10_:Number = _loc3_.left + _loc4_;
         var _loc11_:Number = _loc3_.top + _loc6_;
         var _loc12_:Number = _loc10_;
         var _loc13_:Number = _loc8_;
         var _loc14_:Number = getHeaderHeight();
         if(_loc4_ < 0)
         {
            _loc12_ -= _loc4_;
            _loc13_ += _loc4_;
         }
         if(_loc5_ < 0)
         {
            _loc13_ += _loc5_;
         }
         var _loc15_:int = numChildren;
         var _loc16_:int = 0;
         while(_loc16_ < _loc15_)
         {
            _loc17_ = getHeaderAt(_loc16_);
            _loc18_ = IUIComponent(getChildAt(_loc16_));
            _loc17_.move(_loc10_,_loc11_);
            _loc17_.setActualSize(_loc8_,_loc14_);
            _loc11_ += _loc14_;
            if(_loc16_ == selectedIndex)
            {
               _loc18_.move(_loc12_,_loc11_);
               _loc18_.visible = true;
               _loc19_ = _loc13_;
               _loc20_ = _loc9_;
               if(!isNaN(_loc18_.percentWidth))
               {
                  if(_loc19_ > _loc18_.maxWidth)
                  {
                     _loc19_ = Number(_loc18_.maxWidth);
                  }
               }
               else if(_loc19_ > _loc18_.getExplicitOrMeasuredWidth())
               {
                  _loc19_ = Number(_loc18_.getExplicitOrMeasuredWidth());
               }
               if(!isNaN(_loc18_.percentHeight))
               {
                  if(_loc20_ > _loc18_.maxHeight)
                  {
                     _loc20_ = Number(_loc18_.maxHeight);
                  }
               }
               else if(_loc20_ > _loc18_.getExplicitOrMeasuredHeight())
               {
                  _loc20_ = Number(_loc18_.getExplicitOrMeasuredHeight());
               }
               if(_loc18_.width != _loc19_ || _loc18_.height != _loc20_)
               {
                  _loc18_.setActualSize(_loc19_,_loc20_);
               }
               _loc11_ += _loc9_;
            }
            else
            {
               _loc18_.move(_loc12_,_loc16_ < selectedIndex ? _loc11_ : _loc11_ - _loc9_);
               _loc18_.visible = false;
            }
            _loc11_ += _loc7_;
            _loc16_++;
         }
         if(mx_internal::blocker)
         {
            rawChildren.setChildIndex(mx_internal::blocker,numChildren - 1);
         }
         drawHeaderFocus(_focusedIndex,showFocusIndicator);
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         drawHeaderFocus(_focusedIndex,param1);
      }
      
      [Bindable("valueCommit")]
      public function get selectedIndex() : int
      {
         if(proposedSelectedIndex != -1)
         {
            return proposedSelectedIndex;
         }
         return _selectedIndex;
      }
      
      override mx_internal function setActualCreationPolicies(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.mx_internal::setActualCreationPolicies(param1);
         if(param1 == ContainerCreationPolicy.ALL && numChildren > 0)
         {
            _loc2_ = numChildren;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               Container(getChildAt(_loc3_)).createComponentsFromDescriptors();
               _loc3_++;
            }
         }
      }
   }
}
