<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원조회</title>
</head>
<body>
<%@ include file="nav.jsp" %>

    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="userList">회원조회</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>회원조회</a>
        
        <!--검색-->
        <table>
            <tr>
                <th>가입 상태</th>
                <td colspan="3">
                    <select>
                        <option>전체</option>
                        <option>회원</option>
                        <option>비활성</option>
                        <option>탈퇴</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>아이디</th>
                <td><input type="text"></td>
                <th>닉네임</th>
                <td><input type="text"></td>
            </tr>
        </table>

        <button>검색</button>
        <button>초기화</button>

        <!--리스트-->
        <div>총 3건 1/1페이지</div>
        <table>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>핸드폰번호</th>
                <th>가입 상태</th>
                <th>가입일</th>
            </tr>
            <tr>
                <td>1</td>
                <td><a href="userDetail">asdf@naver.com</a></td>
                <td>홍길동</td>
                <td>테스터</td>
                <td>010-1234-5678</td>
                <td>회원</td>
                <td>2018-01-10</td>
            </tr>
        </table>

    </div>

</body>
</html>