<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


	
<%
	// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	// 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	//String uploadPath = request.getRealPath("/ClientUpload");
	
	String uploadPath = "C:/Users/Oh Seung Hwan/git/BREIN_ROI/ObJMesh/WebContent/txt";
	/* out.println("절대경로 : " + uploadPath + "<br/>"); */
String str = request.getParameter(fileName);
out.println("value: " + str);
System.out.println("확인");

	int maxSize = 1024 * 1024 * 100; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한

	String name = "";
	String subject = "";

	String fileName1 = ""; // 중복처리된 이름
	String originalName1 = ""; // 중복 처리전 실제 원본 이름
	long fileSize = 0; // 파일 사이즈
	String fileType = ""; // 파일 타입

	MultipartRequest multi = null;

	try {
		// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
		multi = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR", new DefaultFileRenamePolicy());

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<script>
	
	
	var fname = '<%=originalName1%>';
	var ftype = '<%=fileType%>';
		
	alert(fname);

    var url = '${pageContext.request.contextPath }/FileDatabaseAddController?fname1=' + encodeURI(fname); 
	window.location.href = url;    
	</script> 
	
		
<%--  	<form class="fpath-form" name="f" action="${pageContext.request.contextPath }/FileDatabaseAddController?fname1=fname" method="post">
	<input type="hidden" name="fname1" value=""> 
	<button style="opacity: 0;" id="chk2" name = "fpath1" value=""></button>
	</form>
	<script>
		chk2.click();
	</script>  --%>
</body>
</html>