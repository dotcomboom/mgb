package mx.states
{
   import flash.display.DisplayObject;
   import mx.containers.ApplicationControlBar;
   import mx.containers.ControlBar;
   import mx.containers.Panel;
   import mx.core.Application;
   import mx.core.ContainerCreationPolicy;
   import mx.core.IDeferredInstance;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   use namespace mx_internal;
   
   public class AddChild implements IOverride
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      mx_internal var added:Boolean = false;
      
      mx_internal var instanceCreated:Boolean = false;
      
      private var _creationPolicy:String = "auto";
      
      public var relativeTo:UIComponent;
      
      public var position:String;
      
      private var _target:DisplayObject;
      
      private var _targetFactory:IDeferredInstance;
      
      private var resourceManager:IResourceManager;
      
      public function AddChild(param1:UIComponent = null, param2:DisplayObject = null, param3:String = "lastChild")
      {
         resourceManager = ResourceManager.getInstance();
         super();
         this.relativeTo = param1;
         this.target = param2;
         this.position = param3;
      }
      
      public function remove(param1:UIComponent) : void
      {
         var _loc2_:UIComponent = !!relativeTo ? relativeTo : param1;
         if(!mx_internal::added)
         {
            return;
         }
         switch(position)
         {
            case "before":
            case "after":
               _loc2_.parent.removeChild(target);
               break;
            case "firstChild":
            case "lastChild":
            default:
               if(target is ControlBar && _loc2_ is Panel)
               {
                  Panel(_loc2_).rawChildren.removeChild(target);
                  Panel(_loc2_).createComponentsFromDescriptors();
               }
               else if(target is ApplicationControlBar && ApplicationControlBar(target).dock)
               {
                  Application(_loc2_).mx_internal::dockControlBar(ApplicationControlBar(target),false);
                  Application(_loc2_).removeChild(target);
               }
               else if(_loc2_ == target.parent)
               {
                  _loc2_.removeChild(target);
               }
         }
         mx_internal::added = false;
      }
      
      public function initialize() : void
      {
         if(creationPolicy == ContainerCreationPolicy.AUTO)
         {
            createInstance();
         }
      }
      
      public function get target() : DisplayObject
      {
         if(!_target && creationPolicy != ContainerCreationPolicy.NONE)
         {
            createInstance();
         }
         return _target;
      }
      
      public function set creationPolicy(param1:String) : void
      {
         _creationPolicy = param1;
         if(_creationPolicy == ContainerCreationPolicy.ALL)
         {
            createInstance();
         }
      }
      
      public function set target(param1:DisplayObject) : void
      {
         _target = param1;
      }
      
      public function apply(param1:UIComponent) : void
      {
         var _loc3_:String = null;
         var _loc2_:UIComponent = !!relativeTo ? relativeTo : param1;
         mx_internal::added = false;
         if(!target)
         {
            return;
         }
         if(target.parent)
         {
            _loc3_ = String(resourceManager.getString("states","alreadyParented"));
            throw new Error(_loc3_);
         }
         switch(position)
         {
            case "before":
               _loc2_.parent.addChildAt(target,_loc2_.parent.getChildIndex(_loc2_));
               break;
            case "after":
               _loc2_.parent.addChildAt(target,_loc2_.parent.getChildIndex(_loc2_) + 1);
               break;
            case "firstChild":
               _loc2_.addChildAt(target,0);
               break;
            case "lastChild":
            default:
               _loc2_.addChild(target);
               if(target is ControlBar && _loc2_ is Panel)
               {
                  Panel(_loc2_).createComponentsFromDescriptors();
               }
               else if(target is ApplicationControlBar && ApplicationControlBar(target).dock && _loc2_ is Application)
               {
                  ApplicationControlBar(target).resetDock(true);
               }
         }
         mx_internal::added = true;
      }
      
      public function createInstance() : void
      {
         var _loc1_:Object = null;
         if(!mx_internal::instanceCreated && !_target && Boolean(targetFactory))
         {
            mx_internal::instanceCreated = true;
            _loc1_ = targetFactory.getInstance();
            if(_loc1_ is DisplayObject)
            {
               _target = DisplayObject(_loc1_);
            }
         }
      }
      
      public function set targetFactory(param1:IDeferredInstance) : void
      {
         _targetFactory = param1;
         if(creationPolicy == ContainerCreationPolicy.ALL)
         {
            createInstance();
         }
      }
      
      public function get creationPolicy() : String
      {
         return _creationPolicy;
      }
      
      public function get targetFactory() : IDeferredInstance
      {
         return _targetFactory;
      }
   }
}
