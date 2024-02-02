package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _WallpostItemRendererWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _WallpostItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WallpostItemRenderer.watcherSetupUtil = new _WallpostItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[2] = new PropertyWatcher("data",{"dataChange":true},[param3[0],param3[1],param3[2],param3[3]],param2);
         param4[5] = new PropertyWatcher("body",null,[param3[2]],null);
         param4[3] = new PropertyWatcher("friendingdate",null,[param3[0]],null);
         param4[4] = new PropertyWatcher("fromname",null,[param3[1],param3[3]],null);
         param4[7] = new PropertyWatcher("date",null,[param3[3]],null);
         param4[0] = new PropertyWatcher("dateDisplay",{"propertyChange":true},[param3[0],param3[3]],param2);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[5]);
         param4[2].addChild(param4[3]);
         param4[2].addChild(param4[4]);
         param4[2].addChild(param4[7]);
         param4[0].updateParent(param1);
      }
   }
}
