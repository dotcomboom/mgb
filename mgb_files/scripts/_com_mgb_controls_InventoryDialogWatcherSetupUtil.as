package
{
   import com.mgb.controls.InventoryDialog;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_controls_InventoryDialogWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_controls_InventoryDialogWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InventoryDialog.watcherSetupUtil = new _com_mgb_controls_InventoryDialogWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[12] = new PropertyWatcher("inventory",{"propertyChange":true},[param3[11],param3[12],param3[13]],param2);
         param4[13] = new PropertyWatcher("fullEquipmentEffectSummary",{"propertyChange":true},[param3[11]],null);
         param4[14] = new PropertyWatcher("invAC",{"propertyChange":true},[param3[12],param3[13]],null);
         param4[1] = new PropertyWatcher("pan1",{"propertyChange":true},[param3[1],param3[2]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[1]],null);
         param4[3] = new PropertyWatcher("width",{"widthChanged":true},[param3[2]],null);
         param4[0] = new PropertyWatcher("borderImgCls",{"propertyChange":true},[param3[0]],param2);
         param4[4] = new PropertyWatcher("activeTabTileList",{"propertyChange":true},[param3[3],param3[4],param3[5],param3[6],param3[7],param3[8],param3[9],param3[10]],param2);
         param4[5] = new PropertyWatcher("selectedItem",{
            "valueCommit":true,
            "change":true
         },[param3[3],param3[4],param3[5],param3[6],param3[7],param3[8],param3[9],param3[10]],null);
         param4[9] = new PropertyWatcher("equippable",null,[param3[7]],null);
         param4[11] = new PropertyWatcher("usable",null,[param3[8]],null);
         param4[6] = new PropertyWatcher("description",null,[param3[4]],null);
         param4[10] = new PropertyWatcher("autoEquippable",null,[param3[7],param3[9],param3[10]],null);
         param4[8] = new PropertyWatcher("equipped",null,[param3[6]],null);
         param4[7] = new PropertyWatcher("equipDescription",null,[param3[5]],null);
         param4[12].updateParent(param1);
         param4[12].addChild(param4[13]);
         param4[12].addChild(param4[14]);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[2]);
         param4[1].addChild(param4[3]);
         param4[0].updateParent(param1);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[5]);
         param4[5].addChild(param4[9]);
         param4[5].addChild(param4[11]);
         param4[5].addChild(param4[6]);
         param4[5].addChild(param4[10]);
         param4[5].addChild(param4[8]);
         param4[5].addChild(param4[7]);
      }
   }
}
