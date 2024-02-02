package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _AccountManagementWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _AccountManagementWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AccountManagement.watcherSetupUtil = new _AccountManagementWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[61] = new PropertyWatcher("createUserBirthDate",{"propertyChange":true},[param3[89]],param2);
         param4[62] = new PropertyWatcher("selectedDate",{
            "selectedDateChanged":true,
            "valueCommit":true,
            "change":true
         },[param3[89]],null);
         param4[52] = new PropertyWatcher("chosenSecurityAnswer",{"propertyChange":true},[param3[70],param3[91]],param2);
         param4[65] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[91]],null);
         param4[24] = new PropertyWatcher("loginPanel",{"propertyChange":true},[param3[29]],param2);
         param4[57] = new PropertyWatcher("changePasswordOldPassword",{"propertyChange":true},[param3[101],param3[78]],param2);
         param4[74] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[101]],null);
         param4[40] = new PropertyWatcher("userNamesListAC",{"propertyChange":true},[param3[55],param3[56]],param2);
         param4[41] = new PropertyWatcher("length",{"collectionChange":true},[param3[55]],null);
         param4[51] = new PropertyWatcher("createMe",{"propertyChange":true},[param3[69],param3[71],param3[65],param3[67],param3[73]],param2);
         param4[42] = new PropertyWatcher("userBrowseList",{"propertyChange":true},[param3[59],param3[58],param3[57],param3[63],param3[61],param3[60]],param2);
         param4[43] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "change":true
         },[param3[57],param3[61]],null);
         param4[44] = new PropertyWatcher("selectedItem",{
            "valueCommit":true,
            "change":true
         },[param3[59],param3[58],param3[63],param3[60]],null);
         param4[47] = new PropertyWatcher("badges",null,[param3[59]],null);
         param4[45] = new PropertyWatcher("login",null,[param3[58],param3[63],param3[60]],null);
         param4[17] = new PropertyWatcher("login",{"propertyChange":true},[param3[25]],param2);
         param4[28] = new PropertyWatcher("ageDescription",{"propertyChange":true},[param3[43]],param2);
         param4[26] = new PropertyWatcher("recoverAccountViewStack",{"propertyChange":true},[param3[34],param3[35],param3[38],param3[36],param3[37]],param2);
         param4[27] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "creationComplete":true,
            "change":true
         },[param3[34],param3[35],param3[38],param3[36],param3[37]],null);
         param4[56] = new PropertyWatcher("chosenChangedPassword2",{"propertyChange":true},[param3[76]],param2);
         param4[0] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[0],param3[1],param3[4],param3[8],param3[9],param3[10],param3[12],param3[13],param3[14],param3[17],param3[84],param3[16],param3[18],param3[21],param3[20],param3[23],param3[22],param3[24]],param2);
         param4[16] = new PropertyWatcher("authenticatedName",{"propertyChange":true},[param3[21],param3[20],param3[23],param3[22],param3[24]],null);
         param4[1] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[0],param3[1],param3[8],param3[9],param3[10],param3[12],param3[14]],null);
         param4[6] = new PropertyWatcher("loginSummary",{"propertyChange":true},[param3[4]],null);
         param4[13] = new PropertyWatcher("userName",{"propertyChange":true},[param3[17],param3[84],param3[16],param3[18]],null);
         param4[10] = new PropertyWatcher("usageFriendlyString",{"propertyChange":true},[param3[13]],null);
         param4[29] = new PropertyWatcher("createAccountViewStack",{"propertyChange":true},[param3[50],param3[49],param3[54],param3[53],param3[52]],param2);
         param4[30] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "creationComplete":true,
            "change":true
         },[param3[50],param3[49],param3[54],param3[53],param3[52]],null);
         param4[5] = new PropertyWatcher("panelResizeEffect",{"propertyChange":true},[param3[3]],param2);
         param4[72] = new PropertyWatcher("recoverPasswordAnswer",{"propertyChange":true},[param3[98]],param2);
         param4[31] = new PropertyWatcher("chosenLogin",{"propertyChange":true},[param3[51],param3[86],param3[64]],param2);
         param4[32] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[51],param3[86]],null);
         param4[55] = new PropertyWatcher("changePasswordButton",{"propertyChange":true},[param3[77],param3[79],param3[75]],param2);
         param4[69] = new PropertyWatcher("recoverUserBirthDate",{"propertyChange":true},[param3[97],param3[94]],param2);
         param4[70] = new PropertyWatcher("selectedDate",{
            "selectedDateChanged":true,
            "valueCommit":true,
            "change":true
         },[param3[97],param3[94]],null);
         param4[48] = new PropertyWatcher("loginBrowsePreviewBadge",{"propertyChange":true},[param3[62]],param2);
         param4[49] = new PropertyWatcher("bsAC",{"propertyChange":true},[param3[62]],null);
         param4[50] = new PropertyWatcher("length",{"collectionChange":true},[param3[62]],null);
         param4[34] = new PropertyWatcher("chosenPassword",{"propertyChange":true},[param3[51],param3[87],param3[66]],param2);
         param4[35] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[51],param3[87]],null);
         param4[54] = new PropertyWatcher("chosenChangedPassword",{"propertyChange":true},[param3[100],param3[74]],param2);
         param4[73] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[100]],null);
         param4[53] = new PropertyWatcher("chosenEmail",{"propertyChange":true},[param3[72],param3[88]],param2);
         param4[59] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[88]],null);
         param4[11] = new PropertyWatcher("footer",{"propertyChange":true},[param3[15]],param2);
         param4[12] = new PropertyWatcher("height",{"heightChanged":true},[param3[15]],null);
         param4[66] = new PropertyWatcher("recoverPasswordLogin",{"propertyChange":true},[param3[96],param3[93]],param2);
         param4[67] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[96],param3[93]],null);
         param4[21] = new PropertyWatcher("fPassword",{"propertyChange":true},[param3[82],param3[28]],param2);
         param4[22] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[82],param3[28]],null);
         param4[37] = new PropertyWatcher("chosenPassword2",{"propertyChange":true},[param3[68],param3[51]],param2);
         param4[38] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[51]],null);
         param4[7] = new PropertyWatcher("showMeSlowly",{"propertyChange":true},[param3[5],param3[11]],param2);
         param4[2] = new PropertyWatcher("badge",{"propertyChange":true},[param3[2]],param2);
         param4[3] = new PropertyWatcher("bsAC",{"propertyChange":true},[param3[2]],null);
         param4[4] = new PropertyWatcher("length",{"collectionChange":true},[param3[2]],null);
         param4[14] = new PropertyWatcher("fLogin",{"propertyChange":true},[param3[19],param3[81],param3[28]],param2);
         param4[15] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[19],param3[81],param3[28]],null);
         param4[63] = new PropertyWatcher("chosenSecurityQuestion",{"propertyChange":true},[param3[90]],param2);
         param4[64] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[90]],null);
         param4[61].updateParent(param1);
         param4[61].addChild(param4[62]);
         param4[52].updateParent(param1);
         param4[52].addChild(param4[65]);
         param4[24].updateParent(param1);
         param4[57].updateParent(param1);
         param4[57].addChild(param4[74]);
         param4[40].updateParent(param1);
         param4[40].addChild(param4[41]);
         param4[51].updateParent(param1);
         param4[42].updateParent(param1);
         param4[42].addChild(param4[43]);
         param4[42].addChild(param4[44]);
         param4[44].addChild(param4[47]);
         param4[44].addChild(param4[45]);
         param4[17].updateParent(param1);
         param4[28].updateParent(param1);
         param4[26].updateParent(param1);
         param4[26].addChild(param4[27]);
         param4[56].updateParent(param1);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[16]);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[6]);
         param4[0].addChild(param4[13]);
         param4[0].addChild(param4[10]);
         param4[29].updateParent(param1);
         param4[29].addChild(param4[30]);
         param4[5].updateParent(param1);
         param4[72].updateParent(param1);
         param4[31].updateParent(param1);
         param4[31].addChild(param4[32]);
         param4[55].updateParent(param1);
         param4[69].updateParent(param1);
         param4[69].addChild(param4[70]);
         param4[48].updateParent(param1);
         param4[48].addChild(param4[49]);
         param4[49].addChild(param4[50]);
         param4[34].updateParent(param1);
         param4[34].addChild(param4[35]);
         param4[54].updateParent(param1);
         param4[54].addChild(param4[73]);
         param4[53].updateParent(param1);
         param4[53].addChild(param4[59]);
         param4[11].updateParent(param1);
         param4[11].addChild(param4[12]);
         param4[66].updateParent(param1);
         param4[66].addChild(param4[67]);
         param4[21].updateParent(param1);
         param4[21].addChild(param4[22]);
         param4[37].updateParent(param1);
         param4[37].addChild(param4[38]);
         param4[7].updateParent(param1);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[3]);
         param4[3].addChild(param4[4]);
         param4[14].updateParent(param1);
         param4[14].addChild(param4[15]);
         param4[63].updateParent(param1);
         param4[63].addChild(param4[64]);
      }
   }
}
