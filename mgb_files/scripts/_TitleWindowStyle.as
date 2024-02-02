package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _TitleWindowStyle
   {
      
      private static var _embed_css_Assets_swf_CloseButtonDown_160297231:Class = _TitleWindowStyle__embed_css_Assets_swf_CloseButtonDown_160297231;
      
      private static var _embed_css_Assets_swf_CloseButtonDisabled_1830119879:Class = _TitleWindowStyle__embed_css_Assets_swf_CloseButtonDisabled_1830119879;
      
      private static var _embed_css_Assets_swf_CloseButtonOver_62193169:Class = _TitleWindowStyle__embed_css_Assets_swf_CloseButtonOver_62193169;
      
      private static var _embed_css_Assets_swf_CloseButtonUp_1137306266:Class = _TitleWindowStyle__embed_css_Assets_swf_CloseButtonUp_1137306266;
       
      
      public function _TitleWindowStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("TitleWindow");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("TitleWindow",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.closeButtonDisabledSkin = _embed_css_Assets_swf_CloseButtonDisabled_1830119879;
               this.paddingTop = 4;
               this.dropShadowEnabled = true;
               this.backgroundColor = 16777215;
               this.closeButtonOverSkin = _embed_css_Assets_swf_CloseButtonOver_62193169;
               this.closeButtonUpSkin = _embed_css_Assets_swf_CloseButtonUp_1137306266;
               this.closeButtonDownSkin = _embed_css_Assets_swf_CloseButtonDown_160297231;
               this.cornerRadius = 8;
               this.paddingLeft = 4;
               this.paddingBottom = 4;
               this.paddingRight = 4;
            };
         }
      }
   }
}
