package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _MessagesConversationItemRendererWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _MessagesConversationItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MessagesConversationItemRenderer.watcherSetupUtil = new _MessagesConversationItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("data",{"dataChange":true},[param3[0],param3[1],param3[2],param3[3],param3[4]],param2);
         param4[6] = new PropertyWatcher("preview",null,[param3[4]],null);
         param4[5] = new PropertyWatcher("subject",null,[param3[3]],null);
         param4[1] = new PropertyWatcher("from",null,[param3[0],param3[1]],null);
         param4[4] = new PropertyWatcher("date",null,[param3[2]],null);
         param4[2] = new PropertyWatcher("dateDisplay",{"propertyChange":true},[param3[2]],param2);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[6]);
         param4[0].addChild(param4[5]);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[4]);
         param4[2].updateParent(param1);
      }
   }
}
