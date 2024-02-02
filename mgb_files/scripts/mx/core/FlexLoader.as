package mx.core
{
   import flash.display.Loader;
   import mx.utils.NameUtil;
   
   use namespace mx_internal;
   
   public class FlexLoader extends Loader
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function FlexLoader()
      {
         super();
         try
         {
            name = NameUtil.createUniqueName(this);
         }
         catch(e:Error)
         {
         }
      }
      
      override public function toString() : String
      {
         return NameUtil.displayObjectToString(this);
      }
   }
}
