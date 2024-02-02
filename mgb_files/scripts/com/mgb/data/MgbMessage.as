package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.events.EventDispatcher;
   import flash.utils.*;
   import mx.collections.*;
   import mx.controls.*;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.*;
   import mx.rpc.events.*;
   import mx.rpc.http.*;
   import mx.utils.*;
   
   public class MgbMessage extends EventDispatcher
   {
       
      
      private var _1867885268subject:String;
      
      private var _869054554toName:String;
      
      private var _3076014date:Date;
      
      private var _3029410body:String;
      
      private var _1361040911_attachments:Array;
      
      private var _1440013438messageId:String;
      
      private var _1676095234conversationId:String;
      
      private var _1244847787fromName:String;
      
      private var _1506826286attachmentsAC:ArrayCollection;
      
      private var _946059025sendPending:Boolean = false;
      
      public function MgbMessage(param1:String = "", param2:String = "", param3:String = "", param4:Date = null, param5:String = "", param6:String = null, param7:String = null)
      {
         super();
         this.fromName = param1;
         this.toName = param2;
         this.subject = param3;
         this.date = !!param4 ? param4 : new Date();
         this.body = param5;
         this.messageId = !!param7 ? param7 : String(UIDUtil.createUID());
         this.conversationId = !!param6 ? param6 : String(UIDUtil.createUID());
         _attachments = new Array();
         attachmentsAC = new ArrayCollection(_attachments);
      }
      
      [Bindable(event="propertyChange")]
      public function get messageId() : String
      {
         return this._1440013438messageId;
      }
      
      [Bindable(event="propertyChange")]
      public function get subject() : String
      {
         return this._1867885268subject;
      }
      
      public function send(param1:String = null, param2:Boolean = false, param3:String = null) : void
      {
         sendPending = true;
         if(param1 == null || param1 == "")
         {
            this.conversationId = UIDUtil.createUID();
         }
         else
         {
            this.conversationId = param1;
         }
         if(param3 == null || param1 == "")
         {
            this.messageId = UIDUtil.createUID();
         }
         else
         {
            this.messageId = param3;
         }
         var _loc4_:HTTPService;
         (_loc4_ = new HTTPService()).url = MgbSystem.idServerUrl + "/user/flex_send_message";
         _loc4_.useProxy = false;
         _loc4_.method = "POST";
         _loc4_.addEventListener("result",sendMessageResultHandler);
         _loc4_.addEventListener("fault",sendMessageFaultHandler);
         _loc4_.contentType = "application/x-www-form-urlencoded";
         var _loc5_:Object;
         (_loc5_ = new Object()).fromname = fromName;
         _loc5_.toname = toName;
         _loc5_.subject = subject;
         _loc5_.date = date;
         _loc5_.body = body;
         _loc5_.conversationid = this.conversationId;
         _loc5_.messageid = this.messageId;
         if(param2)
         {
            _loc5_.preventcc = "true";
         }
         var _loc6_:String = String(marshalMessageAttachments());
         _loc5_.attachmentsblob = _loc6_;
         _loc4_.send(_loc5_);
      }
      
      public function set messageId(param1:String) : void
      {
         var _loc2_:Object = this._1440013438messageId;
         if(_loc2_ !== param1)
         {
            this._1440013438messageId = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageId",_loc2_,param1));
         }
      }
      
      public function set body(param1:String) : void
      {
         var _loc2_:Object = this._3029410body;
         if(_loc2_ !== param1)
         {
            this._3029410body = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"body",_loc2_,param1));
         }
      }
      
      public function set attachmentsAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1506826286attachmentsAC;
         if(_loc2_ !== param1)
         {
            this._1506826286attachmentsAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"attachmentsAC",_loc2_,param1));
         }
      }
      
      public function clear() : void
      {
         this.fromName = "";
         this.toName = "";
         this.subject = "";
         this.date = new Date();
         this.body = "";
         this.messageId = null;
         this.conversationId = null;
         attachmentsAC.removeAll();
      }
      
      private function sendMessageResultHandler(param1:ResultEvent) : void
      {
         var _loc2_:MessageArrivalEvent = null;
         if(Boolean(param1.result.status) && param1.result.status == 0)
         {
            Alert.show("Unknown recipient for message. Try checking the \'To\' line and trying again");
         }
         else
         {
            this.fromName = param1.result.message.fromname;
            this.toName = param1.result.message.toname;
            this.subject = param1.result.message.subject;
            this.date = TimeUtils.railsDatetimeToFlexDate(param1.result.message.date.value);
            this.body = param1.result.message.body;
            this.conversationId = param1.result.message.conversationid;
            this.messageId = param1.result.message.messageid;
            unmarshalMessageAttachments(param1.result.message.attachmentsblob);
            _loc2_ = new MessageArrivalEvent(MessageArrivalEvent.LOADED,this);
            dispatchEvent(_loc2_);
         }
         sendPending = false;
      }
      
      private function sendMessageFaultHandler(param1:FaultEvent) : void
      {
         MgbLogger.getInstance().logBug("Could not send Message. Error message was \'" + param1.fault.faultString + "\'");
         dispatchEvent(new FaultEvent(FaultEvent.FAULT,false,true,new Fault(param1.fault.faultString,param1.fault.faultString)));
         sendPending = false;
      }
      
      public function set subject(param1:String) : void
      {
         var _loc2_:Object = this._1867885268subject;
         if(_loc2_ !== param1)
         {
            this._1867885268subject = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subject",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get attachmentsAC() : ArrayCollection
      {
         return this._1506826286attachmentsAC;
      }
      
      public function set toName(param1:String) : void
      {
         var _loc2_:Object = this._869054554toName;
         if(_loc2_ !== param1)
         {
            this._869054554toName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toName",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fromName() : String
      {
         return this._1244847787fromName;
      }
      
      public function set sendPending(param1:Boolean) : void
      {
         var _loc2_:Object = this._946059025sendPending;
         if(_loc2_ !== param1)
         {
            this._946059025sendPending = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sendPending",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get body() : String
      {
         return this._3029410body;
      }
      
      public function set date(param1:Date) : void
      {
         var _loc2_:Object = this._3076014date;
         if(_loc2_ !== param1)
         {
            this._3076014date = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"date",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toName() : String
      {
         return this._869054554toName;
      }
      
      private function marshalMessageAttachments() : String
      {
         var _loc1_:ByteArray = null;
         if(_attachments.length > 0)
         {
            _loc1_ = new ByteArray();
            _loc1_.writeObject(_attachments);
            _loc1_.compress();
            return Base64ByteArray.Encode(_loc1_);
         }
         return "";
      }
      
      private function set _attachments(param1:Array) : void
      {
         var _loc2_:Object = this._1361040911_attachments;
         if(_loc2_ !== param1)
         {
            this._1361040911_attachments = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_attachments",_loc2_,param1));
         }
      }
      
      public function addAttachment(param1:MgbMessageAttachment) : void
      {
         attachmentsAC.addItem(param1);
      }
      
      public function clone() : MgbMessage
      {
         var _loc1_:MgbMessage = new MgbMessage(fromName,toName,subject,date,body,conversationId,messageId);
         var _loc2_:String = String(marshalMessageAttachments());
         _loc1_.unmarshalMessageAttachments(_loc2_);
         return _loc1_;
      }
      
      public function unmarshalMessageAttachments(param1:String) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         attachmentsAC.removeAll();
         if(Boolean(param1) && param1 != "")
         {
            _loc2_ = Base64ByteArray.Decode(param1);
            _loc2_.uncompress();
            _loc3_ = _loc2_.readObject();
            for each(_loc4_ in _loc3_)
            {
               addAttachment(new MgbMessageAttachment(_loc4_.userName,_loc4_.project,_loc4_.itemName,_loc4_.itemType,_loc4_.flags,_loc4_.comment,_loc4_.blob));
            }
         }
      }
      
      public function set fromName(param1:String) : void
      {
         var _loc2_:Object = this._1244847787fromName;
         if(_loc2_ !== param1)
         {
            this._1244847787fromName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fromName",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sendPending() : Boolean
      {
         return this._946059025sendPending;
      }
      
      [Bindable(event="propertyChange")]
      private function get _attachments() : Array
      {
         return this._1361040911_attachments;
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
      
      [Bindable(event="propertyChange")]
      public function get date() : Date
      {
         return this._3076014date;
      }
      
      [Bindable(event="propertyChange")]
      public function get conversationId() : String
      {
         return this._1676095234conversationId;
      }
   }
}
