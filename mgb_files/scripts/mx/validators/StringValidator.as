package mx.validators
{
   import mx.core.mx_internal;
   import mx.utils.StringUtil;
   
   use namespace mx_internal;
   
   public class StringValidator extends Validator
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var minLengthOverride:Object;
      
      private var tooShortErrorOverride:String;
      
      private var maxLengthOverride:Object;
      
      private var _tooLongError:String;
      
      private var _minLength:Object;
      
      private var _tooShortError:String;
      
      private var tooLongErrorOverride:String;
      
      private var _maxLength:Object;
      
      public function StringValidator()
      {
         super();
      }
      
      public static function validateString(param1:StringValidator, param2:Object, param3:String = null) : Array
      {
         var _loc4_:Array = [];
         var _loc5_:Number = Number(param1.maxLength);
         var _loc6_:Number = Number(param1.minLength);
         var _loc7_:String = param2 != null ? String(param2) : "";
         if(!isNaN(_loc5_) && _loc7_.length > _loc5_)
         {
            _loc4_.push(new ValidationResult(true,param3,"tooLong",StringUtil.substitute(param1.tooLongError,_loc5_)));
            return _loc4_;
         }
         if(!isNaN(_loc6_) && _loc7_.length < _loc6_)
         {
            _loc4_.push(new ValidationResult(true,param3,"tooShort",StringUtil.substitute(param1.tooShortError,_loc6_)));
            return _loc4_;
         }
         return _loc4_;
      }
      
      public function set tooShortError(param1:String) : void
      {
         tooShortErrorOverride = param1;
         _tooShortError = param1 != null ? param1 : String(resourceManager.getString("validators","tooShortError"));
      }
      
      public function set maxLength(param1:Object) : void
      {
         maxLengthOverride = param1;
         _maxLength = param1 != null ? Number(param1) : resourceManager.getNumber("validators","maxLength");
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         maxLength = maxLengthOverride;
         minLength = minLengthOverride;
         tooLongError = tooLongErrorOverride;
         tooShortError = tooShortErrorOverride;
      }
      
      public function get minLength() : Object
      {
         return _minLength;
      }
      
      public function get tooShortError() : String
      {
         return _tooShortError;
      }
      
      public function get maxLength() : Object
      {
         return _maxLength;
      }
      
      public function set tooLongError(param1:String) : void
      {
         tooLongErrorOverride = param1;
         _tooLongError = param1 != null ? param1 : String(resourceManager.getString("validators","tooLongError"));
      }
      
      public function set minLength(param1:Object) : void
      {
         minLengthOverride = param1;
         _minLength = param1 != null ? Number(param1) : resourceManager.getNumber("validators","minLength");
      }
      
      public function get tooLongError() : String
      {
         return _tooLongError;
      }
      
      override protected function doValidation(param1:Object) : Array
      {
         var _loc2_:Array = super.doValidation(param1);
         var _loc3_:String = !!param1 ? String(param1) : "";
         if(_loc2_.length > 0 || _loc3_.length == 0 && !required)
         {
            return _loc2_;
         }
         return StringValidator.validateString(this,param1,null);
      }
   }
}
