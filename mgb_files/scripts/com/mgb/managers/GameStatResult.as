package com.mgb.managers
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class GameStatResult implements IEventDispatcher
   {
       
      
      private var _1008100561gamegenre:int;
      
      private var _1768189396gametype:int;
      
      private var _904641161gameplayCount:Number;
      
      private var _1031520456completionsCount:int;
      
      private var _265713450username:String;
      
      private var _1722083602graphicsAverage:Number;
      
      private var _187486487gameplayAverage:Number;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _3165170game:String;
      
      private var _1024486076graphicsCount:Number;
      
      private var _1724546052description:String;
      
      private var _1543364196gamestatus:int;
      
      private var _1840905072playsCount:int;
      
      public function GameStatResult(param1:String, param2:String, param3:int, param4:int, param5:Number, param6:Number, param7:Number, param8:Number, param9:int, param10:int, param11:int, param12:String)
      {
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.username = param1;
         this.game = param2;
         this.playsCount = param3;
         this.completionsCount = param4;
         this.graphicsAverage = param5;
         this.graphicsCount = param6;
         this.gameplayAverage = param7;
         this.gameplayCount = param8;
         this.gamestatus = param9;
         this.gametype = param10;
         this.gamegenre = param11;
         this.description = param12;
      }
      
      public static function describe(param1:int, param2:int) : String
      {
         return plural(param1,"play","",false) + plural(param2,"win",", ",true);
      }
      
      private static function plural(param1:int, param2:String, param3:String, param4:Boolean) : String
      {
         if(param1 == 0 && param4)
         {
            return "";
         }
         return param3 + param1 + " " + param2 + (param1 == 1 ? "" : "s");
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      public function set graphicsCount(param1:Number) : void
      {
         var _loc2_:Object = this._1024486076graphicsCount;
         if(_loc2_ !== param1)
         {
            this._1024486076graphicsCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"graphicsCount",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gameplayCount() : Number
      {
         return this._904641161gameplayCount;
      }
      
      [Bindable(event="propertyChange")]
      public function get playsCount() : int
      {
         return this._1840905072playsCount;
      }
      
      [Bindable(event="propertyChange")]
      public function get gameplayAverage() : Number
      {
         return this._187486487gameplayAverage;
      }
      
      [Bindable(event="propertyChange")]
      public function get graphicsAverage() : Number
      {
         return this._1722083602graphicsAverage;
      }
      
      public function set gameplayCount(param1:Number) : void
      {
         var _loc2_:Object = this._904641161gameplayCount;
         if(_loc2_ !== param1)
         {
            this._904641161gameplayCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameplayCount",_loc2_,param1));
         }
      }
      
      public function set playsCount(param1:int) : void
      {
         var _loc2_:Object = this._1840905072playsCount;
         if(_loc2_ !== param1)
         {
            this._1840905072playsCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playsCount",_loc2_,param1));
         }
      }
      
      public function set gamegenre(param1:int) : void
      {
         var _loc2_:Object = this._1008100561gamegenre;
         if(_loc2_ !== param1)
         {
            this._1008100561gamegenre = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gamegenre",_loc2_,param1));
         }
      }
      
      public function set graphicsAverage(param1:Number) : void
      {
         var _loc2_:Object = this._1722083602graphicsAverage;
         if(_loc2_ !== param1)
         {
            this._1722083602graphicsAverage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"graphicsAverage",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gametype() : int
      {
         return this._1768189396gametype;
      }
      
      public function set gameplayAverage(param1:Number) : void
      {
         var _loc2_:Object = this._187486487gameplayAverage;
         if(_loc2_ !== param1)
         {
            this._187486487gameplayAverage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameplayAverage",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get completionsCount() : int
      {
         return this._1031520456completionsCount;
      }
      
      [Bindable(event="propertyChange")]
      public function get graphicsCount() : Number
      {
         return this._1024486076graphicsCount;
      }
      
      public function set gamestatus(param1:int) : void
      {
         var _loc2_:Object = this._1543364196gamestatus;
         if(_loc2_ !== param1)
         {
            this._1543364196gamestatus = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gamestatus",_loc2_,param1));
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get gamegenre() : int
      {
         return this._1008100561gamegenre;
      }
      
      [Bindable(event="propertyChange")]
      public function get username() : String
      {
         return this._265713450username;
      }
      
      public function set gametype(param1:int) : void
      {
         var _loc2_:Object = this._1768189396gametype;
         if(_loc2_ !== param1)
         {
            this._1768189396gametype = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gametype",_loc2_,param1));
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
      public function get gamestatus() : int
      {
         return this._1543364196gamestatus;
      }
      
      public function set game(param1:String) : void
      {
         var _loc2_:Object = this._3165170game;
         if(_loc2_ !== param1)
         {
            this._3165170game = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"game",_loc2_,param1));
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function set completionsCount(param1:int) : void
      {
         var _loc2_:Object = this._1031520456completionsCount;
         if(_loc2_ !== param1)
         {
            this._1031520456completionsCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"completionsCount",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get game() : String
      {
         return this._3165170game;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function set description(param1:String) : void
      {
         var _loc2_:Object = this._1724546052description;
         if(_loc2_ !== param1)
         {
            this._1724546052description = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"description",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get description() : String
      {
         return this._1724546052description;
      }
   }
}
