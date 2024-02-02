package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.binding.RepeaterItemWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _MessagesConversationViewWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _MessagesConversationViewWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MessagesConversationView.watcherSetupUtil = new _MessagesConversationViewWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[10] = new PropertyWatcher("longDateDisplay",{"propertyChange":true},[param3[5]],param2);
         param4[3] = new PropertyWatcher("repMessages",{"propertyChange":true},[param3[2],param3[3],param3[4],param3[5],param3[6],param3[7]],param2);
         param4[4] = new PropertyWatcher("dataProvider",{"collectionChange":true},[param3[2],param3[3],param3[4],param3[5],param3[6],param3[7]],null);
         param4[5] = new RepeaterItemWatcher(param4[4]);
         param4[13] = new PropertyWatcher("attachmentsAC",null,[param3[7]],null);
         param4[12] = new PropertyWatcher("body",null,[param3[6]],null);
         param4[6] = new PropertyWatcher("fromName",null,[param3[2],param3[3]],null);
         param4[9] = new PropertyWatcher("date",null,[param3[4],param3[5]],null);
         param4[16] = new PropertyWatcher("replyText",{"propertyChange":true},[param3[16],param3[10]],param2);
         param4[17] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[16],param3[10]],null);
         param4[7] = new PropertyWatcher("shortDateDisplay",{"propertyChange":true},[param3[4]],param2);
         param4[20] = new PropertyWatcher("reply",{"propertyChange":true},[param3[16],param3[21]],param2);
         param4[22] = new PropertyWatcher("attachmentsAC",{"propertyChange":true},[param3[21]],null);
         param4[21] = new PropertyWatcher("sendPending",{"propertyChange":true},[param3[16]],null);
         param4[0] = new PropertyWatcher("conversation",{"propertyChange":true},[param3[17],param3[0],param3[1],param3[19],param3[18],param3[20],param3[8],param3[9],param3[12],param3[13],param3[14],param3[15]],param2);
         param4[1] = new PropertyWatcher("subject",{"propertyChange":true},[param3[0]],null);
         param4[14] = new PropertyWatcher("conversationId",{"propertyChange":true},[param3[8]],null);
         param4[15] = new PropertyWatcher("disableReplies",{"propertyChange":true},[param3[17],param3[19],param3[18],param3[20],param3[9],param3[12],param3[13],param3[14],param3[15]],null);
         param4[2] = new PropertyWatcher("messageListAC",{"propertyChange":true},[param3[1]],null);
         param4[10].updateParent(param1);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[4]);
         param4[4].addChild(param4[5]);
         param4[5].addChild(param4[13]);
         param4[5].addChild(param4[12]);
         param4[5].addChild(param4[6]);
         param4[5].addChild(param4[9]);
         param4[16].updateParent(param1);
         param4[16].addChild(param4[17]);
         param4[7].updateParent(param1);
         param4[20].updateParent(param1);
         param4[20].addChild(param4[22]);
         param4[20].addChild(param4[21]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[14]);
         param4[0].addChild(param4[15]);
         param4[0].addChild(param4[2]);
      }
   }
}
