package com.mgb.managers
{
   public class CommandEngine
   {
      
      private static const OPTIONAL:String = "optional";
      
      public static var commandTable:Object = {
         "jump":{
            "mapname":OPTIONAL,
            "x":REQUIRED,
            "y":REQUIRED,
            "effect":OPTIONAL
         },
         "music":{
            "source":REQUIRED,
            "loops":REQUIRED
         },
         "raiseSkillLevel":{
            "skillname":REQUIRED,
            "newMinLevel":REQUIRED
         }
      };
      
      private static const REQUIRED:String = "required";
       
      
      public function CommandEngine()
      {
         super();
      }
      
      public static function parse(param1:String) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc2_:Object = new Object();
         _loc2_.error = new Boolean();
         _loc2_.errorMessage = "";
         var _loc3_:int = param1.indexOf(":");
         if(_loc3_ == -1)
         {
            _loc2_.error = true;
            _loc2_.errorMessage = "No \'command:\' found in event";
         }
         if(!_loc2_.error)
         {
            _loc2_.command = new String(param1.substr(0,_loc3_));
            if((_loc4_ = commandTable[_loc2_.command]) == null)
            {
               _loc2_.error = true;
               _loc2_.errorMessage = "Unknown command \'" + _loc2_.command + "\' found in event";
            }
         }
         if(!_loc2_.error)
         {
            _loc5_ = param1.slice(_loc3_ + 1).split(",");
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length && !_loc2_.error)
            {
               _loc7_ = _loc5_[_loc6_].split("=");
               _loc8_ = (_loc8_ = String(_loc7_[0]).replace(/^\s*/,"")).replace(/\s*$/,"");
               if(_loc4_[_loc8_] == null)
               {
                  _loc2_.error = true;
                  _loc2_.errorMessage = "Unknown parameter \'" + _loc8_ + "\' found in event";
               }
               else
               {
                  _loc2_[_loc8_] = _loc7_[1];
               }
               _loc6_++;
            }
         }
         if(!_loc2_.error)
         {
            for(_loc9_ in _loc4_)
            {
               if(_loc4_[_loc9_] == "required" && _loc2_[_loc9_] == null)
               {
                  if(!_loc2_.error)
                  {
                     _loc2_.errorMessage = "The following parameters are missing, but required for this command: ";
                  }
                  else
                  {
                     _loc2_.errorMessage += ", ";
                  }
                  _loc2_.error = true;
                  _loc2_.errorMessage += "\'" + _loc9_ + "\'";
               }
            }
         }
         if(_loc2_.error)
         {
            _loc2_.errorMessage += ". Error ocurred while parsing command line: \'" + param1 + "\'.";
         }
         return _loc2_;
      }
      
      public static function encode(param1:Object) : String
      {
         var _loc5_:String = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Object = commandTable[param1.command];
         if(_loc2_ == null)
         {
            trace("CommandEngine.encode(): unknown command " + param1.command);
            return null;
         }
         var _loc3_:* = new String(param1.command + ": ");
         var _loc4_:int = 0;
         for(_loc5_ in _loc2_)
         {
            if(_loc2_[_loc5_] == REQUIRED && param1[_loc5_] == null)
            {
               trace("parameter \'" + _loc5_ + "\' is missing, but is required for command: " + param1.command);
               return null;
            }
            if(param1[_loc5_] != null)
            {
               if(_loc4_ > 0)
               {
                  _loc3_ += ",";
               }
               _loc3_ += _loc5_ + "=" + String(param1[_loc5_]);
               _loc4_++;
            }
         }
         return _loc3_;
      }
   }
}
