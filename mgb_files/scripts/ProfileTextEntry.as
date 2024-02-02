package
{
   import com.mgb.data.MgbFriendship;
   import com.mgb.data.MgbFriendshipsList;
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
   import mx.containers.HBox;
   import mx.controls.CheckBox;
   import mx.controls.Label;
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ProfileTextEntry extends HBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _ProfileTextEntry_Label1:Label;
      
      private var _1626743490promptWidth:int = 200;
      
      private var _1471460769_ownerName:String;
      
      private var _1003243718textarea:TextArea;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var pattern:RegExp;
      
      private var _670476014isFieldPrivateCB:CheckBox;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1728665219_prompt:String = null;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1405524947friendsList:MgbFriendshipsList;
      
      mx_internal var _bindings:Array;
      
      private var _31177144ownersfriendshipList:MgbFriendshipsList;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ProfileTextEntry()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Label,
                  "id":"_ProfileTextEntry_Label1",
                  "stylesFactory":function():void
                  {
                     this.textAlign = "right";
                     this.fontWeight = "bold";
                  }
               }),new UIComponentDescriptor({
                  "type":TextArea,
                  "id":"textarea",
                  "events":{"change":"__textarea_change"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "wordWrap":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":CheckBox,
                  "id":"isFieldPrivateCB",
                  "events":{"change":"__isFieldPrivateCB_change"},
                  "stylesFactory":function():void
                  {
                     this.fontWeight = "bold";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"Private",
                        "toolTip":"Private means only your \'friends\' can read this line in your profile.    Not-private means \'public\' - i.e. anyone can read this line in your profile."
                     };
                  }
               })]};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         pattern = /_/g;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.horizontalGap = 8;
            this.paddingRight = 16;
         };
         this.percentWidth = 100;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ProfileTextEntry._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      private function get _prompt() : String
      {
         return this._1728665219_prompt;
      }
      
      private function set _prompt(param1:String) : void
      {
         var _loc2_:Object = this._1728665219_prompt;
         if(_loc2_ !== param1)
         {
            this._1728665219_prompt = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_prompt",_loc2_,param1));
         }
      }
      
      public function set promptWidth(param1:int) : void
      {
         var _loc2_:Object = this._1626743490promptWidth;
         if(_loc2_ !== param1)
         {
            this._1626743490promptWidth = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptWidth",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isFieldPrivateCB() : CheckBox
      {
         return this._670476014isFieldPrivateCB;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ProfileTextEntry = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ProfileTextEntry_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ProfileTextEntryWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },bindings,watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         super.initialize();
      }
      
      public function get result() : String
      {
         return textarea.text;
      }
      
      private function set _934426595result(param1:String) : void
      {
         textarea.text = param1;
      }
      
      public function set isFieldPrivateCB(param1:CheckBox) : void
      {
         var _loc2_:Object = this._670476014isFieldPrivateCB;
         if(_loc2_ !== param1)
         {
            this._670476014isFieldPrivateCB = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isFieldPrivateCB",_loc2_,param1));
         }
      }
      
      private function set friendsList(param1:MgbFriendshipsList) : void
      {
         var _loc2_:Object = this._1405524947friendsList;
         if(_loc2_ !== param1)
         {
            this._1405524947friendsList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"friendsList",_loc2_,param1));
         }
      }
      
      public function __isFieldPrivateCB_change(param1:Event) : void
      {
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function set _17453022ownerName(param1:String) : void
      {
         _ownerName = param1;
         ownersfriendshipList = MgbCaches.getInstance().friendshipsListCache.getFriendships(param1);
      }
      
      [Bindable(event="propertyChange")]
      private function get ownersfriendshipList() : MgbFriendshipsList
      {
         return this._31177144ownersfriendshipList;
      }
      
      [Bindable(event="propertyChange")]
      public function get textarea() : TextArea
      {
         return this._1003243718textarea;
      }
      
      [Bindable(event="propertyChange")]
      public function set ownerName(param1:String) : void
      {
         var _loc2_:Object = this.ownerName;
         if(_loc2_ !== param1)
         {
            this._17453022ownerName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ownerName",_loc2_,param1));
         }
      }
      
      private function _ProfileTextEntry_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = prompt + ":";
         _loc1_ = promptWidth;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = MgbSystem.restrictCharactersInCommentStrings;
         _loc1_ = !isFieldPrivate || !mgbSession.userLoggedInIsGuest || isFriend(mgbSession.authenticatedName);
         _loc1_ = !mgbSession.userLoggedInIsGuest;
      }
      
      private function set _948182669isFieldPrivate(param1:Boolean) : void
      {
         isFieldPrivateCB.selected = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set result(param1:String) : void
      {
         var _loc2_:Object = this.result;
         if(_loc2_ !== param1)
         {
            this._934426595result = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"result",_loc2_,param1));
         }
      }
      
      private function set _ownerName(param1:String) : void
      {
         var _loc2_:Object = this._1471460769_ownerName;
         if(_loc2_ !== param1)
         {
            this._1471460769_ownerName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ownerName",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set prompt(param1:String) : void
      {
         var _loc2_:Object = this.prompt;
         if(_loc2_ !== param1)
         {
            this._979805852prompt = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"prompt",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get promptWidth() : int
      {
         return this._1626743490promptWidth;
      }
      
      [Bindable(event="propertyChange")]
      private function get friendsList() : MgbFriendshipsList
      {
         return this._1405524947friendsList;
      }
      
      private function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      [Bindable(event="propertyChange")]
      private function get _ownerName() : String
      {
         return this._1471460769_ownerName;
      }
      
      public function get prompt() : String
      {
         return !!_prompt ? String(_prompt) : String(this.id.substring(0,1).toUpperCase() + this.id.substring(1)).replace(pattern," ");
      }
      
      private function isFriend(param1:String) : Boolean
      {
         var _loc2_:MgbFriendship = null;
         for each(_loc2_ in ownersfriendshipList.friendshipsListAC)
         {
            if(_loc2_.friendname == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function _ProfileTextEntry_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = prompt + ":";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ProfileTextEntry_Label1.text = param1;
         },"_ProfileTextEntry_Label1.text");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return promptWidth;
         },function(param1:Number):void
         {
            _ProfileTextEntry_Label1.width = param1;
         },"_ProfileTextEntry_Label1.width");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            textarea.editable = param1;
         },"textarea.editable");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.restrictCharactersInCommentStrings;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            textarea.restrict = param1;
         },"textarea.restrict");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !isFieldPrivate || !mgbSession.userLoggedInIsGuest || Boolean(isFriend(mgbSession.authenticatedName));
         },function(param1:Boolean):void
         {
            textarea.visible = param1;
         },"textarea.visible");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            isFieldPrivateCB.enabled = param1;
         },"isFieldPrivateCB.enabled");
         result[5] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function set _979805852prompt(param1:String) : void
      {
         _prompt = param1;
      }
      
      public function get isFieldPrivate() : Boolean
      {
         return isFieldPrivateCB.selected;
      }
      
      public function set textarea(param1:TextArea) : void
      {
         var _loc2_:Object = this._1003243718textarea;
         if(_loc2_ !== param1)
         {
            this._1003243718textarea = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textarea",_loc2_,param1));
         }
      }
      
      private function set ownersfriendshipList(param1:MgbFriendshipsList) : void
      {
         var _loc2_:Object = this._31177144ownersfriendshipList;
         if(_loc2_ !== param1)
         {
            this._31177144ownersfriendshipList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ownersfriendshipList",_loc2_,param1));
         }
      }
      
      public function __textarea_change(param1:Event) : void
      {
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      [Bindable(event="propertyChange")]
      public function set isFieldPrivate(param1:Boolean) : void
      {
         var _loc2_:Object = this.isFieldPrivate;
         if(_loc2_ !== param1)
         {
            this._948182669isFieldPrivate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isFieldPrivate",_loc2_,param1));
         }
      }
   }
}
