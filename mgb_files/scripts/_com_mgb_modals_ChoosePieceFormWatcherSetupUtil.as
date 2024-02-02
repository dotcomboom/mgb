package
{
   import com.mgb.modals.ChoosePieceForm;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_mgb_modals_ChoosePieceFormWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_mgb_modals_ChoosePieceFormWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChoosePieceForm.watcherSetupUtil = new _com_mgb_modals_ChoosePieceFormWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("action",{"propertyChange":true},[param3[0],param3[1]],param2);
         param4[1] = new PropertyWatcher("label",{"labelChanged":true},[param3[0]],null);
         param4[7] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[9],param3[10],param3[12],param3[13]],param2);
         param4[10] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[12],param3[13]],null);
         param4[8] = new PropertyWatcher("overQuota",{"propertyChange":true},[param3[9],param3[10]],null);
         param4[14] = new PropertyWatcher("chosenAC",{"propertyChange":true},[param3[17]],param2);
         param4[2] = new PropertyWatcher("pieceType",{"propertyChange":true},[param3[0],param3[2],param3[7],param3[8]],param2);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[7].updateParent(param1);
         param4[7].addChild(param4[10]);
         param4[7].addChild(param4[8]);
         param4[14].updateParent(param1);
         param4[2].updateParent(param1);
      }
   }
}
