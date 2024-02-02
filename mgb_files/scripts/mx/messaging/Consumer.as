package mx.messaging
{
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.messaging.messages.AsyncMessage;
   import mx.messaging.messages.CommandMessage;
   import mx.messaging.messages.IMessage;
   
   use namespace mx_internal;
   
   public class Consumer extends AbstractConsumer
   {
       
      
      private var _selector:String = "";
      
      private var _subtopic:String = "";
      
      public function Consumer(param1:String = "flex.messaging.messages.AsyncMessage")
      {
         super();
      }
      
      public function set subtopic(param1:String) : void
      {
         var _loc2_:Boolean = false;
         if(subtopic != param1)
         {
            _loc2_ = false;
            if(subscribed)
            {
               unsubscribe();
               _loc2_ = true;
            }
            _subtopic = param1;
            if(_loc2_)
            {
               subscribe();
            }
         }
      }
      
      override protected function internalSend(param1:IMessage, param2:Boolean = true) : void
      {
         if(subtopic.length > 0)
         {
            param1.headers[AsyncMessage.SUBTOPIC_HEADER] = subtopic;
         }
         if(_selector.length > 0)
         {
            param1.headers[CommandMessage.SELECTOR_HEADER] = _selector;
         }
         super.internalSend(param1,param2);
      }
      
      public function set selector(param1:String) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         var _loc3_:Boolean = false;
         if(_selector !== param1)
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"selector",_selector,param1);
            _loc3_ = false;
            if(subscribed)
            {
               unsubscribe();
               _loc3_ = true;
            }
            _selector = param1;
            if(_loc3_)
            {
               subscribe(clientId);
            }
            dispatchEvent(_loc2_);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subtopic() : String
      {
         return _subtopic;
      }
      
      [Bindable(event="propertyChange")]
      public function get selector() : String
      {
         return _selector;
      }
   }
}
