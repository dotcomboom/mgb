package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _WallTabWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _WallTabWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WallTab.watcherSetupUtil = new _WallTabWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[4] = new PropertyWatcher("greeting",{"propertyChange":true},[param3[4]],param2);
         param4[5] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[4]],null);
         param4[2] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[1],param3[2],param3[3],param3[9]],param2);
         param4[3] = new PropertyWatcher("authenticatedName",{"propertyChange":true},[param3[1],param3[2],param3[3]],null);
         param4[9] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[9]],null);
         param4[0] = new PropertyWatcher("wall",{"propertyChange":true},[param3[0],param3[5],param3[6],param3[7],param3[8]],param2);
         param4[7] = new PropertyWatcher("refreshPending",{"propertyChange":true},[param3[6],param3[7]],null);
         param4[8] = new PropertyWatcher("wallpostsListAC",{"propertyChange":true},[param3[8]],null);
         param4[1] = new PropertyWatcher("recipient",{"propertyChange":true},[param3[0],param3[5]],null);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[5]);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[3]);
         param4[2].addChild(param4[9]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[7]);
         param4[0].addChild(param4[8]);
         param4[0].addChild(param4[1]);
      }
   }
}
