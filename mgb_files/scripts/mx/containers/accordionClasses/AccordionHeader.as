package mx.containers.accordionClasses
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.containers.Accordion;
   import mx.controls.Button;
   import mx.core.FlexVersion;
   import mx.core.IDataRenderer;
   import mx.core.IFlexDisplayObject;
   import mx.core.mx_internal;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.StyleManager;
   
   use namespace mx_internal;
   
   public class AccordionHeader extends Button implements IDataRenderer
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      mx_internal static var createAccessibilityImplementation:Function;
       
      
      private var _data:Object;
      
      private var focusSkin:IFlexDisplayObject;
      
      private var focusObj:DisplayObject;
      
      public function AccordionHeader()
      {
         super();
         mx_internal::toggleChanged = false;
         mouseFocusEnabled = false;
         tabEnabled = false;
      }
      
      override protected function rollOverHandler(param1:MouseEvent) : void
      {
         super.rollOverHandler(param1);
         var _loc2_:Accordion = Accordion(parent);
         if(_loc2_.enabled)
         {
            _loc2_.rawChildren.setChildIndex(this,_loc2_.rawChildren.numChildren - 1);
         }
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:CSSStyleDeclaration = null;
         var _loc2_:Number = NaN;
         super.createChildren();
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
         {
            _loc1_ = StyleManager.getStyleDeclaration(className);
            if(_loc1_)
            {
               _loc2_ = _loc1_.getStyle("paddingLeft");
               if(!isNaN(_loc2_))
               {
                  setStyle("paddingLeft",_loc2_);
               }
               _loc2_ = _loc1_.getStyle("paddingRight");
               if(!isNaN(_loc2_))
               {
                  setStyle("paddingRight",_loc2_);
               }
            }
         }
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         var _loc2_:Class = null;
         var _loc3_:ISimpleStyleClient = null;
         if(param1 && !mx_internal::isEffectStarted)
         {
            if(!focusObj)
            {
               _loc2_ = getStyle("focusSkin");
               focusObj = new _loc2_();
               _loc3_ = focusObj as ISimpleStyleClient;
               if(_loc3_)
               {
                  _loc3_.styleName = this;
               }
               addChild(focusObj);
               focusSkin = focusObj as IFlexDisplayObject;
            }
            if(focusSkin)
            {
               focusSkin.move(0,0);
               focusSkin.setActualSize(unscaledWidth,unscaledHeight);
            }
            focusObj.visible = true;
            dispatchEvent(new Event("focusDraw"));
         }
         else if(focusObj)
         {
            focusObj.visible = false;
         }
      }
      
      override mx_internal function layoutContents(param1:Number, param2:Number, param3:Boolean) : void
      {
         super.mx_internal::layoutContents(param1,param2,param3);
         if(focusObj)
         {
            setChildIndex(focusObj,numChildren - 1);
         }
      }
      
      override protected function initializeAccessibility() : void
      {
         if(AccordionHeader.mx_internal::createAccessibilityImplementation != null)
         {
            AccordionHeader.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      override public function get data() : Object
      {
         return _data;
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
      }
      
      override public function set selected(param1:Boolean) : void
      {
         mx_internal::_selected = param1;
         invalidateDisplayList();
      }
   }
}
