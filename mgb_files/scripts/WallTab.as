package
{
   import com.mgb.data.MgbWall;
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
   import mx.containers.HBox;
   import mx.controls.*;
   import mx.core.*;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class WallTab extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1354268775WallpostsList:List;
      
      private var _1471460769_ownerName:String;
      
      public var _WallTab_LinkButton1:LinkButton;
      
      public var _WallTab_LinkButton2:LinkButton;
      
      mx_internal var _watchers:Array;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _3641802wall:MgbWall;
      
      public var _WallTab_HBox1:HBox;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _WallTab_Image1:Image;
      
      private var _embed_mxml_Resources_trashcan2_png_1044093694:Class;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _205422649greeting:TextInput;
      
      public function WallTab()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "id":"_WallTab_HBox1",
                  "stylesFactory":function():void
                  {
                     this.top = "8";
                     this.left = "8";
                     this.paddingTop = 5;
                     this.paddingBottom = 4;
                     this.paddingRight = 6;
                     this.right = "80";
                     this.backgroundColor = 0;
                     this.backgroundAlpha = 0.1;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_WallTab_LinkButton1",
                        "events":{"click":"___WallTab_LinkButton1_click"}
                     }),new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"greeting",
                        "stylesFactory":function():void
                        {
                           this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "text":"",
                              "editable":true,
                              "percentWidth":100
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_WallTab_LinkButton2",
                        "events":{"click":"___WallTab_LinkButton2_click"},
                        "stylesFactory":function():void
                        {
                           this.disabledColor = 255;
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":List,
                  "id":"WallpostsList",
                  "stylesFactory":function():void
                  {
                     this.top = "48";
                     this.bottom = "4";
                     this.left = "4";
                     this.right = "4";
                     this.borderStyle = "none";
                     this.backgroundAlpha = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "itemRenderer":_WallTab_ClassFactory1_c(),
                        "allowMultipleSelection":false,
                        "dragEnabled":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"_WallTab_Image1",
                  "events":{
                     "dragDrop":"___WallTab_Image1_dragDrop",
                     "dragEnter":"___WallTab_Image1_dragEnter",
                     "click":"___WallTab_Image1_click"
                  },
                  "stylesFactory":function():void
                  {
                     this.top = "0";
                     this.right = "20";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":48,
                        "height":48,
                        "source":_embed_mxml_Resources_trashcan2_png_1044093694,
                        "toolTip":"You can delete posts by dragging them to this trashcan",
                        "filters":[_WallTab_GlowFilter1_c()]
                     };
                  }
               })]};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _embed_mxml_Resources_trashcan2_png_1044093694 = WallTab__embed_mxml_Resources_trashcan2_png_1044093694;
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         WallTab._watcherSetupUtil = param1;
      }
      
      public function ___WallTab_LinkButton1_click(param1:MouseEvent) : void
      {
         wall.addWallpost(mgbSession.authenticatedName,greeting.text);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:WallTab = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _WallTab_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_WallTabWatcherSetupUtil");
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
      
      private function set wall(param1:MgbWall) : void
      {
         var _loc2_:Object = this._3641802wall;
         if(_loc2_ !== param1)
         {
            this._3641802wall = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wall",_loc2_,param1));
         }
      }
      
      private function _WallTab_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = wall.recipient + "\'s Wall";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.label = param1;
         },"this.label");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.authenticatedName != null;
         },function(param1:Boolean):void
         {
            _WallTab_HBox1.visible = param1;
         },"_WallTab_HBox1.visible");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.authenticatedName != null;
         },function(param1:Boolean):void
         {
            _WallTab_HBox1.includeInLayout = param1;
         },"_WallTab_HBox1.includeInLayout");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Post Wall Message from " + mgbSession.authenticatedName + ": ";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _WallTab_LinkButton1.label = param1;
         },"_WallTab_LinkButton1.label");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return greeting.text.length > 0;
         },function(param1:Boolean):void
         {
            _WallTab_LinkButton1.enabled = param1;
         },"_WallTab_LinkButton1.enabled");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Leave a message on " + wall.recipient + "\'s Wall";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            greeting.toolTip = param1;
         },"greeting.toolTip");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !!wall.refreshPending ? "Refreshing" : "Refresh";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _WallTab_LinkButton2.label = param1;
         },"_WallTab_LinkButton2.label");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !wall.refreshPending;
         },function(param1:Boolean):void
         {
            _WallTab_LinkButton2.enabled = param1;
         },"_WallTab_LinkButton2.enabled");
         result[7] = binding;
         binding = new Binding(this,function():Object
         {
            return wall.wallpostsListAC;
         },function(param1:Object):void
         {
            WallpostsList.dataProvider = param1;
         },"WallpostsList.dataProvider");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return !mgbSession.userLoggedInIsGuest;
         },function(param1:Boolean):void
         {
            _WallTab_Image1.visible = param1;
         },"_WallTab_Image1.visible");
         result[9] = binding;
         return result;
      }
      
      private function set _17453022ownerName(param1:String) : void
      {
         _ownerName = param1;
         wall = MgbCaches.getInstance().wallsCache.getWall(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get greeting() : TextInput
      {
         return this._205422649greeting;
      }
      
      public function ___WallTab_LinkButton2_click(param1:MouseEvent) : void
      {
         wall.refresh();
      }
      
      private function _WallTab_GlowFilter1_c() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.6;
         _loc1_.blurX = 18;
         _loc1_.blurY = 18;
         return _loc1_;
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
      
      public function ___WallTab_Image1_dragDrop(param1:DragEvent) : void
      {
         trashcanDragDrop(param1);
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
      
      private function trashcanDragEnter(param1:DragEvent) : void
      {
         var _loc2_:Image = Image(param1.currentTarget);
         if(param1.dragSource.hasFormat("items"))
         {
            DragManager.acceptDragDrop(_loc2_);
         }
      }
      
      public function ___WallTab_Image1_dragEnter(param1:DragEvent) : void
      {
         trashcanDragEnter(param1);
      }
      
      private function _WallTab_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WallpostItemRenderer;
         return _loc1_;
      }
      
      public function set WallpostsList(param1:List) : void
      {
         var _loc2_:Object = this._1354268775WallpostsList;
         if(_loc2_ !== param1)
         {
            this._1354268775WallpostsList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"WallpostsList",_loc2_,param1));
         }
      }
      
      public function ___WallTab_Image1_click(param1:MouseEvent) : void
      {
         Alert.show("You can delete posts by dragging them to this trashcan");
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
      
      [Bindable(event="propertyChange")]
      private function get wall() : MgbWall
      {
         return this._3641802wall;
      }
      
      [Bindable(event="propertyChange")]
      public function get WallpostsList() : List
      {
         return this._1354268775WallpostsList;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      public function set greeting(param1:TextInput) : void
      {
         var _loc2_:Object = this._205422649greeting;
         if(_loc2_ !== param1)
         {
            this._205422649greeting = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"greeting",_loc2_,param1));
         }
      }
      
      private function _WallTab_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = wall.recipient + "\'s Wall";
         _loc1_ = mgbSession.authenticatedName != null;
         _loc1_ = mgbSession.authenticatedName != null;
         _loc1_ = "Post Wall Message from " + mgbSession.authenticatedName + ": ";
         _loc1_ = greeting.text.length > 0;
         _loc1_ = "Leave a message on " + wall.recipient + "\'s Wall";
         _loc1_ = !!wall.refreshPending ? "Refreshing" : "Refresh";
         _loc1_ = !wall.refreshPending;
         _loc1_ = wall.wallpostsListAC;
         _loc1_ = !mgbSession.userLoggedInIsGuest;
      }
      
      private function trashcanDragDrop(param1:DragEvent) : void
      {
         var _loc2_:Array = null;
         if(mgbSession.userLoggedInIsGuest)
         {
            Alert.show("As a guest, you are not allowed to delete messages!");
         }
         else
         {
            _loc2_ = param1.dragSource.dataForFormat("items") as Array;
            wall.deleteWallpost(_loc2_[0].postId);
         }
      }
   }
}
