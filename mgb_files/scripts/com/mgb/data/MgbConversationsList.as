package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.events.*;
   import mx.collections.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.*;
   import mx.utils.*;
   
   public class MgbConversationsList extends EventDispatcher
   {
      
      public static const state_LISTREADY:int = 1;
      
      public static const state_LOADINGLIST:int = 2;
      
      public static const EVENT_LOAD_COMPLETE:String = "MgbConversationsListLoadComplete";
       
      
      private var _state:int = 1;
      
      private var lastPollForListUpdates:Date;
      
      private var _176148907_userName:String;
      
      private var list:Array;
      
      private var loadSuccessful:Boolean = false;
      
      private var _1260658248mgbLogger:MgbLogger;
      
      private var autoRefresh:Boolean = false;
      
      private var _1102509760listAC:ArrayCollection;
      
      public function MgbConversationsList()
      {
         _1102509760listAC = new ArrayCollection(list);
         list = new Array();
         _1260658248mgbLogger = MgbLogger.getInstance();
         super();
      }
      
      private function set _109757585state(param1:int) : void
      {
         _state = param1;
      }
      
      private function signalLoadComplete() : void
      {
         state = state_LISTREADY;
         loadSuccessful = true;
         dispatchEvent(new Event(PieceList.EVENT_LOAD_COMPLETE));
         listAC.refresh();
      }
      
      private function getConversationsFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Could not get Conversations. Error message was \'" + param1.fault.faultString + "\'");
         state = state_LISTREADY;
      }
      
      private function set _266666762userName(param1:String) : void
      {
         _userName = param1;
      }
      
      public function clear() : void
      {
         state = state_LISTREADY;
         userName = null;
         autoRefresh = false;
         listAC.removeAll();
         loadSuccessful = false;
      }
      
      [Bindable(event="propertyChange")]
      public function get listAC() : ArrayCollection
      {
         return this._1102509760listAC;
      }
      
      public function forgetConversation(param1:String, param2:String) : void
      {
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < listAC.length)
         {
            if((_loc4_ = listAC.getItemAt(_loc3_)).conversationId == param2)
            {
               listAC.removeItemAt(_loc3_);
               return;
            }
            _loc3_++;
         }
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      [Bindable(event="propertyChange")]
      private function get _userName() : String
      {
         return this._176148907_userName;
      }
      
      public function processNewMessage(param1:MgbMessage) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in listAC)
         {
            if(_loc2_.conversationId == param1.conversationId)
            {
               if(param1.date > _loc2_.date)
               {
                  _loc2_.preview = param1.fromName + ": \'" + param1.body + "\'";
                  listAC.refresh();
               }
               return;
            }
         }
         listAC.addItem({
            "conversationId":param1.conversationId,
            "date":param1.date,
            "subject":param1.subject,
            "unread":1,
            "from":(param1.fromName == MgbSession.getInstance().authenticatedName ? param1.toName : param1.fromName),
            "preview":param1.fromName + ": \'" + param1.body + "\'"
         });
      }
      
      private function getConversations() : void
      {
         var _loc1_:HTTPService = new HTTPService();
         _loc1_.url = MgbSystem.idServerUrl + "/user/flex_get_conversations";
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.addEventListener("result",getConversationsResultHandler);
         _loc1_.addEventListener("fault",getConversationsFaultHandler);
         _loc1_.contentType = "application/x-www-form-urlencoded";
         var _loc2_:Object = new Object();
         _loc2_.username = userName;
         _loc1_.send(_loc2_);
      }
      
      public function set listAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1102509760listAC;
         if(_loc2_ !== param1)
         {
            this._1102509760listAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listAC",_loc2_,param1));
         }
      }
      
      public function ready() : Boolean
      {
         return state == state_LISTREADY && loadSuccessful == true;
      }
      
      public function load(param1:String, param2:Boolean = true) : void
      {
         if(state != state_LOADINGLIST)
         {
            state = state_LOADINGLIST;
            this.userName = param1;
            this.autoRefresh = param2;
            listAC.removeAll();
            loadSuccessful = false;
            getConversations();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set state(param1:int) : void
      {
         var _loc2_:Object = this.state;
         if(_loc2_ !== param1)
         {
            this._109757585state = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"state",_loc2_,param1));
         }
      }
      
      private function set _userName(param1:String) : void
      {
         var _loc2_:Object = this._176148907_userName;
         if(_loc2_ !== param1)
         {
            this._176148907_userName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userName",_loc2_,param1));
         }
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      private function set mgbLogger(param1:MgbLogger) : void
      {
         var _loc2_:Object = this._1260658248mgbLogger;
         if(_loc2_ !== param1)
         {
            this._1260658248mgbLogger = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbLogger",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbLogger() : MgbLogger
      {
         return this._1260658248mgbLogger;
      }
      
      private function getConversationsResultHandler(param1:ResultEvent) : void
      {
         var _loc2_:ArrayCollection = null;
         var _loc3_:Object = null;
         var _loc4_:Sort = null;
         if(Boolean(param1.result.messages) && param1.result.messages.message != null)
         {
            if(param1.result.messages.message is ObjectProxy)
            {
               _loc2_ = new ArrayCollection(new Array());
               _loc2_.addItem(param1.result.messages.message);
            }
            else
            {
               _loc2_ = param1.result.messages.message;
            }
         }
         listAC.removeAll();
         for each(_loc3_ in _loc2_)
         {
            listAC.addItem({
               "conversationId":_loc3_.conversationid,
               "date":TimeUtils.railsDatetimeToFlexDate(_loc3_.date),
               "subject":_loc3_.subject,
               "unread":_loc3_.unread,
               "from":(_loc3_.fromname == userName ? _loc3_.toname : _loc3_.fromname),
               "preview":_loc3_.fromname + ": \'" + _loc3_.body + "\'"
            });
         }
         (_loc4_ = new Sort()).fields = [new SortField("date",false,true)];
         listAC.sort = _loc4_;
         listAC.refresh();
         state = state_LISTREADY;
      }
      
      [Bindable(event="propertyChange")]
      public function set userName(param1:String) : void
      {
         var _loc2_:Object = this.userName;
         if(_loc2_ !== param1)
         {
            this._266666762userName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userName",_loc2_,param1));
         }
      }
   }
}
