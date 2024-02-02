package com.mgb.controls
{
   import flash.display.*;
   import flash.events.Event;
   import flash.geom.*;
   import mx.core.UIComponent;
   
   public class Reflection extends UIComponent
   {
       
      
      public var fadeFrom:Number = 0.3;
      
      public var scale:Number = 1;
      
      public var gr:Graphics;
      
      public var bitmap:Bitmap;
      
      public var target:UIComponent;
      
      public var skewX:Number = 0;
      
      public var fadeTo:Number = 0;
      
      public var fadeCenter:Number = 0.5;
      
      public function Reflection()
      {
         bitmap = new Bitmap(new BitmapData(1,1,true,0));
         super();
         addChild(bitmap);
         enableReflection();
      }
      
      public function drawReflection(param1:Event = null) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:Matrix = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Point = null;
         var _loc6_:Shape = null;
         var _loc7_:Matrix = null;
         if(this.width > 0 && this.height > 0)
         {
            _loc2_ = new BitmapData(this.width,this.height,true,0);
            _loc3_ = new Matrix(1,0,skewX,-1 * scale,0,target.height);
            _loc4_ = new Rectangle(0,0,this.width,this.height * (2 - scale));
            _loc5_ = _loc3_.transformPoint(new Point(0,target.height));
            _loc3_.tx = _loc5_.x * -1;
            _loc3_.ty = (_loc5_.y - target.height) * -1;
            _loc2_.draw(target,_loc3_,null,null,_loc4_,true);
            _loc6_ = new Shape();
            (_loc7_ = new Matrix()).createGradientBox(this.width,this.height,0.5 * Math.PI);
            _loc6_.graphics.beginGradientFill(GradientType.LINEAR,new Array(0,0,0),new Array(fadeFrom,(fadeFrom - fadeTo) / 2,fadeTo),new Array(0,255 * fadeCenter,255),_loc7_);
            _loc6_.graphics.drawRect(0,0,this.width,this.height);
            _loc6_.graphics.endFill();
            _loc2_.draw(_loc6_,null,null,BlendMode.ALPHA);
            bitmap.bitmapData.dispose();
            bitmap.bitmapData = _loc2_;
         }
      }
      
      public function enableReflection(param1:Boolean = true) : void
      {
         if(param1)
         {
            addEventListener("enterFrame",drawReflection);
         }
         else
         {
            removeEventListener("enterFrame",drawReflection);
         }
      }
   }
}
