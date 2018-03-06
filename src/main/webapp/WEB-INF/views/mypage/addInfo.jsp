<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 마이페이지-부가정보 수정 -->

<title>부가 정보</title>
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

    .IT{
        visibility: hidden;
    }

    .ENGLISH{
        visibility: hidden;
    }

    .GONG{
        visibility: hidden;
    }
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

	<form name="addInfoForm" action="/addInfo" method="post">

	<!-- 부가정보  -->
    <h4>부가정보 입력</h4>
   
    
    <p>관심 카테고리</p>
    
    <!-- 카테고리 대/소분류 메소드 -->
    <span><button onclick="show()">#IT</button></span>
    <span><button onclick="show2()">#영어</button></span>
    <span><button onclick="show3()">#공무원</button></span>
    <br>
    
    <script>
    
    function show() {
        document.getElementById("IT").style.visibility = "visible";
    }

    function show2(){
        document.getElementById("ENGLISH").style.visibility = "visible";
    }

    function show3(){
        document.getElementById("GONG").style.visibility = "visible";
    }
    
    // // class명으로 보이기/사라지기
    // function show(){
    //     var kk = document.getElementsByClassName("IT");
    //     kk[0].style.visibility = "visible"
    // }
    </script>

    <div class="IT" id="IT">
    <input type="checkbox" name="IT" value="JAVA"  id="01"> JAVA 
    <input type="checkbox" name="IT" value="spring"  id="02"> SPING 
    <input type="checkbox" name="IT" value="html"  id="03"> HTML/CSS
    </div>

    <div class="ENGLISH" id="ENGLISH">
    <input type="checkbox" name="english" value="toeic" id="04"> TOEIC 
    <input type="checkbox" name="english" value="speaking" id="05"> SPEAKING 
    <input type="checkbox" name="english" value="opic" id="06"> OPIC 
    </div>

    <div class="GONG" id="GONG">
    <input type="checkbox" name="civil" value="administration" id="07"> 행정 
    <input type="checkbox" name="civil" value="police" id="08"> 경찰 
    <input type="checkbox" name="civil" value="fireman" id="09"> 소방 
    </div>

    <br>
    <br> 

    <p>관심 지역</p>
    <!--대분류  -->
   <select name="RGD">
        <option value="서울"> 서울 </option>
        <option value="경기"> 경기 </option>
        <option value="강원"> 강원 </option>
    </select>   
     
    <!--소분류  -->
   <select name="RGS">
        <option value="강남구"> 강남구 </option>
        <option value="서초구"> 서초구 </option>
        <option value="광진구"> 광진구 </option>
    </select>


   <h3>자기소개</h3>
   <textarea row="5" cols="50" name="introduction">${vo.introduction}</textarea>
   
   <h3>홈페이지</h3>
   <input type="url" name="homepage" value="${vo.homepage}">
   <br>
   
   
   <input type="hidden" value="${login.email}" name="email" readonly>
   
<div>
   <input type="submit" value="저장하기">
</div>

</form>
</body>
 

</html>