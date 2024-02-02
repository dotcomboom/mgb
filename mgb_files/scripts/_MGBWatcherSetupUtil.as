package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _MGBWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _MGBWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MGB.watcherSetupUtil = new _MGBWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[8] = new PropertyWatcher("activeTutorial",{"propertyChange":true},[param3[29],param3[28]],param2);
         param4[9] = new PropertyWatcher("activeTutorialWantedPage",{"propertyChange":true},[param3[29],param3[28]],null);
         param4[5] = new PropertyWatcher("mgbLogger",{"propertyChange":true},[param3[25]],param2);
         param4[6] = new PropertyWatcher("entriesAC",{"propertyChange":true},[param3[25]],null);
         param4[7] = new PropertyWatcher("length",{"collectionChange":true},[param3[25]],null);
         param4[3] = new PropertyWatcher("myWD",{"propertyChange":true},[param3[18],param3[3],param3[21],param3[23],param3[6],param3[9],param3[26],param3[12],param3[15]],param2);
         param4[4] = new PropertyWatcher("myWU",{"propertyChange":true},[param3[16],param3[19],param3[4],param3[22],param3[7],param3[24],param3[27],param3[10],param3[13]],param2);
         param4[1] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[17],param3[1],param3[2],param3[20],param3[5],param3[8],param3[11],param3[14],param3[30]],param2);
         param4[2] = new PropertyWatcher("userLoggedIn",{"propertyChange":true},[param3[17],param3[1],param3[2],param3[20],param3[5],param3[8],param3[11],param3[14],param3[30]],null);
         param4[0] = new PropertyWatcher("mainViewStack",{"propertyChange":true},[param3[0],param3[28]],param2);
         param4[10] = new PropertyWatcher("selectedChild",{
            "valueCommit":true,
            "creationComplete":true
         },[param3[28]],null);
         param4[8].updateParent(param1);
         param4[8].addChild(param4[9]);
         param4[5].updateParent(param1);
         param4[5].addChild(param4[6]);
         param4[6].addChild(param4[7]);
         param4[3].updateParent(param1);
         param4[4].updateParent(param1);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[2]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[10]);
      }
   }
}
