package com.mgb.modals
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
   import mx.containers.TitleWindow;
   import mx.containers.VBox;
   import mx.controls.*;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ShowSpaceUsage extends TitleWindow implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1740971685projectSelectDataGrid:DataGrid;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      public var _ShowSpaceUsage_Text1:Text;
      
      public var _ShowSpaceUsage_Text2:Text;
      
      public var _ShowSpaceUsage_Text3:Text;
      
      public var _ShowSpaceUsage_Text4:Text;
      
      public var _ShowSpaceUsage_Text5:Text;
      
      private var _940098729projectList:ProjectList;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ShowSpaceUsage()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "height":510,
                  "width":446,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Text,
                              "id":"_ShowSpaceUsage_Text1",
                              "propertiesFactory":function():Object
                              {
                                 return {"toolTip":"You can change the active project using the \'choose project\' button on the main \'Me\' page"};
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"_ShowSpaceUsage_Text2",
                              "propertiesFactory":function():Object
                              {
                                 return {"percentWidth":100};
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"_ShowSpaceUsage_Text3",
                              "propertiesFactory":function():Object
                              {
                                 return {"toolTip":"Every user has a \'quota\' which defines how much space they have for storing game pieces. You can gain more quota as your use the system more, or by performing various tasks. In future we also plan to allow users to buy additional quota. Press the Q+ button for more information"};
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"_ShowSpaceUsage_Text4",
                              "stylesFactory":function():void
                              {
                                 this.color = 16711680;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "text":"You are over quota",
                                    "toolTip":"You are over your space quota allowance. You can either delete game pieces you no longer need in order to reduce your space usage, or you can find out how to increase your quota using the Q+ button"
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":DataGrid,
                              "id":"projectSelectDataGrid",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "columns":[_ShowSpaceUsage_DataGridColumn1_c(),_ShowSpaceUsage_DataGridColumn2_c()]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"_ShowSpaceUsage_Text5",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "alpha":0.6,
                                    "toolTip":"The project list (and space usage) is automatically updated within a few minutes of a game piece being saved or deleted"
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _940098729projectList = ProjectList.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.height = 510;
         this.width = 446;
         this.showCloseButton = true;
         this.autoLayout = false;
         this.layout = "vertical";
         this.title = "Projects and space usage";
         this.toolTip = "List of projects and space usage";
         this.addEventListener("creationComplete",___ShowSpaceUsage_TitleWindow1_creationComplete);
         this.addEventListener("close",___ShowSpaceUsage_TitleWindow1_close);
      }
      
      public static function createMe(param1:DisplayObject) : void
      {
         PopUpManager.createPopUp(param1,ShowSpaceUsage,true);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ShowSpaceUsage._watcherSetupUtil = param1;
      }
      
      private function _ShowSpaceUsage_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "Current project: \'" + mgbSession.activeProject + "\'";
         _loc1_ = "Using " + projectList.totalKBUsed + " KB across " + projectList.totalProjectCount + " projects";
         _loc1_ = "Maximum space quota: " + mgbSession.maxQuotaKB + " KB";
         _loc1_ = mgbSession.overQuota;
         _loc1_ = mgbSession.overQuota;
         _loc1_ = projectList.projectNamesAC;
         _loc1_ = "Current active project: \'" + mgbSession.activeProject + "\'. You can change the active project using the \'choose project\' button on the main \'Me\' page";
         _loc1_ = "List updated at " + projectList.lastCheckedTime;
      }
      
      public function ___ShowSpaceUsage_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      private function _ShowSpaceUsage_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Project";
         _loc1_.dataField = "project";
         return _loc1_;
      }
      
      private function _ShowSpaceUsage_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Size (KB)";
         _loc1_.dataField = "simpleSizeKB";
         _loc1_.width = 90;
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ShowSpaceUsage = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ShowSpaceUsage_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_modals_ShowSpaceUsageWatcherSetupUtil");
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
      
      public function set projectSelectDataGrid(param1:DataGrid) : void
      {
         var _loc2_:Object = this._1740971685projectSelectDataGrid;
         if(_loc2_ !== param1)
         {
            this._1740971685projectSelectDataGrid = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectSelectDataGrid",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get projectSelectDataGrid() : DataGrid
      {
         return this._1740971685projectSelectDataGrid;
      }
      
      [Bindable(event="propertyChange")]
      private function get projectList() : ProjectList
      {
         return this._940098729projectList;
      }
      
      private function _ShowSpaceUsage_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Current project: \'" + mgbSession.activeProject + "\'";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ShowSpaceUsage_Text1.text = param1;
         },"_ShowSpaceUsage_Text1.text");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Using " + projectList.totalKBUsed + " KB across " + projectList.totalProjectCount + " projects";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ShowSpaceUsage_Text2.text = param1;
         },"_ShowSpaceUsage_Text2.text");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Maximum space quota: " + mgbSession.maxQuotaKB + " KB";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ShowSpaceUsage_Text3.text = param1;
         },"_ShowSpaceUsage_Text3.text");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.overQuota;
         },function(param1:Boolean):void
         {
            _ShowSpaceUsage_Text4.includeInLayout = param1;
         },"_ShowSpaceUsage_Text4.includeInLayout");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.overQuota;
         },function(param1:Boolean):void
         {
            _ShowSpaceUsage_Text4.visible = param1;
         },"_ShowSpaceUsage_Text4.visible");
         result[4] = binding;
         binding = new Binding(this,function():Object
         {
            return projectList.projectNamesAC;
         },function(param1:Object):void
         {
            projectSelectDataGrid.dataProvider = param1;
         },"projectSelectDataGrid.dataProvider");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Current active project: \'" + mgbSession.activeProject + "\'. You can change the active project using the \'choose project\' button on the main \'Me\' page";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            projectSelectDataGrid.toolTip = param1;
         },"projectSelectDataGrid.toolTip");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "List updated at " + projectList.lastCheckedTime;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ShowSpaceUsage_Text5.text = param1;
         },"_ShowSpaceUsage_Text5.text");
         result[7] = binding;
         return result;
      }
      
      public function ___ShowSpaceUsage_TitleWindow1_close(param1:CloseEvent) : void
      {
         doClose();
      }
      
      private function doClose() : void
      {
         PopUpManager.removePopUp(this);
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function set projectList(param1:ProjectList) : void
      {
         var _loc2_:Object = this._940098729projectList;
         if(_loc2_ !== param1)
         {
            this._940098729projectList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectList",_loc2_,param1));
         }
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
         if(!mgbSession.userLoggedIn)
         {
            Alert.show("You need to be logged in...");
            doClose();
         }
      }
   }
}
