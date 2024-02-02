package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _LoginActorPreviewControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _LoginActorPreviewControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LoginActorPreviewControl.watcherSetupUtil = new _LoginActorPreviewControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("actorPreview",{"propertyChange":true},[param3[0]],param2);
         param4[1] = new PropertyWatcher("toolTip",{"toolTipChanged":true},[param3[0]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
      }
   }
}
