package mx.effects.effectClasses
{
   import mx.controls.SWFLoader;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class WipeUpInstance extends MaskEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function WipeUpInstance(param1:Object)
      {
         super(param1);
      }
      
      override protected function initMaskEffect() : void
      {
         var _loc2_:Number = NaN;
         super.initMaskEffect();
         var _loc1_:Number = target is SWFLoader && Boolean(target.content) ? SWFLoader(target).contentHeight : targetVisualBounds.height / Math.abs(target.scaleY);
         if(target.rotation != 0)
         {
            _loc2_ = target.rotation * Math.PI / 180;
            _loc1_ = Math.abs(targetVisualBounds.width * Math.sin(_loc2_) + targetVisualBounds.height * Math.cos(_loc2_));
         }
         if(showTarget)
         {
            xFrom = targetVisualBounds.x;
            yFrom = _loc1_ + targetVisualBounds.y;
            xTo = targetVisualBounds.x;
            yTo = effectMask.height <= _loc1_ ? targetVisualBounds.y : _loc1_ - effectMask.height + targetVisualBounds.y;
         }
         else
         {
            xFrom = targetVisualBounds.x;
            yFrom = effectMask.height <= _loc1_ ? _loc1_ - effectMask.height + targetVisualBounds.y : targetVisualBounds.y;
            xTo = targetVisualBounds.x;
            yTo = -effectMask.height + targetVisualBounds.y;
         }
      }
   }
}
