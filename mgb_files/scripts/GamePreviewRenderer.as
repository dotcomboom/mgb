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
   import mx.containers.VBox;
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class GamePreviewRenderer extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _GamePreviewRenderer_Text2:Text;
      
      public var _GamePreviewRenderer_Text3:Text;
      
      private var _309310695project:String;
      
      public var _GamePreviewRenderer_Text4:Text;
      
      private var _3491689raGa:Number;
      
      mx_internal var _watchers:Array;
      
      private var _data:Object;
      
      private var _107868map:String;
      
      private var _3493628rcGr:int;
      
      private var _3168cc:int;
      
      public var _GamePreviewRenderer_VBox1:VBox;
      
      private var _109734381sshot:BitmapDuper;
      
      private var _3599307user:String;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _3571pc:int;
      
      private var _1724546052description:String;
      
      private var _3491706raGr:Number;
      
      private var _3493611rcGa:int;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public var _GamePreviewRenderer_Text1:Text;
      
      public function GamePreviewRenderer()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "height":200,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":BitmapDuper,
                     "id":"sshot",
                     "events":{"creationComplete":"__sshot_creationComplete"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":8,
                           "y":8
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":VBox,
                     "id":"_GamePreviewRenderer_VBox1",
                     "stylesFactory":function():void
                     {
                        this.left = "8";
                        this.right = "8";
                        this.verticalGap = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {"childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"_GamePreviewRenderer_Text1",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"denseTable",
                                 "height":20
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_GamePreviewRenderer_Text2",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"denseTable",
                                 "height":20
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_GamePreviewRenderer_Text3",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"denseTable",
                                 "height":20
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_GamePreviewRenderer_Text4",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"denseTable",
                                 "height":20
                              };
                           }
                        })]};
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
         this.height = 200;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         GamePreviewRenderer._watcherSetupUtil = param1;
      }
      
      private function _GamePreviewRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return 336 / 2 + 16;
         },function(param1:Number):void
         {
            this.width = param1;
         },"this.width");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = description;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.toolTip = param1;
         },"this.toolTip");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return 336 / 2;
         },function(param1:Number):void
         {
            sshot.width = param1;
         },"sshot.width");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return 176 / 2;
         },function(param1:Number):void
         {
            sshot.height = param1;
         },"sshot.height");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return 176 / 2 + 16;
         },function(param1:Number):void
         {
            _GamePreviewRenderer_VBox1.y = param1;
         },"_GamePreviewRenderer_VBox1.y");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = project + "/" + map;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamePreviewRenderer_Text1.text = param1;
         },"_GamePreviewRenderer_Text1.text");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "by <b>" + user + "</b>";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamePreviewRenderer_Text2.htmlText = param1;
         },"_GamePreviewRenderer_Text2.htmlText");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = GameStatResult.describe(pc,cc);
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamePreviewRenderer_Text3.text = param1;
         },"_GamePreviewRenderer_Text3.text");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Graphics " + raGr + "   Gameplay " + raGa;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamePreviewRenderer_Text4.text = param1;
         },"_GamePreviewRenderer_Text4.text");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return raGr + raGa != 0;
         },function(param1:Boolean):void
         {
            _GamePreviewRenderer_Text4.visible = param1;
         },"_GamePreviewRenderer_Text4.visible");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = rcGr + rcGa + " ratings";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _GamePreviewRenderer_Text4.toolTip = param1;
         },"_GamePreviewRenderer_Text4.toolTip");
         result[10] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get rcGr() : int
      {
         return this._3493628rcGr;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:GamePreviewRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _GamePreviewRenderer_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_GamePreviewRendererWatcherSetupUtil");
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
      
      [Bindable(event="propertyChange")]
      private function get project() : String
      {
         return this._309310695project;
      }
      
      private function set rcGr(param1:int) : void
      {
         var _loc2_:Object = this._3493628rcGr;
         if(_loc2_ !== param1)
         {
            this._3493628rcGr = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rcGr",_loc2_,param1));
         }
      }
      
      private function set user(param1:String) : void
      {
         var _loc2_:Object = this._3599307user;
         if(_loc2_ !== param1)
         {
            this._3599307user = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"user",_loc2_,param1));
         }
      }
      
      private function set description(param1:String) : void
      {
         var _loc2_:Object = this._1724546052description;
         if(_loc2_ !== param1)
         {
            this._1724546052description = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"description",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get description() : String
      {
         return this._1724546052description;
      }
      
      override public function get data() : Object
      {
         return _data;
      }
      
      private function set project(param1:String) : void
      {
         var _loc2_:Object = this._309310695project;
         if(_loc2_ !== param1)
         {
            this._309310695project = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"project",_loc2_,param1));
         }
      }
      
      private function set map(param1:String) : void
      {
         var _loc2_:Object = this._107868map;
         if(_loc2_ !== param1)
         {
            this._107868map = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"map",_loc2_,param1));
         }
      }
      
      public function __sshot_creationComplete(param1:FlexEvent) : void
      {
         drawScreenshot();
      }
      
      private function set cc(param1:int) : void
      {
         var _loc2_:Object = this._3168cc;
         if(_loc2_ !== param1)
         {
            this._3168cc = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cc",_loc2_,param1));
         }
      }
      
      private function drawScreenshot() : void
      {
         if(sshot)
         {
            sshot.drawScreenshot(user,project,map);
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get user() : String
      {
         return this._3599307user;
      }
      
      private function set raGa(param1:Number) : void
      {
         var _loc2_:Object = this._3491689raGa;
         if(_loc2_ !== param1)
         {
            this._3491689raGa = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"raGa",_loc2_,param1));
         }
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         user = !!param1 ? String(param1.user) : null;
         project = !!param1 ? String(GameStats.makeProjectName(param1.game)) : null;
         map = !!param1 ? String(GameStats.makeMapName(param1.game)) : null;
         raGr = int(10 * Number(data["rating-average-graphics"])) / 10;
         rcGr = int(data["rating-count-graphics"]);
         raGa = int(10 * Number(data["rating-average-gameplay"])) / 10;
         rcGa = Number(data["rating-count-gameplay"]);
         pc = int(data["plays-counter"]);
         cc = int(data["completions-counter"]);
         description = (!!data["description"] ? data["description"] : "") + " (#" + data["id"] + ") ";
         drawScreenshot();
      }
      
      [Bindable(event="propertyChange")]
      private function get map() : String
      {
         return this._107868map;
      }
      
      private function set rcGa(param1:int) : void
      {
         var _loc2_:Object = this._3493611rcGa;
         if(_loc2_ !== param1)
         {
            this._3493611rcGa = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rcGa",_loc2_,param1));
         }
      }
      
      private function _GamePreviewRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = 336 / 2 + 16;
         _loc1_ = description;
         _loc1_ = 336 / 2;
         _loc1_ = 176 / 2;
         _loc1_ = 176 / 2 + 16;
         _loc1_ = project + "/" + map;
         _loc1_ = "by <b>" + user + "</b>";
         _loc1_ = GameStatResult.describe(pc,cc);
         _loc1_ = "Graphics " + raGr + "   Gameplay " + raGa;
         _loc1_ = raGr + raGa != 0;
         _loc1_ = rcGr + rcGa + " ratings";
      }
      
      public function set sshot(param1:BitmapDuper) : void
      {
         var _loc2_:Object = this._109734381sshot;
         if(_loc2_ !== param1)
         {
            this._109734381sshot = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sshot",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get raGa() : Number
      {
         return this._3491689raGa;
      }
      
      [Bindable(event="propertyChange")]
      private function get rcGa() : int
      {
         return this._3493611rcGa;
      }
      
      [Bindable(event="propertyChange")]
      private function get cc() : int
      {
         return this._3168cc;
      }
      
      [Bindable(event="propertyChange")]
      private function get pc() : int
      {
         return this._3571pc;
      }
      
      [Bindable(event="propertyChange")]
      public function get sshot() : BitmapDuper
      {
         return this._109734381sshot;
      }
      
      private function set pc(param1:int) : void
      {
         var _loc2_:Object = this._3571pc;
         if(_loc2_ !== param1)
         {
            this._3571pc = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pc",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get raGr() : Number
      {
         return this._3491706raGr;
      }
      
      private function set raGr(param1:Number) : void
      {
         var _loc2_:Object = this._3491706raGr;
         if(_loc2_ !== param1)
         {
            this._3491706raGr = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"raGr",_loc2_,param1));
         }
      }
   }
}
