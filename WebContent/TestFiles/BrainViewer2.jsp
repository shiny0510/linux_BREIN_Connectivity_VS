<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
     String fname = (String)request.getAttribute("fname");
%>      
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="js/three.js"></script>
<script type="text/javascript" src="js/three.min.js"></script>
<script type="text/javascript" src="js/OrbitControls.js"></script>
<script type="text/javascript" src="js/OBJLoader.js"></script>

</head>
<body>
	<script>
		var container;
		var camera, controls, scene, renderer;
		var lighting, ambient, keyLight, fillLight, backLight;
		const fileLoader = new THREE.FileLoader();
		const objLoader1 = new THREE.OBJLoader();
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   lh_c ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		function Engin() {
	
			
			input = document.getElementById("input").value;
			
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
			
			alert(obj_array.length);
		}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ jetcolor1 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		function jetcolor(){
		var jetcolor_xhr;
		jetcolor_xhr = new XMLHttpRequest();
		jetcolor_xhr.open("get", "txt/jetcolor.txt", true);
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
		     matrixfile();
			}
		}
		
		
		
		function matrixfile(){
			
					
			var matrix_xhr;
			matrix_xhr = new XMLHttpRequest();

			var fmainfile= '<%=fname %>';
			
			mainfile = "matrixFile/"+String(fmainfile);
			
			matrix_xhr.open("get", mainfile, true);
			matrix_xhr.onreadystatechange = function() {
				if (matrix_xhr.readyState == 4) {
					if (matrix_xhr.status == 200) {
						matrix_process();
					} else {
						alert("요청 실패: " + matrix_xhr.status);
					}
				}
			}
			matrix_xhr.send(null);

			function matrix_process() {
				matrix_datas = matrix_xhr.responseText;
				
				matrix_rowData = matrix_datas.split(String.fromCharCode(13)); // 행은 cr로 구분
				
			/* 	document.write(obj_rowData);
				
				alert(obj_rowData.length); */
				// (String.fromCharCode(13))
				matrix_array = new Array();
				
				str = "";
				for (var i = 0; i < matrix_rowData.length; i++) {
					matrix_array[i] = new Array();
					matrix_colData = matrix_rowData[i].split(","); // 열은 ,로 구분
					for (var j = 0; j < matrix_colData.length; j++) {
						matrix_array[i][j] = parseFloat(matrix_colData[j]);
					}
				}
				
		 	/* for(var i = 0; i<obj_array.length; i++){
				for(var j= 0; j<obj_array[i].length; j++){
					document.write(obj_array[i][j]);
					document.write("열");
				}
				document.write("행");
			}  */
		 	 colormap();
			}
		}
		
		
		function colormap() {
			var visual_first = performance.now(); //시작시간 체크(단위 ms)

			var random_array = [];
			var max_first = 5;
			var min_first = 0;
			var min;

			/* 	var random_first = performance.now();     //시작시간 체크(단위 ms) */

			lhc_array_len = lhc_array.length;

			for (var i = 0; i < lhc_array_len; i++) { //lh_c길이 만큼 난수 생성 
				random_array[i] = matrix_array[input][i] + 1; 
				if (random_array[i] != 0) { // 0이 min이 안되도록.
					if (!min) { // min이 없을때. 처음 값 
						min = random_array[i];
					}
					if (min > random_array[i]) {
						min = random_array[i];
					}
				}
			} // ((0~1 사이 소숫값 X 6) + 0) = ?.? 			 

			var max = Math.max.apply(null, random_array);
			
			alert(min);
			alert(max);

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 노말리제이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

			var nor_a = [];
			for (var i = 0; i < lhc_array_len; i++) {
				if(random_array[i] != 0) {
					if(random_array[i] != 1){
						/* document.write(((random_array[i] - min) / (max - min)) * jetcolor_array.length);
						document.write("행"); */
						nor_a[i] = Math.round(((random_array[i] - min) / (max - min)) * jetcolor_array.length);
					}else{
						nor_a[i] = 0; 
					}
				} else {
					nor_a[i] = null; // 랜덤이 0일 경우 (초기 컬러) !다시확인 
				}
			}
			
			document.write(nor_a);

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 컬러매칭 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
			

			col_map = [];
			
			nor_a_len = nor_a.length;

			for (var i = 0; i < nor_a_len; i++) {
				col_map[i] = [];
				if (nor_a[i] != null) {
					if (nor_a[i] != 0) {
						col_map[i] = jetcolor_array[nor_a[i] - 1];
					} else {
						col_map[i] = jetcolor_array[0];
					}
				}else{
					col_map[i][0] = 1;
					col_map[i][1] = 1;
					col_map[i][2] = 1;
					}
			}

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ lh_c 매칭 와 컬러와 묶음■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

			lhc_color = [];
			lhc_array_len = lhc_array.length;
			
			for (var i = 0; i < lhc_array_len; i++) {
				lhc_color[i] = [ lhc_array[i][4], col_map[i][0], col_map[i][1], col_map[i][2] ];
			}

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ label 매칭 => indexcolor테이블 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

			lhlabel_array_len = lhlabel_array.length;

			final_vertices = [];
			
			lhc_color_len = lhc_color.length;

			for (var i = 0; i < lhlabel_array_len; i++) {
				final_vertices[i] = [];
				a = 0;
				for (var j = 0; j < lhc_color_len; j++) {

					if (lhlabel_array[i][0] == lhc_color[j][0]) {
						final_vertices[i][0] = lhc_color[j][1];
						final_vertices[i][1] = lhc_color[j][2];
						final_vertices[i][2] = lhc_color[j][3];
						a = 2;
					}
				}
				if (a != 2) {
					final_vertices[i][0] = 1;
					final_vertices[i][1] = 1;
					final_vertices[i][2] = 1;
				}
			}

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■파일 로드■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

			objLoader1.setPath('assets/');

			
			loadObj('objmesh', "brain.obj", addPlaneToSceneSOAnswer);

			function loadObj(objName, objurl, onLoadfunc) {

				fileLoader.setPath('assets/');
				fileLoader.load(objurl, function(onLoadContent) { //로더
					var mesh = objLoader1.parse(onLoadContent);
					onLoadfunc(mesh); //콜백 
				});
			}

			function addPlaneToSceneSOAnswer(mesh) {

				var frontMaterial = new THREE.MeshLambertMaterial({
					color : 0xffffff,
					side : THREE.FrontSide
				});

				var geometry = new THREE.Geometry()
						.fromBufferGeometry(mesh.children[0].geometry); // 기하학 생성 
				var length = geometry.faces.length;

				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■faces 매칭 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

				var faces_start = obj_array.length - geometry.faces.length;
				obj_array_len = obj_array.length;
				
				for (var i = faces_start; i < obj_array_len; i++) {
					vertices_index1 = obj_array[i][1];
					vertices_index2 = obj_array[i][2];
					vertices_index3 = obj_array[i][3];

					if (final_vertices[vertices_index2 - 1] != null) {

						face1 = geometry.faces[i - faces_start];
						face1.color.setRGB(1, 1, 1);
						face1.color.setRGB(final_vertices[vertices_index2 - 1][0],final_vertices[vertices_index2 - 1][1],final_vertices[vertices_index2 - 1][2]);
					}
				}

				mesh = new THREE.Mesh(geometry, new THREE.MeshLambertMaterial({
					vertexColors : THREE.FaceColors
				}));
				mesh.scale.set(0.01, 0.01, 0.01); // 스케일
				scene.add(mesh);

				camera = new THREE.PerspectiveCamera(45, window.innerWidth
						/ window.innerHeight, 0.1, 100);
				camera.position.x = 0;
				camera.position.y = 0;
				camera.position.z = 2;

				controls = new THREE.OrbitControls(camera, renderer.domElement);
				controls.enableDamping = true;
				controls.dampingFactor = 0.1;
				controls.enableZoom = true;
				
				animate();
				var visual_end = performance.now();
				alert("faces color 가시화 속도" + (visual_end - visual_first) + 'ms');

			}
			init();

		}
		function init() {

			container = document.createElement('div');
			document.body.appendChild(container);

			/* Scene */

			scene = new THREE.Scene();
			scene.background = new THREE.Color(0xffffff);
			/*조명*/
			/*ambient = new THREE.AmbientLight(0xffffff, 0.8); */

			/* 포인트 광원을 흰색으로 만들고 나서 입방체의 윗면과 앞면에 빛이 비치도록 */
			var pointLight = new THREE.PointLight(0xffffff);
			pointLight.position.set(20, 20, 20);
			var pointLight1 = new THREE.PointLight(0xffffff);
			pointLight1.position.set(-20, -20, -20);
			scene.add(pointLight);
			scene.add(pointLight1);

			/* Renderer */
			renderer = new THREE.WebGLRenderer();

			/*읽기 전용 현재 디스플레이 장치 상의 물리적인 픽셀의 비율을 반환*/
			renderer.setPixelRatio(window.devicePixelRatio);

			/*뷰어 사이즈 설정*/
			renderer.setSize(window.innerWidth, window.innerHeight);
			container.appendChild(renderer.domElement);

			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);

		}

		/*창크기에 맞게 변경*/
		function onWindowResize() {
			camera.aspect = window.innerWidth / window.innerHeight;

			/*카메라 투영 행렬을 업데이트*/
			camera.updateProjectionMatrix();

			renderer.setSize(window.innerWidth, window.innerHeight);
		}

		/*화면시각변화*/
		function animate() {
			requestAnimationFrame(animate);
			controls.update();
			render();
		}

		function render() {
			renderer.render(scene, camera);
		}

		/* window.onload = Engin(); */
	</script>
	<input type="text" id="input"><br>	
	<button onclick="Engin()">입력받기</button>
</body>
</html>