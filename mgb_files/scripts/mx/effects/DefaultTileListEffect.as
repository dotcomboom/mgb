package mx.effects
{
   import mx.events.PropertyChangeEvent;
   
   public class DefaultTileListEffect extends Parallel
   {
       
      
      private var _fadeInDuration:Number = 350;
      
      private var _moveDuration:Number = 300;
      
      private var _104087168move1:Move;
      
      private var _fadeOutDuration:Number = 350;
      
      private var _color:uint = 16777215;
      
      private var _1091442800fadeIn1:Dissolve;
      
      private var _1091442799fadeIn2:Dissolve;
      
      private var _525199167fadeOut1:Dissolve;
      
      private var _525199168fadeOut2:Dissolve;
      
      public function DefaultTileListEffect()
      {
         super();
         this.children = [_DefaultTileListEffect_Sequence1_c(),_DefaultTileListEffect_Sequence2_c()];
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeOut2() : Dissolve
      {
         return this._525199168fadeOut2;
      }
      
      private function _DefaultTileListEffect_Sequence1_c() : Sequence
      {
         var _loc1_:Sequence = new Sequence();
         _loc1_.children = [_DefaultTileListEffect_Dissolve1_i(),_DefaultTileListEffect_SetPropertyAction1_c(),_DefaultTileListEffect_Move1_i(),_DefaultTileListEffect_RemoveItemAction1_c(),_DefaultTileListEffect_AddItemAction1_c(),_DefaultTileListEffect_Dissolve2_i()];
         return _loc1_;
      }
      
      private function _DefaultTileListEffect_AddItemAction2_c() : AddItemAction
      {
         var _loc1_:AddItemAction = new AddItemAction();
         _loc1_.filter = "replacementItem";
         return _loc1_;
      }
      
      public function get moveDuration() : Number
      {
         return _moveDuration;
      }
      
      public function set color(param1:Number) : void
      {
         _color = param1;
         fadeOut1.color = param1;
         fadeOut2.color = param1;
         fadeIn1.color = param1;
         fadeIn2.color = param1;
      }
      
      public function set fadeOut2(param1:Dissolve) : void
      {
         var _loc2_:Object = this._525199168fadeOut2;
         if(_loc2_ !== param1)
         {
            this._525199168fadeOut2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeOut2",_loc2_,param1));
         }
      }
      
      public function set moveDuration(param1:Number) : void
      {
         _moveDuration = param1;
         move1.duration = param1;
      }
      
      private function _DefaultTileListEffect_Dissolve2_i() : Dissolve
      {
         var _loc1_:Dissolve = new Dissolve();
         fadeIn1 = _loc1_;
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 300;
         _loc1_.color = 16777215;
         _loc1_.filter = "addItem";
         return _loc1_;
      }
      
      public function set fadeOutDuration(param1:Number) : void
      {
         _fadeOutDuration = param1;
         fadeOut1.duration = param1;
         fadeOut2.duration = param1;
      }
      
      private function _DefaultTileListEffect_Dissolve4_i() : Dissolve
      {
         var _loc1_:Dissolve = new Dissolve();
         fadeIn2 = _loc1_;
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 350;
         _loc1_.color = 16777215;
         _loc1_.filter = "replacementItem";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeIn1() : Dissolve
      {
         return this._1091442800fadeIn1;
      }
      
      private function _DefaultTileListEffect_Dissolve1_i() : Dissolve
      {
         var _loc1_:Dissolve = new Dissolve();
         fadeOut1 = _loc1_;
         _loc1_.alphaTo = 0;
         _loc1_.duration = 350;
         _loc1_.filter = "removeItem";
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      public function set move1(param1:Move) : void
      {
         var _loc2_:Object = this._104087168move1;
         if(_loc2_ !== param1)
         {
            this._104087168move1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"move1",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get move1() : Move
      {
         return this._104087168move1;
      }
      
      private function _DefaultTileListEffect_SetPropertyAction1_c() : SetPropertyAction
      {
         var _loc1_:SetPropertyAction = new SetPropertyAction();
         _loc1_.name = "visible";
         _loc1_.value = false;
         _loc1_.filter = "removeItem";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeIn2() : Dissolve
      {
         return this._1091442799fadeIn2;
      }
      
      private function _DefaultTileListEffect_Dissolve3_i() : Dissolve
      {
         var _loc1_:Dissolve = new Dissolve();
         fadeOut2 = _loc1_;
         _loc1_.alphaTo = 0;
         _loc1_.duration = 350;
         _loc1_.color = 16777215;
         _loc1_.filter = "replacedItem";
         return _loc1_;
      }
      
      public function set fadeIn1(param1:Dissolve) : void
      {
         var _loc2_:Object = this._1091442800fadeIn1;
         if(_loc2_ !== param1)
         {
            this._1091442800fadeIn1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn1",_loc2_,param1));
         }
      }
      
      public function set fadeIn2(param1:Dissolve) : void
      {
         var _loc2_:Object = this._1091442799fadeIn2;
         if(_loc2_ !== param1)
         {
            this._1091442799fadeIn2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn2",_loc2_,param1));
         }
      }
      
      public function get color() : Number
      {
         return _color;
      }
      
      private function _DefaultTileListEffect_RemoveItemAction2_c() : RemoveItemAction
      {
         var _loc1_:RemoveItemAction = new RemoveItemAction();
         _loc1_.filter = "replacedItem";
         return _loc1_;
      }
      
      public function set fadeInDuration(param1:Number) : void
      {
         _fadeInDuration = param1;
         fadeIn1.duration = param1;
         fadeIn2.duration = param1;
      }
      
      public function get fadeOutDuration() : Number
      {
         return _fadeOutDuration;
      }
      
      private function _DefaultTileListEffect_Move1_i() : Move
      {
         var _loc1_:Move = new Move();
         move1 = _loc1_;
         _loc1_.duration = 300;
         return _loc1_;
      }
      
      public function get fadeInDuration() : Number
      {
         return _fadeInDuration;
      }
      
      private function _DefaultTileListEffect_RemoveItemAction1_c() : RemoveItemAction
      {
         var _loc1_:RemoveItemAction = new RemoveItemAction();
         _loc1_.filter = "removeItem";
         return _loc1_;
      }
      
      private function _DefaultTileListEffect_AddItemAction1_c() : AddItemAction
      {
         var _loc1_:AddItemAction = new AddItemAction();
         _loc1_.filter = "addItem";
         return _loc1_;
      }
      
      private function _DefaultTileListEffect_Sequence2_c() : Sequence
      {
         var _loc1_:Sequence = new Sequence();
         _loc1_.children = [_DefaultTileListEffect_Dissolve3_i(),_DefaultTileListEffect_RemoveItemAction2_c(),_DefaultTileListEffect_AddItemAction2_c(),_DefaultTileListEffect_Dissolve4_i()];
         return _loc1_;
      }
      
      public function set fadeOut1(param1:Dissolve) : void
      {
         var _loc2_:Object = this._525199167fadeOut1;
         if(_loc2_ !== param1)
         {
            this._525199167fadeOut1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeOut1",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeOut1() : Dissolve
      {
         return this._525199167fadeOut1;
      }
   }
}
