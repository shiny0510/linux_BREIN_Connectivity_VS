function output() {
	ROIIndex = parseInt(document.getElementById("output").value);

	var ROI = parseInt(ROIIndex);

	alert(obj_array);

	/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■lh_ROI찾기■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

	count = 0; // label_array2의 카운터 			

	for (var i = 0; i < lhc_array.length; i++) { //c파일 길이만큼 스캔
		if (ROI == lhc_array[i]) { // 입력값과 같은 c[i]를 찾음
			var cindex = i; // 같은 인덱스를 cindex에 값을 넣어줌
			boo = lha_array[cindex]; // a[cindex]에 해당하는 boolean값을 넣어줌
		}
	}

	/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■c와 label 같은거 찾기■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

	lhlabel_array2 = new Array(); // 길이는 label 매칭값 추출본 배열.


	boo1 = String(boo); // 불값 저장 
	boo2 = boo1.replace(/\n/g, ""); //행바꿈

	if (boo2 == "TRUE") { //boo1의 값이 트루면. 색칠을 실행

		for (var i = 0; i < lhlabel_array.length; i++) { // 라벨 길이만큼 스캔

			if (ROI == lhlabel_array[i]) { //값과 똑같은 라벨을 찾고 
				lhlabel_array2[count] = i; // 그배열에 count(1씩증가) 순서대로 넣어줌
				count += 1;
			}
		}
	} else {
		alert("실패");
	}

	/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■vertices 추출 본 만들기 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

	Visual(lhlabel_array2);
 }
