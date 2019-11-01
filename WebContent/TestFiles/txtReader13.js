/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   lh_c ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
function Engin() {
	var lhc_xhr;
	lhc_xhr = new XMLHttpRequest();
	lhc_xhr.open("get", "txt/c.txt", true); // c에서 RGB 제거한 값
	lhc_xhr.onreadystatechange = function() {
		if (lhc_xhr.readyState == 4) {
			if (lhc_xhr.status == 200) {
				lhc_process();
			} else {
				alert("요청 실패: " + lhc_xhr.status);
			}
		}
	}
	lhc_xhr.send(null);

	function lhc_process() {
		var lhc_datas = lhc_xhr.responseText;

		var rowData = lhc_datas.split(String.fromCharCode(13)); // 행은 cr로 구분(String.fromCharCode(13))

		lhc_array = new Array();
		str = "";
		for (var i = 0; i < rowData.length; i++) {
			lhc_array[i] = new Array();
			var colData = rowData[i].split(" "); // 열은 ,로 구분

			for (var j = 0; j < colData.length; j++) {
				lhc_array[i][j] = parseInt(colData[j]);
			}
		}
		lhlabel();
	}
}

/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ lh_label ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
function lhlabel() {
	var lhlabel_xhr;
	lhlabel_xhr = new XMLHttpRequest();
	lhlabel_xhr.open("get", "txt/label.txt", true); // label 읽는거
	lhlabel_xhr.onreadystatechange = function() {
		if (lhlabel_xhr.readyState == 4) {
			if (lhlabel_xhr.status == 200) {
				lhlabel_process();
			} else {
				alert("요청 실패: " + lhlabel_xhr.status);
			}
		}
	}
	lhlabel_xhr.send(null);

	function lhlabel_process() {
		var lhlabel_datas = lhlabel_xhr.responseText;

		var lhlabel_rowData = lhlabel_datas.split(String.fromCharCode(13)); // 행은 cr로 구분 (String.fromCharCode(13))

		lhlabel_array = new Array();
		str = "";
		for (var i = 0; i < lhlabel_rowData.length; i++) {
			lhlabel_array[i] = new Array();
			var lhlabel_colData = lhlabel_rowData[i].split(" "); // 열은 ,로 구분

			for (var j = 0; j < lhlabel_colData.length; j++) {
				lhlabel_array[i][j] = parseInt(lhlabel_colData[j]);
			}
		}
		lhobj();
	}
}
/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ lh_obj■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
function lhobj(){
var obj_xhr;
obj_xhr = new XMLHttpRequest();
obj_xhr.open("get", "assets/brain.obj", true);
obj_xhr.onreadystatechange = function() {
	if (obj_xhr.readyState == 4) {
		if (obj_xhr.status == 200) {
			obj_process();
		} else {
			alert("요청 실패: " + obj_xhr.status);
		}
	}
}
obj_xhr.send(null);

function obj_process() {
	obj_datas = obj_xhr.responseText;

	obj_rowData = obj_datas.split(String.fromCharCode(13)); // 행은 cr로 구분
															// (String.fromCharCode(13))

	obj_array = new Array();
	str = "";
	for (var i = 0; i < obj_rowData.length; i++) {
		obj_array[i] = new Array();
		obj_colData = obj_rowData[i].split(" "); // 열은 ,로 구분

		for (var j = 0; j < obj_colData.length; j++) {
			obj_array[i][j] = String(obj_colData[j]);
		}
	}
	jetcolor();
}
}
/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ jetcolor1 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
function jetcolor(){
var jetcolor_xhr;
jetcolor_xhr = new XMLHttpRequest();
jetcolor_xhr.open("get", "txt/cool.txt", true);
jetcolor_xhr.onreadystatechange = function(){
          if(jetcolor_xhr.readyState == 4){
              if(jetcolor_xhr.status== 200){
            	  jetcolor_process();
              }else{
                   alert("요청 실패: " + obj_xhr.status);
              }    
          }
     }
jetcolor_xhr.send(null);

function jetcolor_process(){
	jetcolor_datas = jetcolor_xhr.responseText;
     
	jetcolor_rowData = jetcolor_datas.split(String.fromCharCode(13)); //행은 cr로 구분 (String.fromCharCode(13))
     
	jetcolor_array = new Array();
     str ="";
     for(var i=0; i < jetcolor_rowData.length; i++){
    	 jetcolor_array[i] = new Array(); 
    	 jetcolor_colData = jetcolor_rowData[i].split(" "); //열은 ,로 구분
     
          for(var j=0; j < jetcolor_colData.length; j++){
        	  jetcolor_array[i][j] = jetcolor_colData[j];
          }
    }
     colormap();
}
}