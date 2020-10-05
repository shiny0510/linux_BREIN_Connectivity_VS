<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script src="jquery/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="icon.css" />
<%
	String id = request.getParameter("aid");
	String pwd = request.getParameter("apwd");
	String pname = request.getParameter("pname");
	String pnum = request.getParameter("pnum");
	System.out.println(pname);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset=EUC-KR">
<title>File Upload</title>
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

.ubuttona form {
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

.ubutton a {
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

.ubutton button {
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
	overflow:;
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
<script>

$(document).ready( function() {
    $("input[type=file]").change(function () {
         
        var fileInput = document.getElementById("uploadfile");
         
        var files = fileInput.files;
        var file;
        var bowl ="";
        var fileslist = "";
        for (var i = 0; i < files.length; i++) {           
            file = files[i];
  			var str = file.name;
  			str = String(str);
  			var bowl = bowl + str + "\n";
  			var fileslist = fileslist + str+"!"; 
        }
        jQuery('#files').val(bowl);
        jQuery('#filesList').val(fileslist);
    });
    
});
	function logview() {
		var lhc_xhr;
		lhc_xhr = new XMLHttpRequest();
		var path = window.location.pathname;
		var index1 = index.split(",");		
		var index2 = index1[0].split("  ");		
		
		var valueByid = $('input[name=Processvalue1]:checked').val();
		if($('input[name=Processvalue1]:checked').val()==1 & $('input[name=Processvalue2]:checked').val()==1){
			alert("Structure or Functional 1 Check")
		}else{
			if($('input[name=Processvalue1]:checked').val()==1 | $('input[name=Processvalue2]:checked').val()==1){
				if($('input[name=Processvalue1]:checked').val()==1){
					alert("SC");
				lhc_xhr.open("get", "logtext/" + index2[0] + "_log_sc.txt",
						true);
				}
				
				if($('input[name=Processvalue2]:checked').val()==1){
					alert("fC");
					lhc_xhr.open("get", "logtext/" + index2[0] + "_log_fc.txt",
							true);
				}
				}else{
				alert("Check Structure or Functional");
				}
		}
	 
		lhc_xhr.onreadystatechange = function() {
			if (lhc_xhr.readyState == 4) {
				if (lhc_xhr.status == 200) {
					lhc_process();
				} else {
					alert("Not Exist Log and No processing");
				}
			}
		}
		lhc_xhr.send(null);
		function lhc_process() {
			var lhc_datas = lhc_xhr.responseText;
			jQuery('#textbox2').val(lhc_datas);
		}
	}

	function selected() {
		index = $("#selectBox option:selected").text();
		jQuery('#process').val(index);
		var index1 = index.split(",");		
		var index2 = index1[0].split(",");
		var index3 = index2[0].split("  ");
		var c ="";
		
		var valueByid = $('input[name=Processvalue1]:checked').val();
		if($('input[name=Processvalue1]:checked').val()==1 & $('input[name=Processvalue2]:checked').val()==1){
		}else{
			if($('input[name=Processvalue1]:checked').val()==1 | $('input[name=Processvalue2]:checked').val()==1){
				if($('input[name=Processvalue1]:checked').val()==1){
					alert("SC");
					c = "matrixFile/" + index3[0] + "_sc.csv";
				}
				
				if($('input[name=Processvalue2]:checked').val()==1){
					alert("fC");
					c = "matrixFile/" + index3[0] + "_fc.csv";
				}
				}
		}
		$("#aa").attr("href", c);
	}

	function downl() {

	}

	var fileValue = $("#file1").val().split("\\");
	var fileName = fileValue[fileValue.length - 1];
</script>
</head>
<body>
	<table style='width: 100%; height: 80px;'>
		<tr style='background-color: #eaf8ff;'>
			<td class='title1'><a> Select Files </a></td>
		</tr>
	</table>
	<h3>
		Upload Image [<%=pname%>]
	</h3>
	<table class="ubutton">
		<tr>
			<td>
				<form style="margin: 0 auto" method="post"
					action="ClientFileUploadPageT1.jsp">
					<button>T1 Upload</button>
					<input type="hidden" name="aid" value="<%=id%>" /> <input
						type="hidden" name="apwd" value="<%=pwd%>" /> <input
						type="hidden" name="apname" value="<%=pname%>" /> <input
						type="hidden" name="pnum" value="<%=pnum%>" />
				</form>
			</td>
			<td>
				<form style="margin: 0 auto" method="post"
					action="ClientFileUploadPageFMRI.jsp">
					<button>FMRI Upload</button>
					<input type="hidden" name="aid" value="<%=id%>" /> <input
						type="hidden" name="apwd" value="<%=pwd%>" /> <input
						type="hidden" name="apname" value="<%=pname%>" /> <input
						type="hidden" name="pnum" value="<%=pnum%>" />
				</form>
			</td>
			<td>
				<form style="margin: 0 auto" method="post"
					action="ClientFileUploadPageDTI.jsp">
					<button>DTI Upload</button>
					<input type="hidden" name="aid" value="<%=id%>" /> <input
						type="hidden" name="apwd" value="<%=pwd%>" /> <input
						type="hidden" name="apname" value="<%=pname%>" /> <input
						type="hidden" name="pnum" value="<%=pnum%>" />
				</form>
			</td>
			<form style="margin: 0 auto"
				action="http://brein.korea.ac.kr/brainorigin/saf/DataprocessingServlet"
				method="post">
				<td>
					<button disabled="disabled">
						<input type="checkbox" name="Processvalue1" value="1" onchange="selected()"/>
						Structure <br /> 
						<input type="checkbox" name="Processvalue2" value="1" onchange="selected()"/>Functional
					</button>
				</td>

				<td>
					<button>PreProcessing Start</button> <textarea
						style="display: none;" id="process" name="process"></textarea> <input
					type="hidden" name="aid" value="<%=id%>" /> <input type="hidden"
					name="apwd" value="<%=pwd%>" /> <input type="hidden" name="apname"
					value="<%=pname%>" /> <input type="hidden" name="pnum"
					value="<%=pnum%>" />

				</td>
			</form>
			<td><button onClick='logview()'>View Log</button></td>
			
			<td><a id="aa" href="logtext/" download>Connectivity Download</a></td>

		</tr>
	</table>

	<table>
		<tr>
			<td><select id="selectBox" multiple=""
				style='height: 300px; width: 500px;' onchange="selected();">
					<c:forEach items="${T1list}" var="T1list" varStatus="status">
						<c:if test="${T1list.t1name != null }">
							<option >${T1list.t1name}  (${listfnameNull0[status.index].fileNull}), (${listfnameNull4[status.index].fileNull}), (${listfnameNull2[status.index].fileNull})</option>
						</c:if>
					</c:forEach>
			</select></td>

			
			<td><textarea wrap="hard" spellcheck="false" id='textbox2'
					name='textbox2' style='height: 300px; width: 500px;'></textarea></td>
		</tr>
	</table>
	<h3>Upload Connectivity</h3>
	<!-- <form action="http://brein.korea.ac.kr/brainorigin/saf/FileUploadResult.jsp" method="post" enctype="multipart/form-data">-->
 	<form action="http://brein.korea.ac.kr/brainorigin/saf/FileUploadResult.jsp?pname=<%=pname%>&id=<%=id%>&pwd=<%=pwd%>&pnum=<%=pnum%>" method="post" enctype="multipart/form-data">

		<table>
			<tr>
				<td><div class="ubutton">
						<label for="uploadfile">Upload</label><input multiple="multiple" type="file" id="uploadfile" name="file1">
					</div></td>
			<td colspan="2">
					<button class="button white">Summit</button>
					<input type="hidden" name="aid" value="<%=id%>" /> 
					<input type="hidden" name="apwd" value="<%=pwd%>" />
					<input type="hidden" name="apname" value="<%=pname%>" />
					<input type="hidden" name="pnum" value="<%=pnum%>" />
			<td><textarea  style="display:none;" id="filesList" name="flists"></textarea></td>
			</tr>
		</table>
		<!-- <form action="http://brein.korea.ac.kr/brainorigin/saf/ViewerController" method="post"> -->
		<form action="${pageContext.request.contextPath }/saf/ViewerController" method="post">
			<table style="width: 53%">
				<tr style="height: 30px; width: 100px; background-color: #86c5e3;">
					<th>File num</th>
					<th>Admin</th>
					<th>File name</th>
					<th>Date</th>
					<th>State</th>
				   <th style="width:100px;"></th>
				</tr>
				<!-- movieBoardListcontroller -->
				<c:forEach items="${list}" var="list" varStatus="status">
					<%-- <c:forEach begin="${list.index}" end ="${list.index }" items="${listfnameNull}" var="listfnameNull"> --%>
					<c:if test="${list.fname != null }">
						<tr style="text-align: center">
							<td>${list.fnum}</td>
							<td id="id">${list.id}</td>
							<%-- <td><a href=http://brein.korea.ac.kr/brainorigin/saf/ViewerController?fnum=${list.fnum } id="fname">${list.fname }</a></td> --%>
							<td><a
								href="${pageContext.request.contextPath }/saf/ViewerController?fnum=${list.fnum } id="fname">${list.fname }</a></td>
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