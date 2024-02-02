package
{
   import com.mgb.controls.Rater;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_controls_RaterWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_controls_RaterWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         Rater.watcherSetupUtil = new _com_mgb_controls_RaterWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("showRating",{"propertyChange":true},[param3[0],param3[1],param3[2],param3[3],param3[4]],param2);
         param4[2] = new PropertyWatcher("averageRating",{"propertyChange":true},[param3[5]],param2);
         param4[3] = new PropertyWatcher("numRatings",{"propertyChange":true},[param3[5]],param2);
         param4[1] = new PropertyWatcher("describe",{"propertyChange":true},[param3[5]],param2);
         param4[4] = new PropertyWatcher("personalRating",{"propertyChange":true},[param3[6]],param2);
         param4[0].updateParent(param1);
         param4[2].updateParent(param1);
         param4[3].updateParent(param1);
         param4[1].updateParent(param1);
         param4[4].updateParent(param1);
      }
   }
}
