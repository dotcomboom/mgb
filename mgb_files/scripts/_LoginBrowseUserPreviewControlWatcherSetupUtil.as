package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _LoginBrowseUserPreviewControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _LoginBrowseUserPreviewControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LoginBrowseUserPreviewControl.watcherSetupUtil = new _LoginBrowseUserPreviewControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[1] = new PropertyWatcher("loginCount",{"propertyChange":true},[param3[1]],param2);
         param4[2] = new PropertyWatcher("badgeCount",{"propertyChange":true},[param3[2]],param2);
         param4[0] = new PropertyWatcher("login",{"propertyChange":true},[param3[0]],param2);
         param4[1].updateParent(param1);
         param4[2].updateParent(param1);
         param4[0].updateParent(param1);
      }
   }
}
