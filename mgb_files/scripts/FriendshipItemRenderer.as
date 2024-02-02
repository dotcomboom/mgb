package
{
   import com.mgb.controls.BitmapDuper;
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
   import mx.controls.LinkButton;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.formatters.DateFormatter;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class FriendshipItemRenderer extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1428135628dateDisplay:DateFormatter;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindings:Array;
      
      private var _2101909190tilePreview:BitmapDuper;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public var _FriendshipItemRenderer_LinkButton1:LinkButton;
      
      public function FriendshipItemRenderer()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":80,
                  "height":96,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":BitmapDuper,
                     "id":"tilePreview",
                     "stylesFactory":function():void
                     {
                        this.top = "4";
                        this.horizontalCenter = "0";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "width":64,
                           "height":64
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":LinkButton,
                     "id":"_FriendshipItemRenderer_LinkButton1",
                     "events":{"click":"___FriendshipItemRenderer_LinkButton1_click"},
                     "stylesFactory":function():void
                     {
                        this.fontWeight = "bold";
                        this.horizontalCenter = "0";
                        this.bottom = "4";
                        this.textAlign = "center";
                        this.paddingBottom = 0;
                        this.paddingRight = 0;
                        this.paddingLeft = 0;
                        this.paddingTop = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {"width":78};
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
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.width = 80;
         this.height = 96;
         _FriendshipItemRenderer_DateFormatter1_i();
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         FriendshipItemRenderer._watcherSetupUtil = param1;
      }
      
      private function _FriendshipItemRenderer_DateFormatter1_i() : DateFormatter
      {
         var _loc1_:DateFormatter = new DateFormatter();
         dateDisplay = _loc1_;
         _loc1_.formatString = "MM/DD/YY";
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:FriendshipItemRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _FriendshipItemRenderer_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_FriendshipItemRendererWatcherSetupUtil");
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
      
      public function ___FriendshipItemRenderer_LinkButton1_click(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest(MgbSystem.baseMgbUrl + "#user=" + data.friendname + ";project=project1"),"page_" + data.friendname);
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
      
      public function set dateDisplay(param1:DateFormatter) : void
      {
         var _loc2_:Object = this._1428135628dateDisplay;
         if(_loc2_ !== param1)
         {
            this._1428135628dateDisplay = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dateDisplay",_loc2_,param1));
         }
      }
      
      private function _FriendshipItemRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "Friends since " + dateDisplay.format(data.friendingdate);
         _loc1_ = data.friendname;
         _loc1_ = data.friendname;
      }
      
      [Bindable(event="propertyChange")]
      public function get dateDisplay() : DateFormatter
      {
         return this._1428135628dateDisplay;
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePreview() : BitmapDuper
      {
         return this._2101909190tilePreview;
      }
      
      private function _FriendshipItemRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Friends since " + dateDisplay.format(data.friendingdate);
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.toolTip = param1;
         },"this.toolTip");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = data.friendname;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            tilePreview.avatarName = param1;
         },"tilePreview.avatarName");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = data.friendname;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _FriendshipItemRenderer_LinkButton1.label = param1;
         },"_FriendshipItemRenderer_LinkButton1.label");
         result[2] = binding;
         return result;
      }
   }
}
