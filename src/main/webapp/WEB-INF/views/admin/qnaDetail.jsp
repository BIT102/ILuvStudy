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

        <div>* 기본정보</div>
        <table>
            <tr>
                <th>아이디</th>
                <td>asdf@naver.com</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>스터디 등록 문의</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>스터디 등록할때 보안 카테고리 추가해주세요.</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>2018-02-18</td>
            </tr>
            <tr>
                <th>답변여부</th>
                <td>답변완료</td>
            </tr>
            <tr>
                <th>공개여부</th>
                <td>공개</td>
            </tr>
        </table>

        <div>* 답변</div>
        <table>
            <tr>
                <th>답변내용</th>
                <td>
                    <textarea>
                        안녕하세요.고객님
                        요청하신 보안 카테고리 추가 완료하였습니다.
                        감사합니다.
                    </textarea>
                </td>
            </tr>
            <tr>
                <th>관리자 아이디</th>
                <td>admin123</td>
            </tr>
            <tr>
                <th>답변일</th>
                <td>2018-02-18</td>
            </tr>
        </table>

        <a type="button" href="qnaList">목록</a>
        <button>등록</button>
    </div>

</body>
</html>