package
{
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _FriendsListWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _FriendsListWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FriendsList.watcherSetupUtil = new _FriendsListWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[6] = new PropertyWatcher("newFriendName",{"propertyChange":true},[param3[3]],param2);
         param4[7] = new PropertyWatcher("text",{
            "change":false,
            "textChanged":true
         },[param3[3]],null);
         param4[0] = new PropertyWatcher("ownersfriendshipList",{"propertyChange":true},[param3[0],param3[7],param3[8],param3[9]],param2);
         param4[2] = new PropertyWatcher("friendshipsListAC",{"propertyChange":true},[param3[0],param3[9]],null);
         param4[3] = new PropertyWatcher("length",{"collectionChange":true},[param3[0]],null);
         param4[14] = new PropertyWatcher("refreshPending",{"propertyChange":true},[param3[7],param3[8]],null);
         param4[1] = new PropertyWatcher("username",{"propertyChange":true},[param3[0]],null);
         param4[4] = new PropertyWatcher("mgbSession",{"propertyChange":true},[param3[1],param3[2],param3[10]],param2);
         param4[5] = new PropertyWatcher("userLoggedInIsGuest",{"propertyChange":true},[param3[1],param3[2],param3[10]],null);
         param4[9] = new PropertyWatcher("friendRequestMessage",{"propertyChange":true},[param3[3]],param2);
         param4[10] = new PropertyWatcher("sendPending",{"propertyChange":true},[param3[3]],null);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[7]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[2]);
         param4[2].addChild(param4[3]);
         param4[0].addChild(param4[14]);
         param4[0].addChild(param4[1]);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[5]);
         param4[9].updateParent(param1);
         param4[9].addChild(param4[10]);
      }
   }
}
