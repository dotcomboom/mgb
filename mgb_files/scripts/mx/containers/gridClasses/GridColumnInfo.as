package mx.containers.gridClasses
{
   import mx.containers.utilityClasses.FlexChildInfo;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class GridColumnInfo extends FlexChildInfo
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public var x:Number;
      
      public function GridColumnInfo()
      {
         super();
         min = 0;
         preferred = 0;
         max = UIComponent.DEFAULT_MAX_WIDTH;
         flex = 0;
         percent = 0;
      }
   }
}
