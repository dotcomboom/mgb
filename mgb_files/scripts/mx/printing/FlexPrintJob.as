package mx.printing
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.geom.Rectangle;
   import flash.printing.PrintJob;
   import flash.printing.PrintJobOptions;
   import mx.core.Application;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.core.UIComponent;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class FlexPrintJob
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var _printAsBitmap:Boolean = true;
      
      private var printJob:PrintJob;
      
      private var _pageHeight:Number = 0;
      
      private var _pageWidth:Number = 0;
      
      public function FlexPrintJob()
      {
         printJob = new PrintJob();
         super();
      }
      
      public function start() : Boolean
      {
         var _loc1_:Boolean = printJob.start();
         if(_loc1_)
         {
            _pageWidth = printJob.pageWidth;
            _pageHeight = printJob.pageHeight;
         }
         return _loc1_;
      }
      
      public function addObject(param1:IUIComponent, param2:String = "matchWidth") : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:IFlexDisplayObject = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc24_:Rectangle = null;
         var _loc25_:PrintJobOptions = null;
         var _loc26_:Object = null;
         var _loc11_:Object = {};
         if(param1 is Application)
         {
            _loc7_ = Application(param1).numChildren;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               if((_loc10_ = IFlexDisplayObject(Application(param1).getChildAt(_loc8_))) is UIComponent && (!isNaN(UIComponent(_loc10_).percentWidth) || !isNaN(UIComponent(_loc10_).percentHeight)))
               {
                  _loc11_[_loc10_.name] = {};
                  if(!isNaN(UIComponent(_loc10_).percentWidth) && isNaN(UIComponent(_loc10_).explicitWidth))
                  {
                     _loc11_[_loc10_.name].percentWidth = UIComponent(_loc10_).percentWidth;
                     UIComponent(_loc10_).percentWidth = NaN;
                     UIComponent(_loc10_).explicitWidth = UIComponent(_loc10_).width;
                  }
                  if(!isNaN(UIComponent(_loc10_).percentHeight) && isNaN(UIComponent(_loc10_).explicitHeight))
                  {
                     _loc11_[_loc10_.name].percentHeight = UIComponent(_loc10_).percentHeight;
                     UIComponent(_loc10_).percentHeight = NaN;
                     UIComponent(_loc10_).explicitHeight = UIComponent(_loc10_).height;
                  }
               }
               _loc8_++;
            }
            if(!isNaN(UIComponent(param1).explicitWidth) && !isNaN(UIComponent(param1).explicitHeight))
            {
               _loc12_ = UIComponent(param1).explicitWidth;
               _loc13_ = UIComponent(param1).explicitHeight;
               UIComponent(param1).explicitWidth = NaN;
               UIComponent(param1).explicitHeight = NaN;
               UIComponent(param1).measuredWidth = _loc12_;
               UIComponent(param1).measuredHeight = _loc13_;
            }
            if(isNaN(param1.percentWidth) && isNaN(param1.percentHeight))
            {
               UIComponent(param1).mx_internal::invalidateSizeFlag = false;
            }
            UIComponent(param1).validateSize();
            _loc3_ = Number(param1.measuredWidth);
            _loc4_ = Number(param1.measuredHeight);
         }
         else
         {
            if(!isNaN(param1.percentWidth) && isNaN(param1.explicitWidth))
            {
               _loc5_ = Number(param1.percentWidth);
               param1.percentWidth = NaN;
               param1.explicitWidth = param1.width;
            }
            if(!isNaN(param1.percentHeight) && isNaN(param1.explicitHeight))
            {
               _loc6_ = Number(param1.percentHeight);
               param1.percentHeight = NaN;
               param1.explicitHeight = param1.height;
            }
            _loc3_ = Number(param1.getExplicitOrMeasuredWidth());
            _loc4_ = Number(param1.getExplicitOrMeasuredHeight());
         }
         var _loc14_:Number = _pageWidth / _loc3_;
         var _loc15_:Number = _pageHeight / _loc4_;
         var _loc16_:Number = 1;
         if(param2 == FlexPrintJobScaleType.SHOW_ALL)
         {
            _loc16_ = _loc14_ < _loc15_ ? _loc14_ : _loc15_;
         }
         else if(param2 == FlexPrintJobScaleType.FILL_PAGE)
         {
            _loc16_ = _loc14_ > _loc15_ ? _loc14_ : _loc15_;
         }
         else if(param2 != FlexPrintJobScaleType.NONE)
         {
            if(param2 == FlexPrintJobScaleType.MATCH_HEIGHT)
            {
               _loc16_ = _loc15_;
            }
            else
            {
               _loc16_ = _loc14_;
            }
         }
         param1.scaleX *= _loc16_;
         param1.scaleY *= _loc16_;
         UIComponentGlobals.mx_internal::layoutManager.usePhasedInstantiation = false;
         UIComponentGlobals.mx_internal::layoutManager.validateNow();
         var _loc17_:Array = prepareToPrintObject(param1);
         if(param1 is Application)
         {
            _loc3_ *= _loc16_;
            _loc4_ *= _loc16_;
         }
         else
         {
            _loc3_ = Number(param1.getExplicitOrMeasuredWidth());
            _loc4_ = Number(param1.getExplicitOrMeasuredHeight());
         }
         var _loc18_:int = Math.ceil(_loc3_ / _pageWidth);
         var _loc19_:int = Math.ceil(_loc4_ / _pageHeight);
         var _loc20_:Number = _pageWidth / _loc16_;
         var _loc21_:Number = _pageHeight / _loc16_;
         var _loc22_:Number = _loc3_ % _pageWidth / _loc16_;
         var _loc23_:Number = _loc4_ % _pageHeight / _loc16_;
         _loc9_ = 0;
         while(_loc9_ < _loc19_)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc18_)
            {
               _loc24_ = new Rectangle(_loc8_ * _loc20_,_loc9_ * _loc21_,_loc20_,_loc21_);
               if(_loc8_ == _loc18_ - 1 && _loc22_ != 0)
               {
                  _loc24_.width = _loc22_;
               }
               if(_loc9_ == _loc19_ - 1 && _loc23_ != 0)
               {
                  _loc24_.height = _loc23_;
               }
               _loc24_.width = Math.ceil(_loc24_.width);
               _loc24_.height = Math.ceil(_loc24_.height);
               (_loc25_ = new PrintJobOptions()).printAsBitmap = _printAsBitmap;
               printJob.addPage(Sprite(param1),_loc24_,_loc25_);
               _loc8_++;
            }
            _loc9_++;
         }
         finishPrintObject(param1,_loc17_);
         param1.scaleX /= _loc16_;
         param1.scaleY /= _loc16_;
         if(param1 is Application)
         {
            if(!isNaN(_loc12_))
            {
               UIComponent(param1).setActualSize(_loc12_,_loc13_);
               _loc12_ = NaN;
               _loc13_ = NaN;
               UIComponent(param1).measuredWidth = 0;
               UIComponent(param1).measuredHeight = 0;
            }
            _loc7_ = Application(param1).numChildren;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               if((_loc10_ = IFlexDisplayObject(Application(param1).getChildAt(_loc8_))) is UIComponent && Boolean(_loc11_[_loc10_.name]))
               {
                  if((Boolean(_loc26_ = _loc11_[_loc10_.name])) && !isNaN(_loc26_.percentWidth))
                  {
                     UIComponent(_loc10_).percentWidth = _loc26_.percentWidth;
                     UIComponent(_loc10_).explicitWidth = NaN;
                  }
                  if(Boolean(_loc26_) && !isNaN(_loc26_.percentHeight))
                  {
                     UIComponent(_loc10_).percentHeight = _loc26_.percentHeight;
                     UIComponent(_loc10_).explicitHeight = NaN;
                  }
               }
               _loc8_++;
            }
            UIComponent(param1).mx_internal::invalidateSizeFlag = false;
            UIComponent(param1).validateSize();
         }
         else
         {
            if(!isNaN(_loc5_))
            {
               param1.percentWidth = _loc5_;
               param1.explicitWidth = NaN;
            }
            if(!isNaN(_loc6_))
            {
               param1.percentHeight = _loc6_;
               param1.explicitHeight = NaN;
            }
         }
         UIComponentGlobals.mx_internal::layoutManager.usePhasedInstantiation = false;
         UIComponentGlobals.mx_internal::layoutManager.validateNow();
      }
      
      public function send() : void
      {
         printJob.send();
      }
      
      public function get printAsBitmap() : Boolean
      {
         return _printAsBitmap;
      }
      
      private function prepareToPrintObject(param1:IUIComponent) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:DisplayObject = param1 is DisplayObject ? DisplayObject(param1) : null;
         var _loc4_:Number = 0;
         while(_loc3_)
         {
            if(_loc3_ is UIComponent)
            {
               var _loc5_:*;
               _loc2_[_loc5_ = _loc4_++] = UIComponent(_loc3_).prepareToPrint(UIComponent(param1));
            }
            else if(_loc3_ is DisplayObject && !(_loc3_ is Stage))
            {
               _loc2_[_loc5_ = _loc4_++] = DisplayObject(_loc3_).mask;
               DisplayObject(_loc3_).mask = null;
            }
            _loc3_ = _loc3_.parent is DisplayObject ? DisplayObject(_loc3_.parent) : null;
         }
         return _loc2_;
      }
      
      public function get pageHeight() : Number
      {
         return _pageHeight;
      }
      
      public function get pageWidth() : Number
      {
         return _pageWidth;
      }
      
      private function finishPrintObject(param1:IUIComponent, param2:Array) : void
      {
         var _loc3_:DisplayObject = param1 is DisplayObject ? DisplayObject(param1) : null;
         var _loc4_:Number = 0;
         while(_loc3_)
         {
            if(_loc3_ is UIComponent)
            {
               UIComponent(_loc3_).finishPrint(param2[_loc4_++],UIComponent(param1));
            }
            else if(_loc3_ is DisplayObject && !(_loc3_ is Stage))
            {
               DisplayObject(_loc3_).mask = param2[_loc4_++];
            }
            _loc3_ = _loc3_.parent is DisplayObject ? DisplayObject(_loc3_.parent) : null;
         }
      }
      
      public function set printAsBitmap(param1:Boolean) : void
      {
         _printAsBitmap = param1;
      }
   }
}
