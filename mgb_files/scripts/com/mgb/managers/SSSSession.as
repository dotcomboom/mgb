package com.mgb.managers
{
   import com.mgb.utils.*;
   import flash.events.*;
   import flash.utils.*;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.http.*;
   
   public class SSSSession
   {
      
      public static const S3_SOAP_URL:String = "https://s3.amazonaws.com/soap";
      
      public static const SOAPOP_GetObject:String = "GetObject";
      
      public static const SOAPOP_PutObjectInline:String = "PutObjectInline";
      
      public static const s3BucketName:String = "JGI_test1";
      
      private static const delayMinsBetweenRefreshSoapKeys:Number = 10;
      
      private static var alarmTimer:Timer = null;
      
      public static const SOAPOP_DeleteObject:String = "DeleteObject";
      
      private static var signatureCacheDateTime:String = null;
      
      private static const soapOps:Array = [SOAPOP_PutObjectInline,SOAPOP_GetObject,SOAPOP_ListBucket,SOAPOP_DeleteObject];
      
      private static var healthStateNotedHeartbeatFailure:Boolean = false;
      
      private static var signatureCache:Array = null;
      
      private static var signaturePopulatePending:Boolean = false;
      
      private static const delayMinsRetryGetSoapKeysOnError:Number = 0.2;
      
      public static const AWSAccessKeyId:String = "104QCDA4V07YPPSVBKG2";
      
      public static const SOAPOP_ListBucket:String = "ListBucket";
      
      private static var mgbLogger:MgbLogger = MgbLogger.getInstance();
       
      
      public function SSSSession()
      {
         super();
      }
      
      private static function httpFault(param1:FaultEvent) : void
      {
         mgbLogger.logError("Failed to get access to Game Piece database. The system will automatically retry until a connection can be made");
         signaturePopulatePending = false;
         healthStateNotedHeartbeatFailure = true;
         scheduleKeyPopulation(delayMinsRetryGetSoapKeysOnError);
      }
      
      public static function getS3SoapSignatureDateTime() : String
      {
         if(null == signatureCache)
         {
            populateSignatureCacheFromRails();
         }
         return isReady() ? String(signatureCacheDateTime) : null;
      }
      
      private static function httpPopulateResult(param1:ResultEvent) : void
      {
         mgbLogger.logDebug("Heartbeat received OK");
         MgbSession.getInstance().activityPerHeartbeat = 0;
         var _loc2_:Array = param1.result.keyz.split("&");
         signatureCache = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < soapOps.length)
         {
            signatureCache[soapOps[_loc3_]] = _loc2_[_loc3_];
            _loc3_++;
         }
         signaturePopulatePending = false;
         signatureCacheDateTime = param1.result.dt;
         if(healthStateNotedHeartbeatFailure)
         {
            healthStateNotedHeartbeatFailure = false;
            mgbLogger.logInfo("Game Piece database is now accessible");
         }
         scheduleKeyPopulation(delayMinsBetweenRefreshSoapKeys);
      }
      
      private static function populateSignatureCacheFromRails() : void
      {
         var _loc1_:HTTPService = null;
         var _loc2_:Object = null;
         var _loc3_:MgbSession = null;
         if(signaturePopulatePending == false)
         {
            signatureCacheDateTime = TimeUtils.soapDateTimeNow();
            _loc1_ = new HTTPService();
            _loc1_.url = MgbSystem.idServerUrl + "/user/flex_heartbeat_safe" + "";
            _loc1_.useProxy = false;
            _loc1_.method = "POST";
            _loc1_.addEventListener("result",httpPopulateResult);
            _loc1_.addEventListener("fault",httpFault);
            _loc1_.contentType = "application/x-www-form-urlencoded";
            _loc2_ = new Object();
            _loc2_.datetime = signatureCacheDateTime;
            _loc2_.clientversion = MgbSystem.version;
            _loc2_.sessionduration = !!alarmTimer ? int(alarmTimer.delay / 60000) : 0;
            _loc3_ = MgbSession.getInstance();
            _loc2_.authenticateduser = !!_loc3_.authenticatedName ? _loc3_.authenticatedName : "";
            _loc2_.activityperheartbeat = _loc3_.activityPerHeartbeat;
            _loc1_.send(_loc2_);
            signaturePopulatePending = true;
         }
      }
      
      public static function isReady() : Boolean
      {
         if(null == signatureCache)
         {
            populateSignatureCacheFromRails();
            return false;
         }
         return true;
      }
      
      private static function onAlarm(param1:TimerEvent) : void
      {
         mgbLogger.logDebug("sending heartbeat to Rails server due to " + int(param1.target.delay / 1000) + "s timer triggering");
         populateSignatureCacheFromRails();
      }
      
      private static function scheduleKeyPopulation(param1:Number) : void
      {
         if(null != alarmTimer)
         {
            alarmTimer.reset();
            alarmTimer = null;
         }
         var _loc2_:Number = Math.random() * 0.4 + 0.8;
         alarmTimer = new Timer(param1 * 60 * 1000 * _loc2_);
         alarmTimer.addEventListener(TimerEvent.TIMER,onAlarm);
         alarmTimer.start();
         mgbLogger.logDebug("scheduling heartbeat to Rails server - delay = " + int(alarmTimer.delay / 1000) + "s (skew = " + int(_loc2_ * 100) / 100 + ")");
      }
      
      public static function getS3SoapSignature(param1:String) : String
      {
         if(null == signatureCache)
         {
            populateSignatureCacheFromRails();
         }
         return isReady() ? String(signatureCache[param1]) : null;
      }
   }
}
