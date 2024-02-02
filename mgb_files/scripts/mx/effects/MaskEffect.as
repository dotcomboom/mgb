package mx.effects
{
   import flash.events.EventDispatcher;
   import mx.core.mx_internal;
   import mx.effects.effectClasses.MaskEffectInstance;
   import mx.events.TweenEvent;
   
   use namespace mx_internal;
   
   public class MaskEffect extends Effect
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var AFFECTED_PROPERTIES:Array = ["visible"];
       
      
      public var createMaskFunction:Function;
      
      public var xFrom:Number;
      
      public var yFrom:Number;
      
      public var scaleEasingFunction:Function;
      
      mx_internal var persistAfterEnd:Boolean = false;
      
      public var moveEasingFunction:Function;
      
      public var scaleXFrom:Number;
      
      public var scaleYFrom:Number;
      
      public var xTo:Number;
      
      public var yTo:Number;
      
      private var _showExplicitlySet:Boolean = false;
      
      public var scaleXTo:Number;
      
      public var scaleYTo:Number;
      
      private var _showTarget:Boolean = true;
      
      public function MaskEffect(param1:Object = null)
      {
         super(param1);
         instanceClass = MaskEffectInstance;
         hideFocusRing = true;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         var _loc2_:MaskEffectInstance = null;
         super.initInstance(param1);
         _loc2_ = MaskEffectInstance(param1);
         if(_showExplicitlySet)
         {
            _loc2_.showTarget = showTarget;
         }
         _loc2_.xFrom = xFrom;
         _loc2_.yFrom = yFrom;
         _loc2_.xTo = xTo;
         _loc2_.yTo = yTo;
         _loc2_.scaleXFrom = scaleXFrom;
         _loc2_.scaleXTo = scaleXTo;
         _loc2_.scaleYFrom = scaleYFrom;
         _loc2_.scaleYTo = scaleYTo;
         _loc2_.moveEasingFunction = moveEasingFunction;
         _loc2_.scaleEasingFunction = scaleEasingFunction;
         _loc2_.createMaskFunction = createMaskFunction;
         _loc2_.mx_internal::persistAfterEnd = mx_internal::persistAfterEnd;
         EventDispatcher(_loc2_).addEventListener(TweenEvent.TWEEN_START,tweenEventHandler);
         EventDispatcher(_loc2_).addEventListener(TweenEvent.TWEEN_UPDATE,tweenEventHandler);
         EventDispatcher(_loc2_).addEventListener(TweenEvent.TWEEN_END,tweenEventHandler);
      }
      
      protected function tweenEventHandler(param1:TweenEvent) : void
      {
         dispatchEvent(param1);
      }
      
      override public function set hideFocusRing(param1:Boolean) : void
      {
         super.hideFocusRing = param1;
      }
      
      override public function get hideFocusRing() : Boolean
      {
         return super.hideFocusRing;
      }
      
      public function set showTarget(param1:Boolean) : void
      {
         _showTarget = param1;
         _showExplicitlySet = true;
      }
      
      public function get showTarget() : Boolean
      {
         return _showTarget;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
   }
}
