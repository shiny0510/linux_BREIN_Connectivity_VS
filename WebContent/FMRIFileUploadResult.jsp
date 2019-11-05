<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%

	// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	// 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	String uploadPath =  "/home/osh0510/Downloads/Uploadimages";
	System.out.println("path:"+uploadPath + "<br/>"); 
	
	int maxSize = 1024 * 1024 * 10000; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	String name = "";
	String subject = "";
	String fileName1 = ""; // 중복처리된 이름
	String originalName1 = ""; // 중복 처리전 실제 원본 이름
	long fileSize = 0; // 파일 사이즈
	String fileType = ""; // 파일 타입
	MultipartRequest multi = null;

	String lists;
	// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	multi = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR", new DefaultFileRenamePolicy());
	
	lists= multi.getParameter("flists");

	System.out.println("받음");
	System.out.println(lists);
	
	try {
		
		// form내의 input name="name" 인 녀석 value를 가져옴
		name = multi.getParameter("name");
		// name="subject" 인 녀석 value를 가져옴
		subject = multi.getParameter("subject");
		// 전송한 전체 파일이름들을 가져옴
		Enumeration files = multi.getFileNames();
		
		while (files.hasMoreElements()) {
			// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
			String file1 = (String) files.nextElement(); // 파일 input에 지정한 이름을 가져옴
			// 그에 해당하는 실재 파일 이름을 가져옴
			originalName1 = multi.getOriginalFileName(file1);
			
			System.out.println("리스트");
			System.out.println(originalName1);
			
			// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
			// 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
			fileName1 = multi.getFilesystemName(file1);
			// 파일 타입 정보를 가져옴
			fileType = multi.getContentType(file1);
			// input file name에 해당하는 실재 파일을 가져옴
			File file = multi.getFile(file1);
			// 그 파일 객체의 크기를 알아냄
			fileSize = file.length();
			System.out.println(originalName1);
		}
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
	
	
	var fname = '<%=lists%>';
	var ftype = '<%=fileType%>';
		
	
    var url = 'http://brein.korea.ac.kr/brainorigin/saf/FMRIFileDatabaseAddController?lists='+fname; 
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