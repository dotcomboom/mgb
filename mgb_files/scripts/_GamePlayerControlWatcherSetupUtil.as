package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _GamePlayerControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _GamePlayerControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GamePlayerControl.watcherSetupUtil = new _GamePlayerControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[7] = new PropertyWatcher("readyToPlay",{"propertyChange":true},[param3[8],param3[11],param3[12]],param2);
         param4[8] = new PropertyWatcher("showLoadButton",{"propertyChange":true},[param3[9],param3[10]],param2);
         param4[0] = new PropertyWatcher("gamePlayAreaCanvas",{"propertyChange":true},[param3[0]],param2);
         param4[3] = new PropertyWatcher("gameStatsDisplay",{"propertyChange":true},[param3[3],param3[4]],param2);
         param4[4] = new PropertyWatcher("width",{"widthChanged":true},[param3[3],param3[4]],null);
         param4[9] = new PropertyWatcher("game",{"propertyChange":true},[param3[9],param3[10],param3[11],param3[12],param3[13],param3[14],param3[15],param3[17],param3[16],param3[19],param3[18],param3[21],param3[20],param3[23],param3[22]],param2);
         param4[10] = new PropertyWatcher("gameEngineMode",{"propertyChange":true},[param3[17],param3[16],param3[19],param3[18],param3[20],param3[9],param3[10],param3[11],param3[12],param3[13],param3[14],param3[15]],null);
         param4[12] = new PropertyWatcher("G_gameOver",{"propertyChange":true},[param3[17],param3[16],param3[19],param3[18],param3[20],param3[9],param3[10],param3[11],param3[12],param3[13],param3[14],param3[15]],null);
         param4[15] = new PropertyWatcher("backgroundMusicCurrentSource",{"propertyChange":true},[param3[22]],null);
         param4[13] = new PropertyWatcher("gameStatusString",{"propertyChange":true},[param3[21]],null);
         param4[16] = new PropertyWatcher("backgroundMusicStatus",{"propertyChange":true},[param3[23],param3[22]],null);
         param4[5] = new PropertyWatcher("resizeEffect",{"propertyChange":true},[param3[5]],param2);
         param4[17] = new PropertyWatcher("disableColorpicker",{"propertyChange":true},[param3[24]],param2);
         param4[6] = new PropertyWatcher("showMGBHeader",{"propertyChange":true},[param3[6],param3[7]],param2);
         param4[2] = new PropertyWatcher("helpPanel",{"propertyChange":true},[param3[2]],param2);
         param4[7].updateParent(param1);
         param4[8].updateParent(param1);
         param4[0].updateParent(param1);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[4]);
         param4[9].updateParent(param1);
         param4[9].addChild(param4[10]);
         param4[9].addChild(param4[12]);
         param4[9].addChild(param4[15]);
         param4[9].addChild(param4[13]);
         param4[9].addChild(param4[16]);
         param4[5].updateParent(param1);
         param4[17].updateParent(param1);
         param4[6].updateParent(param1);
         param4[2].updateParent(param1);
      }
   }
}
