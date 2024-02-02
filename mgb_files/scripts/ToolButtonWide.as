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
   import mx.controls.Button;
   import mx.core.*;
   import mx.effects.Glow;
   import mx.effects.easing.*;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ToolButtonWide extends Button implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindings:Array;
      
      private var _339214806showGlow:Glow;
      
      mx_internal var _watchers:Array;
      
      public function ToolButtonWide()
      {
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.textAlign = "left";
         };
         this.height = 20;
         this.labelPlacement = "right";
         this.width = 96;
         _ToolButtonWide_Glow1_i();
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ToolButtonWide._watcherSetupUtil = param1;
      }
      
      public function set showGlow(param1:Glow) : void
      {
         var _loc2_:Object = this._339214806showGlow;
         if(_loc2_ !== param1)
         {
            this._339214806showGlow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showGlow",_loc2_,param1));
         }
      }
      
      private function _ToolButtonWide_Glow1_i() : Glow
      {
         var _loc1_:Glow = new Glow();
         showGlow = _loc1_;
         _loc1_.alphaFrom = 0.8;
         _loc1_.alphaTo = 0;
         _loc1_.duration = 1400;
         _loc1_.color = 4210752;
         _loc1_.blurXFrom = 24;
         _loc1_.blurXTo = 0;
         _loc1_.blurYFrom = 16;
         _loc1_.blurYTo = 0;
         _loc1_.inner = false;
         _loc1_.strength = 4;
         _loc1_.startDelay = 100;
         BindingManager.executeBindings(this,"showGlow",showGlow);
         return _loc1_;
      }
      
      private function _ToolButtonWide_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():*
         {
            return showGlow;
         },function(param1:*):void
         {
            this.setStyle("addedEffect",param1);
         },"this.addedEffect");
         result[0] = binding;
         binding = new Binding(this,function():Function
         {
            return Quadratic.easeIn;
         },function(param1:Function):void
         {
            showGlow.easingFunction = param1;
         },"showGlow.easingFunction");
         result[1] = binding;
         return result;
      }
      
      override public function initialize() : void
      {
         var i:uint;
         var target:ToolButtonWide = null;
         var watcherSetupUtilClass:Object = null;
         var bindings:Array = _ToolButtonWide_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ToolButtonWideWatcherSetupUtil");
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
      
      [Bindable(event="propertyChange")]
      public function get showGlow() : Glow
      {
         return this._339214806showGlow;
      }
      
      private function _ToolButtonWide_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = showGlow;
         _loc1_ = Quadratic.easeIn;
      }
   }
}
