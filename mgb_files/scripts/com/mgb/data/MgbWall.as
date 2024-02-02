package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.events.*;
   import mx.collections.*;
   import mx.controls.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.*;
   import mx.utils.*;
   
   public class MgbWall extends EventDispatcher
   {
       
      
      private var _1074221801wallpostsListAC:ArrayCollection;
      
      private var _wallpostsList:Array;
      
      private var _820081177recipient:String;
      
      private var _818143141_refreshPending:Boolean = false;
      
      public function MgbWall(param1:String, param2:IEventDispatcher = null)
      {
         _wallpostsList = new Array();
         _1074221801wallpostsListAC = new ArrayCollection(_wallpostsList);
         super(param2);
         this.recipient = param1;
      }
      
      private function addWallpostResultHandler(param1:ResultEvent) : void
      {
         if(Boolean(param1.result.status) && param1.result.status == 0)
         {
            Alert.show("Could not register wall post on server, try again later");
         }
         else
         {
            refresh();
         }
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
      
      public function set wallpostsListAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1074221801wallpostsListAC;
         if(_loc2_ !== param1)
         {
            this._1074221801wallpostsListAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wallpostsListAC",_loc2_,param1));
         }
      }
      
      private function addWallpostFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Unable to register wall post on server, try again later. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      [Bindable(event="propertyChange")]
      public function get recipient() : String
      {
         return this._820081177recipient;
      }
      
      private function getWallpostsResultHandler(param1:ResultEvent) : void
      {
         var _loc2_:ArrayCollection = null;
         var _loc3_:Object = null;
         var _loc4_:Sort = null;
         refreshPending = false;
         if(Boolean(param1.result.wallposts) && param1.result.wallposts.wallpost != null)
         {
            if(param1.result.wallposts.wallpost is ObjectProxy)
            {
               _loc2_ = new ArrayCollection(new Array());
               _loc2_.addItem(param1.result.wallposts.wallpost);
            }
            else
            {
               _loc2_ = param1.result.wallposts.wallpost;
            }
         }
         wallpostsListAC.removeAll();
         for each(_loc3_ in _loc2_)
         {
            wallpostsListAC.addItem(new MgbWallpost(_loc3_.recipient,_loc3_.fromname,_loc3_.body,_loc3_.postid,TimeUtils.railsDatetimeToFlexDate(_loc3_.date)));
         }
         (_loc4_ = new Sort()).fields = [new SortField("date",false,true)];
         wallpostsListAC.sort = _loc4_;
         wallpostsListAC.refresh();
         dispatchEvent(new Event("gotNewRows"));
      }
      
      public function refresh() : void
      {
         var _loc1_:HTTPService = null;
         var _loc2_:Object = null;
         if(!refreshPending)
         {
            refreshPending = true;
            _loc1_ = new HTTPService();
            _loc1_.url = MgbSystem.idServerUrl + "/user/flex_get_wallposts";
            _loc1_.useProxy = false;
            _loc1_.method = "POST";
            _loc1_.addEventListener("result",getWallpostsResultHandler);
            _loc1_.addEventListener("fault",getWallpostsFaultHandler);
            _loc1_.contentType = "application/x-www-form-urlencoded";
            _loc2_ = new Object();
            _loc2_.recipient = recipient;
            _loc1_.send(_loc2_);
         }
      }
      
      private function deleteWallpostFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Unable to delete wall post on server, try again later. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      [Bindable(event="propertyChange")]
      private function get _refreshPending() : Boolean
      {
         return this._818143141_refreshPending;
      }
      
      [Bindable(event="propertyChange")]
      public function get wallpostsListAC() : ArrayCollection
      {
         return this._1074221801wallpostsListAC;
      }
      
      public function addWallpost(param1:String, param2:String) : void
      {
         var _loc3_:HTTPService = new HTTPService();
         _loc3_.url = MgbSystem.idServerUrl + "/user/flex_add_wallpost";
         _loc3_.useProxy = false;
         _loc3_.method = "POST";
         _loc3_.addEventListener("result",addWallpostResultHandler);
         _loc3_.addEventListener("fault",addWallpostFaultHandler);
         _loc3_.contentType = "application/x-www-form-urlencoded";
         var _loc4_:Object;
         (_loc4_ = new Object()).recipient = this.recipient;
         _loc4_.fromname = param1;
         _loc4_.postid = UIDUtil.createUID();
         _loc4_.body = param2;
         _loc3_.send(_loc4_);
      }
      
      public function set recipient(param1:String) : void
      {
         var _loc2_:Object = this._820081177recipient;
         if(_loc2_ !== param1)
         {
            this._820081177recipient = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recipient",_loc2_,param1));
         }
      }
      
      public function deleteWallpost(param1:String) : void
      {
         var _loc2_:HTTPService = new HTTPService();
         _loc2_.url = MgbSystem.idServerUrl + "/user/flex_delete_wallpost";
         _loc2_.useProxy = false;
         _loc2_.method = "POST";
         _loc2_.addEventListener("result",deleteWallpostResultHandler);
         _loc2_.addEventListener("fault",deleteWallpostFaultHandler);
         _loc2_.contentType = "application/x-www-form-urlencoded";
         var _loc3_:Object = new Object();
         _loc3_.postid = param1;
         _loc2_.send(_loc3_);
      }
      
      private function set _1993323068refreshPending(param1:Boolean) : void
      {
         _refreshPending = param1;
      }
      
      private function deleteWallpostResultHandler(param1:ResultEvent) : void
      {
         if(Boolean(param1.result.status) && param1.result.status == 0)
         {
            Alert.show("Could not delete wall post on server, try again later");
         }
         else
         {
            refresh();
         }
      }
      
      private function getWallpostsFaultHandler(param1:FaultEvent) : void
      {
         refreshPending = false;
         MgbLogger.getInstance().logBug("Could not get Wall for " + recipient + ". Error message was \'" + param1.fault.faultString + "\'");
      }
      
      public function get refreshPending() : Boolean
      {
         return _refreshPending;
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
   }
}
