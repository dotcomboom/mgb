package
{
   import com.mgb.controls.BitmapDuper;
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
   import mx.containers.Canvas;
   import mx.containers.Form;
   import mx.containers.FormItem;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.TabNavigator;
   import mx.containers.VBox;
   import mx.controls.*;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.*;
   import mx.effects.DefaultTileListEffect;
   import mx.effects.Fade;
   import mx.events.CloseEvent;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.rpc.events.*;
   import mx.states.AddChild;
   import mx.states.State;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ProjectsTab extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1314832319tilesPL:PieceList;
      
      private var _144773105createProjectButton:Button;
      
      private var _1740971685projectSelectDataGrid:DataGrid;
      
      public var _ProjectsTab_HBox2:HBox;
      
      private var pseudoLoginOldState:String = null;
      
      public var _ProjectsTab_Image1:Image;
      
      public var _ProjectsTab_Image2:Image;
      
      public var _ProjectsTab_Image3:Image;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _2058736931showMeSlowly:Fade;
      
      private var _1260204146panelTabNav:TabNavigator;
      
      private var _446328343myTileListEffect:DefaultTileListEffect;
      
      private var trashConfirmDragEvent:DragEvent = null;
      
      private var _embed_mxml_Resources_mail_png_652529630:Class;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _353928802tilePieceList:TileList;
      
      private var _608723511actorPieceList:TileList;
      
      public var _ProjectsTab_Text1:Text;
      
      public var _ProjectsTab_Text3:Text;
      
      public var _ProjectsTab_Text4:Text;
      
      private var _1260658248mgbLogger:MgbLogger;
      
      public var _ProjectsTab_Text2:Text;
      
      private var _embed_mxml_Resources_trashcan2_png_1044093694:Class;
      
      private var _461896519chosenProject:TextInput;
      
      private var _1268861541footer:EditFooterComponent;
      
      private var _429542716projectLogoPreview:BitmapDuper;
      
      private var _1819115220chooseProjectButton:Button;
      
      private var _1878170778projectsTabBackgroundColor:SelectBackgroundColor;
      
      public var _ProjectsTab_Panel1:Panel;
      
      public var _ProjectsTab_Panel2:Panel;
      
      public var _ProjectsTab_Panel3:Panel;
      
      mx_internal var _watchers:Array;
      
      public var _ProjectsTab_Label1:Label;
      
      private var _334368309loggedinMainVbox:VBox;
      
      private var _1081358637mapsPL:PieceList;
      
      private var trashConfirmAlert:Alert = null;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _262359728mapPieceList:TileList;
      
      private var _1769028870projectComment:TextInput;
      
      mx_internal var _bindings:Array;
      
      private var _1650536550actorsPL:PieceList;
      
      private var _embed_mxml_Resources_NewObject_png_1074209160:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _940098729projectList:ProjectList;
      
      public function ProjectsTab()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "id":"loggedinMainVbox",
                  "stylesFactory":function():void
                  {
                     this.left = "10";
                     this.right = "10";
                     this.top = "4";
                     this.bottom = "4";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "propertiesFactory":function():Object
                        {
                           return {"childDescriptors":[new UIComponentDescriptor({
                              "type":Text,
                              "id":"_ProjectsTab_Text1",
                              "stylesFactory":function():void
                              {
                                 this.fontFamily = "titlefont";
                                 this.fontSize = 14;
                                 this.color = 16711680;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "text":"Viewing using Guest mode - can view but not save ",
                                    "toolTip":"You are logged in as a guest. You may use the editor tools and run tutorials, but you may not save game pieces, nor will your tutorial/color settings be remembered. Enjoy your visit, and please sign up for an account later (Close Editor, then use the \'create account\' link on the Sign In page)"
                                 };
                              }
                           })]};
                        }
                     }),new UIComponentDescriptor({
                        "type":HBox,
                        "id":"_ProjectsTab_HBox2",
                        "propertiesFactory":function():Object
                        {
                           return {
                              "percentWidth":100,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Label,
                                 "id":"_ProjectsTab_Label1"
                              }),new UIComponentDescriptor({
                                 "type":Spacer,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"width":40};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":TextInput,
                                 "id":"projectComment",
                                 "events":{"change":"__projectComment_change"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "percentWidth":100,
                                       "text":"",
                                       "maxChars":32,
                                       "toolTip":"Description of this project"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Spacer,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"width":40};
                                 }
                              })]
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Spacer,
                        "propertiesFactory":function():Object
                        {
                           return {"height":2};
                        }
                     }),new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function():Object
                        {
                           return {
                              "percentWidth":100,
                              "autoLayout":true,
                              "percentHeight":100,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":TabNavigator,
                                 "id":"panelTabNav",
                                 "stylesFactory":function():void
                                 {
                                    this.top = "0";
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "percentWidth":100,
                                       "childDescriptors":[new UIComponentDescriptor({
                                          "type":Panel,
                                          "id":"_ProjectsTab_Panel1",
                                          "stylesFactory":function():void
                                          {
                                             this.roundedBottomCorners = false;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "styleName":"flatPanel",
                                                "label":"Tiles",
                                                "percentWidth":100,
                                                "layout":"absolute",
                                                "horizontalScrollPolicy":"off",
                                                "verticalScrollPolicy":"off",
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":TileList,
                                                   "id":"tilePieceList",
                                                   "events":{"change":"__tilePieceList_change"},
                                                   "stylesFactory":function():void
                                                   {
                                                      this.borderStyle = "none";
                                                      this.backgroundAlpha = 0;
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "x":0,
                                                         "y":0,
                                                         "visible":true,
                                                         "percentWidth":100,
                                                         "percentHeight":100,
                                                         "itemRenderer":_ProjectsTab_ClassFactory1_c(),
                                                         "columnWidth":80,
                                                         "rowHeight":120,
                                                         "allowMultipleSelection":false,
                                                         "dragEnabled":true
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Text,
                                                   "id":"_ProjectsTab_Text2",
                                                   "stylesFactory":function():void
                                                   {
                                                      this.horizontalCenter = "0";
                                                      this.verticalCenter = "0";
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "width":400,
                                                         "height":90
                                                      };
                                                   }
                                                })]
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Panel,
                                          "id":"_ProjectsTab_Panel2",
                                          "stylesFactory":function():void
                                          {
                                             this.roundedBottomCorners = false;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "styleName":"flatPanel",
                                                "label":"Actors",
                                                "percentWidth":100,
                                                "layout":"absolute",
                                                "horizontalScrollPolicy":"off",
                                                "verticalScrollPolicy":"off",
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":TileList,
                                                   "id":"actorPieceList",
                                                   "events":{"change":"__actorPieceList_change"},
                                                   "stylesFactory":function():void
                                                   {
                                                      this.borderStyle = "none";
                                                      this.backgroundAlpha = 0;
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "visible":true,
                                                         "percentWidth":100,
                                                         "percentHeight":100,
                                                         "itemRenderer":_ProjectsTab_ClassFactory2_c(),
                                                         "columnWidth":80,
                                                         "rowHeight":120,
                                                         "allowMultipleSelection":false,
                                                         "dragEnabled":true
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Text,
                                                   "id":"_ProjectsTab_Text3",
                                                   "stylesFactory":function():void
                                                   {
                                                      this.horizontalCenter = "0";
                                                      this.verticalCenter = "0";
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "width":400,
                                                         "height":90
                                                      };
                                                   }
                                                })]
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Panel,
                                          "id":"_ProjectsTab_Panel3",
                                          "stylesFactory":function():void
                                          {
                                             this.roundedBottomCorners = false;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "styleName":"flatPanel",
                                                "label":"Maps",
                                                "percentWidth":100,
                                                "layout":"absolute",
                                                "horizontalScrollPolicy":"off",
                                                "verticalScrollPolicy":"off",
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":TileList,
                                                   "id":"mapPieceList",
                                                   "events":{"change":"__mapPieceList_change"},
                                                   "stylesFactory":function():void
                                                   {
                                                      this.borderStyle = "none";
                                                      this.backgroundAlpha = 0;
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "visible":true,
                                                         "percentWidth":100,
                                                         "percentHeight":100,
                                                         "itemRenderer":_ProjectsTab_ClassFactory3_c(),
                                                         "columnWidth":80,
                                                         "rowHeight":120,
                                                         "allowMultipleSelection":false,
                                                         "dragEnabled":true
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Text,
                                                   "id":"_ProjectsTab_Text4",
                                                   "stylesFactory":function():void
                                                   {
                                                      this.horizontalCenter = "0";
                                                      this.verticalCenter = "0";
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "width":400,
                                                         "height":90
                                                      };
                                                   }
                                                })]
                                             };
                                          }
                                       })]
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "id":"_ProjectsTab_Image1",
                                 "events":{
                                    "dragDrop":"___ProjectsTab_Image1_dragDrop",
                                    "dragEnter":"___ProjectsTab_Image1_dragEnter",
                                    "click":"___ProjectsTab_Image1_click"
                                 },
                                 "stylesFactory":function():void
                                 {
                                    this.top = "4";
                                    this.right = "100";
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "toolTip":"Delete items by dragging them to this trashcan",
                                       "width":48,
                                       "height":48,
                                       "source":_embed_mxml_Resources_trashcan2_png_1044093694,
                                       "filters":[_ProjectsTab_GlowFilter1_c()]
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "id":"_ProjectsTab_Image2",
                                 "events":{"click":"___ProjectsTab_Image2_click"},
                                 "stylesFactory":function():void
                                 {
                                    this.top = "0";
                                    this.right = "160";
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":64,
                                       "height":64,
                                       "source":_embed_mxml_Resources_NewObject_png_1074209160,
                                       "filters":[_ProjectsTab_GlowFilter2_c()]
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":LinkButton,
                                 "events":{"click":"___ProjectsTab_LinkButton1_click"},
                                 "stylesFactory":function():void
                                 {
                                    this.top = "0";
                                    this.left = "192";
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {"label":"Change/Create Project"};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "id":"_ProjectsTab_Image3",
                                 "events":{
                                    "dragDrop":"___ProjectsTab_Image3_dragDrop",
                                    "dragEnter":"___ProjectsTab_Image3_dragEnter"
                                 },
                                 "stylesFactory":function():void
                                 {
                                    this.top = "0";
                                    this.right = "20";
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":64,
                                       "height":64,
                                       "source":_embed_mxml_Resources_mail_png_652529630,
                                       "filters":[_ProjectsTab_GlowFilter3_c()]
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":BitmapDuper,
                                 "id":"projectLogoPreview",
                                 "events":{"doubleClick":"__projectLogoPreview_doubleClick"},
                                 "stylesFactory":function():void
                                 {
                                    this.horizontalCenter = "0";
                                    this.top = "0";
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":64,
                                       "height":64,
                                       "alpha":0.6,
                                       "doubleClickEnabled":true
                                    };
                                 }
                              })]
                           };
                        }
                     })]};
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
                  "id":"projectsTabBackgroundColor",
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
         _1314832319tilesPL = MgbCaches.getInstance().tilesPL;
         _1650536550actorsPL = MgbCaches.getInstance().actorsPL;
         _1081358637mapsPL = MgbCaches.getInstance().mapsPL;
         _1217010542mgbSession = MgbSession.getInstance();
         _1260658248mgbLogger = MgbLogger.getInstance();
         _940098729projectList = ProjectList.getInstance();
         _embed_mxml_Resources_NewObject_png_1074209160 = ProjectsTab__embed_mxml_Resources_NewObject_png_1074209160;
         _embed_mxml_Resources_mail_png_652529630 = ProjectsTab__embed_mxml_Resources_mail_png_652529630;
         _embed_mxml_Resources_trashcan2_png_1044093694 = ProjectsTab__embed_mxml_Resources_trashcan2_png_1044093694;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.horizontalScrollPolicy = "off";
         this.states = [_ProjectsTab_State1_c()];
         _ProjectsTab_DefaultTileListEffect1_i();
         _ProjectsTab_Fade1_i();
         this.addEventListener("creationComplete",___ProjectsTab_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ProjectsTab._watcherSetupUtil = param1;
      }
      
      public function ___ProjectsTab_Image1_click(param1:MouseEvent) : void
      {
         Alert.show("You can delete items by dragging them to this trashcan");
      }
      
      [Bindable(event="propertyChange")]
      public function get projectComment() : TextInput
      {
         return this._1769028870projectComment;
      }
      
      public function ___ProjectsTab_Image3_dragEnter(param1:DragEvent) : void
      {
         portalDragEnter(param1);
      }
      
      private function loadAndEditTile(param1:ListEvent) : void
      {
         var _loc2_:Object = param1.currentTarget.selectedItem;
         if(_loc2_)
         {
            mgbSession.navGotoTileMaker(_loc2_.name);
         }
      }
      
      private function trashcanDeleteTileComplete(param1:MgbTile, param2:int, param3:String) : void
      {
         if(!param2)
         {
            mgbLogger.logInfo("Tile \'" + param1.name + "\' deleted.",true);
         }
         else
         {
            mgbLogger.logError("Tile \'" + param1.name + "\' could not be deleted: " + param3,true);
         }
      }
      
      private function _ProjectsTab_GlowFilter1_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.6;
         _loc1_.blurX = 18;
         _loc1_.blurY = 18;
         return _loc1_;
      }
      
      private function _ProjectsTab_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_ProjectsTab_FormItem1_c());
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get createProjectButton() : Button
      {
         return this._144773105createProjectButton;
      }
      
      public function set projectComment(param1:TextInput) : void
      {
         var _loc2_:Object = this._1769028870projectComment;
         if(_loc2_ !== param1)
         {
            this._1769028870projectComment = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectComment",_loc2_,param1));
         }
      }
      
      public function __projectLogoPreview_doubleClick(param1:MouseEvent) : void
      {
         doubleClickProjectLogo(param1);
      }
      
      public function ___ProjectsTab_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         initControl();
      }
      
      private function _ProjectsTab_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = mgbSession.userLoggedInIsGuest;
         _loc1_ = mgbSession.userLoggedInIsGuest;
         _loc1_ = showMeSlowly;
         _loc1_ = "Project \'" + mgbSession.activeProject + "\' contains " + tilesPL.piecesAC.length + " Tiles, " + actorsPL.piecesAC.length + " Actors, " + mapsPL.piecesAC.length + " Maps";
         _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
         _loc1_ = mgbSession.userLoggedInIsGuest == false;
         _loc1_ = footer.height;
         _loc1_ = tilesPL.piecesAC.length + " Tiles in project \'" + mgbSession.activeProject + "\':";
         _loc1_ = MgbSystem.describeTileText;
         _loc1_ = tilesPL.piecesAC;
         _loc1_ = MgbSystem.describeClickText;
         _loc1_ = MgbSystem.describeTileText;
         _loc1_ = tilesPL.piecesAC.length == 0;
         _loc1_ = actorsPL.piecesAC.length + " Actors in project \'" + mgbSession.activeProject + "\':";
         _loc1_ = MgbSystem.describeActorText;
         _loc1_ = actorsPL.piecesAC;
         _loc1_ = MgbSystem.describeClickText;
         _loc1_ = MgbSystem.describeActorText;
         _loc1_ = actorsPL.piecesAC.length == 0;
         _loc1_ = mapsPL.piecesAC.length + " Maps in project \'" + mgbSession.activeProject + "\':";
         _loc1_ = MgbSystem.describeMapText;
         _loc1_ = mapsPL.piecesAC;
         _loc1_ = MgbSystem.describeClickText;
         _loc1_ = MgbSystem.describeMapText;
         _loc1_ = mapsPL.piecesAC.length == 0;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = "Create new " + panelTabNav.selectedChild.label;
         _loc1_ = "Drag \'" + panelTabNav.selectedChild.label + "\' here to send them to another MGB user ";
         _loc1_ = panelTabNav.selectedIndex == 0;
         _loc1_ = showMeSlowly;
         _loc1_ = MgbSystem.describeProjectLogoText;
         _loc1_ = MgbSystem.restrictCharactersInItemname;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = projectList.projectNamesAC;
      }
      
      public function set createProjectButton(param1:Button) : void
      {
         var _loc2_:Object = this._144773105createProjectButton;
         if(_loc2_ !== param1)
         {
            this._144773105createProjectButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createProjectButton",_loc2_,param1));
         }
      }
      
      private function trashcanConfirmHandler(param1:CloseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:MgbActor = null;
         var _loc4_:MgbTile = null;
         var _loc5_:MgbMap = null;
         if(param1.detail == Alert.YES)
         {
            _loc2_ = trashConfirmDragEvent.dragSource.dataForFormat("items") as Array;
            if(Object(trashConfirmDragEvent.dragInitiator) == Object(actorPieceList))
            {
               _loc3_ = new MgbActor();
               _loc3_.onErrorIssueAlert = false;
               _loc3_.destroyPiece(_loc2_[0].name,trashcanDeleteActorComplete);
            }
            else if(Object(trashConfirmDragEvent.dragInitiator) == Object(tilePieceList))
            {
               (_loc4_ = new MgbTile()).onErrorIssueAlert = false;
               _loc4_.destroyPiece(_loc2_[0].name,trashcanDeleteTileComplete);
            }
            else if(Object(trashConfirmDragEvent.dragInitiator) == Object(mapPieceList))
            {
               (_loc5_ = new MgbMap()).onErrorIssueAlert = false;
               _loc5_.destroyPiece(_loc2_[0].name,trashcanDeleteMapComplete);
               mgbSession.gameStats.deleteGamestatusIfExists(mgbSession.userName,mgbSession.activeProject,_loc2_[0].name);
            }
         }
         trashConfirmAlert = null;
         trashConfirmDragEvent = null;
      }
      
      private function saveUpdatedProjectComment() : void
      {
         if(mgbSession.activeProject != null)
         {
            Application.application.updateUserProfile("projectComment-" + mgbSession.activeProject,projectComment.text);
            projectComment.focusEnabled = false;
         }
      }
      
      private function initControl() : void
      {
         Application.application.registerForProfileUpdates(applyProfile);
         if(footer)
         {
            footer.nukeSlider();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loggedinMainVbox() : VBox
      {
         return this._334368309loggedinMainVbox;
      }
      
      private function doChooseProject(param1:String, param2:Boolean) : void
      {
         var _loc3_:Boolean = true;
         var _loc4_:int = -1;
         var _loc5_:int = 0;
         while(_loc5_ < projectList.projectNamesAC.length && _loc4_ == -1)
         {
            if(projectList.projectNamesAC[_loc5_].project == param1)
            {
               _loc4_ = _loc5_;
            }
            _loc5_++;
         }
         if(param2 == true && _loc4_ != -1)
         {
            Alert.show("Project \'" + param1 + "\' already exists. Use the \'Choose Project\' button if you wish to use the existing project with this name");
            return;
         }
         if(param2 == false && _loc4_ == -1)
         {
            Alert.show("Project \'" + param1 + "\' does not exist. Enter a new project name and then press the \'Create new Project\' button if you wish to create a new project with this name");
            return;
         }
         if(_loc3_ && param2)
         {
            _loc3_ = Boolean(mgbSession.createNewProject(param1));
         }
         if(_loc3_)
         {
            mgbSession.activeProject = param1;
            applyProfile();
         }
         currentState = "";
      }
      
      public function __projectComment_change(param1:Event) : void
      {
         saveUpdatedProjectComment();
      }
      
      private function _ProjectsTab_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "Cancel";
         _loc1_.addEventListener("click",___ProjectsTab_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set projectsTabBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._1878170778projectsTabBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._1878170778projectsTabBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectsTabBackgroundColor",_loc2_,param1));
         }
      }
      
      public function set tilePieceList(param1:TileList) : void
      {
         var _loc2_:Object = this._353928802tilePieceList;
         if(_loc2_ !== param1)
         {
            this._353928802tilePieceList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilePieceList",_loc2_,param1));
         }
      }
      
      public function __mapPieceList_change(param1:ListEvent) : void
      {
         loadAndEditMap(param1);
      }
      
      [Bindable(event="propertyChange")]
      private function get tilesPL() : PieceList
      {
         return this._1314832319tilesPL;
      }
      
      public function ___ProjectsTab_Image2_click(param1:MouseEvent) : void
      {
         CreateNewThing(panelTabNav.selectedChild.label);
      }
      
      private function _ProjectsTab_ClassFactory3_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = RendererMapPiece;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPieceList() : TileList
      {
         return this._608723511actorPieceList;
      }
      
      private function updateWithLoginInfo() : void
      {
         if(footer)
         {
            footer.nukeSlider();
         }
      }
      
      private function changeProject() : void
      {
         currentState = "SelectProject";
      }
      
      private function trashcanDragEnter(param1:DragEvent) : void
      {
         var _loc2_:Image = Image(param1.currentTarget);
         if(param1.dragSource.hasFormat("items"))
         {
            DragManager.acceptDragDrop(_loc2_);
         }
      }
      
      public function set showMeSlowly(param1:Fade) : void
      {
         var _loc2_:Object = this._2058736931showMeSlowly;
         if(_loc2_ !== param1)
         {
            this._2058736931showMeSlowly = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showMeSlowly",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chosenProject() : TextInput
      {
         return this._461896519chosenProject;
      }
      
      [Bindable(event="propertyChange")]
      public function get showMeSlowly() : Fade
      {
         return this._2058736931showMeSlowly;
      }
      
      private function trashcanDeleteMapComplete(param1:MgbMap, param2:int, param3:String) : void
      {
         if(!param2)
         {
            mgbLogger.logInfo("Map \'" + param1.name + "\' deleted.",true);
         }
         else
         {
            mgbLogger.logError("Map \'" + param1.name + "\' could not be deleted: " + param3,true);
         }
      }
      
      private function set actorsPL(param1:PieceList) : void
      {
         var _loc2_:Object = this._1650536550actorsPL;
         if(_loc2_ !== param1)
         {
            this._1650536550actorsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorsPL",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get projectList() : ProjectList
      {
         return this._940098729projectList;
      }
      
      public function __tilePieceList_change(param1:ListEvent) : void
      {
         loadAndEditTile(param1);
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
      
      private function applyProfile(param1:Event = null) : void
      {
         var _loc2_:String = null;
         if(Boolean(projectComment) && mgbSession.activeProject != null)
         {
            _loc2_ = String(Application.application.getUserProfile("projectComment-" + mgbSession.activeProject));
            projectComment.text = !!_loc2_ ? _loc2_ : "";
         }
         if(Boolean(projectLogoPreview) && Boolean(mgbSession.userName))
         {
            projectLogoPreview.drawDupeFromName(mgbSession.userName,mgbSession.activeProject,MgbSystem.projectLogoName,"",true);
         }
      }
      
      private function _ProjectsTab_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         showMeSlowly = _loc1_;
         _loc1_.duration = 260;
         return _loc1_;
      }
      
      public function set mapPieceList(param1:TileList) : void
      {
         var _loc2_:Object = this._262359728mapPieceList;
         if(_loc2_ !== param1)
         {
            this._262359728mapPieceList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapPieceList",_loc2_,param1));
         }
      }
      
      private function _ProjectsTab_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         createProjectButton = _loc1_;
         _loc1_.label = "Create new project";
         _loc1_.enabled = false;
         _loc1_.toolTip = "To create a new project, enter the name in the \'Change to project\' field above, then click this button";
         _loc1_.addEventListener("click",__createProjectButton_click);
         _loc1_.id = "createProjectButton";
         BindingManager.executeBindings(this,"createProjectButton",createProjectButton);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function CreateNewThing(param1:String) : void
      {
         switch(param1.toLowerCase())
         {
            case "tiles":
               mgbSession.navGotoTileMaker();
               Application.application.tileMaker.chooseNewTile();
               break;
            case "actors":
               mgbSession.navGotoActorMaker();
               Application.application.actorMaker.newActor();
               break;
            case "maps":
               mgbSession.navGotoMapMaker();
               Application.application.mapMaker.chooseNewMap();
         }
      }
      
      private function _ProjectsTab_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ProjectsTab_Text1.includeInLayout = param1;
         },"_ProjectsTab_Text1.includeInLayout");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ProjectsTab_Text1.visible = param1;
         },"_ProjectsTab_Text1.visible");
         result[1] = binding;
         binding = new Binding(this,function():*
         {
            return showMeSlowly;
         },function(param1:*):void
         {
            _ProjectsTab_HBox2.setStyle("showEffect",param1);
         },"_ProjectsTab_HBox2.showEffect");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Project \'" + mgbSession.activeProject + "\' contains " + tilesPL.piecesAC.length + " Tiles, " + actorsPL.piecesAC.length + " Actors, " + mapsPL.piecesAC.length + " Maps";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Label1.text = param1;
         },"_ProjectsTab_Label1.text");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.restrictCharactersInCommentStrings;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            projectComment.restrict = param1;
         },"projectComment.restrict");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userLoggedInIsGuest == false;
         },function(param1:Boolean):void
         {
            projectComment.editable = param1;
         },"projectComment.editable");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = footer.height;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            panelTabNav.setStyle("bottom",param1);
         },"panelTabNav.bottom");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = tilesPL.piecesAC.length + " Tiles in project \'" + mgbSession.activeProject + "\':";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Panel1.title = param1;
         },"_ProjectsTab_Panel1.title");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeTileText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Panel1.toolTip = param1;
         },"_ProjectsTab_Panel1.toolTip");
         result[8] = binding;
         binding = new Binding(this,function():Object
         {
            return tilesPL.piecesAC;
         },function(param1:Object):void
         {
            tilePieceList.dataProvider = param1;
         },"tilePieceList.dataProvider");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeClickText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            tilePieceList.toolTip = param1;
         },"tilePieceList.toolTip");
         result[10] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeTileText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Text2.text = param1;
         },"_ProjectsTab_Text2.text");
         result[11] = binding;
         binding = new Binding(this,function():Boolean
         {
            return tilesPL.piecesAC.length == 0;
         },function(param1:Boolean):void
         {
            _ProjectsTab_Text2.visible = param1;
         },"_ProjectsTab_Text2.visible");
         result[12] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = actorsPL.piecesAC.length + " Actors in project \'" + mgbSession.activeProject + "\':";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Panel2.title = param1;
         },"_ProjectsTab_Panel2.title");
         result[13] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeActorText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Panel2.toolTip = param1;
         },"_ProjectsTab_Panel2.toolTip");
         result[14] = binding;
         binding = new Binding(this,function():Object
         {
            return actorsPL.piecesAC;
         },function(param1:Object):void
         {
            actorPieceList.dataProvider = param1;
         },"actorPieceList.dataProvider");
         result[15] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeClickText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            actorPieceList.toolTip = param1;
         },"actorPieceList.toolTip");
         result[16] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeActorText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Text3.text = param1;
         },"_ProjectsTab_Text3.text");
         result[17] = binding;
         binding = new Binding(this,function():Boolean
         {
            return actorsPL.piecesAC.length == 0;
         },function(param1:Boolean):void
         {
            _ProjectsTab_Text3.visible = param1;
         },"_ProjectsTab_Text3.visible");
         result[18] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = mapsPL.piecesAC.length + " Maps in project \'" + mgbSession.activeProject + "\':";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Panel3.title = param1;
         },"_ProjectsTab_Panel3.title");
         result[19] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeMapText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Panel3.toolTip = param1;
         },"_ProjectsTab_Panel3.toolTip");
         result[20] = binding;
         binding = new Binding(this,function():Object
         {
            return mapsPL.piecesAC;
         },function(param1:Object):void
         {
            mapPieceList.dataProvider = param1;
         },"mapPieceList.dataProvider");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeClickText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            mapPieceList.toolTip = param1;
         },"mapPieceList.toolTip");
         result[22] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeMapText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Text4.text = param1;
         },"_ProjectsTab_Text4.text");
         result[23] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mapsPL.piecesAC.length == 0;
         },function(param1:Boolean):void
         {
            _ProjectsTab_Text4.visible = param1;
         },"_ProjectsTab_Text4.visible");
         result[24] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ProjectsTab_Image1.visible = param1;
         },"_ProjectsTab_Image1.visible");
         result[25] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ProjectsTab_Image2.visible = param1;
         },"_ProjectsTab_Image2.visible");
         result[26] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Create new " + panelTabNav.selectedChild.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Image2.toolTip = param1;
         },"_ProjectsTab_Image2.toolTip");
         result[27] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Drag \'" + panelTabNav.selectedChild.label + "\' here to send them to another MGB user ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProjectsTab_Image3.toolTip = param1;
         },"_ProjectsTab_Image3.toolTip");
         result[28] = binding;
         binding = new Binding(this,function():Boolean
         {
            return panelTabNav.selectedIndex == 0;
         },function(param1:Boolean):void
         {
            _ProjectsTab_Image3.visible = param1;
         },"_ProjectsTab_Image3.visible");
         result[29] = binding;
         binding = new Binding(this,function():*
         {
            return showMeSlowly;
         },function(param1:*):void
         {
            projectLogoPreview.setStyle("showEffect",param1);
         },"projectLogoPreview.showEffect");
         result[30] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.describeProjectLogoText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            projectLogoPreview.toolTip = param1;
         },"projectLogoPreview.toolTip");
         result[31] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.restrictCharactersInItemname;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            chosenProject.restrict = param1;
         },"chosenProject.restrict");
         result[32] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            createProjectButton.visible = param1;
         },"createProjectButton.visible");
         result[33] = binding;
         binding = new Binding(this,function():Object
         {
            return projectList.projectNamesAC;
         },function(param1:Object):void
         {
            projectSelectDataGrid.dataProvider = param1;
         },"projectSelectDataGrid.dataProvider");
         result[34] = binding;
         return result;
      }
      
      public function set actorPieceList(param1:TileList) : void
      {
         var _loc2_:Object = this._608723511actorPieceList;
         if(_loc2_ !== param1)
         {
            this._608723511actorPieceList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPieceList",_loc2_,param1));
         }
      }
      
      private function _ProjectsTab_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LoginActorPreviewControl;
         return _loc1_;
      }
      
      public function __projectSelectDataGrid_change(param1:ListEvent) : void
      {
         chosenProject.text = projectSelectDataGrid.selectedItem.project;
         updateProjectListButtons();
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function set mgbLogger(param1:MgbLogger) : void
      {
         var _loc2_:Object = this._1260658248mgbLogger;
         if(_loc2_ !== param1)
         {
            this._1260658248mgbLogger = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbLogger",_loc2_,param1));
         }
      }
      
      public function __createProjectButton_click(param1:MouseEvent) : void
      {
         doChooseProject(chosenProject.text,true);
      }
      
      public function set loggedinMainVbox(param1:VBox) : void
      {
         var _loc2_:Object = this._334368309loggedinMainVbox;
         if(_loc2_ !== param1)
         {
            this._334368309loggedinMainVbox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loggedinMainVbox",_loc2_,param1));
         }
      }
      
      private function _ProjectsTab_FormItem1_c() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.label = "Change to Project:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_ProjectsTab_TextInput2_i());
         return _loc1_;
      }
      
      public function __chooseProjectButton_click(param1:MouseEvent) : void
      {
         doChooseProject(chosenProject.text,false);
      }
      
      private function _ProjectsTab_VBox2_c() : VBox
      {
         var _loc1_:VBox = new VBox();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_ProjectsTab_Form1_c());
         _loc1_.addChild(_ProjectsTab_HBox3_c());
         _loc1_.addChild(_ProjectsTab_DataGrid1_i());
         return _loc1_;
      }
      
      private function _ProjectsTab_DefaultTileListEffect1_i() : DefaultTileListEffect
      {
         var _loc1_:DefaultTileListEffect = new DefaultTileListEffect();
         myTileListEffect = _loc1_;
         _loc1_.fadeOutDuration = 400;
         _loc1_.fadeInDuration = 400;
         _loc1_.moveDuration = 1200;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get panelTabNav() : TabNavigator
      {
         return this._1260204146panelTabNav;
      }
      
      private function _ProjectsTab_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         chosenProject = _loc1_;
         _loc1_.width = 140;
         _loc1_.text = "";
         _loc1_.addEventListener("change",__chosenProject_change);
         _loc1_.id = "chosenProject";
         BindingManager.executeBindings(this,"chosenProject",chosenProject);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ProjectsTab_Image1_dragEnter(param1:DragEvent) : void
      {
         trashcanDragEnter(param1);
      }
      
      public function __chosenProject_change(param1:Event) : void
      {
         updateProjectListButtons();
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
      
      private function _ProjectsTab_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Project size (KB)";
         _loc1_.dataField = "simpleSizeKB";
         return _loc1_;
      }
      
      public function set chosenProject(param1:TextInput) : void
      {
         var _loc2_:Object = this._461896519chosenProject;
         if(_loc2_ !== param1)
         {
            this._461896519chosenProject = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chosenProject",_loc2_,param1));
         }
      }
      
      private function _ProjectsTab_GlowFilter3_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 255;
         _loc1_.alpha = 0.6;
         _loc1_.blurX = 16;
         _loc1_.blurY = 16;
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ProjectsTab = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ProjectsTab_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ProjectsTabWatcherSetupUtil");
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
      
      public function ___ProjectsTab_Image1_dragDrop(param1:DragEvent) : void
      {
         trashcanDragDrop(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get projectsTabBackgroundColor() : SelectBackgroundColor
      {
         return this._1878170778projectsTabBackgroundColor;
      }
      
      [Bindable(event="propertyChange")]
      public function get footer() : EditFooterComponent
      {
         return this._1268861541footer;
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePieceList() : TileList
      {
         return this._353928802tilePieceList;
      }
      
      private function loadAndEditMap(param1:ListEvent) : void
      {
         var _loc2_:Object = param1.currentTarget.selectedItem;
         if(_loc2_)
         {
            mgbSession.navGotoMapMaker(_loc2_.name);
         }
      }
      
      private function set tilesPL(param1:PieceList) : void
      {
         var _loc2_:Object = this._1314832319tilesPL;
         if(_loc2_ !== param1)
         {
            this._1314832319tilesPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilesPL",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get projectSelectDataGrid() : DataGrid
      {
         return this._1740971685projectSelectDataGrid;
      }
      
      public function ___ProjectsTab_Button3_click(param1:MouseEvent) : void
      {
         currentState = "";
      }
      
      private function _ProjectsTab_Spacer4_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set projectLogoPreview(param1:BitmapDuper) : void
      {
         var _loc2_:Object = this._429542716projectLogoPreview;
         if(_loc2_ !== param1)
         {
            this._429542716projectLogoPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectLogoPreview",_loc2_,param1));
         }
      }
      
      private function trashcanDeleteActorComplete(param1:MgbActor, param2:int, param3:String) : void
      {
         if(!param2)
         {
            mgbLogger.logInfo("Actor \'" + param1.name + "\' deleted.",true);
         }
         else
         {
            mgbLogger.logError("Actor \'" + param1.name + "\' could not be deleted: " + param3,true);
         }
      }
      
      private function doubleClickProjectLogo(param1:Event) : void
      {
         mgbSession.navGotoTileMaker(MgbSystem.projectLogoName);
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
      
      private function _ProjectsTab_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LoginTilePreviewControl;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get actorsPL() : PieceList
      {
         return this._1650536550actorsPL;
      }
      
      private function _ProjectsTab_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         chooseProjectButton = _loc1_;
         _loc1_.label = "Choose project";
         _loc1_.addEventListener("click",__chooseProjectButton_click);
         _loc1_.id = "chooseProjectButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProjectsTab_Panel4_c() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.width = 400;
         _loc1_.height = 400;
         _loc1_.layout = "absolute";
         _loc1_.x = 150;
         _loc1_.y = 70;
         _loc1_.alpha = 1;
         _loc1_.title = "Change or create project";
         _loc1_.setStyle("borderAlpha",0.9);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_ProjectsTab_VBox2_c());
         return _loc1_;
      }
      
      private function _ProjectsTab_HBox3_c() : HBox
      {
         var _loc1_:HBox = new HBox();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_ProjectsTab_Spacer4_c());
         _loc1_.addChild(_ProjectsTab_Button1_i());
         _loc1_.addChild(_ProjectsTab_Button2_i());
         _loc1_.addChild(_ProjectsTab_Button3_c());
         return _loc1_;
      }
      
      public function __projectSelectDataGrid_doubleClick(param1:MouseEvent) : void
      {
         doChooseProject(chosenProject.text,false);
      }
      
      private function set mapsPL(param1:PieceList) : void
      {
         var _loc2_:Object = this._1081358637mapsPL;
         if(_loc2_ !== param1)
         {
            this._1081358637mapsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapsPL",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mapPieceList() : TileList
      {
         return this._262359728mapPieceList;
      }
      
      public function set chooseProjectButton(param1:Button) : void
      {
         var _loc2_:Object = this._1819115220chooseProjectButton;
         if(_loc2_ !== param1)
         {
            this._1819115220chooseProjectButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chooseProjectButton",_loc2_,param1));
         }
      }
      
      private function _ProjectsTab_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "SelectProject";
         _loc1_.overrides = [_ProjectsTab_AddChild1_c()];
         return _loc1_;
      }
      
      public function ___ProjectsTab_LinkButton1_click(param1:MouseEvent) : void
      {
         changeProject();
      }
      
      private function _ProjectsTab_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Project";
         _loc1_.dataField = "project";
         return _loc1_;
      }
      
      private function portalDragDrop(param1:DragEvent) : void
      {
         var _loc2_:Array = param1.dragSource.dataForFormat("items") as Array;
         if(Object(param1.dragInitiator) == Object(actorPieceList))
         {
            mgbSession.navSendPiece(Piece.MGB_ACTOR,_loc2_[0].name);
         }
         else if(Object(param1.dragInitiator) == Object(tilePieceList))
         {
            mgbSession.navSendPiece(Piece.MGB_TILE,_loc2_[0].name);
         }
         else if(Object(param1.dragInitiator) == Object(mapPieceList))
         {
            mgbSession.navSendPiece(Piece.MGB_MAP,_loc2_[0].name);
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbLogger() : MgbLogger
      {
         return this._1260658248mgbLogger;
      }
      
      private function updateProjectListButtons() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < projectList.projectNamesAC.length && !_loc1_)
         {
            if(chosenProject.text == projectList.projectNamesAC[_loc2_].project)
            {
               _loc1_ = true;
            }
            _loc2_++;
         }
         chooseProjectButton.enabled = _loc1_;
         createProjectButton.enabled = !_loc1_ && chosenProject.text.length > 0;
      }
      
      private function _ProjectsTab_GlowFilter2_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 255;
         _loc1_.alpha = 0.6;
         _loc1_.blurX = 16;
         _loc1_.blurY = 16;
         return _loc1_;
      }
      
      public function ___ProjectsTab_Image3_dragDrop(param1:DragEvent) : void
      {
         portalDragDrop(param1);
      }
      
      private function faultHandler(param1:FaultEvent) : void
      {
         mgbLogger.logError("My Game Builder seems to be offline. Try again later. Error message was \'" + param1.fault.faultString + "\'",true);
      }
      
      public function __actorPieceList_change(param1:ListEvent) : void
      {
         loadAndEditActor(param1);
      }
      
      public function set myTileListEffect(param1:DefaultTileListEffect) : void
      {
         var _loc2_:Object = this._446328343myTileListEffect;
         if(_loc2_ !== param1)
         {
            this._446328343myTileListEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myTileListEffect",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get projectLogoPreview() : BitmapDuper
      {
         return this._429542716projectLogoPreview;
      }
      
      private function _ProjectsTab_DataGrid1_i() : DataGrid
      {
         var _loc1_:DataGrid = new DataGrid();
         projectSelectDataGrid = _loc1_;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.doubleClickEnabled = true;
         _loc1_.columns = [_ProjectsTab_DataGridColumn1_c(),_ProjectsTab_DataGridColumn2_c()];
         _loc1_.addEventListener("change",__projectSelectDataGrid_change);
         _loc1_.addEventListener("doubleClick",__projectSelectDataGrid_doubleClick);
         _loc1_.id = "projectSelectDataGrid";
         BindingManager.executeBindings(this,"projectSelectDataGrid",projectSelectDataGrid);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get chooseProjectButton() : Button
      {
         return this._1819115220chooseProjectButton;
      }
      
      public function set panelTabNav(param1:TabNavigator) : void
      {
         var _loc2_:Object = this._1260204146panelTabNav;
         if(_loc2_ !== param1)
         {
            this._1260204146panelTabNav = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panelTabNav",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myTileListEffect() : DefaultTileListEffect
      {
         return this._446328343myTileListEffect;
      }
      
      [Bindable(event="propertyChange")]
      private function get mapsPL() : PieceList
      {
         return this._1081358637mapsPL;
      }
      
      private function _ProjectsTab_AddChild1_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_ProjectsTab_Panel4_c);
         return _loc1_;
      }
      
      private function loadAndEditActor(param1:ListEvent) : void
      {
         var _loc2_:Object = param1.currentTarget.selectedItem;
         if(_loc2_)
         {
            mgbSession.navGotoActorMaker(_loc2_.name);
         }
      }
      
      private function trashcanDragDrop(param1:DragEvent) : void
      {
         if(null != trashConfirmAlert)
         {
            return;
         }
         if(mgbSession.userLoggedInIsGuest)
         {
            Alert.show("The guest account is not allowed to delete game pieces. If you sign up for your own account, you will be able to use the trashcan to delete your own game pieces");
            return;
         }
         var _loc2_:Array = param1.dragSource.dataForFormat("items") as Array;
         trashConfirmAlert = Alert.show("Do you really want to delete \'" + _loc2_[0].name + "\'? There is no way to get it back after you delete.","DELETE - Are You Sure?",Alert.YES | Alert.NO,null,trashcanConfirmHandler,null,Alert.NO);
         trashConfirmAlert.alpha = 1;
         trashConfirmDragEvent = param1;
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
      
      private function portalDragEnter(param1:DragEvent) : void
      {
         var _loc2_:Image = Image(param1.currentTarget);
         if(param1.dragSource.hasFormat("items"))
         {
            DragManager.acceptDragDrop(_loc2_);
         }
      }
   }
}
