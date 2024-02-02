package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _FormStyle
   {
       
      
      public function _FormStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("Form");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Form",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.paddingTop = 16;
               this.verticalGap = 6;
               this.paddingLeft = 16;
               this.paddingBottom = 16;
               this.paddingRight = 16;
            };
         }
      }
   }
}
