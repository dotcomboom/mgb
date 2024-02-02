package mx.validators
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.core.IMXMLObject;
   import mx.core.mx_internal;
   import mx.events.ValidationResultEvent;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   use namespace mx_internal;
   
   public class Validator extends EventDispatcher implements IMXMLObject
   {
      
      protected static const DECIMAL_DIGITS:String = "0123456789";
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      protected static const ROMAN_LETTERS:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
       
      
      private var _resourceManager:IResourceManager;
      
      private var _enabled:Boolean = true;
      
      private var _listener:Object;
      
      protected var subFields:Array;
      
      private var document:Object;
      
      public var required:Boolean = true;
      
      private var requiredFieldErrorOverride:String;
      
      private var _triggerEvent:String = "valueCommit";
      
      private var _source:Object;
      
      private var _property:String;
      
      private var _requiredFieldError:String;
      
      private var _trigger:IEventDispatcher;
      
      public function Validator()
      {
         _resourceManager = ResourceManager.getInstance();
         subFields = [];
         super();
         resourceManager.addEventListener(Event.CHANGE,resourceManager_changeHandler,false,0,true);
         resourcesChanged();
      }
      
      private static function findObjectFromString(param1:Object, param2:String) : Object
      {
         var resourceManager:IResourceManager = null;
         var message:String = null;
         var doc:Object = param1;
         var value:String = param2;
         var obj:Object = doc;
         var parts:Array = value.split(".");
         var n:int = int(parts.length);
         var i:int = 0;
         while(i < n)
         {
            try
            {
               obj = obj[parts[i]];
               if(obj == null)
               {
               }
            }
            catch(error:Error)
            {
               if(error is TypeError && error.message.indexOf("null has no properties") != -1)
               {
                  resourceManager = ResourceManager.getInstance();
                  message = String(resourceManager.getString("validators","fieldNotFound",[value]));
                  throw new Error(message);
               }
               throw error;
            }
            i++;
         }
         return obj;
      }
      
      private static function trimString(param1:String) : String
      {
         var _loc2_:int = 0;
         while(param1.indexOf(" ",_loc2_) == _loc2_)
         {
            _loc2_++;
         }
         var _loc3_:int = param1.length - 1;
         while(param1.lastIndexOf(" ",_loc3_) == _loc3_)
         {
            _loc3_--;
         }
         return _loc3_ >= _loc2_ ? param1.slice(_loc2_,_loc3_ + 1) : "";
      }
      
      public static function validateAll(param1:Array) : Array
      {
         var _loc5_:Validator = null;
         var _loc6_:ValidationResultEvent = null;
         var _loc2_:Array = [];
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = Validator(param1[_loc4_])).enabled)
            {
               if((_loc6_ = _loc5_.validate()).type != ValidationResultEvent.VALID)
               {
                  _loc2_.push(_loc6_);
               }
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function triggerHandler(param1:Event) : void
      {
         validate();
      }
      
      public function set enabled(param1:Boolean) : void
      {
         _enabled = param1;
      }
      
      public function set triggerEvent(param1:String) : void
      {
         if(_triggerEvent == param1)
         {
            return;
         }
         removeTriggerHandler();
         _triggerEvent = param1;
         addTriggerHandler();
      }
      
      protected function getValueFromSource() : Object
      {
         var _loc1_:String = null;
         if(Boolean(_source) && Boolean(_property))
         {
            return _source[_property];
         }
         if(!_source && Boolean(_property))
         {
            _loc1_ = String(resourceManager.getString("validators","SAttributeMissing"));
            throw new Error(_loc1_);
         }
         if(Boolean(_source) && !_property)
         {
            _loc1_ = String(resourceManager.getString("validators","PAttributeMissing"));
            throw new Error(_loc1_);
         }
         return null;
      }
      
      protected function addListenerHandler() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Array = actualListeners;
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = _loc2_[_loc4_];
            if(_loc1_ is IValidatorListener)
            {
               addEventListener(ValidationResultEvent.VALID,IValidatorListener(_loc1_).validationResultHandler);
               addEventListener(ValidationResultEvent.INVALID,IValidatorListener(_loc1_).validationResultHandler);
            }
            _loc4_++;
         }
      }
      
      private function removeTriggerHandler() : void
      {
         if(actualTrigger)
         {
            actualTrigger.removeEventListener(_triggerEvent,triggerHandler);
         }
      }
      
      public function validate(param1:Object = null, param2:Boolean = false) : ValidationResultEvent
      {
         if(param1 == null)
         {
            param1 = getValueFromSource();
         }
         if(isRealValue(param1) || required)
         {
            return processValidation(param1,param2);
         }
         return new ValidationResultEvent(ValidationResultEvent.VALID);
      }
      
      public function get source() : Object
      {
         return _source;
      }
      
      public function set property(param1:String) : void
      {
         _property = param1;
      }
      
      public function get requiredFieldError() : String
      {
         return _requiredFieldError;
      }
      
      protected function handleResults(param1:Array) : ValidationResultEvent
      {
         var _loc2_:ValidationResultEvent = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param1.length > 0)
         {
            _loc2_ = new ValidationResultEvent(ValidationResultEvent.INVALID);
            _loc2_.results = param1;
            if(subFields.length > 0)
            {
               _loc3_ = {};
               _loc5_ = int(param1.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  if(_loc4_ = String(param1[_loc6_].subField))
                  {
                     _loc3_[_loc4_] = true;
                  }
                  _loc6_++;
               }
               _loc5_ = int(subFields.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  if(!_loc3_[subFields[_loc6_]])
                  {
                     param1.push(new ValidationResult(false,subFields[_loc6_]));
                  }
                  _loc6_++;
               }
            }
         }
         else
         {
            _loc2_ = new ValidationResultEvent(ValidationResultEvent.VALID);
         }
         return _loc2_;
      }
      
      public function get listener() : Object
      {
         return _listener;
      }
      
      public function get trigger() : IEventDispatcher
      {
         return _trigger;
      }
      
      public function set source(param1:Object) : void
      {
         var _loc2_:String = null;
         if(_source == param1)
         {
            return;
         }
         if(param1 is String)
         {
            _loc2_ = String(resourceManager.getString("validators","SAttribute",[param1]));
            throw new Error(_loc2_);
         }
         removeTriggerHandler();
         removeListenerHandler();
         _source = param1;
         addTriggerHandler();
         addListenerHandler();
      }
      
      [Bindable("unused")]
      protected function get resourceManager() : IResourceManager
      {
         return _resourceManager;
      }
      
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      private function processValidation(param1:Object, param2:Boolean) : ValidationResultEvent
      {
         var _loc3_:ValidationResultEvent = null;
         var _loc4_:Array = null;
         if(_enabled)
         {
            _loc4_ = doValidation(param1);
            _loc3_ = handleResults(_loc4_);
         }
         else
         {
            param2 = true;
         }
         if(!param2)
         {
            dispatchEvent(_loc3_);
         }
         return _loc3_;
      }
      
      public function get triggerEvent() : String
      {
         return _triggerEvent;
      }
      
      protected function get actualTrigger() : IEventDispatcher
      {
         if(_trigger)
         {
            return _trigger;
         }
         if(_source)
         {
            return _source as IEventDispatcher;
         }
         return null;
      }
      
      protected function resourcesChanged() : void
      {
         requiredFieldError = requiredFieldErrorOverride;
      }
      
      protected function get actualListeners() : Array
      {
         var _loc1_:Array = [];
         if(_listener)
         {
            _loc1_.push(_listener);
         }
         else if(_source)
         {
            _loc1_.push(_source);
         }
         return _loc1_;
      }
      
      protected function removeListenerHandler() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Array = actualListeners;
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = _loc2_[_loc4_];
            if(_loc1_ is IValidatorListener)
            {
               removeEventListener(ValidationResultEvent.VALID,IValidatorListener(_loc1_).validationResultHandler);
               removeEventListener(ValidationResultEvent.INVALID,IValidatorListener(_loc1_).validationResultHandler);
            }
            _loc4_++;
         }
      }
      
      public function initialized(param1:Object, param2:String) : void
      {
         this.document = param1;
      }
      
      public function get property() : String
      {
         return _property;
      }
      
      public function set requiredFieldError(param1:String) : void
      {
         requiredFieldErrorOverride = param1;
         _requiredFieldError = param1 != null ? param1 : String(resourceManager.getString("validators","requiredFieldError"));
      }
      
      private function validateRequired(param1:Object) : ValidationResult
      {
         var _loc2_:String = null;
         if(required)
         {
            _loc2_ = param1 != null ? String(param1) : "";
            _loc2_ = trimString(_loc2_);
            if(_loc2_.length == 0)
            {
               return new ValidationResult(true,"","requiredField",requiredFieldError);
            }
         }
         return null;
      }
      
      protected function doValidation(param1:Object) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:ValidationResult = validateRequired(param1);
         if(_loc3_)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public function set listener(param1:Object) : void
      {
         removeListenerHandler();
         _listener = param1;
         addListenerHandler();
      }
      
      protected function isRealValue(param1:Object) : Boolean
      {
         return param1 != null;
      }
      
      public function set trigger(param1:IEventDispatcher) : void
      {
         removeTriggerHandler();
         _trigger = param1;
         addTriggerHandler();
      }
      
      private function addTriggerHandler() : void
      {
         if(actualTrigger)
         {
            actualTrigger.addEventListener(_triggerEvent,triggerHandler);
         }
      }
      
      private function resourceManager_changeHandler(param1:Event) : void
      {
         resourcesChanged();
      }
   }
}
