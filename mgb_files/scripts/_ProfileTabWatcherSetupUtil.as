package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _ProfileTabWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _ProfileTabWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProfileTab.watcherSetupUtil = new _ProfileTabWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[4] = new PropertyWatcher("ownerName",{"propertyChange":true},[param3[4],param3[5],param3[6],param3[7],param3[8],param3[9],param3[10],param3[11],param3[12]],param2);
         param4[2] = new PropertyWatcher("dirty",{"propertyChange":true},[param3[1],param3[13]],param2);
         param4[0] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[0],param3[2],param3[3],param3[14],param3[15]],param2);
         param4[3] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[2],param3[3],param3[14],param3[15]],null);
         param4[1] = new PropertyWatcher("userName",{"propertyChange":true},[param3[0]],null);
         param4[4].updateParent(param1);
         param4[2].updateParent(param1);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[3]);
         param4[0].addChild(param4[1]);
      }
   }
}
