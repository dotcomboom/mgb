package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.BrokenImageBorderSkin;
   import mx.styles.*;
   
   public class _SWFLoaderStyle
   {
      
      private static var _embed_css_Assets_swf___brokenImage_2100270375:Class = _SWFLoaderStyle__embed_css_Assets_swf___brokenImage_2100270375;
       
      
      public function _SWFLoaderStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("SWFLoader");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("SWFLoader",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderStyle = "none";
               this.brokenImageSkin = _embed_css_Assets_swf___brokenImage_2100270375;
               this.brokenImageBorderSkin = BrokenImageBorderSkin;
            };
         }
      }
   }
}
