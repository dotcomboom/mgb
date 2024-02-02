package
{
   import com.mgb.modals.ChooseMapJumpCellForm;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_modals_ChooseMapJumpCellFormWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_modals_ChooseMapJumpCellFormWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChooseMapJumpCellForm.watcherSetupUtil = new _com_mgb_modals_ChooseMapJumpCellFormWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("map2",{"propertyChange":true},[param3[0],param3[1]],param2);
         param4[1] = new PropertyWatcher("cursorCol",{"propertyChange":true},[param3[0]],null);
         param4[2] = new PropertyWatcher("cursorRow",{"propertyChange":true},[param3[0]],null);
         param4[3] = new PropertyWatcher("toolTipText",{"propertyChange":true},[param3[1]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[2]);
         param4[0].addChild(param4[3]);
      }
   }
}
