package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.DefaultDragImage;
   import mx.styles.*;
   
   public class _DragManagerStyle
   {
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_DragCopy_1026530905:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragCopy_1026530905;
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_DragMove_1026259941:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragMove_1026259941;
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_DragReject_2072950253:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragReject_2072950253;
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_DragLink_1026269136:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragLink_1026269136;
       
      
      public function _DragManagerStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DragManager");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("DragManager",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.copyCursor = _embed_css_Assets_swf_mx_skins_cursor_DragCopy_1026530905;
               this.moveCursor = _embed_css_Assets_swf_mx_skins_cursor_DragMove_1026259941;
               this.rejectCursor = _embed_css_Assets_swf_mx_skins_cursor_DragReject_2072950253;
               this.linkCursor = _embed_css_Assets_swf_mx_skins_cursor_DragLink_1026269136;
               this.defaultDragImageSkin = DefaultDragImage;
            };
         }
      }
   }
}
