package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _EditFooterComponentWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _EditFooterComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EditFooterComponent.watcherSetupUtil = new _EditFooterComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[17] = new PropertyWatcher("sliderChangeEffect",{"propertyChange":true},[param3[19]],param2);
         param4[0] = new PropertyWatcher("textSkillBox",{"propertyChange":true},[param3[0]],param2);
         param4[7] = new PropertyWatcher("mgbTutorial",{"propertyChange":true},[param3[17],param3[16],param3[18],param3[7],param3[8],param3[9],param3[10],param3[11],param3[12],param3[13],param3[14],param3[15]],param2);
         param4[10] = new PropertyWatcher("activeTutorial",{"propertyChange":true},[param3[17],param3[8]],null);
         param4[11] = new PropertyWatcher("comment",{"propertyChange":true},[param3[17],param3[8]],null);
         param4[8] = new PropertyWatcher("activeTutorialEnableStartButton",{"propertyChange":true},[param3[16],param3[18],param3[7]],null);
         param4[16] = new PropertyWatcher("activeTutorialText",{"propertyChange":true},[param3[15]],null);
         param4[13] = new PropertyWatcher("activeTutorialNextButtonText",{"propertyChange":true},[param3[10]],null);
         param4[14] = new PropertyWatcher("activeTutorialEnableSkipButton",{"propertyChange":true},[param3[11],param3[12]],null);
         param4[12] = new PropertyWatcher("activeTutorialEnableNextButton",{"propertyChange":true},[param3[9]],null);
         param4[15] = new PropertyWatcher("activeTutorialEnableBackButton",{"propertyChange":true},[param3[13],param3[14]],null);
         param4[4] = new PropertyWatcher("PanelTutorialLeftGap",{"propertyChange":true},[param3[2],param3[6]],param2);
         param4[2] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[16],param3[1],param3[3],param3[4],param3[5],param3[7]],param2);
         param4[9] = new PropertyWatcher("userLoggedInForTheFirstTimeEver",{"propertyChange":true},[param3[16],param3[7]],null);
         param4[3] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[1],param3[5]],null);
         param4[5] = new PropertyWatcher("userName",{"propertyChange":true},[param3[3]],null);
         param4[6] = new PropertyWatcher("userLoggedIn",{"propertyChange":true},[param3[4]],null);
         param4[1] = new PropertyWatcher("sliderSkill",{"propertyChange":true},[param3[0]],param2);
         param4[17].updateParent(param1);
         param4[0].updateParent(param1);
         param4[7].updateParent(param1);
         param4[7].addChild(param4[10]);
         param4[10].addChild(param4[11]);
         param4[7].addChild(param4[8]);
         param4[7].addChild(param4[16]);
         param4[7].addChild(param4[13]);
         param4[7].addChild(param4[14]);
         param4[7].addChild(param4[12]);
         param4[7].addChild(param4[15]);
         param4[4].updateParent(param1);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[9]);
         param4[2].addChild(param4[3]);
         param4[2].addChild(param4[5]);
         param4[2].addChild(param4[6]);
         param4[1].updateParent(param1);
      }
   }
}
