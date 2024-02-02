package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.core.IFlexModuleFactory;
   
   public class _TilePreviewControlForActorMakerWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _TilePreviewControlForActorMakerWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TilePreviewControlForActorMaker.watcherSetupUtil = new _TilePreviewControlForActorMakerWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
      }
   }
}
