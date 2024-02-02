package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _GamesBrowserFeaturedGamesWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _GamesBrowserFeaturedGamesWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GamesBrowserFeaturedGames.watcherSetupUtil = new _GamesBrowserFeaturedGamesWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("gameChooser",{"propertyChange":true},[param3[0],param3[1],param3[3]],param2);
         param4[1] = new PropertyWatcher("selectedIndex",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[0],param3[1]],null);
         param4[5] = new PropertyWatcher("selectedItem",{
            "valueCommit":true,
            "collectionChange":true,
            "change":true
         },[param3[3]],null);
         param4[6] = new PropertyWatcher("label",null,[param3[3]],null);
         param4[2] = new PropertyWatcher("dataProvider",{"collectionChange":true},[param3[1]],null);
         param4[3] = new PropertyWatcher("length",null,[param3[1]],null);
         param4[4] = new PropertyWatcher("gamesAC",{"propertyChange":true},[param3[2]],param2);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[5]);
         param4[5].addChild(param4[6]);
         param4[0].addChild(param4[2]);
         param4[2].addChild(param4[3]);
         param4[4].updateParent(param1);
      }
   }
}
