package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _ActorGraphicsEffectComboBoxWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _ActorGraphicsEffectComboBoxWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ActorGraphicsEffectComboBox.watcherSetupUtil = new _ActorGraphicsEffectComboBoxWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("ac",{"propertyChange":true},[param3[0]],param2);
         param4[0].updateParent(param1);
      }
   }
}
