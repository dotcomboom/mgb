package
{
   import com.mgb.controls.AutoTruncatedLabel;
   import com.mgb.controls.BitmapDuper;
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
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.controls.Spacer;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.formatters.DateFormatter;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class WallpostItemRenderer extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1428135628dateDisplay:DateFormatter;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _WallpostItemRenderer_AutoTruncatedLabel1:AutoTruncatedLabel;
      
      mx_internal var _watchers:Array;
      
      public var _WallpostItemRenderer_Label1:Label;
      
      mx_internal var _bindings:Array;
      
      private var _2101909190tilePreview:BitmapDuper;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function WallpostItemRenderer()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
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
                           "type":VBox,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":AutoTruncatedLabel,
                                    "id":"_WallpostItemRenderer_AutoTruncatedLabel1",
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentWidth":100};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_WallpostItemRenderer_Label1",
                                    "propertiesFactory":function():Object
                                    {
                                       return {"alpha":0.7};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               })]};
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
         this.percentWidth = 100;
         _WallpostItemRenderer_DateFormatter1_i();
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         WallpostItemRenderer._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePreview() : BitmapDuper
      {
         return this._2101909190tilePreview;
      }
      
      private function _WallpostItemRenderer_bindingsSetup() : Array
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
            var _loc1_:* = data.fromname;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            tilePreview.avatarName = param1;
         },"tilePreview.avatarName");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = data.body;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _WallpostItemRenderer_AutoTruncatedLabel1.text = param1;
         },"_WallpostItemRenderer_AutoTruncatedLabel1.text");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Posted by " + data.fromname + " at " + dateDisplay.format(data.date);
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _WallpostItemRenderer_Label1.text = param1;
         },"_WallpostItemRenderer_Label1.text");
         result[3] = binding;
         return result;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:WallpostItemRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _WallpostItemRenderer_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_WallpostItemRendererWatcherSetupUtil");
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
      
      private function _WallpostItemRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "Friends since " + dateDisplay.format(data.friendingdate);
         _loc1_ = data.fromname;
         _loc1_ = data.body;
         _loc1_ = "Posted by " + data.fromname + " at " + dateDisplay.format(data.date);
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
      
      [Bindable(event="propertyChange")]
      public function get dateDisplay() : DateFormatter
      {
         return this._1428135628dateDisplay;
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
      
      private function _WallpostItemRenderer_DateFormatter1_i() : DateFormatter
      {
         var _loc1_:DateFormatter = new DateFormatter();
         dateDisplay = _loc1_;
         _loc1_.formatString = "MM/DD/YY L:NN A";
         return _loc1_;
      }
   }
}
