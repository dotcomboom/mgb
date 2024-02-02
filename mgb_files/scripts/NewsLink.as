package
{
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
   import mx.containers.TitleWindow;
   import mx.controls.LinkButton;
   import mx.controls.TextArea;
   import mx.core.*;
   import mx.events.CloseEvent;
   import mx.states.AddChild;
   import mx.states.State;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class NewsLink extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _NewsLink_TextArea1:TextArea;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _NewsLink_LinkButton1:LinkButton;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      mx_internal var _watchers:Array;
      
      public function NewsLink()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":LinkButton,
                  "id":"_NewsLink_LinkButton1",
                  "events":{"click":"___NewsLink_LinkButton1_click"},
                  "stylesFactory":function():void
                  {
                     this.textDecoration = "underline";
                     this.top = "2";
                     this.right = "4";
                     this.color = 128;
                  }
               })]};
            }
         });
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.states = [_NewsLink_State1_c()];
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         NewsLink._watcherSetupUtil = param1;
      }
      
      private function _NewsLink_TitleWindow1_c() : TitleWindow
      {
         var _loc1_:TitleWindow = null;
         _loc1_ = new TitleWindow();
         _loc1_.label = "MGB News";
         _loc1_.title = "The latest MyGameBuilder news...";
         _loc1_.width = 560;
         _loc1_.height = 500;
         _loc1_.showCloseButton = true;
         _loc1_.setStyle("roundedBottomCorners",false);
         _loc1_.setStyle("right","40");
         _loc1_.setStyle("top","48");
         _loc1_.addEventListener("close",___NewsLink_TitleWindow1_close);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_NewsLink_TextArea1_i());
         return _loc1_;
      }
      
      private function _NewsLink_AddChild1_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_NewsLink_TitleWindow1_c);
         return _loc1_;
      }
      
      private function _NewsLink_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _NewsLink_TextArea1 = _loc1_;
         _loc1_.editable = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("borderStyle","none");
         _loc1_.id = "_NewsLink_TextArea1";
         BindingManager.executeBindings(this,"_NewsLink_TextArea1",_NewsLink_TextArea1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:NewsLink = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _NewsLink_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_NewsLinkWatcherSetupUtil");
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
      
      public function ___NewsLink_TitleWindow1_close(param1:CloseEvent) : void
      {
         this.currentState = "";
      }
      
      private function _NewsLink_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = "Build " + MgbSystem.version + ": " + MgbSystem.versionChangeSummary;
         _loc1_ = "Build " + MgbSystem.version + ": Added " + MgbSystem.versionChangeSummary + ". Click for more details";
         _loc1_ = MgbSystem.newsPageText;
      }
      
      public function ___NewsLink_LinkButton1_click(param1:MouseEvent) : void
      {
         this.currentState = "ShowNews";
      }
      
      private function _NewsLink_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Build " + MgbSystem.version + ": " + MgbSystem.versionChangeSummary;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _NewsLink_LinkButton1.label = param1;
         },"_NewsLink_LinkButton1.label");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Build " + MgbSystem.version + ": Added " + MgbSystem.versionChangeSummary + ". Click for more details";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _NewsLink_LinkButton1.toolTip = param1;
         },"_NewsLink_LinkButton1.toolTip");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = MgbSystem.newsPageText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _NewsLink_TextArea1.htmlText = param1;
         },"_NewsLink_TextArea1.htmlText");
         result[2] = binding;
         return result;
      }
      
      private function _NewsLink_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "ShowNews";
         _loc1_.overrides = [_NewsLink_AddChild1_c()];
         return _loc1_;
      }
   }
}
