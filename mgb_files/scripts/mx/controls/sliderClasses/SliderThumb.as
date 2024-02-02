package mx.controls.sliderClasses
{
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import mx.controls.Button;
   import mx.controls.ButtonPhase;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class SliderThumb extends Button
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var xOffset:Number;
      
      mx_internal var thumbIndex:int;
      
      public function SliderThumb()
      {
         super();
         stickyHighlighting = true;
      }
      
      public function get xPosition() : Number
      {
         return mx_internal::$x + width / 2;
      }
      
      public function set xPosition(param1:Number) : void
      {
         mx_internal::$x = param1 - width / 2;
         Slider(owner).mx_internal::drawTrackHighlight();
      }
      
      override protected function mouseDownHandler(param1:MouseEvent) : void
      {
         super.mouseDownHandler(param1);
         if(enabled)
         {
            xOffset = param1.localX;
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
            systemManager.deployMouseShields(true);
            Slider(owner).mx_internal::onThumbPress(this);
         }
      }
      
      mx_internal function onTweenEnd(param1:Number) : void
      {
         moveXPos(param1);
      }
      
      private function updateValue() : void
      {
         Slider(owner).mx_internal::updateThumbValue(mx_internal::thumbIndex);
      }
      
      private function calculateXPos(param1:Number, param2:Boolean = false) : Number
      {
         var _loc3_:Object = Slider(owner).mx_internal::getXBounds(mx_internal::thumbIndex);
         var _loc4_:Number = Math.min(Math.max(param1,_loc3_.min),_loc3_.max);
         if(!param2)
         {
            _loc4_ = Slider(owner).mx_internal::getSnapValue(_loc4_,this);
         }
         return _loc4_;
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(enabled)
         {
            _loc2_ = new Point(param1.stageX,param1.stageY);
            _loc2_ = Slider(owner).mx_internal::innerSlider.globalToLocal(_loc2_);
            moveXPos(_loc2_.x - xOffset + width / 2,false,true);
            Slider(owner).mx_internal::onThumbMove(this);
         }
      }
      
      private function moveXPos(param1:Number, param2:Boolean = false, param3:Boolean = false) : Number
      {
         var _loc4_:Number = calculateXPos(param1,param2);
         xPosition = _loc4_;
         if(!param3)
         {
            updateValue();
         }
         return _loc4_;
      }
      
      override mx_internal function buttonReleased() : void
      {
         super.mx_internal::buttonReleased();
         if(enabled)
         {
            systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
            systemManager.deployMouseShields(false);
            Slider(owner).mx_internal::onThumbRelease(this);
         }
      }
      
      override public function set x(param1:Number) : void
      {
         var _loc2_:Number = moveXPos(param1);
         updateValue();
         super.x = _loc2_;
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         mx_internal::phase = param1 ? ButtonPhase.DOWN : ButtonPhase.UP;
      }
      
      mx_internal function onTweenUpdate(param1:Number) : void
      {
         moveXPos(param1,true,true);
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc6_:Number = NaN;
         var _loc2_:* = Slider(owner).thumbCount > 1;
         var _loc3_:Number = xPosition;
         var _loc4_:Number = Slider(owner).snapInterval > 0 ? Slider(owner).mx_internal::getSnapIntervalWidth() : 1;
         var _loc5_:* = Slider(owner).direction == SliderDirection.HORIZONTAL;
         if(param1.keyCode == Keyboard.DOWN && !_loc5_ || param1.keyCode == Keyboard.LEFT && _loc5_)
         {
            _loc6_ = _loc3_ - _loc4_;
         }
         else if(param1.keyCode == Keyboard.UP && !_loc5_ || param1.keyCode == Keyboard.RIGHT && _loc5_)
         {
            _loc6_ = _loc3_ + _loc4_;
         }
         else if(param1.keyCode == Keyboard.PAGE_DOWN && !_loc5_ || param1.keyCode == Keyboard.HOME && _loc5_)
         {
            _loc6_ = Slider(owner).mx_internal::getXFromValue(Slider(owner).minimum);
         }
         else if(param1.keyCode == Keyboard.PAGE_UP && !_loc5_ || param1.keyCode == Keyboard.END && _loc5_)
         {
            _loc6_ = Slider(owner).mx_internal::getXFromValue(Slider(owner).maximum);
         }
         if(!isNaN(_loc6_))
         {
            param1.stopPropagation();
            Slider(owner).mx_internal::keyInteraction = true;
            moveXPos(_loc6_);
         }
      }
      
      override protected function measure() : void
      {
         super.measure();
         measuredWidth = 12;
         measuredHeight = 12;
      }
   }
}
