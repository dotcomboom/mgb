package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _VRuleStyle
   {
       
      
      public function _VRuleStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("VRule");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("VRule",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.strokeColor = 12897484;
               this.strokeWidth = 2;
            };
         }
      }
   }
}
