package mx.binding
{
   import mx.collections.CursorBookmark;
   import mx.collections.ICollectionView;
   import mx.collections.IViewCursor;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   
   use namespace mx_internal;
   
   public class RepeaterItemWatcher extends Watcher
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var original:Boolean = true;
      
      private var clones:Array;
      
      private var dataProviderWatcher:PropertyWatcher;
      
      public function RepeaterItemWatcher(param1:PropertyWatcher)
      {
         super();
         this.dataProviderWatcher = param1;
      }
      
      override protected function shallowClone() : Watcher
      {
         return new RepeaterItemWatcher(dataProviderWatcher);
      }
      
      override public function updateParent(param1:Object) : void
      {
         var dataProvider:ICollectionView = null;
         var parent:Object = param1;
         if(dataProviderWatcher)
         {
            dataProvider = ICollectionView(dataProviderWatcher.value);
            if(dataProvider != null)
            {
               dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE,changedHandler,false);
            }
         }
         dataProviderWatcher = PropertyWatcher(parent);
         dataProvider = ICollectionView(dataProviderWatcher.value);
         if(dataProvider)
         {
            if(original)
            {
               dataProvider.addEventListener(CollectionEvent.COLLECTION_CHANGE,changedHandler,false,0,true);
               updateClones(dataProvider);
            }
            else
            {
               wrapUpdate(function():void
               {
                  var _loc1_:IViewCursor = dataProvider.createCursor();
                  _loc1_.seek(CursorBookmark.FIRST,cloneIndex);
                  value = _loc1_.current;
                  updateChildren();
               });
            }
         }
      }
      
      private function changedHandler(param1:CollectionEvent) : void
      {
         var _loc2_:ICollectionView = ICollectionView(dataProviderWatcher.value);
         if(_loc2_)
         {
            updateClones(_loc2_);
         }
      }
      
      private function updateClones(param1:ICollectionView) : void
      {
         var _loc3_:RepeaterItemWatcher = null;
         if(clones)
         {
            clones = clones.splice(0,param1.length);
         }
         else
         {
            clones = [];
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = RepeaterItemWatcher(clones[_loc2_]);
            if(!_loc3_)
            {
               _loc3_ = RepeaterItemWatcher(deepClone(_loc2_));
               _loc3_.original = false;
               clones[_loc2_] = _loc3_;
            }
            _loc3_.updateParent(dataProviderWatcher);
            _loc2_++;
         }
      }
   }
}
