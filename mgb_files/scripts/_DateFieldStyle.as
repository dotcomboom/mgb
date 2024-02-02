package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _DateFieldStyle
   {
      
      private static var _embed_css_Assets_swf_openDateOver_13068655:Class = _DateFieldStyle__embed_css_Assets_swf_openDateOver_13068655;
       
      
      public function _DateFieldStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DateField");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("DateField",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = _embed_css_Assets_swf_openDateOver_13068655;
               this.overSkin = _embed_css_Assets_swf_openDateOver_13068655;
               this.downSkin = _embed_css_Assets_swf_openDateOver_13068655;
               this.dateChooserStyleName = "dateFieldPopup";
               this.disabledSkin = _embed_css_Assets_swf_openDateOver_13068655;
            };
         }
      }
   }
}
