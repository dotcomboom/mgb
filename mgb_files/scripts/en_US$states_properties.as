package
{
   import mx.resources.ResourceBundle;
   
   public class en_US$states_properties extends ResourceBundle
   {
       
      
      public function en_US$states_properties()
      {
         super("en_US","states");
      }
      
      override protected function getContent() : Object
      {
         return {"alreadyParented":"Cannot add a child that is already parented."};
      }
   }
}
