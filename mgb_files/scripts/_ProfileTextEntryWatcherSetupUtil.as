package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _ProfileTextEntryWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _ProfileTextEntryWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProfileTextEntry.watcherSetupUtil = new _ProfileTextEntryWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[1] = new PropertyWatcher("promptWidth",{"propertyChange":true},[param3[1]],param2);
         param4[5] = new PropertyWatcher("isFieldPrivate",{"propertyChange":true},[param3[4]],param2);
         param4[0] = new PropertyWatcher("prompt",{"propertyChange":true},[param3[0]],param2);
         param4[2] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[2],param3[4],param3[5]],param2);
         param4[7] = new PropertyWatcher("authenticatedName",{"propertyChange":true},[param3[4]],null);
         param4[3] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[2],param3[4],param3[5]],null);
         param4[1].updateParent(param1);
         param4[5].updateParent(param1);
         param4[0].updateParent(param1);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[7]);
         param4[2].addChild(param4[3]);
      }
   }
}
