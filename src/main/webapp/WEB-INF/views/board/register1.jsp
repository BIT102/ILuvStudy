<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    
<!--스터디등록-->
    <form role="form" method="post">

        <!--첫번째 페이지-->
        <div class="register1">
            <!--제목입력-->
            <div class="studytitle"></div>
                <p>스터디명</p>
                <input type="text" placeholder="스터디명" name="bsTitle">
            </div>

              <!--쓴사람//value값수정-->
            <div class="studywriter">
                <p>쓴사람</p>
                <input type="text" placeholder="쓴사람" name="bsWriter" value="abc1@gmail.com">
            </div>

            <!--카테고리-->
            <div clas="stucycategory">
                <!--대분류-->
                <div class="CD">
                    <p>대분류</p>
                    <input type="checkbox" name="bsCategoryD" value="A">외국어
                    <input type="checkbox" name="bsCategoryD" value="B">IT
                    <input type="checkbox" name="bsCategoryD" value="C">라이프스타일
                    <input type="checkbox" name="bsCategoryD" value="D">취업
                </div>
                <!--소분류 외국어-->
                <div class="CSA">
                    <p>소분류</p>
                    <input type="checkbox" name="bsCategoryS" value="1">토익
                    <input type="checkbox" name="bsCategoryS" value="2">토플
                    <input type="checkbox" name="bsCategoryS" value="3">텝스
                    <input type="checkbox" name="bsCategoryS" value="4">토스/오픽
                    <input type="checkbox" name="bsCategoryS" value="5">회화
                    <input type="checkbox" name="bsCategoryS" value="6">작문/독해
                    <input type="checkbox" name="bsCategoryS" value="7">중국어
                    <input type="checkbox" name="bsCategoryS" value="8">일본어
                    <input type="checkbox" name="bsCategoryS" value="9">기타
                </div>
                
                <!-- 소분류IT -->
                <div class="CSB">
                    <p>소분류</p>
                    <input type="checkbox" name="bsCategoryS" value="1">컴퓨터언어
                    <input type="checkbox" name="bsCategoryS" value="2">웹프로그래밍
                    <input type="checkbox" name="bsCategoryS" value="3">모바일프로그래밍
                    <input type="checkbox" name="bsCategoryS" value="4">데이터베이스/서버
                    <input type="checkbox" name="bsCategoryS" value="5">게임프로그래밍
                    <input type="checkbox" name="bsCategoryS" value="6">문서작성
                    <input type="checkbox" name="bsCategoryS" value="7">자격증
                    <input type="checkbox" name="bsCategoryS" value="8">기타
                </div>
                
                <!-- 소분류라이프스타일 -->
                <div class="CSC">
                    <p>소분류</p>
                    <input type="checkbox" name="bsCategoryS" value="1">미술/디자인
                    <input type="checkbox" name="bsCategoryS" value="2">뷰티/미용
                    <input type="checkbox" name="bsCategoryS" value="3">스포츠
                    <input type="checkbox" name="bsCategoryS" value="4">음악/공연
                    <input type="checkbox" name="bsCategoryS" value="5">게임
                    <input type="checkbox" name="bsCategoryS" value="6">기타
                </div>
                
                <!-- 소분류취업 -->
                <div class="CSD">
                    <p>소분류</p>
                    <input type="checkbox" name="bsCategoryS" value="1">면접
                    <input type="checkbox" name="bsCategoryS" value="2">자소서
                    <input type="checkbox" name="bsCategoryS" value="3">고시
                    <input type="checkbox" name="bsCategoryS" value="4">기술
                    <input type="checkbox" name="bsCategoryS" value="5">기타
                </div>
            </div>    
        </div>    
        <!--두번째 페이지-->
        <div class="register2">
            <!--최대인원-->
            <div="studymax">
                <p>최대인원</p>
                <input type="number" name="bsMax">
            </div>
  
            <!--지역분류-->
            <div class="studyRegion">
                <!--대분류-->
                <div class="RD">
                    <p>지역대분류</p>
                    <select class="bsRDId" name="bsRDId">
                        <option value="A">서울</option>
                        <option value="B">경기도</option>
                        <option value="C">인천광역시</option>
                        <option value="D">세종틀별자치시</option>
                        <option value="E">강원도</option>
                        <option value="F">충청북도</option>
                        <option value="G">충청남도</option>
                        <option value="H">대전광역시</option>
                        <option value="I">대구광역시</option>
                        <option value="J">경상북도</option>
                        <option value="K">경상남도</option>
                        <option value="L">전라북도</option>
                        <option value="M">전라남도</option>
                        <option value="N">광주광역시</option>
                        <option value="O">부산광역시</option>
                        <option value="P">울산광역시</option>
                        <option value="Q">제주특별시</option>
                    </select>
                </div>
                <!--소분류//나중에추가하기-->
                <div class="RSP">
                    <p>지역소분류</p>
                    <select class="bsRSId" name="bsRSId">
                        <option value="1">남구</option>
                        <option value="2">동구</option>
                        <option value="3">북구</option>
                        <option value="4">울주군</option>
                        <option value="5">중구</option>
                    </select>    
                </div>
            </div>

            <!--연령-->
            <div class="studyage">
                <p>연령</p>
                <input type="checkbox" name="bsAge" value="10대">10대
                <input type="checkbox" name="bsAge" value="20대">20대
                <input type="checkbox" name="bsAge" value="30대">30대
                <input type="checkbox" name="bsAge" value="40대">40대
                <input type="checkbox" name="bsAge" value="50대">50대
                <input type="checkbox" name="bsAge" value="무관">무관
            </div>

            <!--요일별-->
            <div class="studysc">
                <p>요일</p>
                <select class="bsSc" name="bsSc">
                    <option>월요일</option>
                    <option value="화요일">화요일</option>
                    <option value="수요일">수요일</option>
                    <option value="목요일">목요일</option>
                    <option value="금요일">금요일</option>
                    <option value="토요일">토요일</option>
                    <option value="일요일">일요일</option>
                </select>
            </div>
			
			<!-- 시작날짜 -->
			<div class="studysd">
				<p>시작날짜</p>
				<input type="date" name="bsSd">
			</div>
            <!--시작시간//나중에추가하기-->
            <div class="studyst">
                <p>시작시간</p>
                <select class="bsSt" name="bsSt">
                    <option value="12:00">12:00</option>
                    <option value="13:00">13:00</option>
                    <option value="14:00">14:00</option>
                    <option value="16:00">15:00</option>
                </select>
            </div>

            <!--끝나는시간//나중에추가하기-->
            <div class="studyet">
                <p>끝나는시간</p>
                <select class="bsEt" name="bsEt">
                    <option value="12:00">12:00</option>
                    <option value="13:00">13:00</option>
                    <option value="14:00">14:00</option>
                    <option value="15:00">15:00</option>
                </select>
            </div>
        </div>
       
        <!--3번째 페이지-->
        <div class="register3">
            <!--내용-->
            <div class=studycontent>
                <p>추가글</p>
                <textarea name="bsContent" row="10"></textarea>
            </div>

            <!--파일첨부-->
            <div class="studyfile">
                <P>파일업로드</P>
                <input type="file">파일을 골라주세용
            </div>
        </div>
        
        <input type="submit" value="등록">
    </form>


</body>
</html>