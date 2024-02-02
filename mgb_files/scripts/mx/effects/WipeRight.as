package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.WipeRightInstance;
   
   use namespace mx_internal;
   
   public class WipeRight extends MaskEffect
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function WipeRight(param1:Object = null)
      {
         super(param1);
         instanceClass = WipeRightInstance;
      }
   }
}
