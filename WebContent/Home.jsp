<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<!DOCTYPE html>
<html>
<head>
<script>
$(document).ready(function(){
	$(".td2").mouseover(function(){
		$(this).attr("style","background-color:yellow");
	});
	$(".td2").mouseout(function(){
		$(this).attr("style","background-color:white");
	});
	$("#logout").click(function(){
		location.href="${pageContext.request.contextPath }/logoutMemberController";
	});
});

</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty sessionScope.id}">
<td class=td2 style="" value="6">로그인</td>
</c:if>
<c:if test="${not empty sessionScope.id}">
<td style="width:100px">
<table>
<tr><td colspan="2" >${sessionScope.id }님 환영합니다.</td>
<c:if test="${sessionScope.type==2}">
<tr><td colspan="2">${sessionScope.area}지점</td><tr>
</c:if>
<tr>
<tr>
<td><input type="image" id="imgButton" style="position:relative;top:2px;width:70px;height:25px;" src="${pageContext.request.contextPath }/img/1.png"></td>
<td><input type="button" id="logout" value="logout" style="width:70px;height:30px"></td>
</tr>
</table>
</td>
</c:if>
</body>
</html>