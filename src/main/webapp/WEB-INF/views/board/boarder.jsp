<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">
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

        <div style="height:500px;">
            <div id="brdimg">
                <img src="kazakhstan.jpg"></img>
                <h2>아싸소히</h2>
                <p>assash</p>
                <select class="ctbutton">
                    <option>IT</option>
                    <option>교양</option>
                    <option>라이프스타일</option>
                    
                </select>
            </div>

            <table>
                <tr>
                    <td>카테고리</td>
                    <td>컴퓨터,언어,웹프로그래밍</td>
                </tr>
                <tr>
                    <td>현재인원</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>최대인원</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>지역</td>
                    <td>서울</td>
                </tr>
                <tr>
                    <td>시작날짜</td>
                    <td>2018-02-20</td>
                </tr>
            </table>

            <div>요일별 스터디 시간 <p></p></div>
            <div class="brdtext"><p>소개글</p></div>
            <div class="brdtext"><p>천재지만 아싸인 김소희 강사의 교재로 퇴근 후 모여 공부합시다.</p></div>
            
           
        </div>
    <div id="grycontainer">  
        <div class="gallery">
                <a target="_blank" href="sohee.jpg">
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
                <div class="desc">귀요미</div>
        </div>
    </div><!-- end grycontainer -->

    <div>

        <span>작성자</span>
        <span>댓글</span> <br>
        <span>제시카</span>
        <span><input type="text" value="댓글을 입력해 주세요."></span>
        <input type="checkbox" >비밀글 <input type="button" value="댓글작성">
    <br><br>
        <input type="button" value="신청하기">
        <input type="button" value="목록으로">
        <!-- 로그인시 --> <br><br>
        <input type="button" value="목록">
        <input type="button" value="수정">
        <input type="button" value="삭제">
        <input type="button" value="스터디완료">
    </div>
</body>
</html>