package mx.binding.utils
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import mx.core.EventPriority;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.utils.DescribeTypeCache;
   
   use namespace mx_internal;
   
   public class ChangeWatcher
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var commitOnly:Boolean;
      
      private var host:Object;
      
      private var handler:Function;
      
      private var getter:Function;
      
      private var name:String;
      
      private var events:Object;
      
      private var next:ChangeWatcher;
      
      public function ChangeWatcher(param1:Object, param2:Function, param3:Boolean = false, param4:ChangeWatcher = null)
      {
         super();
         host = null;
         name = param1 is String ? param1 as String : String(param1.name);
         getter = param1 is String ? null : param1.getter;
         this.handler = param2;
         this.commitOnly = param3;
         this.next = param4;
         events = {};
      }
      
      private static function isEmpty(param1:Object) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         for(_loc2_ in _loc4_)
         {
            return false;
         }
         return true;
      }
      
      public static function getEvents(param1:Object, param2:String, param3:Boolean = false) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         if(param1 is IEventDispatcher)
         {
            _loc4_ = DescribeTypeCache.describeType(param1).bindabilityInfo.getChangeEvents(param2);
            if(param3)
            {
               _loc5_ = {};
               for(_loc6_ in _loc4_)
               {
                  if(_loc4_[_loc6_])
                  {
                     _loc5_[_loc6_] = true;
                  }
               }
               return _loc5_;
            }
            return _loc4_;
         }
         return {};
      }
      
      public static function watch(param1:Object, param2:Object, param3:Function, param4:Boolean = false) : ChangeWatcher
      {
         var _loc5_:ChangeWatcher = null;
         if(!(param2 is Array))
         {
            param2 = [param2];
         }
         if(param2.length > 0)
         {
            (_loc5_ = new ChangeWatcher(param2[0],param3,param4,watch(null,param2.slice(1),param3,param4))).reset(param1);
            return _loc5_;
         }
         return null;
      }
      
      public static function canWatch(param1:Object, param2:String, param3:Boolean = false) : Boolean
      {
         return !isEmpty(getEvents(param1,param2,param3));
      }
      
      private function getHostPropertyValue() : Object
      {
         return host == null ? null : (getter != null ? getter(host) : host[name]);
      }
      
      public function isWatching() : Boolean
      {
         return !isEmpty(events) && (next == null || next.isWatching());
      }
      
      public function unwatch() : void
      {
         reset(null);
      }
      
      private function wrapHandler(param1:Event) : void
      {
         if(next)
         {
            next.reset(getHostPropertyValue());
         }
         if(param1 is PropertyChangeEvent)
         {
            if((param1 as PropertyChangeEvent).property == name)
            {
               handler(param1 as PropertyChangeEvent);
            }
         }
         else
         {
            handler(param1);
         }
      }
      
      public function setHandler(param1:Function) : void
      {
         this.handler = param1;
         if(next)
         {
            next.setHandler(param1);
         }
      }
      
      public function getValue() : Object
      {
         return host == null ? null : (next == null ? getHostPropertyValue() : next.getValue());
      }
      
      public function reset(param1:Object) : void
      {
         var _loc2_:String = null;
         if(host != null)
         {
            for(_loc2_ in events)
            {
               host.removeEventListener(_loc2_,wrapHandler);
            }
            events = {};
         }
         host = param1;
         if(host != null)
         {
            events = getEvents(host,name,commitOnly);
            for(_loc2_ in events)
            {
               host.addEventListener(_loc2_,wrapHandler,false,EventPriority.BINDING,false);
            }
         }
         if(next)
         {
            next.reset(getHostPropertyValue());
         }
      }
   }
}
