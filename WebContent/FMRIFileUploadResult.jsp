<%
	String id = request.getParameter("id");
	String pname = request.getParameter("pname");
	String pwd = request.getParameter("pwd");
	String pnum = request.getParameter("pnum");
%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%

	// request.getRealPath("�����") �� ���� ������ ������ ���� ��θ� ���ؿ´�.
	// �ü�� �� ������Ʈ�� ��ġ�� ȯ�濡 ���� ��ΰ� �ٸ��� ������ �Ʒ�ó�� ���ؿ��°� ����
   String uploadPath =  "/home/osh0510/WebDatabase/"+id+"/"+pname;
	System.out.println("path:"+uploadPath + "<br/>"); 
	
	int maxSize = 1024 * 1024 * 10000; // �ѹ��� �ø� �� �ִ� ���� �뷮 : 10M�� ����
	String name = "";
	String subject = "";
	String fileName1 = ""; // �ߺ�ó���� �̸�
	String originalName1 = ""; // �ߺ� ó���� ���� ���� �̸�
	long fileSize = 0; // ���� ������
	String fileType = ""; // ���� Ÿ��
	MultipartRequest multi = null;

	String lists;
	// request,����������,�뷮,���ڵ�Ÿ��,�ߺ����ϸ� ���� �⺻ ��å
	multi = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR", new DefaultFileRenamePolicy());
	
	lists= multi.getParameter("flists");

	System.out.println("����");
	System.out.println(lists);
	
	try {
		
		// form���� input name="name" �� �༮ value�� ������
		name = multi.getParameter("name");
		// name="subject" �� �༮ value�� ������
		subject = multi.getParameter("subject");
		// ������ ��ü �����̸����� ������
		Enumeration files = multi.getFileNames();
		
		while (files.hasMoreElements()) {
			// form �±׿��� <input type="file" name="���⿡ ������ �̸�" />�� �����´�.
			String file1 = (String) files.nextElement(); // ���� input�� ������ �̸��� ������
			// �׿� �ش��ϴ� ���� ���� �̸��� ������
			originalName1 = multi.getOriginalFileName(file1);
			
			System.out.println("����Ʈ");
			System.out.println(originalName1);
			
			// ���ϸ��� �ߺ��� ��� �ߺ� ��å�� ���� �ڿ� 1,2,3 ó�� �پ� unique�ϰ� ���ϸ��� �����ϴµ�
			// �̶� ������ �̸��� filesystemName�̶� �Ͽ� �� �̸� ������ �����´�.(�ߺ��� ���� ó��)
			fileName1 = multi.getFilesystemName(file1);
			// ���� Ÿ�� ������ ������
			fileType = multi.getContentType(file1);
			// input file name�� �ش��ϴ� ���� ������ ������
			File file = multi.getFile(file1);
			// �� ���� ��ü�� ũ�⸦ �˾Ƴ�
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
		
	
    var url = 'http://brein.korea.ac.kr/brainorigin/saf/FMRIFileDatabaseAddController?lists='+fname+'&pname=<%=pname%>&id=<%=id%>&pnum=<%=pnum%>';  
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