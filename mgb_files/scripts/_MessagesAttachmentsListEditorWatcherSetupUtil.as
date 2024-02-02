package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _MessagesAttachmentsListEditorWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _MessagesAttachmentsListEditorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MessagesAttachmentsListEditor.watcherSetupUtil = new _MessagesAttachmentsListEditorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[4] = new PropertyWatcher("attachmentsAC",{"propertyChange":true},[param3[4],param3[5],param3[7],param3[8],param3[9],param3[10],param3[11]],param2);
         param4[5] = new PropertyWatcher("length",{"collectionChange":true},[param3[4],param3[5],param3[7],param3[8],param3[9],param3[10]],null);
         param4[3] = new PropertyWatcher("showInEditMode",{"propertyChange":true},[param3[2],param3[33],param3[3],param3[5],param3[6],param3[8],param3[9],param3[26],param3[29],param3[31],param3[30]],param2);
         param4[7] = new PropertyWatcher("showAttachments",{"propertyChange":true},[param3[12],param3[13]],param2);
         param4[8] = new PropertyWatcher("selected",{
            "valueCommit":true,
            "click":true
         },[param3[12],param3[13]],null);
         param4[9] = new PropertyWatcher("myEffect",{"propertyChange":true},[param3[14]],param2);
         param4[0] = new PropertyWatcher("repAttachments",{"propertyChange":true},[param3[34],param3[0],param3[35],param3[1],param3[32],param3[15],param3[17],param3[16],param3[19],param3[18],param3[21],param3[20],param3[23],param3[22],param3[25],param3[24],param3[27],param3[28],param3[31],param3[30]],param2);
         param4[1] = new PropertyWatcher("currentItem",{"nextRepeaterItem":true},[param3[34],param3[0],param3[35],param3[1],param3[32],param3[15],param3[17],param3[16],param3[19],param3[18],param3[21],param3[20],param3[23],param3[22],param3[25],param3[24],param3[27],param3[28],param3[31],param3[30]],null);
         param4[13] = new PropertyWatcher("project",{"propertyChange":true},[param3[21]],null);
         param4[10] = new PropertyWatcher("showItemImage",null,[param3[17],param3[16]],null);
         param4[19] = new PropertyWatcher("showCommentField",null,[param3[31],param3[30]],null);
         param4[15] = new PropertyWatcher("itemName",{"propertyChange":true},[param3[23]],null);
         param4[21] = new PropertyWatcher("isFriendRequest",null,[param3[34],param3[35]],null);
         param4[16] = new PropertyWatcher("flags",{"propertyChange":true},[param3[24]],null);
         param4[2] = new PropertyWatcher("showAttachmentHider",null,[param3[0],param3[1]],null);
         param4[14] = new PropertyWatcher("itemType",{"propertyChange":true},[param3[22],param3[27],param3[28]],null);
         param4[18] = new PropertyWatcher("canBeGiven",null,[param3[25]],null);
         param4[12] = new PropertyWatcher("userName",{"propertyChange":true},[param3[20]],null);
         param4[11] = new PropertyWatcher("showItemDescription",null,[param3[19],param3[18]],null);
         param4[20] = new PropertyWatcher("comment",{"propertyChange":true},[param3[32]],null);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[5]);
         param4[3].updateParent(param1);
         param4[7].updateParent(param1);
         param4[7].addChild(param4[8]);
         param4[9].updateParent(param1);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[1].addChild(param4[13]);
         param4[1].addChild(param4[10]);
         param4[1].addChild(param4[19]);
         param4[1].addChild(param4[15]);
         param4[1].addChild(param4[21]);
         param4[1].addChild(param4[16]);
         param4[1].addChild(param4[2]);
         param4[1].addChild(param4[14]);
         param4[1].addChild(param4[18]);
         param4[1].addChild(param4[12]);
         param4[1].addChild(param4[11]);
         param4[1].addChild(param4[20]);
      }
   }
}
