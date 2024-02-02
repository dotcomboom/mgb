package
{
   import flash.display.Sprite;
   import korax.controls.ColorPicker.ColorPickerWindow;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _korax_controls_ColorPicker_ColorPickerWindowWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _korax_controls_ColorPicker_ColorPickerWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ColorPickerWindow.watcherSetupUtil = new _korax_controls_ColorPicker_ColorPickerWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[2] = new PropertyWatcher("cc_l_marker",{"propertyChange":true},[param3[2]],param2);
         param4[3] = new PropertyWatcher("ob_hsb",{"propertyChange":true},[param3[3],param3[4],param3[5]],param2);
         param4[6] = new PropertyWatcher("b",null,[param3[5]],null);
         param4[5] = new PropertyWatcher("s",null,[param3[4]],null);
         param4[4] = new PropertyWatcher("h",null,[param3[3]],null);
         param4[1] = new PropertyWatcher("cc_r_marker",{"propertyChange":true},[param3[1]],param2);
         param4[0] = new PropertyWatcher("cc_marker",{"propertyChange":true},[param3[0]],param2);
         param4[7] = new PropertyWatcher("_color",{"propertyChange":true},[param3[6],param3[7],param3[8],param3[9]],param2);
         param4[8] = new PropertyWatcher("old_color",{"propertyChange":true},[param3[10]],param2);
         param4[2].updateParent(param1);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[6]);
         param4[3].addChild(param4[5]);
         param4[3].addChild(param4[4]);
         param4[1].updateParent(param1);
         param4[0].updateParent(param1);
         param4[7].updateParent(param1);
         param4[8].updateParent(param1);
      }
   }
}
