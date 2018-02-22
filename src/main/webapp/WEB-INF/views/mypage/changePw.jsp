<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필</title>
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
                <td><label for="nowPW">기존 비밀번호</label></td>
                <td><input id="nowPW" type="password" value="default"></td>
            </tr>
            <tr>
                <td><label for="newPW">새 비밀번호</label></td>
                <td><input id="newPW" type="password" placeholder="8자리에서 20자리 이하 영문, 숫자로만 설정해 주세요."></td>
            </tr>
            <tr>
                <td><label for="repeatPW">비밀번호 확인</label></td>
                <td><input id="repeatPW" type="password" placeholder="비밀번호를 한번 더 입력해주세요."></td>
             
        </table>
   </div>
<div>
   <input type="button" value="변경하기">
</div>
</body>


</html>