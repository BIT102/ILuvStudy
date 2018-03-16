package dev.mvc.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SMSController {

	private static final Logger logger = LoggerFactory.getLogger(SMSController.class);
	String randomCode = "1234";
	
	
	  @RequestMapping(value = "/smssend" , method = RequestMethod.POST)
	  public ResponseEntity<String> smssend(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		  logger.info("smssend...................");
		  ResponseEntity<String> entity = null;
		  
		  try{
			  String charsetType = "EUC-KR"; //EUC-KR 또는 UTF-8

			    request.setCharacterEncoding(charsetType);
			    response.setCharacterEncoding(charsetType);
			    /*String  action     = nullcheck(request.getParameter("action"), "");
			    if(action.equals("go")) {*/
			    String randomCode = UUID.randomUUID().toString().replace("-", "").substring(0, 6); // 변수값 생성
		        String sms_url = "";
		        sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
		        String user_id = base64Encode("lswkim"); // SMS아이디
		        String secure = base64Encode("45278fc5309389f11c297c8ad52cecb5");//인증키
		        String msg = base64Encode(randomCode);
		        String rphone = base64Encode(nullcheck(request.getParameter("rphone"), ""));
		        System.out.println(rphone);
		        String sphone1 = base64Encode("010");
		        String sphone2 = base64Encode("3137");
		        String sphone3 = base64Encode("3804");
		        String rdate = base64Encode(nullcheck(request.getParameter("rdate"), ""));
		        String rtime = base64Encode(nullcheck(request.getParameter("rtime"), ""));
		        String mode = base64Encode("1");
		        String subject = "";
		        if(nullcheck(request.getParameter("smsType"), "").equals("L")) {
		            subject = base64Encode(nullcheck(request.getParameter("subject"), ""));
		        }
		        String testflag = base64Encode(nullcheck(request.getParameter("testflag"), ""));
		        String destination = base64Encode(nullcheck(request.getParameter("destination"), ""));
		        String repeatFlag = base64Encode(nullcheck(request.getParameter("repeatFlag"), ""));
		        String repeatNum = base64Encode(nullcheck(request.getParameter("repeatNum"), ""));
		        String repeatTime = base64Encode(nullcheck(request.getParameter("repeatTime"), ""));
		        String returnurl = nullcheck(request.getParameter("returnurl"), "");
		        String nointeractive = nullcheck(request.getParameter("nointeractive"), "");
		        String smsType = base64Encode(nullcheck(request.getParameter("smsType"), ""));

		        String[] host_info = sms_url.split("/");
		        String host = host_info[2];
		        String path = "/" + host_info[3];
		        int port = 80;

		        // 데이터 맵핑 변수 정의
		        String arrKey[]
		            = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
		                        ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
		        String valKey[]= new String[arrKey.length] ;
		        valKey[0] = user_id;
		        valKey[1] = secure;
		        valKey[2] = msg;
		        valKey[3] = rphone;
		        valKey[4] = sphone1;
		        valKey[5] = sphone2;
		        valKey[6] = sphone3;
		        valKey[7] = rdate;
		        valKey[8] = rtime;
		        valKey[9] = mode;
		        valKey[10] = testflag;
		        valKey[11] = destination;
		        valKey[12] = repeatFlag;
		        valKey[13] = repeatNum;
		        valKey[14] = repeatTime;
		        valKey[15] = smsType;
		        valKey[16] = subject;

		        String boundary = "";
		        Random rnd = new Random();
		        String rndKey = Integer.toString(rnd.nextInt(32000));
		        MessageDigest md = MessageDigest.getInstance("MD5");
		        byte[] bytData = rndKey.getBytes();
		        md.update(bytData);
		        byte[] digest = md.digest();
		        for(int i =0;i<digest.length;i++)
		        {
		            boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
		        }
		        boundary = "---------------------"+boundary.substring(0,11);

		        // 본문 생성
		        String data = "";
		        String index = "";
		        String value = "";
		        for (int i=0;i<arrKey.length; i++)
		        {
		            index =  arrKey[i];
		            value = valKey[i];
		            data +="--"+boundary+"\r\n";
		            data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
		            data += "\r\n"+value+"\r\n";
		            data +="--"+boundary+"\r\n";
		        }

		        //out.println(data);

		        InetAddress addr = InetAddress.getByName(host);
		        Socket socket = new Socket(host, port);
		        // 헤더 전송
		        BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
		        wr.write("POST "+path+" HTTP/1.0\r\n");
		        wr.write("Content-Length: "+data.length()+"\r\n");
		        wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
		        wr.write("\r\n");

		        // 데이터 전송
		        wr.write(data);
		        wr.flush();

		        // 결과값 얻기
		        BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
		        String line;
		        String alert = "";
		        ArrayList tmpArr = new ArrayList();
		        while ((line = rd.readLine()) != null) {
		            tmpArr.add(line);
		        }
		        wr.close();
		        rd.close();

		        String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
		        String[] rMsg = tmpMsg.split(",");
		        String Result= rMsg[0]; //발송결과
		        String Count= ""; //잔여건수
		        
		        if(rMsg.length>1) {Count= rMsg[1]; }

		                        //발송결과 알림
		        if(Result.equals("success")) {
		            alert = "성공적으로 발송하였습니다.";
		            alert += " 잔여건수는 "+ Count+"건 입니다.";
		        }
		        else if(Result.equals("reserved")) {
		            alert = "성공적으로 예약되었습니다";
		            alert += " 잔여건수는 "+ Count+"건 입니다.";
		        }
		        else if(Result.equals("3205")) {
		            alert = "잘못된 번호형식입니다.";
		        }
		        else {
		            alert = "[Error]"+Result;
		        }
			        
			    /*}*/
			    entity = new ResponseEntity<String>("success", HttpStatus.OK);
		  }catch(Exception e){
			  entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		  }
		  
		  return entity;
		  
	  }
	  
	  @RequestMapping(value = "/smsConfirm", method = RequestMethod.POST)
	  public ResponseEntity<String> smsConfirm(String code) throws Exception{
		  
		logger.info("smsConfirm.........");
		System.out.println("randomCode : "+randomCode+", code : "+ code);
		  
		ResponseEntity<String> entity = null;
		  
		try{
			if(randomCode.equals(code)){
				entity = new ResponseEntity<String>("success",HttpStatus.OK);  
			}else{
				entity = new ResponseEntity<String>("fail",HttpStatus.OK);
			}
		}catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		  
		  return entity;
	  }
	  
	  public static String nullcheck(String str,  String Defaultvalue ) throws Exception
	     {
	          String ReturnDefault = "" ;
	          if (str == null)
	          {
	              ReturnDefault =  Defaultvalue ;
	          }
	          else if (str == "" )
	         {
	              ReturnDefault =  Defaultvalue ;
	          }
	          else
	          {
	                      ReturnDefault = str ;
	          }
	           return ReturnDefault ;
	     }
	     /**
	     * BASE64 Encoder
	     * @param str
	     * @return
	     */
	    public static String base64Encode(String str)  throws java.io.IOException {
	        sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
	        byte[] strByte = str.getBytes();
	        String result = encoder.encode(strByte);
	        return result ;
	    }

	    /**
	     * BASE64 Decoder
	     * @param str
	     * @return
	     */
	    public static String base64Decode(String str)  throws java.io.IOException {
	        sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
	        byte[] strByte = decoder.decodeBuffer(str);
	        String result = new String(strByte);
	        return result ;
	    }
}
