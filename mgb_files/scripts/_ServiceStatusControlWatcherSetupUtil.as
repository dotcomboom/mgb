package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _ServiceStatusControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _ServiceStatusControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ServiceStatusControl.watcherSetupUtil = new _ServiceStatusControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("mgbLogger",{"propertyChange":true},[param3[0],param3[1]],param2);
         param4[1] = new PropertyWatcher("entriesAC",{"propertyChange":true},[param3[0],param3[1]],null);
         param4[2] = new PropertyWatcher("length",{"collectionChange":true},[param3[0]],null);
         param4[3] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[2]],param2);
         param4[8] = new PropertyWatcher("expensiveOps",{"propertyChange":true},[param3[2]],null);
         param4[7] = new PropertyWatcher("cheapOps",{"propertyChange":true},[param3[2]],null);
         param4[4] = new PropertyWatcher("s3BytesSent",{"propertyChange":true},[param3[2]],null);
         param4[5] = new PropertyWatcher("s3BytesReceived",{"propertyChange":true},[param3[2]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[1].addChild(param4[2]);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[8]);
         param4[3].addChild(param4[7]);
         param4[3].addChild(param4[4]);
         param4[3].addChild(param4[5]);
      }
   }
}
