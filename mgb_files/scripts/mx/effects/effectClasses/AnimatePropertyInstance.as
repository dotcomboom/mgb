package mx.effects.effectClasses
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class AnimatePropertyInstance extends TweenEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public var roundValue:Boolean = false;
      
      public var isStyle:Boolean = false;
      
      public var property:String;
      
      public var toValue:Number;
      
      public var fromValue:Number;
      
      public function AnimatePropertyInstance(param1:Object)
      {
         super(param1);
      }
      
      private function getCurrentValue() : Number
      {
         var _loc1_:Number = NaN;
         if(!isStyle)
         {
            _loc1_ = Number(target[property]);
         }
         else
         {
            _loc1_ = Number(target.getStyle(property));
         }
         return roundValue ? Math.round(_loc1_) : _loc1_;
      }
      
      override public function play() : void
      {
         super.play();
         if(isNaN(fromValue))
         {
            fromValue = getCurrentValue();
         }
         if(isNaN(toValue))
         {
            if(Boolean(propertyChanges) && propertyChanges.end[property] !== undefined)
            {
               toValue = propertyChanges.end[property];
            }
            else
            {
               toValue = getCurrentValue();
            }
         }
         tween = createTween(this,fromValue,toValue,duration);
         if(easingFunction != null)
         {
            tween.easingFunction = easingFunction;
         }
         mx_internal::applyTweenStartValues();
      }
      
      override public function onTweenUpdate(param1:Object) : void
      {
         if(!isStyle)
         {
            target[property] = roundValue ? Math.round(Number(param1)) : param1;
         }
         else
         {
            target.setStyle(property,param1);
         }
      }
   }
}
