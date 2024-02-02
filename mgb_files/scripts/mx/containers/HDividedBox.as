package mx.containers
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class HDividedBox extends DividedBox
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function HDividedBox()
      {
         super();
         mx_internal::layoutObject.direction = BoxDirection.HORIZONTAL;
      }
      
      override public function set direction(param1:String) : void
      {
      }
   }
}
