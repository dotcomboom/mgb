package mx.core
{
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import mx.managers.ISystemManager;
   
   use namespace mx_internal;
   
   public class UITextFormat extends TextFormat
   {
      
      private static var _embeddedFontRegistry:IEmbeddedFontRegistry;
      
      mx_internal static const VERSION:String = "3.6.0.12937";
      
      private static var _textFieldFactory:ITextFieldFactory;
       
      
      private var systemManager:ISystemManager;
      
      public var sharpness:Number;
      
      public var gridFitType:String;
      
      public var antiAliasType:String;
      
      public var thickness:Number;
      
      private var cachedEmbeddedFont:EmbeddedFont = null;
      
      private var _moduleFactory:IFlexModuleFactory;
      
      public function UITextFormat(param1:ISystemManager, param2:String = null, param3:Object = null, param4:Object = null, param5:Object = null, param6:Object = null, param7:Object = null, param8:String = null, param9:String = null, param10:String = null, param11:Object = null, param12:Object = null, param13:Object = null, param14:Object = null)
      {
         this.systemManager = param1;
         super(param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
      }
      
      private static function get embeddedFontRegistry() : IEmbeddedFontRegistry
      {
         if(!_embeddedFontRegistry)
         {
            _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
         }
         return _embeddedFontRegistry;
      }
      
      private static function get textFieldFactory() : ITextFieldFactory
      {
         if(!_textFieldFactory)
         {
            _textFieldFactory = ITextFieldFactory(Singleton.getInstance("mx.core::ITextFieldFactory"));
         }
         return _textFieldFactory;
      }
      
      public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         _moduleFactory = param1;
      }
      
      mx_internal function copyFrom(param1:TextFormat) : void
      {
         font = param1.font;
         size = param1.size;
         color = param1.color;
         bold = param1.bold;
         italic = param1.italic;
         underline = param1.underline;
         url = param1.url;
         target = param1.target;
         align = param1.align;
         leftMargin = param1.leftMargin;
         rightMargin = param1.rightMargin;
         indent = param1.indent;
         leading = param1.leading;
         letterSpacing = param1.letterSpacing;
         blockIndent = param1.blockIndent;
         bullet = param1.bullet;
         display = param1.display;
         indent = param1.indent;
         kerning = param1.kerning;
         tabStops = param1.tabStops;
      }
      
      private function getEmbeddedFont(param1:String, param2:Boolean, param3:Boolean) : EmbeddedFont
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
      
      public function measureText(param1:String, param2:Boolean = true) : TextLineMetrics
      {
         return measure(param1,false,param2);
      }
      
      private function measure(param1:String, param2:Boolean, param3:Boolean) : TextLineMetrics
      {
         if(!param1)
         {
            param1 = "";
         }
         var _loc4_:* = false;
         var _loc5_:IFlexModuleFactory;
         _loc4_ = (_loc5_ = embeddedFontRegistry.getAssociatedModuleFactory(getEmbeddedFont(font,bold,italic),moduleFactory)) != null;
         if(_loc5_ == null)
         {
            _loc5_ = systemManager;
         }
         var _loc6_:TextField = null;
         _loc6_ = TextField(textFieldFactory.createTextField(_loc5_));
         if(param2)
         {
            _loc6_.htmlText = "";
         }
         else
         {
            _loc6_.text = "";
         }
         _loc6_.defaultTextFormat = this;
         if(font)
         {
            _loc6_.embedFonts = _loc4_ || systemManager != null && Boolean(systemManager.isFontFaceEmbedded(this));
         }
         else
         {
            _loc6_.embedFonts = false;
         }
         _loc6_.antiAliasType = antiAliasType;
         _loc6_.gridFitType = gridFitType;
         _loc6_.sharpness = sharpness;
         _loc6_.thickness = thickness;
         if(param2)
         {
            _loc6_.htmlText = param1;
         }
         else
         {
            _loc6_.text = param1;
         }
         var _loc7_:TextLineMetrics = _loc6_.getLineMetrics(0);
         if(indent != null)
         {
            _loc7_.width += indent;
         }
         if(param3)
         {
            _loc7_.width = Math.ceil(_loc7_.width);
            _loc7_.height = Math.ceil(_loc7_.height);
         }
         return _loc7_;
      }
      
      public function measureHTMLText(param1:String, param2:Boolean = true) : TextLineMetrics
      {
         return measure(param1,true,param2);
      }
      
      public function get moduleFactory() : IFlexModuleFactory
      {
         return _moduleFactory;
      }
   }
}
