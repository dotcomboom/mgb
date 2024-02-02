package com.mgb.controls
{
   import com.mgb.data.*;
   import com.mgb.managers.*;
   import flash.display.*;
   import flash.events.Event;
   import mx.core.UIComponent;
   
   public class ActorPreview extends UIComponent
   {
       
      
      private var intendedMaxHeight:int = 64;
      
      private var intendedMaxSizesKnown:Boolean = false;
      
      private var intendedMaxWidth:int = 64;
      
      private var bitmap:Bitmap = null;
      
      private var actor:MgbActor = null;
      
      private var count:int = 0;
      
      public var supressTooltips:Boolean = false;
      
      public function ActorPreview()
      {
         super();
      }
      
      override protected function measure() : void
      {
         super.measure();
         measuredMinWidth = measuredWidth = intendedMaxWidth;
         measuredMinHeight = measuredHeight = intendedMaxHeight;
      }
      
      private function animateActor(param1:Event = null) : void
      {
         var _loc2_:MgbTile = null;
         if(!actor || !bitmap)
         {
            throw new Error("can\'t animate actor - not specified");
         }
         if(actor.projectName != MgbSession.getInstance().activeProject)
         {
            return;
         }
         count = (count + 1) % (4 * actor.animationTable.length);
         if(count % 4 == 0)
         {
            _loc2_ = MgbTile(MgbCaches.getInstance().tileCache.getPiece(MgbSession.getInstance().userName,actor.projectName,actor.animationTable[count / 4].tilename));
            if(!_loc2_ && Boolean(actor.tilename))
            {
               _loc2_ = MgbTile(MgbCaches.getInstance().tileCache.getPiece(MgbSession.getInstance().userName,actor.projectName,actor.tilename,null,false,true));
            }
            if(!toolTip && !actor.loadPending && !supressTooltips)
            {
               this.toolTip = actor.getDescription(true);
            }
            if(_loc2_ != null && _loc2_.bitmapData != null)
            {
               bitmap.bitmapData = _loc2_.bitmapDataVariant(actor.animationTable[count / 4].effect);
               if(bitmap.bitmapData.width > intendedMaxWidth)
               {
                  bitmap.scaleX = intendedMaxWidth / bitmap.bitmapData.width;
               }
               else
               {
                  bitmap.scaleX = 1;
               }
               if(bitmap.bitmapData.height > intendedMaxHeight)
               {
                  bitmap.scaleY = intendedMaxHeight / bitmap.bitmapData.height;
               }
               else
               {
                  bitmap.scaleY = 1;
               }
               bitmap.x = (intendedMaxWidth - bitmap.width) / 2;
               bitmap.y = (intendedMaxHeight - bitmap.height) / 2;
            }
         }
      }
      
      public function show(param1:MgbActor = null) : void
      {
         if(bitmap)
         {
            removeChild(bitmap);
            bitmap = null;
            removeEventListener("enterFrame",animateActor);
            actor = null;
            toolTip = null;
         }
         if(!intendedMaxSizesKnown)
         {
            intendedMaxWidth = width == 0 ? int(MgbSystem.tilePreviewWidth) : int(width);
            intendedMaxHeight = height == 0 ? int(MgbSystem.tilePreviewHeight) : int(height);
            intendedMaxSizesKnown = true;
         }
         if(param1)
         {
            addEventListener("enterFrame",animateActor);
            actor = param1;
            count = 0;
            bitmap = new Bitmap(new BitmapData(intendedMaxWidth,intendedMaxHeight,true));
            bitmap.smoothing = true;
            addChild(bitmap);
         }
         invalidateSize();
      }
   }
}
