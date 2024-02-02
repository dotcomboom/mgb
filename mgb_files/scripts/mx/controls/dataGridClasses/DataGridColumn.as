package mx.controls.dataGridClasses
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import mx.controls.TextInput;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.ClassFactory;
   import mx.core.ContextualClassFactory;
   import mx.core.EmbeddedFont;
   import mx.core.EmbeddedFontRegistry;
   import mx.core.IEmbeddedFontRegistry;
   import mx.core.IFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IIMESupport;
   import mx.core.Singleton;
   import mx.core.mx_internal;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   import mx.utils.StringUtil;
   
   use namespace mx_internal;
   
   public class DataGridColumn extends CSSStyleDeclaration implements IIMESupport
   {
      
      private static var _embeddedFontRegistry:IEmbeddedFontRegistry;
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var _headerText:String;
      
      public var editorXOffset:Number = 0;
      
      mx_internal var measuringObjects:Dictionary;
      
      private var fontPropertiesSet:Boolean = false;
      
      public var rendererIsEditor:Boolean = false;
      
      mx_internal var cachedHeaderRenderer:IListItemRenderer;
      
      public var sortDescending:Boolean = false;
      
      private var cachedEmbeddedFont:EmbeddedFont = null;
      
      public var editorYOffset:Number = 0;
      
      private var _headerWordWrap:*;
      
      private var _dataTipFunction:Function;
      
      private var _visible:Boolean = true;
      
      public var editorWidthOffset:Number = 0;
      
      public var itemEditor:IFactory;
      
      public var editorUsesEnterKey:Boolean = false;
      
      public var editable:Boolean = true;
      
      private var _nullItemRenderer:IFactory;
      
      mx_internal var freeItemRenderersByFactory:Dictionary;
      
      public var editorDataField:String = "text";
      
      mx_internal var newlyVisible:Boolean = false;
      
      public var draggable:Boolean = true;
      
      protected var hasComplexFieldName:Boolean = false;
      
      private var _sortCompareFunction:Function;
      
      public var editorHeightOffset:Number = 0;
      
      public var resizable:Boolean = true;
      
      private var _headerRenderer:IFactory;
      
      mx_internal var owner:DataGridBase;
      
      private var _imeMode:String;
      
      private var _dataTipField:String;
      
      protected var complexFieldNameComponents:Array;
      
      private var _width:Number = 100;
      
      private var oldEmbeddedFontContext:IFlexModuleFactory = null;
      
      private var _wordWrap:*;
      
      mx_internal var preferredWidth:Number = 100;
      
      private var _itemRenderer:IFactory;
      
      mx_internal var colNum:Number;
      
      private var _dataField:String;
      
      private var _minWidth:Number = 20;
      
      private var _labelFunction:Function;
      
      private var hasFontContextBeenSaved:Boolean = false;
      
      public var sortable:Boolean = true;
      
      mx_internal var explicitWidth:Number;
      
      private var _showDataTips:*;
      
      public function DataGridColumn(param1:String = null)
      {
         itemEditor = new ClassFactory(TextInput);
         super();
         if(param1)
         {
            dataField = param1;
            headerText = param1;
         }
      }
      
      private static function get embeddedFontRegistry() : IEmbeddedFontRegistry
      {
         if(!_embeddedFontRegistry)
         {
            _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
         }
         return _embeddedFontRegistry;
      }
      
      mx_internal function getMeasuringRenderer(param1:Boolean, param2:Object) : IListItemRenderer
      {
         var _loc3_:IFactory = getItemRendererFactory(param1,param2);
         if(!_loc3_)
         {
            _loc3_ = mx_internal::owner.itemRenderer;
         }
         if(!mx_internal::measuringObjects)
         {
            mx_internal::measuringObjects = new Dictionary(false);
         }
         var _loc4_:IListItemRenderer;
         if(!(_loc4_ = mx_internal::measuringObjects[_loc3_]))
         {
            (_loc4_ = _loc3_.newInstance()).visible = false;
            _loc4_.styleName = this;
            mx_internal::measuringObjects[_loc3_] = _loc4_;
         }
         return _loc4_;
      }
      
      public function get imeMode() : String
      {
         return _imeMode;
      }
      
      public function set imeMode(param1:String) : void
      {
         _imeMode = param1;
      }
      
      public function getItemRendererFactory(param1:Boolean, param2:Object) : IFactory
      {
         if(param1)
         {
            return replaceItemRendererFactory(headerRenderer);
         }
         if(!param2)
         {
            return replaceItemRendererFactory(nullItemRenderer);
         }
         return replaceItemRendererFactory(itemRenderer);
      }
      
      public function set dataTipFunction(param1:Function) : void
      {
         _dataTipFunction = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
         dispatchEvent(new Event("labelFunctionChanged"));
      }
      
      [Bindable("nullItemRendererChanged")]
      public function get nullItemRenderer() : IFactory
      {
         return _nullItemRenderer;
      }
      
      public function get showDataTips() : *
      {
         return _showDataTips;
      }
      
      public function get headerWordWrap() : *
      {
         return _headerWordWrap;
      }
      
      public function set minWidth(param1:Number) : void
      {
         _minWidth = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
         if(_width < param1)
         {
            _width = param1;
         }
         dispatchEvent(new Event("minWidthChanged"));
      }
      
      public function set nullItemRenderer(param1:IFactory) : void
      {
         _nullItemRenderer = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
            mx_internal::owner.mx_internal::columnRendererChanged(this);
         }
         dispatchEvent(new Event("nullItemRendererChanged"));
      }
      
      public function set showDataTips(param1:*) : void
      {
         _showDataTips = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
      }
      
      public function set headerWordWrap(param1:*) : void
      {
         _headerWordWrap = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
      }
      
      override mx_internal function addStyleToProtoChain(param1:Object, param2:DisplayObject, param3:Object = null) : Object
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc4_:DataGridBase = mx_internal::owner;
         var _loc5_:IListItemRenderer = IListItemRenderer(param2);
         if(_loc6_ = _loc6_)
         {
            if(_loc6_ is String)
            {
               _loc6_ = StyleManager.getStyleDeclaration("." + _loc6_);
            }
            if(_loc6_ is CSSStyleDeclaration)
            {
               param1 = _loc6_.addStyleToProtoChain(param1,param2);
            }
         }
         param1 = super.mx_internal::addStyleToProtoChain(param1,param2);
         if(Boolean(_loc5_.data) && _loc5_.data is DataGridColumn)
         {
            if(_loc8_ = _loc4_.getStyle("headerStyleName"))
            {
               if(_loc8_ is String)
               {
                  _loc8_ = StyleManager.getStyleDeclaration("." + _loc8_);
               }
               if(_loc8_ is CSSStyleDeclaration)
               {
                  param1 = _loc8_.addStyleToProtoChain(param1,param2);
               }
            }
            if(_loc8_ = getStyle("headerStyleName"))
            {
               if(_loc8_ is String)
               {
                  _loc8_ = StyleManager.getStyleDeclaration("." + _loc8_);
               }
               if(_loc8_ is CSSStyleDeclaration)
               {
                  param1 = _loc8_.addStyleToProtoChain(param1,param2);
               }
            }
         }
         if(!fontPropertiesSet)
         {
            fontPropertiesSet = true;
            saveFontContext(!!mx_internal::owner ? mx_internal::owner.moduleFactory : null);
         }
         return param1;
      }
      
      [Bindable("headerTextChanged")]
      public function get headerText() : String
      {
         return _headerText != null ? _headerText : dataField;
      }
      
      [Bindable("sortCompareFunctionChanged")]
      public function get sortCompareFunction() : Function
      {
         return _sortCompareFunction;
      }
      
      protected function complexColumnSortCompare(param1:Object, param2:Object) : int
      {
         if(!param1 && !param2)
         {
            return 0;
         }
         if(!param1)
         {
            return 1;
         }
         if(!param2)
         {
            return -1;
         }
         var _loc3_:String = String(deriveComplexColumnData(param1).toString());
         var _loc4_:String = String(deriveComplexColumnData(param2).toString());
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      mx_internal function hasFontContextChanged(param1:IFlexModuleFactory) : Boolean
      {
         if(!hasFontContextBeenSaved)
         {
            return false;
         }
         var _loc2_:String = StringUtil.trimArrayElements(getStyle("fontFamily"),",");
         var _loc3_:String = getStyle("fontWeight");
         var _loc4_:String = getStyle("fontStyle");
         var _loc5_:* = _loc3_ == "bold";
         var _loc6_:* = _loc4_ == "italic";
         var _loc7_:EmbeddedFont = mx_internal::getEmbeddedFont(_loc2_,_loc5_,_loc6_);
         var _loc8_:IFlexModuleFactory;
         return (_loc8_ = embeddedFontRegistry.getAssociatedModuleFactory(_loc7_,param1)) != oldEmbeddedFontContext;
      }
      
      override public function setStyle(param1:String, param2:*) : void
      {
         fontPropertiesSet = false;
         var _loc3_:Object = getStyle(param1);
         var _loc4_:Boolean = false;
         if(factory == null && defaultFactory == null && !overrides && _loc3_ !== param2)
         {
            _loc4_ = true;
         }
         super.mx_internal::setStyle(param1,param2);
         if(param1 == "headerStyleName")
         {
            if(mx_internal::owner)
            {
               mx_internal::owner.regenerateStyleCache(true);
               mx_internal::owner.notifyStyleChangeInChildren("headerStyleName",true);
            }
            return;
         }
         if(mx_internal::owner)
         {
            if(_loc4_)
            {
               mx_internal::owner.regenerateStyleCache(true);
            }
            if(mx_internal::hasFontContextChanged(mx_internal::owner.moduleFactory))
            {
               mx_internal::owner.mx_internal::columnRendererChanged(this);
            }
            mx_internal::owner.invalidateList();
         }
      }
      
      public function get dataField() : String
      {
         return _dataField;
      }
      
      public function get visible() : Boolean
      {
         return _visible;
      }
      
      public function get wordWrap() : *
      {
         return _wordWrap;
      }
      
      [Bindable("headerRendererChanged")]
      public function get headerRenderer() : IFactory
      {
         return _headerRenderer;
      }
      
      mx_internal function setWidth(param1:Number) : void
      {
         var _loc2_:Number = _width;
         _width = param1;
         if(_loc2_ != param1)
         {
            dispatchEvent(new Event("widthChanged"));
         }
      }
      
      mx_internal function getEmbeddedFont(param1:String, param2:Boolean, param3:Boolean) : EmbeddedFont
      {
         if(cachedEmbeddedFont)
         {
            if(cachedEmbeddedFont.fontName == param1 && cachedEmbeddedFont.fontStyle == EmbeddedFontRegistry.getFontStyle(param2,param3))
            {
               return cachedEmbeddedFont;
            }
         }
         cachedEmbeddedFont = new EmbeddedFont(param1,param2,param3);
         return cachedEmbeddedFont;
      }
      
      [Bindable("dataTipFunctionChanged")]
      public function get dataTipFunction() : Function
      {
         return _dataTipFunction;
      }
      
      public function set width(param1:Number) : void
      {
         var _loc2_:Boolean = false;
         mx_internal::explicitWidth = param1;
         mx_internal::preferredWidth = param1;
         if(mx_internal::owner != null)
         {
            _loc2_ = resizable;
            resizable = false;
            mx_internal::owner.mx_internal::resizeColumn(mx_internal::colNum,param1);
            resizable = _loc2_;
         }
         else
         {
            _width = param1;
         }
         dispatchEvent(new Event("widthChanged"));
      }
      
      [Bindable("minWidthChanged")]
      public function get minWidth() : Number
      {
         return _minWidth;
      }
      
      protected function deriveComplexColumnData(param1:Object) : Object
      {
         var _loc3_:int = 0;
         var _loc2_:Object = param1;
         if(complexFieldNameComponents)
         {
            _loc3_ = 0;
            while(_loc3_ < complexFieldNameComponents.length)
            {
               _loc2_ = _loc2_[complexFieldNameComponents[_loc3_]];
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      private function saveFontContext(param1:IFlexModuleFactory) : void
      {
         hasFontContextBeenSaved = true;
         var _loc2_:String = StringUtil.trimArrayElements(getStyle("fontFamily"),",");
         var _loc3_:String = getStyle("fontWeight");
         var _loc4_:String = getStyle("fontStyle");
         var _loc5_:* = _loc3_ == "bold";
         var _loc6_:* = _loc4_ == "italic";
         var _loc7_:EmbeddedFont = mx_internal::getEmbeddedFont(_loc2_,_loc5_,_loc6_);
         oldEmbeddedFontContext = embeddedFontRegistry.getAssociatedModuleFactory(_loc7_,param1);
      }
      
      public function itemToLabel(param1:Object) : String
      {
         var data:Object = param1;
         if(!data)
         {
            return " ";
         }
         if(labelFunction != null)
         {
            return labelFunction(data,this);
         }
         if(mx_internal::owner.labelFunction != null)
         {
            return mx_internal::owner.labelFunction(data,this);
         }
         if(typeof data == "object" || typeof data == "xml")
         {
            try
            {
               if(!hasComplexFieldName)
               {
                  data = data[dataField];
               }
               else
               {
                  data = deriveComplexColumnData(data);
               }
            }
            catch(e:Error)
            {
               data = null;
            }
         }
         if(data is String)
         {
            return String(data);
         }
         try
         {
            return data.toString();
         }
         catch(e:Error)
         {
         }
         return " ";
      }
      
      public function set headerText(param1:String) : void
      {
         _headerText = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
         dispatchEvent(new Event("headerTextChanged"));
      }
      
      public function set sortCompareFunction(param1:Function) : void
      {
         _sortCompareFunction = param1;
         dispatchEvent(new Event("sortCompareFunctionChanged"));
      }
      
      public function itemToDataTip(param1:Object) : String
      {
         var field:String = null;
         var data:Object = param1;
         if(dataTipFunction != null)
         {
            return dataTipFunction(data);
         }
         if(mx_internal::owner.dataTipFunction != null)
         {
            return mx_internal::owner.dataTipFunction(data);
         }
         if(typeof data == "object" || typeof data == "xml")
         {
            field = dataTipField;
            if(!field)
            {
               field = mx_internal::owner.dataTipField;
            }
            try
            {
               if(data[field] != null)
               {
                  data = data[field];
               }
               else if(data[dataField] != null)
               {
                  data = data[dataField];
               }
            }
            catch(e:Error)
            {
               data = null;
            }
         }
         if(data is String)
         {
            return String(data);
         }
         try
         {
            return data.toString();
         }
         catch(e:Error)
         {
         }
         return " ";
      }
      
      [Bindable("widthChanged")]
      public function get width() : Number
      {
         return _width;
      }
      
      public function set dataTipField(param1:String) : void
      {
         _dataTipField = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
         dispatchEvent(new Event("dataTipChanged"));
      }
      
      public function set labelFunction(param1:Function) : void
      {
         _labelFunction = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
         dispatchEvent(new Event("labelFunctionChanged"));
      }
      
      public function set dataField(param1:String) : void
      {
         _dataField = param1;
         if(param1.indexOf(".") != -1)
         {
            hasComplexFieldName = true;
            complexFieldNameComponents = param1.split(".");
            if(_sortCompareFunction == null)
            {
               _sortCompareFunction = complexColumnSortCompare;
            }
         }
         else
         {
            hasComplexFieldName = false;
         }
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
      }
      
      public function set headerRenderer(param1:IFactory) : void
      {
         _headerRenderer = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
            mx_internal::owner.mx_internal::columnRendererChanged(this);
         }
         dispatchEvent(new Event("headerRendererChanged"));
      }
      
      public function set wordWrap(param1:*) : void
      {
         _wordWrap = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
         }
      }
      
      [Bindable("dataTipFieldChanged")]
      public function get dataTipField() : String
      {
         return _dataTipField;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(_visible != param1)
         {
            _visible = param1;
            if(param1)
            {
               mx_internal::newlyVisible = true;
            }
            if(mx_internal::owner)
            {
               mx_internal::owner.mx_internal::columnsInvalid = true;
               mx_internal::owner.invalidateSize();
               mx_internal::owner.invalidateList();
            }
         }
      }
      
      public function set itemRenderer(param1:IFactory) : void
      {
         _itemRenderer = param1;
         if(mx_internal::owner)
         {
            mx_internal::owner.invalidateList();
            mx_internal::owner.mx_internal::columnRendererChanged(this);
         }
         dispatchEvent(new Event("itemRendererChanged"));
      }
      
      private function replaceItemRendererFactory(param1:IFactory) : IFactory
      {
         if(oldEmbeddedFontContext == null)
         {
            return param1;
         }
         if(param1 == null && mx_internal::owner != null)
         {
            param1 = mx_internal::owner.itemRenderer;
         }
         if(param1 is ClassFactory)
         {
            return new ContextualClassFactory(ClassFactory(param1).generator,oldEmbeddedFontContext);
         }
         return param1;
      }
      
      [Bindable("itemRendererChanged")]
      public function get itemRenderer() : IFactory
      {
         return _itemRenderer;
      }
      
      [Bindable("labelFunctionChanged")]
      public function get labelFunction() : Function
      {
         return _labelFunction;
      }
   }
}
