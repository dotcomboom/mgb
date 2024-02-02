package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.display.DisplayObject;
   import flash.utils.*;
   import mx.controls.*;
   import mx.rpc.events.ResultEvent;
   
   public class MgbMap extends Piece
   {
      
      public static const layerEditGrid:int = 4;
      
      public static const layerActive:int = 1;
      
      public static const layerEvents:int = 3;
      
      public static const layerGameCount:int = 4;
      
      public static const layerVisibleActorsCount:int = 3;
      
      public static const layerEditorCount:int = 5;
      
      public static const layerForeground:int = 2;
      
      public static const layerNames:Array = ["Background","Active","Foreground","Event"];
      
      public static const layerBackground:int = 0;
       
      
      private var mapLoadCallback:Function = null;
      
      private var loadChoiceCallback:Function = null;
      
      public var mapLayerActors:Array;
      
      public const mapMaxHeight:int = 200;
      
      public const mapMaxWidth:int = 200;
      
      public function MgbMap()
      {
         mapLayerActors = new Array();
         super(MGB_MAP);
      }
      
      override public function loadByName(param1:String, param2:String, param3:String, param4:Function = null, param5:Boolean = false, param6:int = 3) : void
      {
         mapLoadCallback = param4;
         super.loadByName(param1,param2,param3,mapLoadHandler,param5,param6);
      }
      
      private function mapLoadHandler(param1:ResultEvent) : void
      {
         var _loc2_:Boolean = false;
         if(!param1.result.hasOwnProperty("mgb_error"))
         {
            mapInitialize(param1.result.piece.width,param1.result.piece.height);
            decodeMap(param1.result.piece.blob);
            _loc2_ = true;
            this.blob = null;
         }
         if(null != mapLoadCallback)
         {
            mapLoadCallback(param1);
         }
         if(_loc2_)
         {
            issuePieceChangedEventOpSuccessful();
         }
      }
      
      public function mapClear(param1:Boolean = false) : void
      {
         if(!param1)
         {
            width = height = 0;
         }
         var _loc2_:int = 0;
         while(_loc2_ < MgbMap.layerGameCount)
         {
            this.mapLayerActors[_loc2_] = param1 ? new Array() : null;
            _loc2_++;
         }
      }
      
      public function decodeMap(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc2_:ByteArray = Base64ByteArray.Decode(param1);
         _loc2_.uncompress();
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ == 0)
         {
            mapInitialize(width,height);
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = _loc2_.readInt();
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc7_ = _loc2_.readUTF();
                  mapLayerActors[_loc4_][_loc6_] = _loc7_ == "" ? null : _loc7_;
                  _loc6_++;
               }
               _loc4_++;
            }
            _loc3_ = 0;
            while(_loc4_ < MgbMap.layerGameCount)
            {
               mapLayerActors[_loc4_] = new Array();
               _loc4_++;
            }
         }
      }
      
      public function RemoveRow(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(height > 2 && param1 < height)
         {
            _loc2_ = new Array();
            _loc3_ = height - 1;
            _loc4_ = 0;
            while(_loc4_ < MgbMap.layerGameCount)
            {
               _loc2_[_loc4_] = new Array();
               _loc5_ = 0;
               _loc6_ = 0;
               while(_loc6_ < width * _loc3_)
               {
                  if(_loc5_ == param1 * width)
                  {
                     _loc5_ += width;
                  }
                  _loc2_[_loc4_][_loc6_] = this.mapLayerActors[_loc4_][_loc5_];
                  _loc5_++;
                  _loc6_++;
               }
               this.mapLayerActors[_loc4_] = _loc2_[_loc4_];
               _loc4_++;
            }
            height = _loc3_;
         }
         else
         {
            Alert.show("Cannot remove any more rows");
         }
      }
      
      public function AddRow(param1:int, param2:Boolean) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(height < mapMaxHeight && param1 < height)
         {
            _loc3_ = new Array();
            _loc4_ = height + 1;
            _loc5_ = 0;
            while(_loc5_ < MgbMap.layerGameCount)
            {
               _loc3_[_loc5_] = new Array();
               _loc6_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc4_ * width)
               {
                  if(param2)
                  {
                     if(_loc6_ == (param1 + 1) * width)
                     {
                        _loc8_ = 0;
                        while(_loc8_ < width)
                        {
                           _loc3_[_loc5_][_loc7_ + _loc8_] = null;
                           _loc8_++;
                        }
                        _loc7_ += width;
                     }
                  }
                  else if(_loc6_ == param1 * width)
                  {
                     _loc8_ = 0;
                     while(_loc8_ < width)
                     {
                        _loc3_[_loc5_][_loc7_ + _loc8_] = null;
                        _loc8_++;
                     }
                     _loc7_ += width;
                  }
                  _loc3_[_loc5_][_loc7_] = this.mapLayerActors[_loc5_][_loc6_];
                  _loc6_++;
                  _loc7_++;
               }
               this.mapLayerActors[_loc5_] = _loc3_[_loc5_];
               _loc5_++;
            }
            height = _loc4_;
         }
         else
         {
            Alert.show("Cannot add any more rows");
         }
      }
      
      public function RemoveColumn(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(width > 2 && param1 < width)
         {
            _loc2_ = new Array();
            _loc3_ = width - 1;
            _loc4_ = 0;
            while(_loc4_ < MgbMap.layerGameCount)
            {
               _loc2_[_loc4_] = new Array();
               _loc5_ = 0;
               _loc6_ = 0;
               while(_loc6_ < _loc3_ * height)
               {
                  if(_loc5_ % width == param1)
                  {
                     _loc5_++;
                  }
                  _loc2_[_loc4_][_loc6_] = this.mapLayerActors[_loc4_][_loc5_];
                  _loc5_++;
                  _loc6_++;
               }
               this.mapLayerActors[_loc4_] = _loc2_[_loc4_];
               _loc4_++;
            }
            width = _loc3_;
         }
         else
         {
            Alert.show("Cannot remove any more columns");
         }
      }
      
      public function mapInitialize(param1:int, param2:int) : void
      {
         var _loc4_:int = 0;
         width = param1;
         height = param2;
         var _loc3_:int = 0;
         while(_loc3_ < MgbMap.layerGameCount)
         {
            this.mapLayerActors[_loc3_] = new Array();
            _loc4_ = 0;
            while(_loc4_ < width * height)
            {
               this.mapLayerActors[_loc3_][_loc4_] = null;
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      override public function loadPieceFromPiece(param1:Piece) : void
      {
         super.loadPieceFromPiece(param1);
         var _loc2_:String = String(MgbMap(param1).encodeMap());
         mapInitialize(param1.width,param1.height);
         decodeMap(_loc2_);
      }
      
      public function describeDensity(param1:Number = NaN) : String
      {
         if(isNaN(param1))
         {
            param1 = calculateDensity();
         }
         if(Boolean(isNaN(param1)) || param1 < 0)
         {
            return "";
         }
         if(0 == param1)
         {
            return "blank";
         }
         if(param1 < 5)
         {
            return "very sparse";
         }
         if(param1 < 15)
         {
            return "sparse";
         }
         if(param1 < 30)
         {
            return "simple";
         }
         if(param1 < 40)
         {
            return "dense";
         }
         if(param1 < 50)
         {
            return "complex";
         }
         return "intricate";
      }
      
      public function calculateDensity() : Number
      {
         var _loc4_:int = 0;
         var _loc1_:int = height * width;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < MgbMap.layerVisibleActorsCount)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc1_)
            {
               if(mapLayerActors[_loc3_][_loc4_] != null && mapLayerActors[_loc3_][_loc4_] != "")
               {
                  _loc2_++;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         return 100 * _loc2_ / (_loc3_ * _loc1_);
      }
      
      public function loadUsingDialogChoiceHandler(param1:String, param2:String, param3:String) : void
      {
         this.loadByName(param1,param2,param3,loadChoiceCallback);
         loadChoiceCallback = null;
      }
      
      public function encodeMap() : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeInt(mapLayerActors.length);
         if(mapLayerActors.length)
         {
            _loc2_ = 0;
            while(_loc2_ < MgbMap.layerGameCount)
            {
               _loc1_.writeInt(int(mapLayerActors[_loc2_].length));
               _loc3_ = 0;
               while(_loc3_ < mapLayerActors[_loc2_].length)
               {
                  _loc1_.writeUTF(!!mapLayerActors[_loc2_][_loc3_] ? String(mapLayerActors[_loc2_][_loc3_]) : "");
                  _loc3_++;
               }
               _loc2_++;
            }
         }
         _loc1_.compress();
         return Base64ByteArray.Encode(_loc1_);
      }
      
      override public function loadUsingDialog(param1:String, param2:String, param3:DisplayObject, param4:Function = null) : void
      {
         loadChoiceCallback = param4;
         super.loadUsingDialog(param1,param2,param3,loadUsingDialogChoiceHandler);
      }
      
      public function AddColumn(param1:int, param2:Boolean) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(width < mapMaxWidth && param1 < width)
         {
            _loc3_ = new Array();
            _loc4_ = width + 1;
            _loc5_ = 0;
            while(_loc5_ < MgbMap.layerGameCount)
            {
               _loc3_[_loc5_] = new Array();
               _loc6_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc4_ * height)
               {
                  if(param2)
                  {
                     if((_loc6_ - 1) % width == param1)
                     {
                        _loc3_[_loc5_][_loc7_] = null;
                        _loc7_++;
                     }
                  }
                  else if(_loc6_ % width == param1)
                  {
                     _loc3_[_loc5_][_loc7_] = null;
                     _loc7_++;
                  }
                  _loc3_[_loc5_][_loc7_] = this.mapLayerActors[_loc5_][_loc6_];
                  _loc6_++;
                  _loc7_++;
               }
               this.mapLayerActors[_loc5_] = _loc3_[_loc5_];
               _loc5_++;
            }
            width = _loc4_;
         }
         else
         {
            Alert.show("Cannot add any more columns");
         }
      }
      
      override public function save(param1:Function = null) : void
      {
         this.tilename = "";
         this.blob = encodeMap();
         this.blobencoding = 0;
         super.save(param1);
      }
   }
}
