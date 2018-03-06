<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>QNA 관리</title>
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
        <a>QNA 관리</a>
        
        <!--검색-->
        <table>
            <tr>
                <th>아이디</th>
                <td><input type="text"></td>
                <th>답변여부</th>
                <td>
                    <select>
                        <option>전체</option>
                        <option>답변</option>
                        <option>미답변</option>
                    </select>
                </td>
            </tr>

        </table>
        
        <button>검색</button>
        <button>초기화</button>
        

        <!--리스트-->
        <div>총 2건 1/1페이지</div>

        <table>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>제목</th>
                <th>공개여부</th>
                <th>답변여부</th>
                <th>작성일</th>
            </tr>
            <tr>
                <td>1</td>
                <td>asdf@naver.com</td>
                <td><a href="qnaDetail">스터디 등록 문의</a></td>
                <td>공개</td>
                <td>답변</td>
                <td>2018-02-18</td>
            </tr>
            <tr>
                <td>2</td>
                <td>asdf@naver.com</td>
                <td>스터디 완료 문의</td>
                <td>비공개</td>
                <td>미답변</td>
                <td>2018-02-20</td>
            </tr>
        </table>
    </div>

</body>
</html>