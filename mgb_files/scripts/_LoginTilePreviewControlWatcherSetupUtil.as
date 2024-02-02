package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _LoginTilePreviewControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _LoginTilePreviewControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LoginTilePreviewControl.watcherSetupUtil = new _LoginTilePreviewControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("_data",{"propertyChange":true},[param3[0],param3[1]],param2);
         param4[1] = new PropertyWatcher("name",null,[param3[0],param3[1]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
      }
   }
}
