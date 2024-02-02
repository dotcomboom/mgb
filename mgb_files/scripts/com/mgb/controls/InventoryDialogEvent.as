package com.mgb.controls
{
   import flash.events.Event;
   
   public class InventoryDialogEvent extends Event
   {
      
      public static const ACTION_EQUIP:String = "equip";
      
      public static const ACTION_CLOSE:String = "close";
      
      public static const ACTION_DESTROY:String = "destroy";
      
      public static const ACTION_DROP:String = "drop";
      
      public static const INVENTORY_ACTION:String = "inventoryAction";
      
      public static const ACTION_USE:String = "use";
       
      
      public var item:InventoryItem;
      
      public var action:String;
      
      public function InventoryDialogEvent(param1:String, param2:String, param3:InventoryItem, param4:Boolean = false, param5:Boolean = false)
      {
         this.action = param2;
         this.item = param3;
         super(param1,param4,param5);
      }
      
      override public function clone() : Event
      {
         return new InventoryDialogEvent(type,action,item,bubbles,cancelable);
      }
   }
}
