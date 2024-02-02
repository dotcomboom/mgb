package com.mgb.controls
{
   import com.mgb.data.*;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class InventoryItem implements IEventDispatcher
   {
       
      
      private var _92645877actor:MgbActor;
      
      private var _588913375equipped:Boolean;
      
      private var _94851343count:int;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function InventoryItem(param1:MgbActor, param2:Boolean = false, param3:int = 1)
      {
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.actor = param1;
         this.equipped = param2;
         this.count = param3;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function get name() : String
      {
         return actor == null ? null : actor.name;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function get equipSlot() : String
      {
         if(Boolean(actor) && equippable)
         {
            return String(actor.actorXML.databag.item.inventoryEquipSlot);
         }
         return null;
      }
      
      [Bindable(event="propertyChange")]
      public function get count() : int
      {
         return this._94851343count;
      }
      
      public function get equippable() : Boolean
      {
         return actor != null && int(actor.actorXML.databag.item.inventoryEquippableYN) == 1;
      }
      
      public function set count(param1:int) : void
      {
         var _loc2_:Object = this._94851343count;
         if(_loc2_ !== param1)
         {
            this._94851343count = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"count",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get equipped() : Boolean
      {
         return this._588913375equipped;
      }
      
      public function get autoEquippable() : Boolean
      {
         return this.equippable && int(actor.actorXML.databag.item.autoEquipYN) == 1;
      }
      
      public function set actor(param1:MgbActor) : void
      {
         var _loc2_:Object = this._92645877actor;
         if(_loc2_ !== param1)
         {
            this._92645877actor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actor",_loc2_,param1));
         }
      }
      
      public function get equipDescription() : String
      {
         var _loc1_:String = equipSlot;
         return (equippable ? "Equippable" : "") + (!!_loc1_ ? " in " + _loc1_ : "");
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get actor() : MgbActor
      {
         return this._92645877actor;
      }
      
      public function get description() : String
      {
         if(actor == null)
         {
            return null;
         }
         var _loc1_:String = String(actor.actorXML.databag.all.description);
         return _loc1_.length > 0 ? _loc1_ : actor.name;
      }
      
      public function set equipped(param1:Boolean) : void
      {
         var _loc2_:Object = this._588913375equipped;
         if(_loc2_ !== param1)
         {
            this._588913375equipped = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"equipped",_loc2_,param1));
         }
      }
      
      public function get usable() : Boolean
      {
         var _loc1_:int = 0;
         if(actor)
         {
            _loc1_ = int(actor.actorXML.databag.item.itemActivationType);
            return _loc1_ == MgbActor.alItemActivationType_PlayerPicksUpUsesLater && equippable == false;
         }
         return false;
      }
   }
}
