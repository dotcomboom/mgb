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
   
   public class TutorialMakerTagComboBox extends HBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1432595415formatCombo:ComboBox;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var okTags:Array;
      
      mx_internal var _watchers:Array;
      
      private var _3106ac:ArrayCollection = null;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1366240977newState:String;
      
      public function TutorialMakerTagComboBox()
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
                        "editable":true,
                        "focusRect":"null"
                     };
                  }
               })]};
            }
         });
         _1366240977newState = new String();
         okTags = [ActiveTutorial.NEXT_BUTTON_TAG,ActiveTutorial.NEXT_OR_SKIP_BUTTON_TAG,"actormaker_new","actormaker_new_player","actormaker_new_enemy","actormaker_new_friend","actormaker_new_floor","actormaker_new_wall","actormaker_new_item","actormaker_new_shot","actormaker_new_slidingblock","actormaker_new_blank","actormaker_choose_tile","actormaker_choose_tile_complete","actormaker_save","actormaker_save_complete","actormaker_load","actormaker_load_completed","actormaker_load_from_doubleclick","actormaker_edit_tile_doubleclick","tilemaker_use_import","tilemaker_use_import_shifted","tilemaker_choose_pen","tilemaker_use_pen","tilemaker_use_pen_horizontal","tilemaker_use_pen_vertical","tilemaker_use_pen_diagonal","tilemaker_choose_eraser","tilemaker_use_eraser","tilemaker_use_eraser_horizontal","tilemaker_use_eraser_vertical","tilemaker_use_eraser_diagonal","tilemaker_choose_brush","tilemaker_use_brush","tilemaker_use_brush_horizontal","tilemaker_use_brush_vertical","tilemaker_use_brush_diagonal","tilemaker_choose_fill","tilemaker_use_fill","tilemaker_choose_picker","tilemaker_use_picker","tilemaker_choose_hand","tilemaker_use_hand","tilemaker_use_hand_shifted","tilemaker_use_zoombutton","tilemaker_choose_new","tilemaker_use_new","tilemaker_choose_select","tilemaker_use_select","tilemaker_use_cut","tilemaker_use_copy","tilemaker_choose_paste","tilemaker_use_paste","tilemaker_use_paste_flip_horizontal","tilemaker_use_paste_flip_vertical","tilemaker_use_paste_scale_shrink","tilemaker_use_paste_scale_grow","tilemaker_use_paste_rotate_right","tilemaker_use_paste_rotate_left","tilemaker_use_zoomwheel","tilemaker_choose_colorcontrol","tilemaker_use_colorcontrol","tilemaker_use_thickbutton","tilemaker_undo","tilemaker_redo","tilemaker_load","tilemaker_load_complete","tilemaker_save","tilemaker_save_complete","tilemaker_use_skillslider","tilemaker_choose_import","mapmaker_print","mapmaker_load","mapmaker_load_from_doubleclick","mapmaker_load_complete","mapmaker_foregroundLayer_show0","mapmaker_foregroundLayer_show0.5","mapmaker_foregroundLayer_show0","mapmaker_save","mapmaker_choose_pen","mapmaker_choose_eraser","mapmaker_choose_resize","mapmaker_choose_jump","mapmaker_choose_actor","mapmaker_choose_layer","mapmaker_use_pen","mapmaker_use_eraser","mapmaker_use_resize","mapmaker_use_jump","mapmaker_inspect_off","mapmaker_inspect_on","mapmaker_undo","mapmaker_redo","mapmaker_new","mapmaker_newmap","mapmaker_choose_zoom","mapmaker_choose_grid","mapmaker_use_skillslider","mapmaker_play_start","mapmaker_play_stop"];
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
         this.addEventListener("dataChange",___TutorialMakerTagComboBox_HBox1_dataChange);
         this.addEventListener("creationComplete",___TutorialMakerTagComboBox_HBox1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         TutorialMakerTagComboBox._watcherSetupUtil = param1;
      }
      
      private function _TutorialMakerTagComboBox_bindingsSetup() : Array
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
      
      public function set ac(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._3106ac;
         if(_loc2_ !== param1)
         {
            this._3106ac = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ac",_loc2_,param1));
         }
      }
      
      private function _TutorialMakerTagComboBox_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ac;
      }
      
      private function initComponent() : void
      {
         ac = new ArrayCollection(okTags);
         setSelectedItem(null);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:TutorialMakerTagComboBox = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _TutorialMakerTagComboBox_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_TutorialMakerTagComboBoxWatcherSetupUtil");
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
         var _loc2_:int = 0;
         if(Boolean(ac) && Boolean(data))
         {
            _loc2_ = 0;
            while(_loc2_ < ac.length)
            {
               if(ac[_loc2_] == data.completionTag)
               {
                  formatCombo.selectedIndex = _loc2_;
               }
               _loc2_++;
            }
            formatCombo.focusManager.hideFocus();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newState() : String
      {
         return this._1366240977newState;
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
      
      [Bindable(event="propertyChange")]
      public function get formatCombo() : ComboBox
      {
         return this._1432595415formatCombo;
      }
      
      [Bindable(event="propertyChange")]
      public function get ac() : ArrayCollection
      {
         return this._3106ac;
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
      
      public function __formatCombo_change(param1:ListEvent) : void
      {
         newState = String(this.formatCombo.selectedItem);
      }
      
      public function ___TutorialMakerTagComboBox_HBox1_dataChange(param1:FlexEvent) : void
      {
         setSelectedItem(param1);
      }
      
      public function ___TutorialMakerTagComboBox_HBox1_creationComplete(param1:FlexEvent) : void
      {
         initComponent();
      }
   }
}
