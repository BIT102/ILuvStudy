<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="test.css">

    <style>
            .two{
                background-color: gray;
            }
        </style>
        

</head>
<body>
            <!--HEADER 목록-->
            <div class='header'>
                    <div class='one'>기본정보</div>
                    <div class='two'>상세정보</div>
                    <div class='three'>소개</div>
                </div>

            <!--section-->
            <div class = 'section'>
                <!--연령-->
                <div class='age'>
                    <p>연령</p>
                    <input type='checkbox'>10대
                    <input type='checkbox'>20대
                    <input type='checkbox'>30대
                    <input type='checkbox'>40대
            </div>
               <!--시작날짜-->
            <div class="startdate">
                    <p>시작날짜</p>
                    <input type='date'>
            </div>
            <!--시작요일-->
            <div class='selectdate'>
                <p>시작요일</p>
                <select class='date'>
                        <option value='월'>월</option>
                        <option value='화'>화</option>
                        <option value='수'>수</option>
                </select><br>
                 <!--시작시간-->
                <p>시작시간</p>
                <select class='starthour'>
                        <option value='1'>1</option>
                        <option value='2'>2</option>
                        <option value='3'>3</option>
                 </select><br>
                 <!--끝나는시간-->
                <p>끝나는시간</p>
                <select class='exhour'>
                        <option value='1'>1</option>
                        <option value='2'>2</option>
                        <option value='3'>3</option>
                </select>
                <!--최대인원-->
                <div class='maxnum'>
                    <p>최대인원</p>
                    <input type='number' value='최대인원'>
                </div>
         
            </div>
        </div>

        <div class="move">
                <div class='next'><a href="http://localhost:8080/study/register3" >다음</a></div>
                <div class='pre'><a href="http://localhost:8080/study/register1" >이전</a></div>
            </div>
</body>
</html>