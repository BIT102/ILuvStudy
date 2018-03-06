<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>댓글 관리</title>
</head>
<body>
<%@ include file="nav.jsp" %>

    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="studyList">스터디 목록</a>
        </div>
        <div class="border">
            <a href="replyList">댓글 관리</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>댓글 관리</a>
        
        <!--검색-->
        <table>
            <tr>
                <th>스터디 번호</th>
                <td><input type="text"></td>
                <th>작성자</th>
                <td><input type="text"></td>
            </tr>

        </table>

        <button>검색</button>
        <button>초기화</button>
        

        <!--리스트-->
        <div>총 2건 1/1페이지</div>

        <table>
            <tr>
                <th>스터디 번호</th>
                <th>작성자</th>
                <th>댓글 내용</th>
                <th>비밀글</th>
                <th>작성일</th>
            </tr>
            <tr>
                <td>1</td>
                <td>테스터</td>
                <td>스터디 신청해요</td>
                <td>비밀글</td>
                <td>2018-02-18</td>
            </tr>
            <tr>
                <td>1</td>
                <td>테스터123</td>
                <td>스터디 마감합니다.</td>
                <td>공개글</td>
                <td>2018-02-20</td>
            </tr>
        </table>
    </div>

</body>
</html>