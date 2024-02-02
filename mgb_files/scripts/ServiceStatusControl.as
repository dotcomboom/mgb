package
{
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
   import mx.containers.VBox;
   import mx.controls.DataGrid;
   import mx.controls.LinkButton;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ServiceStatusControl extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      public var _ServiceStatusControl_DataGrid1:DataGrid;
      
      private var _1217010542mgbSession:MgbSession;
      
      public var _ServiceStatusControl_Text2:Text;
      
      private var _1260658248mgbLogger:MgbLogger;
      
      public var _ServiceStatusControl_LinkButton1:LinkButton;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _91555634serviceStatusBackgroundColor:SelectBackgroundColor;
      
      mx_internal var _bindings:Array;
      
      public function ServiceStatusControl()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "stylesFactory":function():void
                  {
                     this.top = "2";
                     this.left = "2";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HBox,
                           "propertiesFactory":function():Object
                           {
                              return {"childDescriptors":[new UIComponentDescriptor({
                                 "type":Text,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"htmlText":"<b>Network and Event log</b>"};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":LinkButton,
                                 "id":"_ServiceStatusControl_LinkButton1",
                                 "events":{"click":"___ServiceStatusControl_LinkButton1_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {"label":"(clear)"};
                                 }
                              })]};
                           }
                        }),new UIComponentDescriptor({
                           "type":DataGrid,
                           "id":"_ServiceStatusControl_DataGrid1",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "dataTipField":"message",
                                 "styleName":"denseTable",
                                 "headerHeight":28,
                                 "columns":[_ServiceStatusControl_DataGridColumn1_c(),_ServiceStatusControl_DataGridColumn2_c(),_ServiceStatusControl_DataGridColumn3_c()]
                              };
                           }
                        }),new UIComponentDescriptor({"type":Spacer}),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_ServiceStatusControl_Text2",
                           "stylesFactory":function():void
                           {
                              this.right = "0";
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NewsLink,
                  "stylesFactory":function():void
                  {
                     this.top = "0";
                     this.right = "8";
                  }
               }),new UIComponentDescriptor({
                  "type":SelectBackgroundColor,
                  "id":"serviceStatusBackgroundColor",
                  "stylesFactory":function():void
                  {
                     this.right = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"y":0};
                  }
               })]};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _1260658248mgbLogger = MgbLogger.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ServiceStatusControl._watcherSetupUtil = param1;
      }
      
      private function _ServiceStatusControl_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = mgbLogger.entriesAC.length > 0;
         _loc1_ = mgbLogger.entriesAC;
         _loc1_ = " Amazon S3 Usage: Bytes Tx=" + (mgbSession.s3BytesSent >> 10) + "KB, Rx=" + (mgbSession.s3BytesReceived >> 10) + "KB. S3 Session BW+REQ Costs = " + calculateNewS3CostCents(mgbSession.s3BytesSent,mgbSession.s3BytesReceived,mgbSession.cheapOps,mgbSession.expensiveOps);
      }
      
      private function calculateNewS3CostCents(param1:Number, param2:Number, param3:int, param4:int) : String
      {
         var _loc5_:Number;
         return (_loc5_ = param1 * 10 / (1024 * 1024 * 1024) + param2 * 18 / (1024 * 1024 * 1024) + param3 / 10000 + param4 / 1000).toFixed(4) + "cents";
      }
      
      private function _ServiceStatusControl_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Time";
         _loc1_.dataField = "time";
         _loc1_.width = 140;
         _loc1_.showDataTips = true;
         return _loc1_;
      }
      
      private function _ServiceStatusControl_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Type";
         _loc1_.dataField = "type";
         _loc1_.width = 80;
         _loc1_.showDataTips = true;
         return _loc1_;
      }
      
      private function _ServiceStatusControl_DataGridColumn3_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "Event";
         _loc1_.dataField = "message";
         _loc1_.showDataTips = true;
         return _loc1_;
      }
      
      public function ___ServiceStatusControl_LinkButton1_click(param1:MouseEvent) : void
      {
         mgbLogger.logClear();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ServiceStatusControl = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ServiceStatusControl_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ServiceStatusControlWatcherSetupUtil");
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
      public function get serviceStatusBackgroundColor() : SelectBackgroundColor
      {
         return this._91555634serviceStatusBackgroundColor;
      }
      
      public function set serviceStatusBackgroundColor(param1:SelectBackgroundColor) : void
      {
         var _loc2_:Object = this._91555634serviceStatusBackgroundColor;
         if(_loc2_ !== param1)
         {
            this._91555634serviceStatusBackgroundColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"serviceStatusBackgroundColor",_loc2_,param1));
         }
      }
      
      private function _ServiceStatusControl_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return mgbLogger.entriesAC.length > 0;
         },function(param1:Boolean):void
         {
            _ServiceStatusControl_LinkButton1.visible = param1;
         },"_ServiceStatusControl_LinkButton1.visible");
         result[0] = binding;
         binding = new Binding(this,function():Object
         {
            return mgbLogger.entriesAC;
         },function(param1:Object):void
         {
            _ServiceStatusControl_DataGrid1.dataProvider = param1;
         },"_ServiceStatusControl_DataGrid1.dataProvider");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = " Amazon S3 Usage: Bytes Tx=" + (mgbSession.s3BytesSent >> 10) + "KB, Rx=" + (mgbSession.s3BytesReceived >> 10) + "KB. S3 Session BW+REQ Costs = " + calculateNewS3CostCents(mgbSession.s3BytesSent,mgbSession.s3BytesReceived,mgbSession.cheapOps,mgbSession.expensiveOps);
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ServiceStatusControl_Text2.text = param1;
         },"_ServiceStatusControl_Text2.text");
         result[2] = binding;
         return result;
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
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function set mgbLogger(param1:MgbLogger) : void
      {
         var _loc2_:Object = this._1260658248mgbLogger;
         if(_loc2_ !== param1)
         {
            this._1260658248mgbLogger = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbLogger",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbLogger() : MgbLogger
      {
         return this._1260658248mgbLogger;
      }
   }
}
