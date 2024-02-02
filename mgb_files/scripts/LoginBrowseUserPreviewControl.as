package
{
   import com.mgb.controls.*;
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
   import mx.containers.Canvas;
   import mx.controls.Label;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class LoginBrowseUserPreviewControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1640368317loginCountShow:Label;
      
      public var _LoginBrowseUserPreviewControl_Label1:Label;
      
      private var _data:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      private var _386765751badgeCountShow:Label;
      
      private var _1054905132badgeCount:int = 0;
      
      private var _1773622490loginCount:String = "";
      
      mx_internal var _bindings:Array;
      
      private var _2101909190tilePreview:BitmapDuper;
      
      private var _103149417login:String = "";
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function LoginBrowseUserPreviewControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":240,
                  "height":92,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":BitmapDuper,
                     "id":"tilePreview",
                     "stylesFactory":function():void
                     {
                        this.right = "16";
                        this.verticalCenter = "0";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "width":64,
                           "height":64
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"_LoginBrowseUserPreviewControl_Label1",
                     "stylesFactory":function():void
                     {
                        this.textAlign = "left";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":8,
                           "y":8,
                           "width":132
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"loginCountShow",
                     "stylesFactory":function():void
                     {
                        this.textAlign = "left";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":8,
                           "y":32,
                           "width":132
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"badgeCountShow",
                     "stylesFactory":function():void
                     {
                        this.textAlign = "left";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":8,
                           "y":56,
                           "width":132
                        };
                     }
                  })]
               };
            }
         });
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
            this.borderColor = 0;
            this.borderStyle = "solid";
         };
         this.width = 240;
         this.height = 92;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.addEventListener("creationComplete",___LoginBrowseUserPreviewControl_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         LoginBrowseUserPreviewControl._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get loginCountShow() : Label
      {
         return this._1640368317loginCountShow;
      }
      
      private function draw() : void
      {
         if(Boolean(tilePreview) && Boolean(data))
         {
            tilePreview.drawAvatar(data.login);
            login = data.login;
            loginCount = !!data["login-count"] ? String(data["login-count"]) : "0";
            badgeCount = Badge.utilCountBadgesInString(data.badges);
            toolTip = data.login + "\nMember since " + String(data["created-at"]).slice(0,10) + "\n" + (!!badgeCount ? "Badges: " + data.badges : "No badges yet");
            loginCountShow.visible = int(loginCount) > 9;
         }
      }
      
      private function set badgeCount(param1:int) : void
      {
         var _loc2_:Object = this._1054905132badgeCount;
         if(_loc2_ !== param1)
         {
            this._1054905132badgeCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"badgeCount",_loc2_,param1));
         }
      }
      
      public function set loginCountShow(param1:Label) : void
      {
         var _loc2_:Object = this._1640368317loginCountShow;
         if(_loc2_ !== param1)
         {
            this._1640368317loginCountShow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loginCountShow",_loc2_,param1));
         }
      }
      
      private function _LoginBrowseUserPreviewControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "User: " + login;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _LoginBrowseUserPreviewControl_Label1.text = param1;
         },"_LoginBrowseUserPreviewControl_Label1.text");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Visits: " + loginCount;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            loginCountShow.text = param1;
         },"loginCountShow.text");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Badges: " + badgeCount;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            badgeCountShow.text = param1;
         },"badgeCountShow.text");
         result[2] = binding;
         return result;
      }
      
      private function _LoginBrowseUserPreviewControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "User: " + login;
         _loc1_ = "Visits: " + loginCount;
         _loc1_ = "Badges: " + badgeCount;
      }
      
      public function set badgeCountShow(param1:Label) : void
      {
         var _loc2_:Object = this._386765751badgeCountShow;
         if(_loc2_ !== param1)
         {
            this._386765751badgeCountShow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"badgeCountShow",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:LoginBrowseUserPreviewControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _LoginBrowseUserPreviewControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_LoginBrowseUserPreviewControlWatcherSetupUtil");
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
      
      public function ___LoginBrowseUserPreviewControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         draw();
      }
      
      [Bindable(event="propertyChange")]
      override public function set data(param1:Object) : void
      {
         var _loc2_:Object = this.data;
         if(_loc2_ !== param1)
         {
            this._3076010data = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"data",_loc2_,param1));
         }
      }
      
      private function set loginCount(param1:String) : void
      {
         var _loc2_:Object = this._1773622490loginCount;
         if(_loc2_ !== param1)
         {
            this._1773622490loginCount = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loginCount",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get badgeCount() : int
      {
         return this._1054905132badgeCount;
      }
      
      [Bindable(event="propertyChange")]
      private function get loginCount() : String
      {
         return this._1773622490loginCount;
      }
      
      [Bindable(event="propertyChange")]
      private function get login() : String
      {
         return this._103149417login;
      }
      
      [Bindable(event="propertyChange")]
      public function get badgeCountShow() : Label
      {
         return this._386765751badgeCountShow;
      }
      
      public function set tilePreview(param1:BitmapDuper) : void
      {
         var _loc2_:Object = this._2101909190tilePreview;
         if(_loc2_ !== param1)
         {
            this._2101909190tilePreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilePreview",_loc2_,param1));
         }
      }
      
      override public function get data() : Object
      {
         return _data;
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePreview() : BitmapDuper
      {
         return this._2101909190tilePreview;
      }
      
      public function set _3076010data(param1:Object) : void
      {
         _data = param1;
         draw();
      }
      
      private function set login(param1:String) : void
      {
         var _loc2_:Object = this._103149417login;
         if(_loc2_ !== param1)
         {
            this._103149417login = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"login",_loc2_,param1));
         }
      }
   }
}
