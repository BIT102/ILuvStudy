<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
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

    
    </style>
</head>


<body>
    	<!-- 상단 메뉴바 부분 -->
	
    <div id="div1"> 
        <div class="basic border">
            <a href="profile">기본정보 관리</a>
        </div>
    
        <div class="basic border">
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

    <br>
    <br>
    <br>
   

   <div id="acinfo">
        <p2>비밀번호 변경</p2>
        <table id="actable">
            <tr>
                <td><label for="nowPw">기존 비밀번호</label></td>
                <td><input id="nowPw" type="password" name="nowPw"></td>   	
            </tr>
            <tr>
                <td><label for="newPw1">새 비밀번호</label></td>
                <td><input id="newPw1" type="password" name="newPw1" placeholder="8자리에서 16자리 이하 영문, 숫자로만 설정해 주세요."></td>
            </tr>
            <tr>
                <td><label for="newPw2">비밀번호 확인</label></td>
                <td><input id="newPw2" type="password" name="newPw2" placeholder="비밀번호를 한번 더 입력해주세요." ></td>
            </tr>
        </table>
        <input type="hidden" value="${login.email}" name="email" readonly> 
   </div>
<div>
   <input class="changePw" type="submit" value="변경하기">
</div>


	
	<script>
	
	$(".changePw").on("click", function(){
		
		var nowPw = $('#nowPw').val();			//화면에서 입력된 내용은 변수 처리
		var newPw1 = $('#newPw1').val();
		var newPw2 = $('#newPw2').val();
		
		
		console.log(nowPw);
		console.log(newPw1);
		console.log(newPw2);
		
		$.ajax({
			url: '/changePw',
			type: 'POST',
			header:{
				"X-HTTP-Method-Override" : "POST"
			},
			data:{ 	nowPw : nowPw,
					newPw1 : newPw1, // 앞에는 컨트롤러에서 가져다 쓸 이름이고 뒤에는 값임!!
					newPw2 : newPw2		
			},
			success : function(result){ //alert으로 result값을 하면 컨트롤에서 ""안에 쓴 값이 뜸
			alert(result);
			}
		})
	})
	
	</script>
	
	
</body>


</html>