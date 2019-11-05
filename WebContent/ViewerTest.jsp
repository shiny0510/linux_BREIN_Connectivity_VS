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

<style>
.button {

    width:100px;

    background-color: #f8585b;

    border: none;

    color:#fff;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;

}

</style>
</head>
<body>
	<script>		
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   lh_c ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		var mesh, geometry, container, controls, roifinded;
		var camera, scene, renderer;
		
		var lhmesh, lhgeometry, lhcontainer, lhcontrols, lhroifinded;
		var lhcamera, lhscene, lhrenderer;
		
		var rhmesh, rhgeometry, rhcontainer, rhcontrols, rhroifinded3
		var rhcamera, rhscene, rhrenderer;
		
		var lighting, ambient, keyLight, fillLight, backLight, material, texture, revisual, coloryes;
		var fileLoader = new THREE.FileLoader();
		var objLoader1 = new THREE.OBJLoader();
		
		var fileLoader2 = new THREE.FileLoader();
		var objLoader2 = new THREE.OBJLoader();
		
		var fileLoader3 = new THREE.FileLoader();
		var objLoader3 = new THREE.OBJLoader();
			
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
						//alert("요청 실패: " + lhc_xhr.status);
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
						//alert("요청 실패: " + lhlabel_xhr.status);
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
				CConnect();
			}
		}
		
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ CConnect ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
		function CConnect() {
			var CConnect_xhr = new XMLHttpRequest();
			CConnect_xhr.open("get", "txt/CConnect.txt", true); // label 읽는거
			CConnect_xhr.onreadystatechange = function() {
				if (CConnect_xhr.readyState == 4) {
					if (CConnect_xhr.status == 200) {
						CConnect_process();
					} else {
						//alert("요청 실패: " + CConnect_xhr.status);
					}
				}
			}
			CConnect_xhr.send(null);
			function CConnect_process() {
				var CConnect_datas = CConnect_xhr.responseText;
				var CConnect_rowData = CConnect_datas.split(String.fromCharCode(13)); // 행은 cr로 구분 (String.fromCharCode(13))
						CConnect_array = new Array();
				str = "";
				for (var i = 0; i < CConnect_rowData.length; i++) {
					CConnect_array[i] = new Array();
					var CConnect_colData = CConnect_rowData[i].split(" "); // 열은 ,로 구분
					for (var j = 0; j < CConnect_colData.length; j++) {
						CConnect_array[i][j] = CConnect_colData[j];
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
						//alert("요청 실패: " + obj_xhr.status);
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
			
			jetcolor_xhr.open("get", "txt/jetnew1.txt", true);
			jetcolor_xhr.onreadystatechange = function() {
				if (jetcolor_xhr.readyState == 4) {
					if (jetcolor_xhr.status == 200) {
						jetcolor_process();
					} else {
						//alert("요청 실패: " + obj_xhr.status);
					}
				}
			}
			jetcolor_xhr.send(null);
			function jetcolor_process() {
				jetcolor_datas = jetcolor_xhr.responseText;
				jetcolor_rowData = jetcolor_datas.split(String.fromCharCode(13)); //행은 cr로 구분 (String.fromCharCode(13))
				jetcolor_array = new Array();
				str = "";
				for (var i = 0; i < jetcolor_rowData.length; i++) {
					jetcolor_array[i] = new Array();
					jetcolor_colData = jetcolor_rowData[i].split(" "); //열은 ,로 구분
					for (var j = 0; j < jetcolor_colData.length; j++) {
						jetcolor_array[i][j] = parseFloat(String(jetcolor_colData[j]).replace(/(\s*)/g,""));
					}
					
				}
				//alert("jetcolorarry");
				//alert(jetcolor_array.length);
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
						//alert("요청 실패: " + matrix_xhr.status);
					}
				}
			}
			matrix_xhr.send(null);
			function matrix_process() {
				matrix_datas = matrix_xhr.responseText;
				matrix_rowData = matrix_datas.split(String.fromCharCode(13)); // 행은 cr로 구분
				/* 	document.write(obj_rowData);
					
					//alert(obj_rowData.length); */
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
			
			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ mesh2 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
			objLoader1.setPath('assets/');
			loadObj('objmesh', "lhmesh.obj", lhaddPlaneToSceneSOAnswer);
			function loadObj(objName, objurl, onLoadfunc) {
				fileLoader.setPath('assets/');
				
				fileLoader.load(objurl, function(onLoadContent) { //로더
					mesh2 = objLoader1.parse(onLoadContent);
					onLoadfunc(mesh2); //콜백 
				});
			}
			
			function lhaddPlaneToSceneSOAnswer(mesh2){
				//alert("왔다");
				var frontMaterial = new THREE.MeshLambertMaterial({
					color : 0xffffff,
					side : THREE.FrontSide
				});
				lhgeometry = new THREE.Geometry().fromBufferGeometry(mesh2.children[0].geometry); // 기하학 생성 
				lhmesh = new THREE.Mesh(lhgeometry, new THREE.MeshLambertMaterial({
					vertexColors : THREE.FaceColors }));
		
				lhmesh.scale.set(0.01, 0.01, 0.01); // 스케일
				lhscene.add(lhmesh);
				lhcamera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 100);
				lhcamera.position.x = 0;
				lhcamera.position.y = -0.2;
				lhcamera.position.z = 2.1;
			
				lhmesh.rotation.y = (Math.PI * -90) / 180;
			}
			
			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ mesh3 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
			objLoader1.setPath('assets/');
			loadObj('objmesh', "rh_mesh.obj", rhaddPlaneToSceneSOAnswer);
			function loadObj(objName, objurl, onLoadfunc) {
				fileLoader.setPath('assets/');
				fileLoader.load(objurl, function(onLoadContent) { //로더
					mesh3 = objLoader1.parse(onLoadContent);
					onLoadfunc(mesh3); //콜백 
				});
			}
			
			function rhaddPlaneToSceneSOAnswer(mesh3){
				var frontMaterial = new THREE.MeshLambertMaterial({
					color : 0xffffff,
					side : THREE.FrontSide
				});
			rhgeometry = new THREE.Geometry().fromBufferGeometry(mesh3.children[0].geometry); // 기하학 생성 
			
			rhmesh = new THREE.Mesh(rhgeometry, new THREE.MeshLambertMaterial({
				vertexColors : THREE.FaceColors }));
			rhmesh.scale.set(0.01, 0.01, 0.01); // 스케일
			
			rhscene.add(rhmesh);
			rhcamera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 100);
			rhcamera.position.x = 0;
			rhcamera.position.y = -0.2;
			rhcamera.position.z = 2.1;
			
			rhmesh.rotation.y = (Math.PI * 90) / 180;
			}
					
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
				geometry = new THREE.Geometry().fromBufferGeometry(mesh.children[0].geometry); // 기하학 생성 
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
				camera.position.y = 2;
				camera.position.z = 2.4;
				
				controls = new THREE.OrbitControls(camera, renderer.domElement);
				controls.enableDamping = true;
				controls.dampingFactor = 0.2;
				controls.enableZoom = true;
				
				mesh.rotation.x = (Math.PI * -45) / 180;
				mesh.rotation.y = (Math.PI * 0) / 180;
				

				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 피킹 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
				var raycaster = new THREE.Raycaster();
				var mouse = new THREE.Vector2();
				var intersects = [];
				faceIdx1 = -1;
				var baseColor = new THREE.Color("white");
				var selectionColor = new THREE.Color("yellow");
				////alert(window.innerHeight);
				////alert(window.innerwidth);
				window.addEventListener("mousemove",function(event) {
									mouse.x = ((event.clientX - 548) / (window.innerWidth/2.3 -100)) * 2 - 1;
									mouse.y = -((event.clientY - 103) / (window.innerHeight/2.3)) * 2 + 1;
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
											var col_map = [];
											var col_map_count = 0;
																
											/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ min, max ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
											for (var i = 0; i < 210; i++) { 
												random_array[i] = matrix_array[roifinded][i]; // 마이너스를 양수로 처리.												
												var cc = Math.round(999.5*(random_array[i]-1)+2000);
												
														col_map[i] = [];
														col_map[i][0] = jetcolor_array[cc-1][0];
														col_map[i][1] = jetcolor_array[cc-1][1];
														col_map[i][2] = jetcolor_array[cc-1][2];
																																
											} 			 
											//alert(col_map);
											/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ lh_c 매칭 와 컬러와 묶음■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
											var lhc_color = [];
											var lhc_array_len = lhc_array.length;
											for (var i = 0; i < lhc_array_len; i++) {
												lhc_color[i] = [lhc_array[i][4], col_map[i][0], col_map[i][1], col_map[i][2] ];
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
													var face1 = geometry.faces[i - faces_start];
													
													face1.color.setRGB(1, 1, 1);
													face1.color.setRGB(
																	final_vertices[vertices_index2 - 1][0],
																	final_vertices[vertices_index2 - 1][1],
																	final_vertices[vertices_index2 - 1][2]);
																						
												}
											}
											
											 for (var i = faces_start; i < obj_array_len-327680; i++) {
													var vertices_index1 = obj_array[i][1];
													var vertices_index2 = obj_array[i][2];
													var vertices_index3 = obj_array[i][3];			
													var face1 = lhgeometry.faces[i-faces_start];
													face1.color.setRGB(1, 1, 1);
													face1.color.setRGB(
																	final_vertices[vertices_index2 - 1][0],
																	final_vertices[vertices_index2 - 1][1],
																	final_vertices[vertices_index2 - 1][2]);
																						
												
											} 			
											
											  for (var i = obj_array_len-327680; i < obj_array_len; i++) {
													var vertices_index1 = obj_array[i][1];
													var vertices_index2 = obj_array[i][2];
													var vertices_index3 = obj_array[i][3];			
													var face1 = rhgeometry.faces[i-(obj_array_len-327680)];
													face1.color.setRGB(1, 1, 1);
													face1.color.setRGB(
																	final_vertices[vertices_index2 - 1][0],
																	final_vertices[vertices_index2 - 1][1],
																	final_vertices[vertices_index2 - 1][2]);
																						
												
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
					
		
					lhmesh.geometry.colorsNeedUpdate = true;
					
				
					rhmesh.geometry.colorsNeedUpdate = true;
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
			renderer.setSize(window.innerWidth/2.3 -100, window.innerHeight/2.3 );
			container.appendChild(renderer.domElement);
			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);
			//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■Screen2■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■//
			lhcontainer = document.getElementById('container2');
			lhscene = new THREE.Scene();
			lhrenderer = new THREE.WebGLRenderer();
			/* Scene */
			lhscene.background = new THREE.Color(0xffffff);
			/*조명*/
			/*ambient = new THREE.AmbientLight(0xffffff, 0.8); */
			/* 포인트 광원을 흰색으로 만들고 나서 입방체의 윗면과 앞면에 빛이 비치도록 */
			var lhpointLight = new THREE.PointLight(0xffffff);
			lhpointLight.position.set(20, 20, 20);
			var lhpointLight1 = new THREE.PointLight(0xffffff);
			lhpointLight1.position.set(-20, -20, -20);
			lhscene.add(lhpointLight);
			lhscene.add(lhpointLight1);
			/* Renderer */
			/*읽기 전용 현재 디스플레이 장치 상의 물리적인 픽셀의 비율을 반환*/
			lhrenderer.setPixelRatio(window.devicePixelRatio);
			/*뷰어 사이즈 설정*/
			lhrenderer.setSize(window.innerWidth/2.3 -100 , window.innerHeight/2.3);
			lhcontainer.appendChild(lhrenderer.domElement);
			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);
			
			//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■Screen3■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■//
			rhcontainer = document.getElementById('container3');
			rhscene = new THREE.Scene();
			rhrenderer = new THREE.WebGLRenderer();
			/* Scene */
			rhscene.background = new THREE.Color(0xffffff);
			/*조명*/
			/*ambient = new THREE.AmbientLight(0xffffff, 0.8); */
			/* 포인트 광원을 흰색으로 만들고 나서 입방체의 윗면과 앞면에 빛이 비치도록 */
			var rhpointLight = new THREE.PointLight(0xffffff);
			rhpointLight.position.set(20, 20, 20);
			var rhpointLight1 = new THREE.PointLight(0xffffff);
			rhpointLight1.position.set(-20, -20, -20);
			rhscene.add(rhpointLight);
			rhscene.add(rhpointLight1);
			/* Renderer */
			/*읽기 전용 현재 디스플레이 장치 상의 물리적인 픽셀의 비율을 반환*/
			rhrenderer.setPixelRatio(window.devicePixelRatio);
			/*뷰어 사이즈 설정*/
			rhrenderer.setSize(window.innerWidth/2.3 -100, window.innerHeight/2.3 );
			rhcontainer.appendChild(rhrenderer.domElement);
			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);
						
			revisual = 1;
		}
		/*창크기에 맞게 변경*/
		function onWindowResize() {
			camera.aspect = (window.innerWidth/1.5 -100 ) / (window.innerHeight/2.3 );
			lhcamera.aspect = (window.innerWidth/1.5 -100) / (window.innerHeight/2.3 );
			rhcamera.aspect = (window.innerWidth/1.5 -100) / (window.innerHeight/2.3 );
			
			/*카메라 투영 행렬을 업데이트*/
			camera.updateProjectionMatrix();
			lhcamera.updateProjectionMatrix();
			rhcamera.updateProjectionMatrix();
				
			renderer.setSize((window.innerWidth/2.3 -100),(window.innerHeight/2.3 ));
			lhrenderer.setSize((window.innerWidth/2.3 -100),(window.innerHeight/2.3 ));
			rhrenderer.setSize((window.innerWidth/2.3 -100),(window.innerHeight/2.3 ));

		}
		/*화면시각변화*/
		function animate() {
			requestAnimationFrame(animate);
			controls.update();
			render();
		}
		function render() {
			renderer.render(scene, camera);
			lhrenderer.render(lhscene, lhcamera);
			rhrenderer.render(rhscene, rhcamera);
						
		}
		
		window.onload = startViewer();
		
	</script>

	<!-- <table style="height: 30px">
		<tr>
			<td><input type="text" id="input"><br></td>
			<td>
				<button onclick="startViewer()">입력받기</button>
			</td> 
		</tr>
	</table>
 -->
<center>

		<table>
		<tr><td style="background:#c2d9ff"><center><h1 style=" font-family: sans-serif;">Connectivity Visualization</h1></center></td></tr>
			<tr>
				<td>
					<table  style="border:2px solid #444444; border-collapse: collapse;">
						<tr>
							<td colspan='2' style="border:2px solid #444444";>
							<center><div id="container"></div></center>
							</td>				
						</tr>
						<tr>
							<td style="border:2px solid #444444";><div id="container2"></div></td>
							<td style="border:2px solid #444444";><div id="container3"></div></td>
						</tr>
					</table>
				</td>
				<td><img src="txt/colorbar1.PNG" alt="My Image"></td>
			</tr>
		</table>
</center>
</body>

</html>