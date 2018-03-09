<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>스터디 상세</title>
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
        <a>스터디 상세</a>
        
        <div>* 기본정보</div>
        <table>
            <tr>
                <th>스터디 번호</th>
                <td>1</td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td>#IT <input type="checkbox">컴퓨터 언어<input type="checkbox">웹프로그래밍</td>
            </tr>
            <tr>
                <th>스터디명</th>
                <td><input type="text" value="자바 프로그래밍 스터디 모집합니다."></td>
            </tr>
            <tr>
                <th>지역</th>
                <td>
                    <select>
                        <option>전체</option>
                        <option>서울</option>
                    </select>
                    <select>
                        <option>전체</option>
                        <option>강남구</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td>2018-02-10</td>
            </tr>
            <tr>
                <th>스터디 방장</th>
                <td>ID: aaa123@naver.com  닉네임: 테스터123</td>
            </tr>
            <tr>
                <th>스터디 상태</th>
                <td>모집중</td>
            </tr>
        </table>

        <div>* 상세정보</div>
        <table>
            <tr>
                <th>연령</th>
                <td><input type="checkbox">10대 <input type="checkbox">20대 <input type="checkbox">무관</td>
            </tr>
            <tr>
                <th>시작날짜</th>
                <td><input type="text" value="2018-02-25"></td>
            </tr>
            <tr>
                <th>시간</th>
                <td>
                    월요일 1시 00분 ~ 2시 00분  <a>X</a><br>
                    수요일 1시 00분 ~ 2시 00분  <a>X</a><br>
                    <a href="studyTime">추가</a>
                </td>
            </tr>
            <tr>
                <th>최대인원</th>
                <td><input type="text" value="8"></td>
            </tr>
            <tr>
                <th>완료일</th>
                <td></td>
            </tr>
        </table>

        <div>* 소개</div>
        <table>
            <tr>
                <th>스터디 소개</th>
                <td><textarea>같이 스터디 해요.</textarea></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td>이미지 경로 노출</td>
            </tr>
        </table>

        <button>수정</button>

        <div>* 신청자</div>
        <table>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>닉네임</th>
                <th>신청일</th>
                <th>승인여부</th>
            </tr>
            <tr>
                <td>1</td>
                <td>asdf@naver.com</td>
                <td>홍길동</td>
                <td>2018-02-17</td>
                <td>미승인</td>
            </tr>
        </table>

        <a type="button" href="studyList">목록</a>
    </div>

</body>
</html>