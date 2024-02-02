package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _DividedBoxStyle
   {
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_VBoxDivider_756749724:Class = _DividedBoxStyle__embed_css_Assets_swf_mx_skins_cursor_VBoxDivider_756749724;
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_HBoxDivider_543603746:Class = _DividedBoxStyle__embed_css_Assets_swf_mx_skins_cursor_HBoxDivider_543603746;
      
      private static var _embed_css_Assets_swf_mx_skins_BoxDividerSkin_3313593:Class = _DividedBoxStyle__embed_css_Assets_swf_mx_skins_BoxDividerSkin_3313593;
       
      
      public function _DividedBoxStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DividedBox");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("DividedBox",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.dividerThickness = 3;
               this.dividerColor = 7305079;
               this.dividerAffordance = 6;
               this.verticalDividerCursor = _embed_css_Assets_swf_mx_skins_cursor_VBoxDivider_756749724;
               this.dividerSkin = _embed_css_Assets_swf_mx_skins_BoxDividerSkin_3313593;
               this.horizontalDividerCursor = _embed_css_Assets_swf_mx_skins_cursor_HBoxDivider_543603746;
               this.dividerAlpha = 0.75;
               this.verticalGap = 10;
               this.horizontalGap = 10;
            };
         }
      }
   }
}
