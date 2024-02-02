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
   import mx.containers.HBox;
   import mx.controls.Label;
   import mx.controls.Text;
   import mx.controls.VRule;
   import mx.core.*;
   import mx.effects.Move;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddChild;
   import mx.states.State;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class HeaderComponent extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _HeaderComponent_HBox1:HBox;
      
      public var _HeaderComponent_HBox2:HBox;
      
      private var _266803431userInfo:Text;
      
      private var _1243545957moveHdr:Move;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      public var _HeaderComponent_Text2:Text;
      
      private var _1217010542mgbSession:MgbSession;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function HeaderComponent()
      {
         _documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"height":50};
            }
         });
         _1217010542mgbSession = MgbSession.getInstance();
         mx_internal::_bindings = [];
         mx_internal::_watchers = [];
         mx_internal::_bindingsByDestination = {};
         mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 50;
         this.clipContent = false;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.currentState = "normalHeader";
         this.states = [_HeaderComponent_State1_c(),_HeaderComponent_State2_c()];
         _HeaderComponent_Move1_i();
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         HeaderComponent._watcherSetupUtil = param1;
      }
      
      private function _HeaderComponent_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = !!mgbSession.userLoggedIn ? 10 : 28;
         _loc1_ = moveHdr;
         _loc1_ = !!mgbSession.authenticatedName ? "Welcome " + mgbSession.authenticatedName : "Not Signed In";
         _loc1_ = mgbSession.userName != null;
         _loc1_ = "Viewing " + mgbSession.userName;
         _loc1_ = !!mgbSession.userLoggedIn ? 10 : 28;
         _loc1_ = moveHdr;
      }
      
      private function _HeaderComponent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         userInfo = _loc1_;
         _loc1_.width = 180;
         _loc1_.styleName = "smallFont";
         _loc1_.setStyle("textAlign","right");
         _loc1_.setStyle("right","12");
         _loc1_.setStyle("top","2");
         _loc1_.setStyle("fontSize",12);
         _loc1_.addEventListener("click",__userInfo_click);
         _loc1_.id = "userInfo";
         BindingManager.executeBindings(this,"userInfo",userInfo);
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
         var target:HeaderComponent = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(_documentDescriptor_);
         bindings = _HeaderComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_HeaderComponentWatcherSetupUtil");
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
      
      private function _HeaderComponent_VRule1_c() : VRule
      {
         var _loc1_:VRule = new VRule();
         _loc1_.height = 22;
         _loc1_.width = 3;
         _loc1_.setStyle("strokeColor",16711680);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _HeaderComponent_VRule2_c() : VRule
      {
         var _loc1_:VRule = new VRule();
         _loc1_.height = 24;
         _loc1_.width = 3;
         _loc1_.setStyle("strokeColor",16711680);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _HeaderComponent_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _HeaderComponent_Text2 = _loc1_;
         _loc1_.width = 180;
         _loc1_.styleName = "smallFont";
         _loc1_.setStyle("textAlign","right");
         _loc1_.setStyle("right","12");
         _loc1_.setStyle("top","21");
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "_HeaderComponent_Text2";
         BindingManager.executeBindings(this,"_HeaderComponent_Text2",_HeaderComponent_Text2);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function __userInfo_click(param1:MouseEvent) : void
      {
         Application.application.accountManagement.goToTop(true);
      }
      
      private function _HeaderComponent_Move1_i() : Move
      {
         var _loc1_:Move = new Move();
         moveHdr = _loc1_;
         _loc1_.duration = 600;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get userInfo() : Text
      {
         return this._266803431userInfo;
      }
      
      private function _HeaderComponent_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return !!mgbSession.userLoggedIn ? 10 : 28;
         },function(param1:Number):void
         {
            _HeaderComponent_HBox1.y = param1;
         },"_HeaderComponent_HBox1.y");
         result[0] = binding;
         binding = new Binding(this,function():*
         {
            return moveHdr;
         },function(param1:*):void
         {
            _HeaderComponent_HBox1.setStyle("moveEffect",param1);
         },"_HeaderComponent_HBox1.moveEffect");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = !!mgbSession.authenticatedName ? "Welcome " + mgbSession.authenticatedName : "Not Signed In";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            userInfo.text = param1;
         },"userInfo.text");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return mgbSession.userName != null;
         },function(param1:Boolean):void
         {
            _HeaderComponent_Text2.visible = param1;
         },"_HeaderComponent_Text2.visible");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = "Viewing " + mgbSession.userName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _HeaderComponent_Text2.text = param1;
         },"_HeaderComponent_Text2.text");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return !!mgbSession.userLoggedIn ? 10 : 28;
         },function(param1:Number):void
         {
            _HeaderComponent_HBox2.y = param1;
         },"_HeaderComponent_HBox2.y");
         result[5] = binding;
         binding = new Binding(this,function():*
         {
            return moveHdr;
         },function(param1:*):void
         {
            _HeaderComponent_HBox2.setStyle("moveEffect",param1);
         },"_HeaderComponent_HBox2.moveEffect");
         result[6] = binding;
         return result;
      }
      
      public function set moveHdr(param1:Move) : void
      {
         var _loc2_:Object = this._1243545957moveHdr;
         if(_loc2_ !== param1)
         {
            this._1243545957moveHdr = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moveHdr",_loc2_,param1));
         }
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
      public function get moveHdr() : Move
      {
         return this._1243545957moveHdr;
      }
      
      private function _HeaderComponent_HBox1_i() : HBox
      {
         var _loc1_:HBox = new HBox();
         _HeaderComponent_HBox1 = _loc1_;
         _loc1_.x = 4;
         _loc1_.percentWidth = 90;
         _loc1_.id = "_HeaderComponent_HBox1";
         BindingManager.executeBindings(this,"_HeaderComponent_HBox1",_HeaderComponent_HBox1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_HeaderComponent_Label1_c());
         _loc1_.addChild(_HeaderComponent_VRule1_c());
         _loc1_.addChild(_HeaderComponent_Label2_c());
         return _loc1_;
      }
      
      private function _HeaderComponent_HBox2_i() : HBox
      {
         var _loc1_:HBox = new HBox();
         _HeaderComponent_HBox2 = _loc1_;
         _loc1_.x = 5;
         _loc1_.percentWidth = 90;
         _loc1_.id = "_HeaderComponent_HBox2";
         BindingManager.executeBindings(this,"_HeaderComponent_HBox2",_HeaderComponent_HBox2);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         _loc1_.addChild(_HeaderComponent_Label3_c());
         _loc1_.addChild(_HeaderComponent_VRule2_c());
         return _loc1_;
      }
      
      private function _HeaderComponent_AddChild2_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_HeaderComponent_Text1_i);
         return _loc1_;
      }
      
      private function _HeaderComponent_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "MyGameBuilder.com";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _HeaderComponent_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "MGB";
         _loc1_.toolTip = "Visit MyGameBuilder.com";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _HeaderComponent_State1_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "normalHeader";
         _loc1_.overrides = [_HeaderComponent_AddChild1_c(),_HeaderComponent_AddChild2_c(),_HeaderComponent_AddChild3_c()];
         return _loc1_;
      }
      
      private function _HeaderComponent_AddChild3_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_HeaderComponent_Text2_i);
         return _loc1_;
      }
      
      private function _HeaderComponent_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Make Games, Make Friends, Have Fun";
         _loc1_.styleName = "denseTable";
         _loc1_.setStyle("paddingTop",4);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function set userInfo(param1:Text) : void
      {
         var _loc2_:Object = this._266803431userInfo;
         if(_loc2_ !== param1)
         {
            this._266803431userInfo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userInfo",_loc2_,param1));
         }
      }
      
      private function _HeaderComponent_State2_c() : State
      {
         var _loc1_:State = new State();
         _loc1_.name = "miniEmbeddedModeHeader";
         _loc1_.overrides = [_HeaderComponent_AddChild4_c()];
         return _loc1_;
      }
      
      private function _HeaderComponent_AddChild1_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_HeaderComponent_HBox1_i);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      private function get mgbSession() : MgbSession
      {
         return this._1217010542mgbSession;
      }
      
      private function _HeaderComponent_AddChild4_c() : AddChild
      {
         var _loc1_:AddChild = new AddChild();
         _loc1_.position = "lastChild";
         _loc1_.targetFactory = new DeferredInstanceFromFunction(_HeaderComponent_HBox2_i);
         return _loc1_;
      }
   }
}
