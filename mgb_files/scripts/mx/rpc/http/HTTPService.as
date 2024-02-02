package mx.rpc.http
{
   import mx.core.mx_internal;
   import mx.messaging.ChannelSet;
   import mx.messaging.config.LoaderConfig;
   import mx.rpc.AbstractInvoker;
   import mx.rpc.AsyncRequest;
   import mx.rpc.AsyncToken;
   import mx.utils.URLUtil;
   
   use namespace mx_internal;
   
   public class HTTPService extends AbstractInvoker
   {
      
      public static const RESULT_FORMAT_E4X:String = "e4x";
      
      public static const ERROR_URL_REQUIRED:String = "Client.URLRequired";
      
      public static const RESULT_FORMAT_XML:String = "xml";
      
      public static const CONTENT_TYPE_FORM:String = "application/x-www-form-urlencoded";
      
      public static const RESULT_FORMAT_TEXT:String = "text";
      
      public static const RESULT_FORMAT_FLASHVARS:String = "flashvars";
      
      public static const DEFAULT_DESTINATION_HTTP:String = "DefaultHTTP";
      
      public static const CONTENT_TYPE_XML:String = "application/xml";
      
      public static const ERROR_ENCODING:String = "Client.CouldNotEncode";
      
      public static const RESULT_FORMAT_ARRAY:String = "array";
      
      public static const DEFAULT_DESTINATION_HTTPS:String = "DefaultHTTPS";
      
      public static const RESULT_FORMAT_OBJECT:String = "object";
      
      public static const ERROR_DECODING:String = "Client.CouldNotDecode";
       
      
      mx_internal var operation:AbstractOperation;
      
      public function HTTPService(param1:String = null, param2:String = null)
      {
         super();
         mx_internal::operation = new HTTPOperation(this);
         mx_internal::operation.makeObjectsBindable = true;
         mx_internal::operation.mx_internal::_rootURL = param1;
         if(param2 == null)
         {
            if(URLUtil.isHttpsURL(LoaderConfig.url))
            {
               mx_internal::asyncRequest.destination = DEFAULT_DESTINATION_HTTPS;
            }
            else
            {
               mx_internal::asyncRequest.destination = DEFAULT_DESTINATION_HTTP;
            }
         }
         else
         {
            mx_internal::asyncRequest.destination = param2;
            useProxy = true;
         }
      }
      
      public function setCredentials(param1:String, param2:String, param3:String = null) : void
      {
         mx_internal::asyncRequest.setCredentials(param1,param2,param3);
      }
      
      public function set method(param1:String) : void
      {
         mx_internal::operation.method = param1;
      }
      
      public function logout() : void
      {
         mx_internal::asyncRequest.logout();
      }
      
      public function get headers() : Object
      {
         return mx_internal::operation.headers;
      }
      
      public function get serializationFilter() : SerializationFilter
      {
         return mx_internal::operation.serializationFilter;
      }
      
      override public function cancel(param1:String = null) : AsyncToken
      {
         return mx_internal::operation.cancel(param1);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         mx_internal::operation.removeEventListener(param1,param2,param3);
         super.removeEventListener(param1,param2,param3);
      }
      
      public function set headers(param1:Object) : void
      {
         mx_internal::operation.headers = param1;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         mx_internal::operation.addEventListener(param1,param2,param3,param4,param5);
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function get request() : Object
      {
         return mx_internal::operation.request;
      }
      
      public function set serializationFilter(param1:SerializationFilter) : void
      {
         mx_internal::operation.serializationFilter = param1;
      }
      
      public function get requestTimeout() : int
      {
         return mx_internal::asyncRequest.requestTimeout;
      }
      
      public function get contentType() : String
      {
         return mx_internal::operation.contentType;
      }
      
      public function get destination() : String
      {
         return mx_internal::asyncRequest.destination;
      }
      
      public function send(param1:Object = null) : AsyncToken
      {
         if(param1 == null)
         {
            param1 = request;
         }
         return mx_internal::operation.sendBody(param1);
      }
      
      public function set showBusyCursor(param1:Boolean) : void
      {
         mx_internal::operation.showBusyCursor = param1;
      }
      
      public function set xmlDecode(param1:Function) : void
      {
         mx_internal::operation.xmlDecode = param1;
      }
      
      public function get concurrency() : String
      {
         return mx_internal::operation.concurrency;
      }
      
      public function get showBusyCursor() : Boolean
      {
         return mx_internal::operation.showBusyCursor;
      }
      
      public function set destination(param1:String) : void
      {
         useProxy = true;
         mx_internal::asyncRequest.destination = param1;
      }
      
      public function set useProxy(param1:Boolean) : void
      {
         mx_internal::operation.useProxy = param1;
      }
      
      public function set request(param1:Object) : void
      {
         mx_internal::operation.request = param1;
      }
      
      public function get channelSet() : ChannelSet
      {
         return mx_internal::asyncRequest.channelSet;
      }
      
      public function get method() : String
      {
         return mx_internal::operation.method;
      }
      
      [Bindable("resultForBinding")]
      override public function get lastResult() : Object
      {
         return mx_internal::operation.lastResult;
      }
      
      public function disconnect() : void
      {
         mx_internal::asyncRequest.disconnect();
      }
      
      public function set requestTimeout(param1:int) : void
      {
         if(mx_internal::asyncRequest.requestTimeout != param1)
         {
            mx_internal::asyncRequest.requestTimeout = param1;
         }
      }
      
      public function set url(param1:String) : void
      {
         mx_internal::operation.url = param1;
      }
      
      override mx_internal function set asyncRequest(param1:AsyncRequest) : void
      {
         mx_internal::operation.mx_internal::asyncRequest = param1;
      }
      
      public function set resultFormat(param1:String) : void
      {
         mx_internal::operation.resultFormat = param1;
      }
      
      public function set rootURL(param1:String) : void
      {
         mx_internal::operation.rootURL = param1;
      }
      
      public function get xmlDecode() : Function
      {
         return mx_internal::operation.xmlDecode;
      }
      
      public function set concurrency(param1:String) : void
      {
         mx_internal::operation.concurrency = param1;
      }
      
      public function get useProxy() : Boolean
      {
         return mx_internal::operation.useProxy;
      }
      
      public function get url() : String
      {
         return mx_internal::operation.url;
      }
      
      public function get xmlEncode() : Function
      {
         return mx_internal::operation.xmlEncode;
      }
      
      public function set xmlEncode(param1:Function) : void
      {
         mx_internal::operation.xmlEncode = param1;
      }
      
      override mx_internal function get asyncRequest() : AsyncRequest
      {
         return mx_internal::operation.mx_internal::asyncRequest;
      }
      
      public function get resultFormat() : String
      {
         return mx_internal::operation.resultFormat;
      }
      
      public function set contentType(param1:String) : void
      {
         mx_internal::operation.contentType = param1;
      }
      
      public function setRemoteCredentials(param1:String, param2:String, param3:String = null) : void
      {
         mx_internal::asyncRequest.setRemoteCredentials(param1,param2,param3);
      }
      
      override public function clearResult(param1:Boolean = true) : void
      {
         mx_internal::operation.clearResult(param1);
      }
      
      override public function set makeObjectsBindable(param1:Boolean) : void
      {
         mx_internal::operation.makeObjectsBindable = param1;
      }
      
      public function get rootURL() : String
      {
         return mx_internal::operation.rootURL;
      }
      
      override public function get makeObjectsBindable() : Boolean
      {
         return mx_internal::operation.makeObjectsBindable;
      }
      
      public function set channelSet(param1:ChannelSet) : void
      {
         useProxy = true;
         mx_internal::asyncRequest.channelSet = param1;
      }
   }
}

import mx.core.mx_internal;
import mx.rpc.AbstractService;
import mx.rpc.events.AbstractEvent;
import mx.rpc.http.AbstractOperation;
import mx.rpc.http.HTTPService;

use namespace mx_internal;

class HTTPOperation extends AbstractOperation
{
    
   
   private var _httpService:HTTPService;
   
   public function HTTPOperation(param1:HTTPService, param2:String = null)
   {
      super(null,param2);
      this._httpService = param1;
   }
   
   override public function get service() : AbstractService
   {
      mx_internal::_log.warn("Attempted access to HTTPOperation.service. To get the containing HTTPService instance, use HTTPOperation.httpService");
      return null;
   }
   
   public function get httpService() : HTTPService
   {
      return _httpService;
   }
   
   override mx_internal function dispatchRpcEvent(param1:AbstractEvent) : void
   {
      if(hasEventListener(param1.type))
      {
         param1.mx_internal::callTokenResponders();
         if(!param1.isDefaultPrevented())
         {
            dispatchEvent(param1);
         }
      }
      else if(httpService != null)
      {
         httpService.mx_internal::dispatchRpcEvent(param1);
      }
      else
      {
         param1.mx_internal::callTokenResponders();
      }
   }
}
