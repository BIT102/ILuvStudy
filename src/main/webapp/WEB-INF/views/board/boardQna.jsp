<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- n 검색조건이 없음 
	 t 제목으로 검색
	 c 내용으로 검색
	 w 작성자로 검색
	 tc 제목이나 내용으로 검색
	 cw 내용이나 작성자로 검색
	 tcw 제목이나 내용 혹은 작성자로 검색-->
	 <div>
	<select name="searchType">  
		<option value="n"
			<c:out value="${crisearchType == null?'selected':''}"/>>
		---</option>
		<option value="t"
			<c:out value="${crisearchType == null?'selected':''}"/>>
		Title</option>
		<option value="c"
			<c:out value="${crisearchType == null?'selected':''}"/>>
		Content</option>
		<option value="w"
			<c:out value="${crisearchType == null?'selected':''}"/>>
		Writer</option>
		<option value="tc"
			<c:out value="${crisearchType == null?'selected':''}"/>>
		Title OR Content</option>
		<option value="cw"
			<c:out value="${crisearchType == null?'selected':''}"/>>
		Title OR Writer</option>
		<option value="tcw"
			<c:out value="${crisearchType == null?'selected':''}"/>>
		Title OR Content OR Writer</option>
	</select>
	 </div>
</body>
</html>