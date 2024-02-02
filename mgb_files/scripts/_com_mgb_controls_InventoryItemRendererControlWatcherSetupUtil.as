package
{
   import com.mgb.controls.InventoryItemRendererControl;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_controls_InventoryItemRendererControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_controls_InventoryItemRendererControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InventoryItemRendererControl.watcherSetupUtil = new _com_mgb_controls_InventoryItemRendererControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("ourItem",{"propertyChange":true},[param3[0],param3[1],param3[2]],param2);
         param4[1] = new PropertyWatcher("count",{"propertyChange":true},[param3[0],param3[1]],null);
         param4[2] = new PropertyWatcher("equipped",{"propertyChange":true},[param3[0],param3[1],param3[2]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[2]);
      }
   }
}
