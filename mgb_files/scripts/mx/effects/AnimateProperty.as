package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.AnimatePropertyInstance;
   
   use namespace mx_internal;
   
   public class AnimateProperty extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public var roundValue:Boolean = false;
      
      public var isStyle:Boolean = false;
      
      public var property:String;
      
      public var toValue:Number;
      
      public var fromValue:Number;
      
      public function AnimateProperty(param1:Object = null)
      {
         super(param1);
         instanceClass = AnimatePropertyInstance;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         var _loc2_:AnimatePropertyInstance = null;
         super.initInstance(param1);
         _loc2_ = AnimatePropertyInstance(param1);
         _loc2_.fromValue = fromValue;
         _loc2_.toValue = toValue;
         _loc2_.property = property;
         _loc2_.isStyle = isStyle;
         _loc2_.roundValue = roundValue;
      }
      
      override public function get relevantStyles() : Array
      {
         return isStyle ? [property] : [];
      }
      
      override public function getAffectedProperties() : Array
      {
         return [property];
      }
   }
}
