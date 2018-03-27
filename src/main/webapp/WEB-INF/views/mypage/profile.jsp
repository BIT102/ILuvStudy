<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 스터디</title>
<style>
	.border{border:2px solid grey; }
    .basic{width:300px; height:50px; float:left; text-align: center;}
    
    .profile{width:150px; height:50px;}
   
    #div1{display:inline-block;}    
    #div2{text-align: center;}
    #div2 div{float:left; }
    body{height:800px; width:700px;}
    body > div > p3 {text-align:left; font-size:30px; border-bottom:2px solid grey;  }

    #pfimage{  width:600px; height:50px; display:inline-block;
         }
    #acinfo{ width:600px; height:300px; display:inline-block;
        }
    
    #actable{font-size:20px; margin-top:10px;}
    
    
    .fileDrop{
	width: 150px;
	height: 100px;
	border: 1px dotted blue;
	}

	small{
	margin-left: 3px;
	font-weight: bold;
	color: gray;
	}
    
</style>

<script>
	$(document).ready(function(){
		alert("${result}");
	})
</script>

</head>


<body> 	


	<!-- <form name="profileForm" action="/profile" method="post" enctype="multipart/form-data"> -->

	<!-- 상단 메뉴바 -->
     <div id="div1"> 
        <div class="basic border"/>
            <a href="profile">기본정보 관리</a>
        </div>
    
        <div class="basic border"/>
            <a href="bookmark">스터디 관리</a>
        </div>
       </div>

   <div id="div2">
    <div class="profile border">
            <a href="profile">프로필</a></div>
    <div class="profile border">
            <a href="addInfo">부가 정보</a></div>
    <div class="profile border">
            <a href="changePw">비밀번호 변경</a></div>
    <div class="profile border">
            <a href="quit">회원탈퇴</a></div>
   </div>


	<!-- 프로필 사진 -->
   	<div class="fileDrop"></div>
	<div class="uploadedList"></div>
	
	    <p3>프로필 사진</p3>

	<img id="changeImg" src="pDisplayFile?fileName=${vo.photo}"> <!-- DB에서 담긴 이미지 -->

	<script>
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();  // dragenter, dragover, drop시 기본 동작을 막도록 작성
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files; // 전달된 파일 데이터를 가져오는 부분(dataTransfer.files)
			var file = files[0];
			console.log(file);
		
			var formData = new FormData();
			formData.append("file", file);
			
			
			//Ajax 활용
			$.ajax({
				url: "/pUploadAjax",
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type : 'POST',
				success : function(data){ // 파일명(스트링)이 담김
					alert(data);
					
					console.log(data);
					console.log(checkImageType(data));
					
					var str = "";
					
					if(checkImageType(data)){
						  str ="<div><a href=pDisplayFile?fileName="+getImageLink(data)+">"
								  +"<img src='pDisplayFile?fileName="+data+"'/>"
								  +"</a><small data-src="+data+">X</small></div>";
					  }else{
						  str = "<div><a href='displayFile?fileName="+data+"'>" 
								  + getOriginalName(data)+"</a>"
								  +"<small data-src="+data+">X</small></div></div>";
					  }
					
	        	$.ajax({
	        		url : "/insertImgUrl",
	        		type : "post",
	        		headers : {
	        			"X-HTTP-Method-Override" : "POST"
	        		},
	        	data:{
	    //    		imgAddrParam : imgAddr
	        		photo : data,
	        		email : document.getElementById("email").value 
	        	},
	        	success:function(result){
	        		alert(result);
	        	}
		        	})
		        	
		        
		        //photo에 담긴 스트링값(이름)을 vo.photo에 보내고 싶어요.
		       	// 그러려면 어떻게 해야 할까요?
		       	// 이러지말고 src전체를 		
		        
//		    	document.getElementById("changeImg").src = "pDisplayFile?fileName="+data;
	        	document.getElementById("changeImg").setAttribute("src","pDisplayFile?fileName="+data);
	        						
//				$(".uploadedList").append(str);
					
//					imgAddr = data; //data를 imgAddr에 담아 둠
				}
			});
			
		});
		

	
		
		// jsp에서 파일 출력하기
		function checkImageType(fileName){
			
			var pattern  = /jpg$|gif$|png$|jpeg$/i; 	//마지막 i는 대,소문자 구분 없음
			
			return fileName.match(pattern);
		}
		
		
		//파일 링크 처리(파일의 이름이 길게 출력되는 걸 줄여주는 기능)
		function getOriginalName(fileName){
			
			if(checkImageType(fileName)){
				return;
			}
			
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
		
		
		//이미지 파일의 원본 파일 찾기
		function getImageLink(fileName){
			
			if(!checkImageType(fileName)){
				return;
			}
			var front = fileName.substr(0,12); //년/월/일 경로를 추출하는 용도
			var end = fileName.substr(14);		// 파일 이름 앞의 's_'를 제거하는 용도
			
			return front + end;
		}
		
		// 첨부파일 삭제 처리
 		$(".uploadedList").on("click", "small", function(event){
			
			var that = $(this);
			
			$.ajax({
				url:"deleteFile",
				type:"post",
				data:{fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted'){
						alert("deleted");
						that.parent("div").remove(); // 파일 삭제 후 브라우져 화면에서 썸네일 삭제
					}
				}
			}); 
		});
	</script>
   
  
	<form name="profileForm" action="/profile" method="post" enctype="multipart/form-data">
    <br><br><br><br><br>

	<!-- 개인 프로필 정보 보기 &수정 -->
   <div id="acinfo">
        <p3>계정 정보</p3>
        <table id="actable">
            <tr>
                <td><label for="email">이메일</label></td>
          		<td><input id="email" type="email" value="${login.email}" readonly name="email"></td>
            </tr>
            <tr>
                <td><label for="name">이름</label></td>
                <td><input id="name" type="text" value="${vo.name}" name="name"></td>
            </tr>
            <tr>
                <td><label for="nickName">닉네임</label></td>
                <td><input id="nickName" type="text" value="${vo.nickName}" name="nickName"></td>
                <td><input type="button" id="nickCheck" value="중복확인"></input></td>
        <script>
		    $(document).ready(function(){
		        $("#nickCheck").click(function(){

		        	$.ajax({
		        		url : "/nickCheck",
		        		type : "post",
		        		headers : {
		        			"X-HTTP-Method-Override" : "POST"
		        		},
		        		data:{
		        			nickName : document.getElementById("nickName").value // id가 nickCheck인 value값(중복확인)을 가지고 오겠다.
		        		},
		        		success:function(result){
		        		alert(result);
		        	}
		        	
		        	})	 
		        	 
		        });
		    });
	    </script>
	    
                
                
            </tr>
            <tr>
                <td><label for="birth">생년월일</label></td>
                <td><input id="birth" type="text" value="${vo.birth}" name="birth"></td>
            </tr>
            <tr>
                <td>성별</td>
           		<td><input type="radio" id="userWoman" name="gender" value="1"  <c:if test="${vo.gender eq '1'}">checked</c:if>> 남성 </td>
                <td><input type="radio" id="userWoman" name="gender" value="2"  <c:if test="${vo.gender eq '2'}">checked</c:if>> 여성 </td>
            </tr>
            <tr>
                <td><label for="phone">전화번호</label></td>
                <td><input id="phone" type="text" value="${vo.phoneNum}" name="phoneNum"></td>
                <td><input type="button" value="인증하기"></input></td>
            </tr>
        </table>
   </div>
<div>
   <input type="submit" value="저장하기"> 
</div>

	
</form>
</body>


</html>