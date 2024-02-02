package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _TileMakerPaletteWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _TileMakerPaletteWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TileMakerPalette.watcherSetupUtil = new _TileMakerPaletteWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[8] = new PropertyWatcher("paletteActiveRow",{"propertyChange":true},[param3[6]],param2);
         param4[5] = new PropertyWatcher("r",{"propertyChange":true},[param3[3],param3[4],param3[5]],param2);
         param4[6] = new PropertyWatcher("dataProvider",{"collectionChange":true},[param3[3],param3[4],param3[5]],null);
         param4[4] = new PropertyWatcher("colorList",{"propertyChange":true},[param3[2]],param2);
         param4[0] = new PropertyWatcher("_paletteTile",{"propertyChange":true},[param3[0],param3[9],param3[11]],param2);
         param4[1] = new PropertyWatcher("loadFailed",{"propertyChange":true},[param3[0],param3[9]],null);
         param4[2] = new PropertyWatcher("loadPending",{"propertyChange":true},[param3[0],param3[11]],null);
         param4[8].updateParent(param1);
         param4[5].updateParent(param1);
         param4[5].addChild(param4[6]);
         param4[4].updateParent(param1);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[2]);
      }
   }
}
