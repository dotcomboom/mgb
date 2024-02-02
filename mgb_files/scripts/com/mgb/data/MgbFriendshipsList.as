package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.events.*;
   import mx.collections.*;
   import mx.controls.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.AsyncToken;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.*;
   import mx.utils.*;
   
   public class MgbFriendshipsList extends EventDispatcher
   {
       
      
      private var _1172978567friendshipsListAC:ArrayCollection;
      
      private var _818143141_refreshPending:Boolean = false;
      
      private var _friendshipsList:Array;
      
      private var _265713450username:String;
      
      public function MgbFriendshipsList(param1:String, param2:IEventDispatcher = null)
      {
         _friendshipsList = new Array();
         _1172978567friendshipsListAC = new ArrayCollection(_friendshipsList);
         super(param2);
         this.username = param1;
      }
      
      private function set _refreshPending(param1:Boolean) : void
      {
         var _loc2_:Object = this._818143141_refreshPending;
         if(_loc2_ !== param1)
         {
            this._818143141_refreshPending = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_refreshPending",_loc2_,param1));
         }
      }
      
      private function deleteFriendshipResultHandler(param1:ResultEvent) : void
      {
         if(Boolean(param1.result.status) && param1.result.status == 0)
         {
            Alert.show("Could not delete friendship on server, try again later");
         }
         else
         {
            refresh();
         }
      }
      
      private function addFriendshipFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Unable to register friendship on server, try again later. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      public function get refreshPending() : Boolean
      {
         return _refreshPending;
      }
      
      private function deleteFriendshipFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Unable to delete friendship on server, try again later. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      private function addFriendshipResultHandler(param1:ResultEvent) : void
      {
         var _loc2_:AsyncToken = null;
         if(Boolean(param1.result.status) && param1.result.status == 0)
         {
            Alert.show("Could not register friendship on server, try again later");
         }
         else
         {
            refresh();
            _loc2_ = param1.token;
            this.dispatchEvent(new MgbFriendshipEvent(MgbFriendshipEvent.FRIENDSHIP_ESTABLISHED,_loc2_.fr_username,_loc2_.fr_friendname,_loc2_.fr_conversationId));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get username() : String
      {
         return this._265713450username;
      }
      
      public function addFriendship(param1:String, param2:String) : void
      {
         var _loc3_:HTTPService = new HTTPService();
         _loc3_.url = MgbSystem.idServerUrl + "/user/flex_add_friendship";
         _loc3_.useProxy = false;
         _loc3_.method = "POST";
         _loc3_.addEventListener("result",addFriendshipResultHandler);
         _loc3_.addEventListener("fault",addFriendshipFaultHandler);
         _loc3_.contentType = "application/x-www-form-urlencoded";
         var _loc4_:Object;
         (_loc4_ = new Object()).username = this.username;
         _loc4_.friendname = param1;
         var _loc5_:AsyncToken;
         (_loc5_ = _loc3_.send(_loc4_)).fr_username = _loc4_.username;
         _loc5_.fr_friendname = _loc4_.friendname;
         _loc5_.fr_conversationId = param2;
      }
      
      [Bindable(event="propertyChange")]
      private function get _refreshPending() : Boolean
      {
         return this._818143141_refreshPending;
      }
      
      public function deleteFriendship(param1:String) : void
      {
         var _loc2_:HTTPService = new HTTPService();
         _loc2_.url = MgbSystem.idServerUrl + "/user/flex_delete_friendship";
         _loc2_.useProxy = false;
         _loc2_.method = "POST";
         _loc2_.addEventListener("result",deleteFriendshipResultHandler);
         _loc2_.addEventListener("fault",deleteFriendshipFaultHandler);
         _loc2_.contentType = "application/x-www-form-urlencoded";
         var _loc3_:Object = new Object();
         _loc3_.username = this.username;
         _loc3_.friendname = param1;
         _loc2_.send(_loc3_);
      }
      
      public function refresh() : void
      {
         var _loc1_:HTTPService = null;
         var _loc2_:Object = null;
         if(!refreshPending)
         {
            refreshPending = true;
            _loc1_ = new HTTPService();
            _loc1_.url = MgbSystem.idServerUrl + "/user/flex_list_friendships";
            _loc1_.useProxy = false;
            _loc1_.method = "POST";
            _loc1_.addEventListener("result",getFriendshipListResultHandler);
            _loc1_.addEventListener("fault",getFriendshipListFaultHandler);
            _loc1_.contentType = "application/x-www-form-urlencoded";
            _loc2_ = new Object();
            _loc2_.username = username;
            _loc1_.send(_loc2_);
         }
      }
      
      public function set username(param1:String) : void
      {
         var _loc2_:Object = this._265713450username;
         if(_loc2_ !== param1)
         {
            this._265713450username = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"username",_loc2_,param1));
         }
      }
      
      public function set friendshipsListAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1172978567friendshipsListAC;
         if(_loc2_ !== param1)
         {
            this._1172978567friendshipsListAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendshipsListAC",_loc2_,param1));
         }
      }
      
      private function getFriendshipListFaultHandler(param1:FaultEvent) : void
      {
         refreshPending = false;
         MgbLogger.getInstance().logBug("Could not get Friends list for " + username + ". Error message was \'" + param1.fault.faultString + "\'");
      }
      
      [Bindable(event="propertyChange")]
      public function set refreshPending(param1:Boolean) : void
      {
         var _loc2_:Object = this.refreshPending;
         if(_loc2_ !== param1)
         {
            this._1993323068refreshPending = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"refreshPending",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get friendshipsListAC() : ArrayCollection
      {
         return this._1172978567friendshipsListAC;
      }
      
      private function set _1993323068refreshPending(param1:Boolean) : void
      {
         _refreshPending = param1;
      }
      
      private function getFriendshipListResultHandler(param1:ResultEvent) : void
      {
         var _loc2_:ArrayCollection = null;
         var _loc3_:Object = null;
         refreshPending = false;
         if(Boolean(param1.result.friends) && param1.result.friends.friend != null)
         {
            if(param1.result.friends.friend is ObjectProxy)
            {
               _loc2_ = new ArrayCollection(new Array());
               _loc2_.addItem(param1.result.friends.friend);
            }
            else
            {
               _loc2_ = param1.result.friends.friend;
            }
         }
         friendshipsListAC.removeAll();
         for each(_loc3_ in _loc2_)
         {
            friendshipsListAC.addItem(new MgbFriendship(_loc3_.username,_loc3_.friendname,TimeUtils.railsDatetimeToFlexDate(_loc3_.friendingdate)));
         }
         dispatchEvent(new Event("gotNewRows"));
      }
   }
}
