package mx.core
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import mx.automation.IAutomationObject;
   import mx.collections.ArrayCollection;
   import mx.collections.CursorBookmark;
   import mx.collections.ICollectionView;
   import mx.collections.IList;
   import mx.collections.IViewCursor;
   import mx.collections.ItemResponder;
   import mx.collections.ListCollectionView;
   import mx.collections.XMLListCollection;
   import mx.collections.errors.ItemPendingError;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.FlexEvent;
   
   use namespace mx_internal;
   
   public class Repeater extends UIComponent implements IRepeater
   {
      
      mx_internal static const VERSION:String = "3.6.0.12937";
       
      
      private var _container:Container;
      
      private var _count:int = -1;
      
      private var descriptorIndex:int;
      
      public var childDescriptors:Array;
      
      mx_internal var createdComponents:Array;
      
      private var collection:ICollectionView;
      
      private var _currentIndex:int;
      
      private var created:Boolean = false;
      
      private var iterator:IViewCursor;
      
      private var _startingIndex:int = 0;
      
      private var _recycleChildren:Boolean = false;
      
      public function Repeater()
      {
         super();
      }
      
      public function get container() : IContainer
      {
         return _container as IContainer;
      }
      
      private function createComponentFromDescriptor(param1:int, param2:int, param3:Boolean) : IFlexDisplayObject
      {
         var _loc4_:UIComponentDescriptor;
         if(!(_loc4_ = childDescriptors[param2]).document)
         {
            _loc4_.document = document;
         }
         _loc4_.mx_internal::instanceIndices = !!instanceIndices ? instanceIndices : [];
         _loc4_.mx_internal::instanceIndices.push(param1);
         _loc4_.mx_internal::repeaters = repeaters;
         _loc4_.mx_internal::repeaters.push(this);
         _loc4_.mx_internal::repeaterIndices = repeaterIndices;
         _loc4_.mx_internal::repeaterIndices.push(startingIndex + param1);
         _loc4_.invalidateProperties();
         var _loc5_:IFlexDisplayObject = Container(container).createComponentFromDescriptor(_loc4_,param3);
         _loc4_.mx_internal::instanceIndices = null;
         _loc4_.mx_internal::repeaters = null;
         _loc4_.mx_internal::repeaterIndices = null;
         dispatchEvent(new Event("nextRepeaterItem"));
         return _loc5_;
      }
      
      private function responderResultHandler(param1:Object, param2:Object) : void
      {
         execute();
      }
      
      private function removeAllChildRepeaters(param1:Container) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Repeater = null;
         if(param1.mx_internal::childRepeaters)
         {
            _loc2_ = int(param1.mx_internal::childRepeaters.length);
            _loc3_ = _loc2_ - 1;
            while(_loc3_ >= 0)
            {
               _loc4_ = param1.mx_internal::childRepeaters[_loc3_];
               if(hasDescendant(_loc4_))
               {
                  removeRepeater(_loc4_);
               }
               _loc3_--;
            }
         }
      }
      
      private function recycle() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Repeater = null;
         var _loc8_:IRepeaterClient = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:IRepeaterClient = null;
         var _loc12_:IRepeaterClient = null;
         dispatchEvent(new FlexEvent(FlexEvent.REPEAT_START));
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         if(collection && collection.length > 0 && collection.length - startingIndex > 0)
         {
            _loc1_ = positiveMin(collection.length - startingIndex,count);
            _loc6_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _currentIndex = startingIndex + _loc2_;
               dispatchEvent(new FlexEvent(FlexEvent.REPEAT));
               if(childDescriptors)
               {
                  _loc3_ = int(childDescriptors.length);
                  if(mx_internal::createdComponents.length >= (_loc2_ + 1) * _loc3_)
                  {
                     _loc4_ = 0;
                     while(_loc4_ < _loc3_)
                     {
                        if((_loc8_ = mx_internal::createdComponents[_loc2_ * _loc3_ + _loc4_]) is Repeater)
                        {
                           _loc7_ = Repeater(_loc8_);
                           resetRepeaterIndices(_loc7_,_currentIndex);
                           _loc7_.owner = this;
                           _loc7_.execute();
                        }
                        else
                        {
                           resetRepeaterIndices(_loc8_,_currentIndex);
                           if(_loc8_ is IDeferredInstantiationUIComponent)
                           {
                              IDeferredInstantiationUIComponent(_loc8_).executeBindings(true);
                           }
                        }
                        _loc5_++;
                        _loc4_++;
                     }
                  }
                  else
                  {
                     _loc4_ = 0;
                     while(_loc4_ < _loc3_)
                     {
                        _loc9_ = container.numChildren;
                        _loc10_ = getIndexForFirstChild() + numCreatedChildren;
                        _loc11_ = IRepeaterClient(createComponentFromDescriptor(_loc2_,_loc4_,true));
                        mx_internal::createdComponents.push(_loc11_);
                        if(_loc11_ is IUIComponent)
                        {
                           IUIComponent(_loc11_).owner = this;
                        }
                        if(_loc11_ is IAutomationObject)
                        {
                           IAutomationObject(_loc11_).showInAutomationHierarchy = true;
                        }
                        if(_loc11_ is Repeater)
                        {
                           (_loc7_ = Repeater(_loc11_)).reindexDescendants(_loc9_,_loc10_);
                        }
                        else
                        {
                           container.setChildIndex(DisplayObject(_loc11_),_loc10_);
                        }
                        _loc5_++;
                        _loc4_++;
                     }
                  }
               }
               _loc2_++;
            }
         }
         _currentIndex = -1;
         _loc2_ = int(mx_internal::createdComponents.length - 1);
         while(_loc2_ >= _loc5_)
         {
            if((_loc12_ = mx_internal::createdComponents.pop()) is Repeater)
            {
               removeRepeater(Repeater(_loc12_));
            }
            else if(_loc12_)
            {
               if(_loc12_ is Container)
               {
                  removeAllChildren(Container(_loc12_));
                  removeAllChildRepeaters(Container(_loc12_));
               }
               if(container.contains(DisplayObject(_loc12_)))
               {
                  container.removeChild(DisplayObject(_loc12_));
               }
               if(_loc12_ is IDeferredInstantiationUIComponent)
               {
                  IDeferredInstantiationUIComponent(_loc12_).deleteReferenceOnParentDocument(IFlexDisplayObject(parentDocument));
               }
            }
            _loc2_--;
         }
         dispatchEvent(new FlexEvent(FlexEvent.REPEAT_END));
      }
      
      [Bindable("countChanged")]
      public function get count() : int
      {
         return _count;
      }
      
      private function reindexDescendants(param1:int, param2:int) : void
      {
         var _loc5_:IRepeaterClient = null;
         var _loc3_:int = container.numChildren - param1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = IRepeaterClient(container.getChildAt(param1 + _loc4_));
            container.setChildIndex(DisplayObject(_loc5_),param2 + _loc4_);
            _loc4_++;
         }
      }
      
      private function adjustIndices(param1:IRepeaterClient, param2:int) : void
      {
         var _loc3_:Array = param1.repeaters;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc3_[_loc5_] == this)
            {
               param1.repeaterIndices[_loc5_] += param2;
               param1.instanceIndices[_loc5_] += param2;
               break;
            }
            _loc5_++;
         }
      }
      
      private function positiveMin(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         if(param1 >= 0)
         {
            if(param2 >= 0)
            {
               if(param1 < param2)
               {
                  _loc3_ = param1;
               }
               else
               {
                  _loc3_ = param2;
               }
            }
            else
            {
               _loc3_ = param1;
            }
         }
         else
         {
            _loc3_ = param2;
         }
         return _loc3_;
      }
      
      mx_internal function getItemAt(param1:int) : Object
      {
         var result:Object = null;
         var index:int = param1;
         if(iterator)
         {
            try
            {
               iterator.seek(CursorBookmark.FIRST,index);
               result = iterator.current;
            }
            catch(itemPendingError:ItemPendingError)
            {
               itemPendingError.addResponder(new ItemResponder(responderResultHandler,responderFaultHandler));
            }
         }
         return result;
      }
      
      public function set count(param1:int) : void
      {
         _count = param1;
         execute();
         dispatchEvent(new Event("countChanged"));
      }
      
      private function addItems(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc6_:IRepeaterClient = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:IFlexDisplayObject = null;
         var _loc14_:Repeater = null;
         if(startingIndex > param2)
         {
            return;
         }
         var _loc4_:int = -1;
         var _loc5_:int = container.numChildren;
         if(param2 == collection.length - 1)
         {
            _loc3_ = _loc5_ - 1;
            while(_loc3_ >= 0)
            {
               _loc6_ = IRepeaterClient(container.getChildAt(_loc3_));
               if((_loc7_ = getRepeaterIndex(_loc6_)) != -1)
               {
                  _loc4_ = _loc3_ + 1;
                  break;
               }
               _loc3_--;
            }
         }
         else
         {
            _loc8_ = param2 - param1 + 1;
            _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               _loc6_ = IRepeaterClient(container.getChildAt(_loc3_));
               if((_loc7_ = getRepeaterIndex(_loc6_)) != -1)
               {
                  if(param1 <= _loc7_ && _loc7_ <= param2 && _loc4_ == -1)
                  {
                     _loc4_ = _loc3_;
                  }
                  if(_loc7_ >= param1)
                  {
                     adjustIndices(_loc6_,_loc8_);
                  }
               }
               _loc3_++;
            }
         }
         if(count == -1)
         {
            _loc5_ = param2;
         }
         else
         {
            _loc5_ = positiveMin(startingIndex + count - 1,param2);
         }
         _loc3_ = Math.max(startingIndex,param1);
         while(_loc3_ <= _loc5_)
         {
            _loc9_ = int(childDescriptors.length);
            _currentIndex = _loc3_;
            dispatchEvent(new FlexEvent(FlexEvent.REPEAT));
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc11_ = container.numChildren;
               _loc12_ = getIndexForFirstChild() + numCreatedChildren;
               _loc13_ = createComponentFromDescriptor(_loc3_ - startingIndex,_loc10_,true);
               mx_internal::createdComponents.push(_loc13_);
               if(_loc13_ is IUIComponent)
               {
                  IUIComponent(_loc13_).owner = this;
               }
               if(_loc13_ is IAutomationObject)
               {
                  IAutomationObject(_loc13_).showInAutomationHierarchy = true;
               }
               if(_loc13_ is Repeater)
               {
                  (_loc14_ = Repeater(_loc13_)).owner = this;
                  _loc14_.reindexDescendants(_loc11_,_loc12_);
               }
               else
               {
                  container.setChildIndex(DisplayObject(_loc13_),_loc12_);
               }
               _loc10_++;
            }
            _loc3_++;
         }
         _currentIndex = -1;
      }
      
      private function get numCreatedChildren() : int
      {
         var _loc3_:IFlexDisplayObject = null;
         var _loc4_:Repeater = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < mx_internal::createdComponents.length)
         {
            _loc3_ = mx_internal::createdComponents[_loc2_];
            if(_loc3_ is Repeater)
            {
               _loc4_ = Repeater(_loc3_);
               _loc1_ += _loc4_.numCreatedChildren;
            }
            else
            {
               _loc1_ += 1;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function removeChildRepeater(param1:Container, param2:Repeater) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.mx_internal::childRepeaters.length);
         while(_loc3_ < _loc4_)
         {
            if(param1.repeaters[_loc3_] == param2)
            {
               param1.repeaters.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
      }
      
      private function removeAllChildren(param1:IContainer) : void
      {
         var _loc4_:IRepeaterClient = null;
         var _loc2_:int = param1.numChildren;
         var _loc3_:int = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = IRepeaterClient(param1.getChildAt(_loc3_));
            if(hasDescendant(_loc4_))
            {
               if(_loc4_ is Container)
               {
                  removeAllChildren(Container(_loc4_));
                  removeAllChildRepeaters(Container(_loc4_));
               }
               param1.removeChildAt(_loc3_);
               if(_loc4_ is IDeferredInstantiationUIComponent)
               {
                  IDeferredInstantiationUIComponent(_loc4_).deleteReferenceOnParentDocument(IFlexDisplayObject(parentDocument));
               }
            }
            _loc3_--;
         }
      }
      
      [Bindable("nextRepeaterItem")]
      public function get currentItem() : Object
      {
         var result:Object = null;
         var message:String = null;
         if(_currentIndex == -1)
         {
            message = String(resourceManager.getString("core","notExecuting"));
            throw new Error(message);
         }
         if(iterator)
         {
            try
            {
               iterator.seek(CursorBookmark.FIRST,_currentIndex);
               result = iterator.current;
            }
            catch(itemPendingError:ItemPendingError)
            {
               itemPendingError.addResponder(new ItemResponder(responderResultHandler,responderFaultHandler));
            }
         }
         return result;
      }
      
      private function resetRepeaterIndices(param1:IRepeaterClient, param2:int) : void
      {
         var _loc4_:Container = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:IRepeaterClient = null;
         var _loc3_:Array = param1.repeaterIndices;
         _loc3_[_loc3_.length - 1] = param2;
         param1.repeaterIndices = _loc3_;
         if(param1 is Container)
         {
            _loc5_ = (_loc4_ = Container(param1)).numChildren;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = IRepeaterClient(_loc4_.getChildAt(_loc6_));
               resetRepeaterIndices(_loc7_,param2);
               _loc6_++;
            }
         }
      }
      
      public function get recycleChildren() : Boolean
      {
         return _recycleChildren;
      }
      
      private function collectionChangedHandler(param1:CollectionEvent) : void
      {
         switch(param1.kind)
         {
            case CollectionEventKind.UPDATE:
               break;
            default:
               execute();
         }
      }
      
      private function getIndexForRepeater(param1:Repeater, param2:LocationInfo) : void
      {
         var _loc5_:IFlexDisplayObject = null;
         var _loc6_:Repeater = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(mx_internal::createdComponents.length);
         while(_loc3_ < _loc4_)
         {
            if((_loc5_ = mx_internal::createdComponents[_loc3_]) == param1)
            {
               param2.found = true;
               break;
            }
            if(_loc5_ is Repeater)
            {
               (_loc6_ = Repeater(_loc5_)).getIndexForRepeater(param1,param2);
               if(param2.found)
               {
                  break;
               }
            }
            else
            {
               param2.index += 1;
            }
            _loc3_++;
         }
      }
      
      private function hasDescendant(param1:Object) : Boolean
      {
         var _loc2_:Array = param1.repeaters;
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == this)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      public function initializeRepeater(param1:IContainer, param2:Boolean) : void
      {
         _container = Container(param1);
         descriptorIndex = param1.numChildren;
         created = true;
         if(collection)
         {
            createComponentsFromDescriptors(param2);
         }
         if(owner == null)
         {
            owner = Container(param1);
         }
      }
      
      [Bindable("collectionChange")]
      public function get dataProvider() : Object
      {
         return collection;
      }
      
      private function removeItems(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:IRepeaterClient = null;
         var _loc5_:int = 0;
         var _loc6_:Repeater = null;
         if(Boolean(mx_internal::createdComponents) && mx_internal::createdComponents.length > 0)
         {
            _loc3_ = int(mx_internal::createdComponents.length - 1);
            while(_loc3_ >= 0)
            {
               _loc4_ = mx_internal::createdComponents[_loc3_];
               _loc5_ = getRepeaterIndex(_loc4_);
               if(param1 <= _loc5_ && (_loc5_ < param2 || param2 == -1) || _loc5_ >= dataProvider.length)
               {
                  if(_loc4_ is Repeater)
                  {
                     _loc6_ = Repeater(_loc4_);
                     removeRepeater(_loc6_);
                  }
                  else if(container.contains(DisplayObject(_loc4_)))
                  {
                     container.removeChild(DisplayObject(_loc4_));
                  }
                  if(_loc4_ is IDeferredInstantiationUIComponent)
                  {
                     IDeferredInstantiationUIComponent(_loc4_).deleteReferenceOnParentDocument(IFlexDisplayObject(parentDocument));
                  }
                  mx_internal::createdComponents.splice(_loc3_,1);
               }
               else if(param1 <= _loc5_ && param2 != -1 && _loc5_ >= param2)
               {
                  adjustIndices(_loc4_,param2 - param1 + 1);
                  if(_loc4_ is IDeferredInstantiationUIComponent)
                  {
                     IDeferredInstantiationUIComponent(_loc4_).executeBindings(true);
                  }
               }
               _loc3_--;
            }
         }
      }
      
      private function getIndexForFirstChild() : int
      {
         var _loc5_:IFlexDisplayObject = null;
         var _loc6_:Repeater = null;
         var _loc1_:LocationInfo = new LocationInfo();
         var _loc2_:int = 0;
         var _loc3_:Array = Container(container).mx_internal::createdComponents;
         var _loc4_:int = !!_loc3_ ? int(_loc3_.length) : 0;
         while(_loc2_ < _loc4_)
         {
            if((_loc5_ = Container(container).mx_internal::createdComponents[_loc2_]) == this)
            {
               _loc1_.found = true;
               break;
            }
            if(_loc5_ is Repeater)
            {
               (_loc6_ = Repeater(_loc5_)).getIndexForRepeater(this,_loc1_);
               if(_loc1_.found)
               {
                  break;
               }
            }
            else
            {
               _loc1_.index += 1;
            }
            _loc2_++;
         }
         return _loc1_.found ? _loc1_.index : container.numChildren;
      }
      
      private function createComponentsFromDescriptors(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:IFlexDisplayObject = null;
         dispatchEvent(new FlexEvent(FlexEvent.REPEAT_START));
         mx_internal::createdComponents = [];
         if(collection && collection.length > 0 && collection.length - startingIndex > 0)
         {
            _loc2_ = positiveMin(collection.length - startingIndex,count);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _currentIndex = startingIndex + _loc3_;
               dispatchEvent(new FlexEvent(FlexEvent.REPEAT));
               if(Boolean(childDescriptors) && childDescriptors.length > 0)
               {
                  _loc4_ = int(childDescriptors.length);
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_)
                  {
                     _loc6_ = createComponentFromDescriptor(_loc3_,_loc5_,param1);
                     mx_internal::createdComponents.push(_loc6_);
                     if(_loc6_ is IUIComponent)
                     {
                        IUIComponent(_loc6_).owner = this;
                     }
                     if(_loc6_ is IAutomationObject)
                     {
                        IAutomationObject(_loc6_).showInAutomationHierarchy = true;
                     }
                     _loc5_++;
                  }
               }
               _loc3_++;
            }
            _currentIndex = -1;
         }
         dispatchEvent(new FlexEvent(FlexEvent.REPEAT_END));
      }
      
      private function sort() : void
      {
         execute();
      }
      
      private function removeRepeater(param1:Repeater) : void
      {
         param1.removeAllChildren(param1.container);
         param1.removeAllChildRepeaters(Container(param1.container));
         removeChildRepeater(Container(container),param1);
         param1.deleteReferenceOnParentDocument(IFlexDisplayObject(parentDocument));
         param1.dataProvider = null;
      }
      
      public function executeChildBindings() : void
      {
         var _loc3_:IRepeaterClient = null;
         var _loc1_:int = container.numChildren;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = IRepeaterClient(container.getChildAt(_loc2_));
            if(hasDescendant(_loc3_) && _loc3_ is IDeferredInstantiationUIComponent)
            {
               IDeferredInstantiationUIComponent(_loc3_).executeBindings();
            }
            _loc2_++;
         }
      }
      
      [Bindable("nextRepeaterItem")]
      public function get currentIndex() : int
      {
         var _loc1_:String = null;
         if(_currentIndex == -1)
         {
            _loc1_ = String(resourceManager.getString("core","notExecuting"));
            throw new Error(_loc1_);
         }
         return _currentIndex;
      }
      
      public function set startingIndex(param1:int) : void
      {
         _startingIndex = param1;
         execute();
         dispatchEvent(new Event("startingIndexChanged"));
      }
      
      private function responderFaultHandler(param1:Object, param2:Object) : void
      {
      }
      
      override public function toString() : String
      {
         return Object(container).toString() + "." + super.toString();
      }
      
      private function recreate() : void
      {
         removeAllChildren(container);
         removeAllChildRepeaters(Container(container));
         var _loc1_:int = container.numChildren;
         var _loc2_:int = getIndexForFirstChild();
         createComponentsFromDescriptors(true);
         if(_loc1_ != _loc2_)
         {
            reindexDescendants(_loc1_,_loc2_);
         }
      }
      
      [Bindable("startingIndexChanged")]
      public function get startingIndex() : int
      {
         return _startingIndex;
      }
      
      private function getRepeaterIndex(param1:IRepeaterClient) : int
      {
         var _loc2_:Array = param1.repeaters;
         if(_loc2_ == null)
         {
            return -1;
         }
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] == this)
            {
               return param1.repeaterIndices[_loc4_];
            }
            _loc4_++;
         }
         return -1;
      }
      
      private function execute() : void
      {
         if(!created)
         {
            return;
         }
         if(recycleChildren && mx_internal::createdComponents && mx_internal::createdComponents.length > 0)
         {
            recycle();
         }
         else
         {
            recreate();
         }
      }
      
      override public function set showInAutomationHierarchy(param1:Boolean) : void
      {
      }
      
      public function set recycleChildren(param1:Boolean) : void
      {
         _recycleChildren = param1;
      }
      
      public function set dataProvider(param1:Object) : void
      {
         var _loc3_:XMLList = null;
         var _loc4_:Array = null;
         var _loc2_:Boolean = false;
         if(collection)
         {
            _loc2_ = true;
            collection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangedHandler);
            collection = null;
            iterator = null;
         }
         if(param1 is Array)
         {
            collection = new ArrayCollection(param1 as Array);
         }
         else if(param1 is ICollectionView)
         {
            collection = ICollectionView(param1);
         }
         else if(param1 is IList)
         {
            collection = new ListCollectionView(IList(param1));
         }
         else if(param1 is XMLList)
         {
            collection = new XMLListCollection(param1 as XMLList);
         }
         else if(param1 is XML)
         {
            _loc3_ = new XMLList();
            _loc3_ += param1;
            collection = new XMLListCollection(_loc3_);
         }
         else if(param1 != null)
         {
            _loc4_ = [param1];
            collection = new ArrayCollection(_loc4_);
         }
         if(collection)
         {
            collection.addEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangedHandler,false,0,true);
            iterator = collection.createCursor();
         }
         dispatchEvent(new Event("collectionChange"));
         if(Boolean(collection) || _loc2_)
         {
            execute();
         }
      }
      
      private function updateItems(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:IRepeaterClient = null;
         var _loc6_:int = 0;
         if(recycleChildren)
         {
            _loc3_ = container.numChildren;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = IRepeaterClient(container.getChildAt(_loc4_));
               if((_loc6_ = getRepeaterIndex(_loc5_)) != -1 && param1 <= _loc6_ && _loc6_ <= param2)
               {
                  if(_loc5_ is IDeferredInstantiationUIComponent)
                  {
                     IDeferredInstantiationUIComponent(_loc5_).executeBindings(true);
                  }
               }
               _loc4_++;
            }
         }
         else
         {
            removeItems(param1,param2);
            addItems(param1,param2);
         }
      }
   }
}

class LocationInfo
{
    
   
   public var index:int = 0;
   
   public var found:Boolean = false;
   
   public function LocationInfo()
   {
      super();
   }
}
