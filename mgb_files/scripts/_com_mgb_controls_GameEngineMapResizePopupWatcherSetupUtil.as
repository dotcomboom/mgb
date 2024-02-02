package
{
   import com.mgb.controls.GameEngineMapResizePopup;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_controls_GameEngineMapResizePopupWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_controls_GameEngineMapResizePopupWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GameEngineMapResizePopup.watcherSetupUtil = new _com_mgb_controls_GameEngineMapResizePopupWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("actionString",{"propertyChange":true},[param3[0],param3[1]],param2);
         param4[0].updateParent(param1);
      }
   }
}
