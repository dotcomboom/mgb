package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.binding.XMLWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _ActorMakerControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _ActorMakerControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ActorMakerControl.watcherSetupUtil = new _ActorMakerControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("ui_all_actorType",{"propertyChange":true},[param3[0]],param2);
         param4[1] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[0]],null);
         param4[93] = new PropertyWatcher("ui_npc_responseChoice1Stay",{"propertyChange":true},[param3[44]],param2);
         param4[94] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[44]],null);
         param4[194] = new PropertyWatcher("ui_itemOrNPC_scoreOrLosePointsWhenKilledByPlayerNum",{"propertyChange":true},[param3[94]],param2);
         param4[195] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[94]],null);
         param4[2] = new PropertyWatcher("ui_all_description",{"propertyChange":true},[param3[1]],param2);
         param4[3] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[1]],null);
         param4[54] = new PropertyWatcher("ui_allchar_touchDamageToNPCorItemNum",{"propertyChange":true},[param3[25]],param2);
         param4[55] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[25]],null);
         param4[101] = new PropertyWatcher("ui_npc_takesObjectCountOnChoice2Num",{"propertyChange":true},[param3[48]],param2);
         param4[102] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[48]],null);
         param4[198] = new PropertyWatcher("ui_itemOrNPC_dropsObjectWhenKilledChance",{"propertyChange":true},[param3[96]],param2);
         param4[199] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[96]],null);
         param4[56] = new PropertyWatcher("ui_allchar_touchDamageAttackChance",{"propertyChange":true},[param3[26]],param2);
         param4[57] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[26]],null);
         param4[50] = new PropertyWatcher("ui_allchar_shotDamageToNPCorItemNum",{"propertyChange":true},[param3[23]],param2);
         param4[51] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[23]],null);
         param4[52] = new PropertyWatcher("ui_allchar_touchDamageToPlayerNum",{"propertyChange":true},[param3[24]],param2);
         param4[53] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[24]],null);
         param4[139] = new PropertyWatcher("ui_item_squishPlayerYN",{"propertyChange":true},[param3[67]],param2);
         param4[140] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[67]],null);
         param4[157] = new PropertyWatcher("ui_item_useText",{"propertyChange":true},[param3[76]],param2);
         param4[158] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[76]],null);
         param4[218] = new PropertyWatcher("myWD",{"propertyChange":true},[param3[138],param3[278],param3[385],param3[108],param3[406],param3[182],param3[135]],param2);
         param4[163] = new PropertyWatcher("ui_item_keyForThisDoor",{"propertyChange":true},[param3[79],param3[363]],param2);
         param4[164] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[79],param3[363]],null);
         param4[151] = new PropertyWatcher("ui_item_winLevelYN",{"propertyChange":true},[param3[73]],param2);
         param4[152] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[73]],null);
         param4[377] = new PropertyWatcher("okForBackground",{"propertyChange":true},[param3[422]],param2);
         param4[379] = new PropertyWatcher("okForForeground",{"propertyChange":true},[param3[424]],param2);
         param4[129] = new PropertyWatcher("ui_item_itemActivationType",{"propertyChange":true},[param3[340],param3[339],param3[283],param3[284],param3[326],param3[327],param3[322],param3[323],param3[334],param3[335],param3[330],param3[331],param3[305],param3[304],param3[309],param3[310],param3[315],param3[314],param3[319],param3[318],param3[288],param3[289],param3[292],param3[293],param3[296],param3[297],param3[299],param3[300],param3[62]],param2);
         param4[130] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[340],param3[339],param3[283],param3[284],param3[326],param3[327],param3[322],param3[323],param3[334],param3[335],param3[330],param3[331],param3[305],param3[304],param3[309],param3[310],param3[315],param3[314],param3[319],param3[318],param3[288],param3[289],param3[292],param3[293],param3[296],param3[297],param3[299],param3[300],param3[62]],null);
         param4[6] = new PropertyWatcher("ui_all_initialMaxHealthNum",{"propertyChange":true},[param3[3]],param2);
         param4[7] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[3]],null);
         param4[186] = new PropertyWatcher("ui_item_equippedNewMeleeSound",{"propertyChange":true},[param3[90]],param2);
         param4[187] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[90]],null);
         param4[115] = new PropertyWatcher("ui_npc_takesObjectOnChoice3",{"propertyChange":true},[param3[272],param3[55],param3[266],param3[265],param3[270],param3[269]],param2);
         param4[116] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[272],param3[55],param3[266],param3[265],param3[270],param3[269]],null);
         param4[99] = new PropertyWatcher("ui_npc_takesObjectOnChoice2",{"propertyChange":true},[param3[239],param3[246],param3[244],param3[243],param3[47],param3[240]],param2);
         param4[100] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[239],param3[246],param3[244],param3[243],param3[47],param3[240]],null);
         param4[37] = new PropertyWatcher("ui_allchar_shotRangeNum",{"propertyChange":true},[param3[17]],param2);
         param4[38] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[17]],null);
         param4[83] = new PropertyWatcher("ui_npc_takesObjectOnChoice1",{"propertyChange":true},[param3[220],param3[217],param3[39],param3[218],param3[213],param3[214]],param2);
         param4[84] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[220],param3[217],param3[39],param3[218],param3[213],param3[214]],null);
         param4[85] = new PropertyWatcher("ui_npc_takesObjectCountOnChoice1Num",{"propertyChange":true},[param3[40]],param2);
         param4[86] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[40]],null);
         param4[58] = new PropertyWatcher("ui_allchar_touchDamageCases",{"propertyChange":true},[param3[27]],param2);
         param4[59] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[27]],null);
         param4[8] = new PropertyWatcher("ui_all_gravityYN",{"propertyChange":true},[param3[4]],param2);
         param4[9] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[4]],null);
         param4[217] = new PropertyWatcher("mainViewStackEnabled",{"propertyChange":true},[param3[417],param3[416],param3[418],param3[421],param3[106],param3[107]],param2);
         param4[131] = new PropertyWatcher("ui_item_inventoryEquippableYN",{"propertyChange":true},[param3[340],param3[339],param3[326],param3[327],param3[322],param3[323],param3[334],param3[335],param3[330],param3[331],param3[305],param3[304],param3[309],param3[310],param3[315],param3[314],param3[319],param3[318],param3[288],param3[289],param3[292],param3[293],param3[296],param3[297],param3[299],param3[300],param3[63]],param2);
         param4[132] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[340],param3[339],param3[326],param3[327],param3[322],param3[323],param3[334],param3[335],param3[330],param3[331],param3[305],param3[304],param3[309],param3[310],param3[315],param3[314],param3[319],param3[318],param3[288],param3[289],param3[292],param3[293],param3[296],param3[297],param3[299],param3[300],param3[63]],null);
         param4[143] = new PropertyWatcher("ui_item_healOrHarmWhenUsedNum",{"propertyChange":true},[param3[69]],param2);
         param4[144] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[69]],null);
         param4[179] = new PropertyWatcher("ui_item_equippedNewShotRangeBonusNum",{"propertyChange":true},[param3[87]],param2);
         param4[180] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[87]],null);
         param4[60] = new PropertyWatcher("ui_allchar_meleeDamageToPlayerNum",{"propertyChange":true},[param3[28]],param2);
         param4[61] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[28]],null);
         param4[67] = new PropertyWatcher("ui_allchar_meleeRepeatDelay",{"propertyChange":true},[param3[31]],param2);
         param4[68] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[31]],null);
         param4[125] = new PropertyWatcher("ui_npc_responseChoice3Stay",{"propertyChange":true},[param3[60]],param2);
         param4[126] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[60]],null);
         param4[75] = new PropertyWatcher("ui_npc_shotAccuracyType",{"propertyChange":true},[param3[35]],param2);
         param4[76] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[35]],null);
         param4[149] = new PropertyWatcher("ui_item_gainOrLosePointsNum",{"propertyChange":true},[param3[72]],param2);
         param4[150] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[72]],null);
         param4[175] = new PropertyWatcher("ui_item_equippedNewShotDamageBonusNum",{"propertyChange":true},[param3[85]],param2);
         param4[176] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[85]],null);
         param4[21] = new PropertyWatcher("ui_all_visualEffectWhenHealedType",{"propertyChange":true},[param3[9]],param2);
         param4[22] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[9]],null);
         param4[11] = new PropertyWatcher("ui_all_soundWhenHarmed",{"propertyChange":true},[param3[5]],param2);
         param4[12] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[5]],null);
         param4[107] = new PropertyWatcher("ui_npc_responseChoice2DropPersistsYN",{"propertyChange":true},[param3[51]],param2);
         param4[108] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[51]],null);
         param4[202] = new PropertyWatcher("ui_itemOrNPC_dropsObjectWhenKilledChance2",{"propertyChange":true},[param3[98]],param2);
         param4[203] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[98]],null);
         param4[29] = new PropertyWatcher("ui_allchar_downYN",{"propertyChange":true},[param3[13]],param2);
         param4[30] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[13]],null);
         param4[91] = new PropertyWatcher("ui_npc_responseChoice1DropPersistsYN",{"propertyChange":true},[param3[43]],param2);
         param4[92] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[43]],null);
         param4[192] = new PropertyWatcher("ui_itemOrNPC_scoreOrLosePointsWhenShotByPlayerNum",{"propertyChange":true},[param3[93]],param2);
         param4[193] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[93]],null);
         param4[65] = new PropertyWatcher("ui_allchar_soundWhenMelee",{"propertyChange":true},[param3[30]],param2);
         param4[66] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[30]],null);
         param4[135] = new PropertyWatcher("ui_item_visualEffectWhenUsedType",{"propertyChange":true},[param3[65]],param2);
         param4[136] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[65]],null);
         param4[200] = new PropertyWatcher("ui_itemOrNPC_dropsObjectWhenKilledName2",{"propertyChange":true},[param3[397],param3[396],param3[97]],param2);
         param4[201] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[397],param3[396],param3[97]],null);
         param4[71] = new PropertyWatcher("ui_npc_aggroRange",{"propertyChange":true},[param3[33]],param2);
         param4[72] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[33]],null);
         param4[48] = new PropertyWatcher("ui_allchar_shotDamageToPlayerNum",{"propertyChange":true},[param3[22]],param2);
         param4[49] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[22]],null);
         param4[62] = new PropertyWatcher("ui_allchar_meleeDamageToNPCorItemNum",{"propertyChange":true},[param3[29]],param2);
         param4[63] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[29]],null);
         param4[145] = new PropertyWatcher("ui_item_increasesMaxHealthNum",{"propertyChange":true},[param3[70]],param2);
         param4[146] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[70]],null);
         param4[216] = new PropertyWatcher("mainViewStack",{"propertyChange":true},[param3[105]],param2);
         param4[181] = new PropertyWatcher("ui_item_equippedArmorEffect",{"propertyChange":true},[param3[88]],param2);
         param4[182] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[88]],null);
         param4[35] = new PropertyWatcher("ui_allchar_shotRateNum",{"propertyChange":true},[param3[16]],param2);
         param4[36] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[16]],null);
         param4[19] = new PropertyWatcher("ui_all_visualEffectWhenHarmedType",{"propertyChange":true},[param3[8]],param2);
         param4[20] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[8]],null);
         param4[204] = new PropertyWatcher("ui_itemOrNPC_dropsObjectRandomlyName",{"propertyChange":true},[param3[99],param3[402],param3[403],param3[404]],param2);
         param4[205] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[99],param3[402],param3[403],param3[404]],null);
         param4[183] = new PropertyWatcher("ui_item_equippedNewMeleeDamageBonusNum",{"propertyChange":true},[param3[89]],param2);
         param4[184] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[89]],null);
         param4[17] = new PropertyWatcher("ui_all_soundWhenKilled",{"propertyChange":true},[param3[7]],param2);
         param4[18] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[7]],null);
         param4[378] = new PropertyWatcher("okForActive",{"propertyChange":true},[param3[423]],param2);
         param4[147] = new PropertyWatcher("ui_item_gainExtraLifeYN",{"propertyChange":true},[param3[71]],param2);
         param4[148] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[71]],null);
         param4[167] = new PropertyWatcher("ui_item_autoEquipYN",{"propertyChange":true},[param3[81]],param2);
         param4[168] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[81]],null);
         param4[171] = new PropertyWatcher("ui_item_equippedNewShotActor",{"propertyChange":true},[param3[307],param3[83]],param2);
         param4[172] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[307],param3[83]],null);
         param4[210] = new PropertyWatcher("ui_itemOrNPC_appearIf",{"propertyChange":true},[param3[410],param3[102],param3[414],param3[415],param3[412]],param2);
         param4[211] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[410],param3[102],param3[414],param3[415],param3[412]],null);
         param4[33] = new PropertyWatcher("ui_allchar_rightYN",{"propertyChange":true},[param3[15]],param2);
         param4[34] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[15]],null);
         param4[69] = new PropertyWatcher("ui_npc_movementType",{"propertyChange":true},[param3[186],param3[187],param3[32]],param2);
         param4[70] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[186],param3[187],param3[32]],null);
         param4[46] = new PropertyWatcher("ui_allchar_jumpYN",{"propertyChange":true},[param3[21]],param2);
         param4[47] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[21]],null);
         param4[14] = new PropertyWatcher("ui_all_soundWhenHealed",{"propertyChange":true},[param3[6]],param2);
         param4[15] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[6]],null);
         param4[44] = new PropertyWatcher("ui_allchar_pushYN",{"propertyChange":true},[param3[20]],param2);
         param4[45] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[20]],null);
         param4[177] = new PropertyWatcher("ui_item_equippedNewShotRateBonusNum",{"propertyChange":true},[param3[86]],param2);
         param4[178] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[86]],null);
         param4[109] = new PropertyWatcher("ui_npc_responseChoice2Stay",{"propertyChange":true},[param3[52]],param2);
         param4[110] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[52]],null);
         param4[169] = new PropertyWatcher("ui_item_equippedNewActorGraphics",{"propertyChange":true},[param3[295],param3[82],param3[296],param3[297],param3[299],param3[300]],param2);
         param4[170] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[295],param3[82],param3[296],param3[297],param3[299],param3[300]],null);
         param4[73] = new PropertyWatcher("ui_npc_canOccupyPlayerSpaceYN",{"propertyChange":true},[param3[34]],param2);
         param4[74] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[34]],null);
         param4[137] = new PropertyWatcher("ui_item_pushToSlideNum",{"propertyChange":true},[param3[66],param3[367],param3[361]],param2);
         param4[138] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[66],param3[367],param3[361]],null);
         param4[27] = new PropertyWatcher("ui_allchar_upYN",{"propertyChange":true},[param3[12]],param2);
         param4[28] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[12]],null);
         param4[153] = new PropertyWatcher("ui_item_gainPowerType",{"propertyChange":true},[param3[74]],param2);
         param4[154] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[74]],null);
         param4[208] = new PropertyWatcher("ui_itemOrNPC_respawnOption",{"propertyChange":true},[param3[101]],param2);
         param4[209] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[101]],null);
         param4[188] = new PropertyWatcher("ui_item_equippedNewMeleeRepeatDelayModifierNum",{"propertyChange":true},[param3[91]],param2);
         param4[189] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[91]],null);
         param4[123] = new PropertyWatcher("ui_npc_responseChoice3DropPersistsYN",{"propertyChange":true},[param3[59]],param2);
         param4[124] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[59]],null);
         param4[221] = new PropertyWatcher("actorPiece",{"propertyChange":true},[param3[274],param3[277],param3[281],param3[286],param3[256],param3[260],param3[264],param3[271],param3[268],param3[306],param3[312],param3[316],param3[290],param3[294],param3[302],param3[341],param3[337],param3[350],param3[346],param3[344],param3[324],param3[320],param3[332],param3[328],param3[374],param3[369],param3[371],param3[111],param3[382],param3[376],param3[379],param3[119],param3[357],param3[117],param3[352],param3[114],param3[113],param3[354],param3[112],param3[127],param3[366],param3[124],param3[360],param3[122],param3[362],param3[137],param3[411],param3[409],param3[140],param3[413],param3[142],param3[129],param3[400],param3[401],param3[132],param3[405],param3[395],param3[394],param3[153],param3[154],param3[398],param3[159],param3[144],param3[146],param3[384],param3[148],param3[391],param3[390],param3[150],param3[389],param3[388],param3[171],param3[168],param3[174],param3[173],param3[172],param3[162],param3[165],param3[185],param3[190],param3[188],param3[178],param3[176],param3[177],param3[180],param3[181],param3[204],param3[201],param3[199],param3[192],param3[195],param3[222],param3[216],param3[219],param3[212],param3[208],param3[238],param3[234],param3[230],param3[227],param3[225],param3[253],param3[251],param3[248],param3[245],param3[242]],param2);
         param4[222] = new PropertyWatcher("actorXML",{"propertyChange":true},[param3[274],param3[277],param3[281],param3[286],param3[256],param3[260],param3[264],param3[271],param3[268],param3[306],param3[312],param3[316],param3[290],param3[294],param3[302],param3[341],param3[337],param3[350],param3[346],param3[344],param3[324],param3[320],param3[332],param3[328],param3[374],param3[369],param3[371],param3[111],param3[382],param3[376],param3[379],param3[119],param3[357],param3[117],param3[352],param3[114],param3[113],param3[354],param3[112],param3[127],param3[366],param3[124],param3[360],param3[122],param3[362],param3[411],param3[409],param3[140],param3[413],param3[142],param3[129],param3[400],param3[401],param3[132],param3[405],param3[395],param3[153],param3[394],param3[154],param3[398],param3[159],param3[144],param3[146],param3[384],param3[148],param3[391],param3[390],param3[150],param3[389],param3[388],param3[171],param3[168],param3[174],param3[173],param3[172],param3[162],param3[165],param3[185],param3[190],param3[188],param3[178],param3[176],param3[177],param3[180],param3[181],param3[204],param3[201],param3[199],param3[192],param3[195],param3[222],param3[216],param3[219],param3[212],param3[208],param3[238],param3[234],param3[230],param3[227],param3[225],param3[253],param3[251],param3[248],param3[245],param3[242]],null);
         param4[223] = new XMLWatcher("databag",[param3[274],param3[277],param3[281],param3[286],param3[256],param3[260],param3[264],param3[271],param3[268],param3[306],param3[312],param3[316],param3[290],param3[294],param3[302],param3[341],param3[337],param3[350],param3[346],param3[344],param3[324],param3[320],param3[332],param3[328],param3[374],param3[369],param3[371],param3[111],param3[382],param3[376],param3[379],param3[119],param3[357],param3[117],param3[352],param3[114],param3[113],param3[354],param3[112],param3[127],param3[366],param3[124],param3[360],param3[122],param3[362],param3[411],param3[409],param3[140],param3[413],param3[142],param3[129],param3[400],param3[401],param3[132],param3[405],param3[395],param3[153],param3[394],param3[154],param3[398],param3[159],param3[144],param3[146],param3[384],param3[148],param3[391],param3[390],param3[150],param3[389],param3[388],param3[171],param3[168],param3[174],param3[173],param3[172],param3[162],param3[165],param3[185],param3[190],param3[188],param3[178],param3[176],param3[177],param3[180],param3[181],param3[204],param3[201],param3[199],param3[192],param3[195],param3[222],param3[216],param3[219],param3[212],param3[208],param3[238],param3[234],param3[230],param3[227],param3[225],param3[253],param3[251],param3[248],param3[245],param3[242]]);
         param4[245] = new PropertyWatcher("animationTable",{"propertyChange":true},[param3[137]],null);
         param4[119] = new PropertyWatcher("ui_npc_takeObjectTypeOnChoice3",{"propertyChange":true},[param3[263],param3[57]],param2);
         param4[120] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[263],param3[57]],null);
         param4[212] = new PropertyWatcher("ui_itemOrNPC_appearCount",{"propertyChange":true},[param3[103]],param2);
         param4[213] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[103]],null);
         param4[87] = new PropertyWatcher("ui_npc_takeObjectTypeOnChoice1",{"propertyChange":true},[param3[41],param3[211]],param2);
         param4[88] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[41],param3[211]],null);
         param4[42] = new PropertyWatcher("ui_allchar_shotActor",{"propertyChange":true},[param3[170],param3[169],param3[19],param3[155],param3[156],param3[157],param3[163],param3[161],param3[160],param3[167],param3[166],param3[164]],param2);
         param4[43] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[170],param3[169],param3[19],param3[155],param3[156],param3[157],param3[163],param3[161],param3[160],param3[167],param3[166],param3[164]],null);
         param4[103] = new PropertyWatcher("ui_npc_takeObjectTypeOnChoice2",{"propertyChange":true},[param3[237],param3[49]],param2);
         param4[104] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[237],param3[49]],null);
         param4[141] = new PropertyWatcher("ui_item_squishNPCYN",{"propertyChange":true},[param3[68]],param2);
         param4[142] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[68]],null);
         param4[173] = new PropertyWatcher("ui_item_equippedNewShotSound",{"propertyChange":true},[param3[84]],param2);
         param4[174] = new PropertyWatcher("text",{
            "valueCommit":true,
            "collectionChange":true,
            "change":false
         },[param3[84]],null);
         param4[23] = new PropertyWatcher("ui_all_visualEffectWhenKilledType",{"propertyChange":true},[param3[10]],param2);
         param4[24] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[10]],null);
         param4[117] = new PropertyWatcher("ui_npc_takesObjectCountOnChoice3Num",{"propertyChange":true},[param3[56]],param2);
         param4[118] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[56]],null);
         param4[206] = new PropertyWatcher("ui_itemOrNPC_dropsObjectRandomlyChance",{"propertyChange":true},[param3[100]],param2);
         param4[207] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[100]],null);
         param4[25] = new PropertyWatcher("ui_allchar_movementSpeedNum",{"propertyChange":true},[param3[11]],param2);
         param4[26] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[11]],null);
         param4[155] = new PropertyWatcher("ui_item_gainPowerSecondsNum",{"propertyChange":true},[param3[75]],param2);
         param4[156] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[75]],null);
         param4[133] = new PropertyWatcher("ui_item_inventoryEquipSlot",{"propertyChange":true},[param3[64]],param2);
         param4[134] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[64]],null);
         param4[4] = new PropertyWatcher("ui_all_initialHealthNum",{"propertyChange":true},[param3[2]],param2);
         param4[5] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[2]],null);
         param4[89] = new PropertyWatcher("ui_npc_dropsObjectOnChoice1",{"propertyChange":true},[param3[205],param3[206],param3[42],param3[209]],param2);
         param4[90] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[205],param3[206],param3[42],param3[209]],null);
         param4[214] = new PropertyWatcher("ui_allchar_conditionsActor",{"propertyChange":true},[param3[104]],param2);
         param4[215] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[104]],null);
         param4[323] = new PropertyWatcher("myWR",{"propertyChange":true},[param3[342],param3[338],param3[351],param3[282],param3[348],param3[287],param3[345],param3[325],param3[321],param3[333],param3[329],param3[372],param3[375],param3[308],param3[368],param3[370],param3[313],param3[380],param3[383],param3[377],param3[317],param3[358],param3[291],param3[353],param3[355],param3[364],param3[298],param3[303]],param2);
         param4[165] = new PropertyWatcher("ui_item_keyForThisDoorConsumedYN",{"propertyChange":true},[param3[80]],param2);
         param4[166] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[80]],null);
         param4[219] = new PropertyWatcher("myWU",{"propertyChange":true},[param3[136],param3[139],param3[279],param3[386],param3[109],param3[407],param3[183]],param2);
         param4[121] = new PropertyWatcher("ui_npc_dropsObjectOnChoice3",{"propertyChange":true},[param3[258],param3[257],param3[261],param3[58]],param2);
         param4[122] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[258],param3[257],param3[261],param3[58]],null);
         param4[79] = new PropertyWatcher("ui_npc_TalkTextFontIndex",{"propertyChange":true},[param3[275],param3[254],param3[223],param3[249],param3[202],param3[37],param3[196],param3[228]],param2);
         param4[80] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[275],param3[254],param3[223],param3[249],param3[202],param3[37],param3[196],param3[228]],null);
         param4[105] = new PropertyWatcher("ui_npc_dropsObjectOnChoice2",{"propertyChange":true},[param3[50],param3[235],param3[232],param3[231]],param2);
         param4[106] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[50],param3[235],param3[232],param3[231]],null);
         param4[127] = new PropertyWatcher("ui_npc_saysWhatOnChoice3",{"propertyChange":true},[param3[61]],param2);
         param4[128] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[61]],null);
         param4[40] = new PropertyWatcher("ui_allchar_soundWhenShooting",{"propertyChange":true},[param3[18]],param2);
         param4[41] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[18]],null);
         param4[111] = new PropertyWatcher("ui_npc_saysWhatOnChoice2",{"propertyChange":true},[param3[53]],param2);
         param4[112] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[53]],null);
         param4[95] = new PropertyWatcher("ui_npc_saysWhatOnChoice1",{"propertyChange":true},[param3[45]],param2);
         param4[96] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[45]],null);
         param4[159] = new PropertyWatcher("ui_item_itemPushesActorType",{"propertyChange":true},[param3[77]],param2);
         param4[160] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[77]],null);
         param4[161] = new PropertyWatcher("ui_item_itemPushesActorDistance",{"propertyChange":true},[param3[78]],param2);
         param4[162] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[78]],null);
         param4[97] = new PropertyWatcher("ui_npc_responseChoice2",{"propertyChange":true},[param3[236],param3[247],param3[229],param3[46]],param2);
         param4[98] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[236],param3[247],param3[229],param3[46]],null);
         param4[81] = new PropertyWatcher("ui_npc_responseChoice1",{"propertyChange":true},[param3[221],param3[38],param3[203],param3[210]],param2);
         param4[82] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[221],param3[38],param3[203],param3[210]],null);
         param4[196] = new PropertyWatcher("ui_itemOrNPC_dropsObjectWhenKilledName",{"propertyChange":true},[param3[393],param3[392],param3[95]],param2);
         param4[197] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[393],param3[392],param3[95]],null);
         param4[190] = new PropertyWatcher("ui_itemOrNPC_destroyableYN",{"propertyChange":true},[param3[92],param3[193],param3[194]],param2);
         param4[191] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[92],param3[193],param3[194]],null);
         param4[31] = new PropertyWatcher("ui_allchar_leftYN",{"propertyChange":true},[param3[14]],param2);
         param4[32] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[14]],null);
         param4[113] = new PropertyWatcher("ui_npc_responseChoice3",{"propertyChange":true},[param3[255],param3[273],param3[262],param3[54]],param2);
         param4[114] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[255],param3[273],param3[262],param3[54]],null);
         param4[77] = new PropertyWatcher("ui_npc_TalkText",{"propertyChange":true},[param3[221],param3[273],param3[252],param3[200],param3[36],param3[197],param3[247],param3[226]],param2);
         param4[78] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[221],param3[273],param3[252],param3[200],param3[36],param3[197],param3[247],param3[226]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[93].updateParent(param1);
         param4[93].addChild(param4[94]);
         param4[194].updateParent(param1);
         param4[194].addChild(param4[195]);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[3]);
         param4[54].updateParent(param1);
         param4[54].addChild(param4[55]);
         param4[101].updateParent(param1);
         param4[101].addChild(param4[102]);
         param4[198].updateParent(param1);
         param4[198].addChild(param4[199]);
         param4[56].updateParent(param1);
         param4[56].addChild(param4[57]);
         param4[50].updateParent(param1);
         param4[50].addChild(param4[51]);
         param4[52].updateParent(param1);
         param4[52].addChild(param4[53]);
         param4[139].updateParent(param1);
         param4[139].addChild(param4[140]);
         param4[157].updateParent(param1);
         param4[157].addChild(param4[158]);
         param4[218].updateParent(param1);
         param4[163].updateParent(param1);
         param4[163].addChild(param4[164]);
         param4[151].updateParent(param1);
         param4[151].addChild(param4[152]);
         param4[377].updateParent(param1);
         param4[379].updateParent(param1);
         param4[129].updateParent(param1);
         param4[129].addChild(param4[130]);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[7]);
         param4[186].updateParent(param1);
         param4[186].addChild(param4[187]);
         param4[115].updateParent(param1);
         param4[115].addChild(param4[116]);
         param4[99].updateParent(param1);
         param4[99].addChild(param4[100]);
         param4[37].updateParent(param1);
         param4[37].addChild(param4[38]);
         param4[83].updateParent(param1);
         param4[83].addChild(param4[84]);
         param4[85].updateParent(param1);
         param4[85].addChild(param4[86]);
         param4[58].updateParent(param1);
         param4[58].addChild(param4[59]);
         param4[8].updateParent(param1);
         param4[8].addChild(param4[9]);
         param4[217].updateParent(param1);
         param4[131].updateParent(param1);
         param4[131].addChild(param4[132]);
         param4[143].updateParent(param1);
         param4[143].addChild(param4[144]);
         param4[179].updateParent(param1);
         param4[179].addChild(param4[180]);
         param4[60].updateParent(param1);
         param4[60].addChild(param4[61]);
         param4[67].updateParent(param1);
         param4[67].addChild(param4[68]);
         param4[125].updateParent(param1);
         param4[125].addChild(param4[126]);
         param4[75].updateParent(param1);
         param4[75].addChild(param4[76]);
         param4[149].updateParent(param1);
         param4[149].addChild(param4[150]);
         param4[175].updateParent(param1);
         param4[175].addChild(param4[176]);
         param4[21].updateParent(param1);
         param4[21].addChild(param4[22]);
         param4[11].updateParent(param1);
         param4[11].addChild(param4[12]);
         param4[107].updateParent(param1);
         param4[107].addChild(param4[108]);
         param4[202].updateParent(param1);
         param4[202].addChild(param4[203]);
         param4[29].updateParent(param1);
         param4[29].addChild(param4[30]);
         param4[91].updateParent(param1);
         param4[91].addChild(param4[92]);
         param4[192].updateParent(param1);
         param4[192].addChild(param4[193]);
         param4[65].updateParent(param1);
         param4[65].addChild(param4[66]);
         param4[135].updateParent(param1);
         param4[135].addChild(param4[136]);
         param4[200].updateParent(param1);
         param4[200].addChild(param4[201]);
         param4[71].updateParent(param1);
         param4[71].addChild(param4[72]);
         param4[48].updateParent(param1);
         param4[48].addChild(param4[49]);
         param4[62].updateParent(param1);
         param4[62].addChild(param4[63]);
         param4[145].updateParent(param1);
         param4[145].addChild(param4[146]);
         param4[216].updateParent(param1);
         param4[181].updateParent(param1);
         param4[181].addChild(param4[182]);
         param4[35].updateParent(param1);
         param4[35].addChild(param4[36]);
         param4[19].updateParent(param1);
         param4[19].addChild(param4[20]);
         param4[204].updateParent(param1);
         param4[204].addChild(param4[205]);
         param4[183].updateParent(param1);
         param4[183].addChild(param4[184]);
         param4[17].updateParent(param1);
         param4[17].addChild(param4[18]);
         param4[378].updateParent(param1);
         param4[147].updateParent(param1);
         param4[147].addChild(param4[148]);
         param4[167].updateParent(param1);
         param4[167].addChild(param4[168]);
         param4[171].updateParent(param1);
         param4[171].addChild(param4[172]);
         param4[210].updateParent(param1);
         param4[210].addChild(param4[211]);
         param4[33].updateParent(param1);
         param4[33].addChild(param4[34]);
         param4[69].updateParent(param1);
         param4[69].addChild(param4[70]);
         param4[46].updateParent(param1);
         param4[46].addChild(param4[47]);
         param4[14].updateParent(param1);
         param4[14].addChild(param4[15]);
         param4[44].updateParent(param1);
         param4[44].addChild(param4[45]);
         param4[177].updateParent(param1);
         param4[177].addChild(param4[178]);
         param4[109].updateParent(param1);
         param4[109].addChild(param4[110]);
         param4[169].updateParent(param1);
         param4[169].addChild(param4[170]);
         param4[73].updateParent(param1);
         param4[73].addChild(param4[74]);
         param4[137].updateParent(param1);
         param4[137].addChild(param4[138]);
         param4[27].updateParent(param1);
         param4[27].addChild(param4[28]);
         param4[153].updateParent(param1);
         param4[153].addChild(param4[154]);
         param4[208].updateParent(param1);
         param4[208].addChild(param4[209]);
         param4[188].updateParent(param1);
         param4[188].addChild(param4[189]);
         param4[123].updateParent(param1);
         param4[123].addChild(param4[124]);
         param4[221].updateParent(param1);
         param4[221].addChild(param4[222]);
         param4[222].addChild(param4[223]);
         param4[221].addChild(param4[245]);
         param4[119].updateParent(param1);
         param4[119].addChild(param4[120]);
         param4[212].updateParent(param1);
         param4[212].addChild(param4[213]);
         param4[87].updateParent(param1);
         param4[87].addChild(param4[88]);
         param4[42].updateParent(param1);
         param4[42].addChild(param4[43]);
         param4[103].updateParent(param1);
         param4[103].addChild(param4[104]);
         param4[141].updateParent(param1);
         param4[141].addChild(param4[142]);
         param4[173].updateParent(param1);
         param4[173].addChild(param4[174]);
         param4[23].updateParent(param1);
         param4[23].addChild(param4[24]);
         param4[117].updateParent(param1);
         param4[117].addChild(param4[118]);
         param4[206].updateParent(param1);
         param4[206].addChild(param4[207]);
         param4[25].updateParent(param1);
         param4[25].addChild(param4[26]);
         param4[155].updateParent(param1);
         param4[155].addChild(param4[156]);
         param4[133].updateParent(param1);
         param4[133].addChild(param4[134]);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[5]);
         param4[89].updateParent(param1);
         param4[89].addChild(param4[90]);
         param4[214].updateParent(param1);
         param4[214].addChild(param4[215]);
         param4[323].updateParent(param1);
         param4[165].updateParent(param1);
         param4[165].addChild(param4[166]);
         param4[219].updateParent(param1);
         param4[121].updateParent(param1);
         param4[121].addChild(param4[122]);
         param4[79].updateParent(param1);
         param4[79].addChild(param4[80]);
         param4[105].updateParent(param1);
         param4[105].addChild(param4[106]);
         param4[127].updateParent(param1);
         param4[127].addChild(param4[128]);
         param4[40].updateParent(param1);
         param4[40].addChild(param4[41]);
         param4[111].updateParent(param1);
         param4[111].addChild(param4[112]);
         param4[95].updateParent(param1);
         param4[95].addChild(param4[96]);
         param4[159].updateParent(param1);
         param4[159].addChild(param4[160]);
         param4[161].updateParent(param1);
         param4[161].addChild(param4[162]);
         param4[97].updateParent(param1);
         param4[97].addChild(param4[98]);
         param4[81].updateParent(param1);
         param4[81].addChild(param4[82]);
         param4[196].updateParent(param1);
         param4[196].addChild(param4[197]);
         param4[190].updateParent(param1);
         param4[190].addChild(param4[191]);
         param4[31].updateParent(param1);
         param4[31].addChild(param4[32]);
         param4[113].updateParent(param1);
         param4[113].addChild(param4[114]);
         param4[77].updateParent(param1);
         param4[77].addChild(param4[78]);
      }
   }
}
