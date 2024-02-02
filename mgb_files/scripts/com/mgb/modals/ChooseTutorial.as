package com.mgb.modals
{
   import com.mgb.data.PieceList;
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
   import mx.collections.*;
   import mx.containers.HBox;
   import mx.containers.TitleWindow;
   import mx.controls.*;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ChooseTutorial extends TitleWindow implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _2009421692activeTutorial:ActiveTutorial;
      
      private var _881377741tableA:Array;
      
      private var _2139181690mgbTutorial:ActiveTutorial;
      
      private var _662852588profileLoadCompleteFlag:Boolean = false;
      
      private var _1697811216tutorialTable:DataGrid;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1642894959tutorialsPL:PieceList;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var chosenTutorial:String = null;
      
      private var _1552906128tableAC:ArrayCollection;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ChooseTutorial()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "height":510,
                  "width":446,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Label,
                     "stylesFactory":function():void
                     {
                        this.fontWeight = "bold";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {"text":"Choose which tutorial you wish to run next"};
                     }
                  }),new UIComponentDescriptor({
                     "type":HBox,
                     "propertiesFactory":function():Object
                     {
                        return {"childDescriptors":[new UIComponentDescriptor({
                           "type":Button,
                           "events":{"click":"___ChooseTutorial_Button1_click"},
                           "propertiesFactory":function():Object
                           {
                              return {"label":"OK"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "events":{"click":"___ChooseTutorial_Button2_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"Cancel",
                                 "toolTip":"Cancel, undo any changes"
                              };
                           }
                        })]};
                     }
                  }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                     "type":HRule,
                     "stylesFactory":function():void
                     {
                        this.strokeWidth = 3;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {"percentWidth":100};
                     }
                  }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                     "type":DataGrid,
                     "id":"tutorialTable",
                     "events":{"change":"__tutorialTable_change"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "columns":[_ChooseTutorial_DataGridColumn1_c(),_ChooseTutorial_DataGridColumn2_c()]
                        };
                     }
                  })]
               };
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _2139181690mgbTutorial = ActiveTutorial.getInstance();
         _1642894959tutorialsPL = MgbCaches.getInstance().tutorialsPL;
         _2009421692activeTutorial = ActiveTutorial.getInstance();
         _881377741tableA = new Array();
         _1552906128tableAC = new ArrayCollection(tableA);
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.height = 510;
         this.width = 446;
         this.title = "Choose tutorial";
         this.showCloseButton = true;
         this.autoLayout = false;
         this.layout = "vertical";
         this.addEventListener("creationComplete",___ChooseTutorial_TitleWindow1_creationComplete);
         this.addEventListener("close",___ChooseTutorial_TitleWindow1_close);
      }
      
      public static function createMe(param1:DisplayObject) : void
      {
         PopUpManager.createPopUp(param1,ChooseTutorial,true);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ChooseTutorial._watcherSetupUtil = param1;
      }
      
      private function buildTable() : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc1_:int = -1;
         var _loc2_:int = 0;
         tableAC.removeAll();
         var _loc3_:int = 0;
         while(_loc3_ < tutorialsPL.piecesAC.length)
         {
            _loc4_ = String(tutorialsPL.piecesAC[_loc3_].name);
            if((Boolean(_loc5_ = String(activeTutorial.getCompletionDate(_loc4_)))) && _loc5_.length > 0)
            {
               _loc2_++;
            }
            tableAC.addItem({
               "name":_loc4_,
               "completionDate":_loc5_
            });
            if(_loc4_ == this.activeTutorial.activeTutorial.name && _loc4_ != null)
            {
               _loc1_ = _loc3_;
            }
            _loc3_++;
         }
         tableAC.refresh();
         tutorialTable.selectedIndex = _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get activeTutorial() : ActiveTutorial
      {
         return this._2009421692activeTutorial;
      }
      
      private function _ChooseTutorial_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Completed?";
         _loc1_.dataField = "completionDate";
         _loc1_.width = 100;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbTutorial() : ActiveTutorial
      {
         return this._2139181690mgbTutorial;
      }
      
      private function set activeTutorial(param1:ActiveTutorial) : void
      {
         var _loc2_:Object = this._2009421692activeTutorial;
         if(_loc2_ !== param1)
         {
            this._2009421692activeTutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeTutorial",_loc2_,param1));
         }
      }
      
      private function set mgbTutorial(param1:ActiveTutorial) : void
      {
         var _loc2_:Object = this._2139181690mgbTutorial;
         if(_loc2_ !== param1)
         {
            this._2139181690mgbTutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbTutorial",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ChooseTutorial = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ChooseTutorial_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_modals_ChooseTutorialWatcherSetupUtil");
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
      private function get tutorialsPL() : PieceList
      {
         return this._1642894959tutorialsPL;
      }
      
      [Bindable(event="propertyChange")]
      private function get profileLoadCompleteFlag() : Boolean
      {
         return this._662852588profileLoadCompleteFlag;
      }
      
      public function ___ChooseTutorial_Button2_click(param1:MouseEvent) : void
      {
         doClose(false);
      }
      
      public function __tutorialTable_change(param1:ListEvent) : void
      {
         handleTableChange(param1);
      }
      
      public function set tutorialTable(param1:DataGrid) : void
      {
         var _loc2_:Object = this._1697811216tutorialTable;
         if(_loc2_ !== param1)
         {
            this._1697811216tutorialTable = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialTable",_loc2_,param1));
         }
      }
      
      private function set tutorialsPL(param1:PieceList) : void
      {
         var _loc2_:Object = this._1642894959tutorialsPL;
         if(_loc2_ !== param1)
         {
            this._1642894959tutorialsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialsPL",_loc2_,param1));
         }
      }
      
      private function _ChooseTutorial_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = tableAC;
      }
      
      private function set profileLoadCompleteFlag(param1:Boolean) : void
      {
         var _loc2_:Object = this._662852588profileLoadCompleteFlag;
         if(_loc2_ !== param1)
         {
            this._662852588profileLoadCompleteFlag = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"profileLoadCompleteFlag",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorialTable() : DataGrid
      {
         return this._1697811216tutorialTable;
      }
      
      private function doClose(param1:Boolean = false) : void
      {
         if(param1 && chosenTutorial != null)
         {
            if(activeTutorial.loadTutorial(chosenTutorial,false,true) == false)
            {
               MgbLogger.getInstance().logError("Could not select tutorial \'" + chosenTutorial + "\'",true);
            }
         }
         Application.application.unregisterForProfileUpdates(applyProfile);
         dispatchEvent(new ChooseNewActorEvent("cancel"));
         PopUpManager.removePopUp(this);
      }
      
      [Bindable(event="propertyChange")]
      private function get tableA() : Array
      {
         return this._881377741tableA;
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
         if(!mgbSession.userLoggedIn)
         {
            Alert.show("You need to be logged in...");
            doClose(false);
         }
         else
         {
            Application.application.registerForProfileUpdates(applyProfile);
         }
      }
      
      public function ___ChooseTutorial_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      private function _ChooseTutorial_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Tutorial";
         _loc1_.dataField = "name";
         _loc1_.width = 140;
         return _loc1_;
      }
      
      public function ___ChooseTutorial_TitleWindow1_close(param1:CloseEvent) : void
      {
         doClose();
      }
      
      private function handleTableChange(param1:ListEvent) : void
      {
         if(tutorialTable.selectedIndex != -1)
         {
            chosenTutorial = new String(tableAC[tutorialTable.selectedIndex].name);
         }
      }
      
      private function applyProfile(param1:Event = null) : void
      {
         buildTable();
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
      
      public function ___ChooseTutorial_Button1_click(param1:MouseEvent) : void
      {
         doClose(true);
      }
      
      private function _ChooseTutorial_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return tableAC;
         },function(param1:Object):void
         {
            tutorialTable.dataProvider = param1;
         },"tutorialTable.dataProvider");
         result[0] = binding;
         return result;
      }
      
      private function set tableA(param1:Array) : void
      {
         var _loc2_:Object = this._881377741tableA;
         if(_loc2_ !== param1)
         {
            this._881377741tableA = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tableA",_loc2_,param1));
         }
      }
      
      private function set tableAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1552906128tableAC;
         if(_loc2_ !== param1)
         {
            this._1552906128tableAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tableAC",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      private function get tableAC() : ArrayCollection
      {
         return this._1552906128tableAC;
      }
   }
}
