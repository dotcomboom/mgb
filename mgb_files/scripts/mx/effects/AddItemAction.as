package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.AddItemActionInstance;
   
   use namespace mx_internal;
   
   public class AddItemAction extends Effect
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var AFFECTED_PROPERTIES:Array = ["parent"];
       
      
      public function AddItemAction(param1:Object = null)
      {
         super(param1);
         instanceClass = AddItemActionInstance;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         super.initInstance(param1);
         var _loc2_:AddItemActionInstance = AddItemActionInstance(param1);
      }
   }
}
