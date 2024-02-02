package
{
   import com.mgb.controls.BitmapDuper;
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
   import mx.containers.TitleWindow;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Label;
   import mx.controls.Text;
   import mx.controls.TextInput;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.styles.*;
   
   public class ImportTileForm extends TitleWindow
   {
       
      
      private var _97572849fname:TextInput;
      
      private var _1990131276cancelButton:Button;
      
      private var _211259928gridButton:Button;
      
      private var _1217010542mgbSession:MgbSession;
      
      private var _318184504preview:BitmapDuper;
      
      private var _1947139639viewButton:Button;
      
      private var _177701314infoLine:Text;
      
      private var lastPreviewedBD:BitmapData = null;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml_Resources_GridIcon_png_922864290:Class;
      
      public function ImportTileForm()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":TitleWindow,
            "propertiesFactory":function():Object
            {
               return {
                  "height":500,
                  "width":600,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Canvas,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "autoLayout":true,
                           "verticalScrollPolicy":"off",
                           "horizontalScrollPolicy":"off",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":VBox,
                              "stylesFactory":function():void
                              {
                                 this.top = "8";
                                 this.left = "8";
                                 this.right = "8";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {"childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"Image URL:"};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":TextInput,
                                             "id":"fname",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "text":"",
                                                   "toolTip":"This is usually http://someplace.com/someimage.png. You can use png, gif, jpg files",
                                                   "maxChars":256
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":Button,
                                          "id":"viewButton",
                                          "events":{"click":"__viewButton_click"},
                                          "propertiesFactory":function():Object
                                          {
                                             return {"label":"Fetch"};
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Button,
                                          "id":"cancelButton",
                                          "events":{"click":"__cancelButton_click"},
                                          "propertiesFactory":function():Object
                                          {
                                             return {"label":"Done"};
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Button,
                                          "id":"gridButton",
                                          "events":{"click":"__gridButton_click"},
                                          "stylesFactory":function():void
                                          {
                                             this.overIcon = _embed_mxml_Resources_GridIcon_png_922864290;
                                             this.upIcon = _embed_mxml_Resources_GridIcon_png_922864290;
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "visible":false,
                                                "label":"Grid",
                                                "labelPlacement":"right"
                                             };
                                          }
                                       })]};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"infoLine",
                                    "propertiesFactory":function():Object
                                    {
                                       return {"percentWidth":100};
                                    }
                                 })]};
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "stylesFactory":function():void
                              {
                                 this.top = "96";
                                 this.bottom = "8";
                                 this.left = "8";
                                 this.right = "8";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "clipContent":true,
                                    "verticalScrollPolicy":"auto",
                                    "horizontalScrollPolicy":"auto",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":BitmapDuper,
                                       "id":"preview"
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         _embed_mxml_Resources_GridIcon_png_922864290 = ImportTileForm__embed_mxml_Resources_GridIcon_png_922864290;
         super();
         mx_internal::_document = this;
         this.title = "Import tiles into MyGameBuilder.com";
         this.showCloseButton = true;
         this.height = 500;
         this.width = 600;
         this.addEventListener("creationComplete",___ImportTileForm_TitleWindow1_creationComplete);
         this.addEventListener("close",___ImportTileForm_TitleWindow1_close);
      }
      
      public function __gridButton_click(param1:MouseEvent) : void
      {
         preview.toggleGrid();
      }
      
      public function set infoLine(param1:Text) : void
      {
         var _loc2_:Object = this._177701314infoLine;
         if(_loc2_ !== param1)
         {
            this._177701314infoLine = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoLine",_loc2_,param1));
         }
      }
      
      public function ___ImportTileForm_TitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         doInit();
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      [Bindable(event="propertyChange")]
      public function get preview() : BitmapDuper
      {
         return this._318184504preview;
      }
      
      private function done() : void
      {
         mgbSession.recentTileImportUrl = fname.text;
         PopUpManager.removePopUp(this);
      }
      
      public function ___ImportTileForm_TitleWindow1_close(param1:CloseEvent) : void
      {
         done();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         super.initialize();
      }
      
      public function set cancelButton(param1:Button) : void
      {
         var _loc2_:Object = this._1990131276cancelButton;
         if(_loc2_ !== param1)
         {
            this._1990131276cancelButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoLine() : Text
      {
         return this._177701314infoLine;
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelButton() : Button
      {
         return this._1990131276cancelButton;
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
      
      [Bindable(event="propertyChange")]
      public function get gridButton() : Button
      {
         return this._211259928gridButton;
      }
      
      public function __viewButton_click(param1:MouseEvent) : void
      {
         processImportTileClick();
      }
      
      public function set fname(param1:TextInput) : void
      {
         var _loc2_:Object = this._97572849fname;
         if(_loc2_ !== param1)
         {
            this._97572849fname = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fname",_loc2_,param1));
         }
      }
      
      private function processImportTileLoaded(param1:Event) : void
      {
         var event:Event = param1;
         var newBD:BitmapData = null;
         var errMsg:String = null;
         try
         {
            newBD = Bitmap(event.target.content).bitmapData;
         }
         catch(err:Error)
         {
            if(err.name == "SecurityError")
            {
               errMsg = err.name + ": Site has not yet allowed their images to be imported to MyGameBuilder. If they add a \'crossdomain.xml\' entry, you can import their graphics";
            }
            else
            {
               errMsg = err.name + ": Unable to access that file. It may not exist";
            }
         }
         if(newBD)
         {
            preview.drawDupe(newBD);
            preview.chooseTileFromImage(Application.application.tileMaker.dpad.tilewidth,Application.application.tileMaker.dpad.tileheight);
            gridButton.visible = true;
            if(lastPreviewedBD)
            {
               lastPreviewedBD.dispose();
               lastPreviewedBD = null;
            }
            lastPreviewedBD = newBD;
            infoLine.text = "Use mouse to choose area. Left-click to paste selected area";
         }
         if(errMsg)
         {
            MgbLogger.getInstance().logError(errMsg,false);
            infoLine.text = errMsg;
         }
      }
      
      public function set viewButton(param1:Button) : void
      {
         var _loc2_:Object = this._1947139639viewButton;
         if(_loc2_ !== param1)
         {
            this._1947139639viewButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"viewButton",_loc2_,param1));
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         infoLine.text = "Unable to access that file. It may not exist";
         MgbLogger.getInstance().logError(infoLine.text,false);
      }
      
      [Bindable(event="propertyChange")]
      public function get fname() : TextInput
      {
         return this._97572849fname;
      }
      
      private function processImportTileClick() : void
      {
         var _loc1_:Loader = new Loader();
         var _loc2_:URLRequest = new URLRequest(fname.text);
         _loc1_.load(_loc2_);
         _loc1_.contentLoaderInfo.addEventListener(Event.COMPLETE,processImportTileLoaded);
         _loc1_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
         viewButton.enabled = false;
         infoLine.text = "Trying to get image";
      }
      
      public function set gridButton(param1:Button) : void
      {
         var _loc2_:Object = this._211259928gridButton;
         if(_loc2_ !== param1)
         {
            this._211259928gridButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gridButton",_loc2_,param1));
         }
      }
      
      private function doInit() : void
      {
         PopUpManager.centerPopUp(this);
         setStyle("borderAlpha",0.8);
         preview.shrinkToFitEnabled = false;
         fname.text = mgbSession.recentTileImportUrl;
      }
      
      public function __cancelButton_click(param1:MouseEvent) : void
      {
         done();
      }
      
      public function set preview(param1:BitmapDuper) : void
      {
         var _loc2_:Object = this._318184504preview;
         if(_loc2_ !== param1)
         {
            this._318184504preview = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preview",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get viewButton() : Button
      {
         return this._1947139639viewButton;
      }
   }
}
