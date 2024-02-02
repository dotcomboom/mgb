package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _HorizontalListStyle
   {
       
      
      public function _HorizontalListStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("HorizontalList");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("HorizontalList",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.textAlign = "center";
            };
         }
      }
   }
}
