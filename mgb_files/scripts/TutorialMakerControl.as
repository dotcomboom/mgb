package
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import com.mgb.modals.*;
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
   import mx.containers.ApplicationControlBar;
   import mx.containers.Canvas;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.DataGrid;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class TutorialMakerControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1981855311tutorialmakerBackgroundColor:SelectBackgroundColor;
      
      private var DGArray:Array = null;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _193276766tutorial:DataGrid;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _TutorialMakerControl_Button3:Button;
      
      private var _1694358064tutorialPiece:MgbTutorial;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1268861541footer:EditFooterComponent;
      
      public function TutorialMakerControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___TutorialMakerControl_Button1_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"New"};
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___TutorialMakerControl_Button2_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Load"};
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "id":"_TutorialMakerControl_Button3",
                        "events":{"click":"___TutorialMakerControl_Button3_click"},
                        "propertiesFactory":function():Object
                        {
                           return {
                              "label":"Save",
                              "toolTip":"Only System Admins can save tutorials currently"
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Help"};
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":Panel,
                  "stylesFactory":function():void
                  {
                     this.left = "63";
                     this.right = "0";
                     this.bottom = "72";
                     this.top = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "title":"Tutorial: ",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":DataGrid,
                           "id":"tutorial",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "headerHeight":22,
                                 "editable":true,
                                 "sortableColumns":false,
                                 "variableRowHeight":true,
                                 "wordWrap":true,
                                 "columns":[_TutorialMakerControl_DataGridColumn1_c(),_TutorialMakerControl_DataGridColumn2_c(),_TutorialMakerControl_DataGridColumn3_c(),_TutorialMakerControl_DataGridColumn4_c()]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":ApplicationControlBar,
                           "propertiesFactory":function():Object
                           {
                              return {"childDescriptors":[new UIComponentDescriptor({
                                 "type":Button,
                                 "events":{"click":"___TutorialMakerControl_Button5_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {"label":"Insert Task"};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Button,
                                 "events":{"click":"___TutorialMakerControl_Button6_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {"label":"Remove Task"};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Button,
                                 "events":{"click":"___TutorialMakerControl_Button7_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {"label":"Choose tile for task"};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Button,
                                 "events":{"click":"___TutorialMakerControl_Button8_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {"label":"Move task up"};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Button,
                                 "events":{"click":"___TutorialMakerControl_Button9_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {"label":"Move task down"};
                                 }
                              })]};
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":EditFooterComponent,
                  "id":"footer",
                  "stylesFactory":function():void
                  {
                     this.bottom = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"x":0};
                  }
               }),new UIComponentDescriptor({
                  "type":SelectBackgroundColor,
                  "id":"tutorialmakerBackgroundColor",
                  "stylesFactory":function():void
                  {
                     this.right = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"y":0};
                  }
               })]};
            }
         });
         _1694358064tutorialPiece = new MgbTutorial();
         _1217010542mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.addEventListener("creationComplete",___TutorialMakerControl_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         TutorialMakerControl._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorial() : DataGrid
      {
         return this._193276766tutorial;
      }
      
      public function ___TutorialMakerControl_Button3_click(param1:MouseEvent) : void
      {
         tutorialPiece.savePieceUsingDialog(MgbSystem.reservedSystemUserName,MgbSystem.reservedSystemProjectName,this,tutorialPiece.save);
      }
      
      public function ___TutorialMakerControl_Button5_click(param1:MouseEvent) : void
      {
         insertTask();
      }
      
      public function ___TutorialMakerControl_Button7_click(param1:MouseEvent) : void
      {
         chooseTile();
      }
      
      public function ___TutorialMakerControl_Button1_click(param1:MouseEvent) : void
      {
         newTutorial();
      }
      
      public function ___TutorialMakerControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         initData();
      }
      
      private function _TutorialMakerControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsAdmin;
         },function(param1:Boolean):void
         {
            _TutorialMakerControl_Button3.enabled = param1;
         },"_TutorialMakerControl_Button3.enabled");
         result[0] = binding;
         binding = new Binding(this,function():Object
         {
            return tutorialPiece.tAC;
         },function(param1:Object):void
         {
            tutorial.dataProvider = param1;
         },"tutorial.dataProvider");
         result[1] = binding;
         return result;
      }
      
      public function ___TutorialMakerControl_Button9_click(param1:MouseEvent) : void
      {
         moveTaskDown();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:TutorialMakerControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _TutorialMakerControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_TutorialMakerControlWatcherSetupUtil");
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
      
      private function newTutorial() : void
      {
         tutorialPiece.tAC.removeAll();
         tutorialPiece.name = "";
         tutorialPiece.comment = "";
      }
      
      [Bindable(event="propertyChange")]
      public function get footer() : EditFooterComponent
      {
         return this._1268861541footer;
      }
      
      public function set tutorialmakerBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._1981855311tutorialmakerBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._1981855311tutorialmakerBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialmakerBackgroundColor",_loc2_,param1));
         }
      }
      
      private function _TutorialMakerControl_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.width = 80;
         _loc1_.editable = false;
         _loc1_.headerText = "Tile";
         _loc1_.dataField = "tileName";
         return _loc1_;
      }
      
      private function _TutorialMakerControl_DataGridColumn4_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.editable = true;
         _loc1_.headerText = "RewardResult";
         _loc1_.dataField = "rewardResult";
         return _loc1_;
      }
      
      private function moveTaskUp() : void
      {
         var _loc2_:Object = null;
         var _loc1_:int = tutorial.selectedIndex;
         if(Boolean(tutorialPiece.tAC.length) && _loc1_ >= 1)
         {
            _loc2_ = tutorialPiece.tAC[_loc1_ - 1];
            tutorialPiece.tAC[_loc1_ - 1] = tutorialPiece.tAC[_loc1_];
            tutorialPiece.tAC[_loc1_] = _loc2_;
            tutorialPiece.tAC.itemUpdated(tutorialPiece.tAC[_loc1_]);
            tutorialPiece.tAC.itemUpdated(tutorialPiece.tAC[_loc1_ - 1]);
            tutorial.selectedItem = tutorialPiece.tAC[_loc1_ - 1];
         }
      }
      
      public function set footer(param1:EditFooterComponent) : void
      {
         var _loc2_:Object = this._1268861541footer;
         if(_loc2_ !== param1)
         {
            this._1268861541footer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"footer",_loc2_,param1));
         }
      }
      
      private function removeTask() : void
      {
         if(tutorial.selectedIndex >= 0)
         {
            tutorialPiece.tAC.removeItemAt(tutorial.selectedIndex);
         }
      }
      
      private function _TutorialMakerControl_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = TutorialMakerTagComboBox;
         return _loc1_;
      }
      
      public function set tutorial(param1:DataGrid) : void
      {
         var _loc2_:Object = this._193276766tutorial;
         if(_loc2_ !== param1)
         {
            this._193276766tutorial = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorial",_loc2_,param1));
         }
      }
      
      public function ___TutorialMakerControl_Button2_click(param1:MouseEvent) : void
      {
         tutorialPiece.loadUsingDialog(MgbSystem.reservedSystemUserName,MgbSystem.reservedSystemProjectName,this,null);
      }
      
      private function _TutorialMakerControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = mgbSession.userLoggedInIsAdmin;
         _loc1_ = tutorialPiece.tAC;
      }
      
      public function ___TutorialMakerControl_Button6_click(param1:MouseEvent) : void
      {
         removeTask();
      }
      
      public function ___TutorialMakerControl_Button8_click(param1:MouseEvent) : void
      {
         moveTaskUp();
      }
      
      private function moveTaskDown() : void
      {
         var _loc2_:Object = null;
         var _loc1_:int = tutorial.selectedIndex;
         if(tutorialPiece.tAC.length > 1 && _loc1_ < tutorialPiece.tAC.length - 1)
         {
            _loc2_ = tutorialPiece.tAC[_loc1_ + 1];
            tutorialPiece.tAC[_loc1_ + 1] = tutorialPiece.tAC[_loc1_];
            tutorialPiece.tAC[_loc1_] = _loc2_;
            tutorialPiece.tAC.itemUpdated(tutorialPiece.tAC[_loc1_]);
            tutorialPiece.tAC.itemUpdated(tutorialPiece.tAC[_loc1_ + 1]);
            tutorial.selectedItem = tutorialPiece.tAC[_loc1_ + 1];
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get tutorialPiece() : MgbTutorial
      {
         return this._1694358064tutorialPiece;
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorialmakerBackgroundColor() : SelectBackgroundColor
      {
         return this._1981855311tutorialmakerBackgroundColor;
      }
      
      public function initData() : void
      {
         DGArray = new Array();
         tutorialPiece.tAC = new ArrayCollection(DGArray);
         footer.nukeSlider();
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
      
      private function insertTask() : void
      {
         tutorialPiece.tAC.addItem({
            "message":"message...",
            "graphic":"",
            "completionTag":"(nextButton)",
            "rewardResult":""
         });
      }
      
      private function chooseTile() : void
      {
         var _loc1_:ChoosePieceForm = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
         _loc1_.configure(MgbSystem.reservedSystemUserName,MgbSystem.reservedSystemProjectName,Piece.MGB_TILE);
         _loc1_.addEventListener("change",processLoadTileFromSelection);
      }
      
      private function _TutorialMakerControl_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.width = 220;
         _loc1_.editable = true;
         _loc1_.headerText = "Message";
         _loc1_.dataField = "message";
         return _loc1_;
      }
      
      private function set tutorialPiece(param1:MgbTutorial) : void
      {
         var _loc2_:Object = this._1694358064tutorialPiece;
         if(_loc2_ !== param1)
         {
            this._1694358064tutorialPiece = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialPiece",_loc2_,param1));
         }
      }
      
      private function _TutorialMakerControl_DataGridColumn3_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.dataField = "completionTag";
         _loc1_.width = 300;
         _loc1_.headerText = "Completion Tag";
         _loc1_.sortable = false;
         _loc1_.editable = true;
         _loc1_.editorDataField = "newState";
         _loc1_.rendererIsEditor = true;
         _loc1_.itemRenderer = _TutorialMakerControl_ClassFactory1_c();
         _loc1_.setStyle("textAlign","center");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function processLoadTileFromSelection(param1:ChoosePieceEvent) : void
      {
         if(param1.activating)
         {
            tutorialPiece.tAC[tutorial.selectedIndex].tileName = param1.pieceName;
            tutorialPiece.tAC.itemUpdated(tutorialPiece.tAC[tutorial.selectedIndex]);
         }
      }
   }
}
