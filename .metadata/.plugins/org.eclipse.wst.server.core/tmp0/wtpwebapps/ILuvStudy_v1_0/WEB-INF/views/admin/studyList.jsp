<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>스터디 목록</title>
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
        <a>스터디 목록</a>
        
        <!--검색-->
        <table>
            <tr>
                <th>카테고리</th>
                <td>
                    <select>
                        <option>전체</option>
                    </select>
                    <select>
                        <option>전체</option>
                    </select>
                </td>
                <th>스터디상태</th>
                <td>
                    <select>
                        <option>전체</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>스터디명</th>
                <td><input type="text"></td>
                <th>스터디방장</th>
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
                <th>스터디명</th>
                <th>스터디방장</th>
                <th>지역</th>
                <th>스터디 상태</th>
                <th>스터디 시작일</th>
                <th>조회 수</th>
            </tr>
            <tr>
                <td>1</td>
                <td><a href="studyDetail">자바 프로그래밍 스터디 모집합니다.</a></td>
                <td>테스터j123</td>
                <td>서울 강남구</td>
                <td>모집중</td>
                <td>2018-02-25</td>
                <td>50</td>
            </tr>
            <tr>
                <td>2</td>
                <td>AWS 공부하실분</td>
                <td>서울대생임</td>
                <td>서울 전체</td>
                <td>모집중</td>
                <td>2018-03-01</td>
                <td>10</td>
            </tr>
        </table>
    </div>

</body>
</html>