package T1FileManage;

import java.util.ArrayList;

public interface T1FMService {
	void addT1File(T1FM t);  // 아이디, 파일 이름, 파일 경로
	 
	void editT1File(T1FM t);  //파일 수정 

	void delT1File(int num); //파일 삭제 

	ArrayList<T1FM> getByT1Date(String t1date); //날짜로 파일 찾기 (리스트)

	ArrayList<T1FM> getByt1name(String t1name); //파일 이름으로 파일 찾기 (리스트)

	ArrayList<T1FM> getById(String id, int pnum); // 아이디로 파일 찾기(리스트)

	String getByt1num(int t1num); // 넘버 파일 찾기(리스트)
	
	ArrayList<T1FM> getAll(); //파일 전체 리스트 가져오기 (리스트)

	T1FM getT1File(int t1num); 
	
	int makeT1FileNum(); //보류 
}
