package mx.binding
{
   import flash.events.Event;
   import mx.core.IRepeaterClient;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class RepeatableBinding extends Binding
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public function RepeatableBinding(param1:Object, param2:Function, param3:Function, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      public function eventHandler(param1:Event) : void
      {
         if(mx_internal::isHandlingEvent)
         {
            return;
         }
         mx_internal::isHandlingEvent = true;
         execute();
         mx_internal::isHandlingEvent = false;
      }
      
      override public function execute(param1:Object = null) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         if(mx_internal::isExecuting)
         {
            return;
         }
         mx_internal::isExecuting = true;
         if(!param1)
         {
            _loc2_ = String(mx_internal::destString.substring(0,mx_internal::destString.indexOf(".")));
            param1 = mx_internal::document[_loc2_];
         }
         else if(typeof param1 == "number")
         {
            _loc2_ = String(mx_internal::destString.substring(0,mx_internal::destString.indexOf(".")));
            _loc3_ = mx_internal::document[_loc2_] as Array;
            if(_loc3_)
            {
               param1 = _loc3_[param1];
            }
            else
            {
               param1 = null;
            }
         }
         if(param1)
         {
            recursivelyProcessIDArray(param1);
         }
         mx_internal::isExecuting = false;
      }
      
      private function recursivelyProcessIDArray(param1:Object) : void
      {
         var array:Array = null;
         var n:int = 0;
         var i:int = 0;
         var client:IRepeaterClient = null;
         var o:Object = param1;
         if(o is Array)
         {
            array = o as Array;
            n = int(array.length);
            i = 0;
            while(i < n)
            {
               recursivelyProcessIDArray(array[i]);
               i++;
            }
         }
         else if(o is IRepeaterClient)
         {
            client = IRepeaterClient(o);
            wrapFunctionCall(this,function():void
            {
               var _loc1_:Object = wrapFunctionCall(this,mx_internal::srcFunc,null,client.instanceIndices,client.repeaterIndices);
               if(BindingManager.debugDestinationStrings[mx_internal::destString])
               {
                  trace("RepeatableBinding: destString = " + mx_internal::destString + ", srcFunc result = " + _loc1_);
               }
               mx_internal::destFunc(_loc1_,client.instanceIndices);
            },o);
         }
      }
   }
}
