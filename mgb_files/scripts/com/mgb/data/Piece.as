package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.modals.*;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   import mx.managers.*;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.*;
   
   public class Piece implements IEventDispatcher
   {
      
      public static const maxCharsInComment:int = 60;
      
      public static const MGB_TILE:String = "tile";
      
      public static const MGB_OP_SAVE:String = "save";
      
      public static const MGB_MAP:String = "map";
      
      public static const MGB_OP_LOAD:String = "load";
      
      public static const maxCharsInName:int = 32;
      
      public static const MGB_PROFILE:String = "profile";
      
      public static const MGB_TUTORIAL:String = "tutorial";
      
      public static const MGB_SCREENSHOT:String = "screenshot";
      
      public static const MGB_ACTOR:String = "actor";
      
      public static const MGB_OP_DELETE:String = "delete";
       
      
      private var _950398559comment:String;
      
      protected var blobencoding:int;
      
      private var _605781821loadFailed:Boolean;
      
      private var _3373707name:String;
      
      public var lastSaved:String = "TODO";
      
      private var loadConfirmHandler:Function = null;
      
      protected var blob:String;
      
      private var _2105227719tilename:String;
      
      private var loadretry__overrideUsername:String;
      
      private var _113126854width:int;
      
      private var baseCallback:Function = null;
      
      private var mgbLogger:MgbLogger;
      
      private var suppressNotFoundMessagesForCurrentLoadOperation:Boolean = false;
      
      private var saveConfirmHandler:Function = null;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _940047036projectName:String;
      
      private var _114750248piecetype:String;
      
      public var onErrorIssueAlert:Boolean = true;
      
      private var _1195364911loadPending:Boolean;
      
      private var loadRetriesRemaining:int;
      
      private var _1221029593height:int;
      
      private var destroyCallback:Function = null;
      
      private var saveCallback:Function = null;
      
      private var _266666762userName:String;
      
      private var currentOperation:String = null;
      
      private var _96394acl:String;
      
      public function Piece(param1:String)
      {
         mgbLogger = MgbLogger.getInstance();
         _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         if(param1 != MGB_TILE && param1 != MGB_ACTOR && param1 != MGB_MAP && param1 != MGB_TUTORIAL && param1 != MGB_PROFILE && param1 != MGB_SCREENSHOT)
         {
            mgbLogger.logError("Unknown MGB Piece type: " + param1,onErrorIssueAlert);
         }
         else
         {
            this.piecetype = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get comment() : String
      {
         return this._950398559comment;
      }
      
      [Bindable(event="propertyChange")]
      public function get userName() : String
      {
         return this._266666762userName;
      }
      
      [Bindable(event="propertyChange")]
      public function get acl() : String
      {
         return this._96394acl;
      }
      
      [Bindable(event="propertyChange")]
      public function get name() : String
      {
         return this._3373707name;
      }
      
      public function loadByName(param1:String, param2:String, param3:String, param4:Function = null, param5:Boolean = false, param6:int = 3) : void
      {
         this.currentOperation = MGB_OP_LOAD;
         this.name = param3;
         this.userName = param1;
         this.projectName = param2;
         this.loadRetriesRemaining = param6;
         if(param1 == null || param2 == null)
         {
            MgbLogger.getInstance().logBug("REFACTORING...loadByName() called with null username or project");
         }
         baseCallback = param4;
         var _loc7_:Object;
         (_loc7_ = new Object()).overrideUsername = param1;
         _loc7_.overrideProject = param2;
         _loc7_.name = param3;
         _loc7_.piecetype = piecetype;
         this.loadFailed = false;
         this.loadPending = true;
         this.suppressNotFoundMessagesForCurrentLoadOperation = param5;
         var _loc8_:S3Service;
         (_loc8_ = new S3Service()).request(this.currentOperation,s3LoadMgbObjectResult,_loc7_);
      }
      
      public function set width(param1:int) : void
      {
         var _loc2_:Object = this._113126854width;
         if(_loc2_ !== param1)
         {
            this._113126854width = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"width",_loc2_,param1));
         }
      }
      
      public function destroyPiece(param1:String = null, param2:Function = null) : void
      {
         saveCallback = param2;
         this.currentOperation = MGB_OP_DELETE;
         addNameContextIfRequired();
         if(param1)
         {
            name = param1;
         }
         if(MgbSession.getInstance().userLoggedInIsGuest == true)
         {
            mgbLogger.logError("Could not delete " + this.piecetype + " \'" + name + "\': Guest cannot delete game pieces",true);
            return;
         }
         var _loc3_:Object = new Object();
         _loc3_.name = name;
         _loc3_.piecetype = piecetype;
         _loc3_.overrideUsername = this.userName;
         _loc3_.overrideProject = this.projectName;
         var _loc4_:S3Service;
         (_loc4_ = new S3Service()).request(this.currentOperation,s3SaveResult,_loc3_);
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:Object = this._3373707name;
         if(_loc2_ !== param1)
         {
            this._3373707name = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
         }
      }
      
      public function set projectName(param1:String) : void
      {
         var _loc2_:Object = this._940047036projectName;
         if(_loc2_ !== param1)
         {
            this._940047036projectName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectName",_loc2_,param1));
         }
      }
      
      public function set acl(param1:String) : void
      {
         var _loc2_:Object = this._96394acl;
         if(_loc2_ !== param1)
         {
            this._96394acl = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"acl",_loc2_,param1));
         }
      }
      
      public function loadPieceFromPiece(param1:Piece) : void
      {
         if(this.piecetype != param1.piecetype)
         {
            throw new Error("mismatched piecetypes in Piece.loadPieceFromPiece()");
         }
         this.userName = !!param1.userName ? new String(param1.userName) : null;
         this.projectName = new String(!!param1.projectName ? param1.projectName : "");
         this.blob = new String(!!param1.blob ? param1.blob : "");
         this.name = new String(!!param1.name ? param1.name : "");
         this.width = param1.width;
         this.height = param1.height;
         this.acl = param1.acl;
         this.comment = new String(!!param1.comment ? param1.comment : "");
         this.tilename = new String(!!param1.tilename ? param1.tilename : "");
         this.blobencoding = param1.blobencoding;
      }
      
      public function loadUsingDialog(param1:String, param2:String, param3:DisplayObject, param4:Function = null) : void
      {
         var _loc5_:ChoosePieceForm;
         (_loc5_ = ChoosePieceForm(PopUpManager.createPopUp(param3,ChoosePieceForm,true))).configure(param1,param2,piecetype,null,ChoosePieceForm.LABEL_LOAD);
         loadConfirmHandler = param4;
         _loc5_.addEventListener("change",processPieceLoadConfirm);
         _loc5_.pieceComment.text = comment;
      }
      
      [Bindable(event="propertyChange")]
      public function get height() : int
      {
         return this._1221029593height;
      }
      
      [Bindable(event="propertyChange")]
      public function get piecetype() : String
      {
         return this._114750248piecetype;
      }
      
      public function set loadPending(param1:Boolean) : void
      {
         var _loc2_:Object = this._1195364911loadPending;
         if(_loc2_ !== param1)
         {
            this._1195364911loadPending = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadPending",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tilename() : String
      {
         return this._2105227719tilename;
      }
      
      private function s3SaveResult(param1:ResultEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:MgbSession = MgbSession.getInstance();
         if(param1.result.hasOwnProperty("mgb_error") && 0 != param1.result.mgb_error)
         {
            mgbLogger.logError("Could not " + currentOperation + " \'" + name + "\'",onErrorIssueAlert);
         }
         else
         {
            _loc2_ = true;
         }
         this.blob = null;
         if(saveCallback != null)
         {
            saveCallback(this,param1.result.mgb_error,param1.result.mgb_error_msg);
            saveCallback = null;
         }
         if(_loc2_)
         {
            issuePieceChangedEventOpSuccessful();
         }
      }
      
      private function processPieceLoadConfirm(param1:ChoosePieceEvent) : void
      {
         if(param1.activating)
         {
            loadConfirmHandler(param1.username,param1.project,param1.pieceName);
            loadConfirmHandler = null;
         }
      }
      
      public function set loadFailed(param1:Boolean) : void
      {
         var _loc2_:Object = this._605781821loadFailed;
         if(_loc2_ !== param1)
         {
            this._605781821loadFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadFailed",_loc2_,param1));
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function savePieceUsingDialog(param1:String, param2:String, param3:DisplayObject, param4:Function) : void
      {
         var _loc5_:ChoosePieceForm;
         (_loc5_ = ChoosePieceForm(PopUpManager.createPopUp(param3,ChoosePieceForm,true))).configure(param1,param2,piecetype,name,ChoosePieceForm.LABEL_SAVE);
         _loc5_.addEventListener("change",processPieceSaveConfirm);
         saveConfirmHandler = param4;
         _loc5_.pieceComment.text = comment;
      }
      
      [Bindable(event="propertyChange")]
      public function get loadFailed() : Boolean
      {
         return this._605781821loadFailed;
      }
      
      public function set comment(param1:String) : void
      {
         var _loc2_:Object = this._950398559comment;
         if(_loc2_ !== param1)
         {
            this._950398559comment = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"comment",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get width() : int
      {
         return this._113126854width;
      }
      
      private function processPieceSaveConfirm(param1:ChoosePieceEvent) : void
      {
         if(param1.activating)
         {
            this.name = param1.pieceName;
            this.comment = param1.pieceComment;
            this.projectName = param1.project;
            this.userName = param1.username;
            this.saveConfirmHandler();
            saveConfirmHandler = null;
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         _bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function set piecetype(param1:String) : void
      {
         var _loc2_:Object = this._114750248piecetype;
         if(_loc2_ !== param1)
         {
            this._114750248piecetype = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"piecetype",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loadPending() : Boolean
      {
         return this._1195364911loadPending;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         _bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _bindingEventDispatcher.willTrigger(param1);
      }
      
      public function set height(param1:int) : void
      {
         var _loc2_:Object = this._1221029593height;
         if(_loc2_ !== param1)
         {
            this._1221029593height = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"height",_loc2_,param1));
         }
      }
      
      public function s3LoadMgbObjectResult(param1:ResultEvent) : void
      {
         var _loc3_:Object = null;
         var _loc4_:S3Service = null;
         var _loc2_:Boolean = false;
         if(param1.result.hasOwnProperty("mgb_error") && 0 != param1.result.mgb_error)
         {
            if(this.loadRetriesRemaining > 0)
            {
               --this.loadRetriesRemaining;
               if(this.suppressNotFoundMessagesForCurrentLoadOperation == false)
               {
                  mgbLogger.logInfo("Retrying load (" + this.loadRetriesRemaining + " retries remaining) for " + piecetype + " \'" + this.name + "\'");
               }
               _loc3_ = new Object();
               _loc3_.name = this.name;
               _loc3_.piecetype = piecetype;
               _loc3_.overrideUsername = this.userName;
               _loc3_.overrideProject = this.projectName;
               (_loc4_ = new S3Service()).request(this.currentOperation,s3LoadMgbObjectResult,_loc3_);
               return;
            }
            if(onErrorIssueAlert && this.suppressNotFoundMessagesForCurrentLoadOperation == false)
            {
               mgbLogger.logError("Could not load " + piecetype + " \'" + name + "\'  (error #" + param1.result.mgb_error + ")",false);
            }
            loadPending = false;
            loadFailed = true;
         }
         else
         {
            loadPending = false;
            loadFailed = false;
            if(this.name != param1.result.piece.name)
            {
               trace(" aha =- race condition in load?");
            }
            this.blob = param1.result.piece.blob;
            this.name = param1.result.piece.name;
            this.width = param1.result.piece.width;
            this.height = param1.result.piece.height;
            this.comment = param1.result.piece.comment;
            this.tilename = param1.result.piece.tilename;
            this.blobencoding = param1.result.piece.blobencoding;
            this.acl = !!param1.result.piece.acl ? String(param1.result.piece.acl) : "";
            _loc2_ = true;
         }
         if(null != baseCallback)
         {
            param1.result.piece = this;
            baseCallback(param1);
         }
         else if(_loc2_)
         {
            issuePieceChangedEventOpSuccessful();
         }
         this.suppressNotFoundMessagesForCurrentLoadOperation = false;
      }
      
      [Bindable(event="propertyChange")]
      public function get projectName() : String
      {
         return this._940047036projectName;
      }
      
      public function set tilename(param1:String) : void
      {
         var _loc2_:Object = this._2105227719tilename;
         if(_loc2_ !== param1)
         {
            this._2105227719tilename = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tilename",_loc2_,param1));
         }
      }
      
      public function set userName(param1:String) : void
      {
         var _loc2_:Object = this._266666762userName;
         if(_loc2_ !== param1)
         {
            this._266666762userName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userName",_loc2_,param1));
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _bindingEventDispatcher.hasEventListener(param1);
      }
      
      protected function issuePieceChangedEventOpSuccessful() : void
      {
         var _loc1_:PieceChangedEvent = new PieceChangedEvent(PieceChangedEvent.CHANGE,currentOperation,name,piecetype,projectName,currentOperation == MGB_OP_DELETE ? null : this);
         MgbGlobalEventer.getInstance().dispatchEvent(_loc1_);
         this.currentOperation = null;
      }
      
      public function save(param1:Function = null) : void
      {
         var _loc2_:MgbSession = MgbSession.getInstance();
         if("" == name || null == name)
         {
            mgbLogger.logError("Cannot save MGB Piece with no name",onErrorIssueAlert);
            return;
         }
         if(_loc2_.userLoggedInIsGuest == true)
         {
            mgbLogger.logError("Could not save " + this.piecetype + " \'" + name + "\': Guest cannot save game pieces",true);
            return;
         }
         if(_loc2_.overQuota == true)
         {
            mgbLogger.logError("Could not save " + this.piecetype + " \'" + name + "\': User is already over quota",true);
            return;
         }
         addNameContextIfRequired();
         saveCallback = param1;
         this.currentOperation = MGB_OP_SAVE;
         var _loc3_:Object = new Object();
         _loc3_.comment = comment;
         _loc3_.name = name;
         _loc3_.tilename = tilename;
         _loc3_.piecetype = piecetype;
         _loc3_.width = width;
         _loc3_.height = height;
         _loc3_.blobencoding = blobencoding;
         _loc3_.blob = blob;
         _loc3_.acl = acl;
         _loc3_.overrideUsername = this.userName;
         _loc3_.overrideProject = this.projectName;
         var _loc4_:S3Service;
         (_loc4_ = new S3Service()).request(this.currentOperation,s3SaveResult,_loc3_);
      }
      
      private function addNameContextIfRequired() : void
      {
         if(!this.projectName)
         {
            this.projectName = MgbSession.getInstance().activeProject;
         }
         if(!this.userName)
         {
            this.userName = MgbSession.getInstance().userName;
         }
      }
   }
}
