package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _SelectBackgroundColorWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _SelectBackgroundColorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SelectBackgroundColor.watcherSetupUtil = new _SelectBackgroundColorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("active",{"propertyChange":true},[param3[0]],param2);
         param4[1] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[1]],param2);
         param4[2] = new PropertyWatcher("userLoggedIn",{"propertyChange":true},[param3[1]],null);
         param4[0].updateParent(param1);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[2]);
      }
   }
}
