package
{
   import com.mgb.modals.ChooseNewMapSizeForm;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_modals_ChooseNewMapSizeFormWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_modals_ChooseNewMapSizeFormWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChooseNewMapSizeForm.watcherSetupUtil = new _com_mgb_modals_ChooseNewMapSizeFormWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("visibleBox",{"propertyChange":true},[param3[0],param3[5]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[0],param3[5]],null);
         param4[1] = new PropertyWatcher("width",{"widthChanged":true},[param3[0],param3[5]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[2]);
         param4[0].addChild(param4[1]);
      }
   }
}
