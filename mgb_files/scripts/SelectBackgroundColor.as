package
{
   import com.mgb.managers.*;
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
   import mx.controls.ColorPicker;
   import mx.core.*;
   import mx.events.ColorPickerEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class SelectBackgroundColor extends ColorPicker implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1422950650active:Boolean = true;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      mx_internal var _bindings:Array;
      
      public function SelectBackgroundColor()
      {
         _1217010542mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         this.alpha = 0.1;
         this.width = 16;
         this.height = 16;
         this.addEventListener("creationComplete",___SelectBackgroundColor_ColorPicker1_creationComplete);
         this.addEventListener("change",___SelectBackgroundColor_ColorPicker1_change);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         SelectBackgroundColor._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get active() : Boolean
      {
         return this._1422950650active;
      }
      
      override public function initialize() : void
      {
         var i:uint;
         var target:SelectBackgroundColor = null;
         var watcherSetupUtilClass:Object = null;
         var bindings:Array = _SelectBackgroundColor_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_SelectBackgroundColorWatcherSetupUtil");
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
      
      public function set active(param1:Boolean) : void
      {
         var _loc2_:Object = this._1422950650active;
         if(_loc2_ !== param1)
         {
            this._1422950650active = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"active",_loc2_,param1));
         }
      }
      
      private function applyProfile(param1:Event = null) : void
      {
         var _loc2_:String = String(Application.application.getUserProfile(this.name));
         if(active)
         {
            parentDocument.setStyle("backgroundColor",_loc2_);
            selectedColor = int(_loc2_);
         }
      }
      
      private function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      private function _SelectBackgroundColor_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = active;
         _loc1_ = "You can click this little square to choose a different color for this part of the MyGameBuilder.com UI. " + (!!mgbSession.userLoggedIn ? "Since you are logged in, your choice will be remembered" : "Your choice will not be remembered since you are not loggged in yet");
      }
      
      private function newColorClickHandler() : void
      {
         var _loc1_:String = "0x" + this.selectedColor.toString(16);
         if(active)
         {
            parentDocument.setStyle("backgroundColor",_loc1_);
         }
         Application.application.updateUserProfile(this.name,_loc1_);
      }
      
      public function ___SelectBackgroundColor_ColorPicker1_change(param1:ColorPickerEvent) : void
      {
         newColorClickHandler();
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function _SelectBackgroundColor_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return active;
         },function(param1:Boolean):void
         {
            this.visible = param1;
         },"this.visible");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "You can click this little square to choose a different color for this part of the MyGameBuilder.com UI. " + (!!mgbSession.userLoggedIn ? "Since you are logged in, your choice will be remembered" : "Your choice will not be remembered since you are not loggged in yet");
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.toolTip = param1;
         },"this.toolTip");
         result[1] = binding;
         return result;
      }
      
      public function ___SelectBackgroundColor_ColorPicker1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      private function doInit() : void
      {
         Application.application.registerForProfileUpdates(applyProfile);
      }
   }
}
