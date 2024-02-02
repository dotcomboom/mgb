package korax.controls.ColorPicker
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public final class ColorHSB implements IEventDispatcher
   {
       
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _115s:uint = 0;
      
      private var _98b:uint = 0;
      
      private var _104h:uint = 0;
      
      public function ColorHSB(param1:uint = 0, param2:uint = 0, param3:uint = 0)
      {
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         h = param1;
         s = param2;
         b = param3;
      }
      
      public static function hsb_to_rgb(param1:ColorHSB) : uint
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:Number = param1.b / 100;
         if(_loc2_ == 0)
         {
            return 0;
         }
         var _loc3_:Number = param1.h % 360 / 60;
         var _loc4_:Number = param1.s / 100;
         var _loc5_:Number = Math.floor(_loc3_);
         var _loc6_:Number = 1 - _loc4_;
         var _loc7_:Number = 1 - _loc4_ * (_loc3_ - _loc5_);
         var _loc8_:Number = 1 - _loc4_ * (1 - (_loc3_ - _loc5_));
         switch(_loc5_)
         {
            case 0:
               _loc9_ = 1;
               _loc10_ = _loc8_;
               _loc11_ = _loc6_;
               break;
            case 1:
               _loc9_ = _loc7_;
               _loc10_ = 1;
               _loc11_ = _loc6_;
               break;
            case 2:
               _loc9_ = _loc6_;
               _loc10_ = 1;
               _loc11_ = _loc8_;
               break;
            case 3:
               _loc9_ = _loc6_;
               _loc10_ = _loc7_;
               _loc11_ = 1;
               break;
            case 4:
               _loc9_ = _loc8_;
               _loc10_ = _loc6_;
               _loc11_ = 1;
               break;
            case 5:
               _loc9_ = 1;
               _loc10_ = _loc6_;
               _loc11_ = _loc7_;
         }
         return (Math.round(_loc9_ * 255 * _loc2_) & 255) << 16 | (Math.round(_loc10_ * 255 * _loc2_) & 255) << 8 | Math.round(_loc11_ * 255 * _loc2_) & 255;
      }
      
      public static function rgb_to_hsb(param1:uint) : ColorHSB
      {
         var _loc2_:* = param1 >> 16 & 255;
         var _loc3_:* = param1 >> 8 & 255;
         var _loc4_:* = param1 & 255;
         var _loc5_:int = Math.min(Math.min(_loc2_,_loc3_),_loc4_);
         var _loc6_:int;
         var _loc7_:int = (_loc6_ = Math.max(Math.max(_loc2_,_loc3_),_loc4_)) - _loc5_;
         var _loc8_:int = _loc6_;
         var _loc9_:Number = _loc6_ == 0 ? 0 : Number(_loc7_) / _loc6_;
         var _loc10_:Number = 0;
         if(_loc9_ != 0)
         {
            if(_loc2_ == _loc8_)
            {
               _loc10_ = 60 * (_loc3_ - _loc4_) / _loc7_;
            }
            else if(_loc3_ == _loc8_)
            {
               _loc10_ = 120 + 60 * (_loc4_ - _loc2_) / _loc7_;
            }
            else
            {
               _loc10_ = 240 + 60 * (_loc2_ - _loc3_) / _loc7_;
            }
            if(_loc10_ < 0)
            {
               _loc10_ += 360;
            }
         }
         return new ColorHSB(Math.round(_loc10_),Math.round(_loc9_ * 100),Math.round(_loc8_ / 255 * 100));
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function to_object() : Object
      {
         return {
            "h":h,
            "s":s,
            "b":b
         };
      }
      
      public function set b(param1:uint) : void
      {
         var _loc2_:Object = this._98b;
         if(_loc2_ !== param1)
         {
            this._98b = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"b",_loc2_,param1));
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function set h(param1:uint) : void
      {
         var _loc2_:Object = this._104h;
         if(_loc2_ !== param1)
         {
            this._104h = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"h",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get b() : uint
      {
         return this._98b;
      }
      
      public function set s(param1:uint) : void
      {
         var _loc2_:Object = this._115s;
         if(_loc2_ !== param1)
         {
            this._115s = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"s",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get h() : uint
      {
         return this._104h;
      }
      
      [Bindable(event="propertyChange")]
      public function get s() : uint
      {
         return this._115s;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
   }
}
