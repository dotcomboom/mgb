package
{
   import com.mgb.data.*;
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
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.HDividedBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.controls.HSlider;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.RadioButton;
   import mx.controls.RadioButtonGroup;
   import mx.controls.Spacer;
   import mx.controls.TileList;
   import mx.core.*;
   import mx.effects.Fade;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.SliderEvent;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.mxml.HTTPService;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class GamesBrowser extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _GamesBrowser_Label2:Label;
      
      private var _328666036listGamesRequest:HTTPService;
      
      public var _GamesBrowser_GamesBrowserFeaturedGames1:GamesBrowserFeaturedGames;
      
      private var _336650556loading:Boolean = true;
      
      private var _1245742412lgr_gamestatus:int = 0;
      
      private var _538160287gamesListAC:ArrayCollection;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var _GamesBrowser_RadioButton6:RadioButton;
      
      public var _GamesBrowser_RadioButton7:RadioButton;
      
      private var _1888735386lgr_order:String = "plays_counter DESC";
      
      private var _1300345353quickFade:Fade;
      
      private var _embed_mxml_Resources_NextIcon_png_872008892:Class;
      
      private var _803564937pageNum:HSlider;
      
      private var _1018433279gamesList:Array;
      
      public var _GamesBrowser_Image1:Image;
      
      public var _GamesBrowser_Image2:Image;
      
      private var _728116771totalGames:int = 0;
      
      public var _GamesBrowser_Object1:Object;
      
      private var _1567735675lgr_offset:int = 0;
      
      mx_internal var _watchers:Array;
      
      private var _722688138featuredGamesMode:Boolean = false;
      
      private var _1553059053gameStatusRBG:RadioButtonGroup;
      
      private var _embed_mxml_Resources_PrevIcon_png_937253436:Class;
      
      private var _1891765293lgr_limit:int = 6;
      
      private var _592960478listingType:RadioButtonGroup;
      
      private var _1951739116lgr_gametype:int = 0;
      
      private var _1188332251listingType_mostPlays:RadioButton;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _GamesBrowser_HBox1:HBox;
      
      private var _2106232724tileList:TileList;
      
      private var _589565221lgr_chosenuser:String = "";
      
      public var _GamesBrowser_VBox2:VBox;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _820468882listingType_featuredGames:RadioButton;
      
      public function GamesBrowser()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Panel,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"cleanPanel",
                        "title":"Browse Games",
                        "layout":"absolute",
                        "percentHeight":100,
                        "percentWidth":100,
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
                                       this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":166,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":RadioButton,
                                             "id":"listingType_featuredGames",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "selected":true,
                                                   "groupName":"listingType",
                                                   "styleName":"denseTable",
                                                   "label":"Featured games",
                                                   "value":"!featured"
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":RadioButton,
                                             "id":"listingType_mostPlays",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "groupName":"listingType",
                                                   "styleName":"denseTable",
                                                   "label":"Most plays",
                                                   "value":"plays_counter DESC"
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":RadioButton,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "groupName":"listingType",
                                                   "styleName":"denseTable",
                                                   "label":"Most completions",
                                                   "value":"completions_counter DESC"
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":RadioButton,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "groupName":"listingType",
                                                   "styleName":"denseTable",
                                                   "label":"Highest rated graphics",
                                                   "value":"rating_average_graphics DESC"
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":RadioButton,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "groupName":"listingType",
                                                   "styleName":"denseTable",
                                                   "label":"Highest rated gameplay",
                                                   "value":"rating_average_gameplay DESC"
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":VBox,
                                             "id":"_GamesBrowser_VBox2",
                                             "stylesFactory":function():void
                                             {
                                                this.verticalGap = 0;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":16};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Label,
                                                      "stylesFactory":function():void
                                                      {
                                                         this.fontWeight = "bold";
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"text":"Game Status"};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":RadioButton,
                                                      "id":"_GamesBrowser_RadioButton6",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "groupName":"gameStatusRBG",
                                                            "selected":true,
                                                            "styleName":"denseTable"
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":RadioButton,
                                                      "id":"_GamesBrowser_RadioButton7",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "groupName":"gameStatusRBG",
                                                            "styleName":"denseTable"
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":16};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Label,
                                                      "id":"_GamesBrowser_Label2",
                                                      "stylesFactory":function():void
                                                      {
                                                         this.fontWeight = "bold";
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_GamesBrowser_HBox1",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_GamesBrowser_Image1",
                                                            "events":{"click":"___GamesBrowser_Image1_click"},
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"source":_embed_mxml_Resources_PrevIcon_png_937253436};
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":HSlider,
                                                            "id":"pageNum",
                                                            "events":{"change":"__pageNum_change"},
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "minimum":1,
                                                                  "value":1,
                                                                  "snapInterval":1,
                                                                  "dataTipFormatFunction":myDataTipFormatter,
                                                                  "width":90
                                                               };
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_GamesBrowser_Image2",
                                                            "events":{"click":"___GamesBrowser_Image2_click"},
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"source":_embed_mxml_Resources_NextIcon_png_872008892};
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
                                    "type":Canvas,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentHeight":100,
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":GamesBrowserFeaturedGames,
                                             "id":"_GamesBrowser_GamesBrowserFeaturedGames1",
                                             "events":{"playGame":"___GamesBrowser_GamesBrowserFeaturedGames1_playGame"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":TileList,
                                             "id":"tileList",
                                             "events":{"change":"__tileList_change"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "itemRenderer":_GamesBrowser_ClassFactory1_c(),
                                                   "allowMultipleSelection":false,
                                                   "dragEnabled":false
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
               })]};
            }
         });
         _1018433279gamesList = new Array();
         _538160287gamesListAC = new ArrayCollection(gamesList);
         _embed_mxml_Resources_NextIcon_png_872008892 = GamesBrowser__embed_mxml_Resources_NextIcon_png_872008892;
         _embed_mxml_Resources_PrevIcon_png_937253436 = GamesBrowser__embed_mxml_Resources_PrevIcon_png_937253436;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         _GamesBrowser_RadioButtonGroup2_i();
         _GamesBrowser_HTTPService1_i();
         _GamesBrowser_RadioButtonGroup1_i();
         _GamesBrowser_Fade1_i();
         this.addEventListener("creationComplete",___GamesBrowser_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         GamesBrowser._watcherSetupUtil = param1;
      }
      
      private function navigationChanged() : void
      {
         if(listingType.selection.value == "!featured")
         {
            featuredGamesMode = true;
         }
         else
         {
            lgr_order = String(listingType.selection.value);
            lgr_offset = (pageNum.value - 1) * lgr_limit;
            lgr_gamestatus = int(gameStatusRBG.selection.value);
            listGamesRequest.send();
            loading = true;
            featuredGamesMode = false;
         }
         tagCheck("nav_changed");
      }
      
      public function __tileList_change(param1:ListEvent) : void
      {
         playSelectedGame();
      }
      
      private function myDataTipFormatter(param1:Number) : String
      {
         return "Page " + int(param1) + " ";
      }
      
      [Bindable(event="propertyChange")]
      private function get gamesList() : Array
      {
         return this._1018433279gamesList;
      }
      
      [Bindable(event="propertyChange")]
      public function get quickFade() : Fade
      {
         return this._1300345353quickFade;
      }
      
      private function set gamesList(param1:Array) : void
      {
         var _loc2_:Object = this._1018433279gamesList;
         if(_loc2_ !== param1)
         {
            this._1018433279gamesList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gamesList",_loc2_,param1));
         }
      }
      
      public function __listingType_change(param1:Event) : void
      {
         navigationChanged();
      }
      
      private function _GamesBrowser_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = !featuredGamesMode;
         _loc1_ = GameStats.GAMESTATUS_READY;
         _loc1_ = GameStats.GAMESTATUS_READY_VALUE;
         _loc1_ = GameStats.GAMESTATUS_NOTREADY;
         _loc1_ = GameStats.GAMESTATUS_NOTREADY_VALUE;
         _loc1_ = (!!loading ? "Loading p" : "P") + "age " + pageNum.value + " of " + (int((totalGames - 1) / lgr_limit) + 1);
         _loc1_ = totalGames + " results...";
         _loc1_ = totalGames != 0;
         _loc1_ = quickFade;
         _loc1_ = quickFade;
         _loc1_ = pageNum.value != 1;
         _loc1_ = !loading;
         _loc1_ = int((totalGames - 1) / lgr_limit) + 1;
         _loc1_ = pageNum.value < int((totalGames - 1) / lgr_limit) + 1;
         _loc1_ = !loading;
         _loc1_ = featuredGamesMode;
         _loc1_ = quickFade;
         _loc1_ = quickFade;
         _loc1_ = gamesListAC;
         _loc1_ = quickFade;
         _loc1_ = quickFade;
         _loc1_ = !loading && !featuredGamesMode;
         _loc1_ = MgbSystem.idServerUrl + "/user/flex_list_games_by5";
         _loc1_ = lgr_limit;
         _loc1_ = lgr_offset;
         _loc1_ = lgr_order;
         _loc1_ = lgr_gamestatus;
         _loc1_ = lgr_gametype;
         _loc1_ = lgr_chosenuser;
         _loc1_ = (lgr_order == "rating_average_graphics DESC" || lgr_order == "rating_average_gameplay DESC") && (lgr_chosenuser == "" || lgr_chosenuser == "*") ? 8 : 0;
      }
      
      [Bindable(event="propertyChange")]
      public function get gameStatusRBG() : RadioButtonGroup
      {
         return this._1553059053gameStatusRBG;
      }
      
      [Bindable(event="propertyChange")]
      private function get lgr_gametype() : int
      {
         return this._1951739116lgr_gametype;
      }
      
      public function set quickFade(param1:Fade) : void
      {
         var _loc2_:Object = this._1300345353quickFade;
         if(_loc2_ !== param1)
         {
            this._1300345353quickFade = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"quickFade",_loc2_,param1));
         }
      }
      
      public function set listingType_featuredGames(param1:RadioButton) : void
      {
         var _loc2_:Object = this._820468882listingType_featuredGames;
         if(_loc2_ !== param1)
         {
            this._820468882listingType_featuredGames = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listingType_featuredGames",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get lgr_chosenuser() : String
      {
         return this._589565221lgr_chosenuser;
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
      
      private function set lgr_gametype(param1:int) : void
      {
         var _loc2_:Object = this._1951739116lgr_gametype;
         if(_loc2_ !== param1)
         {
            this._1951739116lgr_gametype = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lgr_gametype",_loc2_,param1));
         }
      }
      
      private function listGamesFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Could not browse users. Error message was \'" + param1.fault.faultString + "\'");
         loading = false;
      }
      
      private function set lgr_order(param1:String) : void
      {
         var _loc2_:Object = this._1888735386lgr_order;
         if(_loc2_ !== param1)
         {
            this._1888735386lgr_order = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lgr_order",_loc2_,param1));
         }
      }
      
      private function _GamesBrowser_RadioButtonGroup2_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         gameStatusRBG = _loc1_;
         _loc1_.addEventListener("change",__gameStatusRBG_change);
         _loc1_.initialized(this,"gameStatusRBG");
         return _loc1_;
      }
      
      private function _GamesBrowser_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return !featuredGamesMode;
         },function(param1:Boolean):void
         {
            _GamesBrowser_VBox2.visible = param1;
         },"_GamesBrowser_VBox2.visible");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = GameStats.GAMESTATUS_READY;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamesBrowser_RadioButton6.label = param1;
         },"_GamesBrowser_RadioButton6.label");
         result[1] = binding;
         binding = new Binding(this,function():Object
         {
            return GameStats.GAMESTATUS_READY_VALUE;
         },function(param1:Object):void
         {
            _GamesBrowser_RadioButton6.value = param1;
         },"_GamesBrowser_RadioButton6.value");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = GameStats.GAMESTATUS_NOTREADY;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamesBrowser_RadioButton7.label = param1;
         },"_GamesBrowser_RadioButton7.label");
         result[3] = binding;
         binding = new Binding(this,function():Object
         {
            return GameStats.GAMESTATUS_NOTREADY_VALUE;
         },function(param1:Object):void
         {
            _GamesBrowser_RadioButton7.value = param1;
         },"_GamesBrowser_RadioButton7.value");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = (!!loading ? "Loading p" : "P") + "age " + pageNum.value + " of " + (int((totalGames - 1) / lgr_limit) + 1);
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamesBrowser_Label2.text = param1;
         },"_GamesBrowser_Label2.text");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = totalGames + " results...";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamesBrowser_Label2.toolTip = param1;
         },"_GamesBrowser_Label2.toolTip");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return totalGames != 0;
         },function(param1:Boolean):void
         {
            _GamesBrowser_HBox1.visible = param1;
         },"_GamesBrowser_HBox1.visible");
         result[7] = binding;
         binding = new Binding(this,function():*
         {
            return quickFade;
         },function(param1:*):void
         {
            _GamesBrowser_HBox1.setStyle("showEffect",param1);
         },"_GamesBrowser_HBox1.showEffect");
         result[8] = binding;
         binding = new Binding(this,function():*
         {
            return quickFade;
         },function(param1:*):void
         {
            _GamesBrowser_HBox1.setStyle("hideEffect",param1);
         },"_GamesBrowser_HBox1.hideEffect");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return pageNum.value != 1;
         },function(param1:Boolean):void
         {
            _GamesBrowser_Image1.visible = param1;
         },"_GamesBrowser_Image1.visible");
         result[10] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !loading;
         },function(param1:Boolean):void
         {
            _GamesBrowser_Image1.enabled = param1;
         },"_GamesBrowser_Image1.enabled");
         result[11] = binding;
         binding = new Binding(this,function():Number
         {
            return int((totalGames - 1) / lgr_limit) + 1;
         },function(param1:Number):void
         {
            pageNum.maximum = param1;
         },"pageNum.maximum");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return pageNum.value < int((totalGames - 1) / lgr_limit) + 1;
         },function(param1:Boolean):void
         {
            _GamesBrowser_Image2.visible = param1;
         },"_GamesBrowser_Image2.visible");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !loading;
         },function(param1:Boolean):void
         {
            _GamesBrowser_Image2.enabled = param1;
         },"_GamesBrowser_Image2.enabled");
         result[14] = binding;
         binding = new Binding(this,function():Boolean
         {
            return featuredGamesMode;
         },function(param1:Boolean):void
         {
            _GamesBrowser_GamesBrowserFeaturedGames1.visible = param1;
         },"_GamesBrowser_GamesBrowserFeaturedGames1.visible");
         result[15] = binding;
         binding = new Binding(this,function():*
         {
            return quickFade;
         },function(param1:*):void
         {
            _GamesBrowser_GamesBrowserFeaturedGames1.setStyle("showEffect",param1);
         },"_GamesBrowser_GamesBrowserFeaturedGames1.showEffect");
         result[16] = binding;
         binding = new Binding(this,function():*
         {
            return quickFade;
         },function(param1:*):void
         {
            _GamesBrowser_GamesBrowserFeaturedGames1.setStyle("hideEffect",param1);
         },"_GamesBrowser_GamesBrowserFeaturedGames1.hideEffect");
         result[17] = binding;
         binding = new Binding(this,function():Object
         {
            return gamesListAC;
         },function(param1:Object):void
         {
            tileList.dataProvider = param1;
         },"tileList.dataProvider");
         result[18] = binding;
         binding = new Binding(this,function():*
         {
            return quickFade;
         },function(param1:*):void
         {
            tileList.setStyle("showEffect",param1);
         },"tileList.showEffect");
         result[19] = binding;
         binding = new Binding(this,function():*
         {
            return quickFade;
         },function(param1:*):void
         {
            tileList.setStyle("hideEffect",param1);
         },"tileList.hideEffect");
         result[20] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !loading && !featuredGamesMode;
         },function(param1:Boolean):void
         {
            tileList.visible = param1;
         },"tileList.visible");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.idServerUrl + "/user/flex_list_games_by5";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            listGamesRequest.url = param1;
         },"listGamesRequest.url");
         result[22] = binding;
         binding = new Binding(this,function():*
         {
            return lgr_limit;
         },function(param1:*):void
         {
            _GamesBrowser_Object1.limit = param1;
         },"_GamesBrowser_Object1.limit");
         result[23] = binding;
         binding = new Binding(this,function():*
         {
            return lgr_offset;
         },function(param1:*):void
         {
            _GamesBrowser_Object1.offset = param1;
         },"_GamesBrowser_Object1.offset");
         result[24] = binding;
         binding = new Binding(this,function():*
         {
            return lgr_order;
         },function(param1:*):void
         {
            _GamesBrowser_Object1.order = param1;
         },"_GamesBrowser_Object1.order");
         result[25] = binding;
         binding = new Binding(this,function():*
         {
            return lgr_gamestatus;
         },function(param1:*):void
         {
            _GamesBrowser_Object1.gamestatus = param1;
         },"_GamesBrowser_Object1.gamestatus");
         result[26] = binding;
         binding = new Binding(this,function():*
         {
            return lgr_gametype;
         },function(param1:*):void
         {
            _GamesBrowser_Object1.gametype = param1;
         },"_GamesBrowser_Object1.gametype");
         result[27] = binding;
         binding = new Binding(this,function():*
         {
            return lgr_chosenuser;
         },function(param1:*):void
         {
            _GamesBrowser_Object1.chosenuser = param1;
         },"_GamesBrowser_Object1.chosenuser");
         result[28] = binding;
         binding = new Binding(this,function():*
         {
            return (lgr_order == "rating_average_graphics DESC" || lgr_order == "rating_average_gameplay DESC") && (lgr_chosenuser == "" || lgr_chosenuser == "*") ? 8 : 0;
         },function(param1:*):void
         {
            _GamesBrowser_Object1.minplayscount = param1;
         },"_GamesBrowser_Object1.minplayscount");
         result[29] = binding;
         return result;
      }
      
      public function __gameStatusRBG_change(param1:Event) : void
      {
         navigationChanged();
      }
      
      public function ___GamesBrowser_GamesBrowserFeaturedGames1_playGame(param1:GamesBrowserEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function _GamesBrowser_Object1_i() : Object
      {
         var _loc1_:Object = {
            "limit":null,
            "offset":null,
            "order":null,
            "gamestatus":null,
            "gametype":null,
            "chosenuser":null,
            "minplayscount":null
         };
         _GamesBrowser_Object1 = _loc1_;
         BindingManager.executeBindings(this,"_GamesBrowser_Object1",_GamesBrowser_Object1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get loading() : Boolean
      {
         return this._336650556loading;
      }
      
      [Bindable(event="propertyChange")]
      public function get listGamesRequest() : HTTPService
      {
         return this._328666036listGamesRequest;
      }
      
      [Bindable(event="propertyChange")]
      private function get lgr_gamestatus() : int
      {
         return this._1245742412lgr_gamestatus;
      }
      
      public function __listGamesRequest_fault(param1:FaultEvent) : void
      {
         listGamesFaultHandler(param1);
      }
      
      public function __pageNum_change(param1:SliderEvent) : void
      {
         navigationChanged();
      }
      
      [Bindable(event="propertyChange")]
      private function get gamesListAC() : ArrayCollection
      {
         return this._538160287gamesListAC;
      }
      
      [Bindable(event="propertyChange")]
      private function get lgr_order() : String
      {
         return this._1888735386lgr_order;
      }
      
      private function listGamesResultHandler(param1:ResultEvent) : void
      {
         switch(int(param1.result.resultcount))
         {
            case 0:
               gamesListAC.removeAll();
               break;
            case 1:
               gamesListAC.removeAll();
               gamesListAC.addItem(param1.result.gamestats.gamestat);
               break;
            default:
               gamesListAC = param1.result.gamestats.gamestat;
         }
         totalGames = param1.result.gamecount;
         loading = false;
      }
      
      [Bindable(event="propertyChange")]
      public function get tileList() : TileList
      {
         return this._2106232724tileList;
      }
      
      private function _GamesBrowser_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         listingType = _loc1_;
         _loc1_.addEventListener("change",__listingType_change);
         _loc1_.initialized(this,"listingType");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get featuredGamesMode() : Boolean
      {
         return this._722688138featuredGamesMode;
      }
      
      [Bindable(event="propertyChange")]
      public function get pageNum() : HSlider
      {
         return this._803564937pageNum;
      }
      
      private function set loading(param1:Boolean) : void
      {
         var _loc2_:Object = this._336650556loading;
         if(_loc2_ !== param1)
         {
            this._336650556loading = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get lgr_offset() : int
      {
         return this._1567735675lgr_offset;
      }
      
      private function playSelectedGame() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         if(tileList.selectedItem)
         {
            _loc1_ = String(GameStats.makeProjectName(tileList.selectedItem.game));
            _loc2_ = String(GameStats.makeMapName(tileList.selectedItem.game));
            dispatchEvent(new GamesBrowserEvent(GamesBrowserEvent.PLAY_GAME,tileList.selectedItem.user,_loc1_,_loc2_));
         }
      }
      
      public function chooseUser(param1:String) : void
      {
         lgr_chosenuser = param1;
         if(param1 != "" && listingType_featuredGames.selected)
         {
            listingType.selection = listingType_mostPlays;
            listingType_featuredGames.includeInLayout = listingType_featuredGames.visible = false;
         }
         navigationChanged();
      }
      
      private function set lgr_chosenuser(param1:String) : void
      {
         var _loc2_:Object = this._589565221lgr_chosenuser;
         if(_loc2_ !== param1)
         {
            this._589565221lgr_chosenuser = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lgr_chosenuser",_loc2_,param1));
         }
      }
      
      private function tagCheck(param1:String) : void
      {
         ActiveTutorial.getInstance().tutorialTagCheck("gamebrowser_" + param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get listingType_featuredGames() : RadioButton
      {
         return this._820468882listingType_featuredGames;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:GamesBrowser = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _GamesBrowser_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_GamesBrowserWatcherSetupUtil");
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
      
      private function _GamesBrowser_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         quickFade = _loc1_;
         _loc1_.duration = 250;
         return _loc1_;
      }
      
      public function set listingType_mostPlays(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1188332251listingType_mostPlays;
         if(_loc2_ !== param1)
         {
            this._1188332251listingType_mostPlays = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listingType_mostPlays",_loc2_,param1));
         }
      }
      
      public function ___GamesBrowser_Image1_click(param1:MouseEvent) : void
      {
         --pageNum.value;
         navigationChanged();
      }
      
      public function set listGamesRequest(param1:HTTPService) : void
      {
         var _loc2_:Object = this._328666036listGamesRequest;
         if(_loc2_ !== param1)
         {
            this._328666036listGamesRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listGamesRequest",_loc2_,param1));
         }
      }
      
      public function set listingType(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._592960478listingType;
         if(_loc2_ !== param1)
         {
            this._592960478listingType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listingType",_loc2_,param1));
         }
      }
      
      private function set lgr_limit(param1:int) : void
      {
         var _loc2_:Object = this._1891765293lgr_limit;
         if(_loc2_ !== param1)
         {
            this._1891765293lgr_limit = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lgr_limit",_loc2_,param1));
         }
      }
      
      private function set totalGames(param1:int) : void
      {
         var _loc2_:Object = this._728116771totalGames;
         if(_loc2_ !== param1)
         {
            this._728116771totalGames = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"totalGames",_loc2_,param1));
         }
      }
      
      private function set gamesListAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._538160287gamesListAC;
         if(_loc2_ !== param1)
         {
            this._538160287gamesListAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gamesListAC",_loc2_,param1));
         }
      }
      
      private function set lgr_gamestatus(param1:int) : void
      {
         var _loc2_:Object = this._1245742412lgr_gamestatus;
         if(_loc2_ !== param1)
         {
            this._1245742412lgr_gamestatus = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lgr_gamestatus",_loc2_,param1));
         }
      }
      
      public function __listGamesRequest_result(param1:ResultEvent) : void
      {
         listGamesResultHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      private function get lgr_limit() : int
      {
         return this._1891765293lgr_limit;
      }
      
      public function ___GamesBrowser_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         navigationChanged();
      }
      
      [Bindable(event="propertyChange")]
      public function get listingType_mostPlays() : RadioButton
      {
         return this._1188332251listingType_mostPlays;
      }
      
      [Bindable(event="propertyChange")]
      private function get totalGames() : int
      {
         return this._728116771totalGames;
      }
      
      [Bindable(event="propertyChange")]
      public function get listingType() : RadioButtonGroup
      {
         return this._592960478listingType;
      }
      
      public function set tileList(param1:TileList) : void
      {
         var _loc2_:Object = this._2106232724tileList;
         if(_loc2_ !== param1)
         {
            this._2106232724tileList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tileList",_loc2_,param1));
         }
      }
      
      private function _GamesBrowser_HTTPService1_i() : HTTPService
      {
         var _loc1_:HTTPService = new HTTPService();
         listGamesRequest = _loc1_;
         _loc1_.contentType = "application/x-www-form-urlencoded";
         _loc1_.showBusyCursor = true;
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.request = _GamesBrowser_Object1_i();
         _loc1_.addEventListener("result",__listGamesRequest_result);
         _loc1_.addEventListener("fault",__listGamesRequest_fault);
         BindingManager.executeBindings(this,"listGamesRequest",listGamesRequest);
         _loc1_.initialized(this,"listGamesRequest");
         return _loc1_;
      }
      
      private function _GamesBrowser_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = GamePreviewRenderer;
         return _loc1_;
      }
      
      public function set pageNum(param1:HSlider) : void
      {
         var _loc2_:Object = this._803564937pageNum;
         if(_loc2_ !== param1)
         {
            this._803564937pageNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageNum",_loc2_,param1));
         }
      }
      
      private function set featuredGamesMode(param1:Boolean) : void
      {
         var _loc2_:Object = this._722688138featuredGamesMode;
         if(_loc2_ !== param1)
         {
            this._722688138featuredGamesMode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"featuredGamesMode",_loc2_,param1));
         }
      }
      
      public function ___GamesBrowser_Image2_click(param1:MouseEvent) : void
      {
         ++pageNum.value;
         navigationChanged();
      }
      
      private function set lgr_offset(param1:int) : void
      {
         var _loc2_:Object = this._1567735675lgr_offset;
         if(_loc2_ !== param1)
         {
            this._1567735675lgr_offset = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lgr_offset",_loc2_,param1));
         }
      }
   }
}
