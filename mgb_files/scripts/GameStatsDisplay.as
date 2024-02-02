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
   import mx.collections.*;
   import mx.containers.Accordion;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.*;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class GameStatsDisplay extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _108835nav:Accordion;
      
      private var _990064589gameStats:GameStatResult = null;
      
      private var _1217010542mgbSession:MgbSession;
      
      public var _GameStatsDisplay_TextArea1:TextArea;
      
      public var _GameStatsDisplay_DataGrid1:DataGrid;
      
      public var _GameStatsDisplay_DataGrid2:DataGrid;
      
      public var _GameStatsDisplay_Text1:Text;
      
      public var _GameStatsDisplay_Text2:Text;
      
      public var _GameStatsDisplay_Text3:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _907766751scores:ArrayCollection = null;
      
      private var _266666762userName:String = "";
      
      private var _896071412speeds:ArrayCollection = null;
      
      private var _1903512005playCount:Text;
      
      private var _309310695project:String = "";
      
      private var _1604421789gameplayRating:Rater;
      
      mx_internal var _watchers:Array;
      
      private var _embed_mxml_Resources_Award_art_png_1077372292:Class;
      
      private var _67642345hideHighScoreSection:Boolean = false;
      
      public var _GameStatsDisplay_LinkButton1:LinkButton;
      
      public var _GameStatsDisplay_LinkButton2:LinkButton;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1277823992graphicsRating:Rater;
      
      public var _GameStatsDisplay_HBox1:HBox;
      
      public var _GameStatsDisplay_HBox2:HBox;
      
      private var _embed_mxml_Resources_Award_gameplay2_png_1449938174:Class;
      
      public var _GameStatsDisplay_VBox4:VBox;
      
      public var _GameStatsDisplay_VBox5:VBox;
      
      private var _1769344611gameName:String = "";
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function GameStatsDisplay()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":240,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Accordion,
                     "id":"nav",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "creationPolicy":"all",
                           "horizontalScrollPolicy":"off",
                           "resizeToContent":true,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":VBox,
                              "stylesFactory":function():void
                              {
                                 this.verticalGap = 0;
                                 this.paddingLeft = 8;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Game Info",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "horizontalScrollPolicy":"off",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"_GameStatsDisplay_Text1"
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"_GameStatsDisplay_Text2"
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"_GameStatsDisplay_Text3"
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":8};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"playCount",
                                       "stylesFactory":function():void
                                       {
                                          this.fontWeight = "bold";
                                          this.textIndent = 16;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {"percentWidth":100};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":12};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":TextArea,
                                       "id":"_GameStatsDisplay_TextArea1",
                                       "stylesFactory":function():void
                                       {
                                          this.backgroundAlpha = 0;
                                          this.borderStyle = "none";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "editable":false,
                                             "wordWrap":true,
                                             "percentWidth":100,
                                             "height":100
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":VBox,
                              "stylesFactory":function():void
                              {
                                 this.verticalGap = 0;
                                 this.paddingLeft = 8;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Game Ratings",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "horizontalScrollPolicy":"off",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"text":"Graphics Rating:"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "id":"_GameStatsDisplay_HBox1",
                                       "stylesFactory":function():void
                                       {
                                          this.verticalAlign = "top";
                                          this.paddingLeft = 2;
                                          this.paddingTop = 2;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {"childDescriptors":[new UIComponentDescriptor({
                                             "type":Image,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "source":_embed_mxml_Resources_Award_art_png_1077372292,
                                                   "toolTip":"Graphics Rating"
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Rater,
                                             "id":"graphicsRating"
                                          })]};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":10};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"text":"Gameplay Rating:"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "id":"_GameStatsDisplay_HBox2",
                                       "stylesFactory":function():void
                                       {
                                          this.verticalAlign = "top";
                                          this.paddingLeft = 2;
                                          this.paddingTop = 2;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {"childDescriptors":[new UIComponentDescriptor({
                                             "type":Image,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "source":_embed_mxml_Resources_Award_gameplay2_png_1449938174,
                                                   "toolTip":"GamePlay Rating"
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Rater,
                                             "id":"gameplayRating"
                                          })]};
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":VBox,
                              "stylesFactory":function():void
                              {
                                 this.verticalGap = 0;
                                 this.paddingLeft = 8;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Embed & Link information",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "horizontalScrollPolicy":"off",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":8};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___GameStatsDisplay_Button1_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"Get HTTP link to game (allow play & edit)",
                                             "styleName":"denseTable"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":8};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___GameStatsDisplay_Button2_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"Get HTTP link to game (mini player view)",
                                             "styleName":"denseTable"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":8};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "events":{"click":"___GameStatsDisplay_Button3_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "label":"Get Embed HTML code for game",
                                             "styleName":"denseTable"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":8};
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":VBox,
                              "id":"_GameStatsDisplay_VBox4",
                              "stylesFactory":function():void
                              {
                                 this.verticalGap = 0;
                                 this.paddingLeft = 8;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"High Scores",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "horizontalScrollPolicy":"off",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":LinkButton,
                                       "id":"_GameStatsDisplay_LinkButton1",
                                       "events":{"click":"___GameStatsDisplay_LinkButton1_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":DataGrid,
                                       "id":"_GameStatsDisplay_DataGrid1",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "styleName":"denseTable",
                                             "columns":[_GameStatsDisplay_DataGridColumn1_c(),_GameStatsDisplay_DataGridColumn2_c(),_GameStatsDisplay_DataGridColumn3_c()]
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":VBox,
                              "id":"_GameStatsDisplay_VBox5",
                              "stylesFactory":function():void
                              {
                                 this.verticalGap = 0;
                                 this.paddingLeft = 8;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "label":"Fastest Completions",
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "horizontalScrollPolicy":"off",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":LinkButton,
                                       "id":"_GameStatsDisplay_LinkButton2",
                                       "events":{"click":"___GameStatsDisplay_LinkButton2_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 0;
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":DataGrid,
                                       "id":"_GameStatsDisplay_DataGrid2",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "styleName":"denseTable",
                                             "columns":[_GameStatsDisplay_DataGridColumn4_c(),_GameStatsDisplay_DataGridColumn5_c(),_GameStatsDisplay_DataGridColumn6_c()]
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
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _embed_mxml_Resources_Award_art_png_1077372292 = GameStatsDisplay__embed_mxml_Resources_Award_art_png_1077372292;
         _embed_mxml_Resources_Award_gameplay2_png_1449938174 = GameStatsDisplay__embed_mxml_Resources_Award_gameplay2_png_1449938174;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.horizontalScrollPolicy = "off";
         this.width = 240;
         this.addEventListener("creationComplete",___GameStatsDisplay_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         GameStatsDisplay._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get graphicsRating() : Rater
      {
         return this._1277823992graphicsRating;
      }
      
      public function ___GameStatsDisplay_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      [Bindable(event="propertyChange")]
      private function get speeds() : ArrayCollection
      {
         return this._896071412speeds;
      }
      
      public function selectGame(param1:String, param2:String, param3:String, param4:GameRatingAveragesUpdateEvent = null, param5:GameStatsUpdateEvent = null) : void
      {
         if(param4 != null || param5 != null || this.userName != param1 || this.project != param2 || this.gameName != param3)
         {
            reset();
            this.userName = param1;
            this.project = param2;
            this.gameName = param3;
            if(param4)
            {
               gameRatingReceiver(param4);
            }
            else
            {
               playCount.text = "Loading stats...";
               mgbSession.gameStats.getLatestStats(param1,param2,param3);
            }
            if(param5)
            {
               gameStatsReceiver(param5);
            }
            else
            {
               mgbSession.gameStats.getLatestRatings(param1,param2,param3,mgbSession.authenticatedName);
            }
         }
      }
      
      public function set graphicsRating(param1:Rater) : void
      {
         var _loc2_:Object = this._1277823992graphicsRating;
         if(_loc2_ !== param1)
         {
            this._1277823992graphicsRating = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"graphicsRating",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hideHighScoreSection() : Boolean
      {
         return this._67642345hideHighScoreSection;
      }
      
      [Bindable(event="propertyChange")]
      private function get project() : String
      {
         return this._309310695project;
      }
      
      private function set speeds(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._896071412speeds;
         if(_loc2_ !== param1)
         {
            this._896071412speeds = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speeds",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get scores() : ArrayCollection
      {
         return this._907766751scores;
      }
      
      [Bindable(event="propertyChange")]
      public function get nav() : Accordion
      {
         return this._108835nav;
      }
      
      public function ___GameStatsDisplay_LinkButton2_click(param1:MouseEvent) : void
      {
         requestHighscores();
      }
      
      private function _GameStatsDisplay_DataGridColumn3_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Score";
         _loc1_.dataField = "score";
         _loc1_.width = 80;
         return _loc1_;
      }
      
      public function set hideHighScoreSection(param1:Boolean) : void
      {
         var _loc2_:Object = this._67642345hideHighScoreSection;
         if(_loc2_ !== param1)
         {
            this._67642345hideHighScoreSection = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hideHighScoreSection",_loc2_,param1));
         }
      }
      
      private function requestHighscores() : void
      {
         mgbSession.gameStats.getHighScores(userName,project,gameName,GameStats.HS_SCORE);
         mgbSession.gameStats.getHighScores(userName,project,gameName,GameStats.HS_SPEED);
      }
      
      public function ___GameStatsDisplay_Button1_click(param1:MouseEvent) : void
      {
         getLinkToGame(false);
      }
      
      private function gameRatingReceiver(param1:GameRatingAveragesUpdateEvent) : void
      {
         if(param1.username == userName && param1.game == GameStats.makeGameName(project,gameName))
         {
            graphicsRating.averageRating = param1.graphicsAverage;
            graphicsRating.numRatings = param1.graphicsCount;
            gameplayRating.averageRating = param1.gameplayAverage;
            gameplayRating.numRatings = param1.gameplayCount;
            if(param1.graphicsRatingByAuthUser > 0)
            {
               graphicsRating.personalRating = param1.graphicsRatingByAuthUser;
            }
            if(param1.gameplayRatingByAuthUser > 0)
            {
               gameplayRating.personalRating = param1.gameplayRatingByAuthUser;
            }
         }
      }
      
      private function dgShowSpeedRowIndex(param1:Object, param2:DataGridColumn) : String
      {
         return !!speeds ? String(1 + speeds.getItemIndex(param1)) + "." : "";
      }
      
      private function set project(param1:String) : void
      {
         var _loc2_:Object = this._309310695project;
         if(_loc2_ !== param1)
         {
            this._309310695project = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"project",_loc2_,param1));
         }
      }
      
      private function doInit() : void
      {
         mgbSession.gameStats.addEventListener(GameStatsUpdateEvent.GAME_STATS_UPDATE,gameStatsReceiver);
         mgbSession.gameStats.addEventListener(GameHighscoresUpdateEvent.GAME_HIGHSCORES_UPDATE,gameHighscoresReceiver);
         mgbSession.gameStats.addEventListener(GameRatingAveragesUpdateEvent.GAME_RATING_UPDATE,gameRatingReceiver);
         graphicsRating.addEventListener(Rater.RATING_CHANGED_EVENT,ratingChangedHandler);
         gameplayRating.addEventListener(Rater.RATING_CHANGED_EVENT,ratingChangedHandler);
      }
      
      private function _GameStatsDisplay_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Builder:  <b>" + userName + "</b>";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GameStatsDisplay_Text1.htmlText = param1;
         },"_GameStatsDisplay_Text1.htmlText");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Project:  <b>" + project + "</b>";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GameStatsDisplay_Text2.htmlText = param1;
         },"_GameStatsDisplay_Text2.htmlText");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Game:  <b>" + gameName + "</b>";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GameStatsDisplay_Text3.htmlText = param1;
         },"_GameStatsDisplay_Text3.htmlText");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describePlayCounters;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            playCount.toolTip = param1;
         },"playCount.toolTip");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = gameStats.description;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GameStatsDisplay_TextArea1.text = param1;
         },"_GameStatsDisplay_TextArea1.text");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !!gameStats.description;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_TextArea1.visible = param1;
         },"_GameStatsDisplay_TextArea1.visible");
         result[5] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !!gameStats.description;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_TextArea1.includeInLayout = param1;
         },"_GameStatsDisplay_TextArea1.includeInLayout");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !!gameName;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_HBox1.visible = param1;
         },"_GameStatsDisplay_HBox1.visible");
         result[7] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !!gameName;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_HBox2.visible = param1;
         },"_GameStatsDisplay_HBox2.visible");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !hideHighScoreSection && !!gameName;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_VBox4.visible = param1;
         },"_GameStatsDisplay_VBox4.visible");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !scores && !speeds ? "Get High Scores..." : "High Scores:";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GameStatsDisplay_LinkButton1.label = param1;
         },"_GameStatsDisplay_LinkButton1.label");
         result[10] = binding;
         binding = new Binding(this,function():Object
         {
            return scores;
         },function(param1:Object):void
         {
            _GameStatsDisplay_DataGrid1.dataProvider = param1;
         },"_GameStatsDisplay_DataGrid1.dataProvider");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return scores != null;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_DataGrid1.visible = param1;
         },"_GameStatsDisplay_DataGrid1.visible");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return scores != null;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_DataGrid1.includeInLayout = param1;
         },"_GameStatsDisplay_DataGrid1.includeInLayout");
         result[13] = binding;
         binding = new Binding(this,function():int
         {
            return !scores ? 2 : int(Math.max(2,scores.length + 1));
         },function(param1:int):void
         {
            _GameStatsDisplay_DataGrid1.rowCount = param1;
         },"_GameStatsDisplay_DataGrid1.rowCount");
         result[14] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !hideHighScoreSection && !!gameName;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_VBox5.visible = param1;
         },"_GameStatsDisplay_VBox5.visible");
         result[15] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !scores && !speeds ? "Get Completion Speeds..." : "Fastest Completions:";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GameStatsDisplay_LinkButton2.label = param1;
         },"_GameStatsDisplay_LinkButton2.label");
         result[16] = binding;
         binding = new Binding(this,function():Object
         {
            return speeds;
         },function(param1:Object):void
         {
            _GameStatsDisplay_DataGrid2.dataProvider = param1;
         },"_GameStatsDisplay_DataGrid2.dataProvider");
         result[17] = binding;
         binding = new Binding(this,function():Boolean
         {
            return speeds != null;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_DataGrid2.visible = param1;
         },"_GameStatsDisplay_DataGrid2.visible");
         result[18] = binding;
         binding = new Binding(this,function():Boolean
         {
            return speeds != null;
         },function(param1:Boolean):void
         {
            _GameStatsDisplay_DataGrid2.includeInLayout = param1;
         },"_GameStatsDisplay_DataGrid2.includeInLayout");
         result[19] = binding;
         binding = new Binding(this,function():int
         {
            return !speeds ? 2 : int(Math.max(2,speeds.length + 1));
         },function(param1:int):void
         {
            _GameStatsDisplay_DataGrid2.rowCount = param1;
         },"_GameStatsDisplay_DataGrid2.rowCount");
         result[20] = binding;
         return result;
      }
      
      public function set nav(param1:Accordion) : void
      {
         var _loc2_:Object = this._108835nav;
         if(_loc2_ !== param1)
         {
            this._108835nav = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nav",_loc2_,param1));
         }
      }
      
      private function set gameName(param1:String) : void
      {
         var _loc2_:Object = this._1769344611gameName;
         if(_loc2_ !== param1)
         {
            this._1769344611gameName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameName",_loc2_,param1));
         }
      }
      
      private function _GameStatsDisplay_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "Builder:  <b>" + userName + "</b>";
         _loc1_ = "Project:  <b>" + project + "</b>";
         _loc1_ = "Game:  <b>" + gameName + "</b>";
         _loc1_ = MgbSystem.describePlayCounters;
         _loc1_ = gameStats.description;
         _loc1_ = !!gameStats.description;
         _loc1_ = !!gameStats.description;
         _loc1_ = !!gameName;
         _loc1_ = !!gameName;
         _loc1_ = !hideHighScoreSection && !!gameName;
         _loc1_ = !scores && !speeds ? "Get High Scores..." : "High Scores:";
         _loc1_ = scores;
         _loc1_ = scores != null;
         _loc1_ = scores != null;
         _loc1_ = !scores ? 2 : Math.max(2,scores.length + 1);
         _loc1_ = !hideHighScoreSection && !!gameName;
         _loc1_ = !scores && !speeds ? "Get Completion Speeds..." : "Fastest Completions:";
         _loc1_ = speeds;
         _loc1_ = speeds != null;
         _loc1_ = speeds != null;
         _loc1_ = !speeds ? 2 : Math.max(2,speeds.length + 1);
      }
      
      public function reset() : void
      {
         userName = "";
         project = "";
         gameName = "";
         gameplayRating.clear();
         graphicsRating.clear();
         gameStats = null;
         scores = null;
         speeds = null;
         playCount.text = "";
      }
      
      private function set scores(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._907766751scores;
         if(_loc2_ !== param1)
         {
            this._907766751scores = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scores",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playCount() : Text
      {
         return this._1903512005playCount;
      }
      
      [Bindable(event="propertyChange")]
      public function get gameplayRating() : Rater
      {
         return this._1604421789gameplayRating;
      }
      
      private function _GameStatsDisplay_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Player";
         _loc1_.dataField = "playername";
         _loc1_.width = 80;
         return _loc1_;
      }
      
      private function _GameStatsDisplay_DataGridColumn6_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Speed (s)";
         _loc1_.dataField = "score";
         _loc1_.width = 80;
         return _loc1_;
      }
      
      public function set playCount(param1:Text) : void
      {
         var _loc2_:Object = this._1903512005playCount;
         if(_loc2_ !== param1)
         {
            this._1903512005playCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playCount",_loc2_,param1));
         }
      }
      
      public function ___GameStatsDisplay_Button2_click(param1:MouseEvent) : void
      {
         getLinkToGame(true);
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function dgShowScoreRowIndex(param1:Object, param2:DataGridColumn) : String
      {
         return !!scores ? String(1 + scores.getItemIndex(param1)) + "." : "";
      }
      
      private function getEmbedCodeForGame() : void
      {
         var _loc1_:String = null;
         if(Boolean(userName) && Boolean(project) && Boolean(gameName))
         {
            _loc1_ = String(Application.application.getEmbedCodeForMap(userName,project,gameName));
            System.setClipboard(_loc1_);
            Alert.show("To embed MGB and autoload this game, Use the Embed code which has has been copied to the system clipboard. Go Paste it somewhere cool!");
         }
         else
         {
            Alert.show("You need to load a game first...");
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:GameStatsDisplay = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _GameStatsDisplay_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_GameStatsDisplayWatcherSetupUtil");
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
      
      private function getLinkToGame(param1:Boolean = false) : void
      {
         var _loc2_:String = null;
         if(Boolean(userName) && Boolean(project) && Boolean(gameName))
         {
            _loc2_ = String(Application.application.getUrlFromMap(userName,project,gameName,true,param1));
            System.setClipboard(_loc2_);
            Alert.show("To start MGB and autoload this game, link to\n\n" + _loc2_ + "\n\nThis link has been copied to the system clipboard");
         }
         else
         {
            Alert.show("You need to load a game first...");
         }
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
      
      private function _GameStatsDisplay_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.labelFunction = dgShowScoreRowIndex;
         _loc1_.headerText = "Rank";
         _loc1_.width = 42;
         return _loc1_;
      }
      
      private function _GameStatsDisplay_DataGridColumn5_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Player";
         _loc1_.dataField = "playername";
         _loc1_.width = 80;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get gameName() : String
      {
         return this._1769344611gameName;
      }
      
      public function ___GameStatsDisplay_Button3_click(param1:MouseEvent) : void
      {
         getEmbedCodeForGame();
      }
      
      public function set gameplayRating(param1:Rater) : void
      {
         var _loc2_:Object = this._1604421789gameplayRating;
         if(_loc2_ !== param1)
         {
            this._1604421789gameplayRating = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameplayRating",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get gameStats() : GameStatResult
      {
         return this._990064589gameStats;
      }
      
      private function gameStatsReceiver(param1:GameStatsUpdateEvent) : void
      {
         if(param1.gameStatResult.username == userName && param1.gameStatResult.game == GameStats.makeGameName(project,gameName))
         {
            playCount.text = GameStatResult.describe(param1.gameStatResult.playsCount,param1.gameStatResult.completionsCount);
            gameStats = param1.gameStatResult;
         }
      }
      
      public function ___GameStatsDisplay_LinkButton1_click(param1:MouseEvent) : void
      {
         requestHighscores();
      }
      
      private function gameHighscoresReceiver(param1:GameHighscoresUpdateEvent) : void
      {
         var _loc2_:ArrayCollection = null;
         if(param1.userName == userName && param1.project == project && param1.game == gameName)
         {
            _loc2_ = Boolean(param1.scores) && Boolean(param1.scores.length) ? param1.scores : new ArrayCollection();
            switch(param1.scoreType)
            {
               case GameStats.HS_SCORE:
                  scores = _loc2_;
                  break;
               case GameStats.HS_SPEED:
                  speeds = _loc2_;
            }
         }
      }
      
      private function _GameStatsDisplay_DataGridColumn4_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.labelFunction = dgShowSpeedRowIndex;
         _loc1_.headerText = "Rank";
         _loc1_.width = 42;
         return _loc1_;
      }
      
      private function set userName(param1:String) : void
      {
         var _loc2_:Object = this._266666762userName;
         if(_loc2_ !== param1)
         {
            this._266666762userName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userName",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get userName() : String
      {
         return this._266666762userName;
      }
      
      private function ratingChangedHandler(param1:Event) : void
      {
         var _loc2_:Rater = Rater(param1.target);
         var _loc3_:int = _loc2_ == graphicsRating ? int(_loc2_.personalRating) : 0;
         var _loc4_:int = _loc2_ == gameplayRating ? int(_loc2_.personalRating) : 0;
         mgbSession.gameStats.signalRating(this.userName,this.project,this.gameName,_loc3_,_loc4_);
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
   }
}
