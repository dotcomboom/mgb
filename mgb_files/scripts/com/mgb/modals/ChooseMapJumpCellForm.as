package com.mgb.modals
{
   import com.mgb.controls.GameEngineTwoEditor;
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import com.mgb.utils.*;
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
   import mx.collections.*;
   import mx.containers.Canvas;
   import mx.containers.TitleWindow;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ChooseMapJumpCellForm extends TitleWindow implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindings:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _ChooseMapJumpCellForm_Canvas1:Canvas;
      
      mx_internal var _watchers:Array;
      
      private var mgbSession:MgbSession;
      
      private var jumpToY:int;
      
      private var _3343958map2:GameEngineTwoEditor;
      
      private var jumpToX:int;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var jumpToMapName:String;
      
      public function ChooseMapJumpCellForm()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "width":600,
                  "height":500,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Canvas,
                     "id":"_ChooseMapJumpCellForm_Canvas1",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "width":571,
                           "height":452,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":GameEngineTwoEditor,
                              "id":"map2"
                           })]
                        };
                     }
                  })]
               };
            }
         });
         mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 600;
         this.height = 500;
         this.showCloseButton = true;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",___ChooseMapJumpCellForm_TitleWindow1_creationComplete);
         this.addEventListener("close",___ChooseMapJumpCellForm_TitleWindow1_close);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ChooseMapJumpCellForm._watcherSetupUtil = param1;
      }
      
      public function ___ChooseMapJumpCellForm_TitleWindow1_close(param1:CloseEvent) : void
      {
         doCancel();
      }
      
      public function ___ChooseMapJumpCellForm_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      public function set map2(param1:GameEngineTwoEditor) : void
      {
         var _loc2_:Object = this._3343958map2;
         if(_loc2_ !== param1)
         {
            this._3343958map2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"map2",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ChooseMapJumpCellForm = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ChooseMapJumpCellForm_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_modals_ChooseMapJumpCellFormWatcherSetupUtil");
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
      public function get map2() : GameEngineTwoEditor
      {
         return this._3343958map2;
      }
      
      private function _ChooseMapJumpCellForm_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "Click on the cell that the jump will land at (" + map2.cursorCol + ", " + map2.cursorRow + ")";
         _loc1_ = map2.toolTipText;
      }
      
      private function doCancel() : void
      {
         dispatchEvent(new ChooseMapJumpCellEvent("cancel",0,0));
         PopUpManager.removePopUp(this);
      }
      
      public function configure(param1:String, param2:int, param3:int) : void
      {
         this.jumpToMapName = param1;
         this.jumpToX = param2;
         this.jumpToY = param3;
         map2.loadMapByName(mgbSession.userName,mgbSession.activeProject,param1);
         map2.next_zoomLevel(0.5);
         map2.select_tool_setJumpTarget();
         map2.addEventListener("change",processSetMapJumpCell);
      }
      
      private function _ChooseMapJumpCellForm_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Click on the cell that the jump will land at (" + map2.cursorCol + ", " + map2.cursorRow + ")";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.title = param1;
         },"this.title");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = map2.toolTipText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ChooseMapJumpCellForm_Canvas1.toolTip = param1;
         },"_ChooseMapJumpCellForm_Canvas1.toolTip");
         result[1] = binding;
         return result;
      }
      
      private function processSetMapJumpCell(param1:ChooseMapJumpCellEvent) : void
      {
         dispatchEvent(new ChooseMapJumpCellEvent("change",param1.jumpToX,param1.jumpToY));
         PopUpManager.removePopUp(this);
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
      }
   }
}
