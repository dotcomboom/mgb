package com.mgb.modals
{
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
   import mx.containers.Form;
   import mx.containers.HBox;
   import mx.containers.TitleWindow;
   import mx.controls.Button;
   import mx.controls.ComboBox;
   import mx.controls.Label;
   import mx.controls.Spacer;
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ChooseMusicForm extends TitleWindow implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1412694279musicAC:ArrayCollection;
      
      private var originalMusicString:String = null;
      
      private var _374267858pieceDescription:TextArea;
      
      mx_internal var _watchers:Array;
      
      private var sourceX:int;
      
      private var sourceY:int;
      
      private var _1554521762musicComboBox:ComboBox;
      
      private var _1367724422cancel:Button;
      
      private var _1422950858action:Button;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var newMusicString:String = null;
      
      public var _ChooseMusicForm_Form1:Form;
      
      private var newParent:DisplayObject;
      
      mx_internal var _bindings:Array;
      
      private var mgbSession:MgbSession;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ChooseMusicForm()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "height":320,
                  "width":480,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Form,
                     "id":"_ChooseMusicForm_Form1",
                     "stylesFactory":function():void
                     {
                        this.verticalGap = 12;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":HBox,
                              "propertiesFactory":function():Object
                              {
                                 return {"childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"text":"Track:"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"musicComboBox",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "styleName":"denseTable"
                                       };
                                    }
                                 })]};
                              }
                           }),new UIComponentDescriptor({
                              "type":HBox,
                              "propertiesFactory":function():Object
                              {
                                 return {"childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"action",
                                    "events":{"click":"__action_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"label":"Choose"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"cancel",
                                    "events":{"click":"__cancel_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"label":"Cancel"};
                                    }
                                 })]};
                              }
                           }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                              "type":TextArea,
                              "id":"pieceDescription",
                              "stylesFactory":function():void
                              {
                                 this.borderStyle = "none";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "editable":false,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "styleName":"denseTable"
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         _1412694279musicAC = new ArrayCollection(MgbMusicUrls.musicList);
         mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.height = 320;
         this.width = 480;
         this.title = "Choose the Music to play when the player reaches this cell";
         this.showCloseButton = true;
         this.layout = "absolute";
         this.addEventListener("creationComplete",___ChooseMusicForm_TitleWindow1_creationComplete);
         this.addEventListener("close",___ChooseMusicForm_TitleWindow1_close);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ChooseMusicForm._watcherSetupUtil = param1;
      }
      
      private function _ChooseMusicForm_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = action;
         _loc1_ = musicAC;
         _loc1_ = MgbMusicUrls.soundSourceAttributionMessage;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ChooseMusicForm = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ChooseMusicForm_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_modals_ChooseMusicFormWatcherSetupUtil");
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
      
      private function set musicAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1412694279musicAC;
         if(_loc2_ !== param1)
         {
            this._1412694279musicAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"musicAC",_loc2_,param1));
         }
      }
      
      public function __action_click(param1:MouseEvent) : void
      {
         processSetMusic();
      }
      
      [Bindable(event="propertyChange")]
      public function get musicComboBox() : ComboBox
      {
         return this._1554521762musicComboBox;
      }
      
      private function _ChooseMusicForm_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():IFlexDisplayObject
         {
            return action;
         },function(param1:IFlexDisplayObject):void
         {
            _ChooseMusicForm_Form1.defaultButton = param1;
         },"_ChooseMusicForm_Form1.defaultButton");
         result[0] = binding;
         binding = new Binding(this,function():Object
         {
            return musicAC;
         },function(param1:Object):void
         {
            musicComboBox.dataProvider = param1;
         },"musicComboBox.dataProvider");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbMusicUrls.soundSourceAttributionMessage;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            pieceDescription.htmlText = param1;
         },"pieceDescription.htmlText");
         result[2] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get musicAC() : ArrayCollection
      {
         return this._1412694279musicAC;
      }
      
      public function ___ChooseMusicForm_TitleWindow1_close(param1:CloseEvent) : void
      {
         doCancel();
      }
      
      [Bindable(event="propertyChange")]
      public function get action() : Button
      {
         return this._1422950858action;
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
         musicAC.filterFunction = musicFilterer;
         musicAC.refresh();
      }
      
      [Bindable(event="propertyChange")]
      public function get pieceDescription() : TextArea
      {
         return this._374267858pieceDescription;
      }
      
      public function set musicComboBox(param1:ComboBox) : void
      {
         var _loc2_:Object = this._1554521762musicComboBox;
         if(_loc2_ !== param1)
         {
            this._1554521762musicComboBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"musicComboBox",_loc2_,param1));
         }
      }
      
      public function ___ChooseMusicForm_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      public function __cancel_click(param1:MouseEvent) : void
      {
         doCancel();
      }
      
      private function doCancel() : void
      {
         dispatchEvent(new ChooseMusicEvent("cancel",null,true,originalMusicString));
         PopUpManager.removePopUp(this);
      }
      
      public function configure(param1:DisplayObject, param2:String, param3:String, param4:int, param5:int) : void
      {
         this.newMusicString = this.originalMusicString = param3;
         this.sourceX = param4;
         this.sourceY = param5;
         this.newParent = param1;
      }
      
      public function set pieceDescription(param1:TextArea) : void
      {
         var _loc2_:Object = this._374267858pieceDescription;
         if(_loc2_ !== param1)
         {
            this._374267858pieceDescription = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pieceDescription",_loc2_,param1));
         }
      }
      
      public function set action(param1:Button) : void
      {
         var _loc2_:Object = this._1422950858action;
         if(_loc2_ !== param1)
         {
            this._1422950858action = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"action",_loc2_,param1));
         }
      }
      
      private function musicFilterer(param1:Object) : Boolean
      {
         var _loc2_:String = String(param1);
         return true;
      }
      
      private function processSetMusic() : void
      {
         var _loc1_:String = String(musicComboBox.selectedItem);
         newMusicString = CommandEngine.encode({
            "command":"music",
            "source":_loc1_,
            "loops":10000
         });
         dispatchEvent(new ChooseMusicEvent("change",newMusicString,true,originalMusicString,sourceX,sourceY));
         PopUpManager.removePopUp(this);
      }
      
      public function set cancel(param1:Button) : void
      {
         var _loc2_:Object = this._1367724422cancel;
         if(_loc2_ !== param1)
         {
            this._1367724422cancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancel",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cancel() : Button
      {
         return this._1367724422cancel;
      }
   }
}
