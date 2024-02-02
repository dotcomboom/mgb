package mx.effects.effectClasses
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   import mx.controls.SWFLoader;
   import mx.core.Container;
   import mx.core.FlexShape;
   import mx.core.IInvalidating;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   import mx.effects.EffectInstance;
   import mx.effects.EffectManager;
   import mx.effects.Tween;
   import mx.events.FlexEvent;
   import mx.events.ResizeEvent;
   import mx.events.TweenEvent;
   
   use namespace mx_internal;
   
   public class MaskEffectInstance extends EffectInstance
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var useSnapshotBounds:Boolean = true;
      
      public var scaleEasingFunction:Function;
      
      public var xTo:Number;
      
      private var _showTarget:Boolean = true;
      
      private var stoppedEarly:Boolean = false;
      
      public var scaleXFrom:Number;
      
      public var scaleYFrom:Number;
      
      protected var effectMask:Shape;
      
      private var _createMaskFunction:Function;
      
      private var moveTween:Tween;
      
      public var scaleYTo:Number;
      
      private var scaleTween:Tween;
      
      public var xFrom:Number;
      
      public var yFrom:Number;
      
      public var targetArea:Rectangle;
      
      protected var targetVisualBounds:Rectangle;
      
      private var invalidateBorder:Boolean = false;
      
      private var origMask:DisplayObject;
      
      private var currentMoveTweenValue:Object;
      
      private var dispatchedStartEvent:Boolean = false;
      
      mx_internal var persistAfterEnd:Boolean = false;
      
      public var moveEasingFunction:Function;
      
      public var yTo:Number;
      
      private var _showExplicitlySet:Boolean = false;
      
      public var scaleXTo:Number;
      
      private var tweenCount:int = 0;
      
      private var origScrollRect:Rectangle;
      
      private var currentScaleTweenValue:Object;
      
      private var effectMaskRefCount:Number = 0;
      
      private var MASK_NAME:String = "_maskEffectMask";
      
      public function MaskEffectInstance(param1:Object)
      {
         super(param1);
      }
      
      override public function get playheadTime() : Number
      {
         var _loc1_:Number = NaN;
         if(moveTween)
         {
            _loc1_ = moveTween.mx_internal::playheadTime;
         }
         else
         {
            if(!scaleTween)
            {
               return 0;
            }
            _loc1_ = scaleTween.mx_internal::playheadTime;
         }
         return _loc1_ + super.playheadTime;
      }
      
      public function set createMaskFunction(param1:Function) : void
      {
         _createMaskFunction = param1;
      }
      
      override public function stop() : void
      {
         stoppedEarly = true;
         super.stop();
         if(moveTween)
         {
            moveTween.stop();
         }
         if(scaleTween)
         {
            scaleTween.stop();
         }
      }
      
      override public function finishEffect() : void
      {
         target.removeEventListener(ResizeEvent.RESIZE,mx_internal::eventHandler);
         if(!mx_internal::persistAfterEnd && !stoppedEarly)
         {
            removeMask();
         }
         super.finishEffect();
      }
      
      private function removeMask() : void
      {
         if(--effectMaskRefCount == 0)
         {
            if(origMask == null || origMask && origMask.name != MASK_NAME)
            {
               target.mask = origMask;
            }
            if(origScrollRect)
            {
               target.scrollRect = origScrollRect;
            }
            if(target is Container)
            {
               target.rawChildren.removeChild(effectMask);
            }
            else
            {
               target.removeChild(effectMask);
            }
            effectMask = null;
         }
      }
      
      private function initMask() : void
      {
         if(!effectMask)
         {
            if(useSnapshotBounds)
            {
               targetVisualBounds = getVisibleBounds(DisplayObject(target));
            }
            else
            {
               targetVisualBounds = new Rectangle(0,0,target.width,target.height);
            }
            effectMask = createMaskFunction(target,targetVisualBounds);
            if(target is Container)
            {
               target.rawChildren.addChild(effectMask);
            }
            else
            {
               target.addChild(effectMask);
            }
            effectMask.name = MASK_NAME;
            effectMaskRefCount = 0;
         }
         effectMask.x = 0;
         effectMask.y = 0;
         effectMask.alpha = 0.3;
         effectMask.visible = false;
         if(effectMaskRefCount++ == 0)
         {
            if(target.mask)
            {
               origMask = target.mask;
            }
            target.mask = effectMask;
            if(target.scrollRect)
            {
               origScrollRect = target.scrollRect;
               target.scrollRect = null;
            }
         }
         invalidateBorder = target is Container && Container(target).mx_internal::border != null && Container(target).mx_internal::border is IInvalidating && DisplayObject(Container(target).mx_internal::border).filters != null;
      }
      
      protected function onMoveTweenUpdate(param1:Object) : void
      {
         saveTweenValue(param1,null);
         if(effectMask)
         {
            effectMask.x = param1[0];
            effectMask.y = param1[1];
         }
         if(invalidateBorder)
         {
            IInvalidating(Container(target).mx_internal::border).invalidateDisplayList();
         }
      }
      
      private function finishTween() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Object = null;
         if(tweenCount == 0 || --tweenCount == 0)
         {
            EffectManager.mx_internal::endVectorEffect(IUIComponent(target));
            _loc1_ = [];
            if(moveTween)
            {
               _loc2_ = moveTween.mx_internal::getCurrentValue(duration);
               _loc1_.push(_loc2_[0]);
               _loc1_.push(_loc2_[1]);
            }
            else
            {
               _loc1_.push(null);
               _loc1_.push(null);
            }
            if(scaleTween)
            {
               _loc2_ = scaleTween.mx_internal::getCurrentValue(duration);
               _loc1_.push(_loc2_[0]);
               _loc1_.push(_loc2_[1]);
            }
            else
            {
               _loc1_.push(null);
               _loc1_.push(null);
            }
            dispatchEvent(new TweenEvent(TweenEvent.TWEEN_END,false,false,_loc1_));
            finishRepeat();
         }
      }
      
      override public function startEffect() : void
      {
         initMask();
         target.addEventListener(ResizeEvent.RESIZE,mx_internal::eventHandler);
         super.startEffect();
      }
      
      public function get createMaskFunction() : Function
      {
         return _createMaskFunction != null ? _createMaskFunction : defaultCreateMask;
      }
      
      protected function defaultCreateMask(param1:Object, param2:Rectangle) : Shape
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc3_:Number = param2.width / Math.abs(param1.scaleX);
         var _loc4_:Number = param2.height / Math.abs(param1.scaleY);
         if(param1 is SWFLoader)
         {
            param1.validateDisplayList();
            if(param1.content)
            {
               _loc3_ = Number(param1.contentWidth);
               _loc4_ = Number(param1.contentHeight);
            }
         }
         var _loc6_:Graphics;
         var _loc5_:Shape;
         (_loc6_ = (_loc5_ = new FlexShape()).graphics).beginFill(16776960);
         _loc6_.drawRect(0,0,_loc3_,_loc4_);
         _loc6_.endFill();
         if(target.rotation == 0)
         {
            _loc5_.width = _loc3_;
            _loc5_.height = _loc4_;
         }
         else
         {
            _loc7_ = param1.rotation * Math.PI / 180;
            _loc8_ = Math.sin(_loc7_);
            _loc9_ = Math.cos(_loc7_);
            _loc5_.width = Math.abs(_loc3_ * _loc9_ - _loc4_ * _loc8_);
            _loc5_.height = Math.abs(_loc3_ * _loc8_ + _loc4_ * _loc9_);
         }
         return _loc5_;
      }
      
      private function saveTweenValue(param1:Object, param2:Object) : void
      {
         var _loc3_:Array = null;
         if(param1 != null)
         {
            currentMoveTweenValue = param1;
         }
         else if(param2 != null)
         {
            currentScaleTweenValue = param2;
         }
         if((moveTween == null || currentMoveTweenValue != null) && (scaleTween == null || currentScaleTweenValue != null))
         {
            _loc3_ = [];
            if(currentMoveTweenValue)
            {
               _loc3_.push(currentMoveTweenValue[0]);
               _loc3_.push(currentMoveTweenValue[1]);
            }
            else
            {
               _loc3_.push(null);
               _loc3_.push(null);
            }
            if(currentScaleTweenValue)
            {
               _loc3_.push(currentScaleTweenValue[0]);
               _loc3_.push(currentScaleTweenValue[1]);
            }
            else
            {
               _loc3_.push(null);
               _loc3_.push(null);
            }
            if(!dispatchedStartEvent)
            {
               dispatchEvent(new TweenEvent(TweenEvent.TWEEN_START));
               dispatchedStartEvent = true;
            }
            dispatchEvent(new TweenEvent(TweenEvent.TWEEN_UPDATE,false,false,_loc3_));
            currentMoveTweenValue = null;
            currentScaleTweenValue = null;
         }
      }
      
      override mx_internal function set playReversed(param1:Boolean) : void
      {
         if(moveTween)
         {
            moveTween.mx_internal::playReversed = param1;
         }
         if(scaleTween)
         {
            scaleTween.mx_internal::playReversed = param1;
         }
         super.mx_internal::playReversed = param1;
      }
      
      override public function play() : void
      {
         super.play();
         initMaskEffect();
         EffectManager.mx_internal::startVectorEffect(IUIComponent(target));
         if(!isNaN(xFrom) && !isNaN(yFrom) && !isNaN(xTo) && !isNaN(yTo))
         {
            ++tweenCount;
            moveTween = new Tween(this,[xFrom,yFrom],[xTo,yTo],duration,-1,onMoveTweenUpdate,onMoveTweenEnd);
            moveTween.mx_internal::playReversed = mx_internal::playReversed;
            if(moveEasingFunction != null)
            {
               moveTween.easingFunction = moveEasingFunction;
            }
         }
         if(!isNaN(scaleXFrom) && !isNaN(scaleYFrom) && !isNaN(scaleXTo) && !isNaN(scaleYTo))
         {
            ++tweenCount;
            scaleTween = new Tween(this,[scaleXFrom,scaleYFrom],[scaleXTo,scaleYTo],duration,-1,onScaleTweenUpdate,onScaleTweenEnd);
            scaleTween.mx_internal::playReversed = mx_internal::playReversed;
            if(scaleEasingFunction != null)
            {
               scaleTween.easingFunction = scaleEasingFunction;
            }
         }
         dispatchedStartEvent = false;
         if(moveTween)
         {
            onMoveTweenUpdate(moveTween.mx_internal::getCurrentValue(0));
         }
         if(scaleTween)
         {
            onScaleTweenUpdate(scaleTween.mx_internal::getCurrentValue(0));
         }
      }
      
      override public function resume() : void
      {
         super.resume();
         if(moveTween)
         {
            moveTween.resume();
         }
         if(scaleTween)
         {
            scaleTween.resume();
         }
      }
      
      private function getVisibleBounds(param1:DisplayObject) : Rectangle
      {
         var _loc2_:BitmapData = new BitmapData(param1.width + 200,param1.height + 200,true,0);
         var _loc3_:Matrix = new Matrix();
         _loc3_.translate(100,100);
         _loc2_.draw(param1,_loc3_);
         var _loc4_:Rectangle = _loc2_.getColorBoundsRect(4278190080,0,false);
         _loc4_.x -= 100;
         _loc4_.y -= 100;
         _loc2_.dispose();
         if(_loc4_.width < param1.width)
         {
            _loc4_.width = param1.width;
            _loc4_.x = 0;
         }
         if(_loc4_.height < param1.height)
         {
            _loc4_.height = param1.height;
            _loc4_.y = 0;
         }
         return _loc4_;
      }
      
      override public function initEffect(param1:Event) : void
      {
         super.initEffect(param1);
         switch(param1.type)
         {
            case "childrenCreationComplete":
            case FlexEvent.CREATION_COMPLETE:
            case FlexEvent.SHOW:
            case Event.ADDED:
            case "resizeEnd":
               showTarget = true;
               break;
            case FlexEvent.HIDE:
            case Event.REMOVED:
            case "resizeStart":
               showTarget = false;
               break;
            case Event.RESIZE:
               useSnapshotBounds = false;
         }
      }
      
      public function set showTarget(param1:Boolean) : void
      {
         _showTarget = param1;
         _showExplicitlySet = true;
      }
      
      protected function onScaleTweenEnd(param1:Object) : void
      {
         onScaleTweenUpdate(param1);
         finishTween();
      }
      
      override mx_internal function eventHandler(param1:Event) : void
      {
         var _loc2_:Tween = null;
         var _loc3_:Number = NaN;
         super.mx_internal::eventHandler(param1);
         if(param1.type == ResizeEvent.RESIZE)
         {
            _loc2_ = moveTween;
            if(!_loc2_ && Boolean(scaleTween))
            {
               _loc2_ = scaleTween;
            }
            if(_loc2_)
            {
               _loc3_ = getTimer() - _loc2_.mx_internal::startTime;
               if(moveTween)
               {
                  Tween.mx_internal::removeTween(moveTween);
               }
               if(scaleTween)
               {
                  Tween.mx_internal::removeTween(scaleTween);
               }
               tweenCount = 0;
               removeMask();
               initMask();
               play();
               if(moveTween)
               {
                  moveTween.mx_internal::startTime -= _loc3_;
                  moveTween.mx_internal::doInterval();
               }
               if(scaleTween)
               {
                  scaleTween.mx_internal::startTime -= _loc3_;
                  scaleTween.mx_internal::doInterval();
               }
            }
         }
      }
      
      protected function onMoveTweenEnd(param1:Object) : void
      {
         onMoveTweenUpdate(param1);
         finishTween();
      }
      
      override public function reverse() : void
      {
         super.reverse();
         if(moveTween)
         {
            moveTween.reverse();
         }
         if(scaleTween)
         {
            scaleTween.reverse();
         }
         super.mx_internal::playReversed = !mx_internal::playReversed;
      }
      
      override public function end() : void
      {
         mx_internal::stopRepeat = true;
         if(moveTween)
         {
            moveTween.endTween();
         }
         if(scaleTween)
         {
            scaleTween.endTween();
         }
      }
      
      protected function initMaskEffect() : void
      {
         if(!_showExplicitlySet && propertyChanges && propertyChanges.start["visible"] !== undefined)
         {
            _showTarget = !propertyChanges.start["visible"];
         }
      }
      
      protected function onScaleTweenUpdate(param1:Object) : void
      {
         saveTweenValue(null,param1);
         if(effectMask)
         {
            effectMask.scaleX = param1[0];
            effectMask.scaleY = param1[1];
         }
      }
      
      public function get showTarget() : Boolean
      {
         return _showTarget;
      }
      
      override public function pause() : void
      {
         super.pause();
         if(moveTween)
         {
            moveTween.pause();
         }
         if(scaleTween)
         {
            scaleTween.pause();
         }
      }
   }
}
