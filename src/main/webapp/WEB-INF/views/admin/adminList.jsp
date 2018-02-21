<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        
        <!--검색-->
        <table>
            <tr>
                <th>아이디</th>
                <td><input type="text"></td>
                <th>이름</th>
                <td><input type="text"></td>
            </tr>

        </table>
        
        <button>검색</button>
        <button>초기화</button>
        

        <!--리스트-->
        <div>총 1건 1/1페이지</div>

        <table>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>사용여부</th>
                <th>최근 접속정보</th>
            </tr>
            
<c:forEach items="${list}" var="adminVO">
            <tr>
                <td>${adminVO.bno}</td>
                <td><a href="/admin/adminDetail?bno=${adminVO.bno}">${adminVO.adminid}</a></td>
                <td>${adminVO.name}</td>
                <td>${adminVO.status}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${adminVO.lastLoginDate}"/></td>
            </tr>
</c:forEach>
        </table>

        <a href="adminRegister">등록</a>
    </div>

</body>
</html>