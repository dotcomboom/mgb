package com.mgb.controls
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import mx.collections.*;
   import mx.events.PropertyChangeEvent;
   
   public class Inventory implements IEventDispatcher
   {
       
      
      private var _2075002026fullEquipmentEffectSummary:String = "";
      
      private var _1609035086equipEffects:EquipmentEffects;
      
      private var _100362195invAC:ArrayCollection;
      
      private var invArray:Array;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function Inventory()
      {
         _1609035086equipEffects = new EquipmentEffects();
         invArray = new Array();
         _100362195invAC = new ArrayCollection(invArray);
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function get equipmentArmorEffect() : int
      {
         return equipEffects.armorEffect;
      }
      
      public function fromBytes(param1:ByteArray) : void
      {
         invArray = param1.readObject();
         invAC = new ArrayCollection(invArray);
         recalculateEquipmentEffects();
      }
      
      public function remove(param1:InventoryItem, param2:int = 1) : Boolean
      {
         return removeByName(param1.name,param2);
      }
      
      private function getIdx(param1:String) : int
      {
         var _loc2_:Function = invAC.filterFunction;
         invAC.filterFunction = null;
         invAC.refresh();
         var _loc3_:int = -1;
         var _loc4_:int = 0;
         while(_loc4_ < invAC.length)
         {
            if(Boolean(invAC[_loc4_]) && invAC[_loc4_].name == param1)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         invAC.filterFunction = _loc2_;
         invAC.refresh();
         return _loc3_;
      }
      
      public function get equipmentMeleeDamageBonus() : int
      {
         return equipEffects.meleeDamageBonus;
      }
      
      private function ifRealString(param1:String) : String
      {
         return Boolean(param1) && param1 != "" ? param1 : null;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      private function recalculateEquipmentEffects() : void
      {
         var _loc4_:InventoryItem = null;
         var _loc5_:String = null;
         equipEffects.shotActor = null;
         equipEffects.shotSound = null;
         equipEffects.newActorGraphics = null;
         equipEffects.shotDamageBonus = 0;
         equipEffects.shotRateBonus = 0;
         equipEffects.shotRangeBonus = 0;
         equipEffects.armorEffect = 0;
         equipEffects.meleeDamageBonus = 0;
         equipEffects.meleeRepeatDelayModifier = 0;
         equipEffects.meleeSound = null;
         var _loc1_:Function = invAC.filterFunction;
         invAC.filterFunction = null;
         invAC.refresh();
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < invAC.length)
         {
            if(invAC[_loc3_])
            {
               if((_loc4_ = invAC[_loc3_]).equipped)
               {
                  if((Boolean(_loc5_ = String(ifRealString(_loc4_.actor.actorXML.databag.item.equippedNewShotActor)))) && (equipEffects.shotActor == null || !_loc2_))
                  {
                     equipEffects.shotActor = _loc5_;
                  }
                  if((Boolean(_loc5_ = String(ifRealString(_loc4_.actor.actorXML.databag.item.equippedNewShotSound)))) && (equipEffects.shotSound == null || !_loc2_))
                  {
                     equipEffects.shotSound = _loc5_;
                  }
                  if((Boolean(_loc5_ = String(ifRealString(_loc4_.actor.actorXML.databag.item.equippedNewActorGraphics)))) && (equipEffects.newActorGraphics == null || !_loc2_))
                  {
                     equipEffects.newActorGraphics = _loc5_;
                  }
                  equipEffects.shotDamageBonus += int(_loc4_.actor.actorXML.databag.item.equippedNewShotDamageBonusNum);
                  equipEffects.shotRateBonus += int(_loc4_.actor.actorXML.databag.item.equippedNewShotRateBonusNum);
                  equipEffects.shotRangeBonus += int(_loc4_.actor.actorXML.databag.item.equippedNewShotRangeBonusNum);
                  equipEffects.armorEffect += int(_loc4_.actor.actorXML.databag.item.equippedArmorEffect);
                  equipEffects.meleeDamageBonus += int(_loc4_.actor.actorXML.databag.item.equippedNewMeleeDamageBonusNum);
                  if((Boolean(_loc5_ = String(ifRealString(_loc4_.actor.actorXML.databag.item.equippedNewMeleeSound)))) && (equipEffects.meleeSound == null || !_loc2_))
                  {
                     equipEffects.meleeSound = _loc5_;
                  }
                  equipEffects.meleeRepeatDelayModifier += int(_loc4_.actor.actorXML.databag.item.equippedNewMeleeRepeatDelayModifierNum);
                  if(_loc4_.autoEquippable)
                  {
                     _loc2_ = true;
                  }
               }
            }
            _loc3_++;
         }
         if(equipEffects.armorEffect > 100)
         {
            equipEffects.armorEffect = 100;
         }
         invAC.filterFunction = _loc1_;
         invAC.refresh();
         update_fullEquipmentEffectSummary();
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      private function update_fullEquipmentEffectSummary() : void
      {
         var _loc1_:String = "";
         var _loc2_:String = ". ";
         if(equipEffects.shotActor)
         {
            _loc1_ += "Shoots " + equipEffects.shotActor + _loc2_;
         }
         if(equipEffects.shotDamageBonus)
         {
            _loc1_ += "Shot damage " + signNumber(equipEffects.shotDamageBonus) + _loc2_;
         }
         if(equipEffects.shotRateBonus)
         {
            _loc1_ += "Shot rate " + signNumber(equipEffects.shotRateBonus) + _loc2_;
         }
         if(equipEffects.shotRangeBonus)
         {
            _loc1_ += "Shot Range " + signNumber(equipEffects.shotRangeBonus) + _loc2_;
         }
         if(equipEffects.armorEffect)
         {
            _loc1_ += "Armor " + equipEffects.armorEffect + "%" + _loc2_;
         }
         if(equipEffects.meleeDamageBonus)
         {
            _loc1_ += "Melee Damage +" + equipEffects.meleeDamageBonus + _loc2_;
         }
         if(equipEffects.meleeRepeatDelayModifier)
         {
            _loc1_ += (equipEffects.meleeRepeatDelayModifier > 0 ? "Increase" : "Decrease") + " melee attack rate by " + Math.abs(equipEffects.meleeRepeatDelayModifier) + _loc2_;
         }
         fullEquipmentEffectSummary = _loc1_;
      }
      
      public function get equipmentNewActorGraphics() : String
      {
         return equipEffects.newActorGraphics;
      }
      
      public function get(param1:String) : InventoryItem
      {
         var _loc2_:Function = invAC.filterFunction;
         invAC.filterFunction = null;
         invAC.refresh();
         var _loc3_:InventoryItem = null;
         var _loc4_:int = 0;
         while(_loc4_ < invAC.length)
         {
            if(Boolean(invAC[_loc4_]) && invAC[_loc4_].name == param1)
            {
               _loc3_ = invAC[_loc4_];
               break;
            }
            _loc4_++;
         }
         invAC.filterFunction = _loc2_;
         invAC.refresh();
         return _loc3_;
      }
      
      public function get equipmentShotRateBonus() : int
      {
         return equipEffects.shotRateBonus;
      }
      
      public function get equipmentShotActorOverride() : String
      {
         return equipEffects.shotActor;
      }
      
      public function get equipmentMeleeSoundOverride() : String
      {
         return equipEffects.meleeSound;
      }
      
      [Bindable(event="propertyChange")]
      public function get fullEquipmentEffectSummary() : String
      {
         return this._2075002026fullEquipmentEffectSummary;
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      public function add(param1:InventoryItem) : void
      {
         var _loc3_:InventoryItem = null;
         var _loc2_:InventoryItem = get(param1.name);
         if(_loc2_)
         {
            _loc2_.count += int(param1.count);
         }
         else
         {
            invAC.addItem(param1);
            if(param1.autoEquippable)
            {
               _loc3_ = equip(param1);
               if(_loc3_)
               {
                  remove(_loc3_,_loc3_.count);
               }
            }
         }
         invAC.refresh();
      }
      
      [Bindable(event="propertyChange")]
      public function get invAC() : ArrayCollection
      {
         return this._100362195invAC;
      }
      
      public function writeBytes(param1:ByteArray) : void
      {
         param1.writeObject(invArray);
      }
      
      public function get equipmentShotRangeBonus() : int
      {
         return equipEffects.shotRangeBonus;
      }
      
      private function set equipEffects(param1:EquipmentEffects) : void
      {
         var _loc2_:Object = this._1609035086equipEffects;
         if(_loc2_ !== param1)
         {
            this._1609035086equipEffects = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"equipEffects",_loc2_,param1));
         }
      }
      
      public function set fullEquipmentEffectSummary(param1:String) : void
      {
         var _loc2_:Object = this._2075002026fullEquipmentEffectSummary;
         if(_loc2_ !== param1)
         {
            this._2075002026fullEquipmentEffectSummary = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullEquipmentEffectSummary",_loc2_,param1));
         }
      }
      
      public function removeByName(param1:String, param2:int = 1) : Boolean
      {
         var _loc6_:InventoryItem = null;
         var _loc3_:Function = invAC.filterFunction;
         invAC.filterFunction = null;
         invAC.refresh();
         var _loc4_:Boolean = false;
         var _loc5_:int;
         if((_loc5_ = int(getIdx(param1))) != -1)
         {
            _loc6_ = InventoryItem(invAC.getItemAt(_loc5_));
            if(param2 < _loc6_.count)
            {
               _loc6_.count -= param2;
            }
            else
            {
               invAC.removeItemAt(_loc5_);
            }
            _loc4_ = true;
         }
         recalculateEquipmentEffects();
         invAC.filterFunction = _loc3_;
         invAC.refresh();
         return _loc4_;
      }
      
      public function get equipmentShotDamageBonus() : int
      {
         return equipEffects.shotDamageBonus;
      }
      
      public function equip(param1:InventoryItem, param2:Boolean = true) : InventoryItem
      {
         var _loc5_:Function = null;
         var _loc6_:int = 0;
         var _loc7_:InventoryItem = null;
         var _loc3_:InventoryItem = null;
         var _loc4_:InventoryItem;
         if((Boolean(_loc4_ = get(param1.name))) && _loc4_.equippable)
         {
            _loc4_.equipped = param2;
            if(param2 && (_loc4_.equipSlot || _loc4_.autoEquippable))
            {
               _loc5_ = invAC.filterFunction;
               invAC.filterFunction = null;
               invAC.refresh();
               _loc6_ = 0;
               while(_loc6_ < invAC.length)
               {
                  if(invAC[_loc6_])
                  {
                     if((_loc7_ = invAC[_loc6_]).equipped == true && _loc7_.name != _loc4_.name)
                     {
                        if(_loc4_.autoEquippable)
                        {
                           if(_loc7_.autoEquippable)
                           {
                              _loc7_.equipped = false;
                              _loc3_ = _loc7_;
                           }
                        }
                        else if(_loc4_.equipSlot)
                        {
                           if(_loc7_.equipSlot == _loc4_.equipSlot)
                           {
                              _loc7_.equipped = false;
                              _loc3_ = _loc7_;
                           }
                        }
                     }
                  }
                  _loc6_++;
               }
               invAC.filterFunction = _loc5_;
            }
            invAC.refresh();
         }
         recalculateEquipmentEffects();
         return _loc3_;
      }
      
      [Bindable(event="propertyChange")]
      private function get equipEffects() : EquipmentEffects
      {
         return this._1609035086equipEffects;
      }
      
      public function get equipmentShotSoundOverride() : String
      {
         return equipEffects.shotSound;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function signNumber(param1:int) : String
      {
         return (param1 > 0 ? "+" : "") + String(param1);
      }
      
      public function get equipmentMeleeRepeatDelayModifier() : int
      {
         return equipEffects.meleeRepeatDelayModifier;
      }
      
      public function set invAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._100362195invAC;
         if(_loc2_ !== param1)
         {
            this._100362195invAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"invAC",_loc2_,param1));
         }
      }
   }
}

import com.mgb.data.*;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.events.PropertyChangeEvent;

class EquipmentEffects implements IEventDispatcher
{
    
   
   private var _2127535733meleeRepeatDelayModifier:int;
   
   private var _449276933meleeSound:String;
   
   private var _bindingEventDispatcher:EventDispatcher;
   
   private var _2111790044meleeDamageBonus:int;
   
   private var _1528569312newActorGraphics:String;
   
   private var _2017416421shotActor:String;
   
   private var _1714192746shotDamageBonus:int;
   
   private var _137882949shotRateBonus:int;
   
   private var _1765006256armorEffect:int;
   
   private var _847969148shotRangeBonus:int;
   
   private var _2000434635shotSound:String;
   
   public function EquipmentEffects()
   {
      _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
      super();
   }
   
   [Bindable(event="propertyChange")]
   public function get meleeSound() : String
   {
      return this._449276933meleeSound;
   }
   
   [Bindable(event="propertyChange")]
   public function get shotRangeBonus() : int
   {
      return this._847969148shotRangeBonus;
   }
   
   public function willTrigger(param1:String) : Boolean
   {
      return _bindingEventDispatcher.willTrigger(param1);
   }
   
   [Bindable(event="propertyChange")]
   public function get meleeRepeatDelayModifier() : int
   {
      return this._2127535733meleeRepeatDelayModifier;
   }
   
   public function set shotRateBonus(param1:int) : void
   {
      var _loc2_:Object = this._137882949shotRateBonus;
      if(_loc2_ !== param1)
      {
         this._137882949shotRateBonus = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shotRateBonus",_loc2_,param1));
      }
   }
   
   [Bindable(event="propertyChange")]
   public function get shotDamageBonus() : int
   {
      return this._1714192746shotDamageBonus;
   }
   
   [Bindable(event="propertyChange")]
   public function get shotActor() : String
   {
      return this._2017416421shotActor;
   }
   
   public function set meleeRepeatDelayModifier(param1:int) : void
   {
      var _loc2_:Object = this._2127535733meleeRepeatDelayModifier;
      if(_loc2_ !== param1)
      {
         this._2127535733meleeRepeatDelayModifier = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"meleeRepeatDelayModifier",_loc2_,param1));
      }
   }
   
   public function set shotDamageBonus(param1:int) : void
   {
      var _loc2_:Object = this._1714192746shotDamageBonus;
      if(_loc2_ !== param1)
      {
         this._1714192746shotDamageBonus = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shotDamageBonus",_loc2_,param1));
      }
   }
   
   [Bindable(event="propertyChange")]
   public function get armorEffect() : int
   {
      return this._1765006256armorEffect;
   }
   
   [Bindable(event="propertyChange")]
   public function get shotSound() : String
   {
      return this._2000434635shotSound;
   }
   
   public function set shotActor(param1:String) : void
   {
      var _loc2_:Object = this._2017416421shotActor;
      if(_loc2_ !== param1)
      {
         this._2017416421shotActor = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shotActor",_loc2_,param1));
      }
   }
   
   public function set meleeDamageBonus(param1:int) : void
   {
      var _loc2_:Object = this._2111790044meleeDamageBonus;
      if(_loc2_ !== param1)
      {
         this._2111790044meleeDamageBonus = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"meleeDamageBonus",_loc2_,param1));
      }
   }
   
   public function set newActorGraphics(param1:String) : void
   {
      var _loc2_:Object = this._1528569312newActorGraphics;
      if(_loc2_ !== param1)
      {
         this._1528569312newActorGraphics = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newActorGraphics",_loc2_,param1));
      }
   }
   
   public function dispatchEvent(param1:Event) : Boolean
   {
      return _bindingEventDispatcher.dispatchEvent(param1);
   }
   
   public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
   {
      _bindingEventDispatcher.removeEventListener(param1,param2,param3);
   }
   
   [Bindable(event="propertyChange")]
   public function get shotRateBonus() : int
   {
      return this._137882949shotRateBonus;
   }
   
   public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
   {
      _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
   }
   
   [Bindable(event="propertyChange")]
   public function get meleeDamageBonus() : int
   {
      return this._2111790044meleeDamageBonus;
   }
   
   [Bindable(event="propertyChange")]
   public function get newActorGraphics() : String
   {
      return this._1528569312newActorGraphics;
   }
   
   public function set armorEffect(param1:int) : void
   {
      var _loc2_:Object = this._1765006256armorEffect;
      if(_loc2_ !== param1)
      {
         this._1765006256armorEffect = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"armorEffect",_loc2_,param1));
      }
   }
   
   public function set shotSound(param1:String) : void
   {
      var _loc2_:Object = this._2000434635shotSound;
      if(_loc2_ !== param1)
      {
         this._2000434635shotSound = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shotSound",_loc2_,param1));
      }
   }
   
   public function hasEventListener(param1:String) : Boolean
   {
      return _bindingEventDispatcher.hasEventListener(param1);
   }
   
   public function set meleeSound(param1:String) : void
   {
      var _loc2_:Object = this._449276933meleeSound;
      if(_loc2_ !== param1)
      {
         this._449276933meleeSound = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"meleeSound",_loc2_,param1));
      }
   }
   
   public function set shotRangeBonus(param1:int) : void
   {
      var _loc2_:Object = this._847969148shotRangeBonus;
      if(_loc2_ !== param1)
      {
         this._847969148shotRangeBonus = param1;
         this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shotRangeBonus",_loc2_,param1));
      }
   }
}
