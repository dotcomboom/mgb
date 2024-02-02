package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _TileMakerControlWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _TileMakerControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TileMakerControl.watcherSetupUtil = new _TileMakerControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[14] = new PropertyWatcher("ButtonPicker",{"propertyChange":true},[param3[20]],param2);
         param4[0] = new PropertyWatcher("dpad",{"propertyChange":true},[param3[0],param3[1],param3[2],param3[4],param3[5],param3[6],param3[7],param3[8],param3[9],param3[10],param3[11],param3[12],param3[13],param3[14],param3[15],param3[17],param3[16],param3[19],param3[21],param3[22]],param2);
         param4[7] = new PropertyWatcher("toolWidth",{"propertyChange":true},[param3[10]],null);
         param4[8] = new PropertyWatcher("allowSelect",{"propertyChange":true},[param3[12]],null);
         param4[11] = new PropertyWatcher("allowPaste",{"propertyChange":true},[param3[16]],null);
         param4[6] = new PropertyWatcher("allowRedo",{"propertyChange":true},[param3[6]],null);
         param4[10] = new PropertyWatcher("allowCopy",{"propertyChange":true},[param3[15]],null);
         param4[15] = new PropertyWatcher("tilePiece",{"propertyChange":true},[param3[22]],null);
         param4[16] = new PropertyWatcher("name",{"propertyChange":true},[param3[22]],null);
         param4[1] = new PropertyWatcher("tool",{"propertyChange":true},[param3[17],param3[0],param3[21],param3[7],param3[8],param3[9],param3[11],param3[13]],null);
         param4[2] = new PropertyWatcher("Gxpad_color",{"propertyChange":true},[param3[1],param3[2]],null);
         param4[5] = new PropertyWatcher("allowUndo",{"propertyChange":true},[param3[5]],null);
         param4[4] = new PropertyWatcher("Gzoom",{"propertyChange":true},[param3[4]],null);
         param4[13] = new PropertyWatcher("camOn",{"propertyChange":true},[param3[19]],null);
         param4[9] = new PropertyWatcher("allowCut",{"propertyChange":true},[param3[14]],null);
         param4[12] = new PropertyWatcher("ButtonPaste",{"propertyChange":true},[param3[18]],param2);
         param4[17] = new PropertyWatcher("duper",{"propertyChange":true},[param3[23]],param2);
         param4[3] = new PropertyWatcher("showGlow",{"propertyChange":true},[param3[3]],param2);
         param4[14].updateParent(param1);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[7]);
         param4[0].addChild(param4[8]);
         param4[0].addChild(param4[11]);
         param4[0].addChild(param4[6]);
         param4[0].addChild(param4[10]);
         param4[0].addChild(param4[15]);
         param4[15].addChild(param4[16]);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[2]);
         param4[0].addChild(param4[5]);
         param4[0].addChild(param4[4]);
         param4[0].addChild(param4[13]);
         param4[0].addChild(param4[9]);
         param4[12].updateParent(param1);
         param4[17].updateParent(param1);
         param4[3].updateParent(param1);
      }
   }
}
