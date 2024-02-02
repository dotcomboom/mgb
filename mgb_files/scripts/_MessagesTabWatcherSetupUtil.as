package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _MessagesTabWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _MessagesTabWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MessagesTab.watcherSetupUtil = new _MessagesTabWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[2] = new PropertyWatcher("mgbConversationsList",{"propertyChange":true},[param3[4],param3[5],param3[6]],param2);
         param4[3] = new PropertyWatcher("state",{"propertyChange":true},[param3[4],param3[5]],null);
         param4[5] = new PropertyWatcher("listAC",{"propertyChange":true},[param3[6]],null);
         param4[6] = new PropertyWatcher("selectedConversation",{"propertyChange":true},[param3[7]],param2);
         param4[0] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[0],param3[1],param3[2],param3[3]],param2);
         param4[1] = new PropertyWatcher("authenticatedName",{"propertyChange":true},[param3[0],param3[1],param3[2],param3[3]],null);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[3]);
         param4[2].addChild(param4[5]);
         param4[6].updateParent(param1);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
      }
   }
}
