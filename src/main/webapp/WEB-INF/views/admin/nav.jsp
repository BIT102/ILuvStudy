<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        body{width:1080px;}

        /*nav*/
        .border{border:1px solid grey;}
        #topmenu{height:35px;}
        #topmenu > div{float:left; width:110px; height:30px; text-align:center;}
        
        #topmenu2{height:35px; float:left; width:110px; text-align:center;}

        /*내용*/
        #container{ 
            float:left;
        }

        table{
            border-collapse:collapse;
        }
        td,th{
            border:1px solid black;
        }
    </style>
<body>
    <!--헤더-->
    <div>
        <a>관리자님</a>
        <a href="pwChange">[정보수정]</a>
        <a>[로그아웃]</a>
    </div>

    <!--메뉴-->
    <div id="topmenu">    
        <div class="border">
            <a href="userList">회원관리</a>
        </div>
        <div class="border">
            <a href="studyList">스터디관리</a>
        </div>
        <div class="border">
            <a href="qnaList">사이트관리</a>
        </div>
        <div class="border">
            <a href="userStatistic">통계관리</a>
        </div>
        <div class="border">
            <a href="adminList">Admin관리</a>
        </div>
    </div>

</body>
</html>