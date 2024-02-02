package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.DateChooserIndicator;
   import mx.skins.halo.DateChooserMonthArrowSkin;
   import mx.skins.halo.DateChooserYearArrowSkin;
   import mx.styles.*;
   
   public class _DateChooserStyle
   {
       
      
      public function _DateChooserStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DateChooser");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("DateChooser",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.nextYearSkin = DateChooserYearArrowSkin;
               this.backgroundColor = 16777215;
               this.todayStyleName = "todayStyle";
               this.headerStyleName = "headerDateText";
               this.rollOverIndicatorSkin = DateChooserIndicator;
               this.cornerRadius = 4;
               this.nextMonthSkin = DateChooserMonthArrowSkin;
               this.selectionIndicatorSkin = DateChooserIndicator;
               this.prevMonthSkin = DateChooserMonthArrowSkin;
               this.todayColor = 8487297;
               this.weekDayStyleName = "weekDayStyle";
               this.headerColors = [14804459,16053751];
               this.todayIndicatorSkin = DateChooserIndicator;
               this.prevYearSkin = DateChooserYearArrowSkin;
            };
         }
      }
   }
}
