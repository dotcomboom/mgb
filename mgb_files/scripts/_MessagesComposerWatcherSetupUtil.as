package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _MessagesComposerWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _MessagesComposerWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MessagesComposer.watcherSetupUtil = new _MessagesComposerWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[8] = new PropertyWatcher("friendsNamesAC",{"propertyChange":true},[param3[1]],param2);
         param4[5] = new PropertyWatcher("toNameInput",{"propertyChange":true},[param3[0]],param2);
         param4[6] = new PropertyWatcher("text",{
            "valueCommit":true,
            "collectionChange":true,
            "change":false
         },[param3[0]],null);
         param4[0] = new PropertyWatcher("bodyText",{"propertyChange":true},[param3[0],param3[4]],param2);
         param4[1] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[0],param3[4]],null);
         param4[3] = new PropertyWatcher("msg",{"propertyChange":true},[param3[0],param3[6]],param2);
         param4[12] = new PropertyWatcher("attachmentsAC",{"propertyChange":true},[param3[6]],null);
         param4[4] = new PropertyWatcher("sendPending",{"propertyChange":true},[param3[0]],null);
         param4[8].updateParent(param1);
         param4[5].updateParent(param1);
         param4[5].addChild(param4[6]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[12]);
         param4[3].addChild(param4[4]);
      }
   }
}
