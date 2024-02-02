package
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.Canvas;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class LoginBrowseUserDetailControl extends Canvas
   {
       
      
      private var _309425751profile:MgbProfile;
      
      private var _17400534gameBrowser:GamesBrowser;
      
      private var _userName:String;
      
      private var mgbCaches:MgbCaches;
      
      private var _108386723ready:Boolean = false;
      
      private var _758502048wishMessage:String = "";
      
      private var _195588445gamesAC:ArrayCollection;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function LoginBrowseUserDetailControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":GamesBrowser,
                  "id":"gameBrowser",
                  "events":{"playGame":"__gameBrowser_playGame"},
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 8;
                     this.paddingRight = 8;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "minHeight":300,
                        "autoLayout":true
                     };
                  }
               })]};
            }
         });
         mgbCaches = MgbCaches.getInstance();
         super();
         mx_internal::_document = this;
      }
      
      private function set wishMessage(param1:String) : void
      {
         var _loc2_:Object = this._758502048wishMessage;
         if(_loc2_ !== param1)
         {
            this._758502048wishMessage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wishMessage",_loc2_,param1));
         }
      }
      
      private function playSelectedGame(param1:Object) : void
      {
         Application.application.accountManagement.pseudoLoginUsingViewMode(param1.username,param1.project,param1.map);
      }
      
      private function nullHandler(param1:String, param2:String = "", param3:String = "") : String
      {
         return !!param1 ? param1 + param2 : param3;
      }
      
      [Bindable(event="propertyChange")]
      private function get gamesAC() : ArrayCollection
      {
         return this._195588445gamesAC;
      }
      
      private function set ready(param1:Boolean) : void
      {
         var _loc2_:Object = this._108386723ready;
         if(_loc2_ !== param1)
         {
            this._108386723ready = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ready",_loc2_,param1));
         }
      }
      
      private function set _266666762userName(param1:String) : void
      {
         var _loc2_:MgbSystem = null;
         _userName = param1;
         ready = false;
         if(param1)
         {
            mgbCaches.profileCache.getPiece(_userName,MgbSystem.reservedSystemProjectName,MgbProfile.USER_PROFILE,profileLoadedHandler,false,true);
         }
         gameBrowser.chooseUser(param1);
      }
      
      private function set gamesAC(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._195588445gamesAC;
         if(_loc2_ !== param1)
         {
            this._195588445gamesAC = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gamesAC",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set userName(param1:String) : void
      {
         var _loc2_:Object = this.userName;
         if(_loc2_ !== param1)
         {
            this._266666762userName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userName",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      private function set profile(param1:MgbProfile) : void
      {
         var _loc2_:Object = this._309425751profile;
         if(_loc2_ !== param1)
         {
            this._309425751profile = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"profile",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gameBrowser() : GamesBrowser
      {
         return this._17400534gameBrowser;
      }
      
      private function profileLoadedHandler(param1:MgbProfile) : void
      {
         profile = param1;
         var _loc2_:String = String(nullHandler(param1.profileObj.wishListVote1,", ") + nullHandler(param1.profileObj.wishListVote2,", ") + nullHandler(param1.profileObj.wishListVote2,", "));
         if(_loc2_.length > 2)
         {
            _loc2_ = _loc2_.slice(0,_loc2_.length - 2);
         }
         if(param1.profileObj.wishListVoteFreeform)
         {
            _loc2_ = _loc2_ + " <b>and</b> " + param1.profileObj.wishListVoteFreeform;
         }
         this.wishMessage = _loc2_.length > 0 ? _loc2_ : "(No votes/wishes yet saved)";
         ready = true;
      }
      
      [Bindable(event="propertyChange")]
      private function get ready() : Boolean
      {
         return this._108386723ready;
      }
      
      [Bindable(event="propertyChange")]
      private function get wishMessage() : String
      {
         return this._758502048wishMessage;
      }
      
      [Bindable(event="propertyChange")]
      private function get profile() : MgbProfile
      {
         return this._309425751profile;
      }
      
      public function __gameBrowser_playGame(param1:GamesBrowserEvent) : void
      {
         playSelectedGame(param1);
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function set gameBrowser(param1:GamesBrowser) : void
      {
         var _loc2_:Object = this._17400534gameBrowser;
         if(_loc2_ !== param1)
         {
            this._17400534gameBrowser = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gameBrowser",_loc2_,param1));
         }
      }
   }
}
