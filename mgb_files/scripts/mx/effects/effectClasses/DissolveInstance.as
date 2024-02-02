package mx.effects.effectClasses
{
   import flash.events.Event;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.FlexEvent;
   import mx.graphics.RoundedRectangle;
   import mx.styles.StyleManager;
   
   use namespace mx_internal;
   
   public class DissolveInstance extends TweenEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      public var color:uint = 4294967295;
      
      public var alphaFrom:Number;
      
      private var overlay:UIComponent;
      
      public var alphaTo:Number;
      
      mx_internal var persistAfterEnd:Boolean = false;
      
      public var targetArea:RoundedRectangle;
      
      public function DissolveInstance(param1:Object)
      {
         super(param1);
      }
      
      override public function initEffect(param1:Event) : void
      {
         super.initEffect(param1);
         switch(param1.type)
         {
            case "childrenCreationComplete":
            case FlexEvent.CREATION_COMPLETE:
            case "resizeEnd":
            case FlexEvent.SHOW:
            case Event.ADDED:
               if(isNaN(alphaFrom))
               {
                  alphaFrom = 0;
               }
               if(isNaN(alphaTo))
               {
                  alphaTo = target.alpha;
               }
               break;
            case FlexEvent.HIDE:
            case "resizeStart":
            case Event.REMOVED:
               if(isNaN(alphaFrom))
               {
                  alphaFrom = target.alpha;
               }
               if(isNaN(alphaTo))
               {
                  alphaTo = 0;
               }
         }
      }
      
      private function overlayCreatedHandler(param1:ChildExistenceChangedEvent) : void
      {
         target.removeEventListener(ChildExistenceChangedEvent.OVERLAY_CREATED,overlayCreatedHandler);
         param1.stopImmediatePropagation();
         overlay = UIComponent(param1.relatedObject);
         tween = createTween(this,1 - alphaFrom,1 - alphaTo,duration);
         mx_internal::applyTweenStartValues();
      }
      
      override public function onTweenEnd(param1:Object) : void
      {
         super.onTweenEnd(param1);
         if(!mx_internal::persistAfterEnd)
         {
            target.mx_internal::removeOverlay();
         }
      }
      
      override public function play() : void
      {
         var _loc4_:Number = NaN;
         super.play();
         var _loc1_:PropertyChanges = propertyChanges;
         if(isNaN(alphaFrom) && isNaN(alphaTo))
         {
            if(Boolean(_loc1_) && _loc1_.end["alpha"] !== undefined)
            {
               alphaFrom = target.alpha;
               alphaTo = _loc1_.end["alpha"];
            }
            else if(Boolean(_loc1_) && _loc1_.end["visible"] !== undefined)
            {
               alphaFrom = !!_loc1_.start["visible"] ? Number(target.alpha) : 0;
               alphaTo = !!_loc1_.end["visible"] ? Number(target.alpha) : 0;
            }
            else
            {
               alphaFrom = 0;
               alphaTo = target.alpha;
            }
         }
         else if(isNaN(alphaFrom))
         {
            alphaFrom = alphaTo == 0 ? Number(target.alpha) : 0;
         }
         else if(isNaN(alphaTo))
         {
            if(Boolean(_loc1_) && _loc1_.end["alpha"] !== undefined)
            {
               alphaTo = _loc1_.end["alpha"];
            }
            else
            {
               alphaTo = alphaFrom == 0 ? Number(target.alpha) : 0;
            }
         }
         if(color == StyleManager.NOT_A_COLOR)
         {
            color = 16777215;
            _loc4_ = Number(target.getStyle("backgroundColor"));
            if(isNaN(_loc4_) && Boolean(target.parent))
            {
               _loc4_ = Number(target.parent.getStyle("backgroundColor"));
            }
            if(!isNaN(_loc4_))
            {
               color = uint(_loc4_);
            }
         }
         var _loc2_:Number = Number(target.width);
         var _loc3_:Number = Number(target.height);
         target.addEventListener(ChildExistenceChangedEvent.OVERLAY_CREATED,overlayCreatedHandler);
         target.mx_internal::addOverlay(color,targetArea);
      }
      
      override public function onTweenUpdate(param1:Object) : void
      {
         overlay.alpha = Number(param1);
      }
   }
}
