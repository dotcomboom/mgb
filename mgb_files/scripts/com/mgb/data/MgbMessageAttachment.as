package com.mgb.data
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class MgbMessageAttachment implements IEventDispatcher
   {
      
      public static const ITEMTYPE_FRIEND_REQUEST:String = "_SPECIAL_friendRequest";
      
      public static const FLAG_ACTS_AS_GIVE:int = 1;
       
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _950398559comment:String;
      
      private var _1177331774itemName:String;
      
      private var _3026845blob:String;
      
      private var _266666762userName:String;
      
      private var _1177533677itemType:String;
      
      private var _97513095flags:int;
      
      private var _309310695project:String;
      
      public function MgbMessageAttachment(param1:String, param2:String, param3:String = "", param4:String = "", param5:int = 0, param6:String = null, param7:String = null)
      {
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.userName = param1;
         this.project = param2;
         this.itemName = param3;
         this.itemType = param4;
         this.flags = param5;
         this.comment = param6;
         this.blob = param7;
      }
      
      public function set blob(param1:String) : void
      {
         var _loc2_:Object = this._3026845blob;
         if(_loc2_ !== param1)
         {
            this._3026845blob = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"blob",_loc2_,param1));
         }
      }
      
      public function get showItemDescription() : Boolean
      {
         return itemType == Piece.MGB_TILE;
      }
      
      public function set comment(param1:String) : void
      {
         var _loc2_:Object = this._950398559comment;
         if(_loc2_ !== param1)
         {
            this._950398559comment = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"comment",_loc2_,param1));
         }
      }
      
      public function get isBeingGiven() : Boolean
      {
         return itemType == Piece.MGB_TILE && (flags & FLAG_ACTS_AS_GIVE) > 0;
      }
      
      public function get canBeGiven() : Boolean
      {
         return itemType == Piece.MGB_TILE;
      }
      
      public function get showItemImage() : Boolean
      {
         return itemType == Piece.MGB_TILE;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function get isFriendRequest() : Boolean
      {
         return itemType == ITEMTYPE_FRIEND_REQUEST;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function get showAttachmentHider() : Boolean
      {
         return !isFriendRequest;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function set itemName(param1:String) : void
      {
         var _loc2_:Object = this._1177331774itemName;
         if(_loc2_ !== param1)
         {
            this._1177331774itemName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemName",_loc2_,param1));
         }
      }
      
      public function set flags(param1:int) : void
      {
         var _loc2_:Object = this._97513095flags;
         if(_loc2_ !== param1)
         {
            this._97513095flags = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flags",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set isBeingGiven(param1:Boolean) : void
      {
         var _loc2_:Object = this.isBeingGiven;
         if(_loc2_ !== param1)
         {
            this._1901190456isBeingGiven = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isBeingGiven",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get project() : String
      {
         return this._309310695project;
      }
      
      [Bindable(event="propertyChange")]
      public function get blob() : String
      {
         return this._3026845blob;
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get flags() : int
      {
         return this._97513095flags;
      }
      
      public function set itemType(param1:String) : void
      {
         var _loc2_:Object = this._1177533677itemType;
         if(_loc2_ !== param1)
         {
            this._1177533677itemType = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemType",_loc2_,param1));
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function set userName(param1:String) : void
      {
         var _loc2_:Object = this._266666762userName;
         if(_loc2_ !== param1)
         {
            this._266666762userName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userName",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get comment() : String
      {
         return this._950398559comment;
      }
      
      public function set project(param1:String) : void
      {
         var _loc2_:Object = this._309310695project;
         if(_loc2_ !== param1)
         {
            this._309310695project = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"project",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemType() : String
      {
         return this._1177533677itemType;
      }
      
      [Bindable(event="propertyChange")]
      public function get userName() : String
      {
         return this._266666762userName;
      }
      
      private function set _1901190456isBeingGiven(param1:Boolean) : void
      {
         if(itemType == Piece.MGB_TILE)
         {
            flags = param1 ? FLAG_ACTS_AS_GIVE : 0;
         }
         else
         {
            flags = 0;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemName() : String
      {
         return this._1177331774itemName;
      }
      
      public function get showCommentField() : Boolean
      {
         return itemType == Piece.MGB_TILE && comment.length > 0;
      }
   }
}
