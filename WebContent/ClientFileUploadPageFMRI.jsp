<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.io.File"%>
 <script src="jquery/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="icon.css" />
<!DOCTYPE HTML>
<html>
<head>
<meta charset=EUC-KR">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
</script>
</head>
<body>
	<script>


var fileValue = $("#file1").val().split("\\");
var fileName = fileValue[fileValue.length-1];

</script>
	<table style='width: 100%; height: 80px;'>
		<tr style='background-color: #eaf8ff;'>
			<td class='title1'><a> FMRI File Upload </a></td>
		</tr>
	</table>
	<form action="http://brein.korea.ac.kr/brainorigin/saf/FMRIFileUploadResult.jsp?" method="post" enctype="multipart/form-data">
		<table>
		<tr>
			<td><div class="ubutton">
				<label for="uploadfile">업로드</label><input multiple="multiple" type="file" id="uploadfile" name="file1">
				<!-- <label for="uploadfile">업로드</label><input type="file" id="uploadfile" multiple> -->
				</div></td>
			<td colspan="2"><input class="button white" type="submit" value="제출" onclick="location.href='http://brein.korea.ac.kr/brainorigin/saf/ClientFileUploadPage.jsp'"></td>
			<td><textarea  style="display:none;" id="filesList" name="flists"></textarea></td>
			
			</tr>			
		</table>
	</form>
	
	<table>
	<tr><h3>■ 업로드 결과</h3></tr>
	<tr>	
	<td><textarea  wrap="hard" spellcheck = "false" name='textbox2' style='height:700px; width:1000px;' id="files" ></textarea></td>
	</tr>
	</table>
</body>
</html>