package
{
   import com.mgb.controls.ActorPreview;
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
   import mx.containers.Canvas;
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class LoginActorPreviewControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1714148973displayName:TextArea;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _205235219actorPreview:ActorPreview;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function LoginActorPreviewControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":80,
                  "height":120,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":ActorPreview,
                     "id":"actorPreview",
                     "stylesFactory":function():void
                     {
                        this.top = "8";
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
         this.addEventListener("dataChange",___LoginActorPreviewControl_Canvas1_dataChange);
         this.addEventListener("creationComplete",___LoginActorPreviewControl_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         LoginActorPreviewControl._watcherSetupUtil = param1;
      }
      
      private function setSelectedItem(param1:Event) : void
      {
         if(Boolean(actorPreview) && Boolean(data))
         {
            if(data.name == null || data.name == "")
            {
               actorPreview.show(null);
            }
            else
            {
               actorPreview.show(MgbActor(MgbCaches.getInstance().actorCache.getPiece(MgbSession.getInstance().userName,MgbSession.getInstance().activeProject,data.name)));
            }
            displayName.text = data.name;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actorPreview() : ActorPreview
      {
         return this._205235219actorPreview;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:LoginActorPreviewControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _LoginActorPreviewControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_LoginActorPreviewControlWatcherSetupUtil");
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
      
      public function ___LoginActorPreviewControl_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
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
      
      public function set actorPreview(param1:ActorPreview) : void
      {
         var _loc2_:Object = this._205235219actorPreview;
         if(_loc2_ !== param1)
         {
            this._205235219actorPreview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actorPreview",_loc2_,param1));
         }
      }
      
      private function _LoginActorPreviewControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = actorPreview.toolTip;
      }
      
      public function ___LoginActorPreviewControl_Canvas1_dataChange(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      private function _LoginActorPreviewControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = actorPreview.toolTip;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.toolTip = param1;
         },"this.toolTip");
         result[0] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get displayName() : TextArea
      {
         return this._1714148973displayName;
      }
   }
}
