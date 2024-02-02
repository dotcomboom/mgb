package com.mgb.controls
{
   import flash.display.*;
   
   public class MgbBlitter extends Bitmap
   {
       
      
      public var blitCount:int;
      
      public var frameBuffer:BitmapData;
      
      public function MgbBlitter(param1:int, param2:int)
      {
         super();
         updateSize(param1,param2);
      }
      
      public function blit() : void
      {
         var _loc1_:BitmapData = this.bitmapData;
         this.bitmapData = frameBuffer;
         frameBuffer = _loc1_;
         ++blitCount;
      }
      
      public function updateSize(param1:int, param2:int) : void
      {
         if(this.bitmapData)
         {
            this.bitmapData.dispose();
            this.bitmapData = null;
         }
         if(this.frameBuffer)
         {
            this.frameBuffer.dispose();
            this.frameBuffer = null;
         }
         if(param1 > 0 && param2 > 0)
         {
            this.bitmapData = new BitmapData(param1,param2);
            this.frameBuffer = new BitmapData(param1,param2);
         }
      }
      
      public function dispose() : void
      {
         updateSize(0,0);
      }
   }
}
