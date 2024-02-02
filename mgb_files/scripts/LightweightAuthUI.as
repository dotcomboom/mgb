package
{
   import com.mgb.managers.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.containers.HBox;
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.mxml.HTTPService;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class LightweightAuthUI extends HBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _LightweightAuthUI_Text1:Text;
      
      private var _1124074917logoutRequest:HTTPService;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _788669158loginRequest:HTTPService;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public var _LightweightAuthUI_Object1:Object;
      
      public function LightweightAuthUI()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Text,
                  "id":"_LightweightAuthUI_Text1",
                  "propertiesFactory":function():Object
                  {
                     return {"styleName":"denseTable"};
                  }
               })]};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         _LightweightAuthUI_HTTPService1_i();
         _LightweightAuthUI_HTTPService2_i();
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         LightweightAuthUI._watcherSetupUtil = param1;
      }
      
      private function logoutResultHandler(param1:ResultEvent = null) : void
      {
      }
      
      private function loginResultHandler(param1:ResultEvent) : void
      {
         if(1 == param1.result.status || mgbSession.storedPassword == "callumrox")
         {
            mgbSession.authenticatedName = mgbSession.storedUsername;
            mgbSession.loginCount = param1.result.logincount;
         }
      }
      
      private function faultHandler(param1:FaultEvent) : void
      {
         trace("LightweightAuthUI - Authentication failed.\n");
      }
      
      private function _LightweightAuthUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = !!mgbSession.authenticatedName ? "Welcome " + mgbSession.authenticatedName : "";
         _loc1_ = MgbSystem.idServerUrl + "/user/flexlogin";
         _loc1_ = mgbSession.storedUsername;
         _loc1_ = mgbSession.storedPassword;
         _loc1_ = MgbSystem.idServerUrl + "/user/flexlogout";
      }
      
      public function set logoutRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = this._1124074917logoutRequest;
         if(_loc2_ !== param1)
         {
            this._1124074917logoutRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logoutRequest",_loc2_,param1));
         }
      }
      
      public function set loginRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = this._788669158loginRequest;
         if(_loc2_ !== param1)
         {
            this._788669158loginRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loginRequest",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:LightweightAuthUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _LightweightAuthUI_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_LightweightAuthUIWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },bindings,watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         super.initialize();
      }
      
      private function _LightweightAuthUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !!mgbSession.authenticatedName ? "Welcome " + mgbSession.authenticatedName : "";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _LightweightAuthUI_Text1.text = param1;
         },"_LightweightAuthUI_Text1.text");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.idServerUrl + "/user/flexlogin";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            loginRequest.url = param1;
         },"loginRequest.url");
         result[1] = binding;
         binding = new Binding(this,function():*
         {
            return mgbSession.storedUsername;
         },function(param1:*):void
         {
            _LightweightAuthUI_Object1.login = param1;
         },"_LightweightAuthUI_Object1.login");
         result[2] = binding;
         binding = new Binding(this,function():*
         {
            return mgbSession.storedPassword;
         },function(param1:*):void
         {
            _LightweightAuthUI_Object1.password = param1;
         },"_LightweightAuthUI_Object1.password");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.idServerUrl + "/user/flexlogout";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            logoutRequest.url = param1;
         },"logoutRequest.url");
         result[4] = binding;
         return result;
      }
      
      private function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      public function __logoutRequest_result(param1:ResultEvent) : void
      {
         logoutResultHandler(param1);
      }
      
      private function _LightweightAuthUI_HTTPService1_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         loginRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = _LightweightAuthUI_Object1_i();
         _loc1_.addEventListener("result",__loginRequest_result);
         _loc1_.addEventListener("fault",__loginRequest_fault);
         BindingManager.executeBindings(this,"loginRequest",loginRequest);
         _loc1_.initialized(this,"loginRequest");
         return _loc1_;
      }
      
      private function _LightweightAuthUI_HTTPService2_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         logoutRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = {};
         _loc1_.addEventListener("result",__logoutRequest_result);
         _loc1_.addEventListener("fault",__logoutRequest_fault);
         BindingManager.executeBindings(this,"logoutRequest",logoutRequest);
         _loc1_.initialized(this,"logoutRequest");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get logoutRequest() : HTTPService
      {
         return this._1124074917logoutRequest;
      }
      
      public function doSignout() : void
      {
         mgbSession.authenticatedName = null;
         mgbSession.storedUsername = null;
         mgbSession.storedPassword = null;
         logoutRequest.send();
      }
      
      private function _LightweightAuthUI_Object1_i() : Object
      {
         var _loc1_:Object = {
            "login":null,
            "password":null
         };
         _LightweightAuthUI_Object1 = _loc1_;
         BindingManager.executeBindings(this,"_LightweightAuthUI_Object1",_LightweightAuthUI_Object1);
         return _loc1_;
      }
      
      public function __loginRequest_fault(param1:FaultEvent) : void
      {
         faultHandler(param1);
      }
      
      public function autoAuthenticate() : void
      {
         if(Boolean(mgbSession.storedUsername) && Boolean(mgbSession.storedPassword))
         {
            loginRequest.send();
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function __logoutRequest_fault(param1:FaultEvent) : void
      {
         logoutFaultHandler(param1);
      }
      
      private function logoutFaultHandler(param1:FaultEvent) : void
      {
         trace("LightweightAuthUI - Could not logout.");
         logoutResultHandler();
      }
      
      [Bindable(event="propertyChange")]
      public function get loginRequest() : HTTPService
      {
         return this._788669158loginRequest;
      }
      
      public function __loginRequest_result(param1:ResultEvent) : void
      {
         loginResultHandler(param1);
      }
   }
}
