package mx.rpc
{
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.rpc.events.AbstractEvent;
   
   use namespace mx_internal;
   
   public class AbstractOperation extends AbstractInvoker
   {
       
      
      mx_internal var _service:AbstractService;
      
      private var _name:String;
      
      public var properties:Object;
      
      public var arguments:Object;
      
      private var resourceManager:IResourceManager;
      
      public function AbstractOperation(param1:AbstractService = null, param2:String = null)
      {
         resourceManager = ResourceManager.getInstance();
         super();
         mx_internal::_service = param1;
         _name = param2;
         this.arguments = {};
      }
      
      public function send(... rest) : AsyncToken
      {
         return null;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      override mx_internal function dispatchRpcEvent(param1:AbstractEvent) : void
      {
         param1.mx_internal::callTokenResponders();
         if(!param1.isDefaultPrevented())
         {
            if(hasEventListener(param1.type))
            {
               dispatchEvent(param1);
            }
            else if(mx_internal::_service != null)
            {
               mx_internal::_service.dispatchEvent(param1);
            }
         }
      }
      
      mx_internal function setService(param1:AbstractService) : void
      {
         var _loc2_:String = null;
         if(!mx_internal::_service)
         {
            mx_internal::_service = param1;
            return;
         }
         _loc2_ = String(resourceManager.getString("rpc","cannotResetService"));
         throw new Error(_loc2_);
      }
      
      public function get service() : AbstractService
      {
         return mx_internal::_service;
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:String = null;
         if(!_name)
         {
            _name = param1;
            return;
         }
         _loc2_ = String(resourceManager.getString("rpc","cannotResetOperationName"));
         throw new Error(_loc2_);
      }
   }
}
