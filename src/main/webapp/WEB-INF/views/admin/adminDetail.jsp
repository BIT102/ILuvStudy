<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>

</head>
<body>
<%@ include file="nav.jsp" %>

    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="adminList">계정관리</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>계정 관리</a>

        <table>
            <tr>
                <th>아이디</th>
                <td>test123</td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" value="김소희"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th>사용여부</th>
                <td><input type="radio" name="check">사용   <input type="radio" name="check">미사용</td>
            </tr>
            <tr>
                <th>최근 접속일</th>
                <td>2018-02-16 17:50:22</td>
            </tr>
        </table>
        
        <a href="adminList">목록</a>
        <button>수정</button>

    </div>

</body>
</html>