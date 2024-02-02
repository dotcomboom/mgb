package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _GamesBrowserWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _GamesBrowserWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GamesBrowser.watcherSetupUtil = new _GamesBrowserWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[9] = new PropertyWatcher("lgr_limit",{"propertyChange":true},[param3[5],param3[23],param3[12],param3[13]],param2);
         param4[14] = new PropertyWatcher("lgr_order",{"propertyChange":true},[param3[25],param3[29]],param2);
         param4[5] = new PropertyWatcher("loading",{"propertyChange":true},[param3[21],param3[5],param3[11],param3[14]],param2);
         param4[6] = new PropertyWatcher("pageNum",{"propertyChange":true},[param3[5],param3[10],param3[13]],param2);
         param4[7] = new PropertyWatcher("value",{
            "valueCommit":true,
            "change":true
         },[param3[5],param3[10],param3[13]],null);
         param4[16] = new PropertyWatcher("lgr_gametype",{"propertyChange":true},[param3[27]],param2);
         param4[8] = new PropertyWatcher("totalGames",{"propertyChange":true},[param3[5],param3[6],param3[7],param3[12],param3[13]],param2);
         param4[0] = new PropertyWatcher("featuredGamesMode",{"propertyChange":true},[param3[0],param3[21],param3[15]],param2);
         param4[15] = new PropertyWatcher("lgr_gamestatus",{"propertyChange":true},[param3[26]],param2);
         param4[13] = new PropertyWatcher("lgr_offset",{"propertyChange":true},[param3[24]],param2);
         param4[17] = new PropertyWatcher("lgr_chosenuser",{"propertyChange":true},[param3[29],param3[28]],param2);
         param4[10] = new PropertyWatcher("quickFade",{"propertyChange":true},[param3[17],param3[16],param3[19],param3[20],param3[8],param3[9]],param2);
         param4[11] = new PropertyWatcher("gamesListAC",{"propertyChange":true},[param3[18]],param2);
         param4[9].updateParent(param1);
         param4[14].updateParent(param1);
         param4[5].updateParent(param1);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[7]);
         param4[16].updateParent(param1);
         param4[8].updateParent(param1);
         param4[0].updateParent(param1);
         param4[15].updateParent(param1);
         param4[13].updateParent(param1);
         param4[17].updateParent(param1);
         param4[10].updateParent(param1);
         param4[11].updateParent(param1);
      }
   }
}
