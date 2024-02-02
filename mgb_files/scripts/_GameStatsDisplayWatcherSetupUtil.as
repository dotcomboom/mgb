package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _GameStatsDisplayWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _GameStatsDisplayWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GameStatsDisplay.watcherSetupUtil = new _GameStatsDisplayWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[8] = new PropertyWatcher("speeds",{"propertyChange":true},[param3[17],param3[16],param3[19],param3[18],param3[20],param3[10]],param2);
         param4[12] = new PropertyWatcher("length",{"collectionChange":true},[param3[20]],null);
         param4[6] = new PropertyWatcher("hideHighScoreSection",{"propertyChange":true},[param3[9],param3[15]],param2);
         param4[1] = new PropertyWatcher("project",{"propertyChange":true},[param3[1]],param2);
         param4[4] = new PropertyWatcher("gameStats",{"propertyChange":true},[param3[4],param3[5],param3[6]],param2);
         param4[5] = new PropertyWatcher("description",{"propertyChange":true},[param3[4],param3[5],param3[6]],null);
         param4[7] = new PropertyWatcher("scores",{"propertyChange":true},[param3[16],param3[10],param3[11],param3[12],param3[13],param3[14]],param2);
         param4[10] = new PropertyWatcher("length",{"collectionChange":true},[param3[14]],null);
         param4[0] = new PropertyWatcher("userName",{"propertyChange":true},[param3[0]],param2);
         param4[2] = new PropertyWatcher("gameName",{"propertyChange":true},[param3[2],param3[7],param3[8],param3[9],param3[15]],param2);
         param4[8].updateParent(param1);
         param4[8].addChild(param4[12]);
         param4[6].updateParent(param1);
         param4[1].updateParent(param1);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[5]);
         param4[7].updateParent(param1);
         param4[7].addChild(param4[10]);
         param4[0].updateParent(param1);
         param4[2].updateParent(param1);
      }
   }
}
