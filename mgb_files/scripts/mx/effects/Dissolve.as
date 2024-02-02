package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.DissolveInstance;
   import mx.graphics.RoundedRectangle;
   
   use namespace mx_internal;
   
   public class Dissolve extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var AFFECTED_PROPERTIES:Array = ["visible"];
       
      
      public var color:uint = 4294967295;
      
      public var alphaFrom:Number;
      
      public var alphaTo:Number;
      
      mx_internal var persistAfterEnd:Boolean = false;
      
      public var targetArea:RoundedRectangle;
      
      public function Dissolve(param1:Object = null)
      {
         super(param1);
         instanceClass = DissolveInstance;
         relevantProperties = ["visible","alpha"];
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         var _loc2_:DissolveInstance = null;
         super.initInstance(param1);
         _loc2_ = DissolveInstance(param1);
         _loc2_.alphaFrom = alphaFrom;
         _loc2_.alphaTo = alphaTo;
         _loc2_.color = color;
         _loc2_.mx_internal::persistAfterEnd = mx_internal::persistAfterEnd;
         _loc2_.targetArea = targetArea;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
   }
}
