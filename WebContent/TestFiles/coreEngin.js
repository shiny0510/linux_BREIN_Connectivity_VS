function colormap() {

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■obj파일에서 face 뽑기 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

			var faces_array = []; //모든 faces를 담을 배열

			var faces_count = 0; // faces_array의 카운터

			for (var i = 0; i < obj_array.length; i++) {

				a = String(obj_array[i][0]);
				a1 = a.replace(/\n/g, ""); //행바꿈

				if (a1 == "f") {
					faces_array[faces_count] = obj_array[i];
					faces_count += 1;
				}
			}
			
			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 랜덤 생성 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
			
			var random_array = [];

			first_max = 5; //max 설정
			first_min = 0; //min 설정
			
			var lhc_array_len = lhc_array.length;
			
			for (var i = 0; i < lhc_array_len; i++) { //lh_c.length
				random_array[i] = Math.floor(Math.random() * (first_max - first_min + 1))+ first_min;
			} // ex) 버림((0~1사이 float값) * (5 - 0 + 1)) + 0; 
			
			alert(random_array); // 0~5 랜덤 값
			
			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ min, max 구하기 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
			var maxValue = Math.max.apply(null, random_array); // 최대값 
			
			alert(maxValue);
			
			var minValue  //최소값 
			
			for (var i = 0; i < lhc_array_len; i++) {
					if (!minValue) { //최소가 없을때 
						minValue = random_array[i];
					}

					if (minValue > random_array[i]) { // 0이 아닌, min 값 보다 작은 값을 min으로 설정  
						minValue = random_array[i];
					}
			}
			
			alert(minValue);

			
			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 노말리제이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
			var nor_a = [];
			
			for (var i = 0; i < lhc_array.length; i++) {
				if (random_array[i] != 0) { //0일때 음수 
					nor_a[i] = Math.round(((random_array[i] - minValue) / (maxValue - minValue)) * lhc_array_len); // minmax nm화, 라운딩
				} else { // 0~5
					nor_a[i] = null;  //널값 컬러로 사용할 것. 
				}
			} //min max 정규화

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 컬러매칭 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
			alert("노말배열");
			alert(nor_a);
			
			col_map = [];
			
			
			for (var i = 0; i < nor_a.length; i++) {
				if (nor_a[i] != null) {
					col_map[i] = jetcolor_array[nor_a[i]];
				} else {
					col_map[i] = null;
				}
			}
			alert("컬러맵");
			
			// Three.js lut 설정하기. setMin setMax
			
			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ lh_c 매칭 와 컬러와 묶음■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

			var lhc_color = [];
			var color_count = 0;
			for (var i = 0; i < lhc_array.length; i++) {
				if (col_map[i] != null) {
					lhc_color[color_count] = [ parseInt(lhc_array[i]), col_map[i][0], col_map[i][1], col_map[i][2] ];
					color_count += 1;
				}
			}
				
				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ label 매칭 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
				/* 	alert("테스트");
					alert(lhlabel_array); */
					
				var lhc_color_len = lhc_color.length;
				var lhlabel_array_len = lhlabel_array.length;

				var final_laber = [];
				var final_vertices = [];
				/*★*/
				for (var i = 0; i < lhc_color_len; i++) {
					final_vertices[i] = [];
				}


				for (var i = 0; i < lhc_color_len; i++) {
					final_vertices_count = 0;
					for (var j = 0; j < lhlabel_array_len; j++) {
						if (lhc_color[i][0] == lhlabel_array[j][0]) {
							final_vertices[i][final_vertices_count] = j + 1;
							final_vertices_count += 1;
						}
					}
				}

				alert("final_vertices배열");
				alert(final_vertices);

				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■vertices와 faces 매칭 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

				alert("faces 매칭 시작");
				alert(final_vertices.length);
		
				var faces_array_len = faces_array.length;
			
				/* final_sub */

				var final_faces = []; // vertices와 관련된 faces들을 담을 배열 
				
				var final_vertices_len = final_vertices.length; //스코프 체인 활성화 객체 방지
				
				for (var i = 0; i < final_vertices_len; i++) { //2차원배열 초기화
					final_faces[i] = new Array();
				} 
				
				

				/* alert(lhc_color_len);
				alert(lhlabel_array_len);
				alert(faces_array_len);
				alert(final_vertices[0]);
				alert(final_vertices[1]);
				alert(final_vertices[1].length); */
				alert("faces 계산 시작");
				
				for (var a = 0; a < final_vertices_len; a++) { //컬러와 c랑 매핑한 길이만큼 
				
					for (var i = 0; i < lhlabel_array_len; i++) { 				
						 final_faces_count = 0; 
										
						/* if(final_vertices[a][i] != null){  */
							 for (var j = 0; j < faces_array_len; j++) { 
								if (final_vertices[a][i] == faces_array[j][1]) { // vertices와 faces가 같다면 
									
									final_faces[a][final_faces_count] = j; // 해당 인덱스를 넣어줌 (가시화때 faces 인덱스 정렬)
									final_faces_count += 1;		
									
									/* alert(final_vertices[a][i]);
									alert(faces_array[j][1]);
									alert(a);
									alert(final_faces_count);
									alert(final_faces[a][final_faces_count-1]); */
								}
								
							}
							for (var k = 0; k < faces_array_len; k++) {
							
								if (final_vertices[a][i] == faces_array[k][2]) {
									final_faces[a][final_faces_count] = k;
									final_faces_count += 1;
								}
								 
							}
							for (var l = 0; l < faces_array_len; l++) {
								
								if (final_vertices[a][i] == faces_array[l][3]) {
									final_faces[a][final_faces_count] = l;
									final_faces_count += 1;
								}
							}
						/* }else{
							 break;
						 }*/
					}
				}
				alert("성공");
				alert(final_faces[1]);
				
				
		}
