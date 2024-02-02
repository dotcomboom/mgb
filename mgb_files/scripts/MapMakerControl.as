package
{
   import com.mgb.controls.*;
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
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.*;
   import mx.core.*;
   import mx.effects.Fade;
   import mx.effects.Glow;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.rpc.events.*;
   import mx.states.AddChild;
   import mx.states.State;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class MapMakerControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _embed_mxml_Resources_LoadIcon_png_989977250:Class;
      
      private var _574308728foregroundView:ComboBox;
      
      private var _990064589gameStats:GameStatResult = null;
      
      private var _593824371ButtonPublish0:ToolButton;
      
      private var _1217010542mgbSession:MgbSession;
      
      public var _MapMakerControl_ToolButtonWide1:ToolButtonWide;
      
      private var playing:Boolean = false;
      
      private var _1942919338ButtonUndo:ToolButton;
      
      private var _813504974layerComboBox:ComboBox;
      
      private const publishHelpText:String = "Use this button to publish/unpublish your game. You should publish just the first map in a multi-map game. If the map is already published, this button will let you update the screenshot or unpublish the game";
      
      private var _1035469141unglowImage:Glow;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _embed_mxml_Resources_PencilToolIcon_png_136067688:Class;
      
      private var _1943070298ButtonPlay:ToolButton;
      
      private var _embed_mxml_Resources_EraserToolIcon_png_140625766:Class;
      
      private var _embed_mxml_Resources_ZoomToolIcon_png_1060521644:Class;
      
      private var _1071535782ButtonResize:ToolButton;
      
      private var _91955053publishDescription:TextArea;
      
      private const layerHelpText:String = "The background layer is for floors and walls only, it doesn\'t allow items or characters on that layer. The active layer is for anything (but for best performance put walls on the background layer). The foreground layer is inactive - you can use it for visual effects, but nothing there will move or interact with any other actor. Event layer is (so far) just for map jumps - use this layer to erase map jumps";
      
      private var _1268861541footer:EditFooterComponent;
      
      private var _967029710glowImage:Glow;
      
      private var _1942990865ButtonSave:ToolButton;
      
      public var _MapMakerControl_Text3:Text;
      
      private var _1943332424ButtonGrid:ToolButtonWide;
      
      public var _MapMakerControl_Label1:Label;
      
      private var _107868map:GameEngineTwoEditor;
      
      private var _2130334014actorPreviewName:Text;
      
      private var _2015528174ButtonNew:ToolButton;
      
      private var _1527975583inspectText:TextArea;
      
      private var _embed_mxml_Resources_RedoIcon_png_1259461794:Class;
      
      private var _embed_mxml_Resources_PrintIcon_png_2047213834:Class;
      
      public var _MapMakerControl_AddChild18:AddChild;
      
      private var chooseActor__originalChoice:String;
      
      private var _embed_mxml_Resources_ResizeToolIcon_png_2005992554:Class;
      
      private var _97188214fader:Fade;
      
      private var _2059038924ButtonMagnifier:ToolButtonWide;
      
      public var _MapMakerControl_RadioButton1:RadioButton;
      
      public var _MapMakerControl_RadioButton2:RadioButton;
      
      private var _543835469mapmakerBackgroundColor:SelectBackgroundColor;
      
      private var _108122637ButtonMusic:ToolButton;
      
      private var _1617693105actorPreviewPanel:Panel;
      
      private var _embed_mxml_Resources_UndoIcon_png_870148762:Class;
      
      private var _723949836selectedEditLayer:int = 1;
      
      private var _614847662publishMode:Boolean = false;
      
      private var _1943017360ButtonRedo:ToolButton;
      
      private var _embed_mxml_Resources_InspectLayersIcon_png_257083832:Class;
      
      private var _205235219actorPreview:ActorPreview;
      
      public var _MapMakerControl_VBox1:VBox;
      
      private var recentActorNamePerLayer:Array;
      
      private var _105450885ButtonPrint:ToolButton;
      
      private var _2130163002actorPreviewHint:Text;
      
      private var _1427553523backgroundView:ComboBox;
      
      private var _1943186600ButtonLoad:ToolButton;
      
      private var _1684508067chosenActor:MgbActor = null;
      
      private var _embed_mxml_Resources_NewIcon_png_1810360004:Class;
      
      public var _MapMakerControl_Panel3:Panel;
      
      private var cpf:ChoosePieceForm = null;
      
      private var _393600161filteredActorListView:ArrayCollection;
      
      private var _1553059053gameStatusRBG:RadioButtonGroup;
      
      private var _281876894ButtonInspect:ToolButton;
      
      private var _521038350PanelEdit:Panel;
      
      private var _embed_mxml_Resources_GridIcon_png_922864290:Class;
      
      mx_internal var _watchers:Array;
      
      private var _embed_mxml_Resources_SaveIcon_png_953805992:Class;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var filteredActorList:Array;
      
      private var _102747483ButtonSpare:ToolButton;
      
      mx_internal var _bindings:Array;
      
      private var _1014122239ButtonPencil:ToolButton;
      
      private var _710835326ButtonEraser:ToolButton;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml_Resources_PlayIcon_png_687450682:Class;
      
      public function MapMakerControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Panel,
                  "id":"PanelEdit",
                  "stylesFactory":function():void
                  {
                     this.titleStyleName = "gameStatus";
                     this.horizontalAlign = "center";
                     this.left = "176";
                     this.top = "8";
                     this.right = "8";
                     this.bottom = "80";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"cleanPanel",
                        "layout":"absolute",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":GameEngineTwoEditor,
                           "id":"map"
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ToolButtonWide,
                  "id":"_MapMakerControl_ToolButtonWide1",
                  "events":{"click":"___MapMakerControl_ToolButtonWide1_click"},
                  "stylesFactory":function():void
                  {
                     this.right = "32";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":120,
                        "y":12,
                        "label":"Show Inventory"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Panel,
                  "id":"actorPreviewPanel",
                  "events":{"click":"__actorPreviewPanel_click"},
                  "stylesFactory":function():void
                  {
                     this.headerHeight = 8;
                     this.borderThickness = 1;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":8,
                        "y":200,
                        "width":160,
                        "height":160,
                        "layout":"absolute",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "x":0,
                                 "y":0,
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":ActorPreview,
                                    "id":"actorPreview",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalCenter = "0";
                                       this.bottom = "8";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":128,
                                          "height":128
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"actorPreviewName",
                                    "stylesFactory":function():void
                                    {
                                       this.textAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "x":0,
                                          "y":0,
                                          "width":140,
                                          "height":48
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"actorPreviewHint",
                                    "stylesFactory":function():void
                                    {
                                       this.verticalCenter = "0";
                                       this.horizontalCenter = "0";
                                       this.textAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "text":"Click here to choose actor",
                                          "width":128,
                                          "height":48
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ToolButton,
                  "id":"ButtonPencil",
                  "events":{"click":"__ButtonPencil_click"},
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
                        "label":"Put",
                        "toolTip":"Mouse-click to place actors on the map. SHIFT-click to draw a filled rectangle between the last-clicked and the SHIFT-clicked cells"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ToolButton,
                  "id":"ButtonEraser",
                  "events":{"click":"__ButtonEraser_click"},
                  "stylesFactory":function():void
                  {
                     this.overIcon = _embed_mxml_Resources_EraserToolIcon_png_140625766;
                     this.upIcon = _embed_mxml_Resources_EraserToolIcon_png_140625766;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":64,
                        "y":8,
                        "label":"Erase"
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
                  "type":TextArea,
                  "id":"inspectText",
                  "stylesFactory":function():void
                  {
                     this.backgroundColor = 16777088;
                     this.borderThickness = 2;
                     this.borderColor = 0;
                     this.cornerRadius = 5;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":8,
                        "y":8,
                        "width":160,
                        "height":384,
                        "editable":false,
                        "alpha":1,
                        "styleName":"denseTable"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Panel,
                  "id":"_MapMakerControl_Panel3",
                  "stylesFactory":function():void
                  {
                     this.backgroundAlpha = 1;
                     this.verticalGap = 6;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"cleanPanel",
                        "title":"Publish game",
                        "x":120,
                        "y":4,
                        "width":560,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"_MapMakerControl_Text3",
                           "propertiesFactory":function():Object
                           {
                              return {"text":"Getting latest publication info..."};
                           }
                        }),new UIComponentDescriptor({
                           "type":VBox,
                           "id":"_MapMakerControl_VBox1",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":Label,
                                          "stylesFactory":function():void
                                          {
                                             this.fontWeight = "bold";
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "text":"Status:",
                                                "width":110
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":RadioButton,
                                          "id":"_MapMakerControl_RadioButton1",
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "width":120,
                                                "groupName":"gameStatusRBG"
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":RadioButton,
                                          "id":"_MapMakerControl_RadioButton2",
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "width":140,
                                                "groupName":"gameStatusRBG"
                                             };
                                          }
                                       })]};
                                    }
                                 }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "stylesFactory":function():void
                                             {
                                                this.fontWeight = "bold";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "text":"Description",
                                                   "width":110
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":TextArea,
                                             "id":"publishDescription",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "wordWrap":true,
                                                   "height":48,
                                                   "percentWidth":100,
                                                   "maxChars":160
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":Button,
                                          "events":{"click":"___MapMakerControl_Button1_click"},
                                          "propertiesFactory":function():Object
                                          {
                                             return {"label":"Save Changes"};
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Button,
                                          "events":{"click":"___MapMakerControl_Button2_click"},
                                          "propertiesFactory":function():Object
                                          {
                                             return {"label":"Cancel"};
                                          }
                                       })]};
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":SelectBackgroundColor,
                  "id":"mapmakerBackgroundColor",
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
         filteredActorList = new Array();
         _1217010542mgbSession = MgbSession.getInstance();
         _393600161filteredActorListView = new ArrayCollection();
         recentActorNamePerLayer = new Array();
         _embed_mxml_Resources_EraserToolIcon_png_140625766 = MapMakerControl__embed_mxml_Resources_EraserToolIcon_png_140625766;
         _embed_mxml_Resources_GridIcon_png_922864290 = MapMakerControl__embed_mxml_Resources_GridIcon_png_922864290;
         _embed_mxml_Resources_InspectLayersIcon_png_257083832 = MapMakerControl__embed_mxml_Resources_InspectLayersIcon_png_257083832;
         _embed_mxml_Resources_LoadIcon_png_989977250 = MapMakerControl__embed_mxml_Resources_LoadIcon_png_989977250;
         _embed_mxml_Resources_NewIcon_png_1810360004 = MapMakerControl__embed_mxml_Resources_NewIcon_png_1810360004;
         _embed_mxml_Resources_PencilToolIcon_png_136067688 = MapMakerControl__embed_mxml_Resources_PencilToolIcon_png_136067688;
         _embed_mxml_Resources_PlayIcon_png_687450682 = MapMakerControl__embed_mxml_Resources_PlayIcon_png_687450682;
         _embed_mxml_Resources_PrintIcon_png_2047213834 = MapMakerControl__embed_mxml_Resources_PrintIcon_png_2047213834;
         _embed_mxml_Resources_RedoIcon_png_1259461794 = MapMakerControl__embed_mxml_Resources_RedoIcon_png_1259461794;
         _embed_mxml_Resources_ResizeToolIcon_png_2005992554 = MapMakerControl__embed_mxml_Resources_ResizeToolIcon_png_2005992554;
         _embed_mxml_Resources_SaveIcon_png_953805992 = MapMakerControl__embed_mxml_Resources_SaveIcon_png_953805992;
         _embed_mxml_Resources_UndoIcon_png_870148762 = MapMakerControl__embed_mxml_Resources_UndoIcon_png_870148762;
         _embed_mxml_Resources_ZoomToolIcon_png_1060521644 = MapMakerControl__embed_mxml_Resources_ZoomToolIcon_png_1060521644;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.states = [_MapMakerControl_State1_c(),_MapMakerControl_State2_c(),_MapMakerControl_State3_c(),_MapMakerControl_State4_c(),_MapMakerControl_State5_c(),_MapMakerControl_State6_c(),_MapMakerControl_State7_c(),_MapMakerControl_State8_c()];
         _MapMakerControl_Fade1_i();
         _MapMakerControl_RadioButtonGroup1_i();
         _MapMakerControl_Glow1_i();
         _MapMakerControl_Glow2_i();
         this.addEventListener("creationComplete",___MapMakerControl_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MapMakerControl._watcherSetupUtil = param1;
      }
      
      private function doPublish() : void
      {
         gameStats.gamestatus = int(gameStatusRBG.selectedValue);
         gameStats.gametype = GameStats.GAMETYPES_GAME_VALUE;
         gameStats.description = publishDescription.text;
         mgbSession.gameStats.updateGameMetadata(gameStats);
         publishingModeToggle(false);
      }
      
      public function set ButtonPencil(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1014122239ButtonPencil;
         if(_loc2_ !== param1)
         {
            this._1014122239ButtonPencil = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonPencil",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonSave() : ToolButton
      {
         return this._1942990865ButtonSave;
      }
      
      public function set backgroundView(param1:ComboBox) : void
      {
         var _loc2_:Object = this._1427553523backgroundView;
         if(_loc2_ !== param1)
         {
            this._1427553523backgroundView = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundView",_loc2_,param1));
         }
      }
      
      private function _MapMakerControl_State2_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_2";
         _loc1_.basedOn = "Level_1";
         _loc1_.overrides = [_MapMakerControl_AddChild5_c(),_MapMakerControl_AddChild6_c()];
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPreview() : ActorPreview
      {
         return this._205235219actorPreview;
      }
      
      private function _MapMakerControl_ComboBox1_i() : ComboBox
      {
         var _loc1_:ComboBox = new ComboBox();
         layerComboBox = _loc1_;
         _loc1_.x = 50;
         _loc1_.y = 370;
         _loc1_.enabled = true;
         _loc1_.width = 90;
         _loc1_.height = 18;
         _loc1_.setStyle("fontFamily","Arial");
         _loc1_.setStyle("fontSize",9);
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.addEventListener("change",__layerComboBox_change);
         _loc1_.id = "layerComboBox";
         BindingManager.executeBindings(this,"layerComboBox",layerComboBox);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapMakerControl_ToolButton10_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonMusic = _loc1_;
         _loc1_.labelPlacement = "right";
         _loc1_.x = 120;
         _loc1_.y = 29;
         _loc1_.height = 18;
         _loc1_.label = "Music";
         _loc1_.toolTip = "Use this to change the background music - it activates when the player reaches this cell. Selecting \'none\' as the music will stop any music. To remove a music event, use the eraser on the EVENT layer of the map";
         _loc1_.addEventListener("click",__ButtonMusic_click);
         _loc1_.id = "ButtonMusic";
         BindingManager.executeBindings(this,"ButtonMusic",ButtonMusic);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapMakerControl_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         fader = _loc1_;
         _loc1_.duration = 400;
         return _loc1_;
      }
      
      private function processNewMapSizeHandler(param1:ChooseNewMapSizeEvent) : void
      {
         map.tagCheck("newmap");
         map.newMap(param1.width,param1.height);
      }
      
      private function set selectedEditLayer(param1:int) : void
      {
         var _loc2_:Object = this._723949836selectedEditLayer;
         if(_loc2_ !== param1)
         {
            this._723949836selectedEditLayer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedEditLayer",_loc2_,param1));
         }
      }
      
      public function __ButtonGrid_click(param1:MouseEvent) : void
      {
         map.toggleGrid();
         map.tagCheck("choose_grid");
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
      
      [Bindable(event="propertyChange")]
      public function get PanelEdit() : Panel
      {
         return this._521038350PanelEdit;
      }
      
      private function doFilterActorViewForCurrentLayer(param1:MgbActor) : void
      {
         var _loc3_:int = 0;
         var _loc2_:ArrayCollection = MgbCaches.getInstance().actorsPL.piecesAC;
         if("Yes" == GameEngineTwoEditor.actorOkForLayer(selectedEditLayer,param1))
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(_loc2_[_loc3_].name == param1.name)
               {
                  filteredActorListView.addItem(_loc2_[_loc3_]);
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      public function set actorPreview(param1:ActorPreview) : void
      {
         var _loc2_:Object = this._205235219actorPreview;
         if(_loc2_ !== param1)
         {
            this._205235219actorPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPreview",_loc2_,param1));
         }
      }
      
      public function __ButtonPencil_click(param1:MouseEvent) : void
      {
         choosePiece(true);
      }
      
      private function _MapMakerControl_ToolButton7_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonResize = _loc1_;
         _loc1_.x = 120;
         _loc1_.y = 56;
         _loc1_.label = "Resize";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_ResizeToolIcon_png_2005992554);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_ResizeToolIcon_png_2005992554);
         _loc1_.addEventListener("click",__ButtonResize_click);
         _loc1_.id = "ButtonResize";
         BindingManager.executeBindings(this,"ButtonResize",ButtonResize);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapMakerControl_AddChild7_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton5_i);
         return _loc1_;
      }
      
      public function doInit() : void
      {
         setChosenActor(null);
         footer.configureSlider(8,"MapMaker","Map Making",sliderMoveEventHandler,this);
         map.setGameStatusString("You can change your map here by adding or removing actors");
         mgbSession.gameStats.addEventListener(GameStatsUpdateEvent.GAME_STATS_UPDATE,gameStatsReceiver);
         if(layerComboBox)
         {
            layerComboBox.selectedIndex = MgbMap.layerActive;
            chooseLayer();
         }
      }
      
      private function _MapMakerControl_AddChild17_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton11_i);
         return _loc1_;
      }
      
      public function set gameStatusRBG(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1553059053gameStatusRBG;
         if(_loc2_ !== param1)
         {
            this._1553059053gameStatusRBG = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameStatusRBG",_loc2_,param1));
         }
      }
      
      private function cancelChoosePieceChange(param1:ChoosePieceEvent) : void
      {
         setChosenActor(chooseActor__originalChoice);
         map.select_tool_pen();
      }
      
      public function ___MapMakerControl_ToolButtonWide1_click(param1:MouseEvent) : void
      {
         map.toggleInventory();
      }
      
      public function __ButtonMusic_click(param1:MouseEvent) : void
      {
         map.select_tool_music();
      }
      
      private function _MapMakerControl_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_1";
         _loc1_.overrides = [_MapMakerControl_AddChild1_c(),_MapMakerControl_AddChild2_c(),_MapMakerControl_AddChild3_c(),_MapMakerControl_AddChild4_c()];
         return _loc1_;
      }
      
      public function __ButtonEraser_click(param1:MouseEvent) : void
      {
         chooseEraser();
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonInspect() : ToolButton
      {
         return this._281876894ButtonInspect;
      }
      
      private function _MapMakerControl_ToolButton6_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonRedo = _loc1_;
         _loc1_.x = 64;
         _loc1_.y = 56;
         _loc1_.label = "Redo";
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
      public function get ButtonRedo() : ToolButton
      {
         return this._1943017360ButtonRedo;
      }
      
      private function _MapMakerControl_AddChild16_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton10_i);
         return _loc1_;
      }
      
      public function __ButtonMagnifier_click(param1:MouseEvent) : void
      {
         map.next_zoomLevel();
         map.tagCheck("choose_zoom");
      }
      
      private function _MapMakerControl_AddChild6_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButtonWide3_i);
         return _loc1_;
      }
      
      private function reactivateRecentChosenActorForThisLayer() : void
      {
         var _loc1_:String = String(recentActorNamePerLayer[selectedEditLayer]);
         var _loc2_:MgbActor = !!_loc1_ ? MgbActor(MgbCaches.getInstance().actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,_loc1_)) : null;
         setChosenActor(Boolean(_loc2_) && "Yes" == GameEngineTwoEditor.actorOkForLayer(selectedEditLayer,_loc2_) ? _loc1_ : null);
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonEraser() : ToolButton
      {
         return this._710835326ButtonEraser;
      }
      
      [Bindable(event="propertyChange")]
      public function get foregroundView() : ComboBox
      {
         return this._574308728foregroundView;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPrint() : ToolButton
      {
         return this._105450885ButtonPrint;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPublish0() : ToolButton
      {
         return this._593824371ButtonPublish0;
      }
      
      public function set actorPreviewHint(param1:Text) : void
      {
         var _loc2_:Object = this._2130163002actorPreviewHint;
         if(_loc2_ !== param1)
         {
            this._2130163002actorPreviewHint = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPreviewHint",_loc2_,param1));
         }
      }
      
      public function __ButtonResize_click(param1:MouseEvent) : void
      {
         map.select_tool_resize();
      }
      
      public function chooseNewMap() : void
      {
         map.tagCheck("choose_new");
         var _loc1_:ChooseNewMapSizeForm = ChooseNewMapSizeForm(PopUpManager.createPopUp(parent,ChooseNewMapSizeForm,true));
         _loc1_.addEventListener("select",processNewMapSizeHandler);
      }
      
      public function __backgroundView_change(param1:ListEvent) : void
      {
         map.changeView("background",Number(backgroundView.selectedIndex) / 2);
      }
      
      public function set actorPreviewName(param1:Text) : void
      {
         var _loc2_:Object = this._2130334014actorPreviewName;
         if(_loc2_ !== param1)
         {
            this._2130334014actorPreviewName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPreviewName",_loc2_,param1));
         }
      }
      
      public function ___MapMakerControl_Button2_click(param1:MouseEvent) : void
      {
         publishingModeToggle(false);
      }
      
      public function set mapmakerBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._543835469mapmakerBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._543835469mapmakerBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapmakerBackgroundColor",_loc2_,param1));
         }
      }
      
      public function __ButtonPublish0_click(param1:MouseEvent) : void
      {
         this.publishingModeToggle(!publishMode);
      }
      
      private function set publishMode(param1:Boolean) : void
      {
         var _loc2_:Object = this._614847662publishMode;
         if(_loc2_ !== param1)
         {
            this._614847662publishMode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"publishMode",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonSpare() : ToolButton
      {
         return this._102747483ButtonSpare;
      }
      
      private function _MapMakerControl_ToolButton5_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonUndo = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 56;
         _loc1_.label = "Undo";
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
      
      public function set ButtonLoad(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1943186600ButtonLoad;
         if(_loc2_ !== param1)
         {
            this._1943186600ButtonLoad = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonLoad",_loc2_,param1));
         }
      }
      
      public function set unglowImage(param1:Glow) : void
      {
         var _loc2_:Object = this._1035469141unglowImage;
         if(_loc2_ !== param1)
         {
            this._1035469141unglowImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"unglowImage",_loc2_,param1));
         }
      }
      
      private function _MapMakerControl_AddChild15_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton9_i);
         return _loc1_;
      }
      
      private function _MapMakerControl_AddChild5_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButtonWide2_i);
         return _loc1_;
      }
      
      private function _MapMakerControl_State8_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_8";
         _loc1_.basedOn = "Level_7";
         _loc1_.overrides = [_MapMakerControl_AddChild17_c(),_MapMakerControl_AddChild18_i()];
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get filteredActorListView() : ArrayCollection
      {
         return this._393600161filteredActorListView;
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
      
      [Bindable(event="propertyChange")]
      public function get ButtonResize() : ToolButton
      {
         return this._1071535782ButtonResize;
      }
      
      public function filterActorViewForCurrentLayer() : void
      {
         var _loc3_:int = 0;
         var _loc4_:MgbActor = null;
         var _loc1_:PieceCache = MgbCaches.getInstance().actorCache;
         var _loc2_:ArrayCollection = MgbCaches.getInstance().actorsPL.piecesAC;
         if(_loc2_ != null)
         {
            filteredActorList = new Array();
            filteredActorListView = new ArrayCollection(filteredActorList);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = MgbActor(_loc1_.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,_loc2_[_loc3_].name));
               if(null == _loc4_ || _loc4_.actorXML == null)
               {
                  _loc1_.getPiece(mgbSession.userName,mgbSession.activeProject,_loc2_[_loc3_].name,doFilterActorViewForCurrentLayer);
               }
               else
               {
                  doFilterActorViewForCurrentLayer(_loc4_);
               }
               _loc3_++;
            }
         }
      }
      
      private function sliderMoveEventHandler(param1:Event) : void
      {
         if(param1)
         {
            map.tagCheck("use_skillslider");
         }
      }
      
      public function set map(param1:GameEngineTwoEditor) : void
      {
         var _loc2_:Object = this._107868map;
         if(_loc2_ !== param1)
         {
            this._107868map = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"map",_loc2_,param1));
         }
      }
      
      public function set inspectText(param1:TextArea) : void
      {
         var _loc2_:Object = this._1527975583inspectText;
         if(_loc2_ !== param1)
         {
            this._1527975583inspectText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inspectText",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonMagnifier() : ToolButtonWide
      {
         return this._2059038924ButtonMagnifier;
      }
      
      private function _MapMakerControl_State7_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_7";
         _loc1_.basedOn = "Level_6";
         _loc1_.overrides = [_MapMakerControl_AddChild15_c(),_MapMakerControl_AddChild16_c()];
         return _loc1_;
      }
      
      private function _MapMakerControl_ToolButtonWide3_i() : ToolButtonWide
      {
         var _loc1_:ToolButtonWide = new ToolButtonWide();
         ButtonGrid = _loc1_;
         _loc1_.y = 12;
         _loc1_.setStyle("right","132");
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_GridIcon_png_922864290);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_GridIcon_png_922864290);
         _loc1_.addEventListener("click",__ButtonGrid_click);
         _loc1_.id = "ButtonGrid";
         BindingManager.executeBindings(this,"ButtonGrid",ButtonGrid);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __ButtonRedo_click(param1:MouseEvent) : void
      {
         map.redo();
      }
      
      public function set publishDescription(param1:TextArea) : void
      {
         var _loc2_:Object = this._91955053publishDescription;
         if(_loc2_ !== param1)
         {
            this._91955053publishDescription = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"publishDescription",_loc2_,param1));
         }
      }
      
      private function gameStatsReceiver(param1:GameStatsUpdateEvent) : void
      {
         if(param1.gameStatResult.username == mgbSession.userName && param1.gameStatResult.game == GameStats.makeGameName(mgbSession.activeProject,map.getMapName()))
         {
            gameStats = param1.gameStatResult;
         }
      }
      
      private function _MapMakerControl_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         gameStatusRBG = _loc1_;
         _loc1_.initialized(this,"gameStatusRBG");
         return _loc1_;
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
      
      public function __ButtonPrint_click(param1:MouseEvent) : void
      {
         map.printMap();
      }
      
      public function set ButtonInspect(param1:ToolButton) : void
      {
         var _loc2_:Object = this._281876894ButtonInspect;
         if(_loc2_ !== param1)
         {
            this._281876894ButtonInspect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonInspect",_loc2_,param1));
         }
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
      
      private function _MapMakerControl_ToolButton4_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonSave = _loc1_;
         _loc1_.x = 120;
         _loc1_.y = 152;
         _loc1_.label = "Save";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_SaveIcon_png_953805992);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_SaveIcon_png_953805992);
         _loc1_.addEventListener("click",__ButtonSave_click);
         _loc1_.id = "ButtonSave";
         BindingManager.executeBindings(this,"ButtonSave",ButtonSave);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set fader(param1:Fade) : void
      {
         var _loc2_:Object = this._97188214fader;
         if(_loc2_ !== param1)
         {
            this._97188214fader = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fader",_loc2_,param1));
         }
      }
      
      private function _MapMakerControl_AddChild14_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton8_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundView() : ComboBox
      {
         return this._1427553523backgroundView;
      }
      
      private function _MapMakerControl_AddChild4_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton4_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonNew() : ToolButton
      {
         return this._2015528174ButtonNew;
      }
      
      public function set ButtonPrint(param1:ToolButton) : void
      {
         var _loc2_:Object = this._105450885ButtonPrint;
         if(_loc2_ !== param1)
         {
            this._105450885ButtonPrint = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonPrint",_loc2_,param1));
         }
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
      
      private function processChoosePieceChange(param1:ChoosePieceEvent) : void
      {
         setChosenActor(param1.pieceName);
         map.select_tool_pen();
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPencil() : ToolButton
      {
         return this._1014122239ButtonPencil;
      }
      
      public function set ButtonPublish0(param1:ToolButton) : void
      {
         var _loc2_:Object = this._593824371ButtonPublish0;
         if(_loc2_ !== param1)
         {
            this._593824371ButtonPublish0 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonPublish0",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get selectedEditLayer() : int
      {
         return this._723949836selectedEditLayer;
      }
      
      private function _MapMakerControl_State6_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_6";
         _loc1_.basedOn = "Level_5";
         _loc1_.overrides = [_MapMakerControl_AddChild14_c()];
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get gameStatusRBG() : RadioButtonGroup
      {
         return this._1553059053gameStatusRBG;
      }
      
      private function _MapMakerControl_ToolButtonWide2_i() : ToolButtonWide
      {
         var _loc1_:ToolButtonWide = new ToolButtonWide();
         ButtonMagnifier = _loc1_;
         _loc1_.y = 12;
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
      
      private function choosePiece(param1:Boolean = false) : void
      {
         if(param1 == true && chosenActor != null)
         {
            map.select_tool_pen();
         }
         else
         {
            if(param1 == true)
            {
               reactivateRecentChosenActorForThisLayer();
               if(chosenActor != null)
               {
                  map.select_tool_pen();
                  return;
               }
            }
            map.clear_inspect();
            filterActorViewForCurrentLayer();
            cpf = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
            cpf.configure(mgbSession.userName,mgbSession.activeProject,"actor","",ChoosePieceForm.LABEL_CHOOSE,filteredActorListView);
            chooseActor__originalChoice = new String(!!chosenActor ? chosenActor.name : "");
            cpf.addEventListener("change",processChoosePieceChange);
            cpf.addEventListener("cancel",cancelChoosePieceChange);
         }
      }
      
      public function __ButtonSave_click(param1:MouseEvent) : void
      {
         map.SaveMapUsingDialog();
      }
      
      private function _MapMakerControl_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _MapMakerControl_Label1 = _loc1_;
         _loc1_.text = "Layer:";
         _loc1_.x = 8;
         _loc1_.y = 370;
         _loc1_.styleName = "denseTable";
         _loc1_.id = "_MapMakerControl_Label1";
         BindingManager.executeBindings(this,"_MapMakerControl_Label1",_MapMakerControl_Label1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapMakerControl_Glow2_i() : Glow
      {
         var _loc1_:Glow = new Glow();
         unglowImage = _loc1_;
         _loc1_.duration = 750;
         _loc1_.alphaFrom = 0.8;
         _loc1_.alphaTo = 0.8;
         _loc1_.blurXFrom = 50;
         _loc1_.blurXTo = 0;
         _loc1_.blurYFrom = 50;
         _loc1_.blurYTo = 0;
         _loc1_.strength = 10;
         _loc1_.knockout = false;
         _loc1_.color = 32768;
         return _loc1_;
      }
      
      private function _MapMakerControl_ToolButton3_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonLoad = _loc1_;
         _loc1_.x = 64;
         _loc1_.y = 152;
         _loc1_.label = "Load";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_LoadIcon_png_989977250);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_LoadIcon_png_989977250);
         _loc1_.addEventListener("click",__ButtonLoad_click);
         _loc1_.id = "ButtonLoad";
         BindingManager.executeBindings(this,"ButtonLoad",ButtonLoad);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __ButtonNew_click(param1:MouseEvent) : void
      {
         chooseNewMap();
      }
      
      private function _MapMakerControl_AddChild13_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ComboBox3_i);
         return _loc1_;
      }
      
      private function _MapMakerControl_AddChild3_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton3_i);
         return _loc1_;
      }
      
      public function __layerComboBox_change(param1:ListEvent) : void
      {
         chooseLayer();
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPreviewName() : Text
      {
         return this._2130334014actorPreviewName;
      }
      
      public function __ButtonUndo_click(param1:MouseEvent) : void
      {
         map.undo();
      }
      
      private function set filteredActorListView(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._393600161filteredActorListView;
         if(_loc2_ !== param1)
         {
            this._393600161filteredActorListView = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"filteredActorListView",_loc2_,param1));
         }
      }
      
      private function set chosenActor(param1:MgbActor) : void
      {
         var _loc2_:Object = this._1684508067chosenActor;
         if(_loc2_ !== param1)
         {
            this._1684508067chosenActor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenActor",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPreviewHint() : Text
      {
         return this._2130163002actorPreviewHint;
      }
      
      public function set ButtonSpare(param1:ToolButton) : void
      {
         var _loc2_:Object = this._102747483ButtonSpare;
         if(_loc2_ !== param1)
         {
            this._102747483ButtonSpare = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonSpare",_loc2_,param1));
         }
      }
      
      public function ___MapMakerControl_State5_enterState(param1:FlexEvent) : void
      {
         this.layerComboBox.selectedIndex = this.selectedEditLayer;
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
      private function get publishMode() : Boolean
      {
         return this._614847662publishMode;
      }
      
      [Bindable(event="propertyChange")]
      public function get mapmakerBackgroundColor() : SelectBackgroundColor
      {
         return this._543835469mapmakerBackgroundColor;
      }
      
      [Bindable(event="propertyChange")]
      public function get unglowImage() : Glow
      {
         return this._1035469141unglowImage;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonUndo() : ToolButton
      {
         return this._1942919338ButtonUndo;
      }
      
      private function _MapMakerControl_State5_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_5";
         _loc1_.basedOn = "Level_4";
         _loc1_.overrides = [_MapMakerControl_AddChild10_c(),_MapMakerControl_AddChild11_c(),_MapMakerControl_AddChild12_c(),_MapMakerControl_AddChild13_c()];
         _loc1_.addEventListener("enterState",___MapMakerControl_State5_enterState);
         return _loc1_;
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
      
      [Bindable(event="propertyChange")]
      public function get map() : GameEngineTwoEditor
      {
         return this._107868map;
      }
      
      public function ___MapMakerControl_Button1_click(param1:MouseEvent) : void
      {
         doPublish();
      }
      
      [Bindable(event="propertyChange")]
      public function get inspectText() : TextArea
      {
         return this._1527975583inspectText;
      }
      
      public function set actorPreviewPanel(param1:Panel) : void
      {
         var _loc2_:Object = this._1617693105actorPreviewPanel;
         if(_loc2_ !== param1)
         {
            this._1617693105actorPreviewPanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPreviewPanel",_loc2_,param1));
         }
      }
      
      public function set ButtonResize(param1:ToolButton) : void
      {
         var _loc2_:Object = this._1071535782ButtonResize;
         if(_loc2_ !== param1)
         {
            this._1071535782ButtonResize = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonResize",_loc2_,param1));
         }
      }
      
      private function _MapMakerControl_Glow1_i() : Glow
      {
         var _loc1_:Glow = new Glow();
         glowImage = _loc1_;
         _loc1_.duration = 750;
         _loc1_.alphaFrom = 0.8;
         _loc1_.alphaTo = 0;
         _loc1_.blurXFrom = 0;
         _loc1_.blurXTo = 50;
         _loc1_.blurYFrom = 0;
         _loc1_.blurYTo = 50;
         _loc1_.strength = 10;
         _loc1_.knockout = true;
         _loc1_.color = 32768;
         return _loc1_;
      }
      
      public function __foregroundView_change(param1:ListEvent) : void
      {
         map.changeView("foreground",Number(foregroundView.selectedIndex) / 2);
      }
      
      private function _MapMakerControl_ToolButton2_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonNew = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 152;
         _loc1_.label = "New!";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_NewIcon_png_1810360004);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_NewIcon_png_1810360004);
         _loc1_.addEventListener("click",__ButtonNew_click);
         _loc1_.id = "ButtonNew";
         BindingManager.executeBindings(this,"ButtonNew",ButtonNew);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get publishDescription() : TextArea
      {
         return this._91955053publishDescription;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function _MapMakerControl_AddChild2_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton2_i);
         return _loc1_;
      }
      
      public function set foregroundView(param1:ComboBox) : void
      {
         var _loc2_:Object = this._574308728foregroundView;
         if(_loc2_ !== param1)
         {
            this._574308728foregroundView = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"foregroundView",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fader() : Fade
      {
         return this._97188214fader;
      }
      
      public function set ButtonGrid(param1:ToolButtonWide) : void
      {
         var _loc2_:Object = this._1943332424ButtonGrid;
         if(_loc2_ !== param1)
         {
            this._1943332424ButtonGrid = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonGrid",_loc2_,param1));
         }
      }
      
      private function _MapMakerControl_AddChild12_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ComboBox2_i);
         return _loc1_;
      }
      
      private function chooseLayer() : void
      {
         trace("choseLayer() -> Layer " + layerComboBox.selectedIndex);
         selectedEditLayer = layerComboBox.selectedIndex;
         map.selectLayer(selectedEditLayer);
         if(chosenActor)
         {
            if("Yes" == GameEngineTwoEditor.actorOkForLayer(selectedEditLayer,chosenActor))
            {
               setChosenActor(chosenActor.name);
            }
            else
            {
               reactivateRecentChosenActorForThisLayer();
            }
         }
      }
      
      private function chooseEraser() : void
      {
         map.select_tool_eraser();
         setChosenActor(null);
      }
      
      private function playButton() : void
      {
         playing = !playing;
         if(playing)
         {
            PanelEdit.horizontalScrollPolicy = "off";
            PanelEdit.verticalScrollPolicy = "off";
            map.triggerPlayMode();
            ButtonPlay.label = "EDIT";
            map.next_zoomLevel(1);
            playing = map.playGame();
            map.tagCheck("play_start");
         }
         if(!playing)
         {
            PanelEdit.horizontalScrollPolicy = "auto";
            PanelEdit.verticalScrollPolicy = "auto";
            map.stopGameIfPlaying();
            map.triggerEditMode();
            ButtonPlay.label = "Play";
            map.setGameStatusString("You can change your map here by adding or removing actors");
            map.tagCheck("play_stop");
         }
      }
      
      public function __ButtonInspect_click(param1:MouseEvent) : void
      {
         map.select_tool_inspect();
      }
      
      public function __ButtonSpare_click(param1:MouseEvent) : void
      {
         map.select_tool_jump();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MapMakerControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _MapMakerControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_MapMakerControlWatcherSetupUtil");
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
      public function get ButtonLoad() : ToolButton
      {
         return this._1943186600ButtonLoad;
      }
      
      public function __actorPreviewPanel_click(param1:MouseEvent) : void
      {
         choosePiece();
      }
      
      [Bindable(event="propertyChange")]
      public function get footer() : EditFooterComponent
      {
         return this._1268861541footer;
      }
      
      public function set glowImage(param1:Glow) : void
      {
         var _loc2_:Object = this._967029710glowImage;
         if(_loc2_ !== param1)
         {
            this._967029710glowImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"glowImage",_loc2_,param1));
         }
      }
      
      public function __ButtonPlay_click(param1:MouseEvent) : void
      {
         playButton();
      }
      
      private function _MapMakerControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = map.gameStatusString;
         _loc1_ = map.gameEngineMode == GameEngine.GE_PLAY && false == map.G_gameOver;
         _loc1_ = map.allowNew;
         _loc1_ = !!chosenActor ? chosenActor.name : "";
         _loc1_ = glowImage;
         _loc1_ = unglowImage;
         _loc1_ = chosenActor == null;
         _loc1_ = map.allowNew;
         _loc1_ = map.allowLoad;
         _loc1_ = map.allowSave;
         _loc1_ = map.allowZoom;
         _loc1_ = "Zoom = " + map.zoomLevel;
         _loc1_ = map.allowGrid;
         _loc1_ = "Grid = " + (map.showGridFlag ? "on" : "off");
         _loc1_ = map.allowUndo;
         _loc1_ = map.allowRedo;
         _loc1_ = map.allowResize;
         _loc1_ = layerHelpText;
         _loc1_ = layerHelpText;
         _loc1_ = MgbMap.layerNames;
         _loc1_ = selectedEditLayer;
         _loc1_ = layerHelpText;
         _loc1_ = layerHelpText;
         _loc1_ = map.allowInspect;
         _loc1_ = map.allowInspect;
         _loc1_ = map.allowInspect;
         _loc1_ = PanelEdit;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = map.allowPut;
         _loc1_ = map.allowErase;
         _loc1_ = Number(inspectText.alpha) == 1 ? map.toolTipText : "";
         _loc1_ = map.toolTipVisible;
         _loc1_ = layerHelpText;
         _loc1_ = fader;
         _loc1_ = fader;
         _loc1_ = fader;
         _loc1_ = fader;
         _loc1_ = publishMode;
         _loc1_ = !gameStats;
         _loc1_ = !!gameStats;
         _loc1_ = GameStats.GAMESTATUS_READY;
         _loc1_ = gameStats.gamestatus == GameStats.GAMESTATUS_READY_VALUE;
         _loc1_ = GameStats.GAMESTATUS_READY_VALUE;
         _loc1_ = GameStats.GAMESTATUS_NOTREADY;
         _loc1_ = gameStats.gamestatus == GameStats.GAMESTATUS_NOTREADY_VALUE;
         _loc1_ = GameStats.GAMESTATUS_NOTREADY_VALUE;
         _loc1_ = gameStats.description;
      }
      
      public function set layerComboBox(param1:ComboBox) : void
      {
         var _loc2_:Object = this._813504974layerComboBox;
         if(_loc2_ !== param1)
         {
            this._813504974layerComboBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layerComboBox",_loc2_,param1));
         }
      }
      
      private function _MapMakerControl_ToolButton12_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonPublish0 = _loc1_;
         _loc1_.x = 64;
         _loc1_.y = 104;
         _loc1_.label = "Publish";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_PlayIcon_png_687450682);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_PlayIcon_png_687450682);
         _loc1_.addEventListener("click",__ButtonPublish0_click);
         _loc1_.id = "ButtonPublish0";
         BindingManager.executeBindings(this,"ButtonPublish0",ButtonPublish0);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapMakerControl_ComboBox3_i() : ComboBox
      {
         var _loc1_:ComboBox = new ComboBox();
         foregroundView = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 422;
         _loc1_.selectedIndex = 2;
         _loc1_.enabled = true;
         _loc1_.height = 18;
         _loc1_.width = 108;
         _loc1_.dataProvider = ["Hide foreground","Fade foreground","Show foreground"];
         _loc1_.setStyle("fontFamily","Arial");
         _loc1_.setStyle("fontSize",9);
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("paddingLeft",0);
         _loc1_.setStyle("paddingRight",0);
         _loc1_.addEventListener("change",__foregroundView_change);
         _loc1_.id = "foregroundView";
         BindingManager.executeBindings(this,"foregroundView",foregroundView);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___MapMakerControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      private function _MapMakerControl_ToolButton1_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonPlay = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 104;
         _loc1_.label = "Play";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_PlayIcon_png_687450682);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_PlayIcon_png_687450682);
         _loc1_.addEventListener("click",__ButtonPlay_click);
         _loc1_.id = "ButtonPlay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function set gameStats(param1:GameStatResult) : void
      {
         var _loc2_:Object = this._990064589gameStats;
         if(_loc2_ !== param1)
         {
            this._990064589gameStats = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameStats",_loc2_,param1));
         }
      }
      
      private function _MapMakerControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = map.gameStatusString;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            PanelEdit.title = param1;
         },"PanelEdit.title");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.gameEngineMode == GameEngine.GE_PLAY && false == map.G_gameOver;
         },function(param1:Boolean):void
         {
            _MapMakerControl_ToolButtonWide1.visible = param1;
         },"_MapMakerControl_ToolButtonWide1.visible");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowNew;
         },function(param1:Boolean):void
         {
            actorPreviewPanel.enabled = param1;
         },"actorPreviewPanel.enabled");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !!chosenActor ? chosenActor.name : "";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            actorPreviewName.text = param1;
         },"actorPreviewName.text");
         result[3] = binding;
         binding = new Binding(this,function():*
         {
            return glowImage;
         },function(param1:*):void
         {
            actorPreviewName.setStyle("rollOverEffect",param1);
         },"actorPreviewName.rollOverEffect");
         result[4] = binding;
         binding = new Binding(this,function():*
         {
            return unglowImage;
         },function(param1:*):void
         {
            actorPreviewName.setStyle("rollOutEffect",param1);
         },"actorPreviewName.rollOutEffect");
         result[5] = binding;
         binding = new Binding(this,function():Boolean
         {
            return chosenActor == null;
         },function(param1:Boolean):void
         {
            actorPreviewHint.visible = param1;
         },"actorPreviewHint.visible");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowNew;
         },function(param1:Boolean):void
         {
            ButtonNew.enabled = param1;
         },"ButtonNew.enabled");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowLoad;
         },function(param1:Boolean):void
         {
            ButtonLoad.enabled = param1;
         },"ButtonLoad.enabled");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowSave;
         },function(param1:Boolean):void
         {
            ButtonSave.enabled = param1;
         },"ButtonSave.enabled");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowZoom;
         },function(param1:Boolean):void
         {
            ButtonMagnifier.visible = param1;
         },"ButtonMagnifier.visible");
         result[10] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Zoom = " + map.zoomLevel;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ButtonMagnifier.label = param1;
         },"ButtonMagnifier.label");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowGrid;
         },function(param1:Boolean):void
         {
            ButtonGrid.visible = param1;
         },"ButtonGrid.visible");
         result[12] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Grid = " + (map.showGridFlag ? "on" : "off");
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ButtonGrid.label = param1;
         },"ButtonGrid.label");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowUndo;
         },function(param1:Boolean):void
         {
            ButtonUndo.enabled = param1;
         },"ButtonUndo.enabled");
         result[14] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowRedo;
         },function(param1:Boolean):void
         {
            ButtonRedo.enabled = param1;
         },"ButtonRedo.enabled");
         result[15] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowResize;
         },function(param1:Boolean):void
         {
            ButtonResize.enabled = param1;
         },"ButtonResize.enabled");
         result[16] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = layerHelpText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MapMakerControl_Label1.toolTip = param1;
         },"_MapMakerControl_Label1.toolTip");
         result[17] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = layerHelpText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            layerComboBox.toolTip = param1;
         },"layerComboBox.toolTip");
         result[18] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbMap.layerNames;
         },function(param1:Object):void
         {
            layerComboBox.dataProvider = param1;
         },"layerComboBox.dataProvider");
         result[19] = binding;
         binding = new Binding(this,function():int
         {
            return selectedEditLayer;
         },function(param1:int):void
         {
            layerComboBox.selectedIndex = param1;
         },"layerComboBox.selectedIndex");
         result[20] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = layerHelpText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            backgroundView.toolTip = param1;
         },"backgroundView.toolTip");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = layerHelpText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            foregroundView.toolTip = param1;
         },"foregroundView.toolTip");
         result[22] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowInspect;
         },function(param1:Boolean):void
         {
            ButtonInspect.enabled = param1;
         },"ButtonInspect.enabled");
         result[23] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowInspect;
         },function(param1:Boolean):void
         {
            ButtonSpare.enabled = param1;
         },"ButtonSpare.enabled");
         result[24] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowInspect;
         },function(param1:Boolean):void
         {
            ButtonMusic.enabled = param1;
         },"ButtonMusic.enabled");
         result[25] = binding;
         binding = new Binding(this,function():UIComponent
         {
            return PanelEdit;
         },function(param1:UIComponent):void
         {
            _MapMakerControl_AddChild18.relativeTo = param1;
         },"_MapMakerControl_AddChild18.relativeTo");
         result[26] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            ButtonPublish0.enabled = param1;
         },"ButtonPublish0.enabled");
         result[27] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowPut;
         },function(param1:Boolean):void
         {
            ButtonPencil.enabled = param1;
         },"ButtonPencil.enabled");
         result[28] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.allowErase;
         },function(param1:Boolean):void
         {
            ButtonEraser.enabled = param1;
         },"ButtonEraser.enabled");
         result[29] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = Number(inspectText.alpha) == 1 ? map.toolTipText : "";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            inspectText.htmlText = param1;
         },"inspectText.htmlText");
         result[30] = binding;
         binding = new Binding(this,function():Boolean
         {
            return map.toolTipVisible;
         },function(param1:Boolean):void
         {
            inspectText.visible = param1;
         },"inspectText.visible");
         result[31] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = layerHelpText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            inspectText.toolTip = param1;
         },"inspectText.toolTip");
         result[32] = binding;
         binding = new Binding(this,function():*
         {
            return fader;
         },function(param1:*):void
         {
            inspectText.setStyle("showEffect",param1);
         },"inspectText.showEffect");
         result[33] = binding;
         binding = new Binding(this,function():*
         {
            return fader;
         },function(param1:*):void
         {
            inspectText.setStyle("hideEffect",param1);
         },"inspectText.hideEffect");
         result[34] = binding;
         binding = new Binding(this,function():*
         {
            return fader;
         },function(param1:*):void
         {
            _MapMakerControl_Panel3.setStyle("showEffect",param1);
         },"_MapMakerControl_Panel3.showEffect");
         result[35] = binding;
         binding = new Binding(this,function():*
         {
            return fader;
         },function(param1:*):void
         {
            _MapMakerControl_Panel3.setStyle("hideEffect",param1);
         },"_MapMakerControl_Panel3.hideEffect");
         result[36] = binding;
         binding = new Binding(this,function():Boolean
         {
            return publishMode;
         },function(param1:Boolean):void
         {
            _MapMakerControl_Panel3.visible = param1;
         },"_MapMakerControl_Panel3.visible");
         result[37] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !gameStats;
         },function(param1:Boolean):void
         {
            _MapMakerControl_Text3.visible = param1;
         },"_MapMakerControl_Text3.visible");
         result[38] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !!gameStats;
         },function(param1:Boolean):void
         {
            _MapMakerControl_VBox1.visible = param1;
         },"_MapMakerControl_VBox1.visible");
         result[39] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = GameStats.GAMESTATUS_READY;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MapMakerControl_RadioButton1.label = param1;
         },"_MapMakerControl_RadioButton1.label");
         result[40] = binding;
         binding = new Binding(this,function():Boolean
         {
            return gameStats.gamestatus == GameStats.GAMESTATUS_READY_VALUE;
         },function(param1:Boolean):void
         {
            _MapMakerControl_RadioButton1.selected = param1;
         },"_MapMakerControl_RadioButton1.selected");
         result[41] = binding;
         binding = new Binding(this,function():Object
         {
            return GameStats.GAMESTATUS_READY_VALUE;
         },function(param1:Object):void
         {
            _MapMakerControl_RadioButton1.value = param1;
         },"_MapMakerControl_RadioButton1.value");
         result[42] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = GameStats.GAMESTATUS_NOTREADY;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MapMakerControl_RadioButton2.label = param1;
         },"_MapMakerControl_RadioButton2.label");
         result[43] = binding;
         binding = new Binding(this,function():Boolean
         {
            return gameStats.gamestatus == GameStats.GAMESTATUS_NOTREADY_VALUE;
         },function(param1:Boolean):void
         {
            _MapMakerControl_RadioButton2.selected = param1;
         },"_MapMakerControl_RadioButton2.selected");
         result[44] = binding;
         binding = new Binding(this,function():Object
         {
            return GameStats.GAMESTATUS_NOTREADY_VALUE;
         },function(param1:Object):void
         {
            _MapMakerControl_RadioButton2.value = param1;
         },"_MapMakerControl_RadioButton2.value");
         result[45] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = gameStats.description;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            publishDescription.text = param1;
         },"publishDescription.text");
         result[46] = binding;
         return result;
      }
      
      private function _MapMakerControl_AddChild11_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ComboBox1_i);
         return _loc1_;
      }
      
      private function _MapMakerControl_ToolButton9_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonSpare = _loc1_;
         _loc1_.labelPlacement = "right";
         _loc1_.x = 120;
         _loc1_.y = 8;
         _loc1_.height = 18;
         _loc1_.label = "Jump";
         _loc1_.toolTip = "Use this to allow your player to \'jump\' (portal, teleport etc..) between maps. To remove a jump point, use the eraser on the EVENT layer of the map";
         _loc1_.addEventListener("click",__ButtonSpare_click);
         _loc1_.id = "ButtonSpare";
         BindingManager.executeBindings(this,"ButtonSpare",ButtonSpare);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function publishingModeToggle(param1:Boolean) : void
      {
         if(param1)
         {
            if(map.getMapName() == null)
            {
               Alert.show("Please save this map. Once this map has been saved and named, it can be published as a game","Map not yet saved");
            }
            else
            {
               mgbSession.gameStats.getLatestStats(mgbSession.userName,mgbSession.activeProject,map.getMapName());
               publishMode = true;
            }
         }
         else
         {
            gameStats = null;
            publishMode = false;
         }
      }
      
      private function _MapMakerControl_State4_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_4";
         _loc1_.basedOn = "Level_3";
         _loc1_.overrides = [_MapMakerControl_AddChild9_c()];
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonPlay() : ToolButton
      {
         return this._1943070298ButtonPlay;
      }
      
      private function _MapMakerControl_AddChild9_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton7_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get chosenActor() : MgbActor
      {
         return this._1684508067chosenActor;
      }
      
      public function __ButtonLoad_click(param1:MouseEvent) : void
      {
         map.loadMapUsingDialog();
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
      
      [Bindable(event="propertyChange")]
      public function get ButtonGrid() : ToolButtonWide
      {
         return this._1943332424ButtonGrid;
      }
      
      private function _MapMakerControl_AddChild1_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton1_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get gameStats() : GameStatResult
      {
         return this._990064589gameStats;
      }
      
      private function _MapMakerControl_State3_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "Level_3";
         _loc1_.basedOn = "Level_2";
         _loc1_.overrides = [_MapMakerControl_AddChild7_c(),_MapMakerControl_AddChild8_c()];
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPreviewPanel() : Panel
      {
         return this._1617693105actorPreviewPanel;
      }
      
      [Bindable(event="propertyChange")]
      public function get glowImage() : Glow
      {
         return this._967029710glowImage;
      }
      
      private function _MapMakerControl_ComboBox2_i() : ComboBox
      {
         var _loc1_:ComboBox = new ComboBox();
         backgroundView = _loc1_;
         _loc1_.x = 8;
         _loc1_.y = 396;
         _loc1_.selectedIndex = 2;
         _loc1_.enabled = true;
         _loc1_.height = 18;
         _loc1_.width = 108;
         _loc1_.dataProvider = ["Hide background","Fade background","Show background"];
         _loc1_.setStyle("paddingLeft",0);
         _loc1_.setStyle("paddingRight",0);
         _loc1_.setStyle("fontFamily","Arial");
         _loc1_.setStyle("fontSize",9);
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.addEventListener("change",__backgroundView_change);
         _loc1_.id = "backgroundView";
         BindingManager.executeBindings(this,"backgroundView",backgroundView);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapMakerControl_ToolButton11_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonPrint = _loc1_;
         _loc1_.x = 120;
         _loc1_.y = 104;
         _loc1_.label = "Print";
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_PrintIcon_png_2047213834);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_PrintIcon_png_2047213834);
         _loc1_.addEventListener("click",__ButtonPrint_click);
         _loc1_.id = "ButtonPrint";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
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
      
      private function setChosenActor(param1:String = null) : void
      {
         if(param1 != null)
         {
            recentActorNamePerLayer[selectedEditLayer] = param1;
         }
         chosenActor = MgbActor(MgbCaches.getInstance().actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,param1));
         map.selectActor(param1);
         actorPreview.show(chosenActor);
         actorPreviewPanel.toolTip = !!chosenActor ? String(chosenActor.getDescription(true)) : "Click here to choose an actor to place on the map";
      }
      
      public function set ButtonMusic(param1:ToolButton) : void
      {
         var _loc2_:Object = this._108122637ButtonMusic;
         if(_loc2_ !== param1)
         {
            this._108122637ButtonMusic = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonMusic",_loc2_,param1));
         }
      }
      
      private function _MapMakerControl_AddChild10_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_Label1_i);
         return _loc1_;
      }
      
      private function _MapMakerControl_ToolButton8_i() : ToolButton
      {
         var _loc1_:ToolButton = new ToolButton();
         ButtonInspect = _loc1_;
         _loc1_.x = 120;
         _loc1_.y = 398;
         _loc1_.label = "Inspect";
         _loc1_.setStyle("fontSize",9);
         _loc1_.setStyle("overIcon",_embed_mxml_Resources_InspectLayersIcon_png_257083832);
         _loc1_.setStyle("upIcon",_embed_mxml_Resources_InspectLayersIcon_png_257083832);
         _loc1_.addEventListener("click",__ButtonInspect_click);
         _loc1_.id = "ButtonInspect";
         BindingManager.executeBindings(this,"ButtonInspect",ButtonInspect);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonMusic() : ToolButton
      {
         return this._108122637ButtonMusic;
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
      
      private function _MapMakerControl_AddChild18_i() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _MapMakerControl_AddChild18 = _loc1_;
         _loc1_.position = "before";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton12_i);
         BindingManager.executeBindings(this,"_MapMakerControl_AddChild18",_MapMakerControl_AddChild18);
         return _loc1_;
      }
      
      private function _MapMakerControl_AddChild8_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "firstChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_MapMakerControl_ToolButton6_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get layerComboBox() : ComboBox
      {
         return this._813504974layerComboBox;
      }
      
      private function doubleClickActor(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.currentTarget.selectedItem;
         if(_loc2_)
         {
            mgbSession.navGotoActorMaker(_loc2_.name);
         }
      }
   }
}
