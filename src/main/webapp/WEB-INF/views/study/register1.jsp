<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="test.css">

<style>
    .one{
        background-color: gray;
    }
</style>


</head>
<body>

<form role='form' method='post'>
        <!--HEADER 목록
    <div class='header'>
        <div class='one'>기본정보</div>
        <div class='two'>상세정보</div>
        <div class='three'>소개</div>
        </div>-->

	
    <!--section 이전스터디
    <div class='section'>
            <p>이전스터디불러오기</p>
            <select class='dplace'>
                    <option value='이전스터디'>이전스터디</option>
            </select><br>
            <select class = 'prestudy'>
                <option vlaue='1'>권한길</option>
                <option vlaue='2'>김소희</option>
            </select>     
        </div>    
    </div>-->
쓴사람 
<input type='text' name='writer' value="abc1@gmail.com">
	

    <!--section2 외국어 it 라이프스타일 취업-->
    <div class='section2'>
        <button type='button' class='language' name='categoryD' value="A">
            외국어</button>
        <button type='button'class='it' name='categoryD' value="B">
            IT</button>
        <button type='button'class='life' name='categoryD' value="C">
            라이프스타일</button>
        <button type='button'class='job' name='categoryD' value="D">
    	    취업</button>
</div>
<!--클릭시 생성-->
<!--외국어-->
    <div class='languagecheck' id="00">
      <input type='checkbox' name="categoryS" value="1">하하
        <input type='checkbox' name="categoryS" value="1">하하
        <input type='checkbox' name="categoryS" value="1">하하
        <input type='checkbox' name="categoryS" value="1">하하
        <input type='checkbox' name="categoryS" value="1">하하
        <input type='checkbox' name="categoryS" value="1">하하
    </div>
<!--it-->
    <div class='itcheck' id="01">
        <input type='checkbox'  name="categoryS" value="1">호호
          <input type='checkbox'  name="categoryS" value="1">호호
          <input type='checkbox'  name="categoryS" value="1">호호
          <input type='checkbox' name="categoryS" value="1">호호
          <input type='checkbox' name="categoryS" value="1">호호
          <input type='checkbox' name="categoryS" value="1">호호
    </div>
<!--스터디명-->
<div class='selction3'>
<div class='studytitle'>
    <p>스터디명</p>
    <input type='text' name='title' value="${StudyVO.title}">
</div>
<!--지역-->
<div class='place'>
    <p>지역</p>
    <select class='dplace'>
            <option name='rDId' value="A">서울</option>
            <option name='rDId' value="B">경기도</option>
            <option name='rDId' value="C">인천광역시</option>
    </select>

    <select class='splace'>
            <option name='rSId' value="1">강남구</option>
            <option name='rSId' value="1">가평군</option>
            <option name='rSId' value="1">광화군</option>
    </select>
</div>
</div>

            <!--section-->
            <div class = 'section'>
                <!--연령-->
                <div class='age'>
                    <p>연령</p>
                    <input type='checkbox' name='age' value='10대'>10대
                    <input type='checkbox' name='age' value='20대'>20대
                    <input type='checkbox' name='age' value='30대'>30대
                    <input type='checkbox' name='age' value='40대'>40대
            </div>
               <!--시작날짜-->
            <div class="startdate">
                    <p>시작날짜</p>
                    <input type='date' name='sc' value="${StudyVO.sc}">
            </div>
            <!--시작요일-->
            <div class='selectdate'>
                <p>시작요일</p>
                <select class='date'>
                        <option name='sd' value='월요일'>월요일</option>
                        <option name='sd' value='화요일'>화요일</option>
                        <option name='sd' value='수요일'>수요일</option>
                </select><br>
                 <!--시작시간-->
                <p>시작시간</p>
                <select class='starthour'>
                        <option name='st' value='1'>1</option>
                        <option name='st' value='2'>2</option>
                        <option name='st' value='3'>3</option>
                 </select><br>
                 <!--끝나는시간-->
                <p>끝나는시간</p>
                <select class='exhour'>
                        <option name='et' value='1'>1</option>
                        <option name='et' value='2'>2</option>
                        <option name='et' value='3'>3</option>
                </select>
                <!--최대인원-->
                <div class='maxnum'>
                    <p>최대인원</p>
                    <input type='number' name='max' value='${StudyVO.max}'>
                </div>
         
            </div>
        </div>

<!--section 파일업로드-->
            <div class='section'>

                <div class="content">
                    <textarea name='content' row='10' value="${StudyVO.content}"></textarea>
                </div>

                <div class='fileup'>
                    <input type='file'>파일을 골라주세용
                </div>
            </div>

<div class="move">
       <input type='submit' value='종료'>
</div>

</form>

</body>
</html>