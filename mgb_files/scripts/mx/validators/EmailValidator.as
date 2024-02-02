package mx.validators
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class EmailValidator extends Validator
   {
      
      private static const DISALLOWED_DOMAIN_CHARS:String = "()<>,;:\\\"[] `~!#$%^&*+={}|/?\'";
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static const DISALLOWED_LOCALNAME_CHARS:String = "()<>,;:\\\"[] `~!#$%^&*={}|/?\'";
       
      
      private var _missingUsernameError:String;
      
      private var tooManyAtSignsErrorOverride:String;
      
      private var _invalidIPDomainError:String;
      
      private var invalidCharErrorOverride:String;
      
      private var invalidPeriodsInDomainErrorOverride:String;
      
      private var invalidIPDomainErrorOverride:String;
      
      private var _invalidDomainError:String;
      
      private var _missingPeriodInDomainError:String;
      
      private var invalidDomainErrorOverride:String;
      
      private var missingPeriodInDomainErrorOverride:String;
      
      private var _invalidPeriodsInDomainError:String;
      
      private var _tooManyAtSignsError:String;
      
      private var _missingAtSignError:String;
      
      private var _invalidCharError:String;
      
      private var missingAtSignErrorOverride:String;
      
      private var missingUsernameErrorOverride:String;
      
      public function EmailValidator()
      {
         super();
      }
      
      public static function validateEmail(param1:EmailValidator, param2:Object, param3:String) : Array
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc4_:Array = [];
         var _loc5_:String = String(param2);
         var _loc6_:String = "";
         var _loc7_:String = "";
         var _loc10_:int;
         if((_loc10_ = _loc5_.indexOf("@")) == -1)
         {
            _loc4_.push(new ValidationResult(true,param3,"missingAtSign",param1.missingAtSignError));
            return _loc4_;
         }
         if(_loc5_.indexOf("@",_loc10_ + 1) != -1)
         {
            _loc4_.push(new ValidationResult(true,param3,"tooManyAtSigns",param1.tooManyAtSignsError));
            return _loc4_;
         }
         _loc6_ = _loc5_.substring(0,_loc10_);
         _loc7_ = _loc5_.substring(_loc10_ + 1);
         var _loc11_:int;
         if((_loc11_ = _loc6_.length) == 0)
         {
            _loc4_.push(new ValidationResult(true,param3,"missingUsername",param1.missingUsernameError));
            return _loc4_;
         }
         _loc9_ = 0;
         while(_loc9_ < _loc11_)
         {
            if(DISALLOWED_LOCALNAME_CHARS.indexOf(_loc6_.charAt(_loc9_)) != -1)
            {
               _loc4_.push(new ValidationResult(true,param3,"invalidChar",param1.invalidCharError));
               return _loc4_;
            }
            _loc9_++;
         }
         var _loc12_:int = _loc7_.length;
         if(_loc7_.charAt(0) == "[" && _loc7_.charAt(_loc12_ - 1) == "]")
         {
            if(!isValidIPAddress(_loc7_.substring(1,_loc12_ - 1)))
            {
               _loc4_.push(new ValidationResult(true,param3,"invalidIPDomain",param1.invalidIPDomainError));
               return _loc4_;
            }
         }
         else
         {
            _loc13_ = _loc7_.indexOf(".");
            _loc14_ = 0;
            _loc15_ = "";
            if(_loc13_ == -1)
            {
               _loc4_.push(new ValidationResult(true,param3,"missingPeriodInDomain",param1.missingPeriodInDomainError));
               return _loc4_;
            }
            while((_loc14_ = _loc7_.indexOf(".",_loc13_ + 1)) != -1)
            {
               if(_loc14_ == _loc13_ + 1)
               {
                  _loc4_.push(new ValidationResult(true,param3,"invalidPeriodsInDomain",param1.invalidPeriodsInDomainError));
                  return _loc4_;
               }
               _loc13_ = _loc14_;
            }
            if((_loc15_ = _loc7_.substring(_loc13_ + 1)).length != 3 && _loc15_.length != 2 && _loc15_.length != 4 && _loc15_.length != 6)
            {
               _loc4_.push(new ValidationResult(true,param3,"invalidDomain",param1.invalidDomainError));
               return _loc4_;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc12_)
            {
               if(DISALLOWED_DOMAIN_CHARS.indexOf(_loc7_.charAt(_loc9_)) != -1)
               {
                  _loc4_.push(new ValidationResult(true,param3,"invalidChar",param1.invalidCharError));
                  return _loc4_;
               }
               _loc9_++;
            }
            if(_loc7_.charAt(0) == ".")
            {
               _loc4_.push(new ValidationResult(true,param3,"invalidDomain",param1.invalidDomainError));
               return _loc4_;
            }
         }
         return _loc4_;
      }
      
      private static function isValidIPAddress(param1:String) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = false;
         var _loc9_:* = false;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.indexOf(":") != -1)
         {
            if(_loc8_ = param1.indexOf("::") != -1)
            {
               param1 = param1.replace(/^::/,"");
               param1 = param1.replace(/::/g,":");
            }
            while((_loc4_ = param1.indexOf(":",_loc3_)) != -1)
            {
               _loc2_.push(param1.substring(_loc3_,_loc4_));
               _loc3_ = _loc4_ + 1;
            }
            _loc2_.push(param1.substring(_loc3_));
            _loc6_ = int(_loc2_.length);
            if(_loc9_ = _loc2_[_loc6_ - 1].indexOf(".") != -1)
            {
               if(_loc2_.length != 7 && !_loc8_ || _loc2_.length > 7)
               {
                  return false;
               }
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if(_loc7_ == _loc6_ - 1)
                  {
                     return isValidIPAddress(_loc2_[_loc7_]);
                  }
                  if((_loc5_ = parseInt(_loc2_[_loc7_],16)) != 0)
                  {
                     return false;
                  }
                  _loc7_++;
               }
            }
            else
            {
               if(_loc2_.length != 8 && !_loc8_ || _loc2_.length > 8)
               {
                  return false;
               }
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc5_ = parseInt(_loc2_[_loc7_],16);
                  if(isNaN(_loc5_) || _loc5_ < 0 || _loc5_ > 65535)
                  {
                     return false;
                  }
                  _loc7_++;
               }
            }
            return true;
         }
         if(param1.indexOf(".") != -1)
         {
            while((_loc4_ = param1.indexOf(".",_loc3_)) != -1)
            {
               _loc2_.push(param1.substring(_loc3_,_loc4_));
               _loc3_ = _loc4_ + 1;
            }
            _loc2_.push(param1.substring(_loc3_));
            if(_loc2_.length != 4)
            {
               return false;
            }
            _loc6_ = int(_loc2_.length);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc5_ = Number(_loc2_[_loc7_]);
               if(isNaN(_loc5_) || _loc5_ < 0 || _loc5_ > 255)
               {
                  return false;
               }
               _loc7_++;
            }
            return true;
         }
         return false;
      }
      
      public function set missingAtSignError(param1:String) : void
      {
         missingAtSignErrorOverride = param1;
         _missingAtSignError = param1 != null ? param1 : String(resourceManager.getString("validators","missingAtSignError"));
      }
      
      public function set invalidPeriodsInDomainError(param1:String) : void
      {
         invalidPeriodsInDomainErrorOverride = param1;
         _invalidPeriodsInDomainError = param1 != null ? param1 : String(resourceManager.getString("validators","invalidPeriodsInDomainError"));
      }
      
      public function set invalidIPDomainError(param1:String) : void
      {
         invalidIPDomainErrorOverride = param1;
         _invalidIPDomainError = param1 != null ? param1 : String(resourceManager.getString("validators","invalidIPDomainError"));
      }
      
      override protected function doValidation(param1:Object) : Array
      {
         var _loc2_:Array = super.doValidation(param1);
         var _loc3_:String = !!param1 ? String(param1) : "";
         if(_loc2_.length > 0 || _loc3_.length == 0 && !required)
         {
            return _loc2_;
         }
         return EmailValidator.validateEmail(this,param1,null);
      }
      
      public function set invalidDomainError(param1:String) : void
      {
         invalidDomainErrorOverride = param1;
         _invalidDomainError = param1 != null ? param1 : String(resourceManager.getString("validators","invalidDomainErrorEV"));
      }
      
      public function get invalidCharError() : String
      {
         return _invalidCharError;
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         invalidCharError = invalidCharErrorOverride;
         invalidDomainError = invalidDomainErrorOverride;
         invalidIPDomainError = invalidIPDomainErrorOverride;
         invalidPeriodsInDomainError = invalidPeriodsInDomainErrorOverride;
         missingAtSignError = missingAtSignErrorOverride;
         missingPeriodInDomainError = missingPeriodInDomainErrorOverride;
         missingUsernameError = missingUsernameErrorOverride;
         tooManyAtSignsError = tooManyAtSignsErrorOverride;
      }
      
      public function set missingUsernameError(param1:String) : void
      {
         missingUsernameErrorOverride = param1;
         _missingUsernameError = param1 != null ? param1 : String(resourceManager.getString("validators","missingUsernameError"));
      }
      
      public function get missingAtSignError() : String
      {
         return _missingAtSignError;
      }
      
      public function get invalidIPDomainError() : String
      {
         return _invalidIPDomainError;
      }
      
      public function get tooManyAtSignsError() : String
      {
         return _tooManyAtSignsError;
      }
      
      public function set tooManyAtSignsError(param1:String) : void
      {
         tooManyAtSignsErrorOverride = param1;
         _tooManyAtSignsError = param1 != null ? param1 : String(resourceManager.getString("validators","tooManyAtSignsError"));
      }
      
      public function get invalidPeriodsInDomainError() : String
      {
         return _invalidPeriodsInDomainError;
      }
      
      public function get invalidDomainError() : String
      {
         return _invalidDomainError;
      }
      
      public function set missingPeriodInDomainError(param1:String) : void
      {
         missingPeriodInDomainErrorOverride = param1;
         _missingPeriodInDomainError = param1 != null ? param1 : String(resourceManager.getString("validators","missingPeriodInDomainError"));
      }
      
      public function set invalidCharError(param1:String) : void
      {
         invalidCharErrorOverride = param1;
         _invalidCharError = param1 != null ? param1 : String(resourceManager.getString("validators","invalidCharErrorEV"));
      }
      
      public function get missingPeriodInDomainError() : String
      {
         return _missingPeriodInDomainError;
      }
      
      public function get missingUsernameError() : String
      {
         return _missingUsernameError;
      }
   }
}
