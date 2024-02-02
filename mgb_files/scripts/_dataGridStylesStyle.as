package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _dataGridStylesStyle
   {
       
      
      public function _dataGridStylesStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".dataGridStyles");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".dataGridStyles",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
            };
         }
      }
   }
}
