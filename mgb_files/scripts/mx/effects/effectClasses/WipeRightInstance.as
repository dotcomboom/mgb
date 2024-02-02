package mx.effects.effectClasses
{
   import mx.controls.SWFLoader;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class WipeRightInstance extends MaskEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function WipeRightInstance(param1:Object)
      {
         super(param1);
      }
      
      override protected function initMaskEffect() : void
      {
         var _loc2_:Number = NaN;
         super.initMaskEffect();
         var _loc1_:Number = target is SWFLoader && Boolean(target.content) ? SWFLoader(target).contentWidth : targetVisualBounds.width / Math.abs(target.scaleX);
         if(target.rotation != 0)
         {
            _loc2_ = target.rotation * Math.PI / 180;
            _loc1_ = Math.abs(targetVisualBounds.width * Math.cos(_loc2_) - targetVisualBounds.height * Math.sin(_loc2_));
         }
         if(showTarget)
         {
            xFrom = -effectMask.width + targetVisualBounds.x;
            yFrom = targetVisualBounds.y;
            xTo = effectMask.width <= _loc1_ ? _loc1_ - effectMask.width + targetVisualBounds.x : targetVisualBounds.x;
            yTo = targetVisualBounds.y;
         }
         else
         {
            xFrom = effectMask.width <= _loc1_ ? targetVisualBounds.x : _loc1_ - effectMask.width + targetVisualBounds.x;
            yFrom = targetVisualBounds.y;
            xTo = _loc1_ + targetVisualBounds.x;
            yTo = targetVisualBounds.y;
         }
      }
   }
}
