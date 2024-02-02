package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _HeaderComponentWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _HeaderComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         HeaderComponent.watcherSetupUtil = new _HeaderComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[0],param3[2],param3[3],param3[4],param3[5]],param2);
         param4[3] = new PropertyWatcher("authenticatedName",{"propertyChange":true},[param3[2]],null);
         param4[4] = new PropertyWatcher("userName",{"propertyChange":true},[param3[3],param3[4]],null);
         param4[1] = new PropertyWatcher("userLoggedIn",{"propertyChange":true},[param3[0],param3[5]],null);
         param4[2] = new PropertyWatcher("moveHdr",{"propertyChange":true},[param3[1],param3[6]],param2);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[3]);
         param4[0].addChild(param4[4]);
         param4[0].addChild(param4[1]);
         param4[2].updateParent(param1);
      }
   }
}
