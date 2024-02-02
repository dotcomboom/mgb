package mx.containers
{
   import flash.events.Event;
   import mx.core.Application;
   import mx.core.mx_internal;
   import mx.styles.IStyleClient;
   
   use namespace mx_internal;
   
   public class ApplicationControlBar extends ControlBar
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var dockChanged:Boolean = false;
      
      private var _dock:Boolean = false;
      
      public function ApplicationControlBar()
      {
         super();
      }
      
      public function set dock(param1:Boolean) : void
      {
         if(_dock != param1)
         {
            _dock = param1;
            dockChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("dockChanged"));
         }
      }
      
      public function resetDock(param1:Boolean) : void
      {
         _dock = !param1;
         dock = param1;
      }
      
      [Bindable("dockChanged")]
      public function get dock() : Boolean
      {
         return _dock;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(dockChanged)
         {
            dockChanged = false;
            if(parent is Application)
            {
               Application(parent).mx_internal::dockControlBar(this,_dock);
            }
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         var _loc2_:Object = mx_internal::blocker;
         super.enabled = param1;
         if(Boolean(mx_internal::blocker) && mx_internal::blocker != _loc2_)
         {
            if(mx_internal::blocker is IStyleClient)
            {
               IStyleClient(mx_internal::blocker).setStyle("borderStyle","applicationControlBar");
            }
         }
      }
   }
}
