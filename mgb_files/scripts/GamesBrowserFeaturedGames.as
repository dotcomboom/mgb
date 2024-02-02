package
{
   import com.mgb.controls.BitmapDuper;
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
   import mx.containers.HDividedBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.ComboBox;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class GamesBrowserFeaturedGames extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _GamesBrowserFeaturedGames_Button1:Button;
      
      public var _GamesBrowserFeaturedGames_Button3:Button;
      
      mx_internal var _watchers:Array;
      
      private var _embed_mxml_Resources_PrevIcon_png_937253436:Class;
      
      private var _618374377gameChooser:ComboBox;
      
      private var _109734381sshot:BitmapDuper;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _embed_mxml_Resources_NextIcon_png_872008892:Class;
      
      private var _195588445gamesAC:ArrayCollection;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml_Resources_PlayIcon_png_687450682:Class;
      
      public var _GamesBrowserFeaturedGames_Text1:Text;
      
      mx_internal var _bindings:Array;
      
      private var _956862517gameStatsDisplay:GameStatsDisplay;
      
      public function GamesBrowserFeaturedGames()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Panel,
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                     this.verticalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"cleanPanel",
                        "horizontalScrollPolicy":"off",
                        "verticalScrollPolicy":"off",
                        "height":480,
                        "width":640,
                        "layout":"absolute",
                        "title":"See some of the games built using My Game Builder - No extra tools required!",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HDividedBox,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function():void
                                    {
                                       this.paddingLeft = 12;
                                       this.paddingRight = 12;
                                       this.paddingTop = 12;
                                       this.paddingBottom = 12;
                                       this.verticalGap = 16;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentHeight":100,
                                          "width":360,
                                          "horizontalScrollPolicy":"off",
                                          "verticalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":HBox,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":Button,
                                                      "id":"_GamesBrowserFeaturedGames_Button1",
                                                      "events":{"click":"___GamesBrowserFeaturedGames_Button1_click"},
                                                      "stylesFactory":function():void
                                                      {
                                                         this.icon = _embed_mxml_Resources_PrevIcon_png_937253436;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "height":28,
                                                            "labelPlacement":"right",
                                                            "label":"Back  "
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"percentWidth":100};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Button,
                                                      "events":{"click":"___GamesBrowserFeaturedGames_Button2_click"},
                                                      "stylesFactory":function():void
                                                      {
                                                         this.icon = _embed_mxml_Resources_PlayIcon_png_687450682;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "height":28,
                                                            "labelPlacement":"right",
                                                            "label":"Play Game "
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"percentWidth":100};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Button,
                                                      "id":"_GamesBrowserFeaturedGames_Button3",
                                                      "events":{"click":"___GamesBrowserFeaturedGames_Button3_click"},
                                                      "stylesFactory":function():void
                                                      {
                                                         this.icon = _embed_mxml_Resources_NextIcon_png_872008892;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "height":28,
                                                            "labelPlacement":"right",
                                                            "label":"Next  "
                                                         };
                                                      }
                                                   })]
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Canvas,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "autoLayout":true,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":BitmapDuper,
                                                      "id":"sshot",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "width":336,
                                                            "height":176,
                                                            "x":0
                                                         };
                                                      }
                                                   })]
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":ComboBox,
                                             "id":"gameChooser",
                                             "events":{
                                                "change":"__gameChooser_change",
                                                "creationComplete":"__gameChooser_creationComplete"
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "height":28,
                                                   "styleName":"denseTable",
                                                   "labelFunction":listGamesCBLabelFunction
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Text,
                                             "id":"_GamesBrowserFeaturedGames_Text1",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "height":48
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":GameStatsDisplay,
                                    "id":"gameStatsDisplay",
                                    "stylesFactory":function():void
                                    {
                                       this.paddingLeft = 8;
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         _195588445gamesAC = new ArrayCollection([{
            "username":"drblakeman",
            "project":"Two Cities Bother and Wise",
            "map":"2 Cities Bother and Wise",
            "label":"Begin your journey to reignite the sun!"
         },{
            "username":"noahghouse",
            "project":"The Archer Game 3",
            "map":"Legend Of The Sacred Swords",
            "label":"This story is now officially EPIC"
         },{
            "username":"hooliganza",
            "project":"Crab Invasion II",
            "map":"inside",
            "label":"Hooliganza made a sequel to his own game. Stonking animation!"
         },{
            "username":"smokescreen",
            "project":"Race",
            "map":"Road Rage",
            "label":"You wouldn\'t like me when I\'m angry..."
         },{
            "username":"thegreathero",
            "project":"Hero Quest",
            "map":"Hero Quest",
            "label":"The ultimate story of one boy\'s quest to become The Great Hero, and stop the most evil beast any world has ever known - Lord Daraken."
         },{
            "username":"theultimateyoshi2",
            "project":"Ball Burst Out",
            "map":"Title",
            "label":"Another great RPG from the creator of \'The Sephiroth Cronicles\'"
         },{
            "username":"team_tenac",
            "project":"100 dungeons",
            "map":"house",
            "label":"Many games in MGB are built by teams: Artists, Cartographers (mappers), Writers, Bashers (testers), Engineers (Actor logic), Puzzle designers, Project Managers and otehr kinds of skills all come together in a team. Here\'s one example of a team game"
         },{
            "username":"noahghouse",
            "project":"The Archer Game 2",
            "map":"title",
            "label":"Great, classic RPG storyline"
         },{
            "username":"mariokartteam",
            "project":"mario kart mgb",
            "map":"mario kart mgb",
            "label":"This team *loves* mario kart :)  "
         },{
            "username":"darkjames78",
            "project":"Snow",
            "map":"Pyro snow",
            "label":"Winner of competition #12"
         },{
            "username":"shakeandbake",
            "project":"Ice",
            "map":"Skating 1",
            "label":"Winner of competition #9. Ice is slippery..."
         },{
            "username":"spiderpig",
            "project":"project1",
            "map":"A1",
            "label":"Joint winner of competition #8. The color puzzle is ingenious!"
         },{
            "username":"shakeandbake",
            "project":"Burger Man",
            "map":"Burger Man Outside",
            "label":"Joint winner of competition #8 (Arena games)\'"
         },{
            "username":"hooliganza",
            "project":"Amithy",
            "map":"mainland",
            "label":"Slime them bunnies"
         },{
            "username":"spiderpig",
            "project":"project1",
            "map":"Scooter World2",
            "label":"Runner-up in competition #9"
         },{
            "username":"wish_team",
            "project":"iccaro style",
            "map":"Slimy land 1",
            "label":"wish_team\'s homage to the sadly missed icarro"
         },{
            "username":"hooliganza",
            "project":"Raine",
            "map":"round 1",
            "label":"A short arena-style game"
         },{
            "username":"hooliganza",
            "project":"project1",
            "map":"Crab Invasion",
            "label":"Mind the crabs!"
         },{
            "username":"hooliganza",
            "project":"Game Mechanics demo",
            "map":"map 1",
            "label":"A simple demo of some available game mechanics. A great way to learn MGB"
         }]);
         _embed_mxml_Resources_NextIcon_png_872008892 = GamesBrowserFeaturedGames__embed_mxml_Resources_NextIcon_png_872008892;
         _embed_mxml_Resources_PlayIcon_png_687450682 = GamesBrowserFeaturedGames__embed_mxml_Resources_PlayIcon_png_687450682;
         _embed_mxml_Resources_PrevIcon_png_937253436 = GamesBrowserFeaturedGames__embed_mxml_Resources_PrevIcon_png_937253436;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         GamesBrowserFeaturedGames._watcherSetupUtil = param1;
      }
      
      private function playSelectedGame() : void
      {
         dispatchEvent(new GamesBrowserEvent(GamesBrowserEvent.PLAY_GAME,gameChooser.selectedItem.username,gameChooser.selectedItem.project,gameChooser.selectedItem.map));
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:GamesBrowserFeaturedGames = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _GamesBrowserFeaturedGames_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_GamesBrowserFeaturedGamesWatcherSetupUtil");
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
      private function get gamesAC() : ArrayCollection
      {
         return this._195588445gamesAC;
      }
      
      public function __gameChooser_change(param1:ListEvent) : void
      {
         listGamesCBchangeHandler(param1);
      }
      
      private function listGamesCBLabelFunction(param1:Object) : String
      {
         return "\'" + param1.project + "\' - \'" + param1.map + "\' by " + param1.username;
      }
      
      public function __gameChooser_creationComplete(param1:FlexEvent) : void
      {
         showScreenshot(gamesAC[0]);
      }
      
      [Bindable(event="propertyChange")]
      public function get gameStatsDisplay() : GameStatsDisplay
      {
         return this._956862517gameStatsDisplay;
      }
      
      public function ___GamesBrowserFeaturedGames_Button1_click(param1:MouseEvent) : void
      {
         showScreenshot(gamesAC[--gameChooser.selectedIndex]);
      }
      
      public function ___GamesBrowserFeaturedGames_Button3_click(param1:MouseEvent) : void
      {
         showScreenshot(gamesAC[++gameChooser.selectedIndex]);
      }
      
      private function showScreenshot(param1:Object) : void
      {
         sshot.drawScreenshot(param1.username,param1.project,param1.map);
         gameStatsDisplay.selectGame(param1.username,param1.project,param1.map);
      }
      
      private function set gamesAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._195588445gamesAC;
         if(_loc2_ !== param1)
         {
            this._195588445gamesAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gamesAC",_loc2_,param1));
         }
      }
      
      public function set gameChooser(param1:ComboBox) : void
      {
         var _loc2_:Object = this._618374377gameChooser;
         if(_loc2_ !== param1)
         {
            this._618374377gameChooser = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameChooser",_loc2_,param1));
         }
      }
      
      private function listGamesCBchangeHandler(param1:Event) : void
      {
         showScreenshot(param1.currentTarget.selectedItem);
      }
      
      public function set sshot(param1:BitmapDuper) : void
      {
         var _loc2_:Object = this._109734381sshot;
         if(_loc2_ !== param1)
         {
            this._109734381sshot = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sshot",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gameChooser() : ComboBox
      {
         return this._618374377gameChooser;
      }
      
      private function _GamesBrowserFeaturedGames_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = gameChooser.selectedIndex > 0;
         _loc1_ = gameChooser.selectedIndex + 1 < gameChooser.dataProvider.length;
         _loc1_ = gamesAC;
         _loc1_ = gameChooser.selectedItem.label;
      }
      
      [Bindable(event="propertyChange")]
      public function get sshot() : BitmapDuper
      {
         return this._109734381sshot;
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
      
      public function ___GamesBrowserFeaturedGames_Button2_click(param1:MouseEvent) : void
      {
         playSelectedGame();
      }
      
      private function _GamesBrowserFeaturedGames_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return gameChooser.selectedIndex > 0;
         },function(param1:Boolean):void
         {
            _GamesBrowserFeaturedGames_Button1.enabled = param1;
         },"_GamesBrowserFeaturedGames_Button1.enabled");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return gameChooser.selectedIndex + 1 < gameChooser.dataProvider.length;
         },function(param1:Boolean):void
         {
            _GamesBrowserFeaturedGames_Button3.enabled = param1;
         },"_GamesBrowserFeaturedGames_Button3.enabled");
         result[1] = binding;
         binding = new Binding(this,function():Object
         {
            return gamesAC;
         },function(param1:Object):void
         {
            gameChooser.dataProvider = param1;
         },"gameChooser.dataProvider");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = gameChooser.selectedItem.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamesBrowserFeaturedGames_Text1.text = param1;
         },"_GamesBrowserFeaturedGames_Text1.text");
         result[3] = binding;
         return result;
      }
   }
}
