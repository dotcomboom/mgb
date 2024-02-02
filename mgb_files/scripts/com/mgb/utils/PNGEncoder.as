package com.mgb.utils
{
   import flash.display.*;
   import flash.geom.*;
   import flash.net.*;
   import flash.utils.*;
   
   public class PNGEncoder
   {
      
      private static var crc_table:Array;
      
      private static var crc_table_computed:Boolean = false;
      
      private static var _png:ByteArray;
       
      
      public function PNGEncoder()
      {
         super();
      }
      
      public static function encodeAsPNG(param1:BitmapData) : ByteArray
      {
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc2_:uint = uint(param1.width);
         var _loc3_:uint = uint(param1.height);
         _png = new ByteArray();
         _png.writeByte(137);
         _png.writeByte(80);
         _png.writeByte(78);
         _png.writeByte(71);
         _png.writeByte(13);
         _png.writeByte(10);
         _png.writeByte(26);
         _png.writeByte(10);
         var _loc4_:ByteArray;
         (_loc4_ = new ByteArray()).writeInt(_loc2_);
         _loc4_.writeInt(_loc3_);
         _loc4_.writeByte(8);
         _loc4_.writeByte(6);
         _loc4_.writeByte(0);
         _loc4_.writeByte(0);
         _loc4_.writeByte(0);
         writeChunk([73,72,68,82],_loc4_);
         var _loc5_:ByteArray = new ByteArray();
         var _loc6_:uint = 0;
         while(_loc6_ < _loc3_)
         {
            _loc5_.writeByte(0);
            _loc7_ = 0;
            while(_loc7_ < _loc2_)
            {
               _loc8_ = param1.getPixel32(_loc7_,_loc6_);
               _loc5_.writeByte(_loc8_ >> 16 & 255);
               _loc5_.writeByte(_loc8_ >> 8 & 255);
               _loc5_.writeByte(_loc8_ & 255);
               _loc5_.writeByte(_loc8_ >> 24 & 255);
               _loc7_++;
            }
            _loc6_++;
         }
         _loc5_.compress();
         writeChunk([73,68,65,84],_loc5_);
         writeChunk([73,69,78,68],null);
         return _png;
      }
      
      private static function crc(param1:ByteArray, param2:uint) : uint
      {
         var _loc3_:uint = uint(update_crc(uint(4294967295),param1,param2));
         return uint(_loc3_ ^ uint(4294967295));
      }
      
      private static function writeChunk(param1:Array, param2:ByteArray) : void
      {
         var _loc3_:uint = 0;
         if(param2 != null)
         {
            _loc3_ = param2.length;
         }
         _png.writeUnsignedInt(_loc3_);
         var _loc4_:uint = uint(_png.position);
         _png.writeByte(param1[0]);
         _png.writeByte(param1[1]);
         _png.writeByte(param1[2]);
         _png.writeByte(param1[3]);
         if(param2 != null)
         {
            _png.writeBytes(param2);
         }
         var _loc5_:uint = uint(_png.position);
         _png.position = _loc4_;
         var _loc6_:uint = uint(crc(_png,_loc5_ - _loc4_));
         _png.position = _loc5_;
         _png.writeUnsignedInt(_loc6_);
      }
      
      private static function make_crc_table() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         crc_table = [];
         _loc2_ = 0;
         while(_loc2_ < 256)
         {
            _loc1_ = uint(_loc2_);
            _loc3_ = 0;
            while(_loc3_ < 8)
            {
               if(_loc1_ & 1)
               {
                  _loc1_ = uint(uint(3988292384) ^ uint(_loc1_ >>> 1));
               }
               else
               {
                  _loc1_ = uint(_loc1_ >>> 1);
               }
               _loc3_++;
            }
            crc_table[_loc2_] = _loc1_;
            _loc2_++;
         }
         crc_table_computed = true;
      }
      
      public static function dump() : String
      {
         var _loc4_:uint = 0;
         _png.position = 0;
         var _loc1_:* = "";
         var _loc2_:String = "0123456789abcdef";
         var _loc3_:uint = 0;
         while(_loc3_ < _png.length)
         {
            _loc4_ = uint(_png.readUnsignedByte());
            _loc1_ += _loc2_.charAt((_loc4_ & 240) >> 4);
            _loc1_ += _loc2_.charAt(_loc4_ & 15);
            _loc1_ += " ";
            _loc3_++;
         }
         return _loc1_;
      }
      
      private static function update_crc(param1:uint, param2:ByteArray, param3:uint) : uint
      {
         var _loc5_:int = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = param1;
         if(!crc_table_computed)
         {
            make_crc_table();
         }
         _loc5_ = 0;
         while(_loc5_ < param3)
         {
            _loc6_ = param2.readUnsignedByte();
            _loc4_ = uint(crc_table[(_loc4_ ^ _loc6_) & uint(255)] ^ uint(_loc4_ >>> 8));
            _loc5_++;
         }
         return _loc4_;
      }
   }
}
