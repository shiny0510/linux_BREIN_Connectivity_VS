<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/90/three.min.js"></script>
<script src="https://threejs.org/examples/js/controls/OrbitControls.js"></script>
<style>

body {
  overflow: hidden;
  margin: 0;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>

var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera(60, window.innerWidth / window.innerHeight, 1, 1000);
camera.position.set(0, 25, 40);
var renderer = new THREE.WebGLRenderer({
  antialias: true
});
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

var controls = new THREE.OrbitControls(camera, renderer.domElement);

var box = new THREE.Mesh(new THREE.BoxGeometry(30, 30, 30, 30, 30, 30), new THREE.MeshBasicMaterial({
  vertexColors: THREE.VertexColors
}));
scene.add(box);

var wireBox = new THREE.Mesh(new THREE.BoxGeometry(30, 30, 30, 30, 30, 30), new THREE.MeshBasicMaterial({
  color: "black",
  wireframe: true
}));
box.add(wireBox);

var raycaster = new THREE.Raycaster();
var mouse = new THREE.Vector2();
var intersects = [];
var faceIdx1 = -1, faceIdx2 = -1;
var baseColor = new THREE.Color("white");
var selectionColor = new THREE.Color("red");

window.addEventListener("mousemove", function(event) {
  mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
  mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
}, false);

window.addEventListener("mousedown", function(event){
	raycaster.setFromCamera(mouse, camera);
  intersects = raycaster.intersectObject(box);
  if (intersects.length === 0) return;
  
  // set previously selected faces to white
  setFaceColor(faceIdx1, baseColor);

  
  // find the new indices of faces
  faceIdx1 = intersects[0].faceIndex;

  
  // set newly selected faces to red
	setFaceColor(faceIdx1, selectionColor);
}, false)

function setFaceColor(idx, color){
	if (idx === -1) return;
  box.geometry.faces[idx].color.copy(color);
  box.geometry.colorsNeedUpdate = true;
}

render();

function render() {
  requestAnimationFrame(render);
  renderer.render(scene, camera);
}
</script>
</body>
</html>