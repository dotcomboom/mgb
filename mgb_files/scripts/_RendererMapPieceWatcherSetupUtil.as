package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _RendererMapPieceWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _RendererMapPieceWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RendererMapPiece.watcherSetupUtil = new _RendererMapPieceWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[1] = new PropertyWatcher("showName",{"propertyChange":true},[param3[1]],param2);
         param4[0] = new PropertyWatcher("showComment",{"propertyChange":true},[param3[0]],param2);
         param4[3] = new PropertyWatcher("showDesc",{"propertyChange":true},[param3[3]],param2);
         param4[2] = new PropertyWatcher("showSize",{"propertyChange":true},[param3[2]],param2);
         param4[1].updateParent(param1);
         param4[0].updateParent(param1);
         param4[3].updateParent(param1);
         param4[2].updateParent(param1);
      }
   }
}
