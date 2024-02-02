package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.AccordionHeaderSkin;
   import mx.styles.*;
   
   public class _AccordionHeaderStyle
   {
       
      
      public function _AccordionHeaderStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("AccordionHeader");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("AccordionHeader",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.downSkin = null;
               this.overSkin = null;
               this.paddingTop = 0;
               this.selectedDisabledSkin = null;
               this.selectedUpSkin = null;
               this.fontSize = "10";
               this.skin = AccordionHeaderSkin;
               this.paddingLeft = 5;
               this.paddingRight = 5;
               this.upSkin = null;
               this.fontWeight = "bold";
               this.selectedDownSkin = null;
               this.textAlign = "left";
               this.disabledSkin = null;
               this.horizontalGap = 2;
               this.paddingBottom = 0;
               this.selectedOverSkin = null;
            };
         }
      }
   }
}
