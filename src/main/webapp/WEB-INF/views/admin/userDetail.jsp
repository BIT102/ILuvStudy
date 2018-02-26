<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원조회 상세</title>
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
        <a>회원조회 상세</a>
        
        <div>* 기본정보</div>
            <table>
                <tr>
                    <th>이메일 주소</th>
                    <td>asdf@naver.com</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" value="홍길동"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><input type="text" value="테스터"></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><input type="text" value="940916"></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td><input type="radio" name="thesex">남성  <input type="radio" name="thesex" checked="checked">여성</td>
                </tr>
                <tr>
                    <th>핸드폰 번호</th>
                    <td><input type="text" value="010">-<input type="text" value="1234">-<input type="text" value="5678"></td>
                </tr>
                <tr>
                    <th>가입 상태</th>
                    <td>회원</td>
                </tr>
                <tr>
                    <th>가입 경로</th>
                    <td>자체 회원가입</td>
                </tr>
                <tr>
                    <th>가입일</th>
                    <td>2018-01-10</td>
                </tr>
                <tr>
                    <th>이미지</th>
                    <td>이미지 경로 노출</td>
                </tr>
            </table>

        <button>비활성</button>

        <div>* 부가정보</div>
            <table>
                <tr>
                    <th>관심 카테고리</th>
                    <td>#IT <input type="checkbox">컴퓨터 언어<input type="checkbox">웹프로그래밍</td>
                </tr>
                <tr>
                    <th>관심 지역</th>
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
                    <th>자기소개</th>
                    <td><textarea>잘 부탁 드립니다.</textarea></td>
                </tr>
            </table>

        <button>수정</button>

        <div>* 북마크</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>스터디 시작일</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>자바 프로그래밍 스터디 모집합니다.</td>
                    <td>테스터123</td>
                    <td>서울 강남구</td>
                    <td>2018-02-25</td>
                </tr>
            </table>

        <div>* 모집</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>스터디 시작일</th>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        
        <div>* 신청</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>신청일</th>
                    <th>승인여부</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>자바 프로그래밍 스터디 모집합니다.</td>
                    <td>테스터123</td>
                    <td>서울 강남구</td>
                    <td>2018-02-17</td>
                    <td>미승인</td>
                </tr>
            </table>

        <div>* 완료</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>스터디 시작일</th>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>

        <a type="button" href="userList">목록</a>
    </div>

</body>
</html>