package mx.core
{
   use namespace mx_internal;
   
   public class UIComponentDescriptor extends ComponentDescriptor
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      mx_internal var instanceIndices:Array;
      
      public var stylesFactory:Function;
      
      public var effects:Array;
      
      mx_internal var repeaters:Array;
      
      mx_internal var repeaterIndices:Array;
      
      public function UIComponentDescriptor(param1:Object)
      {
         super(param1);
      }
      
      override public function toString() : String
      {
         return "UIComponentDescriptor_" + id;
      }
   }
}
