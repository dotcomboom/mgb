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
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class LoginTilePreviewControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1714148973displayName:TextArea;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindings:Array;
      
      private var _90810505_data:Object;
      
      private var _2101909190tilePreview:BitmapDuper;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function LoginTilePreviewControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":80,
                  "height":120,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":BitmapDuper,
                     "id":"tilePreview",
                     "events":{"creationComplete":"__tilePreview_creationComplete"},
                     "stylesFactory":function():void
                     {
                        this.horizontalCenter = "0";
                        this.top = "8";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "width":64,
                           "height":64
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":TextArea,
                     "id":"displayName",
                     "stylesFactory":function():void
                     {
                        this.horizontalCenter = "0";
                        this.bottom = "0";
                        this.textAlign = "center";
                        this.borderStyle = "none";
                        this.backgroundAlpha = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "width":76,
                           "height":44,
                           "editable":false,
                           "styleName":"denseTable",
                           "wordWrap":true
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
         this.width = 80;
         this.height = 120;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         LoginTilePreviewControl._watcherSetupUtil = param1;
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
      
      private function draw() : void
      {
         if(Boolean(tilePreview) && Boolean(_data))
         {
            if(_data.name == null || _data.name == "" || MgbSession.getInstance().userName == null)
            {
               tilePreview.drawDupe(null);
            }
            else
            {
               tilePreview.drawDupeFromName(MgbSession.getInstance().userName,MgbSession.getInstance().activeProject,_data.name,"",false);
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _data() : Object
      {
         return this._90810505_data;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:LoginTilePreviewControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _LoginTilePreviewControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_LoginTilePreviewControlWatcherSetupUtil");
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
      
      private function set _data(param1:Object) : void
      {
         var _loc2_:Object = this._90810505_data;
         if(_loc2_ !== param1)
         {
            this._90810505_data = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_data",_loc2_,param1));
         }
      }
      
      public function __tilePreview_creationComplete(param1:FlexEvent) : void
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
      
      public function set displayName(param1:TextArea) : void
      {
         var _loc2_:Object = this._1714148973displayName;
         if(_loc2_ !== param1)
         {
            this._1714148973displayName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayName",_loc2_,param1));
         }
      }
      
      private function _LoginTilePreviewControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = _data.name;
         _loc1_ = _data.name;
      }
      
      [Bindable(event="propertyChange")]
      public function get displayName() : TextArea
      {
         return this._1714148973displayName;
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
      
      private function _LoginTilePreviewControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _data.name;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.toolTip = param1;
         },"this.toolTip");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _data.name;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            displayName.text = param1;
         },"displayName.text");
         result[1] = binding;
         return result;
      }
   }
}
