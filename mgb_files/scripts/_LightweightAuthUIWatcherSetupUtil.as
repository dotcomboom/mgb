package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _LightweightAuthUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _LightweightAuthUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LightweightAuthUI.watcherSetupUtil = new _LightweightAuthUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[0],param3[2],param3[3]],param2);
         param4[4] = new PropertyWatcher("storedPassword",{"propertyChange":true},[param3[3]],null);
         param4[1] = new PropertyWatcher("authenticatedName",{"propertyChange":true},[param3[0]],null);
         param4[3] = new PropertyWatcher("storedUsername",{"propertyChange":true},[param3[2]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[4]);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[3]);
      }
   }
}
