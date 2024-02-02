package mx.rpc.http.mxml
{
   import flash.events.ErrorEvent;
   import mx.core.IMXMLObject;
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.rpc.events.AbstractEvent;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.http.HTTPService;
   import mx.rpc.mxml.IMXMLSupport;
   
   use namespace mx_internal;
   
   public class HTTPService extends mx.rpc.http.HTTPService implements IMXMLSupport, IMXMLObject
   {
       
      
      private var id:String;
      
      private var document:Object;
      
      private var resourceManager:IResourceManager;
      
      public function HTTPService(param1:String = null, param2:String = null)
      {
         resourceManager = ResourceManager.getInstance();
         super(param1,param2);
      }
      
      override mx_internal function dispatchRpcEvent(param1:AbstractEvent) : void
      {
         var _loc2_:ErrorEvent = null;
         param1.mx_internal::callTokenResponders();
         if(!param1.isDefaultPrevented())
         {
            if(hasEventListener(param1.type))
            {
               dispatchEvent(param1);
            }
            else if(param1 is FaultEvent && (param1.token == null || !param1.token.hasResponder()))
            {
               if(!(Boolean(document) && Boolean(document.willTrigger(ErrorEvent.ERROR))))
               {
                  mx_internal::monitorRpcEvent(param1);
                  throw FaultEvent(param1).fault;
               }
               _loc2_ = new ErrorEvent(ErrorEvent.ERROR,true,true);
               _loc2_.text = FaultEvent(param1).fault.faultString;
               document.dispatchEvent(_loc2_);
            }
            mx_internal::monitorRpcEvent(param1);
         }
      }
      
      public function initialized(param1:Object, param2:String) : void
      {
         this.id = param2;
         this.document = param1;
      }
   }
}
