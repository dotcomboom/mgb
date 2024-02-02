package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _SwatchPanelStyle
   {
       
      
      public function _SwatchPanelStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("SwatchPanel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("SwatchPanel",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.swatchGridBackgroundColor = 0;
               this.previewHeight = 22;
               this.borderColor = 10856878;
               this.paddingTop = 4;
               this.swatchWidth = 12;
               this.backgroundColor = 15066855;
               this.highlightColor = 16777215;
               this.textFieldStyleName = "swatchPanelTextField";
               this.swatchHighlightSize = 1;
               this.swatchHeight = 12;
               this.fontSize = 11;
               this.previewWidth = 45;
               this.verticalGap = 0;
               this.shadowColor = 5068126;
               this.paddingLeft = 5;
               this.swatchBorderSize = 1;
               this.paddingRight = 5;
               this.swatchBorderColor = 0;
               this.swatchGridBorderSize = 0;
               this.columnCount = 20;
               this.textFieldWidth = 72;
               this.swatchHighlightColor = 16777215;
               this.horizontalGap = 0;
               this.paddingBottom = 5;
            };
         }
      }
   }
}
