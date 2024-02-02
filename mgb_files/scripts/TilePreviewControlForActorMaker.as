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
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class TilePreviewControlForActorMaker extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _2101909190tilePreview:BitmapDuper;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      mx_internal var _watchers:Array;
      
      public function TilePreviewControlForActorMaker()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":BitmapDuper,
                  "id":"tilePreview",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":0,
                        "y":0
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
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("dataChange",___TilePreviewControlForActorMaker_Canvas1_dataChange);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         TilePreviewControlForActorMaker._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePreview() : BitmapDuper
      {
         return this._2101909190tilePreview;
      }
      
      private function _TilePreviewControlForActorMaker_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = MgbSystem.tilePreviewWidth;
         _loc1_ = MgbSystem.tilePreviewHeight;
         _loc1_ = MgbSystem.tilePreviewWidth;
         _loc1_ = MgbSystem.tilePreviewHeight;
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
      
      private function _TilePreviewControlForActorMaker_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tilePreviewWidth;
         },function(param1:Number):void
         {
            this.width = param1;
         },"this.width");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tilePreviewHeight;
         },function(param1:Number):void
         {
            this.height = param1;
         },"this.height");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tilePreviewWidth;
         },function(param1:Number):void
         {
            tilePreview.width = param1;
         },"tilePreview.width");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return MgbSystem.tilePreviewHeight;
         },function(param1:Number):void
         {
            tilePreview.height = param1;
         },"tilePreview.height");
         result[3] = binding;
         return result;
      }
      
      public function ___TilePreviewControlForActorMaker_Canvas1_dataChange(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:TilePreviewControlForActorMaker = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _TilePreviewControlForActorMaker_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_TilePreviewControlForActorMakerWatcherSetupUtil");
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
      
      private function setSelectedItem(param1:Event) : void
      {
         var _loc2_:MgbSession = MgbSession.getInstance();
         var _loc3_:String = "";
         if(data != null && data.effect != null)
         {
            _loc3_ = String(data.effect);
         }
         if(!data || !data.tilename || data.tilename == "")
         {
            tilePreview.drawDupeFromName(_loc2_.userName,_loc2_.activeProject,Application.application.actorMaker.defaultTilename,_loc3_);
         }
         else
         {
            tilePreview.drawDupeFromName(_loc2_.userName,_loc2_.activeProject,data.tilename,_loc3_);
         }
         tilePreview.shrinkToFitEnabled = true;
      }
   }
}
