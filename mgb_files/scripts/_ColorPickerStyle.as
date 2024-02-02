package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.ColorPickerSkin;
   import mx.styles.*;
   
   public class _ColorPickerStyle
   {
       
      
      public function _ColorPickerStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("ColorPicker");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("ColorPicker",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.iconColor = 0;
               this.fontSize = 11;
               this.verticalGap = 0;
               this.shadowColor = 5068126;
               this.skin = ColorPickerSkin;
               this.swatchBorderSize = 0;
            };
         }
      }
   }
}
