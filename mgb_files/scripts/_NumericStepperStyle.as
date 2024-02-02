package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.NumericStepperDownSkin;
   import mx.skins.halo.NumericStepperUpSkin;
   import mx.styles.*;
   
   public class _NumericStepperStyle
   {
       
      
      public function _NumericStepperStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("NumericStepper");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("NumericStepper",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.downArrowSkin = NumericStepperDownSkin;
               this.cornerRadius = 5;
               this.upArrowSkin = NumericStepperUpSkin;
               this.focusRoundedCorners = "tr br";
            };
         }
      }
   }
}
