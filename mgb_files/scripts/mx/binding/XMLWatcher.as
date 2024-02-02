package mx.binding
{
   import mx.core.mx_internal;
   import mx.utils.IXMLNotifiable;
   import mx.utils.XMLNotifier;
   
   use namespace mx_internal;
   
   public class XMLWatcher extends Watcher implements IXMLNotifiable
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var parentObj:Object;
      
      private var _propertyName:String;
      
      public function XMLWatcher(param1:String, param2:Array)
      {
         super(param2);
         _propertyName = param1;
      }
      
      public function get propertyName() : String
      {
         return _propertyName;
      }
      
      public function xmlNotification(param1:Object, param2:String, param3:Object, param4:Object, param5:Object) : void
      {
         updateProperty();
         notifyListeners(true);
      }
      
      override public function updateParent(param1:Object) : void
      {
         if(Boolean(parentObj) && (parentObj is XML || parentObj is XMLList))
         {
            XMLNotifier.getInstance().unwatchXML(parentObj,this);
         }
         if(param1 is Watcher)
         {
            parentObj = param1.value;
         }
         else
         {
            parentObj = param1;
         }
         if(Boolean(parentObj) && (parentObj is XML || parentObj is XMLList))
         {
            XMLNotifier.getInstance().watchXML(parentObj,this);
         }
         wrapUpdate(updateProperty);
      }
      
      private function updateProperty() : void
      {
         if(parentObj)
         {
            if(_propertyName == "this")
            {
               value = parentObj;
            }
            else
            {
               value = parentObj[_propertyName];
            }
         }
         else
         {
            value = null;
         }
         updateChildren();
      }
      
      override protected function shallowClone() : Watcher
      {
         return new XMLWatcher(_propertyName,listeners);
      }
   }
}
