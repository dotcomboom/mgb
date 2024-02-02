package
{
   import com.mgb.controls.NpcDialog;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_controls_NpcDialogWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_controls_NpcDialogWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NpcDialog.watcherSetupUtil = new _com_mgb_controls_NpcDialogWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[10] = new PropertyWatcher("choice2",{"propertyChange":true},[param3[9],param3[10]],param2);
         param4[11] = new PropertyWatcher("label",{"labelChanged":true},[param3[9],param3[10]],null);
         param4[8] = new PropertyWatcher("choice1",{"propertyChange":true},[param3[6],param3[7]],param2);
         param4[9] = new PropertyWatcher("label",{"labelChanged":true},[param3[6],param3[7]],null);
         param4[6] = new PropertyWatcher("characterCountVisibleSoFar",{"propertyChange":true},[param3[3]],param2);
         param4[12] = new PropertyWatcher("choice3",{"propertyChange":true},[param3[12],param3[13]],param2);
         param4[13] = new PropertyWatcher("label",{"labelChanged":true},[param3[12],param3[13]],null);
         param4[1] = new PropertyWatcher("pan1",{"propertyChange":true},[param3[1],param3[2]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[1]],null);
         param4[3] = new PropertyWatcher("width",{"widthChanged":true},[param3[2]],null);
         param4[0] = new PropertyWatcher("borderImgCls",{"propertyChange":true},[param3[0]],param2);
         param4[4] = new PropertyWatcher("messageToShow",{"propertyChange":true},[param3[3]],param2);
         param4[7] = new PropertyWatcher("fontFamilyString",{"propertyChange":true},[param3[4],param3[5],param3[8],param3[11]],param2);
         param4[10].updateParent(param1);
         param4[10].addChild(param4[11]);
         param4[8].updateParent(param1);
         param4[8].addChild(param4[9]);
         param4[6].updateParent(param1);
         param4[12].updateParent(param1);
         param4[12].addChild(param4[13]);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[2]);
         param4[1].addChild(param4[3]);
         param4[0].updateParent(param1);
         param4[4].updateParent(param1);
         param4[7].updateParent(param1);
      }
   }
}
