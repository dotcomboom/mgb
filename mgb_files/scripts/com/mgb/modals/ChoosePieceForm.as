package com.mgb.modals
{
   import com.mgb.controls.BitmapDuper;
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
   import mx.containers.FormItem;
   import mx.containers.HBox;
   import mx.containers.TitleWindow;
   import mx.controls.Button;
   import mx.controls.CheckBox;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.controls.TextInput;
   import mx.controls.TileList;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ChoosePieceForm extends TitleWindow implements IBindingClient
   {
      
      public static const LABEL_SAVE:String = "Save";
      
      public static const LABEL_CHOOSE:String = "Choose";
      
      public static const LABEL_LOAD:String = "Load";
      
      private static const OVER_QUOTA_MESSAGE:String = "You are over your space quota allowance. You can either delete game pieces you no longer need in order to reduce your space usage, or you can find out how to increase your quota using the Q+ button on the \'Space\' tab of the Information panel on the right hand side of the window";
      
      private static const GUEST_CANNOT_SAVE_MESSAGE:String = "Guests cannot save game pieces. If you sign up for your own account, you will be able to use create and save your own game pieces";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1837790996chosenAC:ArrayCollection;
      
      private var preserveOriginalFilterFunction:Function;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var project:String;
      
      private var _146515738listAllCheckBox:CheckBox;
      
      private var _loader:Loader;
      
      private var _113543340pieceList:TileList;
      
      private var _1422950858action:Button;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _113796936pieceType:String;
      
      private var _1096060015pieceComment:TextInput;
      
      private var mgbCache:MgbCaches;
      
      private var _318184504preview:BitmapDuper;
      
      private var lastPreviewedBD:BitmapData = null;
      
      protected var tileCache:PieceCache;
      
      private var _374267858pieceDescription:Text;
      
      protected var actorCache:PieceCache;
      
      mx_internal var _watchers:Array;
      
      private var _1367724422cancel:Button;
      
      public var _ChoosePieceForm_Text2:Text;
      
      public var _ChoosePieceForm_Text3:Text;
      
      public var _ChoosePieceForm_FormItem1:FormItem;
      
      private var currentNameFilterPattern:RegExp;
      
      private var _113595033pieceName:TextInput;
      
      private var originalPieceName:String = null;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var contextHint:Object;
      
      private var username:String;
      
      public var _ChoosePieceForm_Form1:Form;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ChoosePieceForm()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "height":480,
                  "width":530,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":HBox,
                     "propertiesFactory":function():Object
                     {
                        return {"childDescriptors":[new UIComponentDescriptor({
                           "type":Form,
                           "id":"_ChoosePieceForm_Form1",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":330,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":FormItem,
                                    "id":"_ChoosePieceForm_FormItem1",
                                    "stylesFactory":function():void
                                    {
                                       this.paddingLeft = 0;
                                       this.paddingRight = 0;
                                       this.labelWidth = 96;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":TextInput,
                                          "id":"pieceName",
                                          "events":{"change":"__pieceName_change"},
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "text":"",
                                                "percentWidth":100
                                             };
                                          }
                                       })]};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":FormItem,
                                    "stylesFactory":function():void
                                    {
                                       this.labelWidth = 96;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "label":"Comment:",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":TextInput,
                                             "id":"pieceComment",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "text":"",
                                                   "percentWidth":100,
                                                   "styleName":"denseTable"
                                                };
                                             }
                                          })]
                                       };
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
                                             return {
                                                "label":"Choose",
                                                "enabled":false
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Button,
                                          "id":"cancel",
                                          "events":{"click":"__cancel_click"},
                                          "propertiesFactory":function():Object
                                          {
                                             return {"label":"Cancel"};
                                          }
                                       }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                                          "type":CheckBox,
                                          "id":"listAllCheckBox",
                                          "events":{"change":"__listAllCheckBox_change"}
                                       })]};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"pieceDescription",
                                    "propertiesFactory":function():Object
                                    {
                                       return {"width":285};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_ChoosePieceForm_Text2",
                                    "stylesFactory":function():void
                                    {
                                       this.color = 16711680;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"text":"You are over quota so cannot save"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_ChoosePieceForm_Text3",
                                    "stylesFactory":function():void
                                    {
                                       this.color = 16711680;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"text":"Guests cannot save"};
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                           "type":BitmapDuper,
                           "id":"preview",
                           "stylesFactory":function():void
                           {
                              this.right = "20";
                              this.top = "20";
                           }
                        })]};
                     }
                  }),new UIComponentDescriptor({
                     "type":TileList,
                     "id":"pieceList",
                     "events":{
                        "change":"__pieceList_change",
                        "doubleClick":"__pieceList_doubleClick"
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentHeight":100,
                           "percentWidth":100,
                           "visible":false,
                           "showDataTips":true,
                           "doubleClickEnabled":true,
                           "columnWidth":80,
                           "rowHeight":120
                        };
                     }
                  })]
               };
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         mgbCache = MgbCaches.getInstance();
         actorCache = MgbCaches.getInstance().actorCache;
         tileCache = MgbCaches.getInstance().tileCache;
         _loader = new Loader();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.height = 480;
         this.width = 530;
         this.showCloseButton = true;
         this.addEventListener("creationComplete",___ChoosePieceForm_TitleWindow1_creationComplete);
         this.addEventListener("close",___ChoosePieceForm_TitleWindow1_close);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ChoosePieceForm._watcherSetupUtil = param1;
      }
      
      public function __listAllCheckBox_change(param1:Event) : void
      {
         listAllCheckBoxHandler();
      }
      
      private function updateSelectionInfo(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc3_:String = null;
         var _loc5_:MgbActor = null;
         var _loc6_:MgbTile = null;
         if(param2 == false && pieceList.selectedItem == null)
         {
            return;
         }
         if(param1)
         {
            action.enabled = false;
         }
         _loc3_ = param2 ? pieceName.text : String(pieceList.selectedItem.name);
         var _loc4_:String = null;
         pieceName.text = _loc3_;
         action.enabled = _loc3_ != "";
         writeProtectCheck();
         if(!param1)
         {
            switch(pieceType)
            {
               case Piece.MGB_ACTOR:
                  _loc5_ = MgbActor(actorCache.getPieceIfCached(username,project,_loc3_));
                  preview.drawDupeFromName(username,project,_loc5_.tilename);
                  pieceDescription.text = !!_loc5_ ? _loc5_.getDescription(true) : "";
                  _loc4_ = !!_loc5_ ? _loc5_.comment : null;
                  break;
               case Piece.MGB_TILE:
                  preview.drawDupeFromName(username,project,_loc3_);
                  _loc4_ = !!(_loc6_ = MgbTile(tileCache.getPieceIfCached(username,project,_loc3_))) ? _loc6_.comment : null;
            }
            pieceComment.text = !!_loc4_ ? _loc4_ : "";
         }
         dispatchEvent(new ChoosePieceEvent("change",username,project,_loc3_,param1,originalPieceName,pieceComment.text,contextHint));
         if(param1)
         {
            disableGrepFilters();
            PopUpManager.removePopUp(this);
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get chosenAC() : ArrayCollection
      {
         return this._1837790996chosenAC;
      }
      
      private function grepMe(param1:Object) : Boolean
      {
         return currentNameFilterPattern == null ? true : param1.name.search(currentNameFilterPattern) != -1;
      }
      
      public function __action_click(param1:MouseEvent) : void
      {
         updateSelectionInfo(true,true);
      }
      
      private function pieceNameFieldChangeHandler() : void
      {
         action.enabled = pieceName.text != "";
         updateGrepFilters();
         writeProtectCheck();
      }
      
      public function set pieceComment(param1:TextInput) : void
      {
         var _loc2_:Object = this._1096060015pieceComment;
         if(_loc2_ !== param1)
         {
            this._1096060015pieceComment = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pieceComment",_loc2_,param1));
         }
      }
      
      private function set chosenAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1837790996chosenAC;
         if(_loc2_ !== param1)
         {
            this._1837790996chosenAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenAC",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get action() : Button
      {
         return this._1422950858action;
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
         preview.shrinkToFitEnabled = false;
      }
      
      public function set pieceName(param1:TextInput) : void
      {
         var _loc2_:Object = this._113595033pieceName;
         if(_loc2_ !== param1)
         {
            this._113595033pieceName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pieceName",_loc2_,param1));
         }
      }
      
      public function ___ChoosePieceForm_TitleWindow1_close(param1:CloseEvent) : void
      {
         doCancel();
      }
      
      [Bindable(event="propertyChange")]
      public function get pieceType() : String
      {
         return this._113796936pieceType;
      }
      
      public function __pieceList_doubleClick(param1:MouseEvent) : void
      {
         updateSelectionInfo(true);
      }
      
      private function disableGrepFilters() : void
      {
         chosenAC.filterFunction = preserveOriginalFilterFunction;
         chosenAC.refresh();
      }
      
      [Bindable(event="propertyChange")]
      public function get pieceDescription() : Text
      {
         return this._374267858pieceDescription;
      }
      
      public function set pieceDescription(param1:Text) : void
      {
         var _loc2_:Object = this._374267858pieceDescription;
         if(_loc2_ !== param1)
         {
            this._374267858pieceDescription = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pieceDescription",_loc2_,param1));
         }
      }
      
      public function set pieceList(param1:TileList) : void
      {
         var _loc2_:Object = this._113543340pieceList;
         if(_loc2_ !== param1)
         {
            this._113543340pieceList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pieceList",_loc2_,param1));
         }
      }
      
      public function __cancel_click(param1:MouseEvent) : void
      {
         doCancel();
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
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      public function get cancel() : Button
      {
         return this._1367724422cancel;
      }
      
      public function __pieceList_change(param1:ListEvent) : void
      {
         updateSelectionInfo(false);
      }
      
      private function listAllCheckBoxHandler() : void
      {
         updateGrepFilters();
      }
      
      [Bindable(event="propertyChange")]
      public function get pieceComment() : TextInput
      {
         return this._1096060015pieceComment;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ChoosePieceForm = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ChoosePieceForm_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_modals_ChoosePieceFormWatcherSetupUtil");
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
      public function get pieceName() : TextInput
      {
         return this._113595033pieceName;
      }
      
      public function set pieceType(param1:String) : void
      {
         var _loc2_:Object = this._113796936pieceType;
         if(_loc2_ !== param1)
         {
            this._113796936pieceType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pieceType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pieceList() : TileList
      {
         return this._113543340pieceList;
      }
      
      public function set preview(param1:BitmapDuper) : void
      {
         var _loc2_:Object = this._318184504preview;
         if(_loc2_ !== param1)
         {
            this._318184504preview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preview",_loc2_,param1));
         }
      }
      
      private function updateGrepFilters() : void
      {
         currentNameFilterPattern = listAllCheckBox.selected ? null : new RegExp(".*" + pieceName.text + ".*","i");
         chosenAC.filterFunction = grepMe;
         chosenAC.refresh();
      }
      
      private function enableGrepFilters() : void
      {
         preserveOriginalFilterFunction = chosenAC.filterFunction;
         chosenAC.filterFunction = grepMe;
         updateGrepFilters();
      }
      
      public function ___ChoosePieceForm_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      private function _ChoosePieceForm_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = action.label + " " + pieceType;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.title = param1;
         },"this.title");
         result[0] = binding;
         binding = new Binding(this,function():IFlexDisplayObject
         {
            return action;
         },function(param1:IFlexDisplayObject):void
         {
            _ChoosePieceForm_Form1.defaultButton = param1;
         },"_ChoosePieceForm_Form1.defaultButton");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = pieceType + " name:";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ChoosePieceForm_FormItem1.label = param1;
         },"_ChoosePieceForm_FormItem1.label");
         result[2] = binding;
         binding = new Binding(this,function():int
         {
            return Piece.maxCharsInName;
         },function(param1:int):void
         {
            pieceName.maxChars = param1;
         },"pieceName.maxChars");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.restrictCharactersInItemname;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            pieceName.restrict = param1;
         },"pieceName.restrict");
         result[4] = binding;
         binding = new Binding(this,function():int
         {
            return Piece.maxCharsInComment;
         },function(param1:int):void
         {
            pieceComment.maxChars = param1;
         },"pieceComment.maxChars");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.restrictCharactersInCommentStrings;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            pieceComment.restrict = param1;
         },"pieceComment.restrict");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "List all " + pieceType + "s";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            listAllCheckBox.label = param1;
         },"listAllCheckBox.label");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Controls whether you see all " + pieceType + "s, or just ones that match the name you are typing";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            listAllCheckBox.toolTip = param1;
         },"listAllCheckBox.toolTip");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.overQuota;
         },function(param1:Boolean):void
         {
            _ChoosePieceForm_Text2.includeInLayout = param1;
         },"_ChoosePieceForm_Text2.includeInLayout");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.overQuota;
         },function(param1:Boolean):void
         {
            _ChoosePieceForm_Text2.visible = param1;
         },"_ChoosePieceForm_Text2.visible");
         result[10] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = OVER_QUOTA_MESSAGE;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ChoosePieceForm_Text2.toolTip = param1;
         },"_ChoosePieceForm_Text2.toolTip");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ChoosePieceForm_Text3.includeInLayout = param1;
         },"_ChoosePieceForm_Text3.includeInLayout");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ChoosePieceForm_Text3.visible = param1;
         },"_ChoosePieceForm_Text3.visible");
         result[13] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = GUEST_CANNOT_SAVE_MESSAGE;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ChoosePieceForm_Text3.toolTip = param1;
         },"_ChoosePieceForm_Text3.toolTip");
         result[14] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tileMaxWidth;
         },function(param1:Number):void
         {
            preview.width = param1;
         },"preview.width");
         result[15] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tileMaxHeight;
         },function(param1:Number):void
         {
            preview.height = param1;
         },"preview.height");
         result[16] = binding;
         binding = new Binding(this,function():Object
         {
            return chosenAC;
         },function(param1:Object):void
         {
            pieceList.dataProvider = param1;
         },"pieceList.dataProvider");
         result[17] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get preview() : BitmapDuper
      {
         return this._318184504preview;
      }
      
      public function set listAllCheckBox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._146515738listAllCheckBox;
         if(_loc2_ !== param1)
         {
            this._146515738listAllCheckBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listAllCheckBox",_loc2_,param1));
         }
      }
      
      private function _ChoosePieceForm_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = action.label + " " + pieceType;
         _loc1_ = action;
         _loc1_ = pieceType + " name:";
         _loc1_ = Piece.maxCharsInName;
         _loc1_ = MgbSystem.restrictCharactersInItemname;
         _loc1_ = Piece.maxCharsInComment;
         _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
         _loc1_ = "List all " + pieceType + "s";
         _loc1_ = "Controls whether you see all " + pieceType + "s, or just ones that match the name you are typing";
         _loc1_ = mgbSession.overQuota;
         _loc1_ = mgbSession.overQuota;
         _loc1_ = OVER_QUOTA_MESSAGE;
         _loc1_ = mgbSession.userLoggedInIsGuest;
         _loc1_ = mgbSession.userLoggedInIsGuest;
         _loc1_ = GUEST_CANNOT_SAVE_MESSAGE;
         _loc1_ = MgbSystem.tileMaxWidth;
         _loc1_ = MgbSystem.tileMaxHeight;
         _loc1_ = chosenAC;
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
      
      private function doCancel() : void
      {
         dispatchEvent(new ChoosePieceEvent("cancel",username,project,null,true,originalPieceName,pieceComment.text,contextHint));
         disableGrepFilters();
         PopUpManager.removePopUp(this);
      }
      
      public function configure(param1:String, param2:String, param3:String, param4:String = null, param5:String = "Choose", param6:ArrayCollection = null) : void
      {
         this.username = param1;
         this.project = param2;
         this.pieceType = param3;
         pieceName.text = param4;
         action.enabled = Boolean(param4) && param4 != "";
         originalPieceName = param4;
         action.label = param5;
         writeProtectCheck();
         switch(param3)
         {
            case Piece.MGB_ACTOR:
               if(param6 == null)
               {
                  param6 = mgbCache.actorsPL.piecesAC;
               }
               pieceList.itemRenderer = new ClassFactory(LoginActorPreviewControl);
               break;
            case Piece.MGB_TILE:
               if(param6 == null)
               {
                  param6 = mgbCache.tilesPL.piecesAC;
               }
               pieceList.itemRenderer = new ClassFactory(LoginTilePreviewControl);
               break;
            case Piece.MGB_MAP:
               if(param6 == null)
               {
                  param6 = mgbCache.mapsPL.piecesAC;
               }
               pieceList.itemRenderer = new ClassFactory(RendererMapPiece);
               break;
            case Piece.MGB_TUTORIAL:
               if(param6 == null)
               {
                  param6 = mgbCache.tutorialsPL.piecesAC;
               }
               pieceList.itemRenderer = new ClassFactory(RendererTutorialPiece);
               break;
            default:
               throw new Error("Unknown pieceType: " + param3);
         }
         pieceComment.editable = param5 == LABEL_SAVE;
         chosenAC = param6;
         enableGrepFilters();
         pieceList.visible = true;
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
      public function get listAllCheckBox() : CheckBox
      {
         return this._146515738listAllCheckBox;
      }
      
      public function __pieceName_change(param1:Event) : void
      {
         pieceNameFieldChangeHandler();
      }
      
      private function writeProtectCheck() : void
      {
         var _loc1_:String = null;
         if(action.label == LABEL_SAVE)
         {
            if(mgbSession.overQuota == true)
            {
               _loc1_ = String(OVER_QUOTA_MESSAGE);
            }
            else if(mgbSession.userLoggedInIsGuest == true)
            {
               _loc1_ = String(GUEST_CANNOT_SAVE_MESSAGE);
            }
            if(_loc1_ != null)
            {
               action.enabled = false;
               pieceList.doubleClickEnabled = false;
               action.toolTip = _loc1_;
            }
         }
         if(action.label != LABEL_SAVE || _loc1_ != null)
         {
            pieceComment.editable = false;
            pieceComment.setStyle("borderStyle","none");
         }
      }
   }
}
