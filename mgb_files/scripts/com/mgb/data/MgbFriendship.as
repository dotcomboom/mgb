package com.mgb.data
{
   import flash.events.EventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class MgbFriendship extends EventDispatcher
   {
       
      
      private var _1519243726friendingdate:Date;
      
      private var _265713450username:String;
      
      private var _1755904471friendname:String;
      
      public function MgbFriendship(param1:String = "", param2:String = "", param3:Date = null)
      {
         super();
         this.username = param1;
         this.friendname = param2;
         this.friendingdate = !!param3 ? param3 : new Date();
      }
      
      public function set friendingdate(param1:Date) : void
      {
         var _loc2_:Object = this._1519243726friendingdate;
         if(_loc2_ !== param1)
         {
            this._1519243726friendingdate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendingdate",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get friendname() : String
      {
         return this._1755904471friendname;
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
      
      public function clear() : void
      {
         this.username = "";
         this.friendname = "";
         this.friendingdate = new Date();
      }
      
      public function set friendname(param1:String) : void
      {
         var _loc2_:Object = this._1755904471friendname;
         if(_loc2_ !== param1)
         {
            this._1755904471friendname = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendname",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get username() : String
      {
         return this._265713450username;
      }
      
      [Bindable(event="propertyChange")]
      public function get friendingdate() : Date
      {
         return this._1519243726friendingdate;
      }
   }
}
