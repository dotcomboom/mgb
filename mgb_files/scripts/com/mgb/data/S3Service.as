package com.mgb.data
{
   import com.mgb.managers.*;
   import com.mgb.utils.*;
   import flash.events.*;
   import flash.net.*;
   import flash.utils.ByteArray;
   import mx.rpc.events.*;
   import mx.rpc.http.*;
   
   public class S3Service
   {
      
      private static const S3SoapTypeDateTime:String = "xsi:type=\"xsd:dateTime\"";
      
      private static const S3SoapTypeLong:String = "xsi:type=\"xsd:long\"";
      
      private static const S3SoapTypeBoolean:String = "xsi:type=\"xsd:boolean\"";
      
      private static const S3SoapEnd:String = "</SOAP-ENV:Body></SOAP-ENV:Envelope>";
      
      private static const S3SoapTypeInt:String = "xsi:type=\"xsd:int\"";
      
      private static const S3SoapTypeBase64:String = "xsi:type=\"xsd:base64Binary\"";
      
      private static const S3SoapNSdef:String = "xmlns:ns1=\"http://s3.amazonaws.com/doc/2006-03-01/\"";
      
      private static const S3SoapTypeString:String = "xsi:type=\"xsd:string\"";
      
      private static const S3SoapBegin:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "<SOAP-ENV:Envelope xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" " + "xmlns:xsi=\"http://www.w3.org/1999/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/1999/XMLSchema\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">" + "<SOAP-ENV:Body>";
       
      
      private var ListBucketPrefix:String = null;
      
      private var shortName:String = null;
      
      private var opCallback:Function = null;
      
      private var opPending:Boolean = false;
      
      private var currentOp:String = null;
      
      public function S3Service()
      {
         super();
      }
      
      private function deleteFaultHandler(param1:FaultEvent) : void
      {
         trace("delete failed");
         var _loc2_:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,false,new Object());
         _loc2_.result.deleted = false;
         _loc2_.result.mgb_error = 404;
         opCallback(_loc2_);
      }
      
      private function s3projectname() : String
      {
         var _loc1_:String = String(MgbSession.getInstance().activeProject);
         return !!_loc1_ ? _loc1_ : String(MgbSystem.defaultProject);
      }
      
      private function deleteCompleteHandler(param1:ResultEvent) : void
      {
         var _loc2_:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,false,new Object());
         if(Boolean(param1.result.mgb_error) && param1.result.mgb_error != 0)
         {
            trace("delete failed");
            _loc2_.result.deleted = false;
            _loc2_.result.mgb_error = param1.result.mgb_error;
            _loc2_.result.mgb_error_msg = param1.result.mgb_error_msg;
         }
         else
         {
            trace("delete operation OK");
            _loc2_.result.deleted = true;
            _loc2_.result.mgb_error = 0;
         }
         opCallback(_loc2_);
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         var _loc2_:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,false,new Object());
         _loc2_.result.mgb_error = 404;
         opCallback(_loc2_);
      }
      
      private function s3FullKeyName(param1:String, param2:String, param3:String, param4:String) : String
      {
         return s3PathName(param2,param3,param4) + "/" + param1;
      }
      
      public function request(param1:String, param2:Function, param3:Object) : void
      {
         var _loc6_:HTTPService = null;
         var _loc7_:Object = null;
         if(opPending)
         {
            throw new Error("request already in progress on this object");
         }
         var _loc4_:URLRequest = new URLRequest();
         var _loc5_:URLLoader = new URLLoader();
         _loc4_.contentType = "text/xml";
         _loc4_.method = "POST";
         if(param1 == Piece.MGB_OP_DELETE)
         {
            (_loc6_ = new HTTPService()).url = MgbSystem.idServerUrl + "/user/flex_delete_s3object";
            _loc6_.useProxy = false;
            _loc6_.method = "POST";
            _loc6_.addEventListener("result",deleteCompleteHandler);
            _loc6_.addEventListener("fault",deleteFaultHandler);
            _loc6_.contentType = "application/x-www-form-urlencoded";
            (_loc7_ = new Object()).itemname = s3FullKeyName(param3.name,param3.piecetype,param3.overrideUsername,param3.overrideProject);
            _loc6_.send(_loc7_);
         }
         else
         {
            _loc4_.url = SSSSession.S3_SOAP_URL;
            _loc4_.data = constructSoapRequest(param1,param3);
            MgbSession.getInstance().s3BytesSent = MgbSession.getInstance().s3BytesSent + String(_loc4_.data).length;
            _loc4_.requestHeaders = new Array(new URLRequestHeader("SOAPAction","\"\""));
            _loc5_.addEventListener(Event.COMPLETE,completeHandler);
            _loc5_.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
            _loc5_.load(_loc4_);
         }
         opPending = true;
         opCallback = param2;
         this.shortName = new String(param3.name);
         switch(param1.toLowerCase())
         {
            case "save":
            case "list":
            case "listprojects":
               ++MgbSession.getInstance().expensiveOps;
               break;
            case "load":
            case "delete":
               ++MgbSession.getInstance().cheapOps;
               break;
            default:
               throw new Error();
         }
      }
      
      private function s3PathName(param1:String, param2:String, param3:String) : String
      {
         var _loc4_:* = null;
         _loc4_ = param2 + "/";
         if(param3 != null)
         {
            _loc4_ = _loc4_ + param3 + "/" + param1;
         }
         if(_loc4_.search(/null/) != -1)
         {
            trace(" dodgy key " + _loc4_ + " in S3");
         }
         return _loc4_;
      }
      
      private function completeHandler(param1:Event) : void
      {
         var SOAPENV:Namespace;
         var s3awsNS:Namespace;
         var resultEvent:ResultEvent;
         var x:XML;
         var i:int = 0;
         var s:* = undefined;
         var truncatedStr:String = null;
         var pathLen:int = 0;
         var keylen:* = undefined;
         var project:* = undefined;
         var retCodeStr:String = null;
         var event:Event = param1;
         var loader:URLLoader = URLLoader(event.target);
         MgbSession.getInstance().s3BytesReceived = MgbSession.getInstance().s3BytesReceived + String(loader.data).length;
         x = new XML(loader.data);
         SOAPENV = x.namespace("soapenv");
         s3awsNS = new Namespace("http://s3.amazonaws.com/doc/2006-03-01/");
         resultEvent = new ResultEvent(ResultEvent.RESULT,false,false,new Object());
         opPending = false;
         if(x.SOAPENV::Body.s3awsNS::GetObjectResponse.length() > 0)
         {
            resultEvent.result.piece = new Array();
            resultEvent.result.piece.blob = new String(x.SOAPENV::Body.s3awsNS::GetObjectResponse.s3awsNS::GetObjectResponse.s3awsNS::Data);
            resultEvent.result.piece.name = this.shortName;
            i = 0;
            do
            {
               try
               {
               }
               catch(error:*)
               {
                  i = -1;
               }
            }
            while(i > 0);
            
            opCallback(resultEvent);
         }
         else if(x.SOAPENV::Body.s3awsNS::PutObjectInlineResponse.length() > 0)
         {
            opCallback(resultEvent);
         }
         else if(x.SOAPENV::Body.s3awsNS::ListBucketResponse.length() > 0)
         {
            truncatedStr = new String(x.SOAPENV::Body.s3awsNS::ListBucketResponse.s3awsNS::ListBucketResponse.s3awsNS::IsTruncated);
            resultEvent.result.truncated = truncatedStr == "false" ? false : true;
            if(currentOp == "listprojects")
            {
               i = 0;
               pathLen = int(this.ListBucketPrefix.length);
               resultEvent.result.projectsList = new Array();
               do
               {
                  try
                  {
                  }
                  catch(error:*)
                  {
                     i = -1;
                  }
               }
               while(i > 0);
               
            }
            else
            {
               i = 0;
               pathLen = this.ListBucketPrefix.length + 1;
               resultEvent.result.pieceList = new Object();
               do
               {
                  try
                  {
                  }
                  catch(error:Error)
                  {
                     if(error.errorID != 1010)
                     {
                        trace("list(" + currentOp + ")... i=" + i + "  s=\'" + s + "\'  error: " + error.message);
                     }
                     i = -1;
                  }
               }
               while(i > 0);
               
            }
            resultEvent.result.lastKey = new String(s);
            opCallback(resultEvent);
         }
         else
         {
            if(x.SOAPENV::Body.s3awsNS::DeleteObjectResponse.length() <= 0)
            {
               if(x.SOAPENV::Body.SOAPENV::Fault.length() > 0)
               {
                  throw new Error("Soap Fault");
               }
               throw new Error("Unknown SOAP response format");
            }
            retCodeStr = new String(x.SOAPENV::Body.s3awsNS::DeleteObjectResponse.s3awsNS::DeleteObjectResponse.s3awsNS::Code);
            resultEvent.result.deleted = retCodeStr == "204" || retCodeStr == "200" ? true : false;
            opCallback(resultEvent);
         }
      }
      
      private function writeCompleteHandler(param1:ResultEvent) : void
      {
         var _loc2_:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,false,new Object());
         if(Boolean(param1.result.mgb_error) && param1.result.mgb_error != 0)
         {
            trace("write failed");
            _loc2_.result.mgb_error = param1.result.mgb_error;
            _loc2_.result.mgb_error_msg = param1.result.mgb_error_msg;
         }
         else
         {
            trace("write operation OK");
            _loc2_.result.mgb_error = 0;
         }
         opCallback(_loc2_);
      }
      
      private function S3SoapOp(param1:String) : String
      {
         switch(param1.toLowerCase())
         {
            case "save":
               return SSSSession.SOAPOP_PutObjectInline;
            case "load":
               return SSSSession.SOAPOP_GetObject;
            case "list":
               return SSSSession.SOAPOP_ListBucket;
            case "listprojects":
               return SSSSession.SOAPOP_ListBucket;
            case "delete":
               return SSSSession.SOAPOP_DeleteObject;
            default:
               throw new Error();
         }
      }
      
      private function constructSoapRequest(param1:String, param2:Object) : String
      {
         var _loc7_:String = null;
         var _loc8_:ByteArray = null;
         if(null == param2.piecetype && param1 != "listprojects")
         {
            throw new Error();
         }
         currentOp = param1;
         var _loc3_:String = String(S3SoapOp(param1));
         var _loc4_:String = String(SSSSession.getS3SoapSignature(_loc3_));
         var _loc5_:String = String(SSSSession.getS3SoapSignatureDateTime());
         var _loc6_:* = (_loc6_ = S3SoapBegin + "<ns1:" + _loc3_ + " " + S3SoapNSdef + ">") + ("<Bucket " + S3SoapTypeString + " >" + SSSSession.s3BucketName + "</Bucket>");
         if("PutObjectInline" == _loc3_)
         {
            if(null == param2.piecetype || null == param2.name)
            {
               throw new Error();
            }
            _loc6_ = (_loc6_ += "<Key " + S3SoapTypeString + ">" + s3FullKeyName(param2.name,param2.piecetype,param2.overrideUsername,param2.overrideProject) + "</Key>") + ("<Metadata><Name " + S3SoapTypeString + ">Content-Type</Name><Value " + S3SoapTypeString + ">text/plain</Value></Metadata>");
            for(_loc7_ in param2)
            {
               switch(_loc7_)
               {
                  case "blob":
                  case "piecetype":
                  case "name":
                  case "overrideUsername":
                  case "overrideProject":
                     break;
                  default:
                     _loc6_ += "<Metadata><Name " + S3SoapTypeString + ">" + _loc7_ + "</Name><Value " + S3SoapTypeString + ">" + param2[_loc7_] + "</Value></Metadata>";
                     break;
               }
            }
            _loc6_ += "<Data " + S3SoapTypeBase64 + ">" + param2["blob"] + "</Data>";
            _loc8_ = Base64ByteArray.Decode(String(param2["blob"]));
            _loc6_ += "<ContentLength " + S3SoapTypeLong + ">" + _loc8_.length + "</ContentLength>";
         }
         else if("GetObject" == _loc3_)
         {
            if(null == param2.piecetype || null == param2.name)
            {
               throw new Error();
            }
            _loc6_ = (_loc6_ = (_loc6_ = (_loc6_ += "<Key " + S3SoapTypeString + ">" + s3FullKeyName(param2.name,param2.piecetype,param2.overrideUsername,param2.overrideProject) + "</Key>") + ("<GetMetadata " + S3SoapTypeBoolean + ">true</GetMetadata>")) + ("<GetData " + S3SoapTypeBoolean + ">true</GetData>")) + ("<InlineData " + S3SoapTypeBoolean + ">true</InlineData>");
         }
         else if("DeleteObject" == _loc3_)
         {
            if(null == param2.piecetype || null == param2.name)
            {
               throw new Error();
            }
            _loc6_ += "<Key " + S3SoapTypeString + ">" + s3FullKeyName(param2.name,param2.piecetype,param2.overrideUsername,param2.overrideProject) + "</Key>";
         }
         else if("ListBucket" == _loc3_)
         {
            if(param1 == "listprojects")
            {
               this.ListBucketPrefix = s3PathName("",param2.overrideUsername,null);
               _loc6_ += "<Prefix " + S3SoapTypeString + ">" + this.ListBucketPrefix + "</Prefix>";
            }
            else
            {
               if(!param2.piecetype)
               {
                  throw new Error();
               }
               this.ListBucketPrefix = s3PathName(param2.piecetype,param2.overrideUsername,param2.overrideProject);
               _loc6_ += "<Prefix " + S3SoapTypeString + ">" + this.ListBucketPrefix + "</Prefix>";
            }
            if(param2.marker)
            {
               _loc6_ += "<Marker " + S3SoapTypeString + ">" + param2.marker + "</Marker>";
            }
            if(param2.maxkeys)
            {
               _loc6_ += "<MaxKeys " + S3SoapTypeInt + ">" + param2.maxkeys + "</MaxKeys>";
            }
            if(param2.delimiter)
            {
               _loc6_ += "<Delimiter " + S3SoapTypeString + ">" + param2.delimiter + "</Delimiter>";
            }
         }
         return (_loc6_ += "<AWSAccessKeyId " + S3SoapTypeString + ">" + SSSSession.AWSAccessKeyId + "</AWSAccessKeyId>" + "<Timestamp " + S3SoapTypeDateTime + ">" + _loc5_ + "</Timestamp>" + "<Signature " + S3SoapTypeString + ">" + _loc4_ + "</Signature>") + ("</ns1:" + _loc3_ + ">" + S3SoapEnd);
      }
      
      private function s3username() : String
      {
         return MgbSession.getInstance().userName;
      }
      
      private function writeFaultHandler(param1:FaultEvent) : void
      {
         trace("write failed");
         var _loc2_:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,false,new Object());
         _loc2_.result.mgb_error = 404;
         opCallback(_loc2_);
      }
   }
}
