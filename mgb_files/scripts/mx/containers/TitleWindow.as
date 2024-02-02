package mx.containers
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class TitleWindow extends Panel
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      mx_internal static var createAccessibilityImplementation:Function;
       
      
      public function TitleWindow()
      {
         super();
      }
      
      public function set showCloseButton(param1:Boolean) : void
      {
         mx_internal::_showCloseButton = param1;
      }
      
      public function get showCloseButton() : Boolean
      {
         return mx_internal::_showCloseButton;
      }
      
      override protected function initializeAccessibility() : void
      {
         if(TitleWindow.mx_internal::createAccessibilityImplementation != null)
         {
            TitleWindow.mx_internal::createAccessibilityImplementation(this);
         }
      }
   }
}
