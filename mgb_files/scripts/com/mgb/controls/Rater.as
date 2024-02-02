package com.mgb.controls
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
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.*;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class Rater extends VBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      public static const RATING_CHANGED_EVENT:String = "RatingChangedEvent";
       
      
      private var _1819374576numRatings:Number = 0;
      
      private var _3321978lit1:Image;
      
      private var _3321979lit2:Image;
      
      private var _448730109personalRating:Number = NaN;
      
      private var _embed_mxml__________Resources_smiley_unlit_png_746390253:Class;
      
      mx_internal var _watchers:Array;
      
      private var _3321980lit3:Image;
      
      private var _3321981lit4:Image;
      
      private var _3321982lit5:Image;
      
      public var _Rater_Text1:Text;
      
      private var _1018214091describe:String;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _736986874showRating:Number = 0;
      
      private var _1382317029_averageRating:Number = NaN;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _embed_mxml__________Resources_smiley_lit_png_2103437901:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      mx_internal var _bindings:Array;
      
      public function Rater()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "events":{"mouseOut":"___Rater_Canvas1_mouseOut"},
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function():void
                        {
                           this.horizontalGap = 2;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "y":2,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Image,
                                 "events":{
                                    "mouseOver":"___Rater_Image1_mouseOver",
                                    "click":"___Rater_Image1_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_unlit_png_746390253,
                                       "toolTip":"myeh"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "events":{
                                    "mouseOver":"___Rater_Image2_mouseOver",
                                    "click":"___Rater_Image2_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_unlit_png_746390253,
                                       "toolTip":"ok"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "events":{
                                    "mouseOver":"___Rater_Image3_mouseOver",
                                    "click":"___Rater_Image3_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_unlit_png_746390253,
                                       "toolTip":"good"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "events":{
                                    "mouseOver":"___Rater_Image4_mouseOver",
                                    "click":"___Rater_Image4_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_unlit_png_746390253,
                                       "toolTip":"great"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "events":{
                                    "mouseOver":"___Rater_Image5_mouseOver",
                                    "click":"___Rater_Image5_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_unlit_png_746390253,
                                       "toolTip":"WOW"
                                    };
                                 }
                              })]
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function():void
                        {
                           this.horizontalGap = 2;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "y":2,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Image,
                                 "id":"lit1",
                                 "events":{
                                    "mouseOver":"__lit1_mouseOver",
                                    "click":"__lit1_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_lit_png_2103437901,
                                       "toolTip":"myeh"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "id":"lit2",
                                 "events":{
                                    "mouseOver":"__lit2_mouseOver",
                                    "click":"__lit2_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_lit_png_2103437901,
                                       "toolTip":"ok"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "id":"lit3",
                                 "events":{
                                    "mouseOver":"__lit3_mouseOver",
                                    "click":"__lit3_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_lit_png_2103437901,
                                       "toolTip":"good"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "id":"lit4",
                                 "events":{
                                    "mouseOver":"__lit4_mouseOver",
                                    "click":"__lit4_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_lit_png_2103437901,
                                       "toolTip":"great"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Image,
                                 "id":"lit5",
                                 "events":{
                                    "mouseOver":"__lit5_mouseOver",
                                    "click":"__lit5_click"
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "source":_embed_mxml__________Resources_smiley_lit_png_2103437901,
                                       "toolTip":"WOW"
                                    };
                                 }
                              })]
                           };
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "id":"_Rater_Text1",
                  "propertiesFactory":function():Object
                  {
                     return {"styleName":"denseTable"};
                  }
               })]};
            }
         });
         _embed_mxml__________Resources_smiley_lit_png_2103437901 = Rater__embed_mxml__________Resources_smiley_lit_png_2103437901;
         _embed_mxml__________Resources_smiley_unlit_png_746390253 = Rater__embed_mxml__________Resources_smiley_unlit_png_746390253;
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
            this.verticalGap = 0;
            this.paddingTop = 0;
         };
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         Rater._watcherSetupUtil = param1;
      }
      
      public function set lit4(param1:Image) : void
      {
         var _loc2_:Object = this._3321981lit4;
         if(_loc2_ !== param1)
         {
            this._3321981lit4 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lit4",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lit3() : Image
      {
         return this._3321980lit3;
      }
      
      public function set lit2(param1:Image) : void
      {
         var _loc2_:Object = this._3321979lit2;
         if(_loc2_ !== param1)
         {
            this._3321979lit2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lit2",_loc2_,param1));
         }
      }
      
      private function _Rater_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = showRating >= 1;
         _loc1_ = showRating >= 2;
         _loc1_ = showRating >= 3;
         _loc1_ = showRating >= 4;
         _loc1_ = showRating >= 5;
         _loc1_ = !!describe ? describe : (!!isNaN(averageRating) ? "Loading rating..." : "Rated " + averageRating + " by " + numRatings + " people");
         _loc1_ = !!isNaN(personalRating) ? "Rate this game" : "You rate it a " + personalRating;
      }
      
      private function set _598887910averageRating(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1 * 10) / 10;
         }
         _averageRating = param1;
         showRating = param1;
      }
      
      public function set personalRating(param1:Number) : void
      {
         var _loc2_:Object = this._448730109personalRating;
         if(_loc2_ !== param1)
         {
            this._448730109personalRating = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"personalRating",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lit2() : Image
      {
         return this._3321979lit2;
      }
      
      public function set lit5(param1:Image) : void
      {
         var _loc2_:Object = this._3321982lit5;
         if(_loc2_ !== param1)
         {
            this._3321982lit5 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lit5",_loc2_,param1));
         }
      }
      
      public function ___Rater_Image2_click(param1:MouseEvent) : void
      {
         handleClick(2);
      }
      
      public function ___Rater_Image4_click(param1:MouseEvent) : void
      {
         handleClick(4);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Rater = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _Rater_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_mgb_controls_RaterWatcherSetupUtil");
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
      private function get showRating() : Number
      {
         return this._736986874showRating;
      }
      
      [Bindable(event="propertyChange")]
      public function get lit4() : Image
      {
         return this._3321981lit4;
      }
      
      public function get averageRating() : Number
      {
         return _averageRating;
      }
      
      public function ___Rater_Canvas1_mouseOut(param1:MouseEvent) : void
      {
         showRating = averageRating;
         describe = null;
      }
      
      public function ___Rater_Image2_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(2);
      }
      
      public function ___Rater_Image4_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(4);
      }
      
      public function set numRatings(param1:Number) : void
      {
         var _loc2_:Object = this._1819374576numRatings;
         if(_loc2_ !== param1)
         {
            this._1819374576numRatings = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"numRatings",_loc2_,param1));
         }
      }
      
      private function set showRating(param1:Number) : void
      {
         var _loc2_:Object = this._736986874showRating;
         if(_loc2_ !== param1)
         {
            this._736986874showRating = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showRating",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _averageRating() : Number
      {
         return this._1382317029_averageRating;
      }
      
      public function __lit2_click(param1:MouseEvent) : void
      {
         handleClick(2);
      }
      
      public function __lit4_click(param1:MouseEvent) : void
      {
         handleClick(4);
      }
      
      [Bindable(event="propertyChange")]
      public function get personalRating() : Number
      {
         return this._448730109personalRating;
      }
      
      private function set describe(param1:String) : void
      {
         var _loc2_:Object = this._1018214091describe;
         if(_loc2_ !== param1)
         {
            this._1018214091describe = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"describe",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get numRatings() : Number
      {
         return this._1819374576numRatings;
      }
      
      [Bindable(event="propertyChange")]
      public function set averageRating(param1:Number) : void
      {
         var _loc2_:Object = this.averageRating;
         if(_loc2_ !== param1)
         {
            this._598887910averageRating = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"averageRating",_loc2_,param1));
         }
      }
      
      public function __lit2_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(2);
      }
      
      private function set _averageRating(param1:Number) : void
      {
         var _loc2_:Object = this._1382317029_averageRating;
         if(_loc2_ !== param1)
         {
            this._1382317029_averageRating = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_averageRating",_loc2_,param1));
         }
      }
      
      public function __lit4_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(4);
      }
      
      private function handleClick(param1:int) : void
      {
         if(MgbSession.getInstance().authenticatedName)
         {
            personalRating = param1;
            dispatchEvent(new Event(RATING_CHANGED_EVENT));
         }
         else
         {
            describe = "You must sign in to rate";
         }
      }
      
      private function _Rater_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return showRating >= 1;
         },function(param1:Boolean):void
         {
            lit1.visible = param1;
         },"lit1.visible");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showRating >= 2;
         },function(param1:Boolean):void
         {
            lit2.visible = param1;
         },"lit2.visible");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showRating >= 3;
         },function(param1:Boolean):void
         {
            lit3.visible = param1;
         },"lit3.visible");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showRating >= 4;
         },function(param1:Boolean):void
         {
            lit4.visible = param1;
         },"lit4.visible");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return showRating >= 5;
         },function(param1:Boolean):void
         {
            lit5.visible = param1;
         },"lit5.visible");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !!describe ? describe : (!!isNaN(averageRating) ? "Loading rating..." : "Rated " + averageRating + " by " + numRatings + " people");
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _Rater_Text1.text = param1;
         },"_Rater_Text1.text");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !!isNaN(personalRating) ? "Rate this game" : "You rate it a " + personalRating;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _Rater_Text1.toolTip = param1;
         },"_Rater_Text1.toolTip");
         result[6] = binding;
         return result;
      }
      
      public function ___Rater_Image1_click(param1:MouseEvent) : void
      {
         handleClick(1);
      }
      
      public function clear() : void
      {
         averageRating = NaN;
         personalRating = NaN;
         numRatings = 0;
      }
      
      public function ___Rater_Image5_click(param1:MouseEvent) : void
      {
         handleClick(5);
      }
      
      private function handleMouseOver(param1:int) : void
      {
         showRating = param1;
      }
      
      [Bindable(event="propertyChange")]
      private function get describe() : String
      {
         return this._1018214091describe;
      }
      
      public function ___Rater_Image3_click(param1:MouseEvent) : void
      {
         handleClick(3);
      }
      
      public function ___Rater_Image5_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(5);
      }
      
      public function ___Rater_Image1_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(1);
      }
      
      public function __lit3_click(param1:MouseEvent) : void
      {
         handleClick(3);
      }
      
      public function __lit5_click(param1:MouseEvent) : void
      {
         handleClick(5);
      }
      
      public function __lit1_click(param1:MouseEvent) : void
      {
         handleClick(1);
      }
      
      public function ___Rater_Image3_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(3);
      }
      
      public function __lit1_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(1);
      }
      
      public function __lit5_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(5);
      }
      
      [Bindable(event="propertyChange")]
      public function get lit1() : Image
      {
         return this._3321978lit1;
      }
      
      public function set lit1(param1:Image) : void
      {
         var _loc2_:Object = this._3321978lit1;
         if(_loc2_ !== param1)
         {
            this._3321978lit1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lit1",_loc2_,param1));
         }
      }
      
      public function __lit3_mouseOver(param1:MouseEvent) : void
      {
         handleMouseOver(3);
      }
      
      [Bindable(event="propertyChange")]
      public function get lit5() : Image
      {
         return this._3321982lit5;
      }
      
      public function set lit3(param1:Image) : void
      {
         var _loc2_:Object = this._3321980lit3;
         if(_loc2_ !== param1)
         {
            this._3321980lit3 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lit3",_loc2_,param1));
         }
      }
   }
}
