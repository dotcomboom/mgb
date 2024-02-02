package
{
   import com.mgb.modals.ShowSpaceUsage;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_modals_ShowSpaceUsageWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_modals_ShowSpaceUsageWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ShowSpaceUsage.watcherSetupUtil = new _com_mgb_modals_ShowSpaceUsageWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[0],param3[2],param3[3],param3[4],param3[6]],param2);
         param4[6] = new PropertyWatcher("overQuota",{"propertyChange":true},[param3[3],param3[4]],null);
         param4[1] = new PropertyWatcher("activeProject",{"propertyChange":true},[param3[0],param3[6]],null);
         param4[5] = new PropertyWatcher("maxQuotaKB",{"propertyChange":true},[param3[2]],null);
         param4[2] = new PropertyWatcher("projectList",{"propertyChange":true},[param3[1],param3[5],param3[7]],param2);
         param4[4] = new PropertyWatcher("totalProjectCount",{"propertyChange":true},[param3[1]],null);
         param4[8] = new PropertyWatcher("lastCheckedTime",{"propertyChange":true},[param3[7]],null);
         param4[3] = new PropertyWatcher("totalKBUsed",{"propertyChange":true},[param3[1]],null);
         param4[7] = new PropertyWatcher("projectNamesAC",{"propertyChange":true},[param3[5]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[6]);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[5]);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[4]);
         param4[2].addChild(param4[8]);
         param4[2].addChild(param4[3]);
         param4[2].addChild(param4[7]);
      }
   }
}
