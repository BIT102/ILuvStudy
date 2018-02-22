<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>I Love Study</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* card css */
        .cborder{border:1px solid red;}
        .scard{margin-top:20px; margin-left:10px; float:left;}
        #studycard {margin:0 auto;width:80%;height:800px;}    
        #innerdiv {margin:0 auto; width:1000px; height:600px; }
        
        #cardtt > h3 {text-align:center;}
        #cardtt > button{}

        h1 {float:left;}
        #nav1{float:left; height:40px;}
        #nav1 > a {text-decoration-line: none;}
        #nav2{float:right;}    
        #nav2 > a {text-decoration-line: none;}
        #mainimg{ width:100%; height:500px;
            background-color: black}

        
    </style>

    
</head>
<body>
    <header>
        <h1><a href="main.html"><img src="/img/ilove.jpg" width="200" height="128"></a></h1>
        <nav id="nav1">
            <a href="listAll.html">전체</a>
            <a href="boarder.html">외국어</a>
            <a href="boarder.html">IT</a>
            <a href="boarder.html">교양</a>
            <a href="boarder.html">공무원</a>
        </nav>

        <nav id="nav2">
            <a href="profile.html">마이페이지</a>
            <a href="">로그아웃</a>
            <a href="register1.html">스터디등록</a>
            <a href="qna.html">QNA</a>
            <a href="notice.html">공지사항</a>
        </nav>

    </header>

    <div id="mainimg">


    </div>

    <div id="studycard">
        <div id="innerdiv">
            <div id="cardtt">
            <h3>NEW STUDY</h3><button><a href="boarder.jsp">더 보기</a></button>
            </div>
        <div class="scard cborder" style="width: 20rem;">
                <img class="card-img-top" src="kazakhstan.jpg" alt="Card image cap">
                <div class="card-body">
                <h4 class="card-title">아싸소희</h4>
                <p class="card-text">EXCEL의 정석 저자의 엑셀 소규모 스터디</p>
                <a href="boarder.jsp" class="btn btn-primary">$99</a>
                </div>
        </div>
        <div class="scard cborder" style="width: 20rem;">
                <img class="card-img-top" src="hq.jpg" alt="Card image cap">
                <div class="card-body">
                <h4 class="card-title">인싸정인</h4>
                <p class="card-text">체대출신 조정인님의 인생 상담</p>
                <a href="boarder.jsp" class="btn btn-primary">$12</a>
                </div>
        </div>
        <div class="scard cborder" style="width: 20rem;">
                <img class="card-img-top" src="보랏.jpg" alt="Card image cap">
                <div class="card-body">
                <h4 class="card-title">영원4ever</h4>
                <p class="card-text">연륜의 영원님의 인생강의 <br> CHECK IT!</p>
                <a href="boarder.jsp" class="btn btn-primary">$20</a>
                </div>
        </div>
            <div id="cardtt">
            <h3>BEST STUDY</h3><button><a href="boarder.jsp">더 보기</a></button>
            </div>
        <div class="scard cborder" style="width: 20rem;">
                <img class="card-img-top" src="케이크.jpg" alt="Card image cap">
                <div class="card-body">
                <h4 class="card-title">베이킹 클래스</h4>
                <p class="card-text">유명쉐프 권한길의 케익 만들기</p>
                <a href="boarder.jsp" class="btn btn-primary">$77</a>
                </div>
        </div>
        <div class="scard cborder" style="width: 20rem;">
                <img class="card-img-top" src="ALI.jpg" alt="Card image cap">
                <div class="card-body">
                <h4 class="card-title">볼링</h4>
                <p class="card-text">체대출신 조정인님의 볼링 자세 원포인트레슨</p>
                <a href="boarder.jsp" class="btn btn-primary">$20</a>
                </div>
        </div>
        <div class="scard cborder" style="width: 20rem;">
                <img class="card-img-top" src="434.jpg" alt="Card image cap">
                <div class="card-body">
                <h4 class="card-title">미국문화</h4>
                <p class="card-text">카자흐스탄 기자의 미국문화 체험기<br> CHECK IT!</p>
                <a href="boarder.jsp" class="btn btn-primary">$50</a>
                </div>
        </div>
        </div>
    </div>
    
</body>
</html>