package mx.effects.effectClasses
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class AddItemActionInstance extends ActionEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function AddItemActionInstance(param1:Object)
      {
         super(param1);
      }
      
      override public function initEffect(param1:Event) : void
      {
         super.initEffect(param1);
      }
      
      override public function play() : void
      {
         super.play();
         effectTargetHost.addDataEffectItem(target);
         finishRepeat();
      }
   }
}
