<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String fname = (String) request.getAttribute("fname");
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
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   lh_c ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		var mesh, geometry, container, controls, roifinded;
		var camera, scene, renderer;
		var lighting, ambient, keyLight, fillLight, backLight, material, texture, revisual, coloryes;
		var fileLoader = new THREE.FileLoader();
		var objLoader1 = new THREE.OBJLoader();
			
		function startViewer() {
			if (mesh !== undefined) {
				scene.remove( mesh );
				geometry.dispose();
				
				if(material != null){
				material.dispose();
				}
				if(texture != null){
				texture.dispose();
				}
				loadFile();
			} else {
				FileReadEngin();
			}
		}

		function FileReadEngin() {
			//alert("파일 로드");
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
			var lhlabel_xhr = new XMLHttpRequest();
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

				var lhlabel_rowData = lhlabel_datas.split(String
						.fromCharCode(13)); // 행은 cr로 구분 (String.fromCharCode(13))

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
		function lhobj() {
			var obj_xhr = new XMLHttpRequest();

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
		function jetcolor() {
			var jetcolor_xhr = new XMLHttpRequest();
			
			jetcolor_xhr.open("get", "txt/cool.txt", true);
			jetcolor_xhr.onreadystatechange = function() {
				if (jetcolor_xhr.readyState == 4) {
					if (jetcolor_xhr.status == 200) {
						jetcolor_process();
					} else {
						alert("요청 실패: " + obj_xhr.status);
					}
				}
			}
			jetcolor_xhr.send(null);

			function jetcolor_process() {
				jetcolor_datas = jetcolor_xhr.responseText;

				jetcolor_rowData = jetcolor_datas
						.split(String.fromCharCode(13)); //행은 cr로 구분 (String.fromCharCode(13))

				jetcolor_array = new Array();
				str = "";
				for (var i = 0; i < jetcolor_rowData.length; i++) {
					jetcolor_array[i] = new Array();
					jetcolor_colData = jetcolor_rowData[i].split(" "); //열은 ,로 구분

					for (var j = 0; j < jetcolor_colData.length; j++) {
						jetcolor_array[i][j] = jetcolor_colData[j];
					}
				}
				matrixfile();
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ matrix ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

		function matrixfile() {
			var matrix_xhr = new XMLHttpRequest();

			var fmainfile= '<%=fname%>';
			//alert("fname");
			//alert(fmainfile);
			mainfile = "matrixFile/" + String(fmainfile);

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

		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■파일 로드■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

		function colormap() {
			objLoader1.setPath('assets/');
			loadObj('objmesh', "brain.obj", addPlaneToSceneSOAnswer);
			function loadObj(objName, objurl, onLoadfunc) {
				fileLoader.setPath('assets/');
				fileLoader.load(objurl, function(onLoadContent) { //로더
					mesh = objLoader1.parse(onLoadContent);
					onLoadfunc(mesh); //콜백 
				});
			}
			function addPlaneToSceneSOAnswer(mesh) {
				var frontMaterial = new THREE.MeshLambertMaterial({
					color : 0xffffff,
					side : THREE.FrontSide
				});
				geometry = new THREE.Geometry()
						.fromBufferGeometry(mesh.children[0].geometry); // 기하학 생성 
				var length = geometry.faces.length;
				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■faces 매칭 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
				var faces_start = obj_array.length - geometry.faces.length;
				if (roifinded != null) {
					var obj_array_len = obj_array.length;
					for (var i = faces_start; i < obj_array_len; i++) {
						var vertices_index1 = obj_array[i][1];
						var vertices_index2 = obj_array[i][2];
						var vertices_index3 = obj_array[i][3];
						if (final_vertices[vertices_index2 - 1] != null) {
							var face1 = geometry.faces[i - faces_start];
							face1.color.setRGB(1, 1, 1);
							face1.color.setRGB(
									final_vertices[vertices_index2 - 1][0],
									final_vertices[vertices_index2 - 1][1],
									final_vertices[vertices_index2 - 1][2]);
						}
					}
				}
				mesh = new THREE.Mesh(geometry, new THREE.MeshLambertMaterial({
					vertexColors : THREE.FaceColors }));
				mesh.scale.set(0.01, 0.01, 0.01); // 스케일
				scene.add(mesh);

				camera = new THREE.PerspectiveCamera(45, window.innerWidth/ window.innerHeight, 0.1, 100);
				camera.position.x = 0;
				camera.position.y = 0.4;
				camera.position.z = 2.7;

				controls = new THREE.OrbitControls(camera, renderer.domElement);
				controls.enableDamping = true;
				controls.dampingFactor = 0.2;
				controls.enableZoom = true;
				
				mesh.rotation.y = (Math.PI * -90) / 180;

				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ mesh2 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
				mesh2 = new THREE.Mesh(geometry, new THREE.MeshLambertMaterial({
					vertexColors : THREE.FaceColors }));
				mesh2.scale.set(0.01, 0.01, 0.01); // 스케일
				scene2.add(mesh2);

				camera2 = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 100);
				camera2.position.x = 0;
				camera2.position.y = -0.2;
				camera2.position.z = 2.7;
				
				mesh2.rotation.y = (Math.PI * 180) / 180;
				
				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ mesh3 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
				
				mesh3 = new THREE.Mesh(geometry, new THREE.MeshLambertMaterial({ vertexColors : THREE.FaceColors }));
				mesh3.scale.set(0.01, 0.01, 0.01); // 스케일
				scene3.add(mesh3);

				camera3 = new THREE.PerspectiveCamera(45, window.innerWidth
						/ window.innerHeight, 0.1, 100);
				camera3.position.x = -0.1;
				camera3.position.y = -0.2;
				camera3.position.z = 2.7;
				
				mesh3.rotation.y = (Math.PI * -90) / 180;
				
				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ mesh4 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
				
				mesh4 = new THREE.Mesh(geometry, new THREE.MeshLambertMaterial({
					vertexColors : THREE.FaceColors }));
				mesh4.scale.set(0.01, 0.01, 0.01); // 스케일
				scene4.add(mesh4);

				camera4 = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 100);
				camera4.position.x = 0.1;
				camera4.position.y = -0.2;
				camera4.position.z = 2.7;
				
				//mesh4.rotation.x = (Math.PI * 10) / 180;
				mesh4.rotation.y = (Math.PI * 90) / 180;
				//var visual_end = performance.now();
				//alert("faces color 가시화 속도" + (visual_end - visual_first) + 'ms');

				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 피킹 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

				var raycaster = new THREE.Raycaster();
				var mouse = new THREE.Vector2();
				var intersects = [];
				faceIdx1 = -1;
				var baseColor = new THREE.Color("white");
				var selectionColor = new THREE.Color("yellow");

				//alert(window.innerHeight);
				//alert(window.innerwidth);

				window.addEventListener("mousemove",function(event) {
									mouse.x = ((event.clientX - 11) / (window.innerWidth/2 - 30)) * 2 - 1;
									mouse.y = -((event.clientY - 40) / (window.innerHeight/2 - 50)) * 2 + 1;
								}, false); //8은 margin, 30,50은 뷰어 사이즈

				window.addEventListener("dblclick",function(event) {
									raycaster.setFromCamera(mouse, camera);
									intersects = raycaster.intersectObject(mesh);
									if (intersects.length === 0)
										return;

									// find the new indices of faces
									faceIdx1 = intersects[0].faceIndex;

									for (var i = 0; i < lhc_array.length; i++) {
										if (lhc_array[i][4] == lhlabel_array[obj_array[faces_start + faceIdx1][1] - 1][0]) {
											roifinded = i;

											var random_array = [];
											var max_first = 5;
											var min_first = 0;
											var min;


											var lhc_array_len = lhc_array.length;
											/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ min, max ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
											for (var i = 0; i < 210; i++) { 
												random_array[i] = matrix_array[roifinded][i] + 1; // 마이너스를 양수로 처리.
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

											/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 노말리제이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

											var nor_a = [];
											for (var i = 0; i < lhc_array_len; i++) {
												if (random_array[i] != 0) {
													if (random_array[i] != 1) {
														nor_a[i] = Math.round(((random_array[i] - min) / (max - min))* jetcolor_array.length);
													} else {
														nor_a[i] = 0;
													}
												} else {
													nor_a[i] = null; // 랜덤이 0일 경우 (초기 컬러) !다시확인 
												}
											}

											/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 컬러매칭 ★ ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
											
											

											var col_map = [];

											var nor_a_len = nor_a.length;

											for (var i = 0; i < nor_a_len; i++) {
												col_map[i] = [];
												if (nor_a[i] != null) {
													if (nor_a[i] != 0) {
														col_map[i] = jetcolor_array[nor_a[i] - 1];
													} else {
														col_map[i] = jetcolor_array[0];
													}
												} else {
													col_map[i][0] = 1;
													col_map[i][1] = 1;
													col_map[i][2] = 1;
												}
											}

											/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ lh_c 매칭 와 컬러와 묶음■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

											var lhc_color = [];
											var lhc_array_len = lhc_array.length;

											for (var i = 0; i < lhc_array_len; i++) {
												lhc_color[i] = [
														lhc_array[i][4],
														col_map[i][0],
														col_map[i][1],
														col_map[i][2] ];
											}
											//alert("random_array");
											//alert(lhc_color);
											/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ label 매칭 => indexcolor테이블 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

											var lhlabel_array_len = lhlabel_array.length;

											final_vertices = [];

											var lhc_color_len = lhc_color.length;

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

											var obj_array_len = obj_array.length;

											for (var i = faces_start; i < obj_array_len; i++) {
												var vertices_index1 = obj_array[i][1];
												var vertices_index2 = obj_array[i][2];
												var vertices_index3 = obj_array[i][3];

												if (final_vertices[vertices_index2 - 1] != null) {

													var face1 = geometry.faces[i
															- faces_start];
													face1.color.setRGB(1, 1, 1);
													face1.color
															.setRGB(
																	final_vertices[vertices_index2 - 1][0],
																	final_vertices[vertices_index2 - 1][1],
																	final_vertices[vertices_index2 - 1][2]);
												}
											}

										}
									}
									// set newly selected faces to red
									setFaceColor(faceIdx1, selectionColor);
								}, false)
				function setFaceColor(idx, color) {
					if (idx === -1)
						return;
					mesh.geometry.faces[idx].color.copy(color);
					mesh.geometry.colorsNeedUpdate = true;
				}

				animate();
			}
			if (revisual == null) {
				init();
			}
		}

		function init() {

			container = document.getElementById('container');

			scene = new THREE.Scene();
			renderer = new THREE.WebGLRenderer();

			/* Scene */
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

			/*읽기 전용 현재 디스플레이 장치 상의 물리적인 픽셀의 비율을 반환*/
			renderer.setPixelRatio(window.devicePixelRatio);

			/*뷰어 사이즈 설정*/
			renderer.setSize(window.innerWidth/2 - 30, window.innerHeight/2 - 50);
			container.appendChild(renderer.domElement);

			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);

			//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■Screen2■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■//

			container2 = document.getElementById('container2');

			scene2 = new THREE.Scene();
			renderer2 = new THREE.WebGLRenderer();

			/* Scene */
			scene2.background = new THREE.Color(0xffffff);
			/*조명*/
			/*ambient = new THREE.AmbientLight(0xffffff, 0.8); */

			/* 포인트 광원을 흰색으로 만들고 나서 입방체의 윗면과 앞면에 빛이 비치도록 */
			var pointLight2 = new THREE.PointLight(0xffffff);
			pointLight2.position.set(20, 20, 20);
			var pointLight12 = new THREE.PointLight(0xffffff);
			pointLight12.position.set(-20, -20, -20);
			scene2.add(pointLight2);
			scene2.add(pointLight12);
			/* Renderer */

			/*읽기 전용 현재 디스플레이 장치 상의 물리적인 픽셀의 비율을 반환*/
			renderer2.setPixelRatio(window.devicePixelRatio);

			/*뷰어 사이즈 설정*/
			renderer2.setSize(window.innerWidth/2 - 30, window.innerHeight/2 - 50);
			container2.appendChild(renderer2.domElement);

			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);
			
			//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■Screen3■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■//

			container3 = document.getElementById('container3');

			scene3 = new THREE.Scene();
			renderer3 = new THREE.WebGLRenderer();

			/* Scene */
			scene3.background = new THREE.Color(0xffffff);
			/*조명*/
			/*ambient = new THREE.AmbientLight(0xffffff, 0.8); */

			/* 포인트 광원을 흰색으로 만들고 나서 입방체의 윗면과 앞면에 빛이 비치도록 */
			var pointLight3 = new THREE.PointLight(0xffffff);
			pointLight3.position.set(20, 20, 20);
			var pointLight13 = new THREE.PointLight(0xffffff);
			pointLight13.position.set(-20, -20, -20);
			scene3.add(pointLight3);
			scene3.add(pointLight13);
			/* Renderer */

			/*읽기 전용 현재 디스플레이 장치 상의 물리적인 픽셀의 비율을 반환*/
			renderer3.setPixelRatio(window.devicePixelRatio);

			/*뷰어 사이즈 설정*/
			renderer3.setSize(window.innerWidth/2 - 30, window.innerHeight/2 - 50);
			container3.appendChild(renderer3.domElement);

			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);
			
			//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■Screen4■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■//

			container4 = document.getElementById('container4');

			scene4 = new THREE.Scene();
			renderer4 = new THREE.WebGLRenderer();

			/* Scene */
			scene4.background = new THREE.Color(0xffffff);
			/*조명*/
			/*ambient = new THREE.AmbientLight(0xffffff, 0.8); */

			/* 포인트 광원을 흰색으로 만들고 나서 입방체의 윗면과 앞면에 빛이 비치도록 */
			var pointLight4 = new THREE.PointLight(0xffffff);
			pointLight4.position.set(20, 20, 20);
			var pointLight14 = new THREE.PointLight(0xffffff);
			pointLight14.position.set(-20, -20, -20);
			scene4.add(pointLight4);
			scene4.add(pointLight14);
			/* Renderer */

			/*읽기 전용 현재 디스플레이 장치 상의 물리적인 픽셀의 비율을 반환*/
			renderer4.setPixelRatio(window.devicePixelRatio);

			/*뷰어 사이즈 설정*/
			renderer4.setSize(window.innerWidth/2 - 30, window.innerHeight/2 - 50);
			container4.appendChild(renderer4.domElement);

			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);
			revisual = 1;
		}

		/*창크기에 맞게 변경*/
		function onWindowResize() {
			camera.aspect = (window.innerWidth/2 - 30) / (window.innerHeight/2 - 50);
			camera2.aspect = (window.innerWidth/2 - 30) / (window.innerHeight/2 - 50);
			camera3.aspect = (window.innerWidth/2 - 30) / (window.innerHeight/2 - 50);
			camera4.aspect = (window.innerWidth/2 - 30) / (window.innerHeight/2 - 50);
			/*카메라 투영 행렬을 업데이트*/
			camera.updateProjectionMatrix();
			camera2.updateProjectionMatrix();
			camera3.updateProjectionMatrix();
			camera4.updateProjectionMatrix();
			

			renderer.setSize((window.innerWidth/2 - 30),(window.innerHeight/2 - 50));
			renderer2.setSize((window.innerWidth/2 - 30),(window.innerHeight/2 - 50));
			renderer3.setSize((window.innerWidth/2 - 30),(window.innerHeight/2 - 50));
			renderer4.setSize((window.innerWidth/2 - 30),(window.innerHeight/2 - 50));
		}

		/*화면시각변화*/
		function animate() {
			requestAnimationFrame(animate);
			controls.update();
			render();
		}

		function render() {
			renderer.render(scene, camera);
			renderer2.render(scene2, camera2);
			renderer3.render(scene3, camera3);
			renderer4.render(scene4, camera4);
			
		}
		
		window.onload = startViewer();
		
	</script>

	<table style="height: 30px">
		<tr>
			<!-- <td><input type="text" id="input"><br></td>
			<td>
				<button onclick="startViewer()">입력받기</button>
			</td> -->
		</tr>
	</table>
	<table style="width: 100%">
		<tr>
			<td><div id="container" ></div></td>
			<td><div id="container2" ></div></td>
			</tr>
			<tr>
			<td><div id="container3" ></div></td>
			<td><div id="container4" ></div></td>
		</tr>
	</table>
</body>

</html>