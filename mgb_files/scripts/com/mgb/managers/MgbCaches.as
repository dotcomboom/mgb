package com.mgb.managers
{
   import com.mgb.data.*;
   import flash.events.EventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class MgbCaches extends EventDispatcher
   {
      
      private static var _instance:MgbCaches;
       
      
      private var _347730005friendshipsListCache:MgbFriendshipListsCache;
      
      public var mapCache:PieceCache;
      
      public var actorCache:PieceCache;
      
      private var _1081358637mapsPL:PieceList;
      
      private var _1471373031wallsCache:MgbWallsCache;
      
      private var _1731484295messageConversationsCache:MgbMessageConversationsCache;
      
      public var profileCache:PieceCache;
      
      private var _748314681messageConversationsList:MgbConversationsList;
      
      private var _1642894959tutorialsPL:PieceList;
      
      public var avatarCache:PieceCache;
      
      private var _1650536550actorsPL:PieceList;
      
      public var tileCache:PieceCache;
      
      private var _1314832319tilesPL:PieceList;
      
      public var screenshotCache:PieceCache;
      
      public function MgbCaches(param1:MgbCachesSingletonEnforcer)
      {
         tileCache = new PieceCache(Piece.MGB_TILE);
         actorCache = new PieceCache(Piece.MGB_ACTOR);
         mapCache = new PieceCache(Piece.MGB_MAP);
         avatarCache = new PieceCache(Piece.MGB_TILE);
         profileCache = new PieceCache(Piece.MGB_PROFILE);
         screenshotCache = new PieceCache(Piece.MGB_SCREENSHOT);
         _1731484295messageConversationsCache = new MgbMessageConversationsCache();
         _748314681messageConversationsList = new MgbConversationsList();
         _347730005friendshipsListCache = new MgbFriendshipListsCache();
         _1471373031wallsCache = new MgbWallsCache();
         _1314832319tilesPL = new PieceList(Piece.MGB_TILE);
         _1650536550actorsPL = new PieceList(Piece.MGB_ACTOR);
         _1081358637mapsPL = new PieceList(Piece.MGB_MAP);
         _1642894959tutorialsPL = new PieceList(Piece.MGB_TUTORIAL);
         super();
         if(null == param1)
         {
            throw new Error("Assertion failure - multiple instantiations of MgbCaches singleton");
         }
         avatarCache.flushOnProjectChange = false;
      }
      
      public static function getInstance() : MgbCaches
      {
         if(MgbCaches._instance == null)
         {
            MgbCaches._instance = new MgbCaches(new MgbCachesSingletonEnforcer());
         }
         return MgbCaches._instance;
      }
      
      [Bindable(event="propertyChange")]
      public function get messageConversationsCache() : MgbMessageConversationsCache
      {
         return this._1731484295messageConversationsCache;
      }
      
      public function set tilesPL(param1:PieceList) : void
      {
         var _loc2_:Object = this._1314832319tilesPL;
         if(_loc2_ !== param1)
         {
            this._1314832319tilesPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilesPL",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageConversationsList() : MgbConversationsList
      {
         return this._748314681messageConversationsList;
      }
      
      [Bindable(event="propertyChange")]
      public function get tilesPL() : PieceList
      {
         return this._1314832319tilesPL;
      }
      
      [Bindable(event="propertyChange")]
      public function get tutorialsPL() : PieceList
      {
         return this._1642894959tutorialsPL;
      }
      
      [Bindable(event="propertyChange")]
      public function get mapsPL() : PieceList
      {
         return this._1081358637mapsPL;
      }
      
      public function set friendshipsListCache(param1:MgbFriendshipListsCache) : void
      {
         var _loc2_:Object = this._347730005friendshipsListCache;
         if(_loc2_ !== param1)
         {
            this._347730005friendshipsListCache = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendshipsListCache",_loc2_,param1));
         }
      }
      
      public function set messageConversationsList(param1:MgbConversationsList) : void
      {
         var _loc2_:Object = this._748314681messageConversationsList;
         if(_loc2_ !== param1)
         {
            this._748314681messageConversationsList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageConversationsList",_loc2_,param1));
         }
      }
      
      public function set messageConversationsCache(param1:MgbMessageConversationsCache) : void
      {
         var _loc2_:Object = this._1731484295messageConversationsCache;
         if(_loc2_ !== param1)
         {
            this._1731484295messageConversationsCache = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageConversationsCache",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wallsCache() : MgbWallsCache
      {
         return this._1471373031wallsCache;
      }
      
      [Bindable(event="propertyChange")]
      public function get actorsPL() : PieceList
      {
         return this._1650536550actorsPL;
      }
      
      public function set mapsPL(param1:PieceList) : void
      {
         var _loc2_:Object = this._1081358637mapsPL;
         if(_loc2_ !== param1)
         {
            this._1081358637mapsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapsPL",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get friendshipsListCache() : MgbFriendshipListsCache
      {
         return this._347730005friendshipsListCache;
      }
      
      public function set wallsCache(param1:MgbWallsCache) : void
      {
         var _loc2_:Object = this._1471373031wallsCache;
         if(_loc2_ !== param1)
         {
            this._1471373031wallsCache = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wallsCache",_loc2_,param1));
         }
      }
      
      public function set tutorialsPL(param1:PieceList) : void
      {
         var _loc2_:Object = this._1642894959tutorialsPL;
         if(_loc2_ !== param1)
         {
            this._1642894959tutorialsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tutorialsPL",_loc2_,param1));
         }
      }
      
      public function set actorsPL(param1:PieceList) : void
      {
         var _loc2_:Object = this._1650536550actorsPL;
         if(_loc2_ !== param1)
         {
            this._1650536550actorsPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorsPL",_loc2_,param1));
         }
      }
   }
}

class MgbCachesSingletonEnforcer
{
    
   
   public function MgbCachesSingletonEnforcer()
   {
      super();
   }
}
