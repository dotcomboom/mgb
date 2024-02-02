package
{
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
   import mx.collections.*;
   import mx.containers.HBox;
   import mx.controls.ComboBox;
   import mx.core.*;
   import mx.events.DropdownEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ActorGraphicsEffectComboBox extends HBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1432595415formatCombo:ComboBox;
      
      public var effectTags:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _3106ac:ArrayCollection = null;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1366240977newState:String;
      
      public function ActorGraphicsEffectComboBox()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":ComboBox,
                  "id":"formatCombo",
                  "events":{
                     "change":"__formatCombo_change",
                     "close":"__formatCombo_close"
                  },
                  "stylesFactory":function():void
                  {
                     this.textAlign = "left";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "rowCount":8,
                        "editable":false,
                        "focusRect":"null"
                     };
                  }
               })]};
            }
         });
         _1366240977newState = new String();
         effectTags = ["no effect","rotate90","rotate180","rotate270","flipX","flipY"];
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.horizontalAlign = "left";
         };
         this.percentWidth = 100;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("dataChange",___ActorGraphicsEffectComboBox_HBox1_dataChange);
         this.addEventListener("creationComplete",___ActorGraphicsEffectComboBox_HBox1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ActorGraphicsEffectComboBox._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get ac() : ArrayCollection
      {
         return this._3106ac;
      }
      
      public function set ac(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._3106ac;
         if(_loc2_ !== param1)
         {
            this._3106ac = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ac",_loc2_,param1));
         }
      }
      
      private function initComponent() : void
      {
         ac = new ArrayCollection(effectTags);
         setSelectedItem(null);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ActorGraphicsEffectComboBox = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _ActorGraphicsEffectComboBox_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ActorGraphicsEffectComboBoxWatcherSetupUtil");
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
      
      public function ___ActorGraphicsEffectComboBox_HBox1_creationComplete(param1:FlexEvent) : void
      {
         initComponent();
      }
      
      public function ___ActorGraphicsEffectComboBox_HBox1_dataChange(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      private function setSelectedItem(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(Boolean(ac) && Boolean(data))
         {
            _loc2_ = 0;
            while(_loc2_ < ac.length)
            {
               if(ac[_loc2_] == data.effect)
               {
                  formatCombo.selectedIndex = _loc2_;
               }
               _loc2_++;
            }
            if(formatCombo.focusManager)
            {
               formatCombo.focusManager.hideFocus();
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newState() : String
      {
         return this._1366240977newState;
      }
      
      [Bindable(event="propertyChange")]
      public function get formatCombo() : ComboBox
      {
         return this._1432595415formatCombo;
      }
      
      private function _ActorGraphicsEffectComboBox_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ac;
      }
      
      public function set formatCombo(param1:ComboBox) : void
      {
         var _loc2_:Object = this._1432595415formatCombo;
         if(_loc2_ !== param1)
         {
            this._1432595415formatCombo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"formatCombo",_loc2_,param1));
         }
      }
      
      public function __formatCombo_close(param1:DropdownEvent) : void
      {
         this.formatCombo.focusManager.hideFocus();
      }
      
      public function set newState(param1:String) : void
      {
         var _loc2_:Object = this._1366240977newState;
         if(_loc2_ !== param1)
         {
            this._1366240977newState = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newState",_loc2_,param1));
         }
      }
      
      public function __formatCombo_change(param1:ListEvent) : void
      {
         newState = String(this.formatCombo.selectedItem);
      }
      
      private function _ActorGraphicsEffectComboBox_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return ac;
         },function(param1:Object):void
         {
            formatCombo.dataProvider = param1;
         },"formatCombo.dataProvider");
         result[0] = binding;
         return result;
      }
   }
}
