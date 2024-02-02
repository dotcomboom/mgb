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
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.LinkButton;
   import mx.controls.Spacer;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ProfileTab extends VBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var textControls:Array;
      
      private var _1471460769_ownerName:String;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _1435981241favorite_books:ProfileTextEntry;
      
      private var _665949290things_I_can_help_others_with_in_MGB:ProfileTextEntry;
      
      private var _1236074404favorite_TV_shows:ProfileTextEntry;
      
      private var _1484547493general_info:ProfileTextEntry;
      
      private var _1425639998favorite_music:ProfileTextEntry;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1431782818favorite_games:ProfileTextEntry;
      
      private var _95593426dirty:Boolean = false;
      
      private var _1728655998things_I_need_help_with_in_MGB:ProfileTextEntry;
      
      private var _1250618554favorite_movies:ProfileTextEntry;
      
      public var _ProfileTab_HBox1:HBox;
      
      public var _ProfileTab_HBox2:HBox;
      
      private var _1260658248mgbLogger:MgbLogger;
      
      private var _957831062country:ProfileTextEntry;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      mx_internal var _bindings:Array;
      
      public function ProfileTab()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "id":"_ProfileTab_HBox1",
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 204;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":LinkButton,
                        "events":{"click":"___ProfileTab_LinkButton1_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Save Changes"};
                        }
                     }),new UIComponentDescriptor({
                        "type":LinkButton,
                        "events":{"click":"___ProfileTab_LinkButton2_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Cancel Changes"};
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"things_I_can_help_others_with_in_MGB",
                  "events":{"change":"__things_I_can_help_others_with_in_MGB_change"}
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"things_I_need_help_with_in_MGB",
                  "events":{"change":"__things_I_need_help_with_in_MGB_change"}
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"favorite_games",
                  "events":{"change":"__favorite_games_change"}
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"favorite_music",
                  "events":{"change":"__favorite_music_change"}
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"favorite_movies",
                  "events":{"change":"__favorite_movies_change"}
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"favorite_TV_shows",
                  "events":{"change":"__favorite_TV_shows_change"}
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"favorite_books",
                  "events":{"change":"__favorite_books_change"}
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"general_info",
                  "events":{"change":"__general_info_change"}
               }),new UIComponentDescriptor({
                  "type":ProfileTextEntry,
                  "id":"country",
                  "events":{"change":"__country_change"}
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "id":"_ProfileTab_HBox2",
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 204;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":LinkButton,
                        "events":{"click":"___ProfileTab_LinkButton3_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Save Changes"};
                        }
                     }),new UIComponentDescriptor({
                        "type":LinkButton,
                        "events":{"click":"___ProfileTab_LinkButton4_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Cancel Changes"};
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":Spacer,
                  "propertiesFactory":function():Object
                  {
                     return {"height":4};
                  }
               })]};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _1260658248mgbLogger = MgbLogger.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.horizontalScrollPolicy = "off";
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.addEventListener("creationComplete",___ProfileTab_VBox1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ProfileTab._watcherSetupUtil = param1;
      }
      
      public function set things_I_can_help_others_with_in_MGB(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._665949290things_I_can_help_others_with_in_MGB;
         if(_loc2_ !== param1)
         {
            this._665949290things_I_can_help_others_with_in_MGB = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"things_I_can_help_others_with_in_MGB",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get things_I_need_help_with_in_MGB() : ProfileTextEntry
      {
         return this._1728655998things_I_need_help_with_in_MGB;
      }
      
      public function set favorite_music(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._1425639998favorite_music;
         if(_loc2_ !== param1)
         {
            this._1425639998favorite_music = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"favorite_music",_loc2_,param1));
         }
      }
      
      public function set things_I_need_help_with_in_MGB(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._1728655998things_I_need_help_with_in_MGB;
         if(_loc2_ !== param1)
         {
            this._1728655998things_I_need_help_with_in_MGB = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"things_I_need_help_with_in_MGB",_loc2_,param1));
         }
      }
      
      public function set favorite_movies(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._1250618554favorite_movies;
         if(_loc2_ !== param1)
         {
            this._1250618554favorite_movies = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"favorite_movies",_loc2_,param1));
         }
      }
      
      public function ___ProfileTab_VBox1_creationComplete(param1:FlexEvent) : void
      {
         initControl();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ProfileTab = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ProfileTab_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ProfileTabWatcherSetupUtil");
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
      
      private function saveChanges() : void
      {
         var _loc1_:ProfileTextEntry = null;
         for each(_loc1_ in textControls)
         {
            if(_loc1_)
            {
               store(_loc1_.id,_loc1_.result);
               store(_loc1_.id + "--privateflag",_loc1_.isFieldPrivate ? "true" : "false");
            }
         }
         dirty = false;
      }
      
      public function ___ProfileTab_LinkButton2_click(param1:MouseEvent) : void
      {
         applyProfile();
      }
      
      public function ___ProfileTab_LinkButton4_click(param1:MouseEvent) : void
      {
         applyProfile();
      }
      
      private function set dirty(param1:Boolean) : void
      {
         var _loc2_:Object = this._95593426dirty;
         if(_loc2_ !== param1)
         {
            this._95593426dirty = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dirty",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get country() : ProfileTextEntry
      {
         return this._957831062country;
      }
      
      public function set favorite_books(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._1435981241favorite_books;
         if(_loc2_ !== param1)
         {
            this._1435981241favorite_books = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"favorite_books",_loc2_,param1));
         }
      }
      
      public function __favorite_movies_change(param1:Event) : void
      {
         dirty = true;
      }
      
      public function __general_info_change(param1:Event) : void
      {
         dirty = true;
      }
      
      private function initControl() : void
      {
         textControls = [country,favorite_games,favorite_music,favorite_movies,favorite_TV_shows,favorite_books,things_I_can_help_others_with_in_MGB,things_I_need_help_with_in_MGB,general_info];
         Application.application.registerForProfileUpdates(applyProfile);
      }
      
      private function set _17453022ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set favorite_TV_shows(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._1236074404favorite_TV_shows;
         if(_loc2_ !== param1)
         {
            this._1236074404favorite_TV_shows = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"favorite_TV_shows",_loc2_,param1));
         }
      }
      
      private function fetch(param1:String) : String
      {
         var _loc2_:String = String(Application.application.getUserProfile("profile-" + param1));
         return !!_loc2_ ? _loc2_ : "";
      }
      
      private function _ProfileTab_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = mgbSession.userName + "\'s Profile";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.label = param1;
         },"this.label");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dirty;
         },function(param1:Boolean):void
         {
            _ProfileTab_HBox1.enabled = param1;
         },"_ProfileTab_HBox1.enabled");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ProfileTab_HBox1.visible = param1;
         },"_ProfileTab_HBox1.visible");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ProfileTab_HBox1.includeInLayout = param1;
         },"_ProfileTab_HBox1.includeInLayout");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            things_I_can_help_others_with_in_MGB.ownerName = param1;
         },"things_I_can_help_others_with_in_MGB.ownerName");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            things_I_need_help_with_in_MGB.ownerName = param1;
         },"things_I_need_help_with_in_MGB.ownerName");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            favorite_games.ownerName = param1;
         },"favorite_games.ownerName");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            favorite_music.ownerName = param1;
         },"favorite_music.ownerName");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            favorite_movies.ownerName = param1;
         },"favorite_movies.ownerName");
         result[8] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            favorite_TV_shows.ownerName = param1;
         },"favorite_TV_shows.ownerName");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            favorite_books.ownerName = param1;
         },"favorite_books.ownerName");
         result[10] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            general_info.ownerName = param1;
         },"general_info.ownerName");
         result[11] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ownerName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            country.ownerName = param1;
         },"country.ownerName");
         result[12] = binding;
         binding = new Binding(this,function():Boolean
         {
            return dirty;
         },function(param1:Boolean):void
         {
            _ProfileTab_HBox2.enabled = param1;
         },"_ProfileTab_HBox2.enabled");
         result[13] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ProfileTab_HBox2.visible = param1;
         },"_ProfileTab_HBox2.visible");
         result[14] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _ProfileTab_HBox2.includeInLayout = param1;
         },"_ProfileTab_HBox2.includeInLayout");
         result[15] = binding;
         return result;
      }
      
      public function __things_I_need_help_with_in_MGB_change(param1:Event) : void
      {
         dirty = true;
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
      private function get mgbLogger() : MgbLogger
      {
         return this._1260658248mgbLogger;
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
      
      public function set country(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._957831062country;
         if(_loc2_ !== param1)
         {
            this._957831062country = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"country",_loc2_,param1));
         }
      }
      
      public function __things_I_can_help_others_with_in_MGB_change(param1:Event) : void
      {
         dirty = true;
      }
      
      [Bindable(event="propertyChange")]
      public function get favorite_movies() : ProfileTextEntry
      {
         return this._1250618554favorite_movies;
      }
      
      [Bindable(event="propertyChange")]
      public function get favorite_books() : ProfileTextEntry
      {
         return this._1435981241favorite_books;
      }
      
      [Bindable(event="propertyChange")]
      public function get favorite_music() : ProfileTextEntry
      {
         return this._1425639998favorite_music;
      }
      
      public function set favorite_games(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._1431782818favorite_games;
         if(_loc2_ !== param1)
         {
            this._1431782818favorite_games = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"favorite_games",_loc2_,param1));
         }
      }
      
      public function __favorite_games_change(param1:Event) : void
      {
         dirty = true;
      }
      
      [Bindable(event="propertyChange")]
      public function get general_info() : ProfileTextEntry
      {
         return this._1484547493general_info;
      }
      
      public function __favorite_TV_shows_change(param1:Event) : void
      {
         dirty = true;
      }
      
      public function __favorite_books_change(param1:Event) : void
      {
         dirty = true;
      }
      
      public function __country_change(param1:Event) : void
      {
         dirty = true;
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
      
      private function applyProfile(param1:Event = null) : void
      {
         var _loc2_:ProfileTextEntry = null;
         for each(_loc2_ in textControls)
         {
            if(_loc2_)
            {
               _loc2_.result = fetch(_loc2_.id);
               _loc2_.isFieldPrivate = fetch(_loc2_.id + "--privateflag") == "true";
            }
         }
         dirty = false;
      }
      
      public function ___ProfileTab_LinkButton3_click(param1:MouseEvent) : void
      {
         saveChanges();
      }
      
      [Bindable(event="propertyChange")]
      public function get favorite_games() : ProfileTextEntry
      {
         return this._1431782818favorite_games;
      }
      
      private function store(param1:String, param2:String) : void
      {
         Application.application.updateUserProfile("profile-" + param1,param2);
      }
      
      public function ___ProfileTab_LinkButton1_click(param1:MouseEvent) : void
      {
         saveChanges();
      }
      
      [Bindable(event="propertyChange")]
      public function get things_I_can_help_others_with_in_MGB() : ProfileTextEntry
      {
         return this._665949290things_I_can_help_others_with_in_MGB;
      }
      
      [Bindable(event="propertyChange")]
      public function get favorite_TV_shows() : ProfileTextEntry
      {
         return this._1236074404favorite_TV_shows;
      }
      
      public function __favorite_music_change(param1:Event) : void
      {
         dirty = true;
      }
      
      private function set mgbLogger(param1:MgbLogger) : void
      {
         var _loc2_:Object = this._1260658248mgbLogger;
         if(_loc2_ !== param1)
         {
            this._1260658248mgbLogger = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbLogger",_loc2_,param1));
         }
      }
      
      private function _ProfileTab_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = mgbSession.userName + "\'s Profile";
         _loc1_ = dirty;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = ownerName;
         _loc1_ = ownerName;
         _loc1_ = ownerName;
         _loc1_ = ownerName;
         _loc1_ = ownerName;
         _loc1_ = ownerName;
         _loc1_ = ownerName;
         _loc1_ = ownerName;
         _loc1_ = ownerName;
         _loc1_ = dirty;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function set general_info(param1:ProfileTextEntry) : void
      {
         var _loc2_:Object = this._1484547493general_info;
         if(_loc2_ !== param1)
         {
            this._1484547493general_info = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"general_info",_loc2_,param1));
         }
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
      
      [Bindable(event="propertyChange")]
      private function get dirty() : Boolean
      {
         return this._95593426dirty;
      }
   }
}
