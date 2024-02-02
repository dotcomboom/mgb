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
   import mx.containers.Canvas;
   import mx.containers.VBox;
   import mx.controls.Text;
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class RendererMapPiece extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _339016920showName:String;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var _RendererMapPiece_TextArea1:TextArea;
      
      public var _RendererMapPiece_VBox1:VBox;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      public var _RendererMapPiece_Text1:Text;
      
      public var _RendererMapPiece_Text2:Text;
      
      private var _1338557602showComment:String;
      
      mx_internal var _bindings:Array;
      
      private var _339310802showDesc:String;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _338859874showSize:String;
      
      public function RendererMapPiece()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":96,
                  "height":120,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "id":"_RendererMapPiece_VBox1",
                     "stylesFactory":function():void
                     {
                        this.borderThickness = 2;
                        this.borderStyle = "solid";
                        this.borderColor = 16777215;
                        this.backgroundColor = 14737632;
                        this.verticalGap = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "verticalScrollPolicy":"off",
                           "horizontalScrollPolicy":"off",
                           "clipContent":true,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":TextArea,
                              "id":"_RendererMapPiece_TextArea1",
                              "stylesFactory":function():void
                              {
                                 this.borderStyle = "none";
                                 this.backgroundColor = 13684944;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "height":68,
                                    "styleName":"denseTable",
                                    "wordWrap":true,
                                    "editable":false,
                                    "selectable":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"_RendererMapPiece_Text1",
                              "stylesFactory":function():void
                              {
                                 this.color = 8421504;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "styleName":"denseTable",
                                    "selectable":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"_RendererMapPiece_Text2",
                              "stylesFactory":function():void
                              {
                                 this.color = 8421504;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "styleName":"denseTable",
                                    "selectable":false
                                 };
                              }
                           })]
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
         this.width = 96;
         this.height = 120;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.clipContent = true;
         this.addEventListener("dataChange",___RendererMapPiece_Canvas1_dataChange);
         this.addEventListener("creationComplete",___RendererMapPiece_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         RendererMapPiece._watcherSetupUtil = param1;
      }
      
      private function set showSize(param1:String) : void
      {
         var _loc2_:Object = this._338859874showSize;
         if(_loc2_ !== param1)
         {
            this._338859874showSize = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showSize",_loc2_,param1));
         }
      }
      
      private function set showName(param1:String) : void
      {
         var _loc2_:Object = this._339016920showName;
         if(_loc2_ !== param1)
         {
            this._339016920showName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showName",_loc2_,param1));
         }
      }
      
      private function set showComment(param1:String) : void
      {
         var _loc2_:Object = this._1338557602showComment;
         if(_loc2_ !== param1)
         {
            this._1338557602showComment = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showComment",_loc2_,param1));
         }
      }
      
      private function setSelectedItem(param1:Event) : void
      {
         if(MgbSession.getInstance().activeProject == null || MgbSession.getInstance().userName == null)
         {
            return;
         }
         var _loc2_:MgbMap = MgbMap(MgbCaches.getInstance().mapCache.getPiece(MgbSession.getInstance().userName,MgbSession.getInstance().activeProject,data.name,getMapResult,false,true));
         if(!_loc2_ || true == _loc2_.loadPending)
         {
            showName = data.name;
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:RendererMapPiece = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _RendererMapPiece_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_RendererMapPieceWatcherSetupUtil");
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
      
      private function set showDesc(param1:String) : void
      {
         var _loc2_:Object = this._339310802showDesc;
         if(_loc2_ !== param1)
         {
            this._339310802showDesc = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showDesc",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get showSize() : String
      {
         return this._338859874showSize;
      }
      
      public function getMapResult(param1:MgbMap) : void
      {
         if(param1)
         {
            showName = param1.name;
            showSize = param1.width + " x " + param1.height;
            showDesc = param1.describeDensity();
            showComment = param1.comment;
         }
      }
      
      private function _RendererMapPiece_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = showComment;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _RendererMapPiece_VBox1.toolTip = param1;
         },"_RendererMapPiece_VBox1.toolTip");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = showName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _RendererMapPiece_TextArea1.text = param1;
         },"_RendererMapPiece_TextArea1.text");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = showSize;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _RendererMapPiece_Text1.text = param1;
         },"_RendererMapPiece_Text1.text");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = showDesc;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _RendererMapPiece_Text2.text = param1;
         },"_RendererMapPiece_Text2.text");
         result[3] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get showName() : String
      {
         return this._339016920showName;
      }
      
      public function ___RendererMapPiece_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      public function ___RendererMapPiece_Canvas1_dataChange(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      [Bindable(event="propertyChange")]
      private function get showDesc() : String
      {
         return this._339310802showDesc;
      }
      
      [Bindable(event="propertyChange")]
      private function get showComment() : String
      {
         return this._1338557602showComment;
      }
      
      private function _RendererMapPiece_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = showComment;
         _loc1_ = showName;
         _loc1_ = showSize;
         _loc1_ = showDesc;
      }
   }
}
