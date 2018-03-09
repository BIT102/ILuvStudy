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
        
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" value="오픈 공지"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>admin123</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea>
                        안녕하세요.
                        사이트 오픈 기념 이벤트 진행예정입니다.
                        자세한 내용은 추후 공지하겠습니다.
                        감사합니다.
                    </textarea>
                </td>
            </tr>
            <tr>
                <th>공개여부</th>
                <td><input type="radio" name="check">공개  <input type="radio" name="check">비공개</td>
            </tr>
            <tr>
                <th>등록일</th>
                <td>2018-02-03 14:52</td>
            </tr>
            <tr>
                <th>최종 수정일</th>
                <td>2018-02-03 14:52</td>
            </tr>
        </table>

        <a href="noticeList">목록</a>
        <button>수정</button>
    </div>

</body>
</html>