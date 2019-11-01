<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="icon.css" />
<!DOCTYPE HTML>
<html>
<head>
<meta charset=EUC-KR">
<title>파일 업로드</title>
<style>
.ubutton label {
	position: relative;
	display: inline-block;
	cursor: pointer;
	margin: 0.5em;
	padding: 0.6em 25px .6em 33px;
	position: relative;
	text-align: center;
	font: 1em/100% Arial, Helvetica, sans-serif;
	text-decoration: none;
	vertical-align: baseline;
	outline: none;
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-moz-box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/  			
		rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	-webkit-box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/  		
		rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/  				
		rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	border: 1px solid #ccc /*{d-bup-border}*/;
	background: #fff /*{d-bup-background-color}*/;
	font-weight: bold;
	color: #444 /*{d-bup-color}*/;
	text-shadow: 0 /*{d-bup-shadow-x}*/ 1px /*{d-bup-shadow-y}*/ 1px
		/*{d-bup-shadow-radius}*/ #fff /*{d-bup-shadow-color}*/;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#fff /*{d-bup-background-end}*/)); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* Chrome 10+, Saf5.1+ */
	background-image: -moz-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* FF3.6 */
	background-image: -ms-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* IE10 */
	background-image: -o-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* Opera 11.10+ */
	background-image: linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff',
		endColorstr='#ffffff', GradientType=0); /* IE6-8 */
}

.ubutton input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
}

.ubutton input[type="button"] { /* 파일 필드 숨기기 */
	position: absolute;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
}

.title1 {
	font-weight: bold;
	font: 2em/100% Arial, Helvetica, sans-serif;
}

.tcol {
	font: 1em/100% Arial, Helvetica, sans-serif;
}
</style>
</head>
<body>
<script>
var fileValue = $("#file1").val().split("\\");
var fileName = fileValue[fileValue.length-1];
alert(fileName);
</script>
<table style='width:100%; height:80px; '>
		<tr style='background-color: #eaf8ff; '>
			<td class='title1'>
				<a> NIFTI File Upload </a>
			</td>
		</tr>
	</table>
<form action="FileUploadResult.jsp" method="post" enctype="multipart/form-data">
		<table>
			<td><div class="ubutton">
					<label for="uploadfile">업로드</label><input multiple="multiple" type="file" id="uploadfile" name="file1">
					<label for="uploadfile">업로드2</label><input multiple="multiple" type="file" id="uploadfile1" name="file2">
				</div></td>
					<td colspan="2"><input class="button white" type="submit" value="제출"> <input class="button white" type="reset" value="새로고침"></td>
			</tr>
		</table>
			<form action="${pageContext.request.contextPath }/ViewerController" method="post" >
						<table style="width: 70%">
				<tr style="height: 30px; width: 100px; background-color: #86c5e3;">
								<th>파일번호</th>
								<th>등록자</th>
								<th>파일이름</th>
								<th>등록일</th>
								<th>처리상태</th>
							</tr>
							<!-- movieBoardListcontroller -->
							<c:forEach items="${list}" var="list" varStatus="status">
							<%-- <c:forEach begin="${list.index}" end ="${list.index }" items="${listfnameNull}" var="listfnameNull"> --%>
								<c:if test="${list.fname != null }">
									<tr style="text-align: center">
										<td>${list.fnum}</td>
										<td id="id">${list.id}</td>
										<td><a href=${pageContext.request.contextPath }/ViewerController?fnum=${list.fnum } id="fname">${list.fname }</a></td>
										<td id="fdate">${list.fdate }</td>
										<td id="listfnameNull">${listfnameNull[status.index].fileNull}</td>
									</tr>
								</c:if>
							</c:forEach>
						<%-- 	</c:forEach> --%>
						</table>
			</form>
		</form>
		<div class="ubutton">
					<label for="tpage">T1 업로드</label><input id="tpage" type="button" name="tpage" onclick="location.href = 'ClientFileUploadPageT1.jsp'" >
					<label for="fpage">FMRI 업로드</label><input id="fpage" type="button" onclick="location.href = 'ClientFileUploadPageFMRI.jsp'" >
					<label for="fpage">파일체크</label><input id="fpage" type="button" onclick="location.href = 'ClientFileUploadPageFMRI.jsp'" >		
					<label for="fpage">전처리</label><input id="fpage" type="button" onclick="location.href = 'ClientFileUploadPageFMRI.jsp'" >			
		</div>
		
		<table>
		<tr>
		<td>
		<input type='text' name='textbox1' style='height:300px; width:300px;'>
		</td>
		<td>
		<input type='text' name='textbox2' style='height:300px; width:300px;'>
		</td>
	</tr>

</table>		
<form action="FileUploadResult.jsp" method="post" enctype="multipart/form-data">
<table>
			<td><div class="ubutton">
					<label for="uploadfile">업로드</label><input type="file"
id="uploadfile" name="file1">
				</div></td>
					<td colspan="2"><input class="button white" type="submit" value="제출"> <input class="button white" type="reset" value="새로고침"></td>
			</tr>
		</table>
			<form action="${pageContext.request.contextPath }/ViewerController" method="post" >
						<table style="width: 70%">
				<tr style="height: 30px; width: 100px; background-color: #86c5e3;">
								<th>파일번호</th>
								<th>등록자</th>
								<th>파일이름</th>
								<th>등록일</th>
								<th>처리상태</th>
							</tr>
							<!-- movieBoardListcontroller -->
							<c:forEach items="${list}" var="list" varStatus="status">
							<%-- <c:forEach begin="${list.index}" end ="${list.index }" items="${listfnameNull}" var="listfnameNull"> --%>
								<c:if test="${list.fname != null }">
									<tr style="text-align: center">
										<td>${list.fnum}</td>
										<td id="id">${list.id}</td>
										<td><a href=${pageContext.request.contextPath }/ViewerController?fnum=${list.fnum } id="fname">${list.fname }</a></td>
										<td id="fdate">${list.fdate }</td>
										<td id="listfnameNull">${listfnameNull[status.index].fileNull}</td>
									</tr>
								</c:if>
							</c:forEach>
						<%-- 	</c:forEach> --%>
						</table>
		</form>
		</form>
		
		
		
</body>
</html>