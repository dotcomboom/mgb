package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _TutorialMakerControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _TutorialMakerControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TutorialMakerControl.watcherSetupUtil = new _TutorialMakerControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[0]],param2);
         param4[1] = new PropertyWatcher("userLoggedInIsAdmin",{"propertyChange":true},[param3[0]],null);
         param4[2] = new PropertyWatcher("tutorialPiece",{"propertyChange":true},[param3[1]],param2);
         param4[3] = new PropertyWatcher("tAC",{"propertyChange":true},[param3[1]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[3]);
      }
   }
}
