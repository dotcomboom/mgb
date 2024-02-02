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
   import mx.containers.ApplicationControlBar;
   import mx.containers.Canvas;
   import mx.containers.Form;
   import mx.containers.FormItem;
   import mx.containers.HBox;
   import mx.containers.Panel;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.*;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.*;
   import mx.effects.WipeDown;
   import mx.effects.WipeRight;
   import mx.effects.WipeUp;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.NumericStepperEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.rpc.events.*;
   import mx.rpc.http.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ActorMakerControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _743372977ui_itemOrNPC_dropsObjectWhenKilledChance:NumericStepper;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _219101459fi_allchar_rightYN:FormItem;
      
      private var _1799886535ui_npc_dropsObjectOnChoice3:TextInput;
      
      private var _1097044297mainViewStackEnabled:Boolean = false;
      
      private var _1722076124fi_item_useText:FormItem;
      
      private var _78678657actorDestData:XML;
      
      private var _1201781094ui_itemOrNPC_dropsObjectWhenKilledName:TextInput;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var _ActorMakerControl_HBox3:HBox;
      
      public var _ActorMakerControl_HBox4:HBox;
      
      public var _ActorMakerControl_HBox5:HBox;
      
      public var _ActorMakerControl_HBox6:HBox;
      
      public var _ActorMakerControl_HBox7:HBox;
      
      public var _ActorMakerControl_HBox8:HBox;
      
      public var _ActorMakerControl_HBox9:HBox;
      
      private var _1590501763ui_allchar_upYN:ComboBox;
      
      private var _1886001010ui_npc_movementType:ComboBox;
      
      private var _1207526179fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum:FormItem;
      
      private var _1186451111pageConditions:Canvas;
      
      private var _1943315021ButtonHelp:Button;
      
      private var _1114003694fi_item_gainExtraLifeYN:FormItem;
      
      private var _439452261ui_item_equippedNewShotActor:TextInput;
      
      private var _1258400666fi_item_pushToSlideNum:FormItem;
      
      private var _537959013tileSummaryText:Text;
      
      private var _444139843fi_itemOrNPC_dropsObjectWhenKilledName2:FormItem;
      
      private var _782797953fi_item_squishNPCYN:FormItem;
      
      private var _1575810953ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum:NumericStepper;
      
      private var _1608346234ui_allchar_meleeDamageToPlayerNum:NumericStepper;
      
      private var _970025994ui_item_inventoryEquippableYN:ComboBox;
      
      private var _461583785ButtonChooseTile:Button;
      
      private var _444433311ui_npc_TalkTextFontIndex:ComboBox;
      
      private var _217676256ui_item_equippedNewActorGraphics:TextInput;
      
      private var _2115933205ui_all_visualEffectWhenKilledType:ComboBox;
      
      public var _ActorMakerControl_FormItem5:FormItem;
      
      private var _1531064799ui_npc_responseChoice3Stay:ComboBox;
      
      private var _583619092fi_item_equippedNewMeleeSound:FormItem;
      
      public var _ActorMakerControl_VBox1:VBox;
      
      private var _89797575ui_allchar_shotRateNum:NumericStepper;
      
      private var _2066104130actorSummaryText:Text;
      
      private var _1112499891okForActive:String;
      
      private var _1222971771ui_item_equippedNewMeleeSound:ComboBox;
      
      private var _embed_mxml_Resources_SaveIcon_png_953805992:Class;
      
      private var _836564869fi_item_inventoryEquippableYN:FormItem;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _260565178ui_all_actorType:ComboBox;
      
      private var _889053569ui_item_equippedNewShotRateBonusNum:NumericStepper;
      
      private var _394931005ui_item_visualEffectWhenUsedType:ComboBox;
      
      private var _773014111ui_allchar_movementSpeedNum:NumericStepper;
      
      public var _ActorMakerControl_LinkButton1:LinkButton;
      
      public var _ActorMakerControl_LinkButton2:LinkButton;
      
      public var _ActorMakerControl_LinkButton4:LinkButton;
      
      public var _ActorMakerControl_LinkButton5:LinkButton;
      
      public var _ActorMakerControl_LinkButton6:LinkButton;
      
      public var _ActorMakerControl_LinkButton7:LinkButton;
      
      public var _ActorMakerControl_LinkButton9:LinkButton;
      
      private var _1569725757ui_itemOrNPC_dropsObjectWhenKilledChance2:NumericStepper;
      
      public var _ActorMakerControl_Text13:Text;
      
      public var _ActorMakerControl_Text14:Text;
      
      public var _ActorMakerControl_Text15:Text;
      
      public var _ActorMakerControl_Text16:Text;
      
      public var _ActorMakerControl_LinkButton8:LinkButton;
      
      public var _ActorMakerControl_LinkButton3:LinkButton;
      
      private var _1492195071ui_all_visualEffectWhenHarmedType:ComboBox;
      
      private var _1532045538ui_npc_saysWhatOnChoice3:TextInput;
      
      private var _embed_mxml_Resources_LoadIcon_png_989977250:Class;
      
      public var _ActorMakerControl_Text21:Text;
      
      public var _ActorMakerControl_Text22:Text;
      
      public var _ActorMakerControl_Text23:Text;
      
      public var _ActorMakerControl_Text24:Text;
      
      private var _342764654fi_all_sound_when_harmed:FormItem;
      
      public var _ActorMakerControl_Text29:Text;
      
      private var _1488305143ui_item_keyForThisDoor:TextInput;
      
      public var _ActorMakerControl_Text30:Text;
      
      public var _ActorMakerControl_Text32:Text;
      
      public var _ActorMakerControl_Text34:Text;
      
      public var _ActorMakerControl_Text35:Text;
      
      public var _ActorMakerControl_Text36:Text;
      
      private var _2030811370animationGrid:DataGrid;
      
      private var _1896282643ui_all_soundWhenHarmed:ComboBox;
      
      private var _2098507879fi_item_increasesMaxHealthNum:FormItem;
      
      private var _292515455recentSuggestedTileName:String = null;
      
      private var _1532911841ui_npc_responseChoice1Stay:ComboBox;
      
      private var _1022854902ui_allchar_downYN:ComboBox;
      
      private var _1488715263ui_npc_takesObjectCountOnChoice2Num:NumericStepper;
      
      private var _1238862778hbox_item_keyForThisDoor:HBox;
      
      private var _1696365069fi_all_healEffect:FormItem;
      
      private var _1688993791fi_all_harmEffect:FormItem;
      
      private var _2015528174ButtonNew:Button;
      
      private var _126090114ui_npc_TalkText:TextArea;
      
      private var _1347758584ui_npc_aggroRange:NumericStepper;
      
      private var _1763226861fi_item_equippedNewShotRangeBonus:FormItem;
      
      private var _147472609ui_itemOrNPC_dropsObjectRandomlyName:TextInput;
      
      private var _1626512987okForBackground:String;
      
      private var _345951330fi_all_sound_when_healed:FormItem;
      
      private var _492380337ui_item_healOrHarmWhenUsedNum:NumericStepper;
      
      private var _7296354ui_item_squishPlayerYN:ComboBox;
      
      private var _1778337638animationEntryPreview:DataGridColumn;
      
      private const notYet:String = "Oh... this option does not yet function in the game engine. Our tame gnome is working as fast as possible to get this bit working soon!";
      
      private var _1531988320ui_npc_responseChoice2Stay:ComboBox;
      
      private var _1834305578fi_item_equippedNewMeleeRepeatDelayModifierNum:FormItem;
      
      private var _152336123fi_allchar_downYN:FormItem;
      
      private var _670658634ui_npc_responseChoice2DropPersistsYN:ComboBox;
      
      private var _3366279myWR:WipeRight;
      
      private var _1767650137ui_allchar_meleeRepeatDelay:NumericStepper;
      
      private var _1065255657fi_all_killEffect:FormItem;
      
      private var _820144040ui_npc_responseChoice3:TextInput;
      
      private var _896389596fi_item_equippedNewShotSound:FormItem;
      
      private var _797619652fi_item_gainOrLosePointsNum:FormItem;
      
      private var _560364460ui_item_keyForThisDoorConsumedYN:ComboBox;
      
      private var _1632661926ui_all_gravityYN:ComboBox;
      
      private var _641752135ui_allchar_soundWhenShooting:ComboBox;
      
      private var _435860568fi_all_sound_when_killed:FormItem;
      
      private var _803566126pageNPC:Canvas;
      
      private var _561852642ui_item_winLevelYN:ComboBox;
      
      public var _ActorMakerControl_HBox10:HBox;
      
      public var _ActorMakerControl_HBox11:HBox;
      
      public var _ActorMakerControl_HBox12:HBox;
      
      public var _ActorMakerControl_HBox13:HBox;
      
      public var _ActorMakerControl_HBox14:HBox;
      
      private var _embed_mxml_Resources_NewIcon_png_1810360004:Class;
      
      private var _673888894ui_allchar_pushYN:ComboBox;
      
      private var _1696893023ui_all_initialMaxHealthNum:NumericStepper;
      
      private var _1087460968ui_allchar_touchDamageCases:ComboBox;
      
      private var _1263965307ui_item_equippedNewMeleeRepeatDelayModifierNum:NumericStepper;
      
      private var _223166141fi_item_gainPowerSecondsNum:FormItem;
      
      private var _329356167fi_allchar_jumpYN:FormItem;
      
      private var _296058168ui_itemOrNPC_dropsObjectRandomlyChance:NumericStepper;
      
      private var _501302131fi_allchar_pushYN:FormItem;
      
      mx_internal var _bindings:Array;
      
      private var _1757821242fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum:FormItem;
      
      private var _1528989413ui_allchar_touchDamageToNPCorItemNum:NumericStepper;
      
      private var _439576655ui_all_initialHealthNum:NumericStepper;
      
      private var _2098866646ui_npc_takeObjectTypeOnChoice3:ComboBox;
      
      public var _ActorMakerControl_TextArea3:TextArea;
      
      private var _913669945fi_item_equippedNewMeleeDamageBonusNum:FormItem;
      
      private var _238171945ui_allchar_touchDamageAttackChance:NumericStepper;
      
      private var _1470857069fi_item_itemActivationType:FormItem;
      
      private var _662794638fi_itemOrNPC_dropsObjectRandomlyName:FormItem;
      
      private var _308144462fi_item_visualEffectWhenUsedType:FormItem;
      
      private var _1970182061ui_item_inventoryEquipSlot:TextArea;
      
      public var _ActorMakerControl_FormItem21:FormItem;
      
      public var _ActorMakerControl_FormItem22:FormItem;
      
      public var _ActorMakerControl_FormItem23:FormItem;
      
      public var _ActorMakerControl_FormItem24:FormItem;
      
      private var _913371382fi_item_equippedNewShotActor:FormItem;
      
      private var _2098866647ui_npc_takeObjectTypeOnChoice2:ComboBox;
      
      private var _1906052200ui_allchar_shotActor:TextInput;
      
      private var _1488745054ui_npc_takesObjectCountOnChoice1Num:NumericStepper;
      
      private var _1268861541footer:EditFooterComponent;
      
      private var _1859488130fi_item_inventoryEquipSlot:FormItem;
      
      public var _ActorMakerControl_FormItem34:FormItem;
      
      private var _588202289ui_npc_takesObjectOnChoice1:TextInput;
      
      private var _135307643ui_itemOrNPC_appearCount:NumericStepper;
      
      private var _3366265myWD:WipeDown;
      
      public var _ActorMakerControl_FormItem38:FormItem;
      
      private var _1989378557ui_all_soundWhenKilled:ComboBox;
      
      private var _981685623fi_itemOrNPC_dropsObjectRandomlyChance:FormItem;
      
      private var _803557585ui_allchar_leftYN:ComboBox;
      
      private var _177647283ui_all_description:TextInput;
      
      private var _2026736591ui_itemOrNPC_appearIf:ComboBox;
      
      private var _836893175ui_npc_responseChoice1DropPersistsYN:ComboBox;
      
      private var _2098866648ui_npc_takeObjectTypeOnChoice1:ComboBox;
      
      public var _ActorMakerControl_Text2:Text;
      
      public var _ActorMakerControl_Text5:Text;
      
      public var _ActorMakerControl_Text6:Text;
      
      public var _ActorMakerControl_Text7:Text;
      
      public var _ActorMakerControl_Text8:Text;
      
      private var _314070383animations:Canvas;
      
      private var _498776909fi_item_squishPlayerYN:FormItem;
      
      public var _ActorMakerControl_LinkButton10:LinkButton;
      
      public var _ActorMakerControl_LinkButton11:LinkButton;
      
      public var _ActorMakerControl_LinkButton12:LinkButton;
      
      public var _ActorMakerControl_LinkButton13:LinkButton;
      
      private var _452061108fi_allchar_upYN:FormItem;
      
      private var _1241953424ui_item_equippedArmorEffect:NumericStepper;
      
      private var _473577917fi_item_keyForThisDoorConsumedYN:FormItem;
      
      private var _752327403ui_item_pushToSlideNum:NumericStepper;
      
      private var _2004682430ui_allchar_rightYN:ComboBox;
      
      private var _526910303fi_item_itemPushesActorDistance:FormItem;
      
      private var _588202288ui_npc_takesObjectOnChoice2:TextInput;
      
      private var _1762474508ui_item_gainPowerSecondsNum:NumericStepper;
      
      private var _1532045540ui_npc_saysWhatOnChoice1:TextInput;
      
      private var _168712356ui_npc_canOccupyPlayerSpaceYN:ComboBox;
      
      private var _260808207fi_all_max_health:FormItem;
      
      private var _1192236482fi_itemOrNPC_dropsObjectWhenKilledChance:FormItem;
      
      private var _205235219actorPreview:ActorPreview;
      
      private var _1815442411fi_itemOrNPC_dropsObjectWhenKilledName:FormItem;
      
      private var _2087720740pageItemOrNPC:Canvas;
      
      private var _1943186600ButtonLoad:Button;
      
      private var _1861231248ui_item_equippedNewShotDamageBonusNum:NumericStepper;
      
      private var _31197418ui_item_equippedNewShotRangeBonusNum:NumericStepper;
      
      private var _798141585fi_item_autoEquip:FormItem;
      
      private var _1493942062ui_item_itemPushesActorDistance:NumericStepper;
      
      private var _583635469ui_item_useText:TextArea;
      
      private var _859140674pageItem:Canvas;
      
      private var _389141377ui_item_gainPowerType:ComboBox;
      
      private var _1995996096fi_item_healOrHarmWhenUsedNum:FormItem;
      
      private var _741688715ui_item_gainOrLosePointsNum:NumericStepper;
      
      private var _588202287ui_npc_takesObjectOnChoice3:TextInput;
      
      private var _187274522ui_allchar_shotDamageToNPCorItemNum:NumericStepper;
      
      private var _1703153366mainViewStack:ViewStack;
      
      private var _26865045pageAllChars:Canvas;
      
      public var _ActorMakerControl_Canvas2:Canvas;
      
      private var _826476698ui_allchar_meleeDamageToNPCorItemNum:NumericStepper;
      
      private var _embed_mxml_Resources_HelpIcon_png_920508456:Class;
      
      private var _389868554ui_item_increasesMaxHealthNum:NumericStepper;
      
      private var _2116756853ui_npc_responseChoice3DropPersistsYN:ComboBox;
      
      private var _1695374772fi_itemOrNPC_dropsObjectWhenKilledChance2:FormItem;
      
      private var _1242908403ui_item_itemPushesActorType:ComboBox;
      
      private var _582586635ui_all_visualEffectWhenHealedType:ComboBox;
      
      private var _2101909190tilePreview:BitmapDuper;
      
      private var _371633440fi_allchar_leftYN:FormItem;
      
      private var _657392486actormakerBackgroundColor:SelectBackgroundColor;
      
      private var _780106154ui_npc_shotAccuracyType:ComboBox;
      
      private var _1354243591actorPiece:MgbActor;
      
      private var _820144038ui_npc_responseChoice1:TextInput;
      
      private var _1488685472ui_npc_takesObjectCountOnChoice3Num:NumericStepper;
      
      private var _860144052fi_item_equippedNewShotRateBonus:FormItem;
      
      private var _1341962678ui_allchar_shotRangeNum:NumericStepper;
      
      private var _2094566186ui_itemOrNPC_destroyableYN:ComboBox;
      
      private var _1399491700ui_itemOrNPC_dropsObjectWhenKilledName2:TextInput;
      
      protected var actorCache:PieceCache;
      
      private var _1186570314fi_all_health:FormItem;
      
      private var _1942990865ButtonSave:Button;
      
      private var _315122910ui_allchar_soundWhenMelee:ComboBox;
      
      private var _364073846ui_item_equippedNewMeleeDamageBonusNum:NumericStepper;
      
      private var _1899469319ui_all_soundWhenHealed:ComboBox;
      
      private var _564974130ui_item_squishNPCYN:ComboBox;
      
      private var _735562224fi_item_gainPowerType:FormItem;
      
      private var _1513705505fi_item_equippedArmorEffect:FormItem;
      
      private var _1799886537ui_npc_dropsObjectOnChoice1:TextInput;
      
      private var _845834858ui_allchar_jumpYN:ComboBox;
      
      private var _1532045539ui_npc_saysWhatOnChoice2:TextInput;
      
      private var _648196720okForForeground:String;
      
      private var _1653639183ui_allchar_touchDamageToPlayerNum:NumericStepper;
      
      private var _130889713fi_item_equippedNewActorGraphics:FormItem;
      
      private var _377594337ui_item_gainExtraLifeYN:ComboBox;
      
      private var _1509330765fi_item_winLevelYN:FormItem;
      
      private var _196272556fi_allchar_sound_when_shooting:FormItem;
      
      private var _3366282myWU:WipeUp;
      
      private var _888992581fi_item_equippedNewShotDamageBonus:FormItem;
      
      private var _384693330ui_allchar_shotDamageToPlayerNum:NumericStepper;
      
      private var _1182244738ui_itemOrNPC_respawnOption:ComboBox;
      
      private var _78157789fi_allchar_sound_when_melee:FormItem;
      
      private var _1287285162ui_allchar_conditionsActor:TextInput;
      
      private var _422470475ui_item_equippedNewShotSound:ComboBox;
      
      private var _1799886536ui_npc_dropsObjectOnChoice2:TextInput;
      
      private var _1941824968PanelViewActualSize:Panel;
      
      mx_internal var _watchers:Array;
      
      private var _820144039ui_npc_responseChoice2:TextInput;
      
      private var _1005559964ui_item_itemActivationType:ComboBox;
      
      private var _1323916564ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum:NumericStepper;
      
      private var _1647541843fi_itemOrNPC_respawnOption:FormItem;
      
      public var _ActorMakerControl_TabBar1:TabBar;
      
      private var _1567256139ui_item_autoEquipYN:ComboBox;
      
      private var _296399964fi_item_itemPushesActorType:FormItem;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1629269081fi_itemOrNPC_destroyableYN:FormItem;
      
      public function ActorMakerControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":TabBar,
                  "id":"_ActorMakerControl_TabBar1",
                  "stylesFactory":function():void
                  {
                     this.disabledColor = 16777215;
                     this.borderColor = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":120,
                        "y":8,
                        "selectedIndex":0
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"mainViewStack",
                  "stylesFactory":function():void
                  {
                     this.borderColor = 0;
                     this.left = "120";
                     this.right = "8";
                     this.top = "28";
                     this.bottom = "74";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "creationPolicy":"all",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"_ActorMakerControl_Canvas2",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"All",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Panel,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"flatPanel",
                                          "x":0,
                                          "y":0,
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "layout":"absolute",
                                          "horizontalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Form,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Actor Type:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_all_actorType",
                                                               "events":{"change":"__ui_all_actorType_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Description:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":TextInput,
                                                               "id":"ui_all_description"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_all_health",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Initial Health:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_all_initialHealthNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":10000,
                                                                     "minimum":1
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_all_max_health",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Initial Max Health:",
                                                            "toolTip":"This is the highest health the actor can have. the value 0 means there is no limit",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_all_initialMaxHealthNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":10000,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"_ActorMakerControl_FormItem5",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Affected by gravity:",
                                                            "visible":false,
                                                            "includeInLayout":false,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_all_gravityYN",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_all_sound_when_harmed",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Sound Effect when harmed:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_all_soundWhenHarmed",
                                                               "events":{"change":"__ui_all_soundWhenHarmed_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_all_harmEffect",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Visual effect when harmed:",
                                                            "visible":false,
                                                            "includeInLayout":false,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_all_visualEffectWhenHarmedType",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_all_sound_when_healed",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Sound Effect when healed:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_all_soundWhenHealed",
                                                               "events":{"change":"__ui_all_soundWhenHealed_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_all_healEffect",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Visual effect when healed:",
                                                            "visible":false,
                                                            "includeInLayout":false,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_all_visualEffectWhenHealedType",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_all_sound_when_killed",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Sound Effect when killed:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_all_soundWhenKilled",
                                                               "events":{"change":"__ui_all_soundWhenKilled_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_all_killEffect",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Visual effect when killed:",
                                                            "visible":false,
                                                            "includeInLayout":false,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_all_visualEffectWhenKilledType",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
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
                                                            "id":"ButtonChooseTile",
                                                            "events":{"click":"__ButtonChooseTile_click"},
                                                            "stylesFactory":function():void
                                                            {
                                                               this.overIcon = _embed_mxml_Resources_NewIcon_png_1810360004;
                                                               this.upIcon = _embed_mxml_Resources_NewIcon_png_1810360004;
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "label":"Choose Tile",
                                                                  "height":40,
                                                                  "labelPlacement":"bottom",
                                                                  "width":104
                                                               };
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":BitmapDuper,
                                                            "id":"tilePreview",
                                                            "events":{"doubleClick":"__tilePreview_doubleClick"},
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"doubleClickEnabled":true};
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"tileSummaryText",
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"text":"Tile: (choose a tile)"};
                                                            }
                                                         })]};
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
                           "type":Canvas,
                           "id":"animations",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"Animations",
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Panel,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"flatPanel",
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":DataGrid,
                                             "id":"animationGrid",
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
                                                   "columns":[_ActorMakerControl_DataGridColumn1_c(),_ActorMakerControl_DataGridColumn2_c(),_ActorMakerControl_DataGridColumn3_c(),_ActorMakerControl_DataGridColumn4_i()]
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":ApplicationControlBar,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"childDescriptors":[new UIComponentDescriptor({
                                                   "type":Button,
                                                   "events":{"click":"___ActorMakerControl_Button2_click"},
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"label":"Choose tile for Action"};
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Button,
                                                   "events":{"click":"___ActorMakerControl_Button3_click"},
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"label":"Check for problems"};
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
                           "id":"pageAllChars",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"Character behavior",
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Panel,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"flatPanel",
                                          "x":0,
                                          "y":0,
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "layout":"absolute",
                                          "horizontalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Form,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Movement speed:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_movementSpeedNum",
                                                               "events":{"change":"__ui_allchar_movementSpeedNum_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "minimum":0,
                                                                     "maximum":3,
                                                                     "stepSize":0.5
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_allchar_upYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Can move Up:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_upYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_allchar_downYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Can move Down:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_downYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_allchar_leftYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Can move Left:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_leftYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_allchar_rightYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Can move Right:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_rightYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_allchar_pushYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Can Push pushable items:",
                                                            "visible":false,
                                                            "includeInLayout":false,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_pushYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_allchar_jumpYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Can Jump:",
                                                            "visible":false,
                                                            "includeInLayout":false,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_jumpYN",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HRule,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"percentWidth":100};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Actor to use for shots:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":HBox,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"childDescriptors":[new UIComponentDescriptor({
                                                                     "type":TextInput,
                                                                     "id":"ui_allchar_shotActor",
                                                                     "events":{"click":"__ui_allchar_shotActor_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"editable":false};
                                                                     }
                                                                  }),new UIComponentDescriptor({
                                                                     "type":LinkButton,
                                                                     "id":"_ActorMakerControl_LinkButton1",
                                                                     "events":{"click":"___ActorMakerControl_LinkButton1_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"label":"(clear)"};
                                                                     }
                                                                  })]};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_allchar_sound_when_shooting",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Sound Effect for Shots:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_soundWhenShooting",
                                                               "events":{"change":"__ui_allchar_soundWhenShooting_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"_ActorMakerControl_FormItem21",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Shot Rate:",
                                                            "toolTip":"This is the number of shots that can be on screen at a time. 0 means actor cannot shoot",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_shotRateNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":9,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"_ActorMakerControl_FormItem22",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Shot Range:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_shotRangeNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":20,
                                                                     "minimum":1
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"_ActorMakerControl_FormItem23",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Shot damage against player:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_shotDamageToPlayerNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"_ActorMakerControl_FormItem24",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Shot damage against NPCs or Items:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_shotDamageToNPCorItemNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HRule,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"percentWidth":100};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Touch damage against player:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_touchDamageToPlayerNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Touch damage against NPCs or Items:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_touchDamageToNPCorItemNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Touch damage attack chance:",
                                                            "toolTip":"Chance of making a touch attack each round. 100% = always",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_touchDamageAttackChance",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":100,
                                                                     "minimum":1
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Touch damage cases:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_touchDamageCases",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HRule,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"percentWidth":100};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Melee damage against player:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_meleeDamageToPlayerNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Melee damage against NPCs or Items:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_meleeDamageToNPCorItemNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_allchar_sound_when_melee",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Sound Effect for Melee attack:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_allchar_soundWhenMelee",
                                                               "events":{"change":"__ui_allchar_soundWhenMelee_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Melee repeat delay:",
                                                            "toolTip":"Number of turns the character must wait before doing another melee attack. Note that a melee attack takes 2 turns.",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_allchar_meleeRepeatDelay",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":8,
                                                                     "minimum":0
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
                           "type":Canvas,
                           "id":"pageNPC",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"NPC Behavior",
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Panel,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"flatPanel",
                                          "x":0,
                                          "y":0,
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "layout":"absolute",
                                          "horizontalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Form,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Movement type:",
                                                            "toolTip":"Select the way the NPC will move",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_movementType"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"_ActorMakerControl_FormItem34",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"\'Aggro\' range:",
                                                            "toolTip":"If the NPC is with this many tiles of the player, then the NPC will move towards the player",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_npc_aggroRange",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":32,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"NPC can occupy player\'s space",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_canOccupyPlayerSpaceYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Automatic shot accuracy:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_shotAccuracyType",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":6};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Text,
                                                      "id":"_ActorMakerControl_Text2",
                                                      "stylesFactory":function():void
                                                      {
                                                         this.color = 16711680;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"text":"Note: Players can\'t talk to NPCs that they can do \'touch damage\' to"};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Greeting when player meets:",
                                                            "toolTip":"When the player walks into this character, show this text in a dialog. This ONLY works if the NPC is placed on the ACTIVE layer of the map",
                                                            "percentWidth":100,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":TextArea,
                                                               "id":"ui_npc_TalkText",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"percentWidth":100};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"_ActorMakerControl_FormItem38",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Font for message:",
                                                            "toolTip":"Font used for this message",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_TalkTextFontIndex",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":5};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox3",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "text":"Response Option #1",
                                                                  "width":130
                                                               };
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":TextInput,
                                                            "id":"ui_npc_responseChoice1",
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"editable":true};
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "id":"_ActorMakerControl_HBox4",
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"childDescriptors":[new UIComponentDescriptor({
                                                                  "type":Text,
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"text":"    Drop: "};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":TextInput,
                                                                  "id":"ui_npc_dropsObjectOnChoice1",
                                                                  "events":{"click":"__ui_npc_dropsObjectOnChoice1_click"},
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"editable":false};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":LinkButton,
                                                                  "id":"_ActorMakerControl_LinkButton2",
                                                                  "events":{"click":"___ActorMakerControl_LinkButton2_click"},
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"label":"(clear)"};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":Text,
                                                                  "id":"_ActorMakerControl_Text5",
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"text":"    Drop is persistent?"};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":ComboBox,
                                                                  "id":"ui_npc_responseChoice1DropPersistsYN"
                                                               })]};
                                                            }
                                                         })]};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox5",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "toolTip":"This option lets the NPC require that the player posesses (or gives) an item to the NPC in order to make this choice. Only the first response has this option.",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text6",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"width":130};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":TextInput,
                                                               "id":"ui_npc_takesObjectOnChoice1",
                                                               "events":{"click":"__ui_npc_takesObjectOnChoice1_click"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":LinkButton,
                                                               "id":"_ActorMakerControl_LinkButton3",
                                                               "events":{"click":"___ActorMakerControl_LinkButton3_click"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"label":"(clear)"};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text7",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "text":"Take or Require? ",
                                                                     "width":110
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_takeObjectTypeOnChoice1"
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text8",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"text":"Count: "};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_npc_takesObjectCountOnChoice1Num",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":1
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox6",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "percentWidth":100,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":Text,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "text":"  NPC then says...",
                                                                     "width":130
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":TextInput,
                                                               "id":"ui_npc_saysWhatOnChoice1",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "percentWidth":100,
                                                                     "editable":true
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"text":" NPC Stays: "};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_responseChoice1Stay"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":5};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox7",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "text":"Response Option #2",
                                                                  "width":130
                                                               };
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":TextInput,
                                                            "id":"ui_npc_responseChoice2",
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"editable":true};
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "id":"_ActorMakerControl_HBox8",
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"childDescriptors":[new UIComponentDescriptor({
                                                                  "type":Text,
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"text":"    Drop: "};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":TextInput,
                                                                  "id":"ui_npc_dropsObjectOnChoice2",
                                                                  "events":{"click":"__ui_npc_dropsObjectOnChoice2_click"},
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"editable":false};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":LinkButton,
                                                                  "id":"_ActorMakerControl_LinkButton4",
                                                                  "events":{"click":"___ActorMakerControl_LinkButton4_click"},
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"label":"(clear)"};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":Text,
                                                                  "id":"_ActorMakerControl_Text13",
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"text":"    Drop is persistent?"};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":ComboBox,
                                                                  "id":"ui_npc_responseChoice2DropPersistsYN"
                                                               })]};
                                                            }
                                                         })]};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox9",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "toolTip":"This option lets the NPC require that the player posesses (or gives) an item to the NPC in order to make this choice. Only the first response has this option.",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text14",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"width":130};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":TextInput,
                                                               "id":"ui_npc_takesObjectOnChoice2",
                                                               "events":{"click":"__ui_npc_takesObjectOnChoice2_click"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":LinkButton,
                                                               "id":"_ActorMakerControl_LinkButton5",
                                                               "events":{"click":"___ActorMakerControl_LinkButton5_click"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"label":"(clear)"};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text15",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "text":"Take or Require? ",
                                                                     "width":110
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_takeObjectTypeOnChoice2"
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text16",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"text":"Count: "};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_npc_takesObjectCountOnChoice2Num",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":1
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox10",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "percentWidth":100,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":Text,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "text":"  NPC then says...",
                                                                     "width":130
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":TextInput,
                                                               "id":"ui_npc_saysWhatOnChoice2",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "percentWidth":100,
                                                                     "editable":true
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"text":" NPC Stays: "};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_responseChoice2Stay"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":5};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox11",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "text":"Response Option #3",
                                                                  "width":130
                                                               };
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":TextInput,
                                                            "id":"ui_npc_responseChoice3",
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"editable":true};
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "id":"_ActorMakerControl_HBox12",
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"childDescriptors":[new UIComponentDescriptor({
                                                                  "type":Text,
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"text":"    Drop: "};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":TextInput,
                                                                  "id":"ui_npc_dropsObjectOnChoice3",
                                                                  "events":{"click":"__ui_npc_dropsObjectOnChoice3_click"},
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"editable":false};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":LinkButton,
                                                                  "id":"_ActorMakerControl_LinkButton6",
                                                                  "events":{"click":"___ActorMakerControl_LinkButton6_click"},
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"label":"(clear)"};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":Text,
                                                                  "id":"_ActorMakerControl_Text21",
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"text":"    Drop is persistent?"};
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":ComboBox,
                                                                  "id":"ui_npc_responseChoice3DropPersistsYN"
                                                               })]};
                                                            }
                                                         })]};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox13",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "toolTip":"This option lets the NPC require that the player posesses (or gives) an item to the NPC in order to make this choice. Only the first response has this option.",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text22",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"width":130};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":TextInput,
                                                               "id":"ui_npc_takesObjectOnChoice3",
                                                               "events":{"click":"__ui_npc_takesObjectOnChoice3_click"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":LinkButton,
                                                               "id":"_ActorMakerControl_LinkButton7",
                                                               "events":{"click":"___ActorMakerControl_LinkButton7_click"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"label":"(clear)"};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text23",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "text":"Take or Require? ",
                                                                     "width":110
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_takeObjectTypeOnChoice3"
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_ActorMakerControl_Text24",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"text":"Count: "};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_npc_takesObjectCountOnChoice3Num",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":1
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"_ActorMakerControl_HBox14",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "percentWidth":100,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":Text,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "text":"  NPC then says...",
                                                                     "width":130
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":TextInput,
                                                               "id":"ui_npc_saysWhatOnChoice3",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "percentWidth":100,
                                                                     "editable":true
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":Text,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"text":" NPC Stays: "};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_npc_responseChoice3Stay"
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
                           "type":Canvas,
                           "id":"pageItem",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"Item Behavior",
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Panel,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"flatPanel",
                                          "x":0,
                                          "y":0,
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "layout":"absolute",
                                          "horizontalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Form,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_itemActivationType",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Item Activation:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_itemActivationType",
                                                               "events":{"change":"__ui_item_itemActivationType_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"rowCount":10};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_inventoryEquippableYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Equippable?",
                                                            "toolTip":"\'Yes\' if this item can be equipped (wielded/worn etc) by the player",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_inventoryEquippableYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_inventoryEquipSlot",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Equipment slot",
                                                            "toolTip":"Enter a string such as \'weapon\' or \'right hand\'. The player can only equip one item of any \'slot\' at a time",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":TextArea,
                                                               "id":"ui_item_inventoryEquipSlot",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"percentWidth":100};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewActorGraphics",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"New actor graphics",
                                                            "toolTip":"When equipped, use this actor\'s graphics (base tile & all animations) to show the player. For example, if this item is a weapon, you may have a new set of actor graphics where the actor is carrying the weapon. Sorry, but only one equipped item can override the actor at a time - so choose wisely which slot you want to use this feature with (usually weapons). You can choose ANY actor type for this, since only the graphics of that actor will be use, and all actor types define graphics",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":HBox,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"childDescriptors":[new UIComponentDescriptor({
                                                                     "type":TextInput,
                                                                     "id":"ui_item_equippedNewActorGraphics",
                                                                     "events":{"click":"__ui_item_equippedNewActorGraphics_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"editable":false};
                                                                     }
                                                                  }),new UIComponentDescriptor({
                                                                     "type":LinkButton,
                                                                     "id":"_ActorMakerControl_LinkButton8",
                                                                     "events":{"click":"___ActorMakerControl_LinkButton8_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"label":"(clear)"};
                                                                     }
                                                                  })]};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":TextArea,
                                                      "id":"_ActorMakerControl_TextArea3",
                                                      "stylesFactory":function():void
                                                      {
                                                         this.color = 16711680;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "text":"Note: It is recommended that items that can change the player look should use a slot called \'change_player_look\'. This is because only one equipped item can only change how the player looks.",
                                                            "percentWidth":100,
                                                            "wordWrap":true
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_autoEquip",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Auto-equip item?",
                                                            "toolTip":"If yes, then this item is special and automatically is equipped when picked up by the player. It is useful for items like cars, horses, etc. Also, it cannot be explicitly unequipped by the user - it is only changed by another similar item",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_autoEquipYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":4};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewShotActor",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"New shot type",
                                                            "toolTip":"When equipped, use this \'shot actor\' as the shot",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":HBox,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"childDescriptors":[new UIComponentDescriptor({
                                                                     "type":TextInput,
                                                                     "id":"ui_item_equippedNewShotActor",
                                                                     "events":{"click":"__ui_item_equippedNewShotActor_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"editable":false};
                                                                     }
                                                                  }),new UIComponentDescriptor({
                                                                     "type":LinkButton,
                                                                     "id":"_ActorMakerControl_LinkButton9",
                                                                     "events":{"click":"___ActorMakerControl_LinkButton9_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"label":"(clear)"};
                                                                     }
                                                                  })]};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewShotSound",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"New Shot sound:",
                                                            "toolTip":"When equipped, use this as the shot sound",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_equippedNewShotSound",
                                                               "events":{"change":"__ui_item_equippedNewShotSound_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewShotDamageBonus",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Shot damage bonus:",
                                                            "toolTip":"When equipped, increase base shot damage by this amount",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_equippedNewShotDamageBonusNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":-1000
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewShotRateBonus",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Shot rate bonus:",
                                                            "toolTip":"When equipped, increase base shot rate by this amount",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_equippedNewShotRateBonusNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":20,
                                                                     "minimum":-20
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewShotRangeBonus",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Shot range bonus:",
                                                            "toolTip":"When equipped, increase base shot range by this amount",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_equippedNewShotRangeBonusNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":20,
                                                                     "minimum":-20
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":4};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedArmorEffect",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Armor effect:",
                                                            "toolTip":"When equipped, Reduce damage by this percentage",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_equippedArmorEffect",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":100,
                                                                     "minimum":0
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":4};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewMeleeDamageBonusNum",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Melee Damage Bonus:",
                                                            "toolTip":"When equipped, Increase Melee damage by this number of points. You can also have a negative value - that this item reduces damage - for example a weapon might be fast but reduce base damage",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_equippedNewMeleeDamageBonusNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":100,
                                                                     "minimum":-100
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewMeleeSound",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"New Melee sound:",
                                                            "toolTip":"When equipped, use this as the melee attack sound",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_equippedNewMeleeSound",
                                                               "events":{"change":"__ui_item_equippedNewMeleeSound_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_equippedNewMeleeRepeatDelayModifierNum",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Melee Repeat rate modifier:",
                                                            "toolTip":"This raises or lowers the Melee repeat rate of the character who has equipped the item. If the value is zero, there is no change to melee repeat rate. A positive number increases the delay, a negative number reduces the delay",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_equippedNewMeleeRepeatDelayModifierNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":10,
                                                                     "minimum":-10
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":4};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_itemPushesActorType",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Direction this item pushes other actors:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_itemPushesActorType",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_itemPushesActorDistance",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "visible":false,
                                                            "includeInLayout":false,
                                                            "label":"Distance this item pushes other actors:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_itemPushesActorDistance",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":50,
                                                                     "minimum":1
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":4};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_visualEffectWhenUsedType",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Visual effect when used:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_visualEffectWhenUsedType",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_useText",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Display a message when picked up:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":TextArea,
                                                               "id":"ui_item_useText",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"percentWidth":100};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":4};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_pushToSlideNum",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Player can push object to slide it:",
                                                            "toolTip":"If the value here is \'0\', then this is just a normal wall or other obstruction that cannot move. However, if the value is not zero, this item will be able to slide when pushed - \'a sliding block\' and this can be used for puzzles or as a weapon for the player",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_pushToSlideNum",
                                                               "events":{"change":"__ui_item_pushToSlideNum_change"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"maximum":50};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_squishPlayerYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Sliding block can squish players?:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_squishPlayerYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_squishNPCYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Sliding block can squish NPCs?:",
                                                            "toolTip":"If you want sliding bocks to be able to kill enemy NPCs, then select \'yes\' here.",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_squishNPCYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":4};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":HBox,
                                                      "id":"hbox_item_keyForThisDoor",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "toolTip":"If the player is carrying the specified \'key\' item, then the player can go past",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":Text,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "text":"Item that acts as a key:",
                                                                     "width":130
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":TextInput,
                                                               "id":"ui_item_keyForThisDoor",
                                                               "events":{"click":"__ui_item_keyForThisDoor_click"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":LinkButton,
                                                               "id":"_ActorMakerControl_LinkButton10",
                                                               "events":{"click":"___ActorMakerControl_LinkButton10_click"},
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "label":"(clear)",
                                                                     "toolTip":"Click here to remove the key choice"
                                                                  };
                                                               }
                                                            }),new UIComponentDescriptor({
                                                               "type":FormItem,
                                                               "id":"fi_item_keyForThisDoorConsumedYN",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "label":"Key is consumed when used:",
                                                                     "toolTip":"Select Yes if the key is taken from the player when used",
                                                                     "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ComboBox,
                                                                        "id":"ui_item_keyForThisDoorConsumedYN"
                                                                     })]
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Spacer,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {"height":4};
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_healOrHarmWhenUsedNum",
                                                      "stylesFactory":function():void
                                                      {
                                                         this.backgroundAlpha = 0;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Heal (or harm) when used:",
                                                            "toolTip":"Enter the number of points of damage this item applies or heals. For example, if this was a healing item, and the number here was 5, it would heal by 5 points. If this was a harming item, and the number was 10, it would inflict 10 damage points",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_healOrHarmWhenUsedNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"maximum":100};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_increasesMaxHealthNum",
                                                      "stylesFactory":function():void
                                                      {
                                                         this.backgroundAlpha = 0;
                                                      },
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Increase Max Health:",
                                                            "toolTip":"Enter the number of points of extra max health this item gives.",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_increasesMaxHealthNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":1000,
                                                                     "minimum":-1000
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_gainExtraLifeYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Win an extra life when used:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_gainExtraLifeYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_gainOrLosePointsNum",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Score (or lose points) when used:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_gainOrLosePointsNum"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_winLevelYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Win this level when used:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_winLevelYN"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_gainPowerType",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Gain a power when used:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_item_gainPowerType",
                                                               "events":{"change":"__ui_item_gainPowerType_change"}
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_item_gainPowerSecondsNum",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Gain the power for :",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_item_gainPowerSecondsNum",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "maximum":30,
                                                                     "toolTip":"seconds"
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
                           "type":Canvas,
                           "id":"pageItemOrNPC",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"destruction/spawning",
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Panel,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"flatPanel",
                                          "x":0,
                                          "y":0,
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "layout":"absolute",
                                          "horizontalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Form,
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "childDescriptors":[new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_destroyableYN",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Can this be destroyed/damaged:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_itemOrNPC_destroyableYN",
                                                               "events":{"change":"__ui_itemOrNPC_destroyableYN_change"}
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Points scored (or lost) when shot by player:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Points scored (or lost) when killed by player:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum"
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_dropsObjectWhenKilledName",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Drops (creates) new actor when destroyed:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":HBox,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"childDescriptors":[new UIComponentDescriptor({
                                                                     "type":TextInput,
                                                                     "id":"ui_itemOrNPC_dropsObjectWhenKilledName",
                                                                     "events":{"click":"__ui_itemOrNPC_dropsObjectWhenKilledName_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"editable":false};
                                                                     }
                                                                  }),new UIComponentDescriptor({
                                                                     "type":LinkButton,
                                                                     "id":"_ActorMakerControl_LinkButton11",
                                                                     "events":{"click":"___ActorMakerControl_LinkButton11_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"label":"(clear)"};
                                                                     }
                                                                  })]};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_dropsObjectWhenKilledChance",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"% Chance of drop happening:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_itemOrNPC_dropsObjectWhenKilledChance",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "minimum":1,
                                                                     "maximum":100
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_dropsObjectWhenKilledName2",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Drops (creates) new actor #2 when destroyed:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":HBox,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"childDescriptors":[new UIComponentDescriptor({
                                                                     "type":TextInput,
                                                                     "id":"ui_itemOrNPC_dropsObjectWhenKilledName2",
                                                                     "events":{"click":"__ui_itemOrNPC_dropsObjectWhenKilledName2_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"editable":false};
                                                                     }
                                                                  }),new UIComponentDescriptor({
                                                                     "type":LinkButton,
                                                                     "id":"_ActorMakerControl_LinkButton12",
                                                                     "events":{"click":"___ActorMakerControl_LinkButton12_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"label":"(clear)"};
                                                                     }
                                                                  })]};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_dropsObjectWhenKilledChance2",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"% Chance of drop #2 happening:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_itemOrNPC_dropsObjectWhenKilledChance2",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "minimum":1,
                                                                     "maximum":100,
                                                                     "toolTip":"This % chance is independent of drop #1 - so if both are 100% then there will always be two actors dropped. The first dropped item will be in the top-left corner of where the destroyed actor was. The 2nd drop, if it happens will be next to where the destroyed actor was, placed based on the direction the destroyed actor had been facing."
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_respawnOption",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Respawn options:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":ComboBox,
                                                               "id":"ui_itemOrNPC_respawnOption",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"editable":false};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_dropsObjectRandomlyName",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"Randomly generates new actor:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":HBox,
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {"childDescriptors":[new UIComponentDescriptor({
                                                                     "type":TextInput,
                                                                     "id":"ui_itemOrNPC_dropsObjectRandomlyName",
                                                                     "events":{"click":"__ui_itemOrNPC_dropsObjectRandomlyName_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"editable":false};
                                                                     }
                                                                  }),new UIComponentDescriptor({
                                                                     "type":LinkButton,
                                                                     "id":"_ActorMakerControl_LinkButton13",
                                                                     "events":{"click":"___ActorMakerControl_LinkButton13_click"},
                                                                     "propertiesFactory":function():Object
                                                                     {
                                                                        return {"label":"(clear)"};
                                                                     }
                                                                  })]};
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":FormItem,
                                                      "id":"fi_itemOrNPC_dropsObjectRandomlyChance",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "label":"% chance of randomly generating actor:",
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":NumericStepper,
                                                               "id":"ui_itemOrNPC_dropsObjectRandomlyChance",
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "minimum":1,
                                                                     "maximum":100
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
                           "type":Canvas,
                           "id":"pageConditions",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "label":"Conditions",
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Panel,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"flatPanel",
                                          "x":0,
                                          "y":0,
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "horizontalScrollPolicy":"off",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Text,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"\'Conditions\' make an actor appear or disappear, depending on how many other actors are on the map. "};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HBox,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"childDescriptors":[new UIComponentDescriptor({
                                                   "type":ComboBox,
                                                   "id":"ui_itemOrNPC_appearIf",
                                                   "events":{"change":"__ui_itemOrNPC_appearIf_change"}
                                                }),new UIComponentDescriptor({
                                                   "type":Text,
                                                   "id":"_ActorMakerControl_Text29",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"text":" if "};
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":NumericStepper,
                                                   "id":"ui_itemOrNPC_appearCount"
                                                }),new UIComponentDescriptor({
                                                   "type":TextInput,
                                                   "id":"ui_allchar_conditionsActor",
                                                   "events":{"click":"__ui_allchar_conditionsActor_click"},
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"editable":false};
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Text,
                                                   "id":"_ActorMakerControl_Text30",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {"text":"actors are on current map"};
                                                   }
                                                })]};
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
                  "type":Text,
                  "id":"actorSummaryText",
                  "stylesFactory":function():void
                  {
                     this.fontWeight = "bold";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":124,
                        "y":32,
                        "text":"Actor: (Not saved yet)"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "id":"_ActorMakerControl_Text32",
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                     this.verticalCenter = "-200";
                     this.fontWeight = "bold";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"text":"Load or Create an Actor using the buttons on the left"};
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
                  "type":Button,
                  "id":"ButtonNew",
                  "events":{"click":"__ButtonNew_click"},
                  "stylesFactory":function():void
                  {
                     this.overIcon = _embed_mxml_Resources_NewIcon_png_1810360004;
                     this.upIcon = _embed_mxml_Resources_NewIcon_png_1810360004;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":8,
                        "y":8,
                        "label":"New!",
                        "height":40,
                        "labelPlacement":"bottom",
                        "width":48
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"ButtonLoad",
                  "events":{"click":"__ButtonLoad_click"},
                  "stylesFactory":function():void
                  {
                     this.overIcon = _embed_mxml_Resources_LoadIcon_png_989977250;
                     this.upIcon = _embed_mxml_Resources_LoadIcon_png_989977250;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":8,
                        "y":56,
                        "label":"Load",
                        "height":40,
                        "labelPlacement":"bottom",
                        "width":48
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"ButtonSave",
                  "events":{"click":"__ButtonSave_click"},
                  "stylesFactory":function():void
                  {
                     this.overIcon = _embed_mxml_Resources_SaveIcon_png_953805992;
                     this.upIcon = _embed_mxml_Resources_SaveIcon_png_953805992;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":64,
                        "y":56,
                        "label":"Save",
                        "height":40,
                        "labelPlacement":"bottom",
                        "width":48
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
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
                        "x":64,
                        "y":8,
                        "label":"Help",
                        "height":40,
                        "labelPlacement":"bottom",
                        "width":48
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":SelectBackgroundColor,
                  "id":"actormakerBackgroundColor",
                  "stylesFactory":function():void
                  {
                     this.right = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"y":8};
                  }
               }),new UIComponentDescriptor({
                  "type":Panel,
                  "id":"PanelViewActualSize",
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "center";
                     this.headerHeight = 8;
                     this.borderThickness = 1;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":8,
                        "y":104,
                        "width":104,
                        "height":104,
                        "layout":"absolute",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":ActorPreview,
                           "id":"actorPreview",
                           "stylesFactory":function():void
                           {
                              this.verticalCenter = "0";
                              this.horizontalCenter = "0";
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "id":"_ActorMakerControl_VBox1",
                  "stylesFactory":function():void
                  {
                     this.verticalGap = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":10,
                        "y":226,
                        "height":212,
                        "width":102,
                        "horizontalScrollPolicy":"off",
                        "toolTip":"This shows which layers this actor can be placed upon. The background layer is for simple floors and walls only, it doesn\'t allow items or characters or anything that moves (sliding blocks, conditionals) on that layer. The active layer is for anything that might move or an item the player might pick up. The foreground layer is inactive - you can use it for visual effects, but nothing there will move or interact with any other actor.",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "stylesFactory":function():void
                           {
                              this.fontWeight = "bold";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"text":"Layers:"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"height":2};
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_ActorMakerControl_Text34",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"denseTable"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_ActorMakerControl_Text35",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"denseTable"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_ActorMakerControl_Text36",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"denseTable"};
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         _1354243591actorPiece = new MgbActor();
         actorCache = MgbCaches.getInstance().actorCache;
         _1217010542mgbSession = MgbSession.getInstance();
         _embed_mxml_Resources_HelpIcon_png_920508456 = ActorMakerControl__embed_mxml_Resources_HelpIcon_png_920508456;
         _embed_mxml_Resources_LoadIcon_png_989977250 = ActorMakerControl__embed_mxml_Resources_LoadIcon_png_989977250;
         _embed_mxml_Resources_NewIcon_png_1810360004 = ActorMakerControl__embed_mxml_Resources_NewIcon_png_1810360004;
         _embed_mxml_Resources_SaveIcon_png_953805992 = ActorMakerControl__embed_mxml_Resources_SaveIcon_png_953805992;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         _ActorMakerControl_XML1_i();
         _ActorMakerControl_WipeDown1_i();
         _ActorMakerControl_WipeRight1_i();
         _ActorMakerControl_WipeUp1_i();
         this.addEventListener("creationComplete",___ActorMakerControl_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ActorMakerControl._watcherSetupUtil = param1;
      }
      
      private static function wrapText(param1:String) : String
      {
         return param1 == "Yes" ? "<b>Yes</b>" : param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewActorGraphics() : FormItem
      {
         return this._130889713fi_item_equippedNewActorGraphics;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_touchDamageToPlayerNum() : NumericStepper
      {
         return this._1653639183ui_allchar_touchDamageToPlayerNum;
      }
      
      public function set ui_item_inventoryEquippableYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._970025994ui_item_inventoryEquippableYN;
         if(_loc2_ !== param1)
         {
            this._970025994ui_item_inventoryEquippableYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_inventoryEquippableYN",_loc2_,param1));
         }
      }
      
      public function set fi_item_equippedNewActorGraphics(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._130889713fi_item_equippedNewActorGraphics;
         if(_loc2_ !== param1)
         {
            this._130889713fi_item_equippedNewActorGraphics = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewActorGraphics",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedArmorEffect() : FormItem
      {
         return this._1513705505fi_item_equippedArmorEffect;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_allchar_sound_when_melee() : FormItem
      {
         return this._78157789fi_allchar_sound_when_melee;
      }
      
      public function set ui_allchar_touchDamageToPlayerNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1653639183ui_allchar_touchDamageToPlayerNum;
         if(_loc2_ !== param1)
         {
            this._1653639183ui_allchar_touchDamageToPlayerNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_touchDamageToPlayerNum",_loc2_,param1));
         }
      }
      
      public function set actorPreview(param1:ActorPreview) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._205235219actorPreview;
         if(_loc2_ !== param1)
         {
            this._205235219actorPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPreview",_loc2_,param1));
         }
      }
      
      public function set fi_itemOrNPC_dropsObjectWhenKilledName(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1815442411fi_itemOrNPC_dropsObjectWhenKilledName;
         if(_loc2_ !== param1)
         {
            this._1815442411fi_itemOrNPC_dropsObjectWhenKilledName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_dropsObjectWhenKilledName",_loc2_,param1));
         }
      }
      
      private function processSaveSubmitClick() : void
      {
         actorPiece.actorXML = new XML(actorDestData);
         actorPiece.save();
         tagCheck("save_complete");
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewMeleeRepeatDelayModifierNum() : FormItem
      {
         return this._1834305578fi_item_equippedNewMeleeRepeatDelayModifierNum;
      }
      
      public function __ui_npc_takesObjectOnChoice1_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_npc_takesObjectOnChoice1);
      }
      
      public function set fi_allchar_sound_when_melee(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._78157789fi_allchar_sound_when_melee;
         if(_loc2_ !== param1)
         {
            this._78157789fi_allchar_sound_when_melee = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_allchar_sound_when_melee",_loc2_,param1));
         }
      }
      
      public function __ui_itemOrNPC_dropsObjectRandomlyName_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_itemOrNPC_dropsObjectRandomlyName);
      }
      
      public function set fi_item_equippedArmorEffect(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1513705505fi_item_equippedArmorEffect;
         if(_loc2_ !== param1)
         {
            this._1513705505fi_item_equippedArmorEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedArmorEffect",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_initialHealthNum() : NumericStepper
      {
         return this._439576655ui_all_initialHealthNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice2DropPersistsYN() : ComboBox
      {
         return this._670658634ui_npc_responseChoice2DropPersistsYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_inventoryEquipSlot() : TextArea
      {
         return this._1970182061ui_item_inventoryEquipSlot;
      }
      
      public function set fi_item_equippedNewMeleeRepeatDelayModifierNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1834305578fi_item_equippedNewMeleeRepeatDelayModifierNum;
         if(_loc2_ !== param1)
         {
            this._1834305578fi_item_equippedNewMeleeRepeatDelayModifierNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewMeleeRepeatDelayModifierNum",_loc2_,param1));
         }
      }
      
      public function set fi_item_useText(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1722076124fi_item_useText;
         if(_loc2_ !== param1)
         {
            this._1722076124fi_item_useText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_useText",_loc2_,param1));
         }
      }
      
      public function __ui_all_soundWhenKilled_change(param1:ListEvent) : void
      {
         MgbActor.playCannedSound(String(ui_all_soundWhenKilled.selectedItem));
      }
      
      private function _ActorMakerControl_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.editable = true;
         _loc1_.headerText = "Tile";
         _loc1_.dataField = "tilename";
         return _loc1_;
      }
      
      public function set ui_itemOrNPC_appearIf(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2026736591ui_itemOrNPC_appearIf;
         if(_loc2_ !== param1)
         {
            this._2026736591ui_itemOrNPC_appearIf = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_appearIf",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_increasesMaxHealthNum() : FormItem
      {
         return this._2098507879fi_item_increasesMaxHealthNum;
      }
      
      public function set ui_allchar_shotRateNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._89797575ui_allchar_shotRateNum;
         if(_loc2_ !== param1)
         {
            this._89797575ui_allchar_shotRateNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_shotRateNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_inventoryEquippableYN() : FormItem
      {
         return this._836564869fi_item_inventoryEquippableYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_respawnOption() : ComboBox
      {
         return this._1182244738ui_itemOrNPC_respawnOption;
      }
      
      public function ___ActorMakerControl_LinkButton11_click(param1:MouseEvent) : void
      {
         ui_itemOrNPC_dropsObjectWhenKilledName.text = "";
      }
      
      public function set hbox_item_keyForThisDoor(param1:HBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1238862778hbox_item_keyForThisDoor;
         if(_loc2_ !== param1)
         {
            this._1238862778hbox_item_keyForThisDoor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hbox_item_keyForThisDoor",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_itemActivationType() : FormItem
      {
         return this._1470857069fi_item_itemActivationType;
      }
      
      public function set ui_all_initialHealthNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._439576655ui_all_initialHealthNum;
         if(_loc2_ !== param1)
         {
            this._439576655ui_all_initialHealthNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_initialHealthNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animationEntryPreview() : DataGridColumn
      {
         return this._1778337638animationEntryPreview;
      }
      
      public function set ui_npc_responseChoice2DropPersistsYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._670658634ui_npc_responseChoice2DropPersistsYN;
         if(_loc2_ !== param1)
         {
            this._670658634ui_npc_responseChoice2DropPersistsYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice2DropPersistsYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_canOccupyPlayerSpaceYN() : ComboBox
      {
         return this._168712356ui_npc_canOccupyPlayerSpaceYN;
      }
      
      public function set ui_item_keyForThisDoorConsumedYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._560364460ui_item_keyForThisDoorConsumedYN;
         if(_loc2_ !== param1)
         {
            this._560364460ui_item_keyForThisDoorConsumedYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_keyForThisDoorConsumedYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_meleeDamageToNPCorItemNum() : NumericStepper
      {
         return this._826476698ui_allchar_meleeDamageToNPCorItemNum;
      }
      
      public function set ui_item_inventoryEquipSlot(param1:TextArea) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1970182061ui_item_inventoryEquipSlot;
         if(_loc2_ !== param1)
         {
            this._1970182061ui_item_inventoryEquipSlot = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_inventoryEquipSlot",_loc2_,param1));
         }
      }
      
      public function set fi_all_sound_when_killed(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._435860568fi_all_sound_when_killed;
         if(_loc2_ !== param1)
         {
            this._435860568fi_all_sound_when_killed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_all_sound_when_killed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actorSummaryText() : Text
      {
         return this._2066104130actorSummaryText;
      }
      
      public function set fi_itemOrNPC_destroyableYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1629269081fi_itemOrNPC_destroyableYN;
         if(_loc2_ !== param1)
         {
            this._1629269081fi_itemOrNPC_destroyableYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_destroyableYN",_loc2_,param1));
         }
      }
      
      public function set ui_npc_TalkTextFontIndex(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._444433311ui_npc_TalkTextFontIndex;
         if(_loc2_ !== param1)
         {
            this._444433311ui_npc_TalkTextFontIndex = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_TalkTextFontIndex",_loc2_,param1));
         }
      }
      
      public function set fi_all_sound_when_healed(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._345951330fi_all_sound_when_healed;
         if(_loc2_ !== param1)
         {
            this._345951330fi_all_sound_when_healed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_all_sound_when_healed",_loc2_,param1));
         }
      }
      
      public function set fi_item_increasesMaxHealthNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2098507879fi_item_increasesMaxHealthNum;
         if(_loc2_ !== param1)
         {
            this._2098507879fi_item_increasesMaxHealthNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_increasesMaxHealthNum",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_shotActor(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1906052200ui_allchar_shotActor;
         if(_loc2_ !== param1)
         {
            this._1906052200ui_allchar_shotActor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_shotActor",_loc2_,param1));
         }
      }
      
      private function initData() : void
      {
         setActorDefaults();
         SetAllDeterminants();
         footer.nukeSlider();
         tilePreview.shrinkToFitEnabled = false;
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_LOGIN_LOGOUT,mgbLoginLogout);
      }
      
      public function set fi_all_sound_when_harmed(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._342764654fi_all_sound_when_harmed;
         if(_loc2_ !== param1)
         {
            this._342764654fi_all_sound_when_harmed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_all_sound_when_harmed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_touchDamageAttackChance() : NumericStepper
      {
         return this._238171945ui_allchar_touchDamageAttackChance;
      }
      
      [Bindable(event="propertyChange")]
      public function get pageItemOrNPC() : Canvas
      {
         return this._2087720740pageItemOrNPC;
      }
      
      private function actorTypeChanged() : void
      {
         updateSupportedLayerInfo();
         var _loc1_:int = ui_all_actorType.selectedIndex;
         fi_all_health.enabled = true;
         fi_all_harmEffect.enabled = true;
         fi_all_healEffect.enabled = true;
         fi_all_killEffect.enabled = true;
         switch(_loc1_)
         {
            case MgbActor.alActorType_Player:
               pageConditions.enabled = false;
               pageAllChars.enabled = true;
               pageNPC.enabled = false;
               pageItem.enabled = false;
               pageItemOrNPC.enabled = false;
               break;
            case MgbActor.alActorType_NPC:
               pageConditions.enabled = true;
               pageAllChars.enabled = true;
               pageNPC.enabled = true;
               pageItem.enabled = false;
               pageItemOrNPC.enabled = true;
               break;
            case MgbActor.alActorType_Item:
               pageConditions.enabled = true;
               pageAllChars.enabled = false;
               pageNPC.enabled = false;
               pageItem.enabled = true;
               pageItemOrNPC.enabled = true;
               break;
            case MgbActor.alActorType_Shot:
               pageConditions.enabled = false;
               pageAllChars.enabled = false;
               pageNPC.enabled = false;
               pageItem.enabled = false;
               pageItemOrNPC.enabled = false;
               fi_all_health.enabled = false;
               fi_all_harmEffect.enabled = false;
               fi_all_healEffect.enabled = false;
               fi_all_killEffect.enabled = false;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animationGrid() : DataGrid
      {
         return this._2030811370animationGrid;
      }
      
      public function ___ActorMakerControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         initData();
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewShotRangeBonusNum() : NumericStepper
      {
         return this._31197418ui_item_equippedNewShotRangeBonusNum;
      }
      
      public function set ui_itemOrNPC_respawnOption(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1182244738ui_itemOrNPC_respawnOption;
         if(_loc2_ !== param1)
         {
            this._1182244738ui_itemOrNPC_respawnOption = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_respawnOption",_loc2_,param1));
         }
      }
      
      public function set fi_item_inventoryEquippableYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._836564869fi_item_inventoryEquippableYN;
         if(_loc2_ !== param1)
         {
            this._836564869fi_item_inventoryEquippableYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_inventoryEquippableYN",_loc2_,param1));
         }
      }
      
      public function set ui_item_gainPowerType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._389141377ui_item_gainPowerType;
         if(_loc2_ !== param1)
         {
            this._389141377ui_item_gainPowerType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_gainPowerType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_visualEffectWhenHarmedType() : ComboBox
      {
         return this._1492195071ui_all_visualEffectWhenHarmedType;
      }
      
      public function set ui_item_equippedNewMeleeRepeatDelayModifierNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1263965307ui_item_equippedNewMeleeRepeatDelayModifierNum;
         if(_loc2_ !== param1)
         {
            this._1263965307ui_item_equippedNewMeleeRepeatDelayModifierNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewMeleeRepeatDelayModifierNum",_loc2_,param1));
         }
      }
      
      public function __ui_all_soundWhenHealed_change(param1:ListEvent) : void
      {
         MgbActor.playCannedSound(String(ui_all_soundWhenHealed.selectedItem));
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_downYN() : ComboBox
      {
         return this._1022854902ui_allchar_downYN;
      }
      
      public function loadActorByName(param1:String) : void
      {
         actorPiece.loadByName(mgbSession.userName,mgbSession.activeProject,param1,loadCompleteHandler);
         tagCheck("load_from_doubleclick");
      }
      
      public function __ui_item_itemActivationType_change(param1:ListEvent) : void
      {
         itemDeterminantChanged();
      }
      
      public function set ui_item_equippedNewMeleeDamageBonusNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._364073846ui_item_equippedNewMeleeDamageBonusNum;
         if(_loc2_ !== param1)
         {
            this._364073846ui_item_equippedNewMeleeDamageBonusNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewMeleeDamageBonusNum",_loc2_,param1));
         }
      }
      
      public function ___ActorMakerControl_LinkButton3_click(param1:MouseEvent) : void
      {
         ui_npc_takesObjectOnChoice1.text = "";
      }
      
      public function set fi_item_autoEquip(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._798141585fi_item_autoEquip;
         if(_loc2_ !== param1)
         {
            this._798141585fi_item_autoEquip = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_autoEquip",_loc2_,param1));
         }
      }
      
      private function chooseActorForDropClickHandler() : void
      {
         var _loc1_:ChoosePieceForm = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
         _loc1_.configure(mgbSession.userName,mgbSession.activeProject,Piece.MGB_ACTOR);
         _loc1_.addEventListener("change",processChooseActorForDropFromSelection);
         tagCheck("choose_drop_actor");
      }
      
      public function set fi_item_itemActivationType(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1470857069fi_item_itemActivationType;
         if(_loc2_ !== param1)
         {
            this._1470857069fi_item_itemActivationType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_itemActivationType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainViewStack() : ViewStack
      {
         return this._1703153366mainViewStack;
      }
      
      public function set animationEntryPreview(param1:DataGridColumn) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1778337638animationEntryPreview;
         if(_loc2_ !== param1)
         {
            this._1778337638animationEntryPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animationEntryPreview",_loc2_,param1));
         }
      }
      
      private function processChooseActorForShotFromSelection(param1:ChoosePieceEvent) : void
      {
         var _loc2_:MgbActor = null;
         if(param1.activating)
         {
            _loc2_ = MgbActor(actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,param1.pieceName));
            if(Boolean(_loc2_) && _loc2_.actorXML.databag.all.actorType != MgbActor.alActorType_Shot)
            {
               Alert.show("You should choose a SHOT-type actor for shots. The \'" + param1.pieceName + "\' actor is a " + MgbActor.alActorType[_loc2_.actorXML.databag.all.actorType] + " so won\'t work...","Warning");
            }
            else
            {
               TextInput(param1.contextHint).text = param1.pieceName;
            }
            tagCheck("choose_shot_actor_complete");
            updateFormsFromNames();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_dropsObjectOnChoice1() : TextInput
      {
         return this._1799886537ui_npc_dropsObjectOnChoice1;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_dropsObjectOnChoice2() : TextInput
      {
         return this._1799886536ui_npc_dropsObjectOnChoice2;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_dropsObjectOnChoice3() : TextInput
      {
         return this._1799886535ui_npc_dropsObjectOnChoice3;
      }
      
      public function set ui_allchar_meleeDamageToNPCorItemNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._826476698ui_allchar_meleeDamageToNPCorItemNum;
         if(_loc2_ !== param1)
         {
            this._826476698ui_allchar_meleeDamageToNPCorItemNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_meleeDamageToNPCorItemNum",_loc2_,param1));
         }
      }
      
      private function updateSupportedLayerInfo() : void
      {
         okForBackground = wrapText(GameEngineTwoEditor.actorXMLOkForLayer(MgbMap.layerBackground,actorDestData));
         okForActive = wrapText(GameEngineTwoEditor.actorXMLOkForLayer(MgbMap.layerActive,actorDestData));
         okForForeground = wrapText(GameEngineTwoEditor.actorXMLOkForLayer(MgbMap.layerForeground,actorDestData));
      }
      
      public function set ui_npc_canOccupyPlayerSpaceYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._168712356ui_npc_canOccupyPlayerSpaceYN;
         if(_loc2_ !== param1)
         {
            this._168712356ui_npc_canOccupyPlayerSpaceYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_canOccupyPlayerSpaceYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum() : FormItem
      {
         return this._1757821242fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum;
      }
      
      public function set ui_allchar_meleeRepeatDelay(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1767650137ui_allchar_meleeRepeatDelay;
         if(_loc2_ !== param1)
         {
            this._1767650137ui_allchar_meleeRepeatDelay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_meleeRepeatDelay",_loc2_,param1));
         }
      }
      
      public function __ui_itemOrNPC_dropsObjectWhenKilledName_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_itemOrNPC_dropsObjectWhenKilledName);
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePreview() : BitmapDuper
      {
         return this._2101909190tilePreview;
      }
      
      private function chooseTile() : void
      {
         var _loc1_:ChoosePieceForm = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
         _loc1_.configure(mgbSession.userName,mgbSession.activeProject,Piece.MGB_TILE);
         _loc1_.addEventListener("change",processAnimLoadTileFromSelection);
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_dropsObjectWhenKilledName() : TextInput
      {
         return this._1201781094ui_itemOrNPC_dropsObjectWhenKilledName;
      }
      
      public function set ui_item_equippedNewShotSound(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._422470475ui_item_equippedNewShotSound;
         if(_loc2_ !== param1)
         {
            this._422470475ui_item_equippedNewShotSound = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewShotSound",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_appearCount() : NumericStepper
      {
         return this._135307643ui_itemOrNPC_appearCount;
      }
      
      public function set actorSummaryText(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2066104130actorSummaryText;
         if(_loc2_ !== param1)
         {
            this._2066104130actorSummaryText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorSummaryText",_loc2_,param1));
         }
      }
      
      public function ___ActorMakerControl_LinkButton8_click(param1:MouseEvent) : void
      {
         ui_item_equippedNewActorGraphics.text = "";
      }
      
      private function processLoadTileFromSelection(param1:ChoosePieceEvent) : void
      {
         if(param1.activating)
         {
            actorPiece.tilename = param1.pieceName;
            tagCheck("choose_tile_complete");
            updateFormsFromNames();
         }
      }
      
      public function __ButtonChooseTile_click(param1:MouseEvent) : void
      {
         loadTileClickHandler();
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewShotRateBonusNum() : NumericStepper
      {
         return this._889053569ui_item_equippedNewShotRateBonusNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_inventoryEquipSlot() : FormItem
      {
         return this._1859488130fi_item_inventoryEquipSlot;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_upYN() : ComboBox
      {
         return this._1590501763ui_allchar_upYN;
      }
      
      public function set ui_item_visualEffectWhenUsedType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._394931005ui_item_visualEffectWhenUsedType;
         if(_loc2_ !== param1)
         {
            this._394931005ui_item_visualEffectWhenUsedType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_visualEffectWhenUsedType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get recentSuggestedTileName() : String
      {
         return this._292515455recentSuggestedTileName;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewMeleeSound() : ComboBox
      {
         return this._1222971771ui_item_equippedNewMeleeSound;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_dropsObjectRandomlyName() : FormItem
      {
         return this._662794638fi_itemOrNPC_dropsObjectRandomlyName;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_conditionsActor() : TextInput
      {
         return this._1287285162ui_allchar_conditionsActor;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_respawnOption() : FormItem
      {
         return this._1647541843fi_itemOrNPC_respawnOption;
      }
      
      public function set ui_allchar_touchDamageAttackChance(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._238171945ui_allchar_touchDamageAttackChance;
         if(_loc2_ !== param1)
         {
            this._238171945ui_allchar_touchDamageAttackChance = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_touchDamageAttackChance",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewShotRateBonus() : FormItem
      {
         return this._860144052fi_item_equippedNewShotRateBonus;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_autoEquipYN() : ComboBox
      {
         return this._1567256139ui_item_autoEquipYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_shotRangeNum() : NumericStepper
      {
         return this._1341962678ui_allchar_shotRangeNum;
      }
      
      public function set pageItemOrNPC(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2087720740pageItemOrNPC;
         if(_loc2_ !== param1)
         {
            this._2087720740pageItemOrNPC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageItemOrNPC",_loc2_,param1));
         }
      }
      
      public function set fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1207526179fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum;
         if(_loc2_ !== param1)
         {
            this._1207526179fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_soundWhenMelee(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._315122910ui_allchar_soundWhenMelee;
         if(_loc2_ !== param1)
         {
            this._315122910ui_allchar_soundWhenMelee = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_soundWhenMelee",_loc2_,param1));
         }
      }
      
      public function __ui_item_equippedNewShotActor_click(param1:MouseEvent) : void
      {
         chooseActorForShotClickHandler(ui_item_equippedNewShotActor);
      }
      
      public function set animationGrid(param1:DataGrid) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2030811370animationGrid;
         if(_loc2_ !== param1)
         {
            this._2030811370animationGrid = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animationGrid",_loc2_,param1));
         }
      }
      
      public function set fi_item_equippedNewShotRangeBonus(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1763226861fi_item_equippedNewShotRangeBonus;
         if(_loc2_ !== param1)
         {
            this._1763226861fi_item_equippedNewShotRangeBonus = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewShotRangeBonus",_loc2_,param1));
         }
      }
      
      public function set ui_item_equippedNewShotRangeBonusNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._31197418ui_item_equippedNewShotRangeBonusNum;
         if(_loc2_ !== param1)
         {
            this._31197418ui_item_equippedNewShotRangeBonusNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewShotRangeBonusNum",_loc2_,param1));
         }
      }
      
      public function set ButtonNew(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2015528174ButtonNew;
         if(_loc2_ !== param1)
         {
            this._2015528174ButtonNew = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonNew",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_gainExtraLifeYN() : ComboBox
      {
         return this._377594337ui_item_gainExtraLifeYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_gainPowerType() : FormItem
      {
         return this._735562224fi_item_gainPowerType;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_all_max_health() : FormItem
      {
         return this._260808207fi_all_max_health;
      }
      
      private function _ActorMakerControl_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = TilePreviewControlForActorMaker;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_soundWhenKilled() : ComboBox
      {
         return this._1989378557ui_all_soundWhenKilled;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takesObjectCountOnChoice2Num() : NumericStepper
      {
         return this._1488715263ui_npc_takesObjectCountOnChoice2Num;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_gainPowerSecondsNum() : NumericStepper
      {
         return this._1762474508ui_item_gainPowerSecondsNum;
      }
      
      public function __ui_allchar_soundWhenMelee_change(param1:ListEvent) : void
      {
         MgbActor.playCannedSound(String(ui_allchar_soundWhenMelee.selectedItem));
      }
      
      private function validateLoadedActor() : void
      {
         if(ui_allchar_touchDamageAttackChance.value == 0)
         {
            ui_allchar_touchDamageAttackChance.value = 100;
         }
         if(ui_itemOrNPC_dropsObjectWhenKilledChance.value == 0)
         {
            ui_itemOrNPC_dropsObjectWhenKilledChance.value = 100;
         }
         if(ui_itemOrNPC_dropsObjectWhenKilledChance2.value == 0)
         {
            ui_itemOrNPC_dropsObjectWhenKilledChance2.value = 100;
         }
         if(ui_itemOrNPC_dropsObjectRandomlyChance.value == 0)
         {
            ui_itemOrNPC_dropsObjectRandomlyChance.value = 100;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_soundWhenHarmed() : ComboBox
      {
         return this._1896282643ui_all_soundWhenHarmed;
      }
      
      public function set ui_allchar_downYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1022854902ui_allchar_downYN;
         if(_loc2_ !== param1)
         {
            this._1022854902ui_allchar_downYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_downYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get actorPiece() : MgbActor
      {
         return this._1354243591actorPiece;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_soundWhenHealed() : ComboBox
      {
         return this._1899469319ui_all_soundWhenHealed;
      }
      
      public function set ui_all_visualEffectWhenHarmedType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1492195071ui_all_visualEffectWhenHarmedType;
         if(_loc2_ !== param1)
         {
            this._1492195071ui_all_visualEffectWhenHarmedType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_visualEffectWhenHarmedType",_loc2_,param1));
         }
      }
      
      private function chooseActorForNewGraphicsClickHandler(param1:TextInput) : void
      {
         var _loc2_:ChoosePieceForm = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
         _loc2_.configure(mgbSession.userName,mgbSession.activeProject,Piece.MGB_ACTOR);
         _loc2_.contextHint = param1;
         _loc2_.addEventListener("change",processChooseActorForNewGraphicsFromSelection);
         tagCheck("choose_graphics_actor_choice");
      }
      
      public function set fi_allchar_leftYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._371633440fi_allchar_leftYN;
         if(_loc2_ !== param1)
         {
            this._371633440fi_allchar_leftYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_allchar_leftYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pageItem() : Canvas
      {
         return this._859140674pageItem;
      }
      
      [Bindable(event="propertyChange")]
      public function get PanelViewActualSize() : Panel
      {
         return this._1941824968PanelViewActualSize;
      }
      
      private function _ActorMakerControl_XML1_i() : XML
      {
         var _loc1_:XML = <actor xmlns=""><databag xmlns=""><all xmlns=""><actorType xmlns=""></actorType><description xmlns=""></description><initialHealthNum xmlns=""></initialHealthNum><initialMaxHealthNum xmlns=""></initialMaxHealthNum><gravityYN xmlns=""></gravityYN><soundWhenHarmed xmlns=""></soundWhenHarmed><soundWhenHealed xmlns=""></soundWhenHealed><soundWhenKilled xmlns=""></soundWhenKilled><visualEffectWhenHarmedType xmlns=""></visualEffectWhenHarmedType><visualEffectWhenHealedType xmlns=""></visualEffectWhenHealedType><visualEffectWhenKilledType xmlns=""></visualEffectWhenKilledType></all><allchar xmlns=""><movementSpeedNum xmlns=""></movementSpeedNum><upYN xmlns=""></upYN><downYN xmlns=""></downYN><leftYN xmlns=""></leftYN><rightYN xmlns=""></rightYN><shotRateNum xmlns=""></shotRateNum><shotRangeNum xmlns=""></shotRangeNum><soundWhenShooting xmlns=""></soundWhenShooting><shotActor xmlns=""></shotActor><pushYN xmlns=""></pushYN><jumpYN xmlns=""></jumpYN><shotDamageToPlayerNum xmlns=""></shotDamageToPlayerNum><shotDamageToNPCorItemNum xmlns=""></shotDamageToNPCorItemNum><touchDamageToPlayerNum xmlns=""></touchDamageToPlayerNum><touchDamageToNPCorItemNum xmlns=""></touchDamageToNPCorItemNum><touchDamageAttackChance xmlns=""></touchDamageAttackChance><touchDamageCases xmlns=""></touchDamageCases><meleeDamageToPlayerNum xmlns=""></meleeDamageToPlayerNum><meleeDamageToNPCorItemNum xmlns=""></meleeDamageToNPCorItemNum><soundWhenMelee xmlns=""></soundWhenMelee><meleeRepeatDelay xmlns=""></meleeRepeatDelay></allchar><playercharacter xmlns=""></playercharacter><npc xmlns=""><movementType xmlns=""></movementType><aggroRange xmlns=""></aggroRange><canOccupyPlayerSpaceYN xmlns=""></canOccupyPlayerSpaceYN><shotAccuracyType xmlns=""></shotAccuracyType><talkText xmlns=""></talkText><talkTextFontIndex xmlns=""></talkTextFontIndex><responseChoice1 xmlns=""></responseChoice1><takesObjectOnChoice1 xmlns=""></takesObjectOnChoice1><takesObjectCountOnChoice1Num xmlns=""></takesObjectCountOnChoice1Num><takeObjectTypeOnChoice1 xmlns=""></takeObjectTypeOnChoice1><dropsObjectOnChoice1 xmlns=""></dropsObjectOnChoice1><responseChoice1DropPersistsYN xmlns=""></responseChoice1DropPersistsYN><responseChoice1StayYN xmlns=""></responseChoice1StayYN><saysWhatOnChoice1 xmlns=""></saysWhatOnChoice1><responseChoice2 xmlns=""></responseChoice2><takesObjectOnChoice2 xmlns=""></takesObjectOnChoice2><takesObjectCountOnChoice2Num xmlns=""></takesObjectCountOnChoice2Num><takeObjectTypeOnChoice2 xmlns=""></takeObjectTypeOnChoice2><dropsObjectOnChoice2 xmlns=""></dropsObjectOnChoice2><responseChoice2DropPersistsYN xmlns=""></responseChoice2DropPersistsYN><responseChoice2StayYN xmlns=""></responseChoice2StayYN><saysWhatOnChoice2 xmlns=""></saysWhatOnChoice2><responseChoice3 xmlns=""></responseChoice3><takesObjectOnChoice3 xmlns=""></takesObjectOnChoice3><takesObjectCountOnChoice3Num xmlns=""></takesObjectCountOnChoice3Num><takeObjectTypeOnChoice3 xmlns=""></takeObjectTypeOnChoice3><dropsObjectOnChoice3 xmlns=""></dropsObjectOnChoice3><responseChoice3DropPersistsYN xmlns=""></responseChoice3DropPersistsYN><responseChoice3StayYN xmlns=""></responseChoice3StayYN><saysWhatOnChoice3 xmlns=""></saysWhatOnChoice3></npc><item xmlns=""><itemActivationType xmlns=""></itemActivationType><inventoryEquippableYN xmlns=""></inventoryEquippableYN><inventoryEquipSlot xmlns=""></inventoryEquipSlot><visualEffectWhenUsedType xmlns=""></visualEffectWhenUsedType><pushToSlideNum xmlns=""></pushToSlideNum><squishPlayerYN xmlns=""></squishPlayerYN><squishNPCYN xmlns=""></squishNPCYN><healOrHarmWhenUsedNum xmlns=""></healOrHarmWhenUsedNum><increasesMaxHealthNum xmlns=""></increasesMaxHealthNum><gainExtraLifeYN xmlns=""></gainExtraLifeYN><gainOrLosePointsNum xmlns=""></gainOrLosePointsNum><winLevelYN xmlns=""></winLevelYN><gainPowerType xmlns=""></gainPowerType><gainPowerSecondsNum xmlns=""></gainPowerSecondsNum><useText xmlns=""></useText><itemPushesActorType xmlns=""></itemPushesActorType><itemPushesActorDistance xmlns=""></itemPushesActorDistance><keyForThisDoor xmlns=""></keyForThisDoor><keyForThisDoorConsumedYN xmlns=""></keyForThisDoorConsumedYN><autoEquipYN xmlns=""></autoEquipYN><equippedNewActorGraphics xmlns=""></equippedNewActorGraphics><equippedNewShotActor xmlns=""></equippedNewShotActor><equippedNewShotSound xmlns=""></equippedNewShotSound><equippedNewShotDamageBonusNum xmlns=""></equippedNewShotDamageBonusNum><equippedNewShotRateBonusNum xmlns=""></equippedNewShotRateBonusNum><equippedNewShotRangeBonusNum xmlns=""></equippedNewShotRangeBonusNum><equippedArmorEffect xmlns=""></equippedArmorEffect><equippedNewMeleeDamageBonusNum xmlns=""></equippedNewMeleeDamageBonusNum><equippedNewMeleeSound xmlns=""></equippedNewMeleeSound><equippedNewMeleeRepeatDelayModifierNum xmlns=""></equippedNewMeleeRepeatDelayModifierNum></item><itemOrNPC xmlns=""><destroyableYN xmlns=""></destroyableYN><scoreOrLosePointsWhenShotByPlayerNum xmlns=""></scoreOrLosePointsWhenShotByPlayerNum><scoreOrLosePointsWhenKilledByPlayerNum xmlns=""></scoreOrLosePointsWhenKilledByPlayerNum><dropsObjectWhenKilledName xmlns=""></dropsObjectWhenKilledName><dropsObjectWhenKilledChance xmlns=""></dropsObjectWhenKilledChance><dropsObjectWhenKilledName2 xmlns=""></dropsObjectWhenKilledName2><dropsObjectWhenKilledChance2 xmlns=""></dropsObjectWhenKilledChance2><dropsObjectRandomlyName xmlns=""></dropsObjectRandomlyName><dropsObjectRandomlyChance xmlns=""></dropsObjectRandomlyChance><respawnOption xmlns=""></respawnOption><appearIf xmlns=""></appearIf><appearCount xmlns=""></appearCount><conditionsActor xmlns=""></conditionsActor></itemOrNPC></databag></actor>;
         actorDestData = _loc1_;
         BindingManager.executeBindings(this,"actorDestData",actorDestData);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonChooseTile() : Button
      {
         return this._461583785ButtonChooseTile;
      }
      
      public function set mainViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1703153366mainViewStack;
         if(_loc2_ !== param1)
         {
            this._1703153366mainViewStack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainViewStack",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_gainOrLosePointsNum() : FormItem
      {
         return this._797619652fi_item_gainOrLosePointsNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_dropsObjectWhenKilledChance() : FormItem
      {
         return this._1192236482fi_itemOrNPC_dropsObjectWhenKilledChance;
      }
      
      [Bindable(event="propertyChange")]
      public function get tileSummaryText() : Text
      {
         return this._537959013tileSummaryText;
      }
      
      [Bindable(event="propertyChange")]
      public function get pageAllChars() : Canvas
      {
         return this._26865045pageAllChars;
      }
      
      public function set ui_npc_dropsObjectOnChoice1(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1799886537ui_npc_dropsObjectOnChoice1;
         if(_loc2_ !== param1)
         {
            this._1799886537ui_npc_dropsObjectOnChoice1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_dropsObjectOnChoice1",_loc2_,param1));
         }
      }
      
      public function set ui_npc_dropsObjectOnChoice2(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1799886536ui_npc_dropsObjectOnChoice2;
         if(_loc2_ !== param1)
         {
            this._1799886536ui_npc_dropsObjectOnChoice2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_dropsObjectOnChoice2",_loc2_,param1));
         }
      }
      
      public function set ui_npc_dropsObjectOnChoice3(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1799886535ui_npc_dropsObjectOnChoice3;
         if(_loc2_ !== param1)
         {
            this._1799886535ui_npc_dropsObjectOnChoice3 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_dropsObjectOnChoice3",_loc2_,param1));
         }
      }
      
      public function set fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1757821242fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum;
         if(_loc2_ !== param1)
         {
            this._1757821242fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get okForForeground() : String
      {
         return this._648196720okForForeground;
      }
      
      public function set tilePreview(param1:BitmapDuper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2101909190tilePreview;
         if(_loc2_ !== param1)
         {
            this._2101909190tilePreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilePreview",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actorDestData() : XML
      {
         return this._78678657actorDestData;
      }
      
      public function __ui_itemOrNPC_destroyableYN_change(param1:ListEvent) : void
      {
         damageRulesChanged();
      }
      
      public function __ui_item_equippedNewActorGraphics_click(param1:MouseEvent) : void
      {
         chooseActorForNewGraphicsClickHandler(ui_item_equippedNewActorGraphics);
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewShotDamageBonusNum() : NumericStepper
      {
         return this._1861231248ui_item_equippedNewShotDamageBonusNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_meleeDamageToPlayerNum() : NumericStepper
      {
         return this._1608346234ui_allchar_meleeDamageToPlayerNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice3DropPersistsYN() : ComboBox
      {
         return this._2116756853ui_npc_responseChoice3DropPersistsYN;
      }
      
      public function ___ActorMakerControl_LinkButton1_click(param1:MouseEvent) : void
      {
         ui_allchar_shotActor.text = "";
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_squishPlayerYN() : ComboBox
      {
         return this._7296354ui_item_squishPlayerYN;
      }
      
      private function processChooseActorForNewGraphicsFromSelection(param1:ChoosePieceEvent) : void
      {
         var _loc2_:MgbActor = null;
         if(param1.activating)
         {
            _loc2_ = MgbActor(actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,param1.pieceName));
            TextInput(param1.contextHint).text = param1.pieceName;
            tagCheck("choose_graphics_actor_choice_complete");
            updateFormsFromNames();
         }
      }
      
      private function movementSpeedChanged() : void
      {
         var _loc1_:* = ui_allchar_movementSpeedNum.value > 0;
         fi_allchar_upYN.enabled = _loc1_;
         fi_allchar_downYN.enabled = _loc1_;
         fi_allchar_leftYN.enabled = _loc1_;
         fi_allchar_rightYN.enabled = _loc1_;
         fi_allchar_pushYN.enabled = _loc1_;
         fi_allchar_jumpYN.enabled = _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_dropsObjectWhenKilledChance2() : NumericStepper
      {
         return this._1569725757ui_itemOrNPC_dropsObjectWhenKilledChance2;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_dropsObjectRandomlyChance() : NumericStepper
      {
         return this._296058168ui_itemOrNPC_dropsObjectRandomlyChance;
      }
      
      public function set ui_itemOrNPC_dropsObjectWhenKilledName(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1201781094ui_itemOrNPC_dropsObjectWhenKilledName;
         if(_loc2_ !== param1)
         {
            this._1201781094ui_itemOrNPC_dropsObjectWhenKilledName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_dropsObjectWhenKilledName",_loc2_,param1));
         }
      }
      
      public function __ui_allchar_shotActor_click(param1:MouseEvent) : void
      {
         chooseActorForShotClickHandler(ui_allchar_shotActor);
      }
      
      public function __ui_item_equippedNewMeleeSound_change(param1:ListEvent) : void
      {
         MgbActor.playCannedSound(String(ui_item_equippedNewMeleeSound.selectedItem));
      }
      
      public function set animations(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._314070383animations;
         if(_loc2_ !== param1)
         {
            this._314070383animations = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animations",_loc2_,param1));
         }
      }
      
      public function ___ActorMakerControl_LinkButton6_click(param1:MouseEvent) : void
      {
         ui_npc_dropsObjectOnChoice3.text = "";
      }
      
      private function processNewActorHandler(param1:ChooseNewActorEvent = null) : void
      {
         trace("Create new actor(" + (!!param1 ? param1.actorTemplate : "null") + ")");
         actorPiece.newActor();
         setActorDefaults();
         ui_allchar_shotActor.text = "";
         ui_allchar_shotRateNum.value = 1;
         ui_allchar_touchDamageAttackChance.value = 100;
         ui_itemOrNPC_destroyableYN.selectedIndex = 1;
         ui_allchar_movementSpeedNum.value = 1;
         ui_allchar_upYN.selectedIndex = 1;
         ui_allchar_downYN.selectedIndex = 1;
         ui_allchar_leftYN.selectedIndex = 1;
         ui_allchar_rightYN.selectedIndex = 1;
         ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_Inactive;
         ui_item_itemPushesActorType.selectedIndex = MgbActor.alItemPushesActorType_onwards;
         ui_item_itemPushesActorDistance.value = 1;
         ui_item_equippedNewShotActor.text = "";
         ui_item_keyForThisDoor.text = "";
         ui_item_inventoryEquipSlot.text = "";
         ui_item_equippedNewShotActor.text = "";
         ui_allchar_conditionsActor.text = "";
         ui_item_equippedNewActorGraphics.text = "";
         ui_item_useText.text = "";
         ui_item_visualEffectWhenUsedType.text = "";
         ui_item_pushToSlideNum.value = 0;
         ui_all_soundWhenHarmed.selectedIndex = 0;
         ui_all_soundWhenHealed.selectedIndex = 0;
         ui_all_soundWhenKilled.selectedIndex = 0;
         ui_allchar_soundWhenShooting.selectedIndex = 0;
         ui_itemOrNPC_respawnOption.selectedIndex = 0;
         ui_itemOrNPC_dropsObjectWhenKilledChance.value = 100;
         ui_itemOrNPC_dropsObjectWhenKilledChance2.value = 100;
         ui_itemOrNPC_dropsObjectRandomlyChance.value = 100;
         actorPiece.comment = "";
         actorPiece.tilename = recentSuggestedTileName;
         recentSuggestedTileName = null;
         if(param1)
         {
            actorPiece.comment = new String(param1.actorTemplate + "... ");
            switch(param1.actorTemplate)
            {
               case MgbActor.alTemplatePlayer:
               case MgbActor.alTemplatePlayer_TouchDamage:
               case MgbActor.alTemplatePlayer_MeleeDamage:
               case MgbActor.alTemplatePlayer_Shoots:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Player;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_BlocksPlayerAndNPC;
                  switch(param1.actorTemplate)
                  {
                     case MgbActor.alTemplatePlayer_TouchDamage:
                        ui_allchar_touchDamageToNPCorItemNum.value = 10;
                        break;
                     case MgbActor.alTemplatePlayer_MeleeDamage:
                        ui_allchar_meleeDamageToNPCorItemNum.value = 10;
                        break;
                     case MgbActor.alTemplatePlayer_Shoots:
                        ui_allchar_shotDamageToNPCorItemNum.value = 10;
                        ui_allchar_shotRateNum.value = 5;
                        ui_allchar_shotRangeNum.value = 10;
                        ui_allchar_shotActor.text = "!!CHOOSE ACTOR!!";
                  }
                  break;
               case MgbActor.alTemplateEnemy:
               case MgbActor.alTemplateEnemy_TouchDamageHuntsPlayer:
               case MgbActor.alTemplateEnemy_TouchDamage:
               case MgbActor.alTemplateEnemy_MeleeDamage:
               case MgbActor.alTemplateEnemy_ShootsFromAfar:
               case MgbActor.alTemplateEnemy_Shoots:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_NPC;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_BlocksPlayerAndNPC;
                  ui_npc_movementType.selectedIndex = MgbActor.alMovementType_Random;
                  switch(param1.actorTemplate)
                  {
                     case MgbActor.alTemplateEnemy_TouchDamageHuntsPlayer:
                        ui_npc_movementType.selectedIndex = MgbActor.alMovementType_ToPlayer;
                     case MgbActor.alTemplateEnemy_TouchDamage:
                        ui_allchar_touchDamageToPlayerNum.value = 10;
                        break;
                     case MgbActor.alTemplateEnemy_MeleeDamage:
                        ui_allchar_meleeDamageToPlayerNum.value = 10;
                        break;
                     case MgbActor.alTemplateEnemy_ShootsFromAfar:
                        ui_npc_movementType.selectedIndex = MgbActor.alMovementType_FromPlayer;
                     case MgbActor.alTemplateEnemy_Shoots:
                        ui_allchar_shotDamageToPlayerNum.value = 10;
                        ui_allchar_shotRateNum.value = 5;
                        ui_allchar_shotRangeNum.value = 10;
                        ui_allchar_shotActor.text = "!!CHOOSE ACTOR!!";
                  }
                  break;
               case MgbActor.alTemplateEnemy_stationary:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_NPC;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_BlocksPlayerAndNPC;
                  break;
               case MgbActor.alTemplateFriend:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_NPC;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_allchar_movementSpeedNum.value = 0;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_BlocksPlayerAndNPC;
                  break;
               case MgbActor.alTemplateFloor:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_allchar_movementSpeedNum.value = 0;
                  break;
               case MgbActor.alTemplateFloor_Damager:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_CausesDamage;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_allchar_movementSpeedNum.value = 0;
                  ui_item_healOrHarmWhenUsedNum.value = 10;
                  break;
               case MgbActor.alTemplateWall:
               case MgbActor.alTemplateWall_BlocksNPC:
               case MgbActor.alTemplateWall_BlocksPlayer:
               case MgbActor.alTemplateDoor:
               case MgbActor.alTemplateWall_Conditional:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_allchar_movementSpeedNum.value = 0;
                  switch(param1.actorTemplate)
                  {
                     case MgbActor.alTemplateDoor:
                        ui_item_keyForThisDoor.text = "!!CHOOSE ACTOR!!";
                     case MgbActor.alTemplateWall:
                        ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_BlocksPlayerAndNPC;
                        break;
                     case MgbActor.alTemplateWall_BlocksNPC:
                        ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_BlocksNPC;
                        break;
                     case MgbActor.alTemplateWall_BlocksPlayer:
                        ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_BlocksPlayer;
                        break;
                     case MgbActor.alTemplateWall_Conditional:
                        ui_itemOrNPC_appearIf.selectedIndex = MgbActor.alAppearDisappear_Disappear;
                        ui_itemOrNPC_appearCount.value = 0;
                        ui_allchar_conditionsActor.text = "!!CHOOSE ACTOR!!";
                  }
                  break;
               case MgbActor.alTemplateItem:
               case MgbActor.alTemplateItem_MaxHealthBoost:
               case MgbActor.alTemplateItem_HealNow:
               case MgbActor.alTemplateItem_HealLater:
               case MgbActor.alTemplateItem_PoisonNow:
               case MgbActor.alTemplateItem_InvincibilityNow:
               case MgbActor.alTemplateItem_InvincibilityLater:
               case MgbActor.alTemplateItem_ScorePoints:
               case MgbActor.alTemplateItem_VictoryNow:
               case MgbActor.alTemplateItem:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PlayerPicksUpUsesNow;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_allchar_movementSpeedNum.value = 0;
                  switch(param1.actorTemplate)
                  {
                     case MgbActor.alTemplateItem_MaxHealthBoost:
                        ui_item_increasesMaxHealthNum.value = 5;
                        break;
                     case MgbActor.alTemplateItem_HealNow:
                        ui_item_healOrHarmWhenUsedNum.value = 10;
                        break;
                     case MgbActor.alTemplateItem_HealLater:
                        ui_item_healOrHarmWhenUsedNum.value = 10;
                        ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
                        break;
                     case MgbActor.alTemplateItem_PoisonNow:
                        ui_item_healOrHarmWhenUsedNum.value = -5;
                        ui_item_useText.text = "Aargh! Poison!";
                        break;
                     case MgbActor.alTemplateItem_InvincibilityNow:
                        ui_item_gainPowerType.selectedIndex = MgbActor.alGainPowerType_Invulnerable;
                        ui_item_gainPowerSecondsNum.value = 20;
                        ui_item_useText.text = "I feel invincible!!";
                        break;
                     case MgbActor.alTemplateItem_InvincibilityLater:
                        ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
                        ui_item_gainPowerType.selectedIndex = MgbActor.alGainPowerType_Invulnerable;
                        ui_item_gainPowerSecondsNum.value = 20;
                        ui_item_useText.text = "An invincibilty potion!!";
                        break;
                     case MgbActor.alTemplateItem_ScorePoints:
                        ui_item_gainOrLosePointsNum.value = 1;
                        break;
                     case MgbActor.alTemplateItem_VictoryNow:
                        ui_item_winLevelYN.selectedIndex = 1;
                  }
                  break;
               case MgbActor.alTemplateEnemyGenerator:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_allchar_movementSpeedNum.value = 0;
                  ui_itemOrNPC_dropsObjectRandomlyName.text = "!!CHOOSE ACTOR!!";
                  ui_itemOrNPC_dropsObjectRandomlyChance.value = 5;
                  break;
               case MgbActor.alTemplateProjectileWeapon:
                  ui_item_inventoryEquipSlot.text = "weapon";
                  ui_item_equippedNewShotActor.text = "!!CHOOSE ACTOR!!";
               case MgbActor.alTemplateShotModifier:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
                  ui_item_inventoryEquippableYN.selectedIndex = 1;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_item_equippedNewShotDamageBonusNum.value = 10;
                  ui_item_equippedNewShotRateBonusNum.value = 5;
                  ui_item_equippedNewShotRangeBonusNum.value = 6;
                  break;
               case MgbActor.alTemplateMeleeWeapon:
                  ui_item_inventoryEquipSlot.text = "weapon";
                  ui_item_equippedNewActorGraphics.text = "!!CHOOSE ACTOR!!";
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
                  ui_item_inventoryEquippableYN.selectedIndex = 1;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_item_equippedNewMeleeDamageBonusNum.value = 10;
                  ui_item_equippedNewMeleeRepeatDelayModifierNum.value = -1;
                  break;
               case MgbActor.alTemplateMeleeWeaponModifier:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
                  ui_item_inventoryEquippableYN.selectedIndex = 1;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_item_equippedNewMeleeDamageBonusNum.value = 10;
                  ui_item_equippedNewMeleeRepeatDelayModifierNum.value = -1;
                  break;
               case MgbActor.alTemplateArmor:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  ui_item_inventoryEquippableYN.selectedIndex = 1;
                  ui_item_inventoryEquipSlot.text = "armor";
                  ui_item_equippedArmorEffect.value = 10;
                  break;
               case MgbActor.alTemplateShot:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Shot;
                  ui_itemOrNPC_destroyableYN.selectedIndex = 0;
                  break;
               case MgbActor.alTemplateSlidingBlock:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_BlocksPlayerAndNPC;
                  ui_item_pushToSlideNum.value = 4;
                  ui_item_squishPlayerYN.selectedIndex = 1;
                  ui_item_squishNPCYN.selectedIndex = 1;
                  break;
               case MgbActor.alTemplateIce:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PushesActors;
                  ui_item_itemPushesActorType.selectedIndex = MgbActor.alItemPushesActorType_onwards;
                  ui_item_itemPushesActorDistance.value = 1;
                  break;
               case MgbActor.alTemplatePusher_North:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PushesActors;
                  ui_item_itemPushesActorType.selectedIndex = MgbActor.alItemPushesActorType_up;
                  ui_item_itemPushesActorDistance.value = 1;
                  break;
               case MgbActor.alTemplatePusher_East:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PushesActors;
                  ui_item_itemPushesActorType.selectedIndex = MgbActor.alItemPushesActorType_right;
                  ui_item_itemPushesActorDistance.value = 1;
                  break;
               case MgbActor.alTemplatePusher_South:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PushesActors;
                  ui_item_itemPushesActorType.selectedIndex = MgbActor.alItemPushesActorType_down;
                  ui_item_itemPushesActorDistance.value = 1;
                  break;
               case MgbActor.alTemplatePusher_West:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PushesActors;
                  ui_item_itemPushesActorType.selectedIndex = MgbActor.alItemPushesActorType_left;
                  ui_item_itemPushesActorDistance.value = 1;
                  break;
               case MgbActor.alTemplatePusher_Random:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PushesActors;
                  ui_item_itemPushesActorType.selectedIndex = MgbActor.alItemPushesActorType_random;
                  ui_item_itemPushesActorDistance.value = 1;
                  break;
               case MgbActor.alTemplateBounce:
                  ui_all_actorType.selectedIndex = MgbActor.alActorType_Item;
                  ui_item_itemActivationType.selectedIndex = MgbActor.alItemActivationType_PushesActors;
                  ui_item_itemPushesActorType.selectedIndex = MgbActor.alItemPushesActorType_backwards;
                  ui_item_itemPushesActorDistance.value = 1;
                  break;
               case MgbActor.alTemplateBlank:
            }
            tagCheck("new_" + param1.actorTemplate);
         }
         else
         {
            tagCheck("new_blank");
         }
         updateFormsFromNames();
         SetAllDeterminants();
         mainViewStackEnabled = true;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_all_killEffect() : FormItem
      {
         return this._1065255657fi_all_killEffect;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_pushToSlideNum() : NumericStepper
      {
         return this._752327403ui_item_pushToSlideNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum() : NumericStepper
      {
         return this._1323916564ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_shotDamageToNPCorItemNum() : NumericStepper
      {
         return this._187274522ui_allchar_shotDamageToNPCorItemNum;
      }
      
      public function set ui_itemOrNPC_appearCount(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._135307643ui_itemOrNPC_appearCount;
         if(_loc2_ !== param1)
         {
            this._135307643ui_itemOrNPC_appearCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_appearCount",_loc2_,param1));
         }
      }
      
      private function loadActorClickHandler() : void
      {
         actorPiece.loadUsingDialog(mgbSession.userName,mgbSession.activeProject,this,loadCompleteHandler);
         tagCheck("load");
      }
      
      public function ___ActorMakerControl_Button3_click(param1:MouseEvent) : void
      {
         checkForProblems();
      }
      
      public function set fi_itemOrNPC_dropsObjectRandomlyChance(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._981685623fi_itemOrNPC_dropsObjectRandomlyChance;
         if(_loc2_ !== param1)
         {
            this._981685623fi_itemOrNPC_dropsObjectRandomlyChance = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_dropsObjectRandomlyChance",_loc2_,param1));
         }
      }
      
      public function set myWD(param1:WipeDown) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._3366265myWD;
         if(_loc2_ !== param1)
         {
            this._3366265myWD = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myWD",_loc2_,param1));
         }
      }
      
      public function set ui_item_equippedNewShotRateBonusNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._889053569ui_item_equippedNewShotRateBonusNum;
         if(_loc2_ !== param1)
         {
            this._889053569ui_item_equippedNewShotRateBonusNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewShotRateBonusNum",_loc2_,param1));
         }
      }
      
      public function set fi_item_inventoryEquipSlot(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1859488130fi_item_inventoryEquipSlot;
         if(_loc2_ !== param1)
         {
            this._1859488130fi_item_inventoryEquipSlot = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_inventoryEquipSlot",_loc2_,param1));
         }
      }
      
      public function set ui_item_equippedNewMeleeSound(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1222971771ui_item_equippedNewMeleeSound;
         if(_loc2_ !== param1)
         {
            this._1222971771ui_item_equippedNewMeleeSound = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewMeleeSound",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_upYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1590501763ui_allchar_upYN;
         if(_loc2_ !== param1)
         {
            this._1590501763ui_allchar_upYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_upYN",_loc2_,param1));
         }
      }
      
      private function set recentSuggestedTileName(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._292515455recentSuggestedTileName;
         if(_loc2_ !== param1)
         {
            this._292515455recentSuggestedTileName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recentSuggestedTileName",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_pushYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._673888894ui_allchar_pushYN;
         if(_loc2_ !== param1)
         {
            this._673888894ui_allchar_pushYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_pushYN",_loc2_,param1));
         }
      }
      
      public function set myWR(param1:WipeRight) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._3366279myWR;
         if(_loc2_ !== param1)
         {
            this._3366279myWR = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myWR",_loc2_,param1));
         }
      }
      
      public function set myWU(param1:WipeUp) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._3366282myWU;
         if(_loc2_ !== param1)
         {
            this._3366282myWU = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myWU",_loc2_,param1));
         }
      }
      
      public function __ui_allchar_soundWhenShooting_change(param1:ListEvent) : void
      {
         MgbActor.playCannedSound(String(ui_allchar_soundWhenShooting.selectedItem));
      }
      
      public function __ButtonNew_click(param1:MouseEvent) : void
      {
         newActor();
      }
      
      public function set fi_itemOrNPC_dropsObjectRandomlyName(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._662794638fi_itemOrNPC_dropsObjectRandomlyName;
         if(_loc2_ !== param1)
         {
            this._662794638fi_itemOrNPC_dropsObjectRandomlyName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_dropsObjectRandomlyName",_loc2_,param1));
         }
      }
      
      public function set ui_item_gainOrLosePointsNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._741688715ui_item_gainOrLosePointsNum;
         if(_loc2_ !== param1)
         {
            this._741688715ui_item_gainOrLosePointsNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_gainOrLosePointsNum",_loc2_,param1));
         }
      }
      
      public function __ui_item_keyForThisDoor_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_item_keyForThisDoor);
      }
      
      public function __ui_npc_dropsObjectOnChoice3_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_npc_dropsObjectOnChoice3);
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_destroyableYN() : ComboBox
      {
         return this._2094566186ui_itemOrNPC_destroyableYN;
      }
      
      public function mgbLoginLogout(param1:Event) : void
      {
         if(mgbSession.userName)
         {
            if(Boolean(mainViewStackEnabled) && actorPiece.userName != mgbSession.userName)
            {
               recentSuggestedTileName = null;
               processNewActorHandler();
               mainViewStackEnabled = false;
            }
         }
      }
      
      public function set ui_allchar_jumpYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._845834858ui_allchar_jumpYN;
         if(_loc2_ !== param1)
         {
            this._845834858ui_allchar_jumpYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_jumpYN",_loc2_,param1));
         }
      }
      
      public function __ui_itemOrNPC_dropsObjectWhenKilledName2_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_itemOrNPC_dropsObjectWhenKilledName2);
      }
      
      public function set footer(param1:EditFooterComponent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1268861541footer;
         if(_loc2_ !== param1)
         {
            this._1268861541footer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"footer",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_movementSpeedNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._773014111ui_allchar_movementSpeedNum;
         if(_loc2_ !== param1)
         {
            this._773014111ui_allchar_movementSpeedNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_movementSpeedNum",_loc2_,param1));
         }
      }
      
      public function set ui_npc_takesObjectCountOnChoice1Num(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1488745054ui_npc_takesObjectCountOnChoice1Num;
         if(_loc2_ !== param1)
         {
            this._1488745054ui_npc_takesObjectCountOnChoice1Num = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takesObjectCountOnChoice1Num",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewShotDamageBonus() : FormItem
      {
         return this._888992581fi_item_equippedNewShotDamageBonus;
      }
      
      public function set ui_item_equippedNewShotActor(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._439452261ui_item_equippedNewShotActor;
         if(_loc2_ !== param1)
         {
            this._439452261ui_item_equippedNewShotActor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewShotActor",_loc2_,param1));
         }
      }
      
      public function __ui_item_gainPowerType_change(param1:ListEvent) : void
      {
         itemDeterminantChanged();
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_squishPlayerYN() : FormItem
      {
         return this._498776909fi_item_squishPlayerYN;
      }
      
      private function processChooseActorForDropFromSelection(param1:ChoosePieceEvent) : void
      {
         var _loc2_:MgbActor = null;
         if(param1.activating)
         {
            _loc2_ = MgbActor(actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,param1.pieceName));
            if(Boolean(_loc2_) && (_loc2_.actorXML.databag.all.actorType == MgbActor.alActorType_Shot || _loc2_.actorXML.databag.all.actorType == MgbActor.alActorType_Player))
            {
               Alert.show("You can only drop Item-type or NPC-type Actors. The \'" + param1.pieceName + "\' actor is a " + MgbActor.alActorType[_loc2_.actorXML.databag.all.actorType] + " so won\'t work here...","Warning");
            }
            else
            {
               ui_itemOrNPC_dropsObjectWhenKilledName.text = param1.pieceName;
            }
            tagCheck("choose_drop_actor_complete");
            updateFormsFromNames();
         }
      }
      
      public function set fi_itemOrNPC_respawnOption(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1647541843fi_itemOrNPC_respawnOption;
         if(_loc2_ !== param1)
         {
            this._1647541843fi_itemOrNPC_respawnOption = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_respawnOption",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonLoad() : Button
      {
         return this._1943186600ButtonLoad;
      }
      
      public function set ui_allchar_conditionsActor(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1287285162ui_allchar_conditionsActor;
         if(_loc2_ !== param1)
         {
            this._1287285162ui_allchar_conditionsActor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_conditionsActor",_loc2_,param1));
         }
      }
      
      public function set ButtonHelp(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1943315021ButtonHelp;
         if(_loc2_ !== param1)
         {
            this._1943315021ButtonHelp = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonHelp",_loc2_,param1));
         }
      }
      
      public function set fi_itemOrNPC_dropsObjectWhenKilledChance2(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1695374772fi_itemOrNPC_dropsObjectWhenKilledChance2;
         if(_loc2_ !== param1)
         {
            this._1695374772fi_itemOrNPC_dropsObjectWhenKilledChance2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_dropsObjectWhenKilledChance2",_loc2_,param1));
         }
      }
      
      public function set ui_item_autoEquipYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1567256139ui_item_autoEquipYN;
         if(_loc2_ !== param1)
         {
            this._1567256139ui_item_autoEquipYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_autoEquipYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actormakerBackgroundColor() : SelectBackgroundColor
      {
         return this._657392486actormakerBackgroundColor;
      }
      
      public function set fi_item_equippedNewShotRateBonus(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._860144052fi_item_equippedNewShotRateBonus;
         if(_loc2_ !== param1)
         {
            this._860144052fi_item_equippedNewShotRateBonus = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewShotRateBonus",_loc2_,param1));
         }
      }
      
      private function _ActorMakerControl_WipeUp1_i() : WipeUp
      {
         var _loc1_:WipeUp = new WipeUp();
         myWU = _loc1_;
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_allchar_pushYN() : FormItem
      {
         return this._501302131fi_allchar_pushYN;
      }
      
      private function processAnimLoadTileFromSelection(param1:ChoosePieceEvent) : void
      {
         if(param1.activating)
         {
            actorPiece.animationTable[animationGrid.selectedIndex].tilename = param1.pieceName;
            actorPiece.animationTable.itemUpdated(actorPiece.animationTable[animationGrid.selectedIndex]);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_itemPushesActorDistance() : FormItem
      {
         return this._526910303fi_item_itemPushesActorDistance;
      }
      
      private function updateFormsFromNames() : void
      {
         tilePreview.drawDupeFromName(mgbSession.userName,mgbSession.activeProject,actorPiece.tilename);
         tileSummaryText.text = "Tile: " + (!!actorPiece.tilename ? actorPiece.tilename : "(Choose a tile)");
         actorSummaryText.text = "Actor Name: " + (!!actorPiece.name ? actorPiece.name : "(Not saved yet)");
         actorPreview.show(actorPiece);
         actorPiece.animationTable.itemUpdated(actorPiece.animationTable);
      }
      
      public function __ui_npc_takesObjectOnChoice2_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_npc_takesObjectOnChoice2);
      }
      
      public function set ui_allchar_shotRangeNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1341962678ui_allchar_shotRangeNum;
         if(_loc2_ !== param1)
         {
            this._1341962678ui_allchar_shotRangeNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_shotRangeNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_squishNPCYN() : FormItem
      {
         return this._782797953fi_item_squishNPCYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_TalkText() : TextArea
      {
         return this._126090114ui_npc_TalkText;
      }
      
      public function __ui_all_soundWhenHarmed_change(param1:ListEvent) : void
      {
         MgbActor.playCannedSound(String(ui_all_soundWhenHarmed.selectedItem));
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_allchar_jumpYN() : FormItem
      {
         return this._329356167fi_allchar_jumpYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedArmorEffect() : NumericStepper
      {
         return this._1241953424ui_item_equippedArmorEffect;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_dropsObjectWhenKilledName2() : TextInput
      {
         return this._1399491700ui_itemOrNPC_dropsObjectWhenKilledName2;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ActorMakerControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ActorMakerControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ActorMakerControlWatcherSetupUtil");
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
      
      public function set ui_item_squishNPCYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._564974130ui_item_squishNPCYN;
         if(_loc2_ !== param1)
         {
            this._564974130ui_item_squishNPCYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_squishNPCYN",_loc2_,param1));
         }
      }
      
      private function _ActorMakerControl_WipeRight1_i() : WipeRight
      {
         var _loc1_:WipeRight = new WipeRight();
         myWR = _loc1_;
         _loc1_.duration = 400;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_itemPushesActorType() : FormItem
      {
         return this._296399964fi_item_itemPushesActorType;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_pushToSlideNum() : FormItem
      {
         return this._1258400666fi_item_pushToSlideNum;
      }
      
      public function set pageNPC(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._803566126pageNPC;
         if(_loc2_ !== param1)
         {
            this._803566126pageNPC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageNPC",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_shotDamageToPlayerNum() : NumericStepper
      {
         return this._384693330ui_allchar_shotDamageToPlayerNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_soundWhenShooting() : ComboBox
      {
         return this._641752135ui_allchar_soundWhenShooting;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_healOrHarmWhenUsedNum() : FormItem
      {
         return this._1995996096fi_item_healOrHarmWhenUsedNum;
      }
      
      public function set ui_item_gainExtraLifeYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._377594337ui_item_gainExtraLifeYN;
         if(_loc2_ !== param1)
         {
            this._377594337ui_item_gainExtraLifeYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_gainExtraLifeYN",_loc2_,param1));
         }
      }
      
      public function ___ActorMakerControl_LinkButton12_click(param1:MouseEvent) : void
      {
         ui_itemOrNPC_dropsObjectWhenKilledName2.text = "";
      }
      
      public function set fi_item_equippedNewMeleeSound(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._583619092fi_item_equippedNewMeleeSound;
         if(_loc2_ !== param1)
         {
            this._583619092fi_item_equippedNewMeleeSound = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewMeleeSound",_loc2_,param1));
         }
      }
      
      public function set fi_item_gainPowerType(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._735562224fi_item_gainPowerType;
         if(_loc2_ !== param1)
         {
            this._735562224fi_item_gainPowerType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_gainPowerType",_loc2_,param1));
         }
      }
      
      public function set fi_all_healEffect(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1696365069fi_all_healEffect;
         if(_loc2_ !== param1)
         {
            this._1696365069fi_all_healEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_all_healEffect",_loc2_,param1));
         }
      }
      
      public function set fi_all_max_health(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._260808207fi_all_max_health;
         if(_loc2_ !== param1)
         {
            this._260808207fi_all_max_health = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_all_max_health",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_visualEffectWhenKilledType() : ComboBox
      {
         return this._2115933205ui_all_visualEffectWhenKilledType;
      }
      
      public function set ui_item_useText(param1:TextArea) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._583635469ui_item_useText;
         if(_loc2_ !== param1)
         {
            this._583635469ui_item_useText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_useText",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_keyForThisDoor() : TextInput
      {
         return this._1488305143ui_item_keyForThisDoor;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_increasesMaxHealthNum() : NumericStepper
      {
         return this._389868554ui_item_increasesMaxHealthNum;
      }
      
      public function set ui_all_soundWhenKilled(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1989378557ui_all_soundWhenKilled;
         if(_loc2_ !== param1)
         {
            this._1989378557ui_all_soundWhenKilled = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_soundWhenKilled",_loc2_,param1));
         }
      }
      
      public function set ui_npc_aggroRange(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1347758584ui_npc_aggroRange;
         if(_loc2_ !== param1)
         {
            this._1347758584ui_npc_aggroRange = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_aggroRange",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_inventoryEquippableYN() : ComboBox
      {
         return this._970025994ui_item_inventoryEquippableYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPreview() : ActorPreview
      {
         return this._205235219actorPreview;
      }
      
      private function set actorPiece(param1:MgbActor) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1354243591actorPiece;
         if(_loc2_ !== param1)
         {
            this._1354243591actorPiece = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPiece",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_dropsObjectWhenKilledName() : FormItem
      {
         return this._1815442411fi_itemOrNPC_dropsObjectWhenKilledName;
      }
      
      public function set ui_npc_takesObjectCountOnChoice2Num(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1488715263ui_npc_takesObjectCountOnChoice2Num;
         if(_loc2_ !== param1)
         {
            this._1488715263ui_npc_takesObjectCountOnChoice2Num = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takesObjectCountOnChoice2Num",_loc2_,param1));
         }
      }
      
      public function set ui_all_soundWhenHealed(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1899469319ui_all_soundWhenHealed;
         if(_loc2_ !== param1)
         {
            this._1899469319ui_all_soundWhenHealed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_soundWhenHealed",_loc2_,param1));
         }
      }
      
      public function set ui_item_gainPowerSecondsNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1762474508ui_item_gainPowerSecondsNum;
         if(_loc2_ !== param1)
         {
            this._1762474508ui_item_gainPowerSecondsNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_gainPowerSecondsNum",_loc2_,param1));
         }
      }
      
      private function _ActorMakerControl_DataGridColumn3_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.editable = true;
         _loc1_.headerText = "Effect";
         _loc1_.dataField = "effect";
         _loc1_.sortable = false;
         _loc1_.editorDataField = "newState";
         _loc1_.rendererIsEditor = true;
         _loc1_.itemRenderer = _ActorMakerControl_ClassFactory1_c();
         _loc1_.setStyle("textAlign","center");
         return _loc1_;
      }
      
      public function set ui_npc_responseChoice1DropPersistsYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._836893175ui_npc_responseChoice1DropPersistsYN;
         if(_loc2_ !== param1)
         {
            this._836893175ui_npc_responseChoice1DropPersistsYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice1DropPersistsYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_useText() : FormItem
      {
         return this._1722076124fi_item_useText;
      }
      
      public function set ui_all_soundWhenHarmed(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1896282643ui_all_soundWhenHarmed;
         if(_loc2_ !== param1)
         {
            this._1896282643ui_all_soundWhenHarmed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_soundWhenHarmed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_appearIf() : ComboBox
      {
         return this._2026736591ui_itemOrNPC_appearIf;
      }
      
      public function newActor(param1:String = null) : void
      {
         recentSuggestedTileName = param1;
         var _loc2_:ChooseNewActorForm = ChooseNewActorForm(PopUpManager.createPopUp(parent,ChooseNewActorForm,true));
         _loc2_.addEventListener("select",processNewActorHandler);
         tagCheck("new");
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_shotRateNum() : NumericStepper
      {
         return this._89797575ui_allchar_shotRateNum;
      }
      
      public function set ui_npc_responseChoice3Stay(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1531064799ui_npc_responseChoice3Stay;
         if(_loc2_ !== param1)
         {
            this._1531064799ui_npc_responseChoice3Stay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice3Stay",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hbox_item_keyForThisDoor() : HBox
      {
         return this._1238862778hbox_item_keyForThisDoor;
      }
      
      public function set ui_npc_takeObjectTypeOnChoice1(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2098866648ui_npc_takeObjectTypeOnChoice1;
         if(_loc2_ !== param1)
         {
            this._2098866648ui_npc_takeObjectTypeOnChoice1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takeObjectTypeOnChoice1",_loc2_,param1));
         }
      }
      
      public function set ui_npc_takeObjectTypeOnChoice2(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2098866647ui_npc_takeObjectTypeOnChoice2;
         if(_loc2_ !== param1)
         {
            this._2098866647ui_npc_takeObjectTypeOnChoice2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takeObjectTypeOnChoice2",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_keyForThisDoorConsumedYN() : ComboBox
      {
         return this._560364460ui_item_keyForThisDoorConsumedYN;
      }
      
      public function set fi_item_equippedNewShotSound(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._896389596fi_item_equippedNewShotSound;
         if(_loc2_ !== param1)
         {
            this._896389596fi_item_equippedNewShotSound = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewShotSound",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_all_sound_when_killed() : FormItem
      {
         return this._435860568fi_all_sound_when_killed;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_destroyableYN() : FormItem
      {
         return this._1629269081fi_itemOrNPC_destroyableYN;
      }
      
      public function set ui_npc_takeObjectTypeOnChoice3(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2098866646ui_npc_takeObjectTypeOnChoice3;
         if(_loc2_ !== param1)
         {
            this._2098866646ui_npc_takeObjectTypeOnChoice3 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takeObjectTypeOnChoice3",_loc2_,param1));
         }
      }
      
      private function SetAllDeterminants() : void
      {
         actorTypeChanged();
         itemDeterminantChanged();
         damageRulesChanged();
         movementSpeedChanged();
      }
      
      public function ___ActorMakerControl_LinkButton4_click(param1:MouseEvent) : void
      {
         ui_npc_dropsObjectOnChoice2.text = "";
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_all_sound_when_harmed() : FormItem
      {
         return this._342764654fi_all_sound_when_harmed;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_shotActor() : TextInput
      {
         return this._1906052200ui_allchar_shotActor;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_all_sound_when_healed() : FormItem
      {
         return this._345951330fi_all_sound_when_healed;
      }
      
      public function set PanelViewActualSize(param1:Panel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1941824968PanelViewActualSize;
         if(_loc2_ !== param1)
         {
            this._1941824968PanelViewActualSize = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"PanelViewActualSize",_loc2_,param1));
         }
      }
      
      public function set ui_item_equippedNewActorGraphics(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._217676256ui_item_equippedNewActorGraphics;
         if(_loc2_ !== param1)
         {
            this._217676256ui_item_equippedNewActorGraphics = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewActorGraphics",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewMeleeRepeatDelayModifierNum() : NumericStepper
      {
         return this._1263965307ui_item_equippedNewMeleeRepeatDelayModifierNum;
      }
      
      public function set pageItem(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._859140674pageItem;
         if(_loc2_ !== param1)
         {
            this._859140674pageItem = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageItem",_loc2_,param1));
         }
      }
      
      public function set fi_item_gainOrLosePointsNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._797619652fi_item_gainOrLosePointsNum;
         if(_loc2_ !== param1)
         {
            this._797619652fi_item_gainOrLosePointsNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_gainOrLosePointsNum",_loc2_,param1));
         }
      }
      
      public function set fi_item_keyForThisDoorConsumedYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._473577917fi_item_keyForThisDoorConsumedYN;
         if(_loc2_ !== param1)
         {
            this._473577917fi_item_keyForThisDoorConsumedYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_keyForThisDoorConsumedYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_autoEquip() : FormItem
      {
         return this._798141585fi_item_autoEquip;
      }
      
      public function set fi_itemOrNPC_dropsObjectWhenKilledChance(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1192236482fi_itemOrNPC_dropsObjectWhenKilledChance;
         if(_loc2_ !== param1)
         {
            this._1192236482fi_itemOrNPC_dropsObjectWhenKilledChance = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_dropsObjectWhenKilledChance",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_gainPowerType() : ComboBox
      {
         return this._389141377ui_item_gainPowerType;
      }
      
      private function _ActorMakerControl_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.editable = false;
         _loc1_.headerText = "Action";
         _loc1_.dataField = "action";
         return _loc1_;
      }
      
      public function __ui_npc_dropsObjectOnChoice1_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_npc_dropsObjectOnChoice1);
      }
      
      private function chooseActorForShotClickHandler(param1:TextInput) : void
      {
         var _loc2_:ChoosePieceForm = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
         _loc2_.configure(mgbSession.userName,mgbSession.activeProject,Piece.MGB_ACTOR);
         _loc2_.contextHint = param1;
         _loc2_.addEventListener("change",processChooseActorForShotFromSelection);
         tagCheck("choose_shot_actor");
      }
      
      public function set fi_allchar_sound_when_shooting(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._196272556fi_allchar_sound_when_shooting;
         if(_loc2_ !== param1)
         {
            this._196272556fi_allchar_sound_when_shooting = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_allchar_sound_when_shooting",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewMeleeDamageBonusNum() : NumericStepper
      {
         return this._364073846ui_item_equippedNewMeleeDamageBonusNum;
      }
      
      public function ___ActorMakerControl_LinkButton9_click(param1:MouseEvent) : void
      {
         ui_item_equippedNewShotActor.text = "";
      }
      
      public function set ButtonChooseTile(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._461583785ButtonChooseTile;
         if(_loc2_ !== param1)
         {
            this._461583785ButtonChooseTile = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonChooseTile",_loc2_,param1));
         }
      }
      
      public function set ui_npc_shotAccuracyType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._780106154ui_npc_shotAccuracyType;
         if(_loc2_ !== param1)
         {
            this._780106154ui_npc_shotAccuracyType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_shotAccuracyType",_loc2_,param1));
         }
      }
      
      public function set ui_all_gravityYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1632661926ui_all_gravityYN;
         if(_loc2_ !== param1)
         {
            this._1632661926ui_all_gravityYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_gravityYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_meleeRepeatDelay() : NumericStepper
      {
         return this._1767650137ui_allchar_meleeRepeatDelay;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewShotSound() : ComboBox
      {
         return this._422470475ui_item_equippedNewShotSound;
      }
      
      private function set okForBackground(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1626512987okForBackground;
         if(_loc2_ !== param1)
         {
            this._1626512987okForBackground = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okForBackground",_loc2_,param1));
         }
      }
      
      private function _ActorMakerControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():*
         {
            return ui_all_actorType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].actorType[0] = param1;
         },"actorDestData.databag.all.actorType[0]");
         result[0] = binding;
         binding = new Binding(this,function():*
         {
            return ui_all_description.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].description[0] = param1;
         },"actorDestData.databag.all.description[0]");
         result[1] = binding;
         binding = new Binding(this,function():*
         {
            return ui_all_initialHealthNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].initialHealthNum[0] = param1;
         },"actorDestData.databag.all.initialHealthNum[0]");
         result[2] = binding;
         binding = new Binding(this,function():*
         {
            return ui_all_initialMaxHealthNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].initialMaxHealthNum[0] = param1;
         },"actorDestData.databag.all.initialMaxHealthNum[0]");
         result[3] = binding;
         binding = new Binding(this,function():*
         {
            return ui_all_gravityYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].gravityYN[0] = param1;
         },"actorDestData.databag.all.gravityYN[0]");
         result[4] = binding;
         binding = new Binding(this,function():*
         {
            return MgbActor.soundIndexToName(ui_all_soundWhenHarmed.selectedIndex);
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].soundWhenHarmed[0] = param1;
         },"actorDestData.databag.all.soundWhenHarmed[0]");
         result[5] = binding;
         binding = new Binding(this,function():*
         {
            return MgbActor.soundIndexToName(ui_all_soundWhenHealed.selectedIndex);
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].soundWhenHealed[0] = param1;
         },"actorDestData.databag.all.soundWhenHealed[0]");
         result[6] = binding;
         binding = new Binding(this,function():*
         {
            return MgbActor.soundIndexToName(ui_all_soundWhenKilled.selectedIndex);
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].soundWhenKilled[0] = param1;
         },"actorDestData.databag.all.soundWhenKilled[0]");
         result[7] = binding;
         binding = new Binding(this,function():*
         {
            return ui_all_visualEffectWhenHarmedType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].visualEffectWhenHarmedType[0] = param1;
         },"actorDestData.databag.all.visualEffectWhenHarmedType[0]");
         result[8] = binding;
         binding = new Binding(this,function():*
         {
            return ui_all_visualEffectWhenHealedType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].visualEffectWhenHealedType[0] = param1;
         },"actorDestData.databag.all.visualEffectWhenHealedType[0]");
         result[9] = binding;
         binding = new Binding(this,function():*
         {
            return ui_all_visualEffectWhenKilledType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].all[0].visualEffectWhenKilledType[0] = param1;
         },"actorDestData.databag.all.visualEffectWhenKilledType[0]");
         result[10] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_movementSpeedNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].movementSpeedNum[0] = param1;
         },"actorDestData.databag.allchar.movementSpeedNum[0]");
         result[11] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_upYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].upYN[0] = param1;
         },"actorDestData.databag.allchar.upYN[0]");
         result[12] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_downYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].downYN[0] = param1;
         },"actorDestData.databag.allchar.downYN[0]");
         result[13] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_leftYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].leftYN[0] = param1;
         },"actorDestData.databag.allchar.leftYN[0]");
         result[14] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_rightYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].rightYN[0] = param1;
         },"actorDestData.databag.allchar.rightYN[0]");
         result[15] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_shotRateNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].shotRateNum[0] = param1;
         },"actorDestData.databag.allchar.shotRateNum[0]");
         result[16] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_shotRangeNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].shotRangeNum[0] = param1;
         },"actorDestData.databag.allchar.shotRangeNum[0]");
         result[17] = binding;
         binding = new Binding(this,function():*
         {
            return MgbActor.soundIndexToName(ui_allchar_soundWhenShooting.selectedIndex);
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].soundWhenShooting[0] = param1;
         },"actorDestData.databag.allchar.soundWhenShooting[0]");
         result[18] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_shotActor.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].shotActor[0] = param1;
         },"actorDestData.databag.allchar.shotActor[0]");
         result[19] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_pushYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].pushYN[0] = param1;
         },"actorDestData.databag.allchar.pushYN[0]");
         result[20] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_jumpYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].jumpYN[0] = param1;
         },"actorDestData.databag.allchar.jumpYN[0]");
         result[21] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_shotDamageToPlayerNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].shotDamageToPlayerNum[0] = param1;
         },"actorDestData.databag.allchar.shotDamageToPlayerNum[0]");
         result[22] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_shotDamageToNPCorItemNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].shotDamageToNPCorItemNum[0] = param1;
         },"actorDestData.databag.allchar.shotDamageToNPCorItemNum[0]");
         result[23] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_touchDamageToPlayerNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].touchDamageToPlayerNum[0] = param1;
         },"actorDestData.databag.allchar.touchDamageToPlayerNum[0]");
         result[24] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_touchDamageToNPCorItemNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].touchDamageToNPCorItemNum[0] = param1;
         },"actorDestData.databag.allchar.touchDamageToNPCorItemNum[0]");
         result[25] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_touchDamageAttackChance.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].touchDamageAttackChance[0] = param1;
         },"actorDestData.databag.allchar.touchDamageAttackChance[0]");
         result[26] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_touchDamageCases.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].touchDamageCases[0] = param1;
         },"actorDestData.databag.allchar.touchDamageCases[0]");
         result[27] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_meleeDamageToPlayerNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].meleeDamageToPlayerNum[0] = param1;
         },"actorDestData.databag.allchar.meleeDamageToPlayerNum[0]");
         result[28] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_meleeDamageToNPCorItemNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].meleeDamageToNPCorItemNum[0] = param1;
         },"actorDestData.databag.allchar.meleeDamageToNPCorItemNum[0]");
         result[29] = binding;
         binding = new Binding(this,function():*
         {
            return MgbActor.soundIndexToName(ui_allchar_soundWhenMelee.selectedIndex);
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].soundWhenMelee[0] = param1;
         },"actorDestData.databag.allchar.soundWhenMelee[0]");
         result[30] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_meleeRepeatDelay.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].allchar[0].meleeRepeatDelay[0] = param1;
         },"actorDestData.databag.allchar.meleeRepeatDelay[0]");
         result[31] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_movementType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].movementType[0] = param1;
         },"actorDestData.databag.npc.movementType[0]");
         result[32] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_aggroRange.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].aggroRange[0] = param1;
         },"actorDestData.databag.npc.aggroRange[0]");
         result[33] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_canOccupyPlayerSpaceYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].canOccupyPlayerSpaceYN[0] = param1;
         },"actorDestData.databag.npc.canOccupyPlayerSpaceYN[0]");
         result[34] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_shotAccuracyType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].shotAccuracyType[0] = param1;
         },"actorDestData.databag.npc.shotAccuracyType[0]");
         result[35] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_TalkText.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].talkText[0] = param1;
         },"actorDestData.databag.npc.talkText[0]");
         result[36] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_TalkTextFontIndex.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].talkTextFontIndex[0] = param1;
         },"actorDestData.databag.npc.talkTextFontIndex[0]");
         result[37] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice1.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice1[0] = param1;
         },"actorDestData.databag.npc.responseChoice1[0]");
         result[38] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takesObjectOnChoice1.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takesObjectOnChoice1[0] = param1;
         },"actorDestData.databag.npc.takesObjectOnChoice1[0]");
         result[39] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takesObjectCountOnChoice1Num.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takesObjectCountOnChoice1Num[0] = param1;
         },"actorDestData.databag.npc.takesObjectCountOnChoice1Num[0]");
         result[40] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takeObjectTypeOnChoice1.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takeObjectTypeOnChoice1[0] = param1;
         },"actorDestData.databag.npc.takeObjectTypeOnChoice1[0]");
         result[41] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_dropsObjectOnChoice1.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].dropsObjectOnChoice1[0] = param1;
         },"actorDestData.databag.npc.dropsObjectOnChoice1[0]");
         result[42] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice1DropPersistsYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice1DropPersistsYN[0] = param1;
         },"actorDestData.databag.npc.responseChoice1DropPersistsYN[0]");
         result[43] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice1Stay.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice1StayYN[0] = param1;
         },"actorDestData.databag.npc.responseChoice1StayYN[0]");
         result[44] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_saysWhatOnChoice1.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].saysWhatOnChoice1[0] = param1;
         },"actorDestData.databag.npc.saysWhatOnChoice1[0]");
         result[45] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice2.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice2[0] = param1;
         },"actorDestData.databag.npc.responseChoice2[0]");
         result[46] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takesObjectOnChoice2.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takesObjectOnChoice2[0] = param1;
         },"actorDestData.databag.npc.takesObjectOnChoice2[0]");
         result[47] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takesObjectCountOnChoice2Num.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takesObjectCountOnChoice2Num[0] = param1;
         },"actorDestData.databag.npc.takesObjectCountOnChoice2Num[0]");
         result[48] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takeObjectTypeOnChoice2.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takeObjectTypeOnChoice2[0] = param1;
         },"actorDestData.databag.npc.takeObjectTypeOnChoice2[0]");
         result[49] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_dropsObjectOnChoice2.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].dropsObjectOnChoice2[0] = param1;
         },"actorDestData.databag.npc.dropsObjectOnChoice2[0]");
         result[50] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice2DropPersistsYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice2DropPersistsYN[0] = param1;
         },"actorDestData.databag.npc.responseChoice2DropPersistsYN[0]");
         result[51] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice2Stay.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice2StayYN[0] = param1;
         },"actorDestData.databag.npc.responseChoice2StayYN[0]");
         result[52] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_saysWhatOnChoice2.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].saysWhatOnChoice2[0] = param1;
         },"actorDestData.databag.npc.saysWhatOnChoice2[0]");
         result[53] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice3.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice3[0] = param1;
         },"actorDestData.databag.npc.responseChoice3[0]");
         result[54] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takesObjectOnChoice3.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takesObjectOnChoice3[0] = param1;
         },"actorDestData.databag.npc.takesObjectOnChoice3[0]");
         result[55] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takesObjectCountOnChoice3Num.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takesObjectCountOnChoice3Num[0] = param1;
         },"actorDestData.databag.npc.takesObjectCountOnChoice3Num[0]");
         result[56] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_takeObjectTypeOnChoice3.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].takeObjectTypeOnChoice3[0] = param1;
         },"actorDestData.databag.npc.takeObjectTypeOnChoice3[0]");
         result[57] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_dropsObjectOnChoice3.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].dropsObjectOnChoice3[0] = param1;
         },"actorDestData.databag.npc.dropsObjectOnChoice3[0]");
         result[58] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice3DropPersistsYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice3DropPersistsYN[0] = param1;
         },"actorDestData.databag.npc.responseChoice3DropPersistsYN[0]");
         result[59] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_responseChoice3Stay.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].responseChoice3StayYN[0] = param1;
         },"actorDestData.databag.npc.responseChoice3StayYN[0]");
         result[60] = binding;
         binding = new Binding(this,function():*
         {
            return ui_npc_saysWhatOnChoice3.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].npc[0].saysWhatOnChoice3[0] = param1;
         },"actorDestData.databag.npc.saysWhatOnChoice3[0]");
         result[61] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_itemActivationType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].itemActivationType[0] = param1;
         },"actorDestData.databag.item.itemActivationType[0]");
         result[62] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_inventoryEquippableYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].inventoryEquippableYN[0] = param1;
         },"actorDestData.databag.item.inventoryEquippableYN[0]");
         result[63] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_inventoryEquipSlot.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].inventoryEquipSlot[0] = param1;
         },"actorDestData.databag.item.inventoryEquipSlot[0]");
         result[64] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_visualEffectWhenUsedType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].visualEffectWhenUsedType[0] = param1;
         },"actorDestData.databag.item.visualEffectWhenUsedType[0]");
         result[65] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_pushToSlideNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].pushToSlideNum[0] = param1;
         },"actorDestData.databag.item.pushToSlideNum[0]");
         result[66] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_squishPlayerYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].squishPlayerYN[0] = param1;
         },"actorDestData.databag.item.squishPlayerYN[0]");
         result[67] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_squishNPCYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].squishNPCYN[0] = param1;
         },"actorDestData.databag.item.squishNPCYN[0]");
         result[68] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_healOrHarmWhenUsedNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].healOrHarmWhenUsedNum[0] = param1;
         },"actorDestData.databag.item.healOrHarmWhenUsedNum[0]");
         result[69] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_increasesMaxHealthNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].increasesMaxHealthNum[0] = param1;
         },"actorDestData.databag.item.increasesMaxHealthNum[0]");
         result[70] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_gainExtraLifeYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].gainExtraLifeYN[0] = param1;
         },"actorDestData.databag.item.gainExtraLifeYN[0]");
         result[71] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_gainOrLosePointsNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].gainOrLosePointsNum[0] = param1;
         },"actorDestData.databag.item.gainOrLosePointsNum[0]");
         result[72] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_winLevelYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].winLevelYN[0] = param1;
         },"actorDestData.databag.item.winLevelYN[0]");
         result[73] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_gainPowerType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].gainPowerType[0] = param1;
         },"actorDestData.databag.item.gainPowerType[0]");
         result[74] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_gainPowerSecondsNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].gainPowerSecondsNum[0] = param1;
         },"actorDestData.databag.item.gainPowerSecondsNum[0]");
         result[75] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_useText.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].useText[0] = param1;
         },"actorDestData.databag.item.useText[0]");
         result[76] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_itemPushesActorType.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].itemPushesActorType[0] = param1;
         },"actorDestData.databag.item.itemPushesActorType[0]");
         result[77] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_itemPushesActorDistance.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].itemPushesActorDistance[0] = param1;
         },"actorDestData.databag.item.itemPushesActorDistance[0]");
         result[78] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_keyForThisDoor.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].keyForThisDoor[0] = param1;
         },"actorDestData.databag.item.keyForThisDoor[0]");
         result[79] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_keyForThisDoorConsumedYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].keyForThisDoorConsumedYN[0] = param1;
         },"actorDestData.databag.item.keyForThisDoorConsumedYN[0]");
         result[80] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_autoEquipYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].autoEquipYN[0] = param1;
         },"actorDestData.databag.item.autoEquipYN[0]");
         result[81] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedNewActorGraphics.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewActorGraphics[0] = param1;
         },"actorDestData.databag.item.equippedNewActorGraphics[0]");
         result[82] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedNewShotActor.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewShotActor[0] = param1;
         },"actorDestData.databag.item.equippedNewShotActor[0]");
         result[83] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedNewShotSound.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewShotSound[0] = param1;
         },"actorDestData.databag.item.equippedNewShotSound[0]");
         result[84] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedNewShotDamageBonusNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewShotDamageBonusNum[0] = param1;
         },"actorDestData.databag.item.equippedNewShotDamageBonusNum[0]");
         result[85] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedNewShotRateBonusNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewShotRateBonusNum[0] = param1;
         },"actorDestData.databag.item.equippedNewShotRateBonusNum[0]");
         result[86] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedNewShotRangeBonusNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewShotRangeBonusNum[0] = param1;
         },"actorDestData.databag.item.equippedNewShotRangeBonusNum[0]");
         result[87] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedArmorEffect.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedArmorEffect[0] = param1;
         },"actorDestData.databag.item.equippedArmorEffect[0]");
         result[88] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedNewMeleeDamageBonusNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewMeleeDamageBonusNum[0] = param1;
         },"actorDestData.databag.item.equippedNewMeleeDamageBonusNum[0]");
         result[89] = binding;
         binding = new Binding(this,function():*
         {
            return MgbActor.soundIndexToName(ui_item_equippedNewMeleeSound.selectedIndex);
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewMeleeSound[0] = param1;
         },"actorDestData.databag.item.equippedNewMeleeSound[0]");
         result[90] = binding;
         binding = new Binding(this,function():*
         {
            return ui_item_equippedNewMeleeRepeatDelayModifierNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].item[0].equippedNewMeleeRepeatDelayModifierNum[0] = param1;
         },"actorDestData.databag.item.equippedNewMeleeRepeatDelayModifierNum[0]");
         result[91] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_destroyableYN.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].destroyableYN[0] = param1;
         },"actorDestData.databag.itemOrNPC.destroyableYN[0]");
         result[92] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].scoreOrLosePointsWhenShotByPlayerNum[0] = param1;
         },"actorDestData.databag.itemOrNPC.scoreOrLosePointsWhenShotByPlayerNum[0]");
         result[93] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].scoreOrLosePointsWhenKilledByPlayerNum[0] = param1;
         },"actorDestData.databag.itemOrNPC.scoreOrLosePointsWhenKilledByPlayerNum[0]");
         result[94] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_dropsObjectWhenKilledName.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].dropsObjectWhenKilledName[0] = param1;
         },"actorDestData.databag.itemOrNPC.dropsObjectWhenKilledName[0]");
         result[95] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_dropsObjectWhenKilledChance.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].dropsObjectWhenKilledChance[0] = param1;
         },"actorDestData.databag.itemOrNPC.dropsObjectWhenKilledChance[0]");
         result[96] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_dropsObjectWhenKilledName2.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].dropsObjectWhenKilledName2[0] = param1;
         },"actorDestData.databag.itemOrNPC.dropsObjectWhenKilledName2[0]");
         result[97] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_dropsObjectWhenKilledChance2.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].dropsObjectWhenKilledChance2[0] = param1;
         },"actorDestData.databag.itemOrNPC.dropsObjectWhenKilledChance2[0]");
         result[98] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_dropsObjectRandomlyName.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].dropsObjectRandomlyName[0] = param1;
         },"actorDestData.databag.itemOrNPC.dropsObjectRandomlyName[0]");
         result[99] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_dropsObjectRandomlyChance.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].dropsObjectRandomlyChance[0] = param1;
         },"actorDestData.databag.itemOrNPC.dropsObjectRandomlyChance[0]");
         result[100] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_respawnOption.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].respawnOption[0] = param1;
         },"actorDestData.databag.itemOrNPC.respawnOption[0]");
         result[101] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_appearIf.selectedIndex;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].appearIf[0] = param1;
         },"actorDestData.databag.itemOrNPC.appearIf[0]");
         result[102] = binding;
         binding = new Binding(this,function():*
         {
            return ui_itemOrNPC_appearCount.value;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].appearCount[0] = param1;
         },"actorDestData.databag.itemOrNPC.appearCount[0]");
         result[103] = binding;
         binding = new Binding(this,function():*
         {
            return ui_allchar_conditionsActor.text;
         },function(param1:*):void
         {
            var _loc2_:* = new Namespace("");
            actorDestData.databag[0].itemOrNPC[0].conditionsActor[0] = param1;
         },"actorDestData.databag.itemOrNPC.conditionsActor[0]");
         result[104] = binding;
         binding = new Binding(this,function():Object
         {
            return mainViewStack;
         },function(param1:Object):void
         {
            _ActorMakerControl_TabBar1.dataProvider = param1;
         },"_ActorMakerControl_TabBar1.dataProvider");
         result[105] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mainViewStackEnabled;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_TabBar1.visible = param1;
         },"_ActorMakerControl_TabBar1.visible");
         result[106] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mainViewStackEnabled;
         },function(param1:Boolean):void
         {
            mainViewStack.visible = param1;
         },"mainViewStack.visible");
         result[107] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            _ActorMakerControl_Canvas2.setStyle("showEffect",param1);
         },"_ActorMakerControl_Canvas2.showEffect");
         result[108] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            _ActorMakerControl_Canvas2.setStyle("hideEffect",param1);
         },"_ActorMakerControl_Canvas2.hideEffect");
         result[109] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alActorType;
         },function(param1:Object):void
         {
            ui_all_actorType.dataProvider = param1;
         },"ui_all_actorType.dataProvider");
         result[110] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.all.actorType;
         },function(param1:int):void
         {
            ui_all_actorType.selectedIndex = param1;
         },"ui_all_actorType.selectedIndex");
         result[111] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = actorPiece.actorXML.databag.all.description;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_all_description.text = param1;
         },"ui_all_description.text");
         result[112] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.all.initialHealthNum;
         },function(param1:Number):void
         {
            ui_all_initialHealthNum.value = param1;
         },"ui_all_initialHealthNum.value");
         result[113] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.all.initialMaxHealthNum;
         },function(param1:Number):void
         {
            ui_all_initialMaxHealthNum.value = param1;
         },"ui_all_initialMaxHealthNum.value");
         result[114] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = notYet;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ActorMakerControl_FormItem5.toolTip = param1;
         },"_ActorMakerControl_FormItem5.toolTip");
         result[115] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_all_gravityYN.dataProvider = param1;
         },"ui_all_gravityYN.dataProvider");
         result[116] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.all.gravityYN;
         },function(param1:int):void
         {
            ui_all_gravityYN.selectedIndex = param1;
         },"ui_all_gravityYN.selectedIndex");
         result[117] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alCannedSoundsList;
         },function(param1:Object):void
         {
            ui_all_soundWhenHarmed.dataProvider = param1;
         },"ui_all_soundWhenHarmed.dataProvider");
         result[118] = binding;
         binding = new Binding(this,function():int
         {
            return MgbActor.soundNameToIndex(actorPiece.actorXML.databag.all.soundWhenHarmed);
         },function(param1:int):void
         {
            ui_all_soundWhenHarmed.selectedIndex = param1;
         },"ui_all_soundWhenHarmed.selectedIndex");
         result[119] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = notYet;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            fi_all_harmEffect.toolTip = param1;
         },"fi_all_harmEffect.toolTip");
         result[120] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alVisualEffect;
         },function(param1:Object):void
         {
            ui_all_visualEffectWhenHarmedType.dataProvider = param1;
         },"ui_all_visualEffectWhenHarmedType.dataProvider");
         result[121] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.all.visualEffectWhenHarmedType;
         },function(param1:int):void
         {
            ui_all_visualEffectWhenHarmedType.selectedIndex = param1;
         },"ui_all_visualEffectWhenHarmedType.selectedIndex");
         result[122] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alCannedSoundsList;
         },function(param1:Object):void
         {
            ui_all_soundWhenHealed.dataProvider = param1;
         },"ui_all_soundWhenHealed.dataProvider");
         result[123] = binding;
         binding = new Binding(this,function():int
         {
            return MgbActor.soundNameToIndex(actorPiece.actorXML.databag.all.soundWhenHealed);
         },function(param1:int):void
         {
            ui_all_soundWhenHealed.selectedIndex = param1;
         },"ui_all_soundWhenHealed.selectedIndex");
         result[124] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = notYet;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            fi_all_healEffect.toolTip = param1;
         },"fi_all_healEffect.toolTip");
         result[125] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alVisualEffect;
         },function(param1:Object):void
         {
            ui_all_visualEffectWhenHealedType.dataProvider = param1;
         },"ui_all_visualEffectWhenHealedType.dataProvider");
         result[126] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.all.visualEffectWhenHealedType;
         },function(param1:int):void
         {
            ui_all_visualEffectWhenHealedType.selectedIndex = param1;
         },"ui_all_visualEffectWhenHealedType.selectedIndex");
         result[127] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alCannedSoundsList;
         },function(param1:Object):void
         {
            ui_all_soundWhenKilled.dataProvider = param1;
         },"ui_all_soundWhenKilled.dataProvider");
         result[128] = binding;
         binding = new Binding(this,function():int
         {
            return MgbActor.soundNameToIndex(actorPiece.actorXML.databag.all.soundWhenKilled);
         },function(param1:int):void
         {
            ui_all_soundWhenKilled.selectedIndex = param1;
         },"ui_all_soundWhenKilled.selectedIndex");
         result[129] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = notYet;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            fi_all_killEffect.toolTip = param1;
         },"fi_all_killEffect.toolTip");
         result[130] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alVisualEffect;
         },function(param1:Object):void
         {
            ui_all_visualEffectWhenKilledType.dataProvider = param1;
         },"ui_all_visualEffectWhenKilledType.dataProvider");
         result[131] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.all.visualEffectWhenKilledType;
         },function(param1:int):void
         {
            ui_all_visualEffectWhenKilledType.selectedIndex = param1;
         },"ui_all_visualEffectWhenKilledType.selectedIndex");
         result[132] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tileMaxWidth;
         },function(param1:Number):void
         {
            tilePreview.width = param1;
         },"tilePreview.width");
         result[133] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tileMaxHeight;
         },function(param1:Number):void
         {
            tilePreview.height = param1;
         },"tilePreview.height");
         result[134] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            animations.setStyle("showEffect",param1);
         },"animations.showEffect");
         result[135] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            animations.setStyle("hideEffect",param1);
         },"animations.hideEffect");
         result[136] = binding;
         binding = new Binding(this,function():Object
         {
            return actorPiece.animationTable;
         },function(param1:Object):void
         {
            animationGrid.dataProvider = param1;
         },"animationGrid.dataProvider");
         result[137] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            pageAllChars.setStyle("showEffect",param1);
         },"pageAllChars.showEffect");
         result[138] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            pageAllChars.setStyle("hideEffect",param1);
         },"pageAllChars.hideEffect");
         result[139] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.movementSpeedNum;
         },function(param1:Number):void
         {
            ui_allchar_movementSpeedNum.value = param1;
         },"ui_allchar_movementSpeedNum.value");
         result[140] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_allchar_upYN.dataProvider = param1;
         },"ui_allchar_upYN.dataProvider");
         result[141] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.allchar.upYN;
         },function(param1:int):void
         {
            ui_allchar_upYN.selectedIndex = param1;
         },"ui_allchar_upYN.selectedIndex");
         result[142] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_allchar_downYN.dataProvider = param1;
         },"ui_allchar_downYN.dataProvider");
         result[143] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.allchar.downYN;
         },function(param1:int):void
         {
            ui_allchar_downYN.selectedIndex = param1;
         },"ui_allchar_downYN.selectedIndex");
         result[144] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_allchar_leftYN.dataProvider = param1;
         },"ui_allchar_leftYN.dataProvider");
         result[145] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.allchar.leftYN;
         },function(param1:int):void
         {
            ui_allchar_leftYN.selectedIndex = param1;
         },"ui_allchar_leftYN.selectedIndex");
         result[146] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_allchar_rightYN.dataProvider = param1;
         },"ui_allchar_rightYN.dataProvider");
         result[147] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.allchar.rightYN;
         },function(param1:int):void
         {
            ui_allchar_rightYN.selectedIndex = param1;
         },"ui_allchar_rightYN.selectedIndex");
         result[148] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_allchar_pushYN.dataProvider = param1;
         },"ui_allchar_pushYN.dataProvider");
         result[149] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.allchar.pushYN;
         },function(param1:int):void
         {
            ui_allchar_pushYN.selectedIndex = param1;
         },"ui_allchar_pushYN.selectedIndex");
         result[150] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = notYet;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            fi_allchar_jumpYN.toolTip = param1;
         },"fi_allchar_jumpYN.toolTip");
         result[151] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_allchar_jumpYN.dataProvider = param1;
         },"ui_allchar_jumpYN.dataProvider");
         result[152] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.allchar.jumpYN;
         },function(param1:int):void
         {
            ui_allchar_jumpYN.selectedIndex = param1;
         },"ui_allchar_jumpYN.selectedIndex");
         result[153] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.allchar.shotActor;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_allchar_shotActor.text = param1;
         },"ui_allchar_shotActor.text");
         result[154] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton1.visible = param1;
         },"_ActorMakerControl_LinkButton1.visible");
         result[155] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            fi_allchar_sound_when_shooting.visible = param1;
         },"fi_allchar_sound_when_shooting.visible");
         result[156] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            fi_allchar_sound_when_shooting.includeInLayout = param1;
         },"fi_allchar_sound_when_shooting.includeInLayout");
         result[157] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alCannedSoundsList;
         },function(param1:Object):void
         {
            ui_allchar_soundWhenShooting.dataProvider = param1;
         },"ui_allchar_soundWhenShooting.dataProvider");
         result[158] = binding;
         binding = new Binding(this,function():int
         {
            return MgbActor.soundNameToIndex(actorPiece.actorXML.databag.allchar.soundWhenShooting);
         },function(param1:int):void
         {
            ui_allchar_soundWhenShooting.selectedIndex = param1;
         },"ui_allchar_soundWhenShooting.selectedIndex");
         result[159] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem21.visible = param1;
         },"_ActorMakerControl_FormItem21.visible");
         result[160] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem21.includeInLayout = param1;
         },"_ActorMakerControl_FormItem21.includeInLayout");
         result[161] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.shotRateNum;
         },function(param1:Number):void
         {
            ui_allchar_shotRateNum.value = param1;
         },"ui_allchar_shotRateNum.value");
         result[162] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem22.visible = param1;
         },"_ActorMakerControl_FormItem22.visible");
         result[163] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem22.includeInLayout = param1;
         },"_ActorMakerControl_FormItem22.includeInLayout");
         result[164] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.shotRangeNum;
         },function(param1:Number):void
         {
            ui_allchar_shotRangeNum.value = param1;
         },"ui_allchar_shotRangeNum.value");
         result[165] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem23.visible = param1;
         },"_ActorMakerControl_FormItem23.visible");
         result[166] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem23.includeInLayout = param1;
         },"_ActorMakerControl_FormItem23.includeInLayout");
         result[167] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.shotDamageToPlayerNum;
         },function(param1:Number):void
         {
            ui_allchar_shotDamageToPlayerNum.value = param1;
         },"ui_allchar_shotDamageToPlayerNum.value");
         result[168] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem24.visible = param1;
         },"_ActorMakerControl_FormItem24.visible");
         result[169] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_allchar_shotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem24.includeInLayout = param1;
         },"_ActorMakerControl_FormItem24.includeInLayout");
         result[170] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.shotDamageToNPCorItemNum;
         },function(param1:Number):void
         {
            ui_allchar_shotDamageToNPCorItemNum.value = param1;
         },"ui_allchar_shotDamageToNPCorItemNum.value");
         result[171] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.touchDamageToPlayerNum;
         },function(param1:Number):void
         {
            ui_allchar_touchDamageToPlayerNum.value = param1;
         },"ui_allchar_touchDamageToPlayerNum.value");
         result[172] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.touchDamageToNPCorItemNum;
         },function(param1:Number):void
         {
            ui_allchar_touchDamageToNPCorItemNum.value = param1;
         },"ui_allchar_touchDamageToNPCorItemNum.value");
         result[173] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.touchDamageAttackChance;
         },function(param1:Number):void
         {
            ui_allchar_touchDamageAttackChance.value = param1;
         },"ui_allchar_touchDamageAttackChance.value");
         result[174] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alTouchDamageCases;
         },function(param1:Object):void
         {
            ui_allchar_touchDamageCases.dataProvider = param1;
         },"ui_allchar_touchDamageCases.dataProvider");
         result[175] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.allchar.touchDamageCases;
         },function(param1:int):void
         {
            ui_allchar_touchDamageCases.selectedIndex = param1;
         },"ui_allchar_touchDamageCases.selectedIndex");
         result[176] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.meleeDamageToPlayerNum;
         },function(param1:Number):void
         {
            ui_allchar_meleeDamageToPlayerNum.value = param1;
         },"ui_allchar_meleeDamageToPlayerNum.value");
         result[177] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.meleeDamageToNPCorItemNum;
         },function(param1:Number):void
         {
            ui_allchar_meleeDamageToNPCorItemNum.value = param1;
         },"ui_allchar_meleeDamageToNPCorItemNum.value");
         result[178] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alCannedSoundsList;
         },function(param1:Object):void
         {
            ui_allchar_soundWhenMelee.dataProvider = param1;
         },"ui_allchar_soundWhenMelee.dataProvider");
         result[179] = binding;
         binding = new Binding(this,function():int
         {
            return MgbActor.soundNameToIndex(actorPiece.actorXML.databag.allchar.soundWhenMelee);
         },function(param1:int):void
         {
            ui_allchar_soundWhenMelee.selectedIndex = param1;
         },"ui_allchar_soundWhenMelee.selectedIndex");
         result[180] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.allchar.meleeRepeatDelay;
         },function(param1:Number):void
         {
            ui_allchar_meleeRepeatDelay.value = param1;
         },"ui_allchar_meleeRepeatDelay.value");
         result[181] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            pageNPC.setStyle("showEffect",param1);
         },"pageNPC.showEffect");
         result[182] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            pageNPC.setStyle("hideEffect",param1);
         },"pageNPC.hideEffect");
         result[183] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alMovementType;
         },function(param1:Object):void
         {
            ui_npc_movementType.dataProvider = param1;
         },"ui_npc_movementType.dataProvider");
         result[184] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.movementType;
         },function(param1:int):void
         {
            ui_npc_movementType.selectedIndex = param1;
         },"ui_npc_movementType.selectedIndex");
         result[185] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_movementType.selectedIndex != MgbActor.alMovementType_ToPlayer;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem34.visible = param1;
         },"_ActorMakerControl_FormItem34.visible");
         result[186] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_movementType.selectedIndex != MgbActor.alMovementType_ToPlayer;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem34.includeInLayout = param1;
         },"_ActorMakerControl_FormItem34.includeInLayout");
         result[187] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.npc.aggroRange;
         },function(param1:Number):void
         {
            ui_npc_aggroRange.value = param1;
         },"ui_npc_aggroRange.value");
         result[188] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_npc_canOccupyPlayerSpaceYN.dataProvider = param1;
         },"ui_npc_canOccupyPlayerSpaceYN.dataProvider");
         result[189] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.canOccupyPlayerSpaceYN;
         },function(param1:int):void
         {
            ui_npc_canOccupyPlayerSpaceYN.selectedIndex = param1;
         },"ui_npc_canOccupyPlayerSpaceYN.selectedIndex");
         result[190] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alShotAccuracy;
         },function(param1:Object):void
         {
            ui_npc_shotAccuracyType.dataProvider = param1;
         },"ui_npc_shotAccuracyType.dataProvider");
         result[191] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.shotAccuracy;
         },function(param1:int):void
         {
            ui_npc_shotAccuracyType.selectedIndex = param1;
         },"ui_npc_shotAccuracyType.selectedIndex");
         result[192] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_destroyableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text2.visible = param1;
         },"_ActorMakerControl_Text2.visible");
         result[193] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_destroyableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text2.includeInLayout = param1;
         },"_ActorMakerControl_Text2.includeInLayout");
         result[194] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.talkText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_TalkText.text = param1;
         },"ui_npc_TalkText.text");
         result[195] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_TalkText.setStyle("fontFamily",param1);
         },"ui_npc_TalkText.fontFamily");
         result[196] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_TalkText.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_FormItem38.visible = param1;
         },"_ActorMakerControl_FormItem38.visible");
         result[197] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbSystem.gameFonts;
         },function(param1:Object):void
         {
            ui_npc_TalkTextFontIndex.dataProvider = param1;
         },"ui_npc_TalkTextFontIndex.dataProvider");
         result[198] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.talkTextFontIndex;
         },function(param1:int):void
         {
            ui_npc_TalkTextFontIndex.selectedIndex = param1;
         },"ui_npc_TalkTextFontIndex.selectedIndex");
         result[199] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_TalkText.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox3.visible = param1;
         },"_ActorMakerControl_HBox3.visible");
         result[200] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.responseChoice1;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_responseChoice1.text = param1;
         },"ui_npc_responseChoice1.text");
         result[201] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_responseChoice1.setStyle("fontFamily",param1);
         },"ui_npc_responseChoice1.fontFamily");
         result[202] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_responseChoice1.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox4.visible = param1;
         },"_ActorMakerControl_HBox4.visible");
         result[203] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.dropsObjectOnChoice1;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_dropsObjectOnChoice1.text = param1;
         },"ui_npc_dropsObjectOnChoice1.text");
         result[204] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice1.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton2.visible = param1;
         },"_ActorMakerControl_LinkButton2.visible");
         result[205] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice1.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text5.visible = param1;
         },"_ActorMakerControl_Text5.visible");
         result[206] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_npc_responseChoice1DropPersistsYN.dataProvider = param1;
         },"ui_npc_responseChoice1DropPersistsYN.dataProvider");
         result[207] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.responseChoice1DropPersistsYN;
         },function(param1:int):void
         {
            ui_npc_responseChoice1DropPersistsYN.selectedIndex = param1;
         },"ui_npc_responseChoice1DropPersistsYN.selectedIndex");
         result[208] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice1.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_responseChoice1DropPersistsYN.visible = param1;
         },"ui_npc_responseChoice1DropPersistsYN.visible");
         result[209] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_responseChoice1.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox5.visible = param1;
         },"_ActorMakerControl_HBox5.visible");
         result[210] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "  NPC " + (ui_npc_takeObjectTypeOnChoice1.selectedIndex == MgbActor.alNpcTakeType_Take ? "takes" : "requires") + " item: ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ActorMakerControl_Text6.text = param1;
         },"_ActorMakerControl_Text6.text");
         result[211] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.takesObjectOnChoice1;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_takesObjectOnChoice1.text = param1;
         },"ui_npc_takesObjectOnChoice1.text");
         result[212] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice1.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton3.visible = param1;
         },"_ActorMakerControl_LinkButton3.visible");
         result[213] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice1.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text7.visible = param1;
         },"_ActorMakerControl_Text7.visible");
         result[214] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNpcTakeTypes;
         },function(param1:Object):void
         {
            ui_npc_takeObjectTypeOnChoice1.dataProvider = param1;
         },"ui_npc_takeObjectTypeOnChoice1.dataProvider");
         result[215] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.takeObjectTypeOnChoice1;
         },function(param1:int):void
         {
            ui_npc_takeObjectTypeOnChoice1.selectedIndex = param1;
         },"ui_npc_takeObjectTypeOnChoice1.selectedIndex");
         result[216] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice1.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_takeObjectTypeOnChoice1.visible = param1;
         },"ui_npc_takeObjectTypeOnChoice1.visible");
         result[217] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice1.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text8.visible = param1;
         },"_ActorMakerControl_Text8.visible");
         result[218] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.npc.takesObjectCountOnChoice1Num;
         },function(param1:Number):void
         {
            ui_npc_takesObjectCountOnChoice1Num.value = param1;
         },"ui_npc_takesObjectCountOnChoice1Num.value");
         result[219] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice1.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_takesObjectCountOnChoice1Num.visible = param1;
         },"ui_npc_takesObjectCountOnChoice1Num.visible");
         result[220] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_TalkText.text.length > 0 && ui_npc_responseChoice1.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox6.visible = param1;
         },"_ActorMakerControl_HBox6.visible");
         result[221] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.saysWhatOnChoice1;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_saysWhatOnChoice1.text = param1;
         },"ui_npc_saysWhatOnChoice1.text");
         result[222] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_saysWhatOnChoice1.setStyle("fontFamily",param1);
         },"ui_npc_saysWhatOnChoice1.fontFamily");
         result[223] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNpcDialogFinalAction;
         },function(param1:Object):void
         {
            ui_npc_responseChoice1Stay.dataProvider = param1;
         },"ui_npc_responseChoice1Stay.dataProvider");
         result[224] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.responseChoice1StayYN;
         },function(param1:int):void
         {
            ui_npc_responseChoice1Stay.selectedIndex = param1;
         },"ui_npc_responseChoice1Stay.selectedIndex");
         result[225] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_TalkText.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox7.visible = param1;
         },"_ActorMakerControl_HBox7.visible");
         result[226] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.responseChoice2;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_responseChoice2.text = param1;
         },"ui_npc_responseChoice2.text");
         result[227] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_responseChoice2.setStyle("fontFamily",param1);
         },"ui_npc_responseChoice2.fontFamily");
         result[228] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_responseChoice2.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox8.visible = param1;
         },"_ActorMakerControl_HBox8.visible");
         result[229] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.dropsObjectOnChoice2;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_dropsObjectOnChoice2.text = param1;
         },"ui_npc_dropsObjectOnChoice2.text");
         result[230] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice2.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton4.visible = param1;
         },"_ActorMakerControl_LinkButton4.visible");
         result[231] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice2.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text13.visible = param1;
         },"_ActorMakerControl_Text13.visible");
         result[232] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_npc_responseChoice2DropPersistsYN.dataProvider = param1;
         },"ui_npc_responseChoice2DropPersistsYN.dataProvider");
         result[233] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.responseChoice2DropPersistsYN;
         },function(param1:int):void
         {
            ui_npc_responseChoice2DropPersistsYN.selectedIndex = param1;
         },"ui_npc_responseChoice2DropPersistsYN.selectedIndex");
         result[234] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice2.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_responseChoice2DropPersistsYN.visible = param1;
         },"ui_npc_responseChoice2DropPersistsYN.visible");
         result[235] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_responseChoice2.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox9.visible = param1;
         },"_ActorMakerControl_HBox9.visible");
         result[236] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "  NPC " + (ui_npc_takeObjectTypeOnChoice2.selectedIndex == MgbActor.alNpcTakeType_Take ? "takes" : "requires") + " item: ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ActorMakerControl_Text14.text = param1;
         },"_ActorMakerControl_Text14.text");
         result[237] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.takesObjectOnChoice2;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_takesObjectOnChoice2.text = param1;
         },"ui_npc_takesObjectOnChoice2.text");
         result[238] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice2.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton5.visible = param1;
         },"_ActorMakerControl_LinkButton5.visible");
         result[239] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice2.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text15.visible = param1;
         },"_ActorMakerControl_Text15.visible");
         result[240] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNpcTakeTypes;
         },function(param1:Object):void
         {
            ui_npc_takeObjectTypeOnChoice2.dataProvider = param1;
         },"ui_npc_takeObjectTypeOnChoice2.dataProvider");
         result[241] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.takeObjectTypeOnChoice2;
         },function(param1:int):void
         {
            ui_npc_takeObjectTypeOnChoice2.selectedIndex = param1;
         },"ui_npc_takeObjectTypeOnChoice2.selectedIndex");
         result[242] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice2.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_takeObjectTypeOnChoice2.visible = param1;
         },"ui_npc_takeObjectTypeOnChoice2.visible");
         result[243] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice2.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text16.visible = param1;
         },"_ActorMakerControl_Text16.visible");
         result[244] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.npc.takesObjectCountOnChoice2Num;
         },function(param1:Number):void
         {
            ui_npc_takesObjectCountOnChoice2Num.value = param1;
         },"ui_npc_takesObjectCountOnChoice2Num.value");
         result[245] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice2.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_takesObjectCountOnChoice2Num.visible = param1;
         },"ui_npc_takesObjectCountOnChoice2Num.visible");
         result[246] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_TalkText.text.length > 0 && ui_npc_responseChoice2.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox10.visible = param1;
         },"_ActorMakerControl_HBox10.visible");
         result[247] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.saysWhatOnChoice2;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_saysWhatOnChoice2.text = param1;
         },"ui_npc_saysWhatOnChoice2.text");
         result[248] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_saysWhatOnChoice2.setStyle("fontFamily",param1);
         },"ui_npc_saysWhatOnChoice2.fontFamily");
         result[249] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNpcDialogFinalAction;
         },function(param1:Object):void
         {
            ui_npc_responseChoice2Stay.dataProvider = param1;
         },"ui_npc_responseChoice2Stay.dataProvider");
         result[250] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.responseChoice2StayYN;
         },function(param1:int):void
         {
            ui_npc_responseChoice2Stay.selectedIndex = param1;
         },"ui_npc_responseChoice2Stay.selectedIndex");
         result[251] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_TalkText.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox11.visible = param1;
         },"_ActorMakerControl_HBox11.visible");
         result[252] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.responseChoice3;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_responseChoice3.text = param1;
         },"ui_npc_responseChoice3.text");
         result[253] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_responseChoice3.setStyle("fontFamily",param1);
         },"ui_npc_responseChoice3.fontFamily");
         result[254] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_responseChoice3.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox12.visible = param1;
         },"_ActorMakerControl_HBox12.visible");
         result[255] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.dropsObjectOnChoice3;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_dropsObjectOnChoice3.text = param1;
         },"ui_npc_dropsObjectOnChoice3.text");
         result[256] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice3.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton6.visible = param1;
         },"_ActorMakerControl_LinkButton6.visible");
         result[257] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice3.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text21.visible = param1;
         },"_ActorMakerControl_Text21.visible");
         result[258] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_npc_responseChoice3DropPersistsYN.dataProvider = param1;
         },"ui_npc_responseChoice3DropPersistsYN.dataProvider");
         result[259] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.responseChoice3DropPersistsYN;
         },function(param1:int):void
         {
            ui_npc_responseChoice3DropPersistsYN.selectedIndex = param1;
         },"ui_npc_responseChoice3DropPersistsYN.selectedIndex");
         result[260] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_dropsObjectOnChoice3.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_responseChoice3DropPersistsYN.visible = param1;
         },"ui_npc_responseChoice3DropPersistsYN.visible");
         result[261] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_responseChoice3.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox13.visible = param1;
         },"_ActorMakerControl_HBox13.visible");
         result[262] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "  NPC " + (ui_npc_takeObjectTypeOnChoice3.selectedIndex == MgbActor.alNpcTakeType_Take ? "takes" : "requires") + " item: ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ActorMakerControl_Text22.text = param1;
         },"_ActorMakerControl_Text22.text");
         result[263] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.takesObjectOnChoice3;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_takesObjectOnChoice3.text = param1;
         },"ui_npc_takesObjectOnChoice3.text");
         result[264] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice3.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton7.visible = param1;
         },"_ActorMakerControl_LinkButton7.visible");
         result[265] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice3.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text23.visible = param1;
         },"_ActorMakerControl_Text23.visible");
         result[266] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNpcTakeTypes;
         },function(param1:Object):void
         {
            ui_npc_takeObjectTypeOnChoice3.dataProvider = param1;
         },"ui_npc_takeObjectTypeOnChoice3.dataProvider");
         result[267] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.takeObjectTypeOnChoice3;
         },function(param1:int):void
         {
            ui_npc_takeObjectTypeOnChoice3.selectedIndex = param1;
         },"ui_npc_takeObjectTypeOnChoice3.selectedIndex");
         result[268] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice3.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_takeObjectTypeOnChoice3.visible = param1;
         },"ui_npc_takeObjectTypeOnChoice3.visible");
         result[269] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice3.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text24.visible = param1;
         },"_ActorMakerControl_Text24.visible");
         result[270] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.npc.takesObjectCountOnChoice3Num;
         },function(param1:Number):void
         {
            ui_npc_takesObjectCountOnChoice3Num.value = param1;
         },"ui_npc_takesObjectCountOnChoice3Num.value");
         result[271] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_takesObjectOnChoice3.text != "";
         },function(param1:Boolean):void
         {
            ui_npc_takesObjectCountOnChoice3Num.visible = param1;
         },"ui_npc_takesObjectCountOnChoice3Num.visible");
         result[272] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_npc_TalkText.text.length > 0 && ui_npc_responseChoice3.text.length > 0;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_HBox14.visible = param1;
         },"_ActorMakerControl_HBox14.visible");
         result[273] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.npc.saysWhatOnChoice3;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_saysWhatOnChoice3.text = param1;
         },"ui_npc_saysWhatOnChoice3.text");
         result[274] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_npc_saysWhatOnChoice3.setStyle("fontFamily",param1);
         },"ui_npc_saysWhatOnChoice3.fontFamily");
         result[275] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNpcDialogFinalAction;
         },function(param1:Object):void
         {
            ui_npc_responseChoice3Stay.dataProvider = param1;
         },"ui_npc_responseChoice3Stay.dataProvider");
         result[276] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.npc.responseChoice3StayYN;
         },function(param1:int):void
         {
            ui_npc_responseChoice3Stay.selectedIndex = param1;
         },"ui_npc_responseChoice3Stay.selectedIndex");
         result[277] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            pageItem.setStyle("showEffect",param1);
         },"pageItem.showEffect");
         result[278] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            pageItem.setStyle("hideEffect",param1);
         },"pageItem.hideEffect");
         result[279] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alItemActivation;
         },function(param1:Object):void
         {
            ui_item_itemActivationType.dataProvider = param1;
         },"ui_item_itemActivationType.dataProvider");
         result[280] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.itemActivationType;
         },function(param1:int):void
         {
            ui_item_itemActivationType.selectedIndex = param1;
         },"ui_item_itemActivationType.selectedIndex");
         result[281] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_inventoryEquippableYN.setStyle("showEffect",param1);
         },"fi_item_inventoryEquippableYN.showEffect");
         result[282] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
         },function(param1:Boolean):void
         {
            fi_item_inventoryEquippableYN.includeInLayout = param1;
         },"fi_item_inventoryEquippableYN.includeInLayout");
         result[283] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
         },function(param1:Boolean):void
         {
            fi_item_inventoryEquippableYN.visible = param1;
         },"fi_item_inventoryEquippableYN.visible");
         result[284] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_item_inventoryEquippableYN.dataProvider = param1;
         },"ui_item_inventoryEquippableYN.dataProvider");
         result[285] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.inventoryEquippableYN;
         },function(param1:int):void
         {
            ui_item_inventoryEquippableYN.selectedIndex = param1;
         },"ui_item_inventoryEquippableYN.selectedIndex");
         result[286] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_inventoryEquipSlot.setStyle("showEffect",param1);
         },"fi_item_inventoryEquipSlot.showEffect");
         result[287] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_inventoryEquipSlot.includeInLayout = param1;
         },"fi_item_inventoryEquipSlot.includeInLayout");
         result[288] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_inventoryEquipSlot.visible = param1;
         },"fi_item_inventoryEquipSlot.visible");
         result[289] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.item.inventoryEquipSlot;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_item_inventoryEquipSlot.text = param1;
         },"ui_item_inventoryEquipSlot.text");
         result[290] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewActorGraphics.setStyle("showEffect",param1);
         },"fi_item_equippedNewActorGraphics.showEffect");
         result[291] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewActorGraphics.includeInLayout = param1;
         },"fi_item_equippedNewActorGraphics.includeInLayout");
         result[292] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewActorGraphics.visible = param1;
         },"fi_item_equippedNewActorGraphics.visible");
         result[293] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.item.equippedNewActorGraphics;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_item_equippedNewActorGraphics.text = param1;
         },"ui_item_equippedNewActorGraphics.text");
         result[294] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_equippedNewActorGraphics.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton8.visible = param1;
         },"_ActorMakerControl_LinkButton8.visible");
         result[295] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1 && ui_item_equippedNewActorGraphics.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_TextArea3.includeInLayout = param1;
         },"_ActorMakerControl_TextArea3.includeInLayout");
         result[296] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1 && ui_item_equippedNewActorGraphics.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_TextArea3.visible = param1;
         },"_ActorMakerControl_TextArea3.visible");
         result[297] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_autoEquip.setStyle("showEffect",param1);
         },"fi_item_autoEquip.showEffect");
         result[298] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1 && ui_item_equippedNewActorGraphics.text != "";
         },function(param1:Boolean):void
         {
            fi_item_autoEquip.includeInLayout = param1;
         },"fi_item_autoEquip.includeInLayout");
         result[299] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1 && ui_item_equippedNewActorGraphics.text != "";
         },function(param1:Boolean):void
         {
            fi_item_autoEquip.visible = param1;
         },"fi_item_autoEquip.visible");
         result[300] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_item_autoEquipYN.dataProvider = param1;
         },"ui_item_autoEquipYN.dataProvider");
         result[301] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.autoEquipYN;
         },function(param1:int):void
         {
            ui_item_autoEquipYN.selectedIndex = param1;
         },"ui_item_autoEquipYN.selectedIndex");
         result[302] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewShotActor.setStyle("showEffect",param1);
         },"fi_item_equippedNewShotActor.showEffect");
         result[303] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotActor.includeInLayout = param1;
         },"fi_item_equippedNewShotActor.includeInLayout");
         result[304] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotActor.visible = param1;
         },"fi_item_equippedNewShotActor.visible");
         result[305] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.item.equippedNewShotActor;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_item_equippedNewShotActor.text = param1;
         },"ui_item_equippedNewShotActor.text");
         result[306] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_equippedNewShotActor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton9.visible = param1;
         },"_ActorMakerControl_LinkButton9.visible");
         result[307] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewShotSound.setStyle("showEffect",param1);
         },"fi_item_equippedNewShotSound.showEffect");
         result[308] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotSound.includeInLayout = param1;
         },"fi_item_equippedNewShotSound.includeInLayout");
         result[309] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotSound.visible = param1;
         },"fi_item_equippedNewShotSound.visible");
         result[310] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alCannedSoundsList;
         },function(param1:Object):void
         {
            ui_item_equippedNewShotSound.dataProvider = param1;
         },"ui_item_equippedNewShotSound.dataProvider");
         result[311] = binding;
         binding = new Binding(this,function():int
         {
            return MgbActor.soundNameToIndex(actorPiece.actorXML.databag.item.equippedNewShotSound);
         },function(param1:int):void
         {
            ui_item_equippedNewShotSound.selectedIndex = param1;
         },"ui_item_equippedNewShotSound.selectedIndex");
         result[312] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewShotDamageBonus.setStyle("showEffect",param1);
         },"fi_item_equippedNewShotDamageBonus.showEffect");
         result[313] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotDamageBonus.includeInLayout = param1;
         },"fi_item_equippedNewShotDamageBonus.includeInLayout");
         result[314] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotDamageBonus.visible = param1;
         },"fi_item_equippedNewShotDamageBonus.visible");
         result[315] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.equippedNewShotDamageBonusNum;
         },function(param1:Number):void
         {
            ui_item_equippedNewShotDamageBonusNum.value = param1;
         },"ui_item_equippedNewShotDamageBonusNum.value");
         result[316] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewShotRateBonus.setStyle("showEffect",param1);
         },"fi_item_equippedNewShotRateBonus.showEffect");
         result[317] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotRateBonus.includeInLayout = param1;
         },"fi_item_equippedNewShotRateBonus.includeInLayout");
         result[318] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotRateBonus.visible = param1;
         },"fi_item_equippedNewShotRateBonus.visible");
         result[319] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.equippedNewShotRateBonusNum;
         },function(param1:Number):void
         {
            ui_item_equippedNewShotRateBonusNum.value = param1;
         },"ui_item_equippedNewShotRateBonusNum.value");
         result[320] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewShotRangeBonus.setStyle("showEffect",param1);
         },"fi_item_equippedNewShotRangeBonus.showEffect");
         result[321] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotRangeBonus.includeInLayout = param1;
         },"fi_item_equippedNewShotRangeBonus.includeInLayout");
         result[322] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewShotRangeBonus.visible = param1;
         },"fi_item_equippedNewShotRangeBonus.visible");
         result[323] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.equippedNewShotRangeBonusNum;
         },function(param1:Number):void
         {
            ui_item_equippedNewShotRangeBonusNum.value = param1;
         },"ui_item_equippedNewShotRangeBonusNum.value");
         result[324] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedArmorEffect.setStyle("showEffect",param1);
         },"fi_item_equippedArmorEffect.showEffect");
         result[325] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedArmorEffect.includeInLayout = param1;
         },"fi_item_equippedArmorEffect.includeInLayout");
         result[326] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedArmorEffect.visible = param1;
         },"fi_item_equippedArmorEffect.visible");
         result[327] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.equippedArmorEffect;
         },function(param1:Number):void
         {
            ui_item_equippedArmorEffect.value = param1;
         },"ui_item_equippedArmorEffect.value");
         result[328] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewMeleeDamageBonusNum.setStyle("showEffect",param1);
         },"fi_item_equippedNewMeleeDamageBonusNum.showEffect");
         result[329] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewMeleeDamageBonusNum.includeInLayout = param1;
         },"fi_item_equippedNewMeleeDamageBonusNum.includeInLayout");
         result[330] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewMeleeDamageBonusNum.visible = param1;
         },"fi_item_equippedNewMeleeDamageBonusNum.visible");
         result[331] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.equippedNewMeleeDamageBonusNum;
         },function(param1:Number):void
         {
            ui_item_equippedNewMeleeDamageBonusNum.value = param1;
         },"ui_item_equippedNewMeleeDamageBonusNum.value");
         result[332] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewMeleeSound.setStyle("showEffect",param1);
         },"fi_item_equippedNewMeleeSound.showEffect");
         result[333] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewMeleeSound.includeInLayout = param1;
         },"fi_item_equippedNewMeleeSound.includeInLayout");
         result[334] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewMeleeSound.visible = param1;
         },"fi_item_equippedNewMeleeSound.visible");
         result[335] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alCannedSoundsList;
         },function(param1:Object):void
         {
            ui_item_equippedNewMeleeSound.dataProvider = param1;
         },"ui_item_equippedNewMeleeSound.dataProvider");
         result[336] = binding;
         binding = new Binding(this,function():int
         {
            return MgbActor.soundNameToIndex(actorPiece.actorXML.databag.item.equippedNewMeleeSound);
         },function(param1:int):void
         {
            ui_item_equippedNewMeleeSound.selectedIndex = param1;
         },"ui_item_equippedNewMeleeSound.selectedIndex");
         result[337] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_equippedNewMeleeRepeatDelayModifierNum.setStyle("showEffect",param1);
         },"fi_item_equippedNewMeleeRepeatDelayModifierNum.showEffect");
         result[338] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewMeleeRepeatDelayModifierNum.includeInLayout = param1;
         },"fi_item_equippedNewMeleeRepeatDelayModifierNum.includeInLayout");
         result[339] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         },function(param1:Boolean):void
         {
            fi_item_equippedNewMeleeRepeatDelayModifierNum.visible = param1;
         },"fi_item_equippedNewMeleeRepeatDelayModifierNum.visible");
         result[340] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.equippedNewMeleeRepeatDelayModifierNum;
         },function(param1:Number):void
         {
            ui_item_equippedNewMeleeRepeatDelayModifierNum.value = param1;
         },"ui_item_equippedNewMeleeRepeatDelayModifierNum.value");
         result[341] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_itemPushesActorType.setStyle("showEffect",param1);
         },"fi_item_itemPushesActorType.showEffect");
         result[342] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alItemPushesActorType;
         },function(param1:Object):void
         {
            ui_item_itemPushesActorType.dataProvider = param1;
         },"ui_item_itemPushesActorType.dataProvider");
         result[343] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.itemPushesActorType;
         },function(param1:int):void
         {
            ui_item_itemPushesActorType.selectedIndex = param1;
         },"ui_item_itemPushesActorType.selectedIndex");
         result[344] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_itemPushesActorDistance.setStyle("showEffect",param1);
         },"fi_item_itemPushesActorDistance.showEffect");
         result[345] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.itemPushesActorDistance;
         },function(param1:Number):void
         {
            ui_item_itemPushesActorDistance.value = param1;
         },"ui_item_itemPushesActorDistance.value");
         result[346] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = notYet;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            fi_item_visualEffectWhenUsedType.toolTip = param1;
         },"fi_item_visualEffectWhenUsedType.toolTip");
         result[347] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_visualEffectWhenUsedType.setStyle("showEffect",param1);
         },"fi_item_visualEffectWhenUsedType.showEffect");
         result[348] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alVisualEffect;
         },function(param1:Object):void
         {
            ui_item_visualEffectWhenUsedType.dataProvider = param1;
         },"ui_item_visualEffectWhenUsedType.dataProvider");
         result[349] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.visualEffectWhenUsedType;
         },function(param1:int):void
         {
            ui_item_visualEffectWhenUsedType.selectedIndex = param1;
         },"ui_item_visualEffectWhenUsedType.selectedIndex");
         result[350] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_useText.setStyle("showEffect",param1);
         },"fi_item_useText.showEffect");
         result[351] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.item.useText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_item_useText.text = param1;
         },"ui_item_useText.text");
         result[352] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_pushToSlideNum.setStyle("showEffect",param1);
         },"fi_item_pushToSlideNum.showEffect");
         result[353] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.pushToSlideNum;
         },function(param1:Number):void
         {
            ui_item_pushToSlideNum.value = param1;
         },"ui_item_pushToSlideNum.value");
         result[354] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_squishPlayerYN.setStyle("showEffect",param1);
         },"fi_item_squishPlayerYN.showEffect");
         result[355] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_item_squishPlayerYN.dataProvider = param1;
         },"ui_item_squishPlayerYN.dataProvider");
         result[356] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.squishPlayerYN;
         },function(param1:int):void
         {
            ui_item_squishPlayerYN.selectedIndex = param1;
         },"ui_item_squishPlayerYN.selectedIndex");
         result[357] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_squishNPCYN.setStyle("showEffect",param1);
         },"fi_item_squishNPCYN.showEffect");
         result[358] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_item_squishNPCYN.dataProvider = param1;
         },"ui_item_squishNPCYN.dataProvider");
         result[359] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.squishNPCYN;
         },function(param1:int):void
         {
            ui_item_squishNPCYN.selectedIndex = param1;
         },"ui_item_squishNPCYN.selectedIndex");
         result[360] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_pushToSlideNum.value != 0;
         },function(param1:Boolean):void
         {
            ui_item_squishNPCYN.enabled = param1;
         },"ui_item_squishNPCYN.enabled");
         result[361] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.item.keyForThisDoor;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_item_keyForThisDoor.text = param1;
         },"ui_item_keyForThisDoor.text");
         result[362] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_keyForThisDoor.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton10.visible = param1;
         },"_ActorMakerControl_LinkButton10.visible");
         result[363] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_keyForThisDoorConsumedYN.setStyle("showEffect",param1);
         },"fi_item_keyForThisDoorConsumedYN.showEffect");
         result[364] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_item_keyForThisDoorConsumedYN.dataProvider = param1;
         },"ui_item_keyForThisDoorConsumedYN.dataProvider");
         result[365] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.keyForThisDoorConsumedYN;
         },function(param1:int):void
         {
            ui_item_keyForThisDoorConsumedYN.selectedIndex = param1;
         },"ui_item_keyForThisDoorConsumedYN.selectedIndex");
         result[366] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_item_pushToSlideNum.value == 0;
         },function(param1:Boolean):void
         {
            ui_item_keyForThisDoorConsumedYN.enabled = param1;
         },"ui_item_keyForThisDoorConsumedYN.enabled");
         result[367] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_healOrHarmWhenUsedNum.setStyle("showEffect",param1);
         },"fi_item_healOrHarmWhenUsedNum.showEffect");
         result[368] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.healOrHarmWhenUsedNum;
         },function(param1:Number):void
         {
            ui_item_healOrHarmWhenUsedNum.value = param1;
         },"ui_item_healOrHarmWhenUsedNum.value");
         result[369] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_increasesMaxHealthNum.setStyle("showEffect",param1);
         },"fi_item_increasesMaxHealthNum.showEffect");
         result[370] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.increasesMaxHealthNum;
         },function(param1:Number):void
         {
            ui_item_increasesMaxHealthNum.value = param1;
         },"ui_item_increasesMaxHealthNum.value");
         result[371] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_gainExtraLifeYN.setStyle("showEffect",param1);
         },"fi_item_gainExtraLifeYN.showEffect");
         result[372] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_item_gainExtraLifeYN.dataProvider = param1;
         },"ui_item_gainExtraLifeYN.dataProvider");
         result[373] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.gainExtraLifeYN;
         },function(param1:int):void
         {
            ui_item_gainExtraLifeYN.selectedIndex = param1;
         },"ui_item_gainExtraLifeYN.selectedIndex");
         result[374] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_gainOrLosePointsNum.setStyle("showEffect",param1);
         },"fi_item_gainOrLosePointsNum.showEffect");
         result[375] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.gainOrLosePointsNum;
         },function(param1:Number):void
         {
            ui_item_gainOrLosePointsNum.value = param1;
         },"ui_item_gainOrLosePointsNum.value");
         result[376] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_winLevelYN.setStyle("showEffect",param1);
         },"fi_item_winLevelYN.showEffect");
         result[377] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_item_winLevelYN.dataProvider = param1;
         },"ui_item_winLevelYN.dataProvider");
         result[378] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.winLevelYN;
         },function(param1:int):void
         {
            ui_item_winLevelYN.selectedIndex = param1;
         },"ui_item_winLevelYN.selectedIndex");
         result[379] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_gainPowerType.setStyle("showEffect",param1);
         },"fi_item_gainPowerType.showEffect");
         result[380] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alGainPower;
         },function(param1:Object):void
         {
            ui_item_gainPowerType.dataProvider = param1;
         },"ui_item_gainPowerType.dataProvider");
         result[381] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.item.gainPowerType;
         },function(param1:int):void
         {
            ui_item_gainPowerType.selectedIndex = param1;
         },"ui_item_gainPowerType.selectedIndex");
         result[382] = binding;
         binding = new Binding(this,function():*
         {
            return myWR;
         },function(param1:*):void
         {
            fi_item_gainPowerSecondsNum.setStyle("showEffect",param1);
         },"fi_item_gainPowerSecondsNum.showEffect");
         result[383] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.item.gainPowerSecondsNum;
         },function(param1:Number):void
         {
            ui_item_gainPowerSecondsNum.value = param1;
         },"ui_item_gainPowerSecondsNum.value");
         result[384] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            pageItemOrNPC.setStyle("showEffect",param1);
         },"pageItemOrNPC.showEffect");
         result[385] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            pageItemOrNPC.setStyle("hideEffect",param1);
         },"pageItemOrNPC.hideEffect");
         result[386] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alNoYes;
         },function(param1:Object):void
         {
            ui_itemOrNPC_destroyableYN.dataProvider = param1;
         },"ui_itemOrNPC_destroyableYN.dataProvider");
         result[387] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.itemOrNPC.destroyableYN;
         },function(param1:int):void
         {
            ui_itemOrNPC_destroyableYN.selectedIndex = param1;
         },"ui_itemOrNPC_destroyableYN.selectedIndex");
         result[388] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.itemOrNPC.scoreOrLosePointsWhenShotByPlayerNum;
         },function(param1:Number):void
         {
            ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum.value = param1;
         },"ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum.value");
         result[389] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.itemOrNPC.scoreOrLosePointsWhenKilledByPlayerNum;
         },function(param1:Number):void
         {
            ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum.value = param1;
         },"ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum.value");
         result[390] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectWhenKilledName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_itemOrNPC_dropsObjectWhenKilledName.text = param1;
         },"ui_itemOrNPC_dropsObjectWhenKilledName.text");
         result[391] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_dropsObjectWhenKilledName.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton11.visible = param1;
         },"_ActorMakerControl_LinkButton11.visible");
         result[392] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_dropsObjectWhenKilledName.text != "";
         },function(param1:Boolean):void
         {
            fi_itemOrNPC_dropsObjectWhenKilledChance.visible = param1;
         },"fi_itemOrNPC_dropsObjectWhenKilledChance.visible");
         result[393] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.itemOrNPC.dropsObjectWhenKilledChance;
         },function(param1:Number):void
         {
            ui_itemOrNPC_dropsObjectWhenKilledChance.value = param1;
         },"ui_itemOrNPC_dropsObjectWhenKilledChance.value");
         result[394] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectWhenKilledName2;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_itemOrNPC_dropsObjectWhenKilledName2.text = param1;
         },"ui_itemOrNPC_dropsObjectWhenKilledName2.text");
         result[395] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_dropsObjectWhenKilledName2.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton12.visible = param1;
         },"_ActorMakerControl_LinkButton12.visible");
         result[396] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_dropsObjectWhenKilledName2.text != "";
         },function(param1:Boolean):void
         {
            fi_itemOrNPC_dropsObjectWhenKilledChance2.visible = param1;
         },"fi_itemOrNPC_dropsObjectWhenKilledChance2.visible");
         result[397] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.itemOrNPC.dropsObjectWhenKilledChance2;
         },function(param1:Number):void
         {
            ui_itemOrNPC_dropsObjectWhenKilledChance2.value = param1;
         },"ui_itemOrNPC_dropsObjectWhenKilledChance2.value");
         result[398] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alRespawnOptions;
         },function(param1:Object):void
         {
            ui_itemOrNPC_respawnOption.dataProvider = param1;
         },"ui_itemOrNPC_respawnOption.dataProvider");
         result[399] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.itemOrNPC.respawnOption;
         },function(param1:int):void
         {
            ui_itemOrNPC_respawnOption.selectedIndex = param1;
         },"ui_itemOrNPC_respawnOption.selectedIndex");
         result[400] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectRandomlyName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_itemOrNPC_dropsObjectRandomlyName.text = param1;
         },"ui_itemOrNPC_dropsObjectRandomlyName.text");
         result[401] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_dropsObjectRandomlyName.text != "";
         },function(param1:Boolean):void
         {
            _ActorMakerControl_LinkButton13.visible = param1;
         },"_ActorMakerControl_LinkButton13.visible");
         result[402] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = "% chance of randomly generating actor \'" + ui_itemOrNPC_dropsObjectRandomlyName.text + "\' each second";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            fi_itemOrNPC_dropsObjectRandomlyChance.toolTip = param1;
         },"fi_itemOrNPC_dropsObjectRandomlyChance.toolTip");
         result[403] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_dropsObjectRandomlyName.text != "";
         },function(param1:Boolean):void
         {
            fi_itemOrNPC_dropsObjectRandomlyChance.visible = param1;
         },"fi_itemOrNPC_dropsObjectRandomlyChance.visible");
         result[404] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.itemOrNPC.dropsObjectRandomlyChance;
         },function(param1:Number):void
         {
            ui_itemOrNPC_dropsObjectRandomlyChance.value = param1;
         },"ui_itemOrNPC_dropsObjectRandomlyChance.value");
         result[405] = binding;
         binding = new Binding(this,function():*
         {
            return myWD;
         },function(param1:*):void
         {
            pageConditions.setStyle("showEffect",param1);
         },"pageConditions.showEffect");
         result[406] = binding;
         binding = new Binding(this,function():*
         {
            return myWU;
         },function(param1:*):void
         {
            pageConditions.setStyle("hideEffect",param1);
         },"pageConditions.hideEffect");
         result[407] = binding;
         binding = new Binding(this,function():Object
         {
            return MgbActor.alAppearDisappear;
         },function(param1:Object):void
         {
            ui_itemOrNPC_appearIf.dataProvider = param1;
         },"ui_itemOrNPC_appearIf.dataProvider");
         result[408] = binding;
         binding = new Binding(this,function():int
         {
            return actorPiece.actorXML.databag.itemOrNPC.appearIf;
         },function(param1:int):void
         {
            ui_itemOrNPC_appearIf.selectedIndex = param1;
         },"ui_itemOrNPC_appearIf.selectedIndex");
         result[409] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_appearIf.selectedIndex > MgbActor.alAppearDisappear_NoCondition;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text29.visible = param1;
         },"_ActorMakerControl_Text29.visible");
         result[410] = binding;
         binding = new Binding(this,function():Number
         {
            return actorPiece.actorXML.databag.itemOrNPC.appearCount;
         },function(param1:Number):void
         {
            ui_itemOrNPC_appearCount.value = param1;
         },"ui_itemOrNPC_appearCount.value");
         result[411] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_appearIf.selectedIndex > MgbActor.alAppearDisappear_NoCondition;
         },function(param1:Boolean):void
         {
            ui_itemOrNPC_appearCount.visible = param1;
         },"ui_itemOrNPC_appearCount.visible");
         result[412] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = actorPiece.actorXML.databag.itemOrNPC.conditionsActor;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            ui_allchar_conditionsActor.text = param1;
         },"ui_allchar_conditionsActor.text");
         result[413] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_appearIf.selectedIndex > MgbActor.alAppearDisappear_NoCondition;
         },function(param1:Boolean):void
         {
            ui_allchar_conditionsActor.visible = param1;
         },"ui_allchar_conditionsActor.visible");
         result[414] = binding;
         binding = new Binding(this,function():Boolean
         {
            return ui_itemOrNPC_appearIf.selectedIndex > MgbActor.alAppearDisappear_NoCondition;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text30.visible = param1;
         },"_ActorMakerControl_Text30.visible");
         result[415] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mainViewStackEnabled;
         },function(param1:Boolean):void
         {
            actorSummaryText.visible = param1;
         },"actorSummaryText.visible");
         result[416] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mainViewStackEnabled;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_Text32.visible = param1;
         },"_ActorMakerControl_Text32.visible");
         result[417] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mainViewStackEnabled;
         },function(param1:Boolean):void
         {
            ButtonSave.enabled = param1;
         },"ButtonSave.enabled");
         result[418] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tilePreviewWidth;
         },function(param1:Number):void
         {
            actorPreview.width = param1;
         },"actorPreview.width");
         result[419] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tilePreviewHeight;
         },function(param1:Number):void
         {
            actorPreview.height = param1;
         },"actorPreview.height");
         result[420] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mainViewStackEnabled;
         },function(param1:Boolean):void
         {
            _ActorMakerControl_VBox1.visible = param1;
         },"_ActorMakerControl_VBox1.visible");
         result[421] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = " Background: " + okForBackground;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ActorMakerControl_Text34.htmlText = param1;
         },"_ActorMakerControl_Text34.htmlText");
         result[422] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = " Active: " + okForActive;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ActorMakerControl_Text35.htmlText = param1;
         },"_ActorMakerControl_Text35.htmlText");
         result[423] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            _loc1_ = " Foreground: " + okForForeground;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ActorMakerControl_Text36.htmlText = param1;
         },"_ActorMakerControl_Text36.htmlText");
         result[424] = binding;
         return result;
      }
      
      public function set ui_npc_takesObjectCountOnChoice3Num(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1488685472ui_npc_takesObjectCountOnChoice3Num;
         if(_loc2_ !== param1)
         {
            this._1488685472ui_npc_takesObjectCountOnChoice3Num = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takesObjectCountOnChoice3Num",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_visualEffectWhenUsedType() : ComboBox
      {
         return this._394931005ui_item_visualEffectWhenUsedType;
      }
      
      public function set tileSummaryText(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._537959013tileSummaryText;
         if(_loc2_ !== param1)
         {
            this._537959013tileSummaryText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tileSummaryText",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_touchDamageCases(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1087460968ui_allchar_touchDamageCases;
         if(_loc2_ !== param1)
         {
            this._1087460968ui_allchar_touchDamageCases = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_touchDamageCases",_loc2_,param1));
         }
      }
      
      public function __tilePreview_doubleClick(param1:MouseEvent) : void
      {
         doubleClickTile(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_TalkTextFontIndex() : ComboBox
      {
         return this._444433311ui_npc_TalkTextFontIndex;
      }
      
      public function set pageAllChars(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._26865045pageAllChars;
         if(_loc2_ !== param1)
         {
            this._26865045pageAllChars = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageAllChars",_loc2_,param1));
         }
      }
      
      private function set okForForeground(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._648196720okForForeground;
         if(_loc2_ !== param1)
         {
            this._648196720okForForeground = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okForForeground",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum() : FormItem
      {
         return this._1207526179fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_soundWhenMelee() : ComboBox
      {
         return this._315122910ui_allchar_soundWhenMelee;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewShotRangeBonus() : FormItem
      {
         return this._1763226861fi_item_equippedNewShotRangeBonus;
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonNew() : Button
      {
         return this._2015528174ButtonNew;
      }
      
      public function set actorDestData(param1:XML) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._78678657actorDestData;
         if(_loc2_ !== param1)
         {
            this._78678657actorDestData = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorDestData",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_meleeDamageToPlayerNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1608346234ui_allchar_meleeDamageToPlayerNum;
         if(_loc2_ !== param1)
         {
            this._1608346234ui_allchar_meleeDamageToPlayerNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_meleeDamageToPlayerNum",_loc2_,param1));
         }
      }
      
      public function __ButtonSave_click(param1:MouseEvent) : void
      {
         saveActorClickHandler();
      }
      
      public function set ui_npc_responseChoice3DropPersistsYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2116756853ui_npc_responseChoice3DropPersistsYN;
         if(_loc2_ !== param1)
         {
            this._2116756853ui_npc_responseChoice3DropPersistsYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice3DropPersistsYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_allchar_leftYN() : FormItem
      {
         return this._371633440fi_allchar_leftYN;
      }
      
      public function set ui_item_equippedNewShotDamageBonusNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1861231248ui_item_equippedNewShotDamageBonusNum;
         if(_loc2_ !== param1)
         {
            this._1861231248ui_item_equippedNewShotDamageBonusNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedNewShotDamageBonusNum",_loc2_,param1));
         }
      }
      
      public function set ui_item_squishPlayerYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._7296354ui_item_squishPlayerYN;
         if(_loc2_ !== param1)
         {
            this._7296354ui_item_squishPlayerYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_squishPlayerYN",_loc2_,param1));
         }
      }
      
      public function set ui_npc_responseChoice2Stay(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1531988320ui_npc_responseChoice2Stay;
         if(_loc2_ !== param1)
         {
            this._1531988320ui_npc_responseChoice2Stay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice2Stay",_loc2_,param1));
         }
      }
      
      public function set pageConditions(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1186451111pageConditions;
         if(_loc2_ !== param1)
         {
            this._1186451111pageConditions = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageConditions",_loc2_,param1));
         }
      }
      
      public function ___ActorMakerControl_LinkButton10_click(param1:MouseEvent) : void
      {
         ui_item_keyForThisDoor.text = "";
         itemDeterminantChanged();
      }
      
      public function set fi_item_visualEffectWhenUsedType(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._308144462fi_item_visualEffectWhenUsedType;
         if(_loc2_ !== param1)
         {
            this._308144462fi_item_visualEffectWhenUsedType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_visualEffectWhenUsedType",_loc2_,param1));
         }
      }
      
      public function set ui_all_description(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._177647283ui_all_description;
         if(_loc2_ !== param1)
         {
            this._177647283ui_all_description = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_description",_loc2_,param1));
         }
      }
      
      private function set okForActive(param1:String) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1112499891okForActive;
         if(_loc2_ !== param1)
         {
            this._1112499891okForActive = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okForActive",_loc2_,param1));
         }
      }
      
      private function set mainViewStackEnabled(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1097044297mainViewStackEnabled;
         if(_loc2_ !== param1)
         {
            this._1097044297mainViewStackEnabled = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainViewStackEnabled",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animations() : Canvas
      {
         return this._314070383animations;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_dropsObjectRandomlyChance() : FormItem
      {
         return this._981685623fi_itemOrNPC_dropsObjectRandomlyChance;
      }
      
      [Bindable(event="propertyChange")]
      public function get myWD() : WipeDown
      {
         return this._3366265myWD;
      }
      
      public function set fi_itemOrNPC_dropsObjectWhenKilledName2(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._444139843fi_itemOrNPC_dropsObjectWhenKilledName2;
         if(_loc2_ !== param1)
         {
            this._444139843fi_itemOrNPC_dropsObjectWhenKilledName2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_itemOrNPC_dropsObjectWhenKilledName2",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_rightYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2004682430ui_allchar_rightYN;
         if(_loc2_ !== param1)
         {
            this._2004682430ui_allchar_rightYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_rightYN",_loc2_,param1));
         }
      }
      
      public function set fi_item_gainPowerSecondsNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._223166141fi_item_gainPowerSecondsNum;
         if(_loc2_ !== param1)
         {
            this._223166141fi_item_gainPowerSecondsNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_gainPowerSecondsNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_pushYN() : ComboBox
      {
         return this._673888894ui_allchar_pushYN;
      }
      
      public function set ui_itemOrNPC_dropsObjectWhenKilledChance2(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1569725757ui_itemOrNPC_dropsObjectWhenKilledChance2;
         if(_loc2_ !== param1)
         {
            this._1569725757ui_itemOrNPC_dropsObjectWhenKilledChance2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_dropsObjectWhenKilledChance2",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myWR() : WipeRight
      {
         return this._3366279myWR;
      }
      
      [Bindable(event="propertyChange")]
      public function get myWU() : WipeUp
      {
         return this._3366282myWU;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_gainOrLosePointsNum() : NumericStepper
      {
         return this._741688715ui_item_gainOrLosePointsNum;
      }
      
      private function tagCheck(param1:String) : void
      {
         ActiveTutorial.getInstance().tutorialTagCheck("actormaker_" + param1);
      }
      
      public function set ui_itemOrNPC_dropsObjectRandomlyChance(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._296058168ui_itemOrNPC_dropsObjectRandomlyChance;
         if(_loc2_ !== param1)
         {
            this._296058168ui_itemOrNPC_dropsObjectRandomlyChance = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_dropsObjectRandomlyChance",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get footer() : EditFooterComponent
      {
         return this._1268861541footer;
      }
      
      public function set ui_npc_takesObjectOnChoice1(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._588202289ui_npc_takesObjectOnChoice1;
         if(_loc2_ !== param1)
         {
            this._588202289ui_npc_takesObjectOnChoice1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takesObjectOnChoice1",_loc2_,param1));
         }
      }
      
      public function set ui_npc_takesObjectOnChoice2(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._588202288ui_npc_takesObjectOnChoice2;
         if(_loc2_ !== param1)
         {
            this._588202288ui_npc_takesObjectOnChoice2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takesObjectOnChoice2",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_movementSpeedNum() : NumericStepper
      {
         return this._773014111ui_allchar_movementSpeedNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewShotActor() : TextInput
      {
         return this._439452261ui_item_equippedNewShotActor;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takesObjectCountOnChoice1Num() : NumericStepper
      {
         return this._1488745054ui_npc_takesObjectCountOnChoice1Num;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_jumpYN() : ComboBox
      {
         return this._845834858ui_allchar_jumpYN;
      }
      
      private function processChooseActorForConditionsFromSelection(param1:ChoosePieceEvent) : void
      {
         var _loc2_:MgbActor = null;
         if(param1.activating)
         {
            _loc2_ = MgbActor(actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,param1.pieceName));
            if(Boolean(_loc2_) && _loc2_.actorXML.databag.all.actorType == MgbActor.alActorType_Shot)
            {
               Alert.show("You should NOT choose a SHOT-type actor for shots. The \'" + param1.pieceName + "\' actor is a " + MgbActor.alActorType[_loc2_.actorXML.databag.all.actorType] + " so won\'t work...","Warning");
            }
            else
            {
               ui_allchar_conditionsActor.text = param1.pieceName;
            }
            tagCheck("choose_conditions_actor_complete");
            updateFormsFromNames();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonHelp() : Button
      {
         return this._1943315021ButtonHelp;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_dropsObjectWhenKilledChance2() : FormItem
      {
         return this._1695374772fi_itemOrNPC_dropsObjectWhenKilledChance2;
      }
      
      public function set ui_npc_takesObjectOnChoice3(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._588202287ui_npc_takesObjectOnChoice3;
         if(_loc2_ !== param1)
         {
            this._588202287ui_npc_takesObjectOnChoice3 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_takesObjectOnChoice3",_loc2_,param1));
         }
      }
      
      public function __ButtonLoad_click(param1:MouseEvent) : void
      {
         loadActorClickHandler();
      }
      
      private function _ActorMakerControl_WipeDown1_i() : WipeDown
      {
         var _loc1_:WipeDown = new WipeDown();
         myWD = _loc1_;
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      public function set ui_allchar_touchDamageToNPCorItemNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1528989413ui_allchar_touchDamageToNPCorItemNum;
         if(_loc2_ !== param1)
         {
            this._1528989413ui_allchar_touchDamageToNPCorItemNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_touchDamageToNPCorItemNum",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_shotDamageToNPCorItemNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._187274522ui_allchar_shotDamageToNPCorItemNum;
         if(_loc2_ !== param1)
         {
            this._187274522ui_allchar_shotDamageToNPCorItemNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_shotDamageToNPCorItemNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_squishNPCYN() : ComboBox
      {
         return this._564974130ui_item_squishNPCYN;
      }
      
      public function set fi_all_killEffect(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1065255657fi_all_killEffect;
         if(_loc2_ !== param1)
         {
            this._1065255657fi_all_killEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_all_killEffect",_loc2_,param1));
         }
      }
      
      public function set ui_item_pushToSlideNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._752327403ui_item_pushToSlideNum;
         if(_loc2_ !== param1)
         {
            this._752327403ui_item_pushToSlideNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_pushToSlideNum",_loc2_,param1));
         }
      }
      
      public function set ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1323916564ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum;
         if(_loc2_ !== param1)
         {
            this._1323916564ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pageNPC() : Canvas
      {
         return this._803566126pageNPC;
      }
      
      public function set fi_allchar_rightYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._219101459fi_allchar_rightYN;
         if(_loc2_ !== param1)
         {
            this._219101459fi_allchar_rightYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_allchar_rightYN",_loc2_,param1));
         }
      }
      
      private function chooseActorForDropChoiceClickHandler(param1:TextInput) : void
      {
         var _loc2_:ChoosePieceForm = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
         _loc2_.configure(mgbSession.userName,mgbSession.activeProject,Piece.MGB_ACTOR);
         _loc2_.contextHint = param1;
         _loc2_.addEventListener("change",processChooseActorForDropChoiceFromSelection);
         tagCheck("choose_drop_actor_choice");
      }
      
      public function ___ActorMakerControl_LinkButton2_click(param1:MouseEvent) : void
      {
         ui_npc_dropsObjectOnChoice1.text = "";
      }
      
      public function set ui_item_itemPushesActorType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1242908403ui_item_itemPushesActorType;
         if(_loc2_ !== param1)
         {
            this._1242908403ui_item_itemPushesActorType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_itemPushesActorType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewMeleeSound() : FormItem
      {
         return this._583619092fi_item_equippedNewMeleeSound;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_all_healEffect() : FormItem
      {
         return this._1696365069fi_all_healEffect;
      }
      
      public function set fi_allchar_downYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._152336123fi_allchar_downYN;
         if(_loc2_ !== param1)
         {
            this._152336123fi_allchar_downYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_allchar_downYN",_loc2_,param1));
         }
      }
      
      private function processChooseActorForDropChoiceFromSelection(param1:ChoosePieceEvent) : void
      {
         var _loc2_:MgbActor = null;
         if(param1.activating)
         {
            _loc2_ = MgbActor(actorCache.getPieceIfCached(mgbSession.userName,mgbSession.activeProject,param1.pieceName));
            if(Boolean(_loc2_) && (_loc2_.actorXML.databag.all.actorType == MgbActor.alActorType_Shot || _loc2_.actorXML.databag.all.actorType == MgbActor.alActorType_Player))
            {
               Alert.show("You can only drop Item-type or NPC-type Actors. The \'" + param1.pieceName + "\' actor is a " + MgbActor.alActorType[_loc2_.actorXML.databag.all.actorType] + " so won\'t work here...","Warning");
            }
            else
            {
               TextInput(param1.contextHint).text = param1.pieceName;
            }
            tagCheck("choose_drop_actor_choice_complete");
            itemDeterminantChanged();
            updateFormsFromNames();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_useText() : TextArea
      {
         return this._583635469ui_item_useText;
      }
      
      public function set ui_all_visualEffectWhenHealedType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._582586635ui_all_visualEffectWhenHealedType;
         if(_loc2_ !== param1)
         {
            this._582586635ui_all_visualEffectWhenHealedType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_visualEffectWhenHealedType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_aggroRange() : NumericStepper
      {
         return this._1347758584ui_npc_aggroRange;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice1DropPersistsYN() : ComboBox
      {
         return this._836893175ui_npc_responseChoice1DropPersistsYN;
      }
      
      private function loadCompleteHandler(param1:Event = null, param2:MgbActor = null) : void
      {
         tagCheck("load_completed");
         trace("ActorMaker: loaded actor " + actorPiece.name);
         validateLoadedActor();
         updateFormsFromNames();
         SetAllDeterminants();
         mainViewStackEnabled = true;
      }
      
      public function set fi_item_equippedNewShotActor(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._913371382fi_item_equippedNewShotActor;
         if(_loc2_ !== param1)
         {
            this._913371382fi_item_equippedNewShotActor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewShotActor",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice3Stay() : ComboBox
      {
         return this._1531064799ui_npc_responseChoice3Stay;
      }
      
      public function ___ActorMakerControl_LinkButton7_click(param1:MouseEvent) : void
      {
         ui_npc_takesObjectOnChoice3.text = "";
      }
      
      private function setActorDefaults() : void
      {
         ui_itemOrNPC_destroyableYN.selectedIndex = 1;
         ui_allchar_movementSpeedNum.value = 1;
         ui_allchar_upYN.selectedIndex = 1;
         ui_allchar_downYN.selectedIndex = 1;
         ui_allchar_leftYN.selectedIndex = 1;
         ui_allchar_rightYN.selectedIndex = 1;
         ui_npc_responseChoice1Stay.selectedIndex = MgbActor.alNpcDialogFinalAction_stay;
         ui_npc_responseChoice2Stay.selectedIndex = MgbActor.alNpcDialogFinalAction_stay;
         ui_npc_responseChoice3Stay.selectedIndex = MgbActor.alNpcDialogFinalAction_stay;
         ui_itemOrNPC_respawnOption.selectedIndex = 0;
         ui_itemOrNPC_dropsObjectWhenKilledChance.value = 100;
         ui_itemOrNPC_dropsObjectWhenKilledChance2.value = 100;
         ui_itemOrNPC_dropsObjectRandomlyChance.value = 100;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takeObjectTypeOnChoice1() : ComboBox
      {
         return this._2098866648ui_npc_takeObjectTypeOnChoice1;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takeObjectTypeOnChoice2() : ComboBox
      {
         return this._2098866647ui_npc_takeObjectTypeOnChoice2;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewShotSound() : FormItem
      {
         return this._896389596fi_item_equippedNewShotSound;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_equippedNewActorGraphics() : TextInput
      {
         return this._217676256ui_item_equippedNewActorGraphics;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takeObjectTypeOnChoice3() : ComboBox
      {
         return this._2098866646ui_npc_takeObjectTypeOnChoice3;
      }
      
      public function set fi_item_gainExtraLifeYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1114003694fi_item_gainExtraLifeYN;
         if(_loc2_ !== param1)
         {
            this._1114003694fi_item_gainExtraLifeYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_gainExtraLifeYN",_loc2_,param1));
         }
      }
      
      public function set ui_itemOrNPC_dropsObjectRandomlyName(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._147472609ui_itemOrNPC_dropsObjectRandomlyName;
         if(_loc2_ !== param1)
         {
            this._147472609ui_itemOrNPC_dropsObjectRandomlyName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_dropsObjectRandomlyName",_loc2_,param1));
         }
      }
      
      public function set ui_npc_saysWhatOnChoice1(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1532045540ui_npc_saysWhatOnChoice1;
         if(_loc2_ !== param1)
         {
            this._1532045540ui_npc_saysWhatOnChoice1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_saysWhatOnChoice1",_loc2_,param1));
         }
      }
      
      public function set ui_npc_saysWhatOnChoice2(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1532045539ui_npc_saysWhatOnChoice2;
         if(_loc2_ !== param1)
         {
            this._1532045539ui_npc_saysWhatOnChoice2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_saysWhatOnChoice2",_loc2_,param1));
         }
      }
      
      private function _ActorMakerControl_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ActorGraphicsEffectComboBox;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_keyForThisDoorConsumedYN() : FormItem
      {
         return this._473577917fi_item_keyForThisDoorConsumedYN;
      }
      
      public function set ui_npc_responseChoice1Stay(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1532911841ui_npc_responseChoice1Stay;
         if(_loc2_ !== param1)
         {
            this._1532911841ui_npc_responseChoice1Stay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice1Stay",_loc2_,param1));
         }
      }
      
      public function set ui_item_winLevelYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._561852642ui_item_winLevelYN;
         if(_loc2_ !== param1)
         {
            this._561852642ui_item_winLevelYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_winLevelYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_allchar_sound_when_shooting() : FormItem
      {
         return this._196272556fi_allchar_sound_when_shooting;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_shotAccuracyType() : ComboBox
      {
         return this._780106154ui_npc_shotAccuracyType;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_gravityYN() : ComboBox
      {
         return this._1632661926ui_all_gravityYN;
      }
      
      public function set ui_itemOrNPC_destroyableYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2094566186ui_itemOrNPC_destroyableYN;
         if(_loc2_ !== param1)
         {
            this._2094566186ui_itemOrNPC_destroyableYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_destroyableYN",_loc2_,param1));
         }
      }
      
      public function set ui_item_itemPushesActorDistance(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1493942062ui_item_itemPushesActorDistance;
         if(_loc2_ !== param1)
         {
            this._1493942062ui_item_itemPushesActorDistance = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_itemPushesActorDistance",_loc2_,param1));
         }
      }
      
      public function set ui_allchar_leftYN(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._803557585ui_allchar_leftYN;
         if(_loc2_ !== param1)
         {
            this._803557585ui_allchar_leftYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_leftYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takesObjectCountOnChoice3Num() : NumericStepper
      {
         return this._1488685472ui_npc_takesObjectCountOnChoice3Num;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_touchDamageCases() : ComboBox
      {
         return this._1087460968ui_allchar_touchDamageCases;
      }
      
      public function set ui_npc_saysWhatOnChoice3(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1532045538ui_npc_saysWhatOnChoice3;
         if(_loc2_ !== param1)
         {
            this._1532045538ui_npc_saysWhatOnChoice3 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_saysWhatOnChoice3",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get okForBackground() : String
      {
         return this._1626512987okForBackground;
      }
      
      public function set fi_item_equippedNewMeleeDamageBonusNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._913669945fi_item_equippedNewMeleeDamageBonusNum;
         if(_loc2_ !== param1)
         {
            this._913669945fi_item_equippedNewMeleeDamageBonusNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewMeleeDamageBonusNum",_loc2_,param1));
         }
      }
      
      public function set fi_item_equippedNewShotDamageBonus(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._888992581fi_item_equippedNewShotDamageBonus;
         if(_loc2_ !== param1)
         {
            this._888992581fi_item_equippedNewShotDamageBonus = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_equippedNewShotDamageBonus",_loc2_,param1));
         }
      }
      
      public function __ui_allchar_conditionsActor_click(param1:MouseEvent) : void
      {
         chooseActorForConditionsClickHandler();
      }
      
      public function __ui_item_equippedNewShotSound_change(param1:ListEvent) : void
      {
         MgbActor.playCannedSound(String(ui_item_equippedNewShotSound.selectedItem));
      }
      
      public function set ui_itemOrNPC_dropsObjectWhenKilledChance(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._743372977ui_itemOrNPC_dropsObjectWhenKilledChance;
         if(_loc2_ !== param1)
         {
            this._743372977ui_itemOrNPC_dropsObjectWhenKilledChance = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_dropsObjectWhenKilledChance",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice2Stay() : ComboBox
      {
         return this._1531988320ui_npc_responseChoice2Stay;
      }
      
      public function set fi_item_squishPlayerYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._498776909fi_item_squishPlayerYN;
         if(_loc2_ !== param1)
         {
            this._498776909fi_item_squishPlayerYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_squishPlayerYN",_loc2_,param1));
         }
      }
      
      public function set ui_all_actorType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._260565178ui_all_actorType;
         if(_loc2_ !== param1)
         {
            this._260565178ui_all_actorType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_actorType",_loc2_,param1));
         }
      }
      
      public function set ui_item_healOrHarmWhenUsedNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._492380337ui_item_healOrHarmWhenUsedNum;
         if(_loc2_ !== param1)
         {
            this._492380337ui_item_healOrHarmWhenUsedNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_healOrHarmWhenUsedNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pageConditions() : Canvas
      {
         return this._1186451111pageConditions;
      }
      
      public function set fi_item_winLevelYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1509330765fi_item_winLevelYN;
         if(_loc2_ !== param1)
         {
            this._1509330765fi_item_winLevelYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_winLevelYN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_visualEffectWhenUsedType() : FormItem
      {
         return this._308144462fi_item_visualEffectWhenUsedType;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_description() : TextInput
      {
         return this._177647283ui_all_description;
      }
      
      public function set ButtonLoad(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1943186600ButtonLoad;
         if(_loc2_ !== param1)
         {
            this._1943186600ButtonLoad = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonLoad",_loc2_,param1));
         }
      }
      
      public function __ui_npc_takesObjectOnChoice3_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_npc_takesObjectOnChoice3);
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_itemOrNPC_dropsObjectWhenKilledName2() : FormItem
      {
         return this._444139843fi_itemOrNPC_dropsObjectWhenKilledName2;
      }
      
      public function set fi_item_itemPushesActorDistance(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._526910303fi_item_itemPushesActorDistance;
         if(_loc2_ !== param1)
         {
            this._526910303fi_item_itemPushesActorDistance = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_itemPushesActorDistance",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_rightYN() : ComboBox
      {
         return this._2004682430ui_allchar_rightYN;
      }
      
      [Bindable(event="propertyChange")]
      private function get mainViewStackEnabled() : Boolean
      {
         return this._1097044297mainViewStackEnabled;
      }
      
      public function set ui_item_itemActivationType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1005559964ui_item_itemActivationType;
         if(_loc2_ !== param1)
         {
            this._1005559964ui_item_itemActivationType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_itemActivationType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get okForActive() : String
      {
         return this._1112499891okForActive;
      }
      
      private function damageRulesChanged() : void
      {
         var _loc1_:* = 1 == ui_itemOrNPC_destroyableYN.selectedIndex;
         fi_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum.enabled = _loc1_;
         fi_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum.enabled = _loc1_;
         fi_itemOrNPC_dropsObjectWhenKilledName.enabled = _loc1_;
         fi_itemOrNPC_dropsObjectWhenKilledName2.enabled = _loc1_;
         fi_itemOrNPC_dropsObjectWhenKilledChance.enabled = _loc1_;
         fi_itemOrNPC_dropsObjectWhenKilledChance2.enabled = _loc1_;
         fi_itemOrNPC_respawnOption.enabled = _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takesObjectOnChoice1() : TextInput
      {
         return this._588202289ui_npc_takesObjectOnChoice1;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takesObjectOnChoice2() : TextInput
      {
         return this._588202288ui_npc_takesObjectOnChoice2;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_takesObjectOnChoice3() : TextInput
      {
         return this._588202287ui_npc_takesObjectOnChoice3;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_gainPowerSecondsNum() : FormItem
      {
         return this._223166141fi_item_gainPowerSecondsNum;
      }
      
      public function set actormakerBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._657392486actormakerBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._657392486actormakerBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actormakerBackgroundColor",_loc2_,param1));
         }
      }
      
      private function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      public function set ui_item_equippedArmorEffect(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1241953424ui_item_equippedArmorEffect;
         if(_loc2_ !== param1)
         {
            this._1241953424ui_item_equippedArmorEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_equippedArmorEffect",_loc2_,param1));
         }
      }
      
      public function set ui_npc_movementType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1886001010ui_npc_movementType;
         if(_loc2_ !== param1)
         {
            this._1886001010ui_npc_movementType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_movementType",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_touchDamageToNPCorItemNum() : NumericStepper
      {
         return this._1528989413ui_allchar_touchDamageToNPCorItemNum;
      }
      
      public function set fi_allchar_pushYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._501302131fi_allchar_pushYN;
         if(_loc2_ !== param1)
         {
            this._501302131fi_allchar_pushYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_allchar_pushYN",_loc2_,param1));
         }
      }
      
      public function __ui_all_actorType_change(param1:ListEvent) : void
      {
         actorTypeChanged();
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_allchar_rightYN() : FormItem
      {
         return this._219101459fi_allchar_rightYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_itemPushesActorType() : ComboBox
      {
         return this._1242908403ui_item_itemPushesActorType;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_visualEffectWhenHealedType() : ComboBox
      {
         return this._582586635ui_all_visualEffectWhenHealedType;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_allchar_downYN() : FormItem
      {
         return this._152336123fi_allchar_downYN;
      }
      
      public function set fi_item_squishNPCYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._782797953fi_item_squishNPCYN;
         if(_loc2_ !== param1)
         {
            this._782797953fi_item_squishNPCYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_squishNPCYN",_loc2_,param1));
         }
      }
      
      public function set ui_npc_TalkText(param1:TextArea) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._126090114ui_npc_TalkText;
         if(_loc2_ !== param1)
         {
            this._126090114ui_npc_TalkText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_TalkText",_loc2_,param1));
         }
      }
      
      public function ___ActorMakerControl_LinkButton13_click(param1:MouseEvent) : void
      {
         ui_itemOrNPC_dropsObjectRandomlyName.text = "";
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewShotActor() : FormItem
      {
         return this._913371382fi_item_equippedNewShotActor;
      }
      
      private function itemDeterminantChanged() : void
      {
         var _loc2_:int = 0;
         updateSupportedLayerInfo();
         var _loc1_:int = ui_all_actorType.selectedIndex;
         if(_loc1_ == MgbActor.alActorType_Item)
         {
            _loc2_ = ui_item_itemActivationType.selectedIndex;
            hbox_item_keyForThisDoor.visible = hbox_item_keyForThisDoor.includeInLayout = false;
            fi_item_visualEffectWhenUsedType.visible = fi_item_visualEffectWhenUsedType.includeInLayout = false;
            fi_item_pushToSlideNum.visible = fi_item_pushToSlideNum.includeInLayout = false;
            fi_item_squishPlayerYN.visible = fi_item_squishPlayerYN.includeInLayout = false;
            fi_item_squishNPCYN.visible = fi_item_squishNPCYN.includeInLayout = false;
            fi_item_healOrHarmWhenUsedNum.visible = fi_item_healOrHarmWhenUsedNum.includeInLayout = false;
            fi_item_increasesMaxHealthNum.visible = fi_item_increasesMaxHealthNum.includeInLayout = false;
            fi_item_gainExtraLifeYN.visible = fi_item_gainExtraLifeYN.includeInLayout = false;
            fi_item_gainOrLosePointsNum.visible = fi_item_gainOrLosePointsNum.includeInLayout = false;
            fi_item_winLevelYN.visible = fi_item_winLevelYN.includeInLayout = false;
            fi_item_gainPowerType.visible = fi_item_gainPowerType.includeInLayout = false;
            fi_item_gainPowerSecondsNum.visible = fi_item_gainPowerSecondsNum.includeInLayout = false;
            fi_item_useText.visible = fi_item_useText.includeInLayout = false;
            fi_item_itemPushesActorType.visible = fi_item_itemPushesActorType.includeInLayout = false;
            fi_item_itemPushesActorDistance.visible = fi_item_itemPushesActorDistance.includeInLayout = false;
            switch(_loc2_)
            {
               case MgbActor.alItemActivationType_Inactive:
               case MgbActor.alItemActivationType_BlocksNPC:
                  break;
               case MgbActor.alItemActivationType_BlocksPlayer:
               case MgbActor.alItemActivationType_BlocksPlayerAndNPC:
                  fi_item_pushToSlideNum.visible = fi_item_pushToSlideNum.includeInLayout = true;
                  fi_item_squishPlayerYN.visible = fi_item_squishPlayerYN.includeInLayout = false;
                  fi_item_squishNPCYN.visible = fi_item_squishNPCYN.includeInLayout = ui_item_pushToSlideNum.value != 0;
                  fi_item_useText.visible = fi_item_useText.includeInLayout = false;
                  fi_item_visualEffectWhenUsedType.visible = fi_item_visualEffectWhenUsedType.includeInLayout = false;
                  hbox_item_keyForThisDoor.visible = hbox_item_keyForThisDoor.includeInLayout = ui_item_pushToSlideNum.value == 0;
                  pageItemOrNPC.enabled = false;
                  break;
               case MgbActor.alItemActivationType_PlayerShootsItemToUse:
                  break;
               case MgbActor.alItemActivationType_PlayerPicksUpUsesLater:
                  fi_itemOrNPC_respawnOption.enabled = true;
                  fi_item_useText.visible = fi_item_useText.includeInLayout = true;
                  fi_item_useText.visible = fi_item_useText.includeInLayout = true;
                  if(ui_item_inventoryEquippableYN.selectedIndex == 1)
                  {
                     break;
                  }
               case MgbActor.alItemActivationType_PlayerPicksUpUsesNow:
               case MgbActor.alItemActivationType_PlayerUsesAndLeavesItem:
                  fi_item_gainOrLosePointsNum.visible = fi_item_gainOrLosePointsNum.includeInLayout = true;
                  fi_item_winLevelYN.visible = fi_item_winLevelYN.includeInLayout = true;
                  fi_item_healOrHarmWhenUsedNum.visible = fi_item_healOrHarmWhenUsedNum.includeInLayout = true;
                  fi_item_increasesMaxHealthNum.visible = fi_item_increasesMaxHealthNum.includeInLayout = true;
                  fi_item_gainPowerType.visible = fi_item_gainPowerType.includeInLayout = true;
                  fi_item_gainPowerSecondsNum.visible = fi_item_gainPowerSecondsNum.includeInLayout = true;
                  fi_item_useText.visible = fi_item_useText.includeInLayout = true;
                  fi_item_visualEffectWhenUsedType.visible = fi_item_visualEffectWhenUsedType.includeInLayout = false;
                  break;
               case MgbActor.alItemActivationType_PushesActors:
                  fi_item_itemPushesActorType.visible = fi_item_itemPushesActorType.includeInLayout = true;
                  fi_item_itemPushesActorDistance.visible = fi_item_itemPushesActorDistance.includeInLayout = true;
                  pageConditions.enabled = false;
                  break;
               case MgbActor.alItemActivationType_CausesDamage:
                  fi_item_healOrHarmWhenUsedNum.visible = fi_item_healOrHarmWhenUsedNum.includeInLayout = true;
            }
            fi_item_gainPowerSecondsNum.visible = fi_item_gainPowerSecondsNum.includeInLayout = 0 != ui_item_gainPowerType.selectedIndex;
         }
      }
      
      public function set ui_itemOrNPC_dropsObjectWhenKilledName2(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1399491700ui_itemOrNPC_dropsObjectWhenKilledName2;
         if(_loc2_ !== param1)
         {
            this._1399491700ui_itemOrNPC_dropsObjectWhenKilledName2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_dropsObjectWhenKilledName2",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_gainExtraLifeYN() : FormItem
      {
         return this._1114003694fi_item_gainExtraLifeYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_dropsObjectRandomlyName() : TextInput
      {
         return this._147472609ui_itemOrNPC_dropsObjectRandomlyName;
      }
      
      public function set ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1575810953ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum;
         if(_loc2_ !== param1)
         {
            this._1575810953ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_saysWhatOnChoice1() : TextInput
      {
         return this._1532045540ui_npc_saysWhatOnChoice1;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_itemPushesActorDistance() : NumericStepper
      {
         return this._1493942062ui_item_itemPushesActorDistance;
      }
      
      public function set fi_allchar_jumpYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._329356167fi_allchar_jumpYN;
         if(_loc2_ !== param1)
         {
            this._329356167fi_allchar_jumpYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_allchar_jumpYN",_loc2_,param1));
         }
      }
      
      private function chooseActorForConditionsClickHandler() : void
      {
         var _loc1_:ChoosePieceForm = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
         _loc1_.configure(mgbSession.userName,mgbSession.activeProject,Piece.MGB_ACTOR);
         _loc1_.addEventListener("change",processChooseActorForConditionsFromSelection);
         tagCheck("choose_conditions_actor");
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_allchar_leftYN() : ComboBox
      {
         return this._803557585ui_allchar_leftYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice1Stay() : ComboBox
      {
         return this._1532911841ui_npc_responseChoice1Stay;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_equippedNewMeleeDamageBonusNum() : FormItem
      {
         return this._913669945fi_item_equippedNewMeleeDamageBonusNum;
      }
      
      private function saveActorClickHandler() : void
      {
         if(null == actorPiece.tilename || "" == actorPiece.tilename)
         {
            Alert.show("Cannot save Actor until you choose a tile");
         }
         else
         {
            actorPiece.savePieceUsingDialog(mgbSession.userName,mgbSession.activeProject,this,processSaveSubmitClick);
            tagCheck("save");
         }
      }
      
      public function set fi_item_pushToSlideNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1258400666fi_item_pushToSlideNum;
         if(_loc2_ !== param1)
         {
            this._1258400666fi_item_pushToSlideNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_pushToSlideNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_winLevelYN() : ComboBox
      {
         return this._561852642ui_item_winLevelYN;
      }
      
      public function set fi_item_itemPushesActorType(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._296399964fi_item_itemPushesActorType;
         if(_loc2_ !== param1)
         {
            this._296399964fi_item_itemPushesActorType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_itemPushesActorType",_loc2_,param1));
         }
      }
      
      public function set ui_all_initialMaxHealthNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1696893023ui_all_initialMaxHealthNum;
         if(_loc2_ !== param1)
         {
            this._1696893023ui_all_initialMaxHealthNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_initialMaxHealthNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_saysWhatOnChoice3() : TextInput
      {
         return this._1532045538ui_npc_saysWhatOnChoice3;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_item_winLevelYN() : FormItem
      {
         return this._1509330765fi_item_winLevelYN;
      }
      
      public function set ui_npc_responseChoice2(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._820144039ui_npc_responseChoice2;
         if(_loc2_ !== param1)
         {
            this._820144039ui_npc_responseChoice2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice2",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_dropsObjectWhenKilledChance() : NumericStepper
      {
         return this._743372977ui_itemOrNPC_dropsObjectWhenKilledChance;
      }
      
      public function set ui_npc_responseChoice3(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._820144040ui_npc_responseChoice3;
         if(_loc2_ !== param1)
         {
            this._820144040ui_npc_responseChoice3 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice3",_loc2_,param1));
         }
      }
      
      public function set ui_npc_responseChoice1(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._820144038ui_npc_responseChoice1;
         if(_loc2_ !== param1)
         {
            this._820144038ui_npc_responseChoice1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_npc_responseChoice1",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_actorType() : ComboBox
      {
         return this._260565178ui_all_actorType;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_healOrHarmWhenUsedNum() : NumericStepper
      {
         return this._492380337ui_item_healOrHarmWhenUsedNum;
      }
      
      public function set ui_allchar_shotDamageToPlayerNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._384693330ui_allchar_shotDamageToPlayerNum;
         if(_loc2_ !== param1)
         {
            this._384693330ui_allchar_shotDamageToPlayerNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_shotDamageToPlayerNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_saysWhatOnChoice2() : TextInput
      {
         return this._1532045539ui_npc_saysWhatOnChoice2;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_item_itemActivationType() : ComboBox
      {
         return this._1005559964ui_item_itemActivationType;
      }
      
      public function __ui_itemOrNPC_appearIf_change(param1:ListEvent) : void
      {
         itemDeterminantChanged();
      }
      
      public function set fi_allchar_upYN(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._452061108fi_allchar_upYN;
         if(_loc2_ !== param1)
         {
            this._452061108fi_allchar_upYN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_allchar_upYN",_loc2_,param1));
         }
      }
      
      private function _ActorMakerControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ui_all_actorType.selectedIndex;
         _loc1_ = ui_all_description.text;
         _loc1_ = ui_all_initialHealthNum.value;
         _loc1_ = ui_all_initialMaxHealthNum.value;
         _loc1_ = ui_all_gravityYN.selectedIndex;
         _loc1_ = MgbActor.soundIndexToName(ui_all_soundWhenHarmed.selectedIndex);
         _loc1_ = MgbActor.soundIndexToName(ui_all_soundWhenHealed.selectedIndex);
         _loc1_ = MgbActor.soundIndexToName(ui_all_soundWhenKilled.selectedIndex);
         _loc1_ = ui_all_visualEffectWhenHarmedType.selectedIndex;
         _loc1_ = ui_all_visualEffectWhenHealedType.selectedIndex;
         _loc1_ = ui_all_visualEffectWhenKilledType.selectedIndex;
         _loc1_ = ui_allchar_movementSpeedNum.value;
         _loc1_ = ui_allchar_upYN.selectedIndex;
         _loc1_ = ui_allchar_downYN.selectedIndex;
         _loc1_ = ui_allchar_leftYN.selectedIndex;
         _loc1_ = ui_allchar_rightYN.selectedIndex;
         _loc1_ = ui_allchar_shotRateNum.value;
         _loc1_ = ui_allchar_shotRangeNum.value;
         _loc1_ = MgbActor.soundIndexToName(ui_allchar_soundWhenShooting.selectedIndex);
         _loc1_ = ui_allchar_shotActor.text;
         _loc1_ = ui_allchar_pushYN.selectedIndex;
         _loc1_ = ui_allchar_jumpYN.selectedIndex;
         _loc1_ = ui_allchar_shotDamageToPlayerNum.value;
         _loc1_ = ui_allchar_shotDamageToNPCorItemNum.value;
         _loc1_ = ui_allchar_touchDamageToPlayerNum.value;
         _loc1_ = ui_allchar_touchDamageToNPCorItemNum.value;
         _loc1_ = ui_allchar_touchDamageAttackChance.value;
         _loc1_ = ui_allchar_touchDamageCases.selectedIndex;
         _loc1_ = ui_allchar_meleeDamageToPlayerNum.value;
         _loc1_ = ui_allchar_meleeDamageToNPCorItemNum.value;
         _loc1_ = MgbActor.soundIndexToName(ui_allchar_soundWhenMelee.selectedIndex);
         _loc1_ = ui_allchar_meleeRepeatDelay.value;
         _loc1_ = ui_npc_movementType.selectedIndex;
         _loc1_ = ui_npc_aggroRange.value;
         _loc1_ = ui_npc_canOccupyPlayerSpaceYN.selectedIndex;
         _loc1_ = ui_npc_shotAccuracyType.selectedIndex;
         _loc1_ = ui_npc_TalkText.text;
         _loc1_ = ui_npc_TalkTextFontIndex.selectedIndex;
         _loc1_ = ui_npc_responseChoice1.text;
         _loc1_ = ui_npc_takesObjectOnChoice1.text;
         _loc1_ = ui_npc_takesObjectCountOnChoice1Num.value;
         _loc1_ = ui_npc_takeObjectTypeOnChoice1.selectedIndex;
         _loc1_ = ui_npc_dropsObjectOnChoice1.text;
         _loc1_ = ui_npc_responseChoice1DropPersistsYN.selectedIndex;
         _loc1_ = ui_npc_responseChoice1Stay.selectedIndex;
         _loc1_ = ui_npc_saysWhatOnChoice1.text;
         _loc1_ = ui_npc_responseChoice2.text;
         _loc1_ = ui_npc_takesObjectOnChoice2.text;
         _loc1_ = ui_npc_takesObjectCountOnChoice2Num.value;
         _loc1_ = ui_npc_takeObjectTypeOnChoice2.selectedIndex;
         _loc1_ = ui_npc_dropsObjectOnChoice2.text;
         _loc1_ = ui_npc_responseChoice2DropPersistsYN.selectedIndex;
         _loc1_ = ui_npc_responseChoice2Stay.selectedIndex;
         _loc1_ = ui_npc_saysWhatOnChoice2.text;
         _loc1_ = ui_npc_responseChoice3.text;
         _loc1_ = ui_npc_takesObjectOnChoice3.text;
         _loc1_ = ui_npc_takesObjectCountOnChoice3Num.value;
         _loc1_ = ui_npc_takeObjectTypeOnChoice3.selectedIndex;
         _loc1_ = ui_npc_dropsObjectOnChoice3.text;
         _loc1_ = ui_npc_responseChoice3DropPersistsYN.selectedIndex;
         _loc1_ = ui_npc_responseChoice3Stay.selectedIndex;
         _loc1_ = ui_npc_saysWhatOnChoice3.text;
         _loc1_ = ui_item_itemActivationType.selectedIndex;
         _loc1_ = ui_item_inventoryEquippableYN.selectedIndex;
         _loc1_ = ui_item_inventoryEquipSlot.text;
         _loc1_ = ui_item_visualEffectWhenUsedType.selectedIndex;
         _loc1_ = ui_item_pushToSlideNum.value;
         _loc1_ = ui_item_squishPlayerYN.selectedIndex;
         _loc1_ = ui_item_squishNPCYN.selectedIndex;
         _loc1_ = ui_item_healOrHarmWhenUsedNum.value;
         _loc1_ = ui_item_increasesMaxHealthNum.value;
         _loc1_ = ui_item_gainExtraLifeYN.selectedIndex;
         _loc1_ = ui_item_gainOrLosePointsNum.value;
         _loc1_ = ui_item_winLevelYN.selectedIndex;
         _loc1_ = ui_item_gainPowerType.selectedIndex;
         _loc1_ = ui_item_gainPowerSecondsNum.value;
         _loc1_ = ui_item_useText.text;
         _loc1_ = ui_item_itemPushesActorType.selectedIndex;
         _loc1_ = ui_item_itemPushesActorDistance.value;
         _loc1_ = ui_item_keyForThisDoor.text;
         _loc1_ = ui_item_keyForThisDoorConsumedYN.selectedIndex;
         _loc1_ = ui_item_autoEquipYN.selectedIndex;
         _loc1_ = ui_item_equippedNewActorGraphics.text;
         _loc1_ = ui_item_equippedNewShotActor.text;
         _loc1_ = ui_item_equippedNewShotSound.text;
         _loc1_ = ui_item_equippedNewShotDamageBonusNum.value;
         _loc1_ = ui_item_equippedNewShotRateBonusNum.value;
         _loc1_ = ui_item_equippedNewShotRangeBonusNum.value;
         _loc1_ = ui_item_equippedArmorEffect.value;
         _loc1_ = ui_item_equippedNewMeleeDamageBonusNum.value;
         _loc1_ = MgbActor.soundIndexToName(ui_item_equippedNewMeleeSound.selectedIndex);
         _loc1_ = ui_item_equippedNewMeleeRepeatDelayModifierNum.value;
         _loc1_ = ui_itemOrNPC_destroyableYN.selectedIndex;
         _loc1_ = ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum.value;
         _loc1_ = ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum.value;
         _loc1_ = ui_itemOrNPC_dropsObjectWhenKilledName.text;
         _loc1_ = ui_itemOrNPC_dropsObjectWhenKilledChance.value;
         _loc1_ = ui_itemOrNPC_dropsObjectWhenKilledName2.text;
         _loc1_ = ui_itemOrNPC_dropsObjectWhenKilledChance2.value;
         _loc1_ = ui_itemOrNPC_dropsObjectRandomlyName.text;
         _loc1_ = ui_itemOrNPC_dropsObjectRandomlyChance.value;
         _loc1_ = ui_itemOrNPC_respawnOption.selectedIndex;
         _loc1_ = ui_itemOrNPC_appearIf.selectedIndex;
         _loc1_ = ui_itemOrNPC_appearCount.value;
         _loc1_ = ui_allchar_conditionsActor.text;
         _loc1_ = mainViewStack;
         _loc1_ = mainViewStackEnabled;
         _loc1_ = mainViewStackEnabled;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = MgbActor.alActorType;
         _loc1_ = actorPiece.actorXML.databag.all.actorType;
         _loc1_ = actorPiece.actorXML.databag.all.description;
         _loc1_ = actorPiece.actorXML.databag.all.initialHealthNum;
         _loc1_ = actorPiece.actorXML.databag.all.initialMaxHealthNum;
         _loc1_ = notYet;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.all.gravityYN;
         _loc1_ = MgbActor.alCannedSoundsList;
         _loc1_ = MgbActor.soundNameToIndex(actorPiece.actorXML.databag.all.soundWhenHarmed);
         _loc1_ = notYet;
         _loc1_ = MgbActor.alVisualEffect;
         _loc1_ = actorPiece.actorXML.databag.all.visualEffectWhenHarmedType;
         _loc1_ = MgbActor.alCannedSoundsList;
         _loc1_ = MgbActor.soundNameToIndex(actorPiece.actorXML.databag.all.soundWhenHealed);
         _loc1_ = notYet;
         _loc1_ = MgbActor.alVisualEffect;
         _loc1_ = actorPiece.actorXML.databag.all.visualEffectWhenHealedType;
         _loc1_ = MgbActor.alCannedSoundsList;
         _loc1_ = MgbActor.soundNameToIndex(actorPiece.actorXML.databag.all.soundWhenKilled);
         _loc1_ = notYet;
         _loc1_ = MgbActor.alVisualEffect;
         _loc1_ = actorPiece.actorXML.databag.all.visualEffectWhenKilledType;
         _loc1_ = MgbSystem.tileMaxWidth;
         _loc1_ = MgbSystem.tileMaxHeight;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = actorPiece.animationTable;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = actorPiece.actorXML.databag.allchar.movementSpeedNum;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.allchar.upYN;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.allchar.downYN;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.allchar.leftYN;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.allchar.rightYN;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.allchar.pushYN;
         _loc1_ = notYet;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.allchar.jumpYN;
         _loc1_ = actorPiece.actorXML.databag.allchar.shotActor;
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = MgbActor.alCannedSoundsList;
         _loc1_ = MgbActor.soundNameToIndex(actorPiece.actorXML.databag.allchar.soundWhenShooting);
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = actorPiece.actorXML.databag.allchar.shotRateNum;
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = actorPiece.actorXML.databag.allchar.shotRangeNum;
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = actorPiece.actorXML.databag.allchar.shotDamageToPlayerNum;
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = ui_allchar_shotActor.text != "";
         _loc1_ = actorPiece.actorXML.databag.allchar.shotDamageToNPCorItemNum;
         _loc1_ = actorPiece.actorXML.databag.allchar.touchDamageToPlayerNum;
         _loc1_ = actorPiece.actorXML.databag.allchar.touchDamageToNPCorItemNum;
         _loc1_ = actorPiece.actorXML.databag.allchar.touchDamageAttackChance;
         _loc1_ = MgbActor.alTouchDamageCases;
         _loc1_ = actorPiece.actorXML.databag.allchar.touchDamageCases;
         _loc1_ = actorPiece.actorXML.databag.allchar.meleeDamageToPlayerNum;
         _loc1_ = actorPiece.actorXML.databag.allchar.meleeDamageToNPCorItemNum;
         _loc1_ = MgbActor.alCannedSoundsList;
         _loc1_ = MgbActor.soundNameToIndex(actorPiece.actorXML.databag.allchar.soundWhenMelee);
         _loc1_ = actorPiece.actorXML.databag.allchar.meleeRepeatDelay;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = MgbActor.alMovementType;
         _loc1_ = actorPiece.actorXML.databag.npc.movementType;
         _loc1_ = ui_npc_movementType.selectedIndex != MgbActor.alMovementType_ToPlayer;
         _loc1_ = ui_npc_movementType.selectedIndex != MgbActor.alMovementType_ToPlayer;
         _loc1_ = actorPiece.actorXML.databag.npc.aggroRange;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.npc.canOccupyPlayerSpaceYN;
         _loc1_ = MgbActor.alShotAccuracy;
         _loc1_ = actorPiece.actorXML.databag.npc.shotAccuracy;
         _loc1_ = ui_itemOrNPC_destroyableYN.selectedIndex == 1;
         _loc1_ = ui_itemOrNPC_destroyableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.npc.talkText;
         _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
         _loc1_ = ui_npc_TalkText.text.length > 0;
         _loc1_ = MgbSystem.gameFonts;
         _loc1_ = actorPiece.actorXML.databag.npc.talkTextFontIndex;
         _loc1_ = ui_npc_TalkText.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice1;
         _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
         _loc1_ = ui_npc_responseChoice1.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.dropsObjectOnChoice1;
         _loc1_ = ui_npc_dropsObjectOnChoice1.text != "";
         _loc1_ = ui_npc_dropsObjectOnChoice1.text != "";
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice1DropPersistsYN;
         _loc1_ = ui_npc_dropsObjectOnChoice1.text != "";
         _loc1_ = ui_npc_responseChoice1.text.length > 0;
         _loc1_ = "  NPC " + (ui_npc_takeObjectTypeOnChoice1.selectedIndex == MgbActor.alNpcTakeType_Take ? "takes" : "requires") + " item: ";
         _loc1_ = actorPiece.actorXML.databag.npc.takesObjectOnChoice1;
         _loc1_ = ui_npc_takesObjectOnChoice1.text != "";
         _loc1_ = ui_npc_takesObjectOnChoice1.text != "";
         _loc1_ = MgbActor.alNpcTakeTypes;
         _loc1_ = actorPiece.actorXML.databag.npc.takeObjectTypeOnChoice1;
         _loc1_ = ui_npc_takesObjectOnChoice1.text != "";
         _loc1_ = ui_npc_takesObjectOnChoice1.text != "";
         _loc1_ = actorPiece.actorXML.databag.npc.takesObjectCountOnChoice1Num;
         _loc1_ = ui_npc_takesObjectOnChoice1.text != "";
         _loc1_ = ui_npc_TalkText.text.length > 0 && ui_npc_responseChoice1.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.saysWhatOnChoice1;
         _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
         _loc1_ = MgbActor.alNpcDialogFinalAction;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice1StayYN;
         _loc1_ = ui_npc_TalkText.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice2;
         _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
         _loc1_ = ui_npc_responseChoice2.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.dropsObjectOnChoice2;
         _loc1_ = ui_npc_dropsObjectOnChoice2.text != "";
         _loc1_ = ui_npc_dropsObjectOnChoice2.text != "";
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice2DropPersistsYN;
         _loc1_ = ui_npc_dropsObjectOnChoice2.text != "";
         _loc1_ = ui_npc_responseChoice2.text.length > 0;
         _loc1_ = "  NPC " + (ui_npc_takeObjectTypeOnChoice2.selectedIndex == MgbActor.alNpcTakeType_Take ? "takes" : "requires") + " item: ";
         _loc1_ = actorPiece.actorXML.databag.npc.takesObjectOnChoice2;
         _loc1_ = ui_npc_takesObjectOnChoice2.text != "";
         _loc1_ = ui_npc_takesObjectOnChoice2.text != "";
         _loc1_ = MgbActor.alNpcTakeTypes;
         _loc1_ = actorPiece.actorXML.databag.npc.takeObjectTypeOnChoice2;
         _loc1_ = ui_npc_takesObjectOnChoice2.text != "";
         _loc1_ = ui_npc_takesObjectOnChoice2.text != "";
         _loc1_ = actorPiece.actorXML.databag.npc.takesObjectCountOnChoice2Num;
         _loc1_ = ui_npc_takesObjectOnChoice2.text != "";
         _loc1_ = ui_npc_TalkText.text.length > 0 && ui_npc_responseChoice2.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.saysWhatOnChoice2;
         _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
         _loc1_ = MgbActor.alNpcDialogFinalAction;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice2StayYN;
         _loc1_ = ui_npc_TalkText.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice3;
         _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
         _loc1_ = ui_npc_responseChoice3.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.dropsObjectOnChoice3;
         _loc1_ = ui_npc_dropsObjectOnChoice3.text != "";
         _loc1_ = ui_npc_dropsObjectOnChoice3.text != "";
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice3DropPersistsYN;
         _loc1_ = ui_npc_dropsObjectOnChoice3.text != "";
         _loc1_ = ui_npc_responseChoice3.text.length > 0;
         _loc1_ = "  NPC " + (ui_npc_takeObjectTypeOnChoice3.selectedIndex == MgbActor.alNpcTakeType_Take ? "takes" : "requires") + " item: ";
         _loc1_ = actorPiece.actorXML.databag.npc.takesObjectOnChoice3;
         _loc1_ = ui_npc_takesObjectOnChoice3.text != "";
         _loc1_ = ui_npc_takesObjectOnChoice3.text != "";
         _loc1_ = MgbActor.alNpcTakeTypes;
         _loc1_ = actorPiece.actorXML.databag.npc.takeObjectTypeOnChoice3;
         _loc1_ = ui_npc_takesObjectOnChoice3.text != "";
         _loc1_ = ui_npc_takesObjectOnChoice3.text != "";
         _loc1_ = actorPiece.actorXML.databag.npc.takesObjectCountOnChoice3Num;
         _loc1_ = ui_npc_takesObjectOnChoice3.text != "";
         _loc1_ = ui_npc_TalkText.text.length > 0 && ui_npc_responseChoice3.text.length > 0;
         _loc1_ = actorPiece.actorXML.databag.npc.saysWhatOnChoice3;
         _loc1_ = MgbSystem.gameFonts[ui_npc_TalkTextFontIndex.selectedIndex];
         _loc1_ = MgbActor.alNpcDialogFinalAction;
         _loc1_ = actorPiece.actorXML.databag.npc.responseChoice3StayYN;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = MgbActor.alItemActivation;
         _loc1_ = actorPiece.actorXML.databag.item.itemActivationType;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.item.inventoryEquippableYN;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.inventoryEquipSlot;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.equippedNewActorGraphics;
         _loc1_ = ui_item_equippedNewActorGraphics.text != "";
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1 && ui_item_equippedNewActorGraphics.text != "";
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1 && ui_item_equippedNewActorGraphics.text != "";
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1 && ui_item_equippedNewActorGraphics.text != "";
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1 && ui_item_equippedNewActorGraphics.text != "";
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.item.autoEquipYN;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.equippedNewShotActor;
         _loc1_ = ui_item_equippedNewShotActor.text != "";
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = MgbActor.alCannedSoundsList;
         _loc1_ = MgbActor.soundNameToIndex(actorPiece.actorXML.databag.item.equippedNewShotSound);
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.equippedNewShotDamageBonusNum;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.equippedNewShotRateBonusNum;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.equippedNewShotRangeBonusNum;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.equippedArmorEffect;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.equippedNewMeleeDamageBonusNum;
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = MgbActor.alCannedSoundsList;
         _loc1_ = MgbActor.soundNameToIndex(actorPiece.actorXML.databag.item.equippedNewMeleeSound);
         _loc1_ = myWR;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = ui_item_itemActivationType.selectedIndex == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && ui_item_inventoryEquippableYN.selectedIndex == 1;
         _loc1_ = actorPiece.actorXML.databag.item.equippedNewMeleeRepeatDelayModifierNum;
         _loc1_ = myWR;
         _loc1_ = MgbActor.alItemPushesActorType;
         _loc1_ = actorPiece.actorXML.databag.item.itemPushesActorType;
         _loc1_ = myWR;
         _loc1_ = actorPiece.actorXML.databag.item.itemPushesActorDistance;
         _loc1_ = notYet;
         _loc1_ = myWR;
         _loc1_ = MgbActor.alVisualEffect;
         _loc1_ = actorPiece.actorXML.databag.item.visualEffectWhenUsedType;
         _loc1_ = myWR;
         _loc1_ = actorPiece.actorXML.databag.item.useText;
         _loc1_ = myWR;
         _loc1_ = actorPiece.actorXML.databag.item.pushToSlideNum;
         _loc1_ = myWR;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.item.squishPlayerYN;
         _loc1_ = myWR;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.item.squishNPCYN;
         _loc1_ = ui_item_pushToSlideNum.value != 0;
         _loc1_ = actorPiece.actorXML.databag.item.keyForThisDoor;
         _loc1_ = ui_item_keyForThisDoor.text != "";
         _loc1_ = myWR;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.item.keyForThisDoorConsumedYN;
         _loc1_ = ui_item_pushToSlideNum.value == 0;
         _loc1_ = myWR;
         _loc1_ = actorPiece.actorXML.databag.item.healOrHarmWhenUsedNum;
         _loc1_ = myWR;
         _loc1_ = actorPiece.actorXML.databag.item.increasesMaxHealthNum;
         _loc1_ = myWR;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.item.gainExtraLifeYN;
         _loc1_ = myWR;
         _loc1_ = actorPiece.actorXML.databag.item.gainOrLosePointsNum;
         _loc1_ = myWR;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.item.winLevelYN;
         _loc1_ = myWR;
         _loc1_ = MgbActor.alGainPower;
         _loc1_ = actorPiece.actorXML.databag.item.gainPowerType;
         _loc1_ = myWR;
         _loc1_ = actorPiece.actorXML.databag.item.gainPowerSecondsNum;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = MgbActor.alNoYes;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.destroyableYN;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.scoreOrLosePointsWhenShotByPlayerNum;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.scoreOrLosePointsWhenKilledByPlayerNum;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectWhenKilledName;
         _loc1_ = ui_itemOrNPC_dropsObjectWhenKilledName.text != "";
         _loc1_ = ui_itemOrNPC_dropsObjectWhenKilledName.text != "";
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectWhenKilledChance;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectWhenKilledName2;
         _loc1_ = ui_itemOrNPC_dropsObjectWhenKilledName2.text != "";
         _loc1_ = ui_itemOrNPC_dropsObjectWhenKilledName2.text != "";
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectWhenKilledChance2;
         _loc1_ = MgbActor.alRespawnOptions;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.respawnOption;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectRandomlyName;
         _loc1_ = ui_itemOrNPC_dropsObjectRandomlyName.text != "";
         _loc1_ = "% chance of randomly generating actor \'" + ui_itemOrNPC_dropsObjectRandomlyName.text + "\' each second";
         _loc1_ = ui_itemOrNPC_dropsObjectRandomlyName.text != "";
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.dropsObjectRandomlyChance;
         _loc1_ = myWD;
         _loc1_ = myWU;
         _loc1_ = MgbActor.alAppearDisappear;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.appearIf;
         _loc1_ = ui_itemOrNPC_appearIf.selectedIndex > MgbActor.alAppearDisappear_NoCondition;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.appearCount;
         _loc1_ = ui_itemOrNPC_appearIf.selectedIndex > MgbActor.alAppearDisappear_NoCondition;
         _loc1_ = actorPiece.actorXML.databag.itemOrNPC.conditionsActor;
         _loc1_ = ui_itemOrNPC_appearIf.selectedIndex > MgbActor.alAppearDisappear_NoCondition;
         _loc1_ = ui_itemOrNPC_appearIf.selectedIndex > MgbActor.alAppearDisappear_NoCondition;
         _loc1_ = mainViewStackEnabled;
         _loc1_ = !mainViewStackEnabled;
         _loc1_ = mainViewStackEnabled;
         _loc1_ = MgbSystem.tilePreviewWidth;
         _loc1_ = MgbSystem.tilePreviewHeight;
         _loc1_ = mainViewStackEnabled;
         _loc1_ = " Background: " + okForBackground;
         _loc1_ = " Active: " + okForActive;
         _loc1_ = " Foreground: " + okForForeground;
      }
      
      public function set fi_all_health(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1186570314fi_all_health;
         if(_loc2_ !== param1)
         {
            this._1186570314fi_all_health = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_all_health",_loc2_,param1));
         }
      }
      
      private function checkForProblems() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:MgbTile = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc1_:Boolean = false;
         var _loc2_:MgbTile = MgbTile(MgbCaches.getInstance().tileCache.getPiece(MgbSession.getInstance().userName,MgbSession.getInstance().activeProject,actorPiece.tilename));
         if(_loc2_)
         {
            _loc3_ = "";
            _loc4_ = 0;
            while(_loc4_ < actorPiece.animationTable.length)
            {
               _loc5_ = String(actorPiece.animationTable[_loc4_].action);
               _loc6_ = String(actorPiece.animationTable[_loc4_].tilename);
               if(_loc7_ = MgbTile(MgbCaches.getInstance().tileCache.getPiece(MgbSession.getInstance().userName,MgbSession.getInstance().activeProject,_loc6_)))
               {
                  if(_loc5_.substr(0,5) == "melee")
                  {
                     _loc8_ = _loc2_.width + 2 * MgbSystem.tileMinWidth;
                     _loc9_ = _loc2_.height + 2 * MgbSystem.tileMinHeight;
                     _loc1_ = true;
                  }
                  else
                  {
                     _loc8_ = _loc2_.width;
                     _loc9_ = _loc2_.height;
                  }
                  if(_loc7_.width != _loc8_ || _loc7_.height != _loc9_)
                  {
                     _loc3_ += "Animation step \'" + _loc5_ + "\' should be " + _loc8_ + "x" + _loc9_ + " (the same size as \'" + actorPiece.tilename + "\') - but the chosen tile animation for this step, \'" + _loc6_ + "\', is " + _loc7_.width + "x" + _loc7_.height + ". For best results, make these the same size tile\n";
                  }
               }
               _loc4_++;
            }
            if(_loc2_.width == 48 || _loc2_.height == 48)
            {
               _loc3_ += "Use of 48x48 tiles is an advanced feature - the tiles cover 1.5 grid squares so some collision behaviours can be unpredictable\n";
            }
            if(_loc1_ && (_loc8_ > MgbSystem.tileMaxWidth || _loc9_ > MgbSystem.tileMaxHeight))
            {
               _loc3_ += "Main tile \'" + actorPiece.tilename + "\' is too large (" + _loc2_.width + "x" + _loc2_.height + ")to support Melee animations - Melee animations need to be three times larger than the main tile, but the largest tile supported in MGB is (" + MgbSystem.tileMaxWidth + "x" + MgbSystem.tileMaxHeight + ")\n";
            }
            if(_loc1_ && ui_allchar_meleeDamageToPlayerNum.value == 0 && ui_allchar_meleeDamageToNPCorItemNum.value == 0)
            {
               _loc3_ += "Melee animations are defined, but no Melee damage has been defined on the \'Character Behavior\' tab. For Melee attacks to do damage, you should set these values\n";
            }
            Alert.show(_loc3_.length == 0 ? "No errors detected" : _loc3_,"Tile Animation Checker Report");
         }
      }
      
      private function loadTileClickHandler() : void
      {
         var _loc1_:ChoosePieceForm = ChoosePieceForm(PopUpManager.createPopUp(parent,ChoosePieceForm,true));
         _loc1_.configure(mgbSession.userName,mgbSession.activeProject,Piece.MGB_TILE);
         _loc1_.addEventListener("change",processLoadTileFromSelection);
         tagCheck("choose_tile");
      }
      
      public function set ui_allchar_soundWhenShooting(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._641752135ui_allchar_soundWhenShooting;
         if(_loc2_ !== param1)
         {
            this._641752135ui_allchar_soundWhenShooting = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_allchar_soundWhenShooting",_loc2_,param1));
         }
      }
      
      public function set fi_item_healOrHarmWhenUsedNum(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1995996096fi_item_healOrHarmWhenUsedNum;
         if(_loc2_ !== param1)
         {
            this._1995996096fi_item_healOrHarmWhenUsedNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_item_healOrHarmWhenUsedNum",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_movementType() : ComboBox
      {
         return this._1886001010ui_npc_movementType;
      }
      
      private function doubleClickTile(param1:MouseEvent) : void
      {
         if(Boolean(actorPiece.tilename) && actorPiece.tilename != "")
         {
            mgbSession.navGotoTileMaker(actorPiece.tilename);
            tagCheck("edit_tile_doubleclick");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum() : NumericStepper
      {
         return this._1575810953ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_all_initialMaxHealthNum() : NumericStepper
      {
         return this._1696893023ui_all_initialMaxHealthNum;
      }
      
      public function ___ActorMakerControl_LinkButton5_click(param1:MouseEvent) : void
      {
         ui_npc_takesObjectOnChoice2.text = "";
      }
      
      public function __ui_item_pushToSlideNum_change(param1:NumericStepperEvent) : void
      {
         itemDeterminantChanged();
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice1() : TextInput
      {
         return this._820144038ui_npc_responseChoice1;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice2() : TextInput
      {
         return this._820144039ui_npc_responseChoice2;
      }
      
      [Bindable(event="propertyChange")]
      public function get ui_npc_responseChoice3() : TextInput
      {
         return this._820144040ui_npc_responseChoice3;
      }
      
      public function get defaultTilename() : String
      {
         return actorPiece.tilename;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_allchar_upYN() : FormItem
      {
         return this._452061108fi_allchar_upYN;
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_all_health() : FormItem
      {
         return this._1186570314fi_all_health;
      }
      
      public function ___ActorMakerControl_Button2_click(param1:MouseEvent) : void
      {
         chooseTile();
      }
      
      public function set ui_all_visualEffectWhenKilledType(param1:ComboBox) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2115933205ui_all_visualEffectWhenKilledType;
         if(_loc2_ !== param1)
         {
            this._2115933205ui_all_visualEffectWhenKilledType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_all_visualEffectWhenKilledType",_loc2_,param1));
         }
      }
      
      public function __ButtonHelp_click(param1:MouseEvent) : void
      {
         ChooseTutorial.createMe(parent);
      }
      
      public function set ButtonSave(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1942990865ButtonSave;
         if(_loc2_ !== param1)
         {
            this._1942990865ButtonSave = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonSave",_loc2_,param1));
         }
      }
      
      public function __ui_npc_dropsObjectOnChoice2_click(param1:MouseEvent) : void
      {
         chooseActorForDropChoiceClickHandler(ui_npc_dropsObjectOnChoice2);
      }
      
      private function _ActorMakerControl_DataGridColumn4_i() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         animationEntryPreview = _loc1_;
         _loc1_.editable = false;
         _loc1_.headerText = "Preview";
         _loc1_.dataField = "tilename";
         _loc1_.itemRenderer = _ActorMakerControl_ClassFactory2_c();
         return _loc1_;
      }
      
      public function __ui_allchar_movementSpeedNum_change(param1:NumericStepperEvent) : void
      {
         movementSpeedChanged();
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonSave() : Button
      {
         return this._1942990865ButtonSave;
      }
      
      public function set ui_item_increasesMaxHealthNum(param1:NumericStepper) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._389868554ui_item_increasesMaxHealthNum;
         if(_loc2_ !== param1)
         {
            this._389868554ui_item_increasesMaxHealthNum = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_increasesMaxHealthNum",_loc2_,param1));
         }
      }
      
      public function set ui_item_keyForThisDoor(param1:TextInput) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1488305143ui_item_keyForThisDoor;
         if(_loc2_ !== param1)
         {
            this._1488305143ui_item_keyForThisDoor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ui_item_keyForThisDoor",_loc2_,param1));
         }
      }
      
      public function set fi_all_harmEffect(param1:FormItem) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1688993791fi_all_harmEffect;
         if(_loc2_ !== param1)
         {
            this._1688993791fi_all_harmEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fi_all_harmEffect",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fi_all_harmEffect() : FormItem
      {
         return this._1688993791fi_all_harmEffect;
      }
   }
}
