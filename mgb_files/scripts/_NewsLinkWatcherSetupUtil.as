package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.core.IFlexModuleFactory;
   
   public class _NewsLinkWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _NewsLinkWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NewsLink.watcherSetupUtil = new _NewsLinkWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
      }
   }
}
