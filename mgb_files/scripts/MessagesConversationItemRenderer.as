package
{
   import com.mgb.controls.AutoTruncatedLabel;
   import com.mgb.controls.BitmapDuper;
   import com.mgb.menuEvents.*;
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
   import mx.controls.HRule;
   import mx.controls.Label;
   import mx.controls.LinkButton;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.events.ScrollEvent;
   import mx.formatters.DateFormatter;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class MessagesConversationItemRenderer extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1428135628dateDisplay:DateFormatter;
      
      public var _MessagesConversationItemRenderer_Text1:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _MessagesConversationItemRenderer_AutoTruncatedLabel1:AutoTruncatedLabel;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindings:Array;
      
      private var _2101909190tilePreview:BitmapDuper;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public var _MessagesConversationItemRenderer_Label1:Label;
      
      public var _MessagesConversationItemRenderer_Label2:Label;
      
      public function MessagesConversationItemRenderer()
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
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":VBox,
                           "stylesFactory":function():void
                           {
                              this.verticalGap = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":80,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":BitmapDuper,
                                    "id":"tilePreview",
                                    "stylesFactory":function():void
                                    {
                                       this.left = "4";
                                       this.top = "0";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":64,
                                          "height":64
                                       };
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
                        }),new UIComponentDescriptor({
                           "type":VBox,
                           "stylesFactory":function():void
                           {
                              this.verticalGap = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_MessagesConversationItemRenderer_Text1",
                                    "stylesFactory":function():void
                                    {
                                       this.fontWeight = "bold";
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_MessagesConversationItemRenderer_Label1",
                                    "events":{"click":"___MessagesConversationItemRenderer_Label1_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":160,
                                          "toolTip":"View conversation"
                                       };
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
                        }),new UIComponentDescriptor({
                           "type":VBox,
                           "stylesFactory":function():void
                           {
                              this.verticalGap = 0;
                           },
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
                                    "type":Label,
                                    "id":"_MessagesConversationItemRenderer_Label2",
                                    "events":{"click":"___MessagesConversationItemRenderer_Label2_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "toolTip":"View conversation"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":AutoTruncatedLabel,
                                    "id":"_MessagesConversationItemRenderer_AutoTruncatedLabel1",
                                    "events":{"click":"___MessagesConversationItemRenderer_AutoTruncatedLabel1_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "toolTip":"View conversation"
                                       };
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
                        }),new UIComponentDescriptor({
                           "type":VBox,
                           "stylesFactory":function():void
                           {
                              this.verticalGap = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentHeight":100};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":Spacer,
                                          "propertiesFactory":function():Object
                                          {
                                             return {"width":2};
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":LinkButton,
                                          "events":{"click":"___MessagesConversationItemRenderer_LinkButton1_click"},
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "label":"Delete",
                                                "toolTip":"Delete conversation"
                                             };
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Spacer,
                                          "propertiesFactory":function():Object
                                          {
                                             return {"width":2};
                                          }
                                       })]};
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
               }),new UIComponentDescriptor({
                  "type":HRule,
                  "stylesFactory":function():void
                  {
                     this.bottom = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"percentWidth":100};
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
         _MessagesConversationItemRenderer_DateFormatter1_i();
         this.addEventListener("scroll",___MessagesConversationItemRenderer_Canvas1_scroll);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MessagesConversationItemRenderer._watcherSetupUtil = param1;
      }
      
      public function ___MessagesConversationItemRenderer_AutoTruncatedLabel1_click(param1:MouseEvent) : void
      {
         viewConversation();
      }
      
      private function viewConversation() : void
      {
         dispatchEvent(new ViewConversationEvent(ViewConversationEvent.VIEW_CONVERSATION,data.conversationId));
      }
      
      private function deleteConversation() : void
      {
         dispatchEvent(new DeleteConversationEvent(DeleteConversationEvent.DELETE_CONVERSATION,data.conversationId));
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MessagesConversationItemRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _MessagesConversationItemRenderer_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_MessagesConversationItemRendererWatcherSetupUtil");
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
      
      private function _MessagesConversationItemRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = data.from;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            tilePreview.avatarName = param1;
         },"tilePreview.avatarName");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = data.from;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MessagesConversationItemRenderer_Text1.text = param1;
         },"_MessagesConversationItemRenderer_Text1.text");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = dateDisplay.format(data.date);
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MessagesConversationItemRenderer_Label1.text = param1;
         },"_MessagesConversationItemRenderer_Label1.text");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = data.subject;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MessagesConversationItemRenderer_Label2.text = param1;
         },"_MessagesConversationItemRenderer_Label2.text");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = data.preview;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MessagesConversationItemRenderer_AutoTruncatedLabel1.text = param1;
         },"_MessagesConversationItemRenderer_AutoTruncatedLabel1.text");
         result[4] = binding;
         return result;
      }
      
      public function ___MessagesConversationItemRenderer_Canvas1_scroll(param1:ScrollEvent) : void
      {
         this.parent.dispatchEvent(param1);
      }
      
      private function _MessagesConversationItemRenderer_DateFormatter1_i() : DateFormatter
      {
         var _loc1_:DateFormatter = new DateFormatter();
         dateDisplay = _loc1_;
         _loc1_.formatString = "MM/DD/YY L:NN A";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get tilePreview() : BitmapDuper
      {
         return this._2101909190tilePreview;
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
      
      public function ___MessagesConversationItemRenderer_Label1_click(param1:MouseEvent) : void
      {
         viewConversation();
      }
      
      [Bindable(event="propertyChange")]
      public function get dateDisplay() : DateFormatter
      {
         return this._1428135628dateDisplay;
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
      
      public function ___MessagesConversationItemRenderer_Label2_click(param1:MouseEvent) : void
      {
         viewConversation();
      }
      
      public function ___MessagesConversationItemRenderer_LinkButton1_click(param1:MouseEvent) : void
      {
         deleteConversation();
      }
      
      private function _MessagesConversationItemRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = data.from;
         _loc1_ = data.from;
         _loc1_ = dateDisplay.format(data.date);
         _loc1_ = data.subject;
         _loc1_ = data.preview;
      }
   }
}
