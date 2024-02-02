package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.WipeDownInstance;
   
   use namespace mx_internal;
   
   public class WipeDown extends MaskEffect
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function WipeDown(param1:Object = null)
      {
         super(param1);
         instanceClass = WipeDownInstance;
      }
   }
}
