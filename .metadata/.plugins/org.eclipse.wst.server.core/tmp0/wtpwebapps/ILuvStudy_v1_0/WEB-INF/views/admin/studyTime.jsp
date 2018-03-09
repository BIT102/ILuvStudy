<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>스터디 시간 추가</title>
    <style>
        table{
            border-collapse:collapse;
        }
        td,th{
            border:1px solid black;
        }
    </style>
</head>
<body>
    <a>스터디 시간 추가</a>

    <table>
        <tr>
            <th>요일</th>
            <td>
                <select>
                    <option>월요일</option>
                    <option>화요일</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>시작 시간</th>
            <td>
                <select>
                    <option>1시</option>
                    <option>2시</option>
                </select>
                <select>
                    <option>00분</option>
                    <option>10분</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>끝나는 시간</th>
            <td>
                <select>
                    <option>1시</option>
                    <option>2시</option>
                </select>
                <select>
                    <option>00분</option>
                    <option>10분</option>
                </select>                
            </td>
        </tr>
    </table>

    <button>시간 추가</button>
    
</body>
</html>