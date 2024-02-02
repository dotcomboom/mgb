package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _AccordionStyle
   {
       
      
      public function _AccordionStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("Accordion");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Accordion",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderStyle = "solid";
               this.paddingTop = -1;
               this.backgroundColor = 16777215;
               this.verticalGap = -1;
               this.paddingLeft = -1;
               this.paddingBottom = -1;
               this.paddingRight = -1;
            };
         }
      }
   }
}
