package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.*;
   
   public class _CalendarLayoutStyle
   {
       
      
      public function _CalendarLayoutStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("CalendarLayout");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("CalendarLayout",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.paddingTop = 6;
               this.todayColor = 8487297;
               this.color = 2831164;
               this.cellHeightPadding = 6;
               this.textAlign = "center";
               this.verticalGap = 6;
               this.horizontalGap = 7;
               this.cellWidthPadding = 6;
               this.paddingLeft = 6;
               this.paddingBottom = 10;
               this.paddingRight = 6;
            };
         }
      }
   }
}
