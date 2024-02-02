package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _ProjectsTabWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _ProjectsTabWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProjectsTab.watcherSetupUtil = new _ProjectsTabWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[10] = new PropertyWatcher("mapsPL",{"propertyChange":true},[param3[19],param3[3],param3[21],param3[24]],param2);
         param4[11] = new PropertyWatcher("piecesAC",{"propertyChange":true},[param3[19],param3[3],param3[21],param3[24]],null);
         param4[12] = new PropertyWatcher("length",{"collectionChange":true},[param3[19],param3[3],param3[24]],null);
         param4[7] = new PropertyWatcher("actorsPL",{"propertyChange":true},[param3[18],param3[3],param3[13],param3[15]],param2);
         param4[8] = new PropertyWatcher("piecesAC",{"propertyChange":true},[param3[18],param3[3],param3[13],param3[15]],null);
         param4[9] = new PropertyWatcher("length",{"collectionChange":true},[param3[18],param3[3],param3[13]],null);
         param4[20] = new PropertyWatcher("panelTabNav",{"propertyChange":true},[param3[27],param3[29],param3[28]],param2);
         param4[23] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "creationComplete":true,
            "change":true
         },[param3[29]],null);
         param4[21] = new PropertyWatcher("selectedChild",{
            "valueCommit":true,
            "creationComplete":true
         },[param3[27],param3[28]],null);
         param4[22] = new PropertyWatcher("label",{"labelChanged":true},[param3[27],param3[28]],null);
         param4[26] = new PropertyWatcher("projectList",{"propertyChange":true},[param3[34]],param2);
         param4[27] = new PropertyWatcher("projectNamesAC",{"propertyChange":true},[param3[34]],null);
         param4[14] = new PropertyWatcher("footer",{"propertyChange":true},[param3[6]],param2);
         param4[15] = new PropertyWatcher("height",{"heightChanged":true},[param3[6]],null);
         param4[4] = new PropertyWatcher("tilesPL",{"propertyChange":true},[param3[3],param3[7],param3[9],param3[12]],param2);
         param4[5] = new PropertyWatcher("piecesAC",{"propertyChange":true},[param3[3],param3[7],param3[9],param3[12]],null);
         param4[6] = new PropertyWatcher("length",{"collectionChange":true},[param3[3],param3[7],param3[12]],null);
         param4[2] = new PropertyWatcher("showMeSlowly",{"propertyChange":true},[param3[2],param3[30]],param2);
         param4[0] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[0],param3[1],param3[19],param3[33],param3[3],param3[5],param3[7],param3[25],param3[26],param3[13]],param2);
         param4[1] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[0],param3[1],param3[33],param3[5],param3[25],param3[26]],null);
         param4[3] = new PropertyWatcher("activeProject",{"propertyChange":true},[param3[19],param3[3],param3[7],param3[13]],null);
         param4[10].updateParent(param1);
         param4[10].addChild(param4[11]);
         param4[11].addChild(param4[12]);
         param4[7].updateParent(param1);
         param4[7].addChild(param4[8]);
         param4[8].addChild(param4[9]);
         param4[20].updateParent(param1);
         param4[20].addChild(param4[23]);
         param4[20].addChild(param4[21]);
         param4[21].addChild(param4[22]);
         param4[26].updateParent(param1);
         param4[26].addChild(param4[27]);
         param4[14].updateParent(param1);
         param4[14].addChild(param4[15]);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[5]);
         param4[5].addChild(param4[6]);
         param4[2].updateParent(param1);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[3]);
      }
   }
}
