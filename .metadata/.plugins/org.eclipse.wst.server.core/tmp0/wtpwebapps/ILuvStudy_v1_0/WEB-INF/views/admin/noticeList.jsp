<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항 등록</title>
</head>
<body>
<%@ include file="nav.jsp" %>
    
    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="qnaList">QNA 관리</a>
        </div>
        <div class="border">
            <a href="noticeList">공지사항 등록</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>공지사항 등록</a>
        
        <!--검색-->
        <table>
            <tr>
                <th>공지내용</th>
                <td><input type="text"></td>
                <th>공개여부</th>
                <td>
                    <select>
                        <option>전체</option>
                        <option>공개</option>
                        <option>비공개</option>
                    </select>
                </td>
            </tr>

        </table>
        
        <button>검색</button>
        <button>초기화</button>
        

        <!--리스트-->
        <div>총 1건 1/1페이지</div>

        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>공개여부</th>
                <th>작성일</th>
            </tr>
            <tr>
                <td>1</td>
                <td><a href="noticeDetail">오픈 공지</a></td>
                <td>admin123</td>
                <td>공개</td>
                <td>2018-02-03 14:52</td>
            </tr>
        </table>

        <a href="noticeRegister">등록</a>
    </div>

</body>
</html>