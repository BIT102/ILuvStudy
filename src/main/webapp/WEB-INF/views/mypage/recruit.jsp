<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>모집 스터디</title>
    <style>
    .border{border:2px solid grey; }
    .basic{width:300px; height:50px; float:left; text-align: center;}
    
    .profile{width:150px; height:50px;}
   
    #div1{display:inline-block;}    
    #div2{text-align: center;}
    #div2 div{float:left; }
    body{height:800px; width:1000px;}
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

    #table1{
        width:100%;
        border-collapse:collapse;
        text-align:center;
    }
    tr,th,td{
        border:1px solid black;
    }


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
                    <a href="bookmark">북마크</a></div>
            <div class="profile border">
                    <a href="recruit">모집</a></div>
            <div class="profile border">
                    <a href="application">신청</a></div>
            <div class="profile border">
                    <a href="completed">완료</a></div>
    
        </div>   
    <br>
    <br>
    <br>     
    
    <h4>북마크</h4>


    <table id="table1">
            <tr>
                <th> 번호</th>
                <th> 스터디명 </th>
                <th> 신청자 목록</th>
                <th> 사진 </th>
                <th> 주최자 </th>
                <th> 지역 </th>
                <th> 스터디 시작일</th>
                <th> 즐겨찾기 수</th>
                <th> 조회수</th>
            </tr>
            <tr>
                <td>1</td>
                <td><a href="#">JAVA 스터디 모집해요</a></td>
                <td><button type="button">신청자 보기 </button></td>
                <td><img src="/resources/dist/img/th.jpg" alt="김태희" width="100" height="100"></td>
                <td>김태희</td>
                <td>서울시 강남구</td>
                <td>2018-02-21</td>
                <td> 5 </td>
                <td> 70 </td>
            </tr>
            <tr>
                <td>2</td>
                <td><a href="#">SPRING 스터디 모집해요</a></td>
                <td><button type="button">신청자 보기 </button></td>
                <td><img src="/resources/dist/img/yj.png" alt="손예진" width="100"></td>
                <td>손예진</td>
                <td>서울시 서초구</td>
                <td>2018-04-21</td>
                <td> 7 </td>
                <td> 150 </td>
            </tr>

    </table>        
    
   
    

    
</body>
 

</html>