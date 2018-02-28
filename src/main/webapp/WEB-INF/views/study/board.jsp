
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    h1 {float:left;}
    #nav1{float:left; height:40px;}
    #nav1 > a {text-decoration-line: none;}
    #nav2{float:right;}    
    #nav2 > a {text-decoration-line: none;}
    
    #header{height: 150px;}

    #brdimg{background-color:pink;}
    .ctbutton{float:right;}

    .brdtext{float:left; margin-right:8px;}

    #grycontainer{border:2px solid red; height:300px; width:800px;}

    div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 180px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}
    </style>    
</head>
<body>

<!-- bno값 유지하자 -->
<form role="form" method="post">
	<input type="hidden" name="bno" value="${studyVO.bno}">
</form>

        <header id="header">
            <h1><a href="main.html"><img src="ilove.jpg" width="200" height="128"></a></h1>
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

        <div style="height:700px;">
            <div id="brdimg">
                <img src="kazakhstan.jpg"></img>
                <!-- 스터디 제목 -->
                <h2>${studyVO.title}</h2>
                <!-- 작성자 -->
                <p>${studyVO.nickname}</p>
                
                <!-- 이건뭐죠 >? -->
                <select class="ctbutton">
                    <option>IT</option>
                    <option>교양</option>
                    <option>라이프스타일</option>
                    
                </select>
            </div>

            <table>
                <tr>
                <!-- 카테고리 -->
                    <td>카테고리</td>
                    <td>${studyVO.cDName}, ${studyVO.cSName}</td>
                </tr>
                <tr>
                <!-- 현재인원 -->
                    <td>현재인원</td>
                    <td>${studyVO.now}</td>
                </tr>
                <tr>
                <!-- 최대인원 -->
                    <td>최대인원</td>
                    <td>${studyVO.max}</td>
                </tr>
                <tr>
                <!-- 지역 -->
                    <td>지역</td>
                    <td>${studyVO.rDName}/${studyVO.rSName}</td>
                </tr>
                <tr>
                <!-- 시작날짜 -->
                    <td>시작날짜</td>
                    <td>${studyVO.sd}</td>
                    <!-- 시작시간 -->
                    <td>시작시간</td>
                    <td>${studyVO.st}</td>
                    <!-- 끝나는시간 -->
                    <td>끝나는시간</td>
                    <td>${studyVO.et}</td>
                </tr>
            </table>
            <!-- 요일별 -->
            <div>요일별 스터디 시간 <p>${studyVO.sc}</p></div>
            <!-- 스터디내용 -->
            <div class="brdtext"><p>소개글</p></div>
            <div class="brdtext"><p>${studyVO.content}</p></div>

        </div>
        
        <!-- 첨부파일 나중에 합시다 -->
    <div id="grycontainer">  
        <div class="gallery">
     <!--            <a target="_blank" href="sohee.jpg">
                  <img src="sohee.jpg" alt="Trolltunga Norway" width="150" height="200">
                </a>
                <div class="desc">귀요미</div>
        </div>
            
        <div class="gallery">
                <a target="_blank" href="assa.gif">
                  <img src="assa.gif" alt="Forest" width="600" height="400">
                </a>
                <div class="desc">귀요미</div>
        </div>
              
        <div class="gallery">
                <a target="_blank" href="sh.jpg">
                  <img src="sh.jpg" alt="Northern Lights" width="600" height="400">
                </a>
                <div class="desc">귀요미</div>
        </div>
              
        <div class="gallery">
                <a target="_blank" href="shh.jpg">
                  <img src="shh.jpg" alt="Mountains" width="600" height="400">
                </a>
                <div class="desc">귀요미</div>  -->
        </div>
    </div><!-- end grycontainer -->

    <div>

        <span>작성자</span>
        <span>댓글</span> </br>
        <span>제시카</span>
        <span><input type="text" value="댓글을 입력해 주세요."></span>
        <input type="checkbox" >비밀글 <input type="button" value="댓글작성">
    </br></br>
        <input type="button" value="신청하기">
        <input type="button" value="목록으로">
        <!-- 로그인시 --> </br></br>
        <input type="button" value="목록">
        <input type="button" value="수정">
        <input type="button" value="삭제">
        <input type="button" value="스터디완료">
    </div>
</body>
</html>
