package
{
   import com.mgb.controls.BitmapDuper;
   import com.mgb.controls.TileEdit;
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
   import korax.controls.ColorPicker.*;
   import mx.binding.*;
   import mx.containers.Box;
   import mx.containers.Canvas;
   import mx.containers.Panel;
   import mx.controls.*;
   import mx.core.*;
   import mx.effects.Glow;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.states.AddChild;
   import mx.states.State;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class TileMakerControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _embed_mxml_Resources_LoadIcon_png_989977250:Class;
      
      private var _1943454233ButtonCopy:ToolButton;
      
      private var _119739965ButtonActor:ToolButton;
      
      mx_internal var _bindings:Array;
      
      private var _2015518096ButtonCut:ToolButton;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _1943497895ButtonBack:ToolButton;
      
      private var _1942919338ButtonUndo:ToolButton;
      
      private var _embed_mxml_Resources_TessIcon_png_681332008:Class;
      
      private var _1942957309ButtonTess:ToolButton;
      
      private var _embed_mxml_Resources_PencilToolIcon_png_136067688:Class;
      
      private var _1703220639tilemakerBackgroundColor:SelectBackgroundColor;
      
      private var _1943070298ButtonPlay:ToolButton;
      
      private var _embed_mxml_Resources_EraserToolIcon_png_140625766:Class;
      
      private var _embed_mxml_Resources_ZoomToolIcon_png_1060521644:Class;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _embed_mxml_Resources_CutIcon_png_1744290824:Class;
      
      private var _1268861541footer:EditFooterComponent;
      
      private var _1017496192ButtonPicker:ToolButton;
      
      private var _embed_mxml_Resources_PhotoIcon_png_1640375304:Class;
      
      private var _2015530087ButtonPen:ToolButton;
      
      private var _731473762ButtonFiller:ToolButton;
      
      private var _1942990865ButtonSave:ToolButton;
      
      private var _embed_mxml_Resources_EraserBackgroundIndicator_png_1195563852:Class;
      
      private var _1943315021ButtonHelp:ToolButton;
      
      public var itf:ImportTileForm;
      
      private var _2066190749moveButton:ToolButton;
      
      private var _2015528174ButtonNew:ToolButton;
      
      private var _embed_mxml_Resources_RedoIcon_png_1259461794:Class;
      
      private var _embed_mxml_Resources_SelectIcon_png_366341610:Class;
      
      private var _1943135899ButtonNext:ToolButton;
      
      private var _594302746ButtonMagnifier2:ToolButton;
      
      private var _2059038924ButtonMagnifier:ToolButtonWide;
      
      private var _1099951854ButtonSelect:ToolButton;
      
      private var _embed_mxml_Resources_ColorPickerIcon_png_1742509566:Class;
      
      private var _821177751ButtonImport:ToolButton;
      
      private var _95948524duper:BitmapDuper;
      
      private var _339214806showGlow:Glow;
      
      private var _embed_mxml_Resources_UndoIcon_png_870148762:Class;
      
      private var _embed_mxml_Resources_ThicknessIcon_png_13638908:Class;
      
      private var _1943017360ButtonRedo:ToolButton;
      
      private var _105947551ButtonPaste:ToolButton;
      
      private var _embed_mxml_Resources_NextIcon_png_872008892:Class;
      
      private var _embed_mxml_Resources_BigPaintBrushToolIcon_png_898334212:Class;
      
      private var _1943186600ButtonLoad:ToolButton;
      
      private var _798910853palette:TileMakerPalette;
      
      private var _embed_mxml_Resources_ImportTileIcon_png_1881025404:Class;
      
      private var _1941824968PanelViewActualSize:Panel;
      
      private var _embed_mxml_Resources_NewIcon_png_1810360004:Class;
      
      private var _embed_mxml_Resources_SaveIcon_png_953805992:Class;
      
      private var _105742848ButtonPhoto:ToolButton;
      
      private var _embed_mxml_Resources_PrevIcon_png_937253436:Class;
      
      private var _118368504ButtonBrush:ToolButton;
      
      mx_internal var _watchers:Array;
      
      private var _3089839dpad:TileEdit;
      
      public var _TileMakerControl_AddChild20:AddChild;
      
      public var _TileMakerControl_AddChild21:AddChild;
      
      private var _102055061ButtonThick:ToolButton;
      
      private var _embed_mxml_Resources_CopyIcon_png_853131432:Class;
      
      private var _521038350PanelEdit:Panel;
      
      private var _embed_mxml_Resources_HandToolIcon_png_1018644132:Class;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _885706193colorPicker:Box;
      
      private var _710835326ButtonEraser:ToolButton;
      
      private var _embed_mxml_Resources_PasteIcon_png_908851846:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml_Resources_PlayIcon_png_687450682:Class;
      
      private var _embed_mxml_Resources_HelpIcon_png_920508456:Class;
      
      private var _embed_mxml_Resources_PaintBucketIcon_png_1708936252:Class;
      
      public function TileMakerControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":ToolButton,
                  "id":"ButtonPen",
                  "events":{"click":"__ButtonPen_click"},
                  "stylesFactory":function():void
                  {
                     this.overIcon = _embed_mxml_Resources_PencilToolIcon_png_136067688;
                     this.upIcon = _embed_mxml_Resources_PencilToolIcon_png_136067688;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":8,
                        "y":8,
                        "label":"Pen",
                        "toolTip":"[p]en"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ToolButton,
                  "id":"ButtonHelp",
                  "events":{"click":"__ButtonHelp_click"},
                  "stylesFactory":function():void
                  {
                     this.overIcon = _embed_mxml_Resources_HelpIcon_png_920508456;
                     this.upIcon = _embed_mxml_Resources_HelpIcon_png_920508456;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":176,
                        "y":360,
                        "label":"Help"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Panel,
                  "id":"PanelViewActualSize",
                  "stylesFactory":function():void
                  {
                     this.headerHeight = 8;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":8,
                        "y":248,
                        "width":160,
                        "height":160,
                        "layout":"absolute",
                        "clipContent":true,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":BitmapDuper,
                           "id":"duper",
                           "stylesFactory":function():void
                           {
                              this.verticalCenter = "0";
                              this.horizontalCenter = "0";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":128,
                                 "height":128
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Panel,
                  "id":"PanelEdit",
                  "stylesFactory":function():void
                  {
                     this.left = "232";
                     this.bottom = "76";
                     this.top = "8";
                     this.right = "8";
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "layout":"absolute",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":TileEdit,
                           "id":"dpad",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
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
                     return {"x":8};
                  }
               }),new UIComponentDescriptor({
                  "type":SelectBackgroundColor,
                  "id":"tilemakerBackgroundColor",
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
         _1217010542mgbSession = MgbSession.getInstance();
         _embed_mxml_Resources_BigPaintBrushToolIcon_png_898334212 = TileMakerControl__embed_mxml_Resources_BigPaintBrushToolIcon_png_898334212;
         _embed_mxml_Resources_ColorPickerIcon_png_1742509566 = TileMakerControl__embed_mxml_Resources_ColorPickerIcon_png_1742509566;
         _embed_mxml_Resources_CopyIcon_png_853131432 = TileMakerControl__embed_mxml_Resources_CopyIcon_png_853131432;
         _embed_mxml_Resources_CutIcon_png_1744290824 = TileMakerControl__embed_mxml_Resources_CutIcon_png_1744290824;
         _embed_mxml_Resources_EraserBackgroundIndicator_png_1195563852 = TileMakerControl__embed_mxml_Resources_EraserBackgroundIndicator_png_1195563852;
         _embed_mxml_Resources_EraserToolIcon_png_140625766 = TileMakerControl__embed_mxml_Resources_EraserToolIcon_png_140625766;
         _embed_mxml_Resources_HandToolIcon_png_1018644132 = TileMakerControl__embed_mxml_Resources_HandToolIcon_png_1018644132;
         _embed_mxml_Resources_HelpIcon_png_920508456 = TileMakerControl__embed_mxml_Resources_HelpIcon_png_920508456;
         _embed_mxml_Resources_ImportTileIcon_png_1881025404 = TileMakerControl__embed_mxml_Resources_ImportTileIcon_png_1881025404;
         _embed_mxml_Resources_LoadIcon_png_989977250 = TileMakerControl__embed_mxml_Resources_LoadIcon_png_989977250;
         _embed_mxml_Resources_NewIcon_png_1810360004 = TileMakerControl__embed_mxml_Resources_NewIcon_png_1810360004;
         _embed_mxml_Resources_NextIcon_png_872008892 = TileMakerControl__embed_mxml_Resources_NextIcon_png_872008892;
         _embed_mxml_Resources_PaintBucketIcon_png_1708936252 = TileMakerControl__embed_mxml_Resources_PaintBucketIcon_png_1708936252;
         _embed_mxml_Resources_PasteIcon_png_908851846 = TileMakerControl__embed_mxml_Resources_PasteIcon_png_908851846;
         _embed_mxml_Resources_PencilToolIcon_png_136067688 = TileMakerControl__embed_mxml_Resources_PencilToolIcon_png_136067688;
         _embed_mxml_Resources_PhotoIcon_png_1640375304 = TileMakerControl__embed_mxml_Resources_PhotoIcon_png_1640375304;
         _embed_mxml_Resources_PlayIcon_png_687450682 = TileMakerControl__embed_mxml_Resources_PlayIcon_png_687450682;
         _embed_mxml_Resources_PrevIcon_png_937253436 = TileMakerControl__embed_mxml_Resources_PrevIcon_png_937253436;
         _embed_mxml_Resources_RedoIcon_png_1259461794 = TileMakerControl__embed_mxml_Resources_RedoIcon_png_1259461794;
         _embed_mxml_Resources_SaveIcon_png_953805992 = TileMakerControl__embed_mxml_Resources_SaveIcon_png_953805992;
         _embed_mxml_Resources_SelectIcon_png_366341610 = TileMakerControl__embed_mxml_Resources_SelectIcon_png_366341610;
         _embed_mxml_Resources_TessIcon_png_681332008 = TileMakerControl__embed_mxml_Resources_TessIcon_png_681332008;
         _embed_mxml_Resources_ThicknessIcon_png_13638908 = TileMakerControl__embed_mxml_Resources_ThicknessIcon_png_13638908;
         _embed_mxml_Resources_UndoIcon_png_870148762 = TileMakerControl__embed_mxml_Resources_UndoIcon_png_870148762;
         _embed_mxml_Resources_ZoomToolIcon_png_1060521644 = TileMakerControl__embed_mxml_Resources_ZoomToolIcon_png_1060521644;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.currentState = "Level_12";
         this.states = [_TileMakerControl_State1_c(),_TileMakerControl_State2_c(),_TileMakerControl_State3_c(),_TileMakerControl_State4_c(),_TileMakerControl_State5_c(),_TileMakerControl_State6_c(),_TileMakerControl_State7_c(),_TileMakerControl_State8_c(),_TileMakerControl_State9_c(),_TileMakerControl_State10_c(),_TileMakerControl_State11_c(),_TileMakerControl_State12_c(),_TileMakerControl_State13_c(),_TileMakerControl_State14_c(),_TileMakerControl_State15_c()];
         _TileMakerControl_Glow1_i();
         this.addEventListener("creationComplete",___TileMakerControl_Canvas1_creationComplete);
         this.addEventListener("mouseOver",___TileMakerControl_Canvas1_mouseOver);
         this.addEventListener("mouseOut",___TileMakerControl_Canvas1_mouseOut);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         TileMakerControl._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPhoto() : ToolButton
      {
         return this._105742848ButtonPhoto;
      }
      
      public function set ButtonTess(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1942957309ButtonTess;
         if(_loc2_ !== param1)
         {
            this._1942957309ButtonTess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonTess",_loc2_,param1));
         }
      }
      
      public function set ButtonPhoto(param1:ToolButton) : void
      {
         var _loc2_:Object = this._105742848ButtonPhoto;
         if(_loc2_ !== param1)
         {
            this._105742848ButtonPhoto = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonPhoto",_loc2_,param1));
         }
      }
      
      public function set ButtonNew(param1:ToolButton) : void
      {
         var _loc2_:Object = this._2015528174ButtonNew;
         if(_loc2_ !== param1)
         {
            this._2015528174ButtonNew = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonNew",_loc2_,param1));
         }
      }
      
      public function set ButtonBrush(param1:ToolButton) : void
      {
         var _loc2_:Object = this._118368504ButtonBrush;
         if(_loc2_ !== param1)
         {
            this._118368504ButtonBrush = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonBrush",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.x = 120;
         _loc1_.y = 56;
         _loc1_.width = 48;
         _loc1_.height = 40;
         _loc1_.source = _embed_mxml_Resources_EraserBackgroundIndicator_png_1195563852;
         _loc1_.toolTip = "c[o]lor";
         _loc1_.addEventListener("click",___TileMakerControl_Image1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set ButtonSelect(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1099951854ButtonSelect;
         if(_loc2_ !== param1)
         {
            this._1099951854ButtonSelect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonSelect",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_ToolButton4_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonRedo = _loc1_;
         _loc1_.x = 64;
         _loc1_.y = 56;
         _loc1_.label = "Redo";
         _loc1_.toolTip = "[r]edo";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_RedoIcon_png_1259461794);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_RedoIcon_png_1259461794);
         _loc1_.addEventListener("click",__ButtonRedo_click);
         _loc1_.id = "ButtonRedo";
         BindingManager.executeBindings(this,"ButtonRedo",ButtonRedo);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get PanelEdit() : Panel
      {
         return this._521038350PanelEdit;
      }
      
      public function set PanelEdit(param1:Panel) : void
      {
         var _loc2_:Object = this._521038350PanelEdit;
         if(_loc2_ !== param1)
         {
            this._521038350PanelEdit = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"PanelEdit",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_AddChild4_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButtonWide1_i);
         return _loc1_;
      }
      
      private function tileEditHandleKeyEvents(param1:KeyboardEvent) : void
      {
         if(!palette.handleKey(param1.keyCode))
         {
            switch(param1.keyCode)
            {
               case Keyboard.DELETE:
               case 69:
                  dpad.selectTool("eraser");
                  break;
               case 80:
                  dpad.selectTool("pen");
                  break;
               case 66:
                  dpad.selectTool("brush");
                  break;
               case 85:
                  dpad.undo(true);
                  break;
               case 82:
                  dpad.redo(true);
                  break;
               case 75:
                  dpad.selectTool("picker");
                  break;
               case 70:
                  dpad.selectTool("fill");
                  break;
               case 77:
                  dpad.selectTool("hand");
                  break;
               case 79:
                  colorPopup();
                  break;
               case 90:
                  dpad.next_zoomLevel();
                  break;
               case 83:
                  if(dpad.allowSelect)
                  {
                     dpad.selectTool("select");
                  }
                  break;
               case 88:
                  if(dpad.allowCut)
                  {
                     dpad.doCut();
                  }
                  break;
               case 67:
                  if(dpad.allowCopy)
                  {
                     dpad.doCopy();
                  }
                  break;
               case 86:
                  if(dpad.allowPaste)
                  {
                     dpad.selectTool("paste");
                  }
                  break;
               case 84:
                  ++dpad.toolWidth;
            }
         }
      }
      
      private function _TileMakerControl_State5_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_5";
         _loc1_.basedOn = "Level_4";
         _loc1_.overrides = [_TileMakerControl_AddChild8_c(),_TileMakerControl_AddChild9_c()];
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild24_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_TileMakerPalette1_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get showGlow() : Glow
      {
         return this._339214806showGlow;
      }
      
      public function __ButtonActor_click(param1:MouseEvent) : void
      {
         makeActor();
      }
      
      private function _TileMakerControl_ToolButton13_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonSelect = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 152;
         _loc1_.label = "Select";
         _loc1_.toolTip = "[s]elect";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_SelectIcon_png_366341610);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_SelectIcon_png_366341610);
         _loc1_.addEventListener("click",__ButtonSelect_click);
         _loc1_.id = "ButtonSelect";
         BindingManager.executeBindings(this,"ButtonSelect",ButtonSelect);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TileMakerControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      [Bindable(event="propertyChange")]
      public function get PanelViewActualSize() : Panel
      {
         return this._1941824968PanelViewActualSize;
      }
      
      private function _TileMakerControl_AddChild12_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton9_i);
         return _loc1_;
      }
      
      private function doInit() : void
      {
         footer.configureSlider(14,"TileMaker","Tile Making",sliderMoveEventHandler,this);
         duper.shrinkToFitEnabled = false;
         addEventListener(KeyboardEvent.KEY_DOWN,tileEditHandleKeyEvents);
      }
      
      private function colorCompleteEvent(param1:ColorPickerEvent) : void
      {
         dpad.tagCheck("use_colorcontrol");
         removeEventListener("change",colorChangeEvent);
         removeEventListener("apply",colorCompleteEvent);
         removeEventListener("cancel",colorCompleteEvent);
      }
      
      public function __ButtonCut_click(param1:MouseEvent) : void
      {
         dpad.doCut();
      }
      
      public function __ButtonPaste_click(param1:MouseEvent) : void
      {
         dpad.selectTool("paste");
      }
      
      public function __ButtonFiller_click(param1:MouseEvent) : void
      {
         dpad.selectTool("fill");
      }
      
      public function chooseNewTile() : void
      {
         dpad.tagCheck("choose_new");
         var _loc1_:ChooseNewTileSizeForm = ChooseNewTileSizeForm(PopUpManager.createPopUp(parent,ChooseNewTileSizeForm,true));
         _loc1_.addEventListener("select",processNewTileSizeHandler);
      }
      
      private function _TileMakerControl_AddChild23_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton20_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButton3_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonUndo = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 56;
         _loc1_.label = "Undo";
         _loc1_.toolTip = "[u]ndo";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_UndoIcon_png_870148762);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_UndoIcon_png_870148762);
         _loc1_.addEventListener("click",__ButtonUndo_click);
         _loc1_.id = "ButtonUndo";
         BindingManager.executeBindings(this,"ButtonUndo",ButtonUndo);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
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
      
      private function _TileMakerControl_State4_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_4";
         _loc1_.basedOn = "Level_3";
         _loc1_.overrides = [_TileMakerControl_AddChild6_c(),_TileMakerControl_AddChild7_c()];
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPaste() : ToolButton
      {
         return this._105947551ButtonPaste;
      }
      
      private function _TileMakerControl_AddChild3_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_Box1_i);
         return _loc1_;
      }
      
      public function __ButtonEraser_click(param1:MouseEvent) : void
      {
         dpad.selectTool("eraser");
      }
      
      public function ___TileMakerControl_Canvas1_mouseOut(param1:MouseEvent) : void
      {
         releaseFocus();
      }
      
      [Bindable(event="propertyChange")]
      public function get moveButton() : ToolButton
      {
         return this._2066190749moveButton;
      }
      
      private function _TileMakerControl_ToolButton12_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonBrush = _loc1_;
         _loc1_.x = 120;
         _loc1_.y = 8;
         _loc1_.label = "Brush";
         _loc1_.toolTip = "[b]rush";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_BigPaintBrushToolIcon_png_898334212);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_BigPaintBrushToolIcon_png_898334212);
         _loc1_.addEventListener("click",__ButtonBrush_click);
         _loc1_.id = "ButtonBrush";
         BindingManager.executeBindings(this,"ButtonBrush",ButtonBrush);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonRedo() : ToolButton
      {
         return this._1943017360ButtonRedo;
      }
      
      private function _TileMakerControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = dpad.tool == "eraser";
         _loc1_ = (dpad.Gxpad_color & 4278190080) != 0;
         _loc1_ = dpad.Gxpad_color & 16777215;
         _loc1_ = showGlow;
         _loc1_ = "Zoom = " + dpad.Gzoom;
         _loc1_ = dpad.allowUndo;
         _loc1_ = dpad.allowRedo;
         _loc1_ = dpad.tool == "fill";
         _loc1_ = dpad.tool == "picker";
         _loc1_ = dpad.tool == "hand";
         _loc1_ = "Thick " + dpad.toolWidth;
         _loc1_ = dpad.tool == "brush";
         _loc1_ = dpad.allowSelect;
         _loc1_ = dpad.tool == "select";
         _loc1_ = dpad.allowCut;
         _loc1_ = dpad.allowCopy;
         _loc1_ = dpad.allowPaste;
         _loc1_ = dpad.tool == "paste";
         _loc1_ = ButtonPaste;
         _loc1_ = dpad.camOn;
         _loc1_ = ButtonPicker;
         _loc1_ = dpad.tool == "pen";
         _loc1_ = "Edit tile " + dpad.tilePiece.name + " here...";
         _loc1_ = duper;
      }
      
      public function __ButtonMagnifier_click(param1:MouseEvent) : void
      {
         dpad.next_zoomLevel();
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPen() : ToolButton
      {
         return this._2015530087ButtonPen;
      }
      
      public function set PanelViewActualSize(param1:Panel) : void
      {
         var _loc2_:Object = this._1941824968PanelViewActualSize;
         if(_loc2_ !== param1)
         {
            this._1941824968PanelViewActualSize = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"PanelViewActualSize",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_AddChild11_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton8_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonEraser() : ToolButton
      {
         return this._710835326ButtonEraser;
      }
      
      private function _TileMakerControl_AddChild19_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton16_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButtonWide1_i() : ToolButtonWide
      {
         var _loc1_:ToolButtonWide = new ToolButtonWide();
         ButtonMagnifier = _loc1_;
         _loc1_.y = 12;
         _loc1_.toolTip = "[z]oom";
         _loc1_.setStyle("right","32");
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_ZoomToolIcon_png_1060521644);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_ZoomToolIcon_png_1060521644);
         _loc1_.addEventListener("click",__ButtonMagnifier_click);
         _loc1_.id = "ButtonMagnifier";
         BindingManager.executeBindings(this,"ButtonMagnifier",ButtonMagnifier);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPicker() : ToolButton
      {
         return this._1017496192ButtonPicker;
      }
      
      [Bindable(event="propertyChange")]
      public function get palette() : TileMakerPalette
      {
         return this._798910853palette;
      }
      
      public function __moveButton_click(param1:MouseEvent) : void
      {
         dpad.selectTool("hand");
      }
      
      private function _TileMakerControl_ToolButton23_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonBack = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 417;
         _loc1_.height = 20;
         _loc1_.labelPlacement = "right";
         _loc1_.label = "Back";
         _loc1_.width = 60;
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_PrevIcon_png_937253436);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_PrevIcon_png_937253436);
         _loc1_.id = "ButtonBack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function takeFocus() : void
      {
         this.setFocus();
      }
      
      private function _TileMakerControl_Glow1_i() : Glow
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
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild22_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton19_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButton2_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonMagnifier2 = _loc1_;
         _loc1_.y = 102;
         _loc1_.label = "Zoom";
         _loc1_.x = 120;
         _loc1_.toolTip = "[z]oom";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_ZoomToolIcon_png_1060521644);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_ZoomToolIcon_png_1060521644);
         _loc1_.addEventListener("click",__ButtonMagnifier2_click);
         _loc1_.id = "ButtonMagnifier2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TileMakerControl_State3_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_3";
         _loc1_.basedOn = "Level_2";
         _loc1_.overrides = [_TileMakerControl_AddChild4_c(),_TileMakerControl_AddChild5_c()];
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild2_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_Image1_c);
         return _loc1_;
      }
      
      private function makeActor() : void
      {
         if(dpad.tilePiece.name == null || dpad.tilePiece.name == "")
         {
            Alert.show("You must save the tile before you can use it in an Actor");
         }
         else
         {
            mgbSession.navGotoActorMaker();
            Application.application.actorMaker.newActor(dpad.tilePiece.name);
         }
      }
      
      public function __ButtonPhoto_click(param1:MouseEvent) : void
      {
         dpad.toggleCam();
      }
      
      public function set ButtonUndo(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1942919338ButtonUndo;
         if(_loc2_ !== param1)
         {
            this._1942919338ButtonUndo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonUndo",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_ToolButton11_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonThick = _loc1_;
         _loc1_.x = 176;
         _loc1_.y = 8;
         _loc1_.toolTip = "[t]hickness";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_ThicknessIcon_png_13638908);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_ThicknessIcon_png_13638908);
         _loc1_.addEventListener("click",__ButtonThick_click);
         _loc1_.id = "ButtonThick";
         BindingManager.executeBindings(this,"ButtonThick",ButtonThick);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set ButtonBack(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1943497895ButtonBack;
         if(_loc2_ !== param1)
         {
            this._1943497895ButtonBack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonBack",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_ToolButton19_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonImport = _loc1_;
         _loc1_.x = 176;
         _loc1_.y = 256;
         _loc1_.label = "Import";
         _loc1_.enabled = true;
         _loc1_.toolTip = "COMING SOON!!!!";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_ImportTileIcon_png_1881025404);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_ImportTileIcon_png_1881025404);
         _loc1_.addEventListener("click",__ButtonImport_click);
         _loc1_.id = "ButtonImport";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild10_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton7_i);
         return _loc1_;
      }
      
      public function __palette_colorSelect(param1:ColorPickerEvent) : void
      {
         colorChangeEvent(param1);
      }
      
      private function _TileMakerControl_AddChild18_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton15_i);
         return _loc1_;
      }
      
      public function __ButtonImport_click(param1:MouseEvent) : void
      {
         importTile();
      }
      
      private function sliderMoveEventHandler(param1:Event) : void
      {
         if(param1)
         {
            dpad.tagCheck("use_skillslider");
         }
      }
      
      public function set moveButton(param1:ToolButton) : void
      {
         var _loc2_:Object = this._2066190749moveButton;
         if(_loc2_ !== param1)
         {
            this._2066190749moveButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moveButton",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_State15_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_15";
         _loc1_.basedOn = "Level_14";
         _loc1_.overrides = [_TileMakerControl_AddChild25_c(),_TileMakerControl_AddChild26_c(),_TileMakerControl_AddChild27_c()];
         return _loc1_;
      }
      
      public function set ButtonPaste(param1:ToolButton) : void
      {
         var _loc2_:Object = this._105947551ButtonPaste;
         if(_loc2_ !== param1)
         {
            this._105947551ButtonPaste = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonPaste",_loc2_,param1));
         }
      }
      
      public function set ButtonNext(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1943135899ButtonNext;
         if(_loc2_ !== param1)
         {
            this._1943135899ButtonNext = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonNext",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonMagnifier() : ToolButtonWide
      {
         return this._2059038924ButtonMagnifier;
      }
      
      private function _TileMakerControl_ToolButton22_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonPlay = _loc1_;
         _loc1_.x = 78;
         _loc1_.y = 417;
         _loc1_.height = 20;
         _loc1_.labelPlacement = "right";
         _loc1_.width = 60;
         _loc1_.label = "Play";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_PlayIcon_png_687450682);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_PlayIcon_png_687450682);
         _loc1_.id = "ButtonPlay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set ButtonPen(param1:ToolButton) : void
      {
         var _loc2_:Object = this._2015530087ButtonPen;
         if(_loc2_ !== param1)
         {
            this._2015530087ButtonPen = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonPen",_loc2_,param1));
         }
      }
      
      public function __ButtonMagnifier2_click(param1:MouseEvent) : void
      {
         dpad.next_zoomLevel();
      }
      
      public function set ButtonLoad(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1943186600ButtonLoad;
         if(_loc2_ !== param1)
         {
            this._1943186600ButtonLoad = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonLoad",_loc2_,param1));
         }
      }
      
      public function set ButtonFiller(param1:ToolButton) : void
      {
         var _loc2_:Object = this._731473762ButtonFiller;
         if(_loc2_ !== param1)
         {
            this._731473762ButtonFiller = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonFiller",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return dpad.tool == "eraser";
         },function(param1:Boolean):void
         {
            ButtonEraser.selected = param1;
         },"ButtonEraser.selected");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return (dpad.Gxpad_color & 4278190080) != 0;
         },function(param1:Boolean):void
         {
            colorPicker.visible = param1;
         },"colorPicker.visible");
         result[1] = binding;
         binding = new Binding(this,function():uint
         {
            return dpad.Gxpad_color & 16777215;
         },function(param1:uint):void
         {
            colorPicker.setStyle("backgroundColor",param1);
         },"colorPicker.backgroundColor");
         result[2] = binding;
         binding = new Binding(this,function():*
         {
            return showGlow;
         },function(param1:*):void
         {
            colorPicker.setStyle("addedEffect",param1);
         },"colorPicker.addedEffect");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Zoom = " + dpad.Gzoom;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ButtonMagnifier.label = param1;
         },"ButtonMagnifier.label");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.allowUndo;
         },function(param1:Boolean):void
         {
            ButtonUndo.enabled = param1;
         },"ButtonUndo.enabled");
         result[5] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.allowRedo;
         },function(param1:Boolean):void
         {
            ButtonRedo.enabled = param1;
         },"ButtonRedo.enabled");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.tool == "fill";
         },function(param1:Boolean):void
         {
            ButtonFiller.selected = param1;
         },"ButtonFiller.selected");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.tool == "picker";
         },function(param1:Boolean):void
         {
            ButtonPicker.selected = param1;
         },"ButtonPicker.selected");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.tool == "hand";
         },function(param1:Boolean):void
         {
            moveButton.selected = param1;
         },"moveButton.selected");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Thick " + dpad.toolWidth;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ButtonThick.label = param1;
         },"ButtonThick.label");
         result[10] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.tool == "brush";
         },function(param1:Boolean):void
         {
            ButtonBrush.selected = param1;
         },"ButtonBrush.selected");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.allowSelect;
         },function(param1:Boolean):void
         {
            ButtonSelect.enabled = param1;
         },"ButtonSelect.enabled");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.tool == "select";
         },function(param1:Boolean):void
         {
            ButtonSelect.selected = param1;
         },"ButtonSelect.selected");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.allowCut;
         },function(param1:Boolean):void
         {
            ButtonCut.enabled = param1;
         },"ButtonCut.enabled");
         result[14] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.allowCopy;
         },function(param1:Boolean):void
         {
            ButtonCopy.enabled = param1;
         },"ButtonCopy.enabled");
         result[15] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.allowPaste;
         },function(param1:Boolean):void
         {
            ButtonPaste.enabled = param1;
         },"ButtonPaste.enabled");
         result[16] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.tool == "paste";
         },function(param1:Boolean):void
         {
            ButtonPaste.selected = param1;
         },"ButtonPaste.selected");
         result[17] = binding;
         binding = new Binding(this,function():UIComponent
         {
            return ButtonPaste;
         },function(param1:UIComponent):void
         {
            _TileMakerControl_AddChild20.relativeTo = param1;
         },"_TileMakerControl_AddChild20.relativeTo");
         result[18] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.camOn;
         },function(param1:Boolean):void
         {
            ButtonPhoto.selected = param1;
         },"ButtonPhoto.selected");
         result[19] = binding;
         binding = new Binding(this,function():UIComponent
         {
            return ButtonPicker;
         },function(param1:UIComponent):void
         {
            _TileMakerControl_AddChild21.relativeTo = param1;
         },"_TileMakerControl_AddChild21.relativeTo");
         result[20] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dpad.tool == "pen";
         },function(param1:Boolean):void
         {
            ButtonPen.selected = param1;
         },"ButtonPen.selected");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Edit tile " + dpad.tilePiece.name + " here...";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            PanelEdit.title = param1;
         },"PanelEdit.title");
         result[22] = binding;
         binding = new Binding(this,function():BitmapDuper
         {
            return duper;
         },function(param1:BitmapDuper):void
         {
            dpad.previewControl = param1;
         },"dpad.previewControl");
         result[23] = binding;
         return result;
      }
      
      public function __ButtonSelect_click(param1:MouseEvent) : void
      {
         dpad.selectTool("select");
      }
      
      private function _TileMakerControl_ToolButton1_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonEraser = _loc1_;
         _loc1_.x = 64;
         _loc1_.y = 8;
         _loc1_.label = "Eraser";
         _loc1_.toolTip = "[e]raser";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_EraserToolIcon_png_140625766);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_EraserToolIcon_png_140625766);
         _loc1_.addEventListener("click",__ButtonEraser_click);
         _loc1_.id = "ButtonEraser";
         BindingManager.executeBindings(this,"ButtonEraser",ButtonEraser);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __ButtonRedo_click(param1:MouseEvent) : void
      {
         dpad.redo();
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
      
      private function _TileMakerControl_AddChild21_i() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _TileMakerControl_AddChild21 = _loc1_;
         _loc1_.position = "before";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton18_i);
         BindingManager.executeBindings(this,"_TileMakerControl_AddChild21",_TileMakerControl_AddChild21);
         return _loc1_;
      }
      
      private function _TileMakerControl_State2_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_2";
         _loc1_.basedOn = "Level_1";
         _loc1_.overrides = [_TileMakerControl_AddChild2_c(),_TileMakerControl_AddChild3_c()];
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButton9_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonPicker = _loc1_;
         _loc1_.x = 176;
         _loc1_.y = 56;
         _loc1_.label = "Picker";
         _loc1_.toolTip = "pic[k]er";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_ColorPickerIcon_png_1742509566);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_ColorPickerIcon_png_1742509566);
         _loc1_.addEventListener("click",__ButtonPicker_click);
         _loc1_.id = "ButtonPicker";
         BindingManager.executeBindings(this,"ButtonPicker",ButtonPicker);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild1_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton1_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonMagnifier2() : ToolButton
      {
         return this._594302746ButtonMagnifier2;
      }
      
      public function set ButtonRedo(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1943017360ButtonRedo;
         if(_loc2_ !== param1)
         {
            this._1943017360ButtonRedo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonRedo",_loc2_,param1));
         }
      }
      
      public function __ButtonPicker_click(param1:MouseEvent) : void
      {
         dpad.selectTool("picker");
      }
      
      private function _TileMakerControl_ToolButton10_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         moveButton = _loc1_;
         _loc1_.x = 64;
         _loc1_.y = 102;
         _loc1_.label = "Move";
         _loc1_.toolTip = "[m]ove";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_HandToolIcon_png_1018644132);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_HandToolIcon_png_1018644132);
         _loc1_.addEventListener("click",__moveButton_click);
         _loc1_.id = "moveButton";
         BindingManager.executeBindings(this,"moveButton",moveButton);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get duper() : BitmapDuper
      {
         return this._95948524duper;
      }
      
      private function _TileMakerControl_ToolButton18_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonTess = _loc1_;
         _loc1_.x = 176;
         _loc1_.y = 312;
         _loc1_.label = "Tess";
         _loc1_.enabled = true;
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_TessIcon_png_681332008);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_TessIcon_png_681332008);
         _loc1_.addEventListener("click",__ButtonTess_click);
         _loc1_.id = "ButtonTess";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonNew() : ToolButton
      {
         return this._2015528174ButtonNew;
      }
      
      private function _TileMakerControl_AddChild9_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton6_i);
         return _loc1_;
      }
      
      public function ___TileMakerControl_Canvas1_mouseOver(param1:MouseEvent) : void
      {
         takeFocus();
      }
      
      public function set ButtonEraser(param1:ToolButton) : void
      {
         var _loc2_:Object = this._710835326ButtonEraser;
         if(_loc2_ !== param1)
         {
            this._710835326ButtonEraser = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonEraser",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_AddChild17_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton14_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_State14_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_14";
         _loc1_.basedOn = "Level_13";
         _loc1_.overrides = [_TileMakerControl_AddChild21_i(),_TileMakerControl_AddChild22_c(),_TileMakerControl_AddChild23_c(),_TileMakerControl_AddChild24_c()];
         return _loc1_;
      }
      
      public function set ButtonPicker(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1017496192ButtonPicker;
         if(_loc2_ !== param1)
         {
            this._1017496192ButtonPicker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonPicker",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonTess() : ToolButton
      {
         return this._1942957309ButtonTess;
      }
      
      public function set palette(param1:TileMakerPalette) : void
      {
         var _loc2_:Object = this._798910853palette;
         if(_loc2_ !== param1)
         {
            this._798910853palette = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"palette",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonSelect() : ToolButton
      {
         return this._1099951854ButtonSelect;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonBrush() : ToolButton
      {
         return this._118368504ButtonBrush;
      }
      
      private function colorPopup() : void
      {
         dpad.tagCheck("choose_colorcontrol");
         ColorPickerWindow.show_window(this,dpad.Gxpad_color,true);
         addEventListener("change",colorChangeEvent);
         addEventListener("apply",colorCompleteEvent);
         addEventListener("cancel",colorCompleteEvent);
      }
      
      private function _TileMakerControl_ToolButton21_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonNext = _loc1_;
         _loc1_.x = 148;
         _loc1_.y = 417;
         _loc1_.height = 20;
         _loc1_.labelPlacement = "right";
         _loc1_.width = 60;
         _loc1_.label = "Next";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_NextIcon_png_872008892);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_NextIcon_png_872008892);
         _loc1_.id = "ButtonNext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set ButtonThick(param1:ToolButton) : void
      {
         var _loc2_:Object = this._102055061ButtonThick;
         if(_loc2_ !== param1)
         {
            this._102055061ButtonThick = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonThick",_loc2_,param1));
         }
      }
      
      public function __ButtonCopy_click(param1:MouseEvent) : void
      {
         dpad.doCopy();
      }
      
      private function releaseFocus() : void
      {
      }
      
      public function __ButtonNew_click(param1:MouseEvent) : void
      {
         chooseNewTile();
      }
      
      public function ___TileMakerControl_Image1_click(param1:MouseEvent) : void
      {
         colorPopup();
      }
      
      private function _TileMakerControl_AddChild20_i() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _TileMakerControl_AddChild20 = _loc1_;
         _loc1_.position = "before";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton17_i);
         BindingManager.executeBindings(this,"_TileMakerControl_AddChild20",_TileMakerControl_AddChild20);
         return _loc1_;
      }
      
      private function _TileMakerControl_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_1";
         _loc1_.overrides = [_TileMakerControl_AddChild1_c()];
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButton8_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonFiller = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 102;
         _loc1_.label = "Fill";
         _loc1_.toolTip = "[f]ill";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_PaintBucketIcon_png_1708936252);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_PaintBucketIcon_png_1708936252);
         _loc1_.addEventListener("click",__ButtonFiller_click);
         _loc1_.id = "ButtonFiller";
         BindingManager.executeBindings(this,"ButtonFiller",ButtonFiller);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set ButtonCut(param1:ToolButton) : void
      {
         var _loc2_:Object = this._2015518096ButtonCut;
         if(_loc2_ !== param1)
         {
            this._2015518096ButtonCut = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonCut",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_State9_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_9";
         _loc1_.basedOn = "Level_8";
         _loc1_.overrides = [_TileMakerControl_AddChild13_c()];
         return _loc1_;
      }
      
      public function __ButtonSave_click(param1:MouseEvent) : void
      {
         dpad.saveTileUsingDialog();
      }
      
      private function _TileMakerControl_AddChild8_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton5_i);
         return _loc1_;
      }
      
      public function __ButtonTess_click(param1:MouseEvent) : void
      {
         duper.tesselationToggle();
      }
      
      private function _TileMakerControl_ToolButton17_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonPhoto = _loc1_;
         _loc1_.x = 176;
         _loc1_.y = 102;
         _loc1_.label = "Photo";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_PhotoIcon_png_1640375304);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_PhotoIcon_png_1640375304);
         _loc1_.addEventListener("click",__ButtonPhoto_click);
         _loc1_.id = "ButtonPhoto";
         BindingManager.executeBindings(this,"ButtonPhoto",ButtonPhoto);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set ButtonImport(param1:ToolButton) : void
      {
         var _loc2_:Object = this._821177751ButtonImport;
         if(_loc2_ !== param1)
         {
            this._821177751ButtonImport = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonImport",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_State13_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_13";
         _loc1_.basedOn = "Level_12";
         _loc1_.overrides = [_TileMakerControl_AddChild20_i()];
         return _loc1_;
      }
      
      public function __ButtonUndo_click(param1:MouseEvent) : void
      {
         dpad.undo();
      }
      
      private function _TileMakerControl_ToolButton20_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonActor = _loc1_;
         _loc1_.x = 176;
         _loc1_.y = 200;
         _loc1_.label = "Actor";
         _loc1_.enabled = true;
         _loc1_.toolTip = "Make an Actor using this tile. This is how you make players, enemeies, walls etc that you will place in your game";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_ImportTileIcon_png_1881025404);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_ImportTileIcon_png_1881025404);
         _loc1_.addEventListener("click",__ButtonActor_click);
         _loc1_.id = "ButtonActor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild16_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton13_i);
         return _loc1_;
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
      
      [Bindable(event="propertyChange")]
      public function get ButtonLoad() : ToolButton
      {
         return this._1943186600ButtonLoad;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonBack() : ToolButton
      {
         return this._1943497895ButtonBack;
      }
      
      public function set ButtonPlay(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1943070298ButtonPlay;
         if(_loc2_ !== param1)
         {
            this._1943070298ButtonPlay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonPlay",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_AddChild27_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton23_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButton7_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonNew = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 200;
         _loc1_.label = "New!";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_NewIcon_png_1810360004);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_NewIcon_png_1810360004);
         _loc1_.addEventListener("click",__ButtonNew_click);
         _loc1_.id = "ButtonNew";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TileMakerControl_TileMakerPalette1_i() : TileMakerPalette
      {
         var _loc1_:TileMakerPalette = new TileMakerPalette();
         palette = _loc1_;
         _loc1_.x = 10;
         _loc1_.y = 416;
         _loc1_.addEventListener("colorSelect",__palette_colorSelect);
         _loc1_.id = "palette";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonNext() : ToolButton
      {
         return this._1943135899ButtonNext;
      }
      
      private function colorChangeEvent(param1:ColorPickerEvent) : void
      {
         dpad.Gxpad_color = param1.color;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonFiller() : ToolButton
      {
         return this._731473762ButtonFiller;
      }
      
      private function _TileMakerControl_State8_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_8";
         _loc1_.basedOn = "Level_7";
         _loc1_.overrides = [_TileMakerControl_AddChild12_c()];
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild7_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton4_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButton16_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonPaste = _loc1_;
         _loc1_.x = 176;
         _loc1_.y = 152;
         _loc1_.label = "Paste";
         _loc1_.toolTip = "[v] paste";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_PasteIcon_png_908851846);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_PasteIcon_png_908851846);
         _loc1_.addEventListener("click",__ButtonPaste_click);
         _loc1_.id = "ButtonPaste";
         BindingManager.executeBindings(this,"ButtonPaste",ButtonPaste);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set ButtonHelp(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1943315021ButtonHelp;
         if(_loc2_ !== param1)
         {
            this._1943315021ButtonHelp = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonHelp",_loc2_,param1));
         }
      }
      
      public function set dpad(param1:TileEdit) : void
      {
         var _loc2_:Object = this._3089839dpad;
         if(_loc2_ !== param1)
         {
            this._3089839dpad = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dpad",_loc2_,param1));
         }
      }
      
      public function set tilemakerBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._1703220639tilemakerBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._1703220639tilemakerBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilemakerBackgroundColor",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_AddChild15_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton12_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_State12_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_12";
         _loc1_.basedOn = "Level_11";
         _loc1_.overrides = [_TileMakerControl_AddChild16_c(),_TileMakerControl_AddChild17_c(),_TileMakerControl_AddChild18_c(),_TileMakerControl_AddChild19_c()];
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonThick() : ToolButton
      {
         return this._102055061ButtonThick;
      }
      
      private function processNewTileSizeHandler(param1:ChooseNewTileSizeEvent) : void
      {
         dpad.tagCheck("use_new");
         dpad.newTile(param1.width,param1.height);
      }
      
      public function set ButtonActor(param1:ToolButton) : void
      {
         var _loc2_:Object = this._119739965ButtonActor;
         if(_loc2_ !== param1)
         {
            this._119739965ButtonActor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonActor",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonUndo() : ToolButton
      {
         return this._1942919338ButtonUndo;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:TileMakerControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _TileMakerControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_TileMakerControlWatcherSetupUtil");
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
      public function get footer() : EditFooterComponent
      {
         return this._1268861541footer;
      }
      
      private function _TileMakerControl_AddChild26_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton22_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButton6_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonLoad = _loc1_;
         _loc1_.x = 64;
         _loc1_.y = 200;
         _loc1_.label = "Load";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_LoadIcon_png_989977250);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_LoadIcon_png_989977250);
         _loc1_.addEventListener("click",__ButtonLoad_click);
         _loc1_.id = "ButtonLoad";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonCut() : ToolButton
      {
         return this._2015518096ButtonCut;
      }
      
      private function _TileMakerControl_State7_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_7";
         _loc1_.basedOn = "Level_6";
         _loc1_.overrides = [_TileMakerControl_AddChild11_c()];
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild6_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton3_i);
         return _loc1_;
      }
      
      public function set ButtonMagnifier(param1:ToolButtonWide) : void
      {
         var _loc2_:Object = this._2059038924ButtonMagnifier;
         if(_loc2_ !== param1)
         {
            this._2059038924ButtonMagnifier = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonMagnifier",_loc2_,param1));
         }
      }
      
      public function set colorPicker(param1:Box) : void
      {
         var _loc2_:Object = this._885706193colorPicker;
         if(_loc2_ !== param1)
         {
            this._885706193colorPicker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPicker",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPlay() : ToolButton
      {
         return this._1943070298ButtonPlay;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonImport() : ToolButton
      {
         return this._821177751ButtonImport;
      }
      
      public function __ButtonBrush_click(param1:MouseEvent) : void
      {
         dpad.selectTool("brush");
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      public function get tilemakerBackgroundColor() : SelectBackgroundColor
      {
         return this._1703220639tilemakerBackgroundColor;
      }
      
      private function _TileMakerControl_ToolButton15_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonCopy = _loc1_;
         _loc1_.x = 120;
         _loc1_.y = 152;
         _loc1_.label = "Copy";
         _loc1_.toolTip = "[c]opy";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_CopyIcon_png_853131432);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_CopyIcon_png_853131432);
         _loc1_.addEventListener("click",__ButtonCopy_click);
         _loc1_.id = "ButtonCopy";
         BindingManager.executeBindings(this,"ButtonCopy",ButtonCopy);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __colorPicker_click(param1:MouseEvent) : void
      {
         colorPopup();
      }
      
      private function _TileMakerControl_AddChild14_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton11_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get dpad() : TileEdit
      {
         return this._3089839dpad;
      }
      
      public function __ButtonLoad_click(param1:MouseEvent) : void
      {
         dpad.loadTileUsingDialog();
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonHelp() : ToolButton
      {
         return this._1943315021ButtonHelp;
      }
      
      private function _TileMakerControl_State11_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_11";
         _loc1_.basedOn = "Level_10";
         _loc1_.overrides = [_TileMakerControl_AddChild15_c()];
         return _loc1_;
      }
      
      public function set ButtonCopy(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1943454233ButtonCopy;
         if(_loc2_ !== param1)
         {
            this._1943454233ButtonCopy = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonCopy",_loc2_,param1));
         }
      }
      
      public function __ButtonPen_click(param1:MouseEvent) : void
      {
         dpad.selectTool("pen");
      }
      
      [Bindable(event="propertyChange")]
      public function get colorPicker() : Box
      {
         return this._885706193colorPicker;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonActor() : ToolButton
      {
         return this._119739965ButtonActor;
      }
      
      public function set ButtonMagnifier2(param1:ToolButton) : void
      {
         var _loc2_:Object = this._594302746ButtonMagnifier2;
         if(_loc2_ !== param1)
         {
            this._594302746ButtonMagnifier2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonMagnifier2",_loc2_,param1));
         }
      }
      
      public function __ButtonThick_click(param1:MouseEvent) : void
      {
         ++dpad.toolWidth;
      }
      
      public function set duper(param1:BitmapDuper) : void
      {
         var _loc2_:Object = this._95948524duper;
         if(_loc2_ !== param1)
         {
            this._95948524duper = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"duper",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_AddChild25_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton21_i);
         return _loc1_;
      }
      
      public function set ButtonSave(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1942990865ButtonSave;
         if(_loc2_ !== param1)
         {
            this._1942990865ButtonSave = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonSave",_loc2_,param1));
         }
      }
      
      private function _TileMakerControl_State6_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_6";
         _loc1_.basedOn = "Level_5";
         _loc1_.overrides = [_TileMakerControl_AddChild10_c()];
         return _loc1_;
      }
      
      private function _TileMakerControl_ToolButton5_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonSave = _loc1_;
         _loc1_.x = 120;
         _loc1_.y = 200;
         _loc1_.label = "Save";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_SaveIcon_png_953805992);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_SaveIcon_png_953805992);
         _loc1_.addEventListener("click",__ButtonSave_click);
         _loc1_.id = "ButtonSave";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild5_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton2_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonCopy() : ToolButton
      {
         return this._1943454233ButtonCopy;
      }
      
      public function __ButtonHelp_click(param1:MouseEvent) : void
      {
         ChooseTutorial.createMe(parent);
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonSave() : ToolButton
      {
         return this._1942990865ButtonSave;
      }
      
      private function _TileMakerControl_Box1_i() : Box
      {
         var _loc1_:Box = new Box();
         colorPicker = _loc1_;
         _loc1_.x = 120;
         _loc1_.y = 56;
         _loc1_.width = 48;
         _loc1_.height = 40;
         _loc1_.toolTip = "c[o]lor";
         _loc1_.setStyle("borderColor",0);
         _loc1_.setStyle("borderThickness",2);
         _loc1_.setStyle("cornerRadius",10);
         _loc1_.addEventListener("click",__colorPicker_click);
         _loc1_.id = "colorPicker";
         BindingManager.executeBindings(this,"colorPicker",colorPicker);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function importTile() : void
      {
         dpad.tagCheck("choose_import");
         itf = ImportTileForm(PopUpManager.createPopUp(this,ImportTileForm,true));
      }
      
      private function _TileMakerControl_ToolButton14_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonCut = _loc1_;
         _loc1_.x = 64;
         _loc1_.y = 152;
         _loc1_.label = "Cut";
         _loc1_.toolTip = "[x] cut";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_CutIcon_png_1744290824);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_CutIcon_png_1744290824);
         _loc1_.addEventListener("click",__ButtonCut_click);
         _loc1_.id = "ButtonCut";
         BindingManager.executeBindings(this,"ButtonCut",ButtonCut);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TileMakerControl_AddChild13_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_TileMakerControl_ToolButton10_i);
         return _loc1_;
      }
      
      private function _TileMakerControl_State10_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_10";
         _loc1_.basedOn = "Level_9";
         _loc1_.overrides = [_TileMakerControl_AddChild14_c()];
         return _loc1_;
      }
   }
}
