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
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Label;
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
   
   public class ChooseMapJumpForm extends TitleWindow implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var startSize:Point;
      
      private var destMapName:String;
      
      private var startPt:Point;
      
      private var _374267858pieceDescription:Text;
      
      private var sourceX:int;
      
      private var _1367724422cancel:Button;
      
      private var newJumpString:String = null;
      
      private var sourceY:int;
      
      public var _ChooseMapJumpForm_Form1:Form;
      
      private var originalJumpString:String = null;
      
      mx_internal var _watchers:Array;
      
      private var _113543340pieceList:TileList;
      
      private var _1422950858action:Button;
      
      private var _113595033pieceName:TextInput;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _embed_mxml_drag_png_1153533806:Class;
      
      private var newParent:DisplayObject;
      
      mx_internal var _bindings:Array;
      
      private var sourceMapName:String;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ChooseMapJumpForm()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "height":450,
                  "width":460,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
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
                                    "type":Form,
                                    "id":"_ChooseMapJumpForm_Form1",
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":HBox,
                                          "propertiesFactory":function():Object
                                          {
                                             return {"childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"text":"Map name:"};
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"pieceName",
                                                "events":{"change":"__pieceName_change"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"text":""};
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
                                             })]};
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Text,
                                          "id":"pieceDescription"
                                       })]};
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
                                    "visible":true,
                                    "showDataTips":true,
                                    "doubleClickEnabled":true,
                                    "columnWidth":80,
                                    "rowHeight":120
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Image,
                     "events":{"mouseDown":"___ChooseMapJumpForm_Image1_mouseDown"},
                     "stylesFactory":function():void
                     {
                        this.right = "0";
                        this.bottom = "0";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "height":16,
                           "source":_embed_mxml_drag_png_1153533806
                        };
                     }
                  })]
               };
            }
         });
         _embed_mxml_drag_png_1153533806 = ChooseMapJumpForm__embed_mxml_drag_png_1153533806;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.height = 450;
         this.width = 460;
         this.title = "Choose where to Jump to";
         this.showCloseButton = true;
         this.layout = "absolute";
         this.addEventListener("creationComplete",___ChooseMapJumpForm_TitleWindow1_creationComplete);
         this.addEventListener("close",___ChooseMapJumpForm_TitleWindow1_close);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ChooseMapJumpForm._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get cancel() : Button
      {
         return this._1367724422cancel;
      }
      
      public function ___ChooseMapJumpForm_TitleWindow1_close(param1:CloseEvent) : void
      {
         doCancel();
      }
      
      private function updateSelectionInfo(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc3_:ChooseMapJumpCellForm = null;
         if(param2 == false && pieceList.selectedItem == null)
         {
            return;
         }
         destMapName = param2 ? pieceName.text : String(pieceList.selectedItem.name);
         pieceName.text = destMapName;
         action.enabled = destMapName != "";
         if(param1)
         {
            _loc3_ = ChooseMapJumpCellForm(PopUpManager.createPopUp(newParent,ChooseMapJumpCellForm,true));
            _loc3_.configure(destMapName,0,0);
            _loc3_.addEventListener("change",processSetMapJumpCell);
         }
      }
      
      public function __pieceList_change(param1:ListEvent) : void
      {
         updateSelectionInfo(false);
      }
      
      public function ___ChooseMapJumpForm_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ChooseMapJumpForm = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ChooseMapJumpForm_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_modals_ChooseMapJumpFormWatcherSetupUtil");
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
      
      public function set cancel(param1:Button) : void
      {
         var _loc2_:Object = this._1367724422cancel;
         if(_loc2_ !== param1)
         {
            this._1367724422cancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancel",_loc2_,param1));
         }
      }
      
      private function _ChooseMapJumpForm_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = action;
         _loc1_ = Piece.maxCharsInName;
      }
      
      private function endTrack(param1:MouseEvent) : void
      {
         systemManager.removeEventListener(MouseEvent.MOUSE_MOVE,track,true);
         systemManager.removeEventListener(MouseEvent.MOUSE_UP,endTrack,true);
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
      
      [Bindable(event="propertyChange")]
      public function get pieceDescription() : Text
      {
         return this._374267858pieceDescription;
      }
      
      [Bindable(event="propertyChange")]
      public function get action() : Button
      {
         return this._1422950858action;
      }
      
      public function __action_click(param1:MouseEvent) : void
      {
         updateSelectionInfo(true,true);
      }
      
      private function processSetMapJumpCell(param1:ChooseMapJumpCellEvent) : void
      {
         newJumpString = CommandEngine.encode({
            "command":"jump",
            "mapname":destMapName,
            "x":param1.jumpToX.toString(),
            "y":param1.jumpToY.toString()
         });
         dispatchEvent(new ChooseMapJumpEvent("change",newJumpString,true,originalJumpString,sourceX,sourceY));
         PopUpManager.removePopUp(this);
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
      }
      
      private function startTracking() : void
      {
         systemManager.addEventListener(MouseEvent.MOUSE_MOVE,track,true);
         systemManager.addEventListener(MouseEvent.MOUSE_UP,endTrack,true);
         startPt = new Point(mouseX,mouseY);
         startSize = new Point(width,height);
      }
      
      public function __pieceList_doubleClick(param1:MouseEvent) : void
      {
         updateSelectionInfo(true);
      }
      
      private function track(param1:MouseEvent) : void
      {
         width = startSize.x + mouseX - startPt.x;
         height = startSize.y + mouseY - startPt.y;
         param1.updateAfterEvent();
      }
      
      [Bindable(event="propertyChange")]
      public function get pieceList() : TileList
      {
         return this._113543340pieceList;
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
      
      public function __cancel_click(param1:MouseEvent) : void
      {
         doCancel();
      }
      
      public function ___ChooseMapJumpForm_Image1_mouseDown(param1:MouseEvent) : void
      {
         startTracking();
      }
      
      public function configure(param1:DisplayObject, param2:String, param3:String, param4:int, param5:int) : void
      {
         this.newJumpString = this.originalJumpString = param3;
         this.sourceX = param4;
         this.sourceY = param5;
         this.sourceMapName = param2;
         this.newParent = param1;
         pieceList.dataProvider = MgbCaches.getInstance().mapsPL.piecesAC;
         pieceList.itemRenderer = new ClassFactory(RendererMapPiece);
         pieceList.visible = true;
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
      
      private function _ChooseMapJumpForm_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():IFlexDisplayObject
         {
            return action;
         },function(param1:IFlexDisplayObject):void
         {
            _ChooseMapJumpForm_Form1.defaultButton = param1;
         },"_ChooseMapJumpForm_Form1.defaultButton");
         result[0] = binding;
         binding = new Binding(this,function():int
         {
            return Piece.maxCharsInName;
         },function(param1:int):void
         {
            pieceName.maxChars = param1;
         },"pieceName.maxChars");
         result[1] = binding;
         return result;
      }
      
      private function doCancel() : void
      {
         dispatchEvent(new ChooseMapJumpEvent("cancel",null,true,originalJumpString));
         PopUpManager.removePopUp(this);
      }
      
      public function __pieceName_change(param1:Event) : void
      {
         action.enabled = pieceName.text != "";
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
   }
}
