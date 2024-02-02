package
{
   import com.mgb.controls.*;
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
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.HDividedBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.*;
   import mx.core.*;
   import mx.effects.Resize;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.*;
   import mx.states.AddChild;
   import mx.states.State;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class GamePlayerControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _GamePlayerControl_AddChild1:AddChild;
      
      public var _GamePlayerControl_AddChild2:AddChild;
      
      private var _embed_mxml_Resources_PlayIcon_png_687450682:Class;
      
      private var _embed_mxml_Resources_LoadIcon_png_989977250:Class;
      
      private var _1242297782buttonInventory:Button;
      
      private var _1810502811resizeEffect:Resize;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _119543762readyToPlay:Boolean = false;
      
      private var _embed_mxml_Resources_StopIcon_png_857327834:Class;
      
      private var _761660841disableColorpicker:Boolean = false;
      
      private var _1282976579helpPanel:Canvas;
      
      private var _1092627198gameplayerBackgroundColor:SelectBackgroundColor;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _296608712showMGBHeader:Boolean = true;
      
      private var _206697901buttonBackgroundMusicInfo:Image;
      
      private var _embed_mxml_Resources_logoMgbTiny_png_899485412:Class;
      
      private var _702755594buttonKbHelp:Image;
      
      private var _995335123mgbLogo:Image;
      
      private var _348750160showGameStats:Boolean = true;
      
      private var _1773814300buttonPause:Image;
      
      private var _1770496883buttonStats:Image;
      
      private var _103149417login:LightweightAuthUI;
      
      private var _956862517gameStatsDisplay:GameStatsDisplay;
      
      public var _GamePlayerControl_TextArea1:TextArea;
      
      mx_internal var _watchers:Array;
      
      private var _818615083gamePlayAreaCanvas:Canvas;
      
      private var _627231364gameStatus:TextArea;
      
      public var _GamePlayerControl_Button1:Button;
      
      public var _GamePlayerControl_Button2:Button;
      
      private var _embed_mxml_Resources_InfoIcon_png_199076130:Class;
      
      private var _521038350PanelEdit:Panel;
      
      private var _3165170game:GameEngineTwo;
      
      private var _892596885showLoadButton:Boolean = true;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _embed_mxml_Resources_PauseIcon_png_1624532040:Class;
      
      private var _358529620buttonStop:Image;
      
      private var _embed_mxml_Resources_MusicPlayingIcon_png_107987032:Class;
      
      private var _embed_mxml_Resources_CloseIcon_PNG_368039548:Class;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml_Resources_HelpIcon_png_920508456:Class;
      
      private var _900066851showAuthenticatedName:Boolean = false;
      
      public function GamePlayerControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HDividedBox,
                  "stylesFactory":function():void
                  {
                     this.top = "0";
                     this.bottom = "8";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":GameStatsDisplay,
                           "id":"gameStatsDisplay",
                           "stylesFactory":function():void
                           {
                              this.paddingLeft = 4;
                              this.paddingTop = 8;
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"gamePlayAreaCanvas",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "minWidth":450,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Panel,
                                    "id":"PanelEdit",
                                    "stylesFactory":function():void
                                    {
                                       this.headerHeight = 52;
                                       this.right = "0";
                                       this.left = "0";
                                       this.cornerRadius = 0;
                                       this.borderThicknessLeft = 0;
                                       this.borderThicknessRight = 0;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "layout":"absolute",
                                          "percentHeight":100,
                                          "y":0,
                                          "horizontalScrollPolicy":"off",
                                          "verticalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":GameEngineTwo,
                                             "id":"game",
                                             "events":{"rollOver":"__game_rollOver"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "visible":false
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function():void
                                    {
                                       this.right = "10";
                                       this.left = "10";
                                       this.verticalGap = 2;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "y":6,
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":HBox,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":Image,
                                                      "id":"mgbLogo",
                                                      "events":{"click":"__mgbLogo_click"},
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "source":_embed_mxml_Resources_logoMgbTiny_png_899485412,
                                                            "toolTip":"Visit MyGameBuilder.com now and make your own games for free"
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Image,
                                                      "id":"buttonStats",
                                                      "events":{"click":"__buttonStats_click"},
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "toolTip":"Show Game Stats",
                                                            "source":_embed_mxml_Resources_InfoIcon_png_199076130,
                                                            "height":20
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Button,
                                                      "id":"_GamePlayerControl_Button1",
                                                      "events":{"click":"___GamePlayerControl_Button1_click"},
                                                      "stylesFactory":function():void
                                                      {
                                                         this.overIcon = _embed_mxml_Resources_LoadIcon_png_989977250;
                                                         this.upIcon = _embed_mxml_Resources_LoadIcon_png_989977250;
                                                         this.paddingLeft = 4;
                                                         this.paddingRight = 4;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Load Game",
                                                            "height":20,
                                                            "labelPlacement":"right",
                                                            "styleName":"denseTable"
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Button,
                                                      "id":"_GamePlayerControl_Button2",
                                                      "events":{"click":"___GamePlayerControl_Button2_click"},
                                                      "stylesFactory":function():void
                                                      {
                                                         this.overIcon = _embed_mxml_Resources_PlayIcon_png_687450682;
                                                         this.upIcon = _embed_mxml_Resources_PlayIcon_png_687450682;
                                                         this.paddingLeft = 2;
                                                         this.paddingRight = 4;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Play Game",
                                                            "height":20,
                                                            "labelPlacement":"right",
                                                            "styleName":"denseTable"
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Image,
                                                      "id":"buttonStop",
                                                      "events":{"click":"__buttonStop_click"},
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "toolTip":"Stop Game",
                                                            "height":20,
                                                            "source":_embed_mxml_Resources_StopIcon_png_857327834
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Image,
                                                      "id":"buttonPause",
                                                      "events":{"click":"__buttonPause_click"},
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "toolTip":"Pause Game",
                                                            "height":20,
                                                            "source":_embed_mxml_Resources_PauseIcon_png_1624532040
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Image,
                                                      "id":"buttonKbHelp",
                                                      "events":{"click":"__buttonKbHelp_click"},
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "height":20,
                                                            "source":_embed_mxml_Resources_HelpIcon_png_920508456,
                                                            "toolTip":"Help"
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Button,
                                                      "id":"buttonInventory",
                                                      "events":{"click":"__buttonInventory_click"},
                                                      "stylesFactory":function():void
                                                      {
                                                         this.paddingLeft = 0;
                                                         this.paddingRight = 0;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Inventory",
                                                            "height":20,
                                                            "labelPlacement":"right",
                                                            "width":64,
                                                            "styleName":"denseTable",
                                                            "toolTip":"Some games allow items to be picked up or equipped/wielded. Use this button (or the \'Delete\' key) to show/hide the inventory of carried items"
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"percentWidth":100};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":LightweightAuthUI,
                                                      "id":"login"
                                                   })]
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HBox,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":TextArea,
                                                      "id":"gameStatus",
                                                      "stylesFactory":function():void
                                                      {
                                                         this.backgroundAlpha = 0;
                                                         this.fontFamily = "Courier New";
                                                         this.fontSize = 13;
                                                         this.fontWeight = "bold";
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "height":22,
                                                            "percentWidth":100,
                                                            "wordWrap":false,
                                                            "styleName":"denseTable",
                                                            "alpha":0,
                                                            "editable":false
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Image,
                                                      "id":"buttonBackgroundMusicInfo",
                                                      "events":{"click":"__buttonBackgroundMusicInfo_click"},
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "height":20,
                                                            "source":_embed_mxml_Resources_MusicPlayingIcon_png_107987032
                                                         };
                                                      }
                                                   })]
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":SelectBackgroundColor,
                  "id":"gameplayerBackgroundColor",
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
         _embed_mxml_Resources_CloseIcon_PNG_368039548 = GamePlayerControl__embed_mxml_Resources_CloseIcon_PNG_368039548;
         _embed_mxml_Resources_HelpIcon_png_920508456 = GamePlayerControl__embed_mxml_Resources_HelpIcon_png_920508456;
         _embed_mxml_Resources_InfoIcon_png_199076130 = GamePlayerControl__embed_mxml_Resources_InfoIcon_png_199076130;
         _embed_mxml_Resources_LoadIcon_png_989977250 = GamePlayerControl__embed_mxml_Resources_LoadIcon_png_989977250;
         _embed_mxml_Resources_MusicPlayingIcon_png_107987032 = GamePlayerControl__embed_mxml_Resources_MusicPlayingIcon_png_107987032;
         _embed_mxml_Resources_PauseIcon_png_1624532040 = GamePlayerControl__embed_mxml_Resources_PauseIcon_png_1624532040;
         _embed_mxml_Resources_PlayIcon_png_687450682 = GamePlayerControl__embed_mxml_Resources_PlayIcon_png_687450682;
         _embed_mxml_Resources_StopIcon_png_857327834 = GamePlayerControl__embed_mxml_Resources_StopIcon_png_857327834;
         _embed_mxml_Resources_logoMgbTiny_png_899485412 = GamePlayerControl__embed_mxml_Resources_logoMgbTiny_png_899485412;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.states = [_GamePlayerControl_State1_c()];
         _GamePlayerControl_Resize1_i();
         this.addEventListener("creationComplete",___GamePlayerControl_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         GamePlayerControl._watcherSetupUtil = param1;
      }
      
      private function gameLoadingHandler(param1:GameEngineEvent) : void
      {
         readyToPlay = false;
         gameStatsDisplay.selectGame(param1.userName,param1.project,param1.map);
         stealFocusForGame();
      }
      
      public function set gameStatus(param1:TextArea) : void
      {
         var _loc2_:Object = this._627231364gameStatus;
         if(_loc2_ !== param1)
         {
            this._627231364gameStatus = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameStatus",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonKbHelp() : Image
      {
         return this._702755594buttonKbHelp;
      }
      
      [Bindable(event="propertyChange")]
      public function get PanelEdit() : Panel
      {
         return this._521038350PanelEdit;
      }
      
      [Bindable(event="propertyChange")]
      public function get gameplayerBackgroundColor() : SelectBackgroundColor
      {
         return this._1092627198gameplayerBackgroundColor;
      }
      
      private function _GamePlayerControl_Resize1_i() : Resize
      {
         var _loc1_:Resize = new Resize();
         resizeEffect = _loc1_;
         _loc1_.duration = 400;
         return _loc1_;
      }
      
      public function set buttonKbHelp(param1:Image) : void
      {
         var _loc2_:Object = this._702755594buttonKbHelp;
         if(_loc2_ !== param1)
         {
            this._702755594buttonKbHelp = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonKbHelp",_loc2_,param1));
         }
      }
      
      public function ___GamePlayerControl_Button2_click(param1:MouseEvent) : void
      {
         doPlayGame();
      }
      
      private function _GamePlayerControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():UIComponent
         {
            return gamePlayAreaCanvas;
         },function(param1:UIComponent):void
         {
            _GamePlayerControl_AddChild1.relativeTo = param1;
         },"_GamePlayerControl_AddChild1.relativeTo");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.kbHelpText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamePlayerControl_TextArea1.text = param1;
         },"_GamePlayerControl_TextArea1.text");
         result[1] = binding;
         binding = new Binding(this,function():UIComponent
         {
            return helpPanel;
         },function(param1:UIComponent):void
         {
            _GamePlayerControl_AddChild2.relativeTo = param1;
         },"_GamePlayerControl_AddChild2.relativeTo");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return gameStatsDisplay.width > 0;
         },function(param1:Boolean):void
         {
            gameStatsDisplay.visible = param1;
         },"gameStatsDisplay.visible");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return gameStatsDisplay.width > 0;
         },function(param1:Boolean):void
         {
            gameStatsDisplay.includeInLayout = param1;
         },"gameStatsDisplay.includeInLayout");
         result[4] = binding;
         binding = new Binding(this,function():*
         {
            return resizeEffect;
         },function(param1:*):void
         {
            gameStatsDisplay.setStyle("resizeEffect",param1);
         },"gameStatsDisplay.resizeEffect");
         result[5] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showMGBHeader;
         },function(param1:Boolean):void
         {
            mgbLogo.visible = param1;
         },"mgbLogo.visible");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showMGBHeader;
         },function(param1:Boolean):void
         {
            mgbLogo.includeInLayout = param1;
         },"mgbLogo.includeInLayout");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return readyToPlay;
         },function(param1:Boolean):void
         {
            buttonStats.visible = param1;
         },"buttonStats.visible");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showLoadButton && !(game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver);
         },function(param1:Boolean):void
         {
            _GamePlayerControl_Button1.visible = param1;
         },"_GamePlayerControl_Button1.visible");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showLoadButton && !(game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver);
         },function(param1:Boolean):void
         {
            _GamePlayerControl_Button1.includeInLayout = param1;
         },"_GamePlayerControl_Button1.includeInLayout");
         result[10] = binding;
         binding = new Binding(this,function():Boolean
         {
            return readyToPlay == true && !(game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver);
         },function(param1:Boolean):void
         {
            _GamePlayerControl_Button2.includeInLayout = param1;
         },"_GamePlayerControl_Button2.includeInLayout");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return readyToPlay == true && !(game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver);
         },function(param1:Boolean):void
         {
            _GamePlayerControl_Button2.visible = param1;
         },"_GamePlayerControl_Button2.visible");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         },function(param1:Boolean):void
         {
            buttonStop.includeInLayout = param1;
         },"buttonStop.includeInLayout");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         },function(param1:Boolean):void
         {
            buttonStop.visible = param1;
         },"buttonStop.visible");
         result[14] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         },function(param1:Boolean):void
         {
            buttonPause.includeInLayout = param1;
         },"buttonPause.includeInLayout");
         result[15] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         },function(param1:Boolean):void
         {
            buttonPause.visible = param1;
         },"buttonPause.visible");
         result[16] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         },function(param1:Boolean):void
         {
            buttonKbHelp.includeInLayout = param1;
         },"buttonKbHelp.includeInLayout");
         result[17] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         },function(param1:Boolean):void
         {
            buttonKbHelp.visible = param1;
         },"buttonKbHelp.visible");
         result[18] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         },function(param1:Boolean):void
         {
            buttonInventory.includeInLayout = param1;
         },"buttonInventory.includeInLayout");
         result[19] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         },function(param1:Boolean):void
         {
            buttonInventory.visible = param1;
         },"buttonInventory.visible");
         result[20] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = game.gameStatusString;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            gameStatus.text = param1;
         },"gameStatus.text");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbMusicUrls.generateMusicPlaybackSummary(game.backgroundMusicCurrentSource,game.backgroundMusicStatus) + " - Click for attribution";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            buttonBackgroundMusicInfo.toolTip = param1;
         },"buttonBackgroundMusicInfo.toolTip");
         result[22] = binding;
         binding = new Binding(this,function():Boolean
         {
            return game.backgroundMusicStatus != null;
         },function(param1:Boolean):void
         {
            buttonBackgroundMusicInfo.visible = param1;
         },"buttonBackgroundMusicInfo.visible");
         result[23] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !disableColorpicker;
         },function(param1:Boolean):void
         {
            gameplayerBackgroundColor.active = param1;
         },"gameplayerBackgroundColor.active");
         result[24] = binding;
         return result;
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
      
      public function set gameplayerBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._1092627198gameplayerBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._1092627198gameplayerBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameplayerBackgroundColor",_loc2_,param1));
         }
      }
      
      public function set buttonStats(param1:Image) : void
      {
         var _loc2_:Object = this._1770496883buttonStats;
         if(_loc2_ !== param1)
         {
            this._1770496883buttonStats = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonStats",_loc2_,param1));
         }
      }
      
      public function mgbLoginLogout(param1:Event) : void
      {
         gameStatsDisplay.reset();
      }
      
      private function _GamePlayerControl_AddChild2_i() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _GamePlayerControl_AddChild2 = _loc1_;
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_GamePlayerControl_Image1_c);
         BindingManager.executeBindings(this,"_GamePlayerControl_AddChild2",_GamePlayerControl_AddChild2);
         return _loc1_;
      }
      
      public function set showLoadButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._892596885showLoadButton;
         if(_loc2_ !== param1)
         {
            this._892596885showLoadButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showLoadButton",_loc2_,param1));
         }
      }
      
      public function ___GamePlayerControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      [Bindable(event="propertyChange")]
      public function get gameStatsDisplay() : GameStatsDisplay
      {
         return this._956862517gameStatsDisplay;
      }
      
      [Bindable(event="propertyChange")]
      public function get gamePlayAreaCanvas() : Canvas
      {
         return this._818615083gamePlayAreaCanvas;
      }
      
      private function doInit() : void
      {
         if(game)
         {
            game.triggerLobbyMode();
            game.addEventListener(GameEngineEvent.COMPLETED,gameCompletedHandler);
            game.addEventListener(GameEngineEvent.LOADING,gameLoadingHandler);
            game.addEventListener(GameEngineEvent.LOADED,gameLoadedHandler);
            if(showAuthenticatedName)
            {
               login.autoAuthenticate();
            }
         }
         if(Boolean(gameStatsDisplay) && showGameStats == false)
         {
            gameStatsDisplay.width = 0;
         }
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_LOGIN_LOGOUT,mgbLoginLogout);
      }
      
      public function __mgbLogo_click(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest("http://mygamebuilder.com"),"mgbMainWindow");
      }
      
      [Bindable(event="propertyChange")]
      public function get showMGBHeader() : Boolean
      {
         return this._296608712showMGBHeader;
      }
      
      [Bindable(event="propertyChange")]
      public function get helpPanel() : Canvas
      {
         return this._1282976579helpPanel;
      }
      
      private function toggleGamestatsWindow() : void
      {
         gameStatsDisplay.width = gameStatsDisplay.width < 32 ? 240 : 0;
         stealFocusForGame();
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonInventory() : Button
      {
         return this._1242297782buttonInventory;
      }
      
      private function stealFocusForGame() : void
      {
         focusManager.setFocus(buttonInventory);
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonBackgroundMusicInfo() : Image
      {
         return this._206697901buttonBackgroundMusicInfo;
      }
      
      [Bindable(event="propertyChange")]
      public function get showGameStats() : Boolean
      {
         return this._348750160showGameStats;
      }
      
      public function set disableColorpicker(param1:Boolean) : void
      {
         var _loc2_:Object = this._761660841disableColorpicker;
         if(_loc2_ !== param1)
         {
            this._761660841disableColorpicker = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"disableColorpicker",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonStop() : Image
      {
         return this._358529620buttonStop;
      }
      
      public function set gamePlayAreaCanvas(param1:Canvas) : void
      {
         var _loc2_:Object = this._818615083gamePlayAreaCanvas;
         if(_loc2_ !== param1)
         {
            this._818615083gamePlayAreaCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gamePlayAreaCanvas",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get login() : LightweightAuthUI
      {
         return this._103149417login;
      }
      
      public function set gameStatsDisplay(param1:GameStatsDisplay) : void
      {
         var _loc2_:Object = this._956862517gameStatsDisplay;
         if(_loc2_ !== param1)
         {
            this._956862517gameStatsDisplay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameStatsDisplay",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function __buttonInventory_click(param1:MouseEvent) : void
      {
         game.toggleInventory();
      }
      
      [Bindable(event="propertyChange")]
      public function get resizeEffect() : Resize
      {
         return this._1810502811resizeEffect;
      }
      
      private function _GamePlayerControl_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 8;
         _loc1_.y = 4;
         _loc1_.text = "MyGameBuilder.com: Game Keyboard Controls";
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontWeight","bold");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __buttonStats_click(param1:MouseEvent) : void
      {
         toggleGamestatsWindow();
      }
      
      public function ___GamePlayerControl_Image1_click(param1:MouseEvent) : void
      {
         currentState = "";
      }
      
      private function _GamePlayerControl_AddChild1_i() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _GamePlayerControl_AddChild1 = _loc1_;
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_GamePlayerControl_Canvas2_i);
         BindingManager.executeBindings(this,"_GamePlayerControl_AddChild1",_GamePlayerControl_AddChild1);
         return _loc1_;
      }
      
      public function set showMGBHeader(param1:Boolean) : void
      {
         var _loc2_:Object = this._296608712showMGBHeader;
         if(_loc2_ !== param1)
         {
            this._296608712showMGBHeader = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showMGBHeader",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gameStatus() : TextArea
      {
         return this._627231364gameStatus;
      }
      
      public function set helpPanel(param1:Canvas) : void
      {
         var _loc2_:Object = this._1282976579helpPanel;
         if(_loc2_ !== param1)
         {
            this._1282976579helpPanel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpPanel",_loc2_,param1));
         }
      }
      
      public function __buttonPause_click(param1:MouseEvent) : void
      {
         game.togglePause();
      }
      
      private function tagCheck(param1:String) : void
      {
         ActiveTutorial.getInstance().tutorialTagCheck("gameplayer_" + param1);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:GamePlayerControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _GamePlayerControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_GamePlayerControlWatcherSetupUtil");
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
      
      private function gameCompletedHandler(param1:GameEngineEvent) : void
      {
         if(param1.completedVictory)
         {
            mgbSession.gameStats.signalGameWon(param1.userName,param1.project,param1.map);
            tagCheck("game_won");
         }
         mgbSession.gameStats.signalHighScore(param1.userName,param1.project,param1.map,param1.completedVictory,param1.completedScore,param1.completedSeconds);
         tagCheck("game_over");
      }
      
      [Bindable(event="propertyChange")]
      public function get showLoadButton() : Boolean
      {
         return this._892596885showLoadButton;
      }
      
      public function loadGameByName(param1:String) : void
      {
         game.visible = true;
         game.loadMapByName(mgbSession.userName,mgbSession.activeProject,param1);
         gameStatsDisplay.selectGame(mgbSession.userName,mgbSession.activeProject,param1);
      }
      
      public function set showGameStats(param1:Boolean) : void
      {
         var _loc2_:Object = this._348750160showGameStats;
         if(_loc2_ !== param1)
         {
            this._348750160showGameStats = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showGameStats",_loc2_,param1));
         }
      }
      
      private function set readyToPlay(param1:Boolean) : void
      {
         var _loc2_:Object = this._119543762readyToPlay;
         if(_loc2_ !== param1)
         {
            this._119543762readyToPlay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"readyToPlay",_loc2_,param1));
         }
      }
      
      private function _GamePlayerControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = gamePlayAreaCanvas;
         _loc1_ = MgbSystem.kbHelpText;
         _loc1_ = helpPanel;
         _loc1_ = gameStatsDisplay.width > 0;
         _loc1_ = gameStatsDisplay.width > 0;
         _loc1_ = resizeEffect;
         _loc1_ = showMGBHeader;
         _loc1_ = showMGBHeader;
         _loc1_ = readyToPlay;
         _loc1_ = showLoadButton && !(game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver);
         _loc1_ = showLoadButton && !(game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver);
         _loc1_ = readyToPlay == true && !(game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver);
         _loc1_ = readyToPlay == true && !(game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver);
         _loc1_ = game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         _loc1_ = game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         _loc1_ = game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         _loc1_ = game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         _loc1_ = game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         _loc1_ = game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         _loc1_ = game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         _loc1_ = game.gameEngineMode == GameEngine.GE_PLAY && false == game.G_gameOver;
         _loc1_ = game.gameStatusString;
         _loc1_ = MgbMusicUrls.generateMusicPlaybackSummary(game.backgroundMusicCurrentSource,game.backgroundMusicStatus) + " - Click for attribution";
         _loc1_ = game.backgroundMusicStatus != null;
         _loc1_ = !disableColorpicker;
      }
      
      public function set buttonBackgroundMusicInfo(param1:Image) : void
      {
         var _loc2_:Object = this._206697901buttonBackgroundMusicInfo;
         if(_loc2_ !== param1)
         {
            this._206697901buttonBackgroundMusicInfo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonBackgroundMusicInfo",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get disableColorpicker() : Boolean
      {
         return this._761660841disableColorpicker;
      }
      
      private function _GamePlayerControl_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _GamePlayerControl_TextArea1 = _loc1_;
         _loc1_.styleName = "denseTable";
         _loc1_.editable = false;
         _loc1_.wordWrap = true;
         _loc1_.enabled = true;
         _loc1_.setStyle("left","4");
         _loc1_.setStyle("right","4");
         _loc1_.setStyle("top","30");
         _loc1_.setStyle("bottom","4");
         _loc1_.id = "_GamePlayerControl_TextArea1";
         BindingManager.executeBindings(this,"_GamePlayerControl_TextArea1",_GamePlayerControl_TextArea1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _GamePlayerControl_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = _embed_mxml_Resources_CloseIcon_PNG_368039548;
         _loc1_.setStyle("right","4");
         _loc1_.setStyle("top","4");
         _loc1_.addEventListener("click",___GamePlayerControl_Image1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonStats() : Image
      {
         return this._1770496883buttonStats;
      }
      
      private function _GamePlayerControl_Canvas2_i() : Canvas
      {
         var _loc1_:Canvas = new Canvas();
         helpPanel = _loc1_;
         _loc1_.width = 340;
         _loc1_.height = 280;
         _loc1_.setStyle("backgroundColor",32768);
         _loc1_.setStyle("cornerRadius",10);
         _loc1_.setStyle("left","32");
         _loc1_.setStyle("top","80");
         _loc1_.id = "helpPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_GamePlayerControl_TextArea1_i());
         _loc1_.addChild(_GamePlayerControl_Label1_c());
         return _loc1_;
      }
      
      public function set mgbLogo(param1:Image) : void
      {
         var _loc2_:Object = this._995335123mgbLogo;
         if(_loc2_ !== param1)
         {
            this._995335123mgbLogo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbLogo",_loc2_,param1));
         }
      }
      
      public function set buttonInventory(param1:Button) : void
      {
         var _loc2_:Object = this._1242297782buttonInventory;
         if(_loc2_ !== param1)
         {
            this._1242297782buttonInventory = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonInventory",_loc2_,param1));
         }
      }
      
      public function set buttonStop(param1:Image) : void
      {
         var _loc2_:Object = this._358529620buttonStop;
         if(_loc2_ !== param1)
         {
            this._358529620buttonStop = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonStop",_loc2_,param1));
         }
      }
      
      private function _GamePlayerControl_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "showKbHelp";
         _loc1_.overrides = [_GamePlayerControl_AddChild1_i(),_GamePlayerControl_AddChild2_i()];
         return _loc1_;
      }
      
      public function __buttonBackgroundMusicInfo_click(param1:MouseEvent) : void
      {
         Alert.show(MgbMusicUrls.soundSourceAttributionMessage,MgbMusicUrls.generateMusicPlaybackSummary(game.backgroundMusicCurrentSource,game.backgroundMusicStatus));
      }
      
      public function __buttonStop_click(param1:MouseEvent) : void
      {
         game.stopGameIfPlaying();
         game.triggerLobbyMode();
         this.currentState = "";
      }
      
      public function set showAuthenticatedName(param1:Boolean) : void
      {
         var _loc2_:Object = this._900066851showAuthenticatedName;
         if(_loc2_ !== param1)
         {
            this._900066851showAuthenticatedName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showAuthenticatedName",_loc2_,param1));
         }
      }
      
      private function gameLoadedHandler(param1:GameEngineEvent) : void
      {
         readyToPlay = true;
         stealFocusForGame();
         tagCheck("game_loaded");
      }
      
      public function __game_rollOver(param1:MouseEvent) : void
      {
         stealFocusForGame();
      }
      
      public function set buttonPause(param1:Image) : void
      {
         var _loc2_:Object = this._1773814300buttonPause;
         if(_loc2_ !== param1)
         {
            this._1773814300buttonPause = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonPause",_loc2_,param1));
         }
      }
      
      public function set resizeEffect(param1:Resize) : void
      {
         var _loc2_:Object = this._1810502811resizeEffect;
         if(_loc2_ !== param1)
         {
            this._1810502811resizeEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"resizeEffect",_loc2_,param1));
         }
      }
      
      public function set login(param1:LightweightAuthUI) : void
      {
         var _loc2_:Object = this._103149417login;
         if(_loc2_ !== param1)
         {
            this._103149417login = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"login",_loc2_,param1));
         }
      }
      
      public function ___GamePlayerControl_Button1_click(param1:MouseEvent) : void
      {
         loadGame();
      }
      
      [Bindable(event="propertyChange")]
      private function get readyToPlay() : Boolean
      {
         return this._119543762readyToPlay;
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
      public function get showAuthenticatedName() : Boolean
      {
         return this._900066851showAuthenticatedName;
      }
      
      [Bindable(event="propertyChange")]
      public function get mgbLogo() : Image
      {
         return this._995335123mgbLogo;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonPause() : Image
      {
         return this._1773814300buttonPause;
      }
      
      public function set game(param1:GameEngineTwo) : void
      {
         var _loc2_:Object = this._3165170game;
         if(_loc2_ !== param1)
         {
            this._3165170game = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"game",_loc2_,param1));
         }
      }
      
      private function doPlayGame() : void
      {
         game.triggerPlayMode();
         if(game.playGame())
         {
            mgbSession.gameStats.signalGameStarted(mgbSession.userName,mgbSession.activeProject,game.initialMapName);
         }
         tagCheck("game_started");
      }
      
      [Bindable(event="propertyChange")]
      public function get game() : GameEngineTwo
      {
         return this._3165170game;
      }
      
      public function __buttonKbHelp_click(param1:MouseEvent) : void
      {
         currentState = currentState == "showKbHelp" ? "" : "showKbHelp";
         stealFocusForGame();
      }
      
      private function loadGame() : void
      {
         if(game)
         {
            game.loadMapUsingDialog();
            game.visible = true;
         }
      }
   }
}
