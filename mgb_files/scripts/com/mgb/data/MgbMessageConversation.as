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
   
   public class MgbMessageConversation extends EventDispatcher
   {
       
      
      private var _207396552_isFriendRequest:Boolean = false;
      
      private var _messageList:Array;
      
      private var _265713450username:String;
      
      private var _1767599065messageListAC:ArrayCollection;
      
      private var _1676095234conversationId:String;
      
      private var _141943009_disableReplies:Boolean = false;
      
      private var _490339309_subject:String = "";
      
      public function MgbMessageConversation(param1:String, param2:String, param3:IEventDispatcher = null)
      {
         _messageList = new Array();
         _1767599065messageListAC = new ArrayCollection(_messageList);
         super(param3);
         this.username = param1;
         this.conversationId = param2;
      }
      
      public function get disableReplies() : Boolean
      {
         return _disableReplies;
      }
      
      [Bindable(event="propertyChange")]
      private function get _subject() : String
      {
         return this._490339309_subject;
      }
      
      private function set _1625444096disableReplies(param1:Boolean) : void
      {
         _disableReplies = param1;
      }
      
      public function set conversationId(param1:String) : void
      {
         var _loc2_:Object = this._1676095234conversationId;
         if(_loc2_ !== param1)
         {
            this._1676095234conversationId = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"conversationId",_loc2_,param1));
         }
      }
      
      private function set _disableReplies(param1:Boolean) : void
      {
         var _loc2_:Object = this._141943009_disableReplies;
         if(_loc2_ !== param1)
         {
            this._141943009_disableReplies = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_disableReplies",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _isFriendRequest() : Boolean
      {
         return this._207396552_isFriendRequest;
      }
      
      public function get buddyname() : String
      {
         var _loc1_:MgbMessage = null;
         for each(_loc1_ in messageListAC)
         {
            if(_loc1_.toName != _loc1_.fromName)
            {
               return _loc1_.toName == username ? _loc1_.fromName : _loc1_.toName;
            }
         }
         trace("likely error - buddyname is same as username (" + username + ")");
         return username;
      }
      
      private function set _1867885268subject(param1:String) : void
      {
         _subject = param1;
      }
      
      public function deleteConversation() : void
      {
         var _loc1_:HTTPService = new HTTPService();
         _loc1_.url = MgbSystem.idServerUrl + "/user/flex_delete_message_thread";
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.addEventListener("result",deleteConversationResultHandler);
         _loc1_.addEventListener("fault",deleteConversationFaultHandler);
         _loc1_.contentType = "application/x-www-form-urlencoded";
         var _loc2_:Object = new Object();
         _loc2_.recipient = username;
         _loc2_.conversationid = conversationId;
         _loc1_.send(_loc2_);
      }
      
      public function get isFriendRequest() : Boolean
      {
         return _isFriendRequest;
      }
      
      private function set _isFriendRequest(param1:Boolean) : void
      {
         var _loc2_:Object = this._207396552_isFriendRequest;
         if(_loc2_ !== param1)
         {
            this._207396552_isFriendRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_isFriendRequest",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set disableReplies(param1:Boolean) : void
      {
         var _loc2_:Object = this.disableReplies;
         if(_loc2_ !== param1)
         {
            this._1625444096disableReplies = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"disableReplies",_loc2_,param1));
         }
      }
      
      private function set _subject(param1:String) : void
      {
         var _loc2_:Object = this._490339309_subject;
         if(_loc2_ !== param1)
         {
            this._490339309_subject = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_subject",_loc2_,param1));
         }
      }
      
      public function refresh() : void
      {
         var _loc1_:HTTPService = new HTTPService();
         _loc1_.url = MgbSystem.idServerUrl + "/user/flex_get_message_thread";
         _loc1_.useProxy = false;
         _loc1_.method = "POST";
         _loc1_.addEventListener("result",getConversationResultHandler);
         _loc1_.addEventListener("fault",getConversationFaultHandler);
         _loc1_.contentType = "application/x-www-form-urlencoded";
         var _loc2_:Object = new Object();
         _loc2_.recipient = username;
         _loc2_.conversationid = conversationId;
         _loc1_.send(_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      public function get username() : String
      {
         return this._265713450username;
      }
      
      [Bindable(event="propertyChange")]
      private function get _disableReplies() : Boolean
      {
         return this._141943009_disableReplies;
      }
      
      private function getConversationFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Could not get Conversation. Error message was \'" + param1.fault.faultString + "\'");
      }
      
      private function updateSubject() : void
      {
         subject = messageListAC.length > 0 ? String(MgbMessage(messageListAC.getItemAt(0)).subject) : "";
      }
      
      public function addMessageToConversation(param1:MgbMessage) : void
      {
         var _loc2_:MgbMessage = param1.clone();
         messageListAC.addItem(_loc2_);
         updateSubject();
         dispatchEvent(new Event("gotNewRows"));
         MgbCaches.getInstance().messageConversationsList.processNewMessage(_loc2_);
      }
      
      private function set _1463503111isFriendRequest(param1:Boolean) : void
      {
         _isFriendRequest = param1;
      }
      
      public function set messageListAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1767599065messageListAC;
         if(_loc2_ !== param1)
         {
            this._1767599065messageListAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageListAC",_loc2_,param1));
         }
      }
      
      public function get subject() : String
      {
         return _subject;
      }
      
      [Bindable(event="propertyChange")]
      public function get messageListAC() : ArrayCollection
      {
         return this._1767599065messageListAC;
      }
      
      [Bindable(event="propertyChange")]
      public function set isFriendRequest(param1:Boolean) : void
      {
         var _loc2_:Object = this.isFriendRequest;
         if(_loc2_ !== param1)
         {
            this._1463503111isFriendRequest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isFriendRequest",_loc2_,param1));
         }
      }
      
      private function getConversationResultHandler(param1:ResultEvent) : void
      {
         var _loc2_:ArrayCollection = null;
         var _loc3_:Object = null;
         var _loc4_:MgbMessage = null;
         var _loc5_:MgbMessageAttachment = null;
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
         messageListAC.removeAll();
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = new MgbMessage(_loc3_.fromname,_loc3_.toname,_loc3_.subject,TimeUtils.railsDatetimeToFlexDate(_loc3_.date),_loc3_.body,_loc3_.conversationid,_loc3_.messageid)).unmarshalMessageAttachments(_loc3_.attachmentsblob);
            messageListAC.addItem(_loc4_);
            for each(_loc5_ in _loc4_.attachmentsAC)
            {
               if(_loc5_.isFriendRequest)
               {
                  this.disableReplies = true;
                  this.isFriendRequest = true;
               }
            }
         }
         updateSubject();
         dispatchEvent(new Event("gotNewRows"));
      }
      
      private function deleteConversationFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logError("Could not delete Conversation. Error message was \'" + param1.fault.faultString + "\'",true);
      }
      
      [Bindable(event="propertyChange")]
      public function set subject(param1:String) : void
      {
         var _loc2_:Object = this.subject;
         if(_loc2_ !== param1)
         {
            this._1867885268subject = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subject",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get conversationId() : String
      {
         return this._1676095234conversationId;
      }
      
      private function deleteConversationResultHandler(param1:ResultEvent) : void
      {
         MgbCaches.getInstance().messageConversationsList.forgetConversation(this.username,this.conversationId);
      }
   }
}
