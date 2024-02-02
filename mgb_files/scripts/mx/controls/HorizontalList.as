package mx.controls
{
   import mx.controls.listClasses.TileBase;
   import mx.controls.listClasses.TileBaseDirection;
   import mx.core.ScrollPolicy;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class HorizontalList extends TileBase
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function HorizontalList()
      {
         super();
         mx_internal::_horizontalScrollPolicy = ScrollPolicy.AUTO;
         mx_internal::_verticalScrollPolicy = ScrollPolicy.OFF;
         direction = TileBaseDirection.VERTICAL;
         maxRows = 1;
         defaultRowCount = 1;
      }
   }
}
