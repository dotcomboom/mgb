package com.mgb.data
{
   import flash.events.EventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class MgbWallpost extends EventDispatcher
   {
       
      
      private var _820081177recipient:String;
      
      private var _3076014date:Date;
      
      private var _3029410body:String;
      
      private var _1243894475fromname:String;
      
      private var _982451749postId:String;
      
      public function MgbWallpost(param1:String = "", param2:String = "", param3:String = "", param4:String = "", param5:Date = null)
      {
         super();
         this.recipient = param1;
         this.fromname = param2;
         this.body = param3;
         this.postId = param4;
         this.date = !!param5 ? param5 : new Date();
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
      
      public function set postId(param1:String) : void
      {
         var _loc2_:Object = this._982451749postId;
         if(_loc2_ !== param1)
         {
            this._982451749postId = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"postId",_loc2_,param1));
         }
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
      
      public function set body(param1:String) : void
      {
         var _loc2_:Object = this._3029410body;
         if(_loc2_ !== param1)
         {
            this._3029410body = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"body",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get date() : Date
      {
         return this._3076014date;
      }
      
      public function set fromname(param1:String) : void
      {
         var _loc2_:Object = this._1243894475fromname;
         if(_loc2_ !== param1)
         {
            this._1243894475fromname = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fromname",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fromname() : String
      {
         return this._1243894475fromname;
      }
      
      [Bindable(event="propertyChange")]
      public function get recipient() : String
      {
         return this._820081177recipient;
      }
      
      public function clear() : void
      {
         recipient = "";
         fromname = "";
         body = "";
         postId = "";
         date = null;
      }
      
      [Bindable(event="propertyChange")]
      public function get postId() : String
      {
         return this._982451749postId;
      }
   }
}
