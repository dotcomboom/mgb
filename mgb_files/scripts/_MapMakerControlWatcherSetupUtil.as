package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _MapMakerControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _MapMakerControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MapMakerControl.watcherSetupUtil = new _MapMakerControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[9] = new PropertyWatcher("unglowImage",{"propertyChange":true},[param3[5]],param2);
         param4[34] = new PropertyWatcher("gameStats",{"propertyChange":true},[param3[38],param3[39],param3[41],param3[46],param3[44]],param2);
         param4[40] = new PropertyWatcher("description",{"propertyChange":true},[param3[46]],null);
         param4[36] = new PropertyWatcher("gamestatus",{"propertyChange":true},[param3[41],param3[44]],null);
         param4[28] = new PropertyWatcher("inspectText",{"propertyChange":true},[param3[30]],param2);
         param4[29] = new PropertyWatcher("alpha",{"alphaChanged":true},[param3[30]],null);
         param4[32] = new PropertyWatcher("fader",{"propertyChange":true},[param3[34],param3[35],param3[33],param3[36]],param2);
         param4[33] = new PropertyWatcher("publishMode",{"propertyChange":true},[param3[37]],param2);
         param4[0] = new PropertyWatcher("map",{"propertyChange":true},[param3[0],param3[1],param3[2],param3[7],param3[8],param3[9],param3[10],param3[11],param3[12],param3[13],param3[14],param3[15],param3[16],param3[23],param3[25],param3[24],param3[29],param3[28],param3[31],param3[30]],param2);
         param4[12] = new PropertyWatcher("allowZoom",{"propertyChange":true},[param3[10]],null);
         param4[31] = new PropertyWatcher("toolTipVisible",{"propertyChange":true},[param3[31]],null);
         param4[17] = new PropertyWatcher("allowRedo",{"propertyChange":true},[param3[15]],null);
         param4[18] = new PropertyWatcher("allowResize",{"propertyChange":true},[param3[16]],null);
         param4[10] = new PropertyWatcher("allowLoad",{"propertyChange":true},[param3[8]],null);
         param4[11] = new PropertyWatcher("allowSave",{"propertyChange":true},[param3[9]],null);
         param4[4] = new PropertyWatcher("G_gameOver",{"propertyChange":true},[param3[1]],null);
         param4[27] = new PropertyWatcher("allowErase",{"propertyChange":true},[param3[29]],null);
         param4[2] = new PropertyWatcher("gameEngineMode",{"propertyChange":true},[param3[1]],null);
         param4[26] = new PropertyWatcher("allowPut",{"propertyChange":true},[param3[28]],null);
         param4[14] = new PropertyWatcher("allowGrid",{"propertyChange":true},[param3[12]],null);
         param4[22] = new PropertyWatcher("allowInspect",{"propertyChange":true},[param3[23],param3[25],param3[24]],null);
         param4[13] = new PropertyWatcher("zoomLevel",{"propertyChange":true},[param3[11]],null);
         param4[16] = new PropertyWatcher("allowUndo",{"propertyChange":true},[param3[14]],null);
         param4[5] = new PropertyWatcher("allowNew",{"propertyChange":true},[param3[2],param3[7]],null);
         param4[15] = new PropertyWatcher("showGridFlag",{"propertyChange":true},[param3[13]],null);
         param4[30] = new PropertyWatcher("toolTipText",{"propertyChange":true},[param3[30]],null);
         param4[1] = new PropertyWatcher("gameStatusString",{"propertyChange":true},[param3[0]],null);
         param4[21] = new PropertyWatcher("selectedEditLayer",{"propertyChange":true},[param3[20]],param2);
         param4[8] = new PropertyWatcher("glowImage",{"propertyChange":true},[param3[4]],param2);
         param4[24] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[27]],param2);
         param4[25] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[27]],null);
         param4[6] = new PropertyWatcher("chosenActor",{"propertyChange":true},[param3[3],param3[6]],param2);
         param4[7] = new PropertyWatcher("name",{"propertyChange":true},[param3[3]],null);
         param4[23] = new PropertyWatcher("PanelEdit",{"propertyChange":true},[param3[26]],param2);
         param4[9].updateParent(param1);
         param4[34].updateParent(param1);
         param4[34].addChild(param4[40]);
         param4[34].addChild(param4[36]);
         param4[28].updateParent(param1);
         param4[28].addChild(param4[29]);
         param4[32].updateParent(param1);
         param4[33].updateParent(param1);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[12]);
         param4[0].addChild(param4[31]);
         param4[0].addChild(param4[17]);
         param4[0].addChild(param4[18]);
         param4[0].addChild(param4[10]);
         param4[0].addChild(param4[11]);
         param4[0].addChild(param4[4]);
         param4[0].addChild(param4[27]);
         param4[0].addChild(param4[2]);
         param4[0].addChild(param4[26]);
         param4[0].addChild(param4[14]);
         param4[0].addChild(param4[22]);
         param4[0].addChild(param4[13]);
         param4[0].addChild(param4[16]);
         param4[0].addChild(param4[5]);
         param4[0].addChild(param4[15]);
         param4[0].addChild(param4[30]);
         param4[0].addChild(param4[1]);
         param4[21].updateParent(param1);
         param4[8].updateParent(param1);
         param4[24].updateParent(param1);
         param4[24].addChild(param4[25]);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[7]);
         param4[23].updateParent(param1);
      }
   }
}
