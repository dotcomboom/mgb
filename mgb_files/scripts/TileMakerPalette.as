package
{
   import com.mgb.data.*;
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
   import korax.controls.ColorPicker.*;
   import mx.binding.*;
   import mx.collections.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.controls.Label;
   import mx.core.*;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.ResultEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class TileMakerPalette extends Canvas implements IBindingClient
   {
      
      public static const defaultPaletteFileName:String = "tilemaker_palette00";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _TileMakerPalette_HBox1:HBox;
      
      mx_internal var _watchers:Array;
      
      public var _TileMakerPalette_Label1:Array;
      
      public var _TileMakerPalette_Label2:Label;
      
      public var _TileMakerPalette_Label3:Label;
      
      public var _TileMakerPalette_Label4:Label;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _283745478_paletteImageFileName:String = "";
      
      private var _612366838_paletteTile:MgbTile;
      
      private var _114r:Repeater;
      
      private var _419683560_paletteActiveRow:int = 0;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _TileMakerPalette_Canvas2:Array;
      
      private var _1980689057colorList:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function TileMakerPalette()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":216,
                  "height":22,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":HBox,
                     "id":"_TileMakerPalette_HBox1",
                     "stylesFactory":function():void
                     {
                        this.horizontalGap = 6;
                        this.borderStyle = "none";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Repeater,
                              "id":"r",
                              "propertiesFactory":function():Object
                              {
                                 return {"childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_TileMakerPalette_Canvas2",
                                    "events":{"click":"___TileMakerPalette_Canvas2_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.borderColor = 16777215;
                                       this.borderThickness = 1;
                                       this.borderStyle = "solid";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "height":20,
                                          "width":16,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "id":"_TileMakerPalette_Label1",
                                             "stylesFactory":function():void
                                             {
                                                this.color = 553648127;
                                                this.verticalCenter = "0";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {"x":2};
                                             }
                                          })]
                                       };
                                    }
                                 })]};
                              }
                           }),new UIComponentDescriptor({
                              "type":Label,
                              "id":"_TileMakerPalette_Label2",
                              "stylesFactory":function():void
                              {
                                 this.paddingTop = 1;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentHeight":100,
                                    "width":28
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"_TileMakerPalette_Label3",
                     "propertiesFactory":function():Object
                     {
                        return {"text":"No color palette defined for this project"};
                     }
                  }),new UIComponentDescriptor({
                     "type":Label,
                     "id":"_TileMakerPalette_Label4",
                     "propertiesFactory":function():Object
                     {
                        return {"text":"Loading color palette for this project..."};
                     }
                  })]
               };
            }
         });
         _1980689057colorList = new ArrayCollection([4278190080,4278190112,4278190144,4278190176,4278190208,4278190240,4278190272,4278190335]);
         _1217010542mgbSession = MgbSession.getInstance();
         _612366838_paletteTile = new MgbTile();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 216;
         this.height = 22;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",___TileMakerPalette_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         TileMakerPalette._watcherSetupUtil = param1;
      }
      
      private function raiseEventForColorSelected(param1:uint) : void
      {
         this.dispatchEvent(new ColorPickerEvent("colorSelect",param1));
      }
      
      [Bindable(event="propertyChange")]
      private function get _paletteTile() : MgbTile
      {
         return this._612366838_paletteTile;
      }
      
      private function set _paletteImageFileName(param1:String) : void
      {
         var _loc2_:Object = this._283745478_paletteImageFileName;
         if(_loc2_ !== param1)
         {
            this._283745478_paletteImageFileName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_paletteImageFileName",_loc2_,param1));
         }
      }
      
      private function set paletteTile(param1:MgbTile) : void
      {
         _paletteTile = param1;
      }
      
      private function _TileMakerPalette_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = _paletteTile.loadFailed == false && _paletteTile.loadPending == false;
         _loc1_ = "Use keys 1-8 to quick-select colors, and up/down to activate different rows from the palette tile. Use the \'L\' key to force a reload of the palette tile \'" + defaultPaletteFileName + "\'.";
         _loc1_ = colorList;
         _loc1_ = r.currentItem;
         _loc1_ = alphafromColor(r.currentItem);
         _loc1_ = r.currentIndex + 1;
         _loc1_ = "R" + paletteActiveRow;
         _loc1_ = "Use the up/down key to change active row within the color palette tile.  Use the \'L\' key to force a reload of the palette tile \'" + defaultPaletteFileName + "\'.";
         _loc1_ = "Create a palette by creating and saving a tile called \'" + defaultPaletteFileName + "\' in this project. Use the \'L\' key to force a reload of the palette tile.";
         _loc1_ = _paletteTile.loadFailed == true;
         _loc1_ = "Create a palette by creating and saving a tile called \'" + defaultPaletteFileName + "\' in this project. Use the \'L\' key to force a reload of the palette tile.";
         _loc1_ = _paletteTile.loadPending == true;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:TileMakerPalette = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _TileMakerPalette_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_TileMakerPaletteWatcherSetupUtil");
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
      
      public function handleKey(param1:uint) : Boolean
      {
         if(param1 == 76)
         {
            loadPalette();
            return true;
         }
         if(_paletteTile.loadFailed == false && _paletteTile.loadPending == false)
         {
            if(param1 >= 48 + 1 && param1 <= 48 + 8)
            {
               raiseEventForColorSelected(colorList[param1 - 49]);
               return true;
            }
            if(param1 == Keyboard.UP)
            {
               --paletteActiveRow;
               return true;
            }
            if(param1 == Keyboard.DOWN)
            {
               ++paletteActiveRow;
               return true;
            }
         }
         return false;
      }
      
      private function paletteReloader(param1:Event) : void
      {
         if(Boolean(mgbSession.userName) && Boolean(mgbSession.activeProject))
         {
            paletteImageFileName = defaultPaletteFileName;
         }
      }
      
      private function set _135085895paletteActiveRow(param1:int) : void
      {
         var _loc2_:int = 0;
         if(_paletteTile.loadFailed == false && _paletteTile.loadPending == false)
         {
            _loc2_ = paletteTile.width * paletteTile.height / 8;
         }
         _paletteActiveRow = param1 % _loc2_;
         if(paletteActiveRow < 0)
         {
            paletteActiveRow += _loc2_;
         }
         applyActiveRow();
      }
      
      private function paletteImageFileLoadedHandler(param1:ResultEvent) : void
      {
         var _loc2_:MgbTile = MgbTile(param1.result.piece);
         paletteActiveRow = 0;
         applyActiveRow();
      }
      
      [Bindable(event="propertyChange")]
      private function set paletteActiveRow(param1:int) : void
      {
         var _loc2_:Object = this.paletteActiveRow;
         if(_loc2_ !== param1)
         {
            this._135085895paletteActiveRow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paletteActiveRow",_loc2_,param1));
         }
      }
      
      private function applyActiveRow() : void
      {
         var _loc1_:BitmapData = paletteTile.bitmapData;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            colorList[_loc2_] = _loc1_.getPixel32(_loc2_,paletteActiveRow);
            _loc2_++;
         }
      }
      
      private function loadPalette() : void
      {
         paletteTile.loadByName(mgbSession.userName,mgbSession.activeProject,_paletteImageFileName,paletteImageFileLoadedHandler,true);
      }
      
      private function get paletteActiveRow() : int
      {
         return _paletteActiveRow;
      }
      
      [Bindable(event="propertyChange")]
      private function get _paletteActiveRow() : int
      {
         return this._419683560_paletteActiveRow;
      }
      
      private function alphafromColor(param1:Object) : uint
      {
         var _loc2_:uint = param1 as uint;
         return _loc2_ >> 24;
      }
      
      private function set _paletteActiveRow(param1:int) : void
      {
         var _loc2_:Object = this._419683560_paletteActiveRow;
         if(_loc2_ !== param1)
         {
            this._419683560_paletteActiveRow = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_paletteActiveRow",_loc2_,param1));
         }
      }
      
      private function set _paletteTile(param1:MgbTile) : void
      {
         var _loc2_:Object = this._612366838_paletteTile;
         if(_loc2_ !== param1)
         {
            this._612366838_paletteTile = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_paletteTile",_loc2_,param1));
         }
      }
      
      private function set colorList(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1980689057colorList;
         if(_loc2_ !== param1)
         {
            this._1980689057colorList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorList",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get colorList() : ArrayCollection
      {
         return this._1980689057colorList;
      }
      
      [Bindable(event="propertyChange")]
      private function get _paletteImageFileName() : String
      {
         return this._283745478_paletteImageFileName;
      }
      
      public function ___TileMakerPalette_Canvas2_click(param1:MouseEvent) : void
      {
         raiseEventForColorSelected(uint(param1.currentTarget.getRepeaterItem()));
      }
      
      private function get paletteTile() : MgbTile
      {
         return _paletteTile;
      }
      
      private function processPieceChange(param1:PieceChangedEvent) : void
      {
         if(param1.pieceType == paletteTile.piecetype && param1.pieceProject == this.paletteTile.projectName && param1.pieceName == this.paletteTile.name && param1.piece.userName == this.paletteTile.userName)
         {
            switch(param1.operation)
            {
               case Piece.MGB_OP_DELETE:
                  break;
               case Piece.MGB_OP_SAVE:
                  loadPalette();
                  break;
               case Piece.MGB_OP_LOAD:
            }
         }
      }
      
      public function set paletteImageFileName(param1:String) : void
      {
         _paletteImageFileName = param1;
         loadPalette();
      }
      
      public function ___TileMakerPalette_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         creationCompleteHandler();
      }
      
      private function set mgbSession(param1:MgbSession) : void
      {
         var _loc2_:Object = this._1217010542mgbSession;
         if(_loc2_ !== param1)
         {
            this._1217010542mgbSession = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mgbSession",_loc2_,param1));
         }
      }
      
      public function set r(param1:Repeater) : void
      {
         var _loc2_:Object = this._114r;
         if(_loc2_ !== param1)
         {
            this._114r = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"r",_loc2_,param1));
         }
      }
      
      public function get paletteImageFileName() : String
      {
         return _paletteImageFileName;
      }
      
      private function creationCompleteHandler() : void
      {
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_PROJECT_CHANGED,paletteReloader);
         MgbGlobalEventer.getInstance().addEventListener(MgbSession.EVENT_MGB_AUTHENTICATED_USER_SIGNED_IN,paletteReloader);
         MgbGlobalEventer.getInstance().addEventListener(PieceChangedEvent.CHANGE,processPieceChange);
      }
      
      private function _TileMakerPalette_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return _paletteTile.loadFailed == false && _paletteTile.loadPending == false;
         },function(param1:Boolean):void
         {
            _TileMakerPalette_HBox1.visible = param1;
         },"_TileMakerPalette_HBox1.visible");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Use keys 1-8 to quick-select colors, and up/down to activate different rows from the palette tile. Use the \'L\' key to force a reload of the palette tile \'" + defaultPaletteFileName + "\'.";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TileMakerPalette_HBox1.toolTip = param1;
         },"_TileMakerPalette_HBox1.toolTip");
         result[1] = binding;
         binding = new Binding(this,function():Object
         {
            return colorList;
         },function(param1:Object):void
         {
            r.dataProvider = param1;
         },"r.dataProvider");
         result[2] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):uint
         {
            return r.mx_internal::getItemAt(param2[0]);
         },function(param1:uint, param2:Array):void
         {
            _TileMakerPalette_Canvas2[param2[0]].setStyle("backgroundColor",param1);
         },"_TileMakerPalette_Canvas2.backgroundColor");
         result[3] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):Number
         {
            return alphafromColor(r.mx_internal::getItemAt(param2[0]));
         },function(param1:Number, param2:Array):void
         {
            _TileMakerPalette_Canvas2[param2[0]].setStyle("backgroundAlpha",param1);
         },"_TileMakerPalette_Canvas2.backgroundAlpha");
         result[4] = binding;
         binding = new RepeatableBinding(this,function(param1:Array, param2:Array):String
         {
            var _loc3_:* = param2[0] + 1;
            return _loc3_ == undefined ? null : String(_loc3_);
         },function(param1:String, param2:Array):void
         {
            _TileMakerPalette_Label1[param2[0]].text = param1;
         },"_TileMakerPalette_Label1.text");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "R" + paletteActiveRow;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TileMakerPalette_Label2.text = param1;
         },"_TileMakerPalette_Label2.text");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Use the up/down key to change active row within the color palette tile.  Use the \'L\' key to force a reload of the palette tile \'" + defaultPaletteFileName + "\'.";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TileMakerPalette_Label2.toolTip = param1;
         },"_TileMakerPalette_Label2.toolTip");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Create a palette by creating and saving a tile called \'" + defaultPaletteFileName + "\' in this project. Use the \'L\' key to force a reload of the palette tile.";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TileMakerPalette_Label3.toolTip = param1;
         },"_TileMakerPalette_Label3.toolTip");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _paletteTile.loadFailed == true;
         },function(param1:Boolean):void
         {
            _TileMakerPalette_Label3.visible = param1;
         },"_TileMakerPalette_Label3.visible");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Create a palette by creating and saving a tile called \'" + defaultPaletteFileName + "\' in this project. Use the \'L\' key to force a reload of the palette tile.";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TileMakerPalette_Label4.toolTip = param1;
         },"_TileMakerPalette_Label4.toolTip");
         result[10] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _paletteTile.loadPending == true;
         },function(param1:Boolean):void
         {
            _TileMakerPalette_Label4.visible = param1;
         },"_TileMakerPalette_Label4.visible");
         result[11] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      public function get r() : Repeater
      {
         return this._114r;
      }
   }
}
