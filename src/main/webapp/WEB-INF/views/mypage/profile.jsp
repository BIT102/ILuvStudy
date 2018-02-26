<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

    
    </style>
</head>


<body>
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

   <div id="pfimage">
        <p3>프로필 사진</p3>
        <p>회원님의 정면 사진을 올려주세요! <br> 상대방이 신뢰를 갖고 연락 할 확률이 높아져요!</p>
        <form><input type='file' name='file'><input type='submit'></form>
        <!--<form><input type="submit" value="사진업로드"></form>-->



   </div>

    <br>
    <br>




   <div id="acinfo">
        <p3>계정 정보</p3>
        <table id="actable">
            <tr>
                <td><label for="email">이메일</label></td>
                <td><input id="email" type="email" value="iwanttofly0401@gmail.com"></td>
            </tr>
            <tr>
                <td><label for="name">이름</label></td>
                <td><input id="name" type="text" value="홍길동" readonly></td>
            </tr>
            <tr>
                <td><label for="nickname">닉네임</label></td>
                <td><input id="nickname" type="text" value="쾌걸조로"></td>
                <td><input type="button" value="중복확인"></input></td>
            </tr>
            <tr>
                <td><label for="birth">생년월일</label></td>
                <td><input id="birth" type="text" value="990101"></td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input type="radio" id="userMan" name="userGender"> 남성</td>
                <td><input type="radio" id="userWoman" name="userGender"> 여성</td>
            </tr>
            <tr>
                <td><label for="phone">닉네임</label></td>
                <td><input id="phone" type="text" value="010-1234-5678"></td>
                <td><input type="button" value="인증하기"></input></td>
            </tr>
        </table>
   </div>
<div>
   <input type="button" value="저장하기">
</div>
</body>


</html>