package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _GamePreviewRendererWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _GamePreviewRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GamePreviewRenderer.watcherSetupUtil = new _GamePreviewRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[1] = new PropertyWatcher("project",{"propertyChange":true},[param3[5]],param2);
         param4[8] = new PropertyWatcher("raGa",{"propertyChange":true},[param3[8],param3[9]],param2);
         param4[0] = new PropertyWatcher("description",{"propertyChange":true},[param3[1]],param2);
         param4[7] = new PropertyWatcher("raGr",{"propertyChange":true},[param3[8],param3[9]],param2);
         param4[5] = new PropertyWatcher("pc",{"propertyChange":true},[param3[7]],param2);
         param4[2] = new PropertyWatcher("map",{"propertyChange":true},[param3[5]],param2);
         param4[9] = new PropertyWatcher("rcGr",{"propertyChange":true},[param3[10]],param2);
         param4[10] = new PropertyWatcher("rcGa",{"propertyChange":true},[param3[10]],param2);
         param4[3] = new PropertyWatcher("user",{"propertyChange":true},[param3[6]],param2);
         param4[6] = new PropertyWatcher("cc",{"propertyChange":true},[param3[7]],param2);
         param4[1].updateParent(param1);
         param4[8].updateParent(param1);
         param4[0].updateParent(param1);
         param4[7].updateParent(param1);
         param4[5].updateParent(param1);
         param4[2].updateParent(param1);
         param4[9].updateParent(param1);
         param4[10].updateParent(param1);
         param4[3].updateParent(param1);
         param4[6].updateParent(param1);
      }
   }
}
