package
{
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.controls.Image;
   import mx.core.*;
   import mx.effects.AnimateProperty;
   import mx.effects.Parallel;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ScreenShotAndAd extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1282133823fadeIn:Parallel;
      
      private var timer:Timer;
      
      private var _104387img:Image;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1091436750fadeOut:Parallel;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var images:Array;
      
      private var imgIdx:int = 0;
      
      public function ScreenShotAndAd()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"img",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":10,
                        "y":10
                     };
                  }
               })]};
            }
         });
         images = ["carousel_images/X4.PNG","carousel_images/X1.PNG","carousel_images/X2.PNG","carousel_images/X3.PNG"];
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         _ScreenShotAndAd_Parallel1_i();
         _ScreenShotAndAd_Parallel2_i();
         this.addEventListener("creationComplete",___ScreenShotAndAd_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ScreenShotAndAd._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeIn() : Parallel
      {
         return this._1282133823fadeIn;
      }
      
      public function ___ScreenShotAndAd_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         init();
      }
      
      private function _ScreenShotAndAd_AnimateProperty1_c() : AnimateProperty
      {
         var _loc1_:AnimateProperty = new AnimateProperty();
         _loc1_.property = "alpha";
         _loc1_.fromValue = 0;
         _loc1_.toValue = 1;
         return _loc1_;
      }
      
      private function _ScreenShotAndAd_AnimateProperty3_c() : AnimateProperty
      {
         var _loc1_:AnimateProperty = new AnimateProperty();
         _loc1_.property = "scaleY";
         _loc1_.fromValue = 0.3;
         _loc1_.toValue = 1;
         return _loc1_;
      }
      
      private function _ScreenShotAndAd_AnimateProperty4_c() : AnimateProperty
      {
         var _loc1_:AnimateProperty = new AnimateProperty();
         _loc1_.property = "rotation";
         _loc1_.fromValue = -5;
         _loc1_.toValue = 0;
         return _loc1_;
      }
      
      private function _ScreenShotAndAd_AnimateProperty5_c() : AnimateProperty
      {
         var _loc1_:AnimateProperty = new AnimateProperty();
         _loc1_.property = "alpha";
         _loc1_.fromValue = 1;
         _loc1_.toValue = 0;
         return _loc1_;
      }
      
      private function _ScreenShotAndAd_AnimateProperty7_c() : AnimateProperty
      {
         var _loc1_:AnimateProperty = new AnimateProperty();
         _loc1_.property = "scaleY";
         _loc1_.fromValue = 1;
         _loc1_.toValue = 0.3;
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ScreenShotAndAd = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ScreenShotAndAd_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ScreenShotAndAdWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },bindings,watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         super.initialize();
      }
      
      private function _ScreenShotAndAd_AnimateProperty2_c() : AnimateProperty
      {
         var _loc1_:AnimateProperty = new AnimateProperty();
         _loc1_.property = "scaleX";
         _loc1_.fromValue = 0.3;
         _loc1_.toValue = 1;
         return _loc1_;
      }
      
      private function _ScreenShotAndAd_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = fadeIn;
      }
      
      private function fadeOutDone(param1:Event) : void
      {
         imgIdx = (imgIdx + 1) % images.length;
         img.source = "http://s3.amazonaws.com/apphost/" + images[imgIdx];
         timer.reset();
         timer.delay = 10000;
         timer.start();
      }
      
      private function _ScreenShotAndAd_AnimateProperty6_c() : AnimateProperty
      {
         var _loc1_:AnimateProperty = new AnimateProperty();
         _loc1_.property = "scaleX";
         _loc1_.fromValue = 1;
         _loc1_.toValue = 0.3;
         return _loc1_;
      }
      
      public function __fadeOut_effectEnd(param1:EffectEvent) : void
      {
         fadeOutDone(param1);
      }
      
      public function set img(param1:Image) : void
      {
         var _loc2_:Object = this._104387img;
         if(_loc2_ !== param1)
         {
            this._104387img = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"img",_loc2_,param1));
         }
      }
      
      private function _ScreenShotAndAd_AnimateProperty8_c() : AnimateProperty
      {
         var _loc1_:AnimateProperty = new AnimateProperty();
         _loc1_.property = "rotation";
         _loc1_.fromValue = 0;
         _loc1_.toValue = 5;
         return _loc1_;
      }
      
      public function set fadeIn(param1:Parallel) : void
      {
         var _loc2_:Object = this._1282133823fadeIn;
         if(_loc2_ !== param1)
         {
            this._1282133823fadeIn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn",_loc2_,param1));
         }
      }
      
      private function _ScreenShotAndAd_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():*
         {
            return fadeIn;
         },function(param1:*):void
         {
            img.setStyle("completeEffect",param1);
         },"img.completeEffect");
         result[0] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get img() : Image
      {
         return this._104387img;
      }
      
      private function _ScreenShotAndAd_Parallel1_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         fadeIn = _loc1_;
         _loc1_.duration = 2000;
         _loc1_.children = [_ScreenShotAndAd_AnimateProperty1_c(),_ScreenShotAndAd_AnimateProperty2_c(),_ScreenShotAndAd_AnimateProperty3_c(),_ScreenShotAndAd_AnimateProperty4_c()];
         return _loc1_;
      }
      
      private function _ScreenShotAndAd_Parallel2_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         fadeOut = _loc1_;
         _loc1_.duration = 2000;
         _loc1_.children = [_ScreenShotAndAd_AnimateProperty5_c(),_ScreenShotAndAd_AnimateProperty6_c(),_ScreenShotAndAd_AnimateProperty7_c(),_ScreenShotAndAd_AnimateProperty8_c()];
         _loc1_.addEventListener("effectEnd",__fadeOut_effectEnd);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeOut() : Parallel
      {
         return this._1091436750fadeOut;
      }
      
      public function set fadeOut(param1:Parallel) : void
      {
         var _loc2_:Object = this._1091436750fadeOut;
         if(_loc2_ !== param1)
         {
            this._1091436750fadeOut = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeOut",_loc2_,param1));
         }
      }
      
      private function onTickChangePic(param1:TimerEvent = null) : void
      {
         fadeOut.play([img]);
         timer.stop();
         trace("new ad image");
      }
      
      public function enableDisplay(param1:Boolean = true) : void
      {
         if(!timer)
         {
            timer = new Timer(500);
            timer.addEventListener(TimerEvent.TIMER,onTickChangePic);
            timer.start();
         }
         else if(param1)
         {
            onTickChangePic();
         }
         if(!param1)
         {
            timer.stop();
         }
      }
   }
}
