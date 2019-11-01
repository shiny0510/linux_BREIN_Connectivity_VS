<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
String uploadPath = "C:/Users/Oh Seung Hwan/git/BREIN_ROI/ObJMesh/WebContent";
int maxSize = 1024 * 1024 * 10000; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한

/*  String a = request.getParameter("t1f"); 
 System.out.println(a);	
 String[] a2 = a.split(",");

 for (int i=0; i< a2.length; i++){
 String decoa2 = a2[i].substring(0,a2[i].length()-7);
 String path = uploadPath + "/" + decoa2; //폴더 경로
	File Folder = new File(path);

	// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
	if (!Folder.exists()) {
		try{
		    Folder.mkdir(); //폴더 생성합니다.
		    System.out.println("폴더가 생성되었습니다.");
	        } 
	        catch(Exception e){
		    e.getStackTrace();
		}        
      }else {
		System.out.println("이미 폴더가 생성되어 있습니다.");
	}
 } 
 
System.out.println(a2[1]);  */

System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
	// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	// 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	//String uploadPath = request.getRealPath("/ClientUpload");
	/* out.println("절대경로 : " + uploadPath + "<br/>"); */

	String name = "";
	String subject = "";
	String fileName1 = ""; // 중복처리된 이름
	String originalName1 = ""; // 중복 처리전 실제 원본 이름
	long fileSize = 0; // 파일 사이즈
	String fileType = ""; // 파일 타입
	MultipartRequest multi = null;

	multi = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR", new DefaultFileRenamePolicy());	

	String id = multi.getParameter("name"); 

	System.out.println(id);
	
	try {
		// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	
		// form내의 input name="name" 인 녀석 value를 가져옴
		name = multi.getParameter("name");
				
		// name="subject" 인 녀석 value를 가져옴
		subject = multi.getParameter("subject");		
		
		// 전송한 전체 파일이름들을 가져옴
		Enumeration files = multi.getFileNames();
		String query="";		
		
		while (files.hasMoreElements()) {
			 
			// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
			String file1 = (String) files.nextElement(); // 파일 input에 지정한 이름을 가져옴
			// 그에 해당하는 실재 파일 이름을 가져옴
			originalName1 = multi.getOriginalFileName(file1);
			// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
			// 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
			fileName1 = multi.getFilesystemName(file1);
			
			// 파일 타입 정보를 가져옴
			fileType = multi.getContentType(file1);
			// input file name에 해당하는 실재 파일을 가져옴
			File file = multi.getFile(file1);
			// 그 파일 객체의 크기를 알아냄
			fileSize = file.length();
			
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