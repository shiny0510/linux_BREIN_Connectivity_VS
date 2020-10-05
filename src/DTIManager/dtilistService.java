package DTIManager;

import java.util.ArrayList;

public interface dtilistService {
	void addDTIFile(dtilist d);  // 아이디, 파일 이름, 파일 경로
	 
	void editDTIFile(dtilist d);  //파일 수정 

	void delDTIFile(int num); //파일 삭제 

	ArrayList<dtilist> getByDTIDate(String dtidate); //날짜로 파일 찾기 (리스트)

	ArrayList<dtilist> getByDTIname(String dtiname); //파일 이름으로 파일 찾기 (리스트)

	ArrayList<dtilist> getById(String id, int pnum); // 아이디로 파일 찾기(리스트)

	String getByDTInum(int dnum); // 넘버 파일 찾기(리스트)
	
	ArrayList<dtilist> getAll(); //파일 전체 리스트 가져오기 (리스트)

	dtilist getDTIFile(int dnum); 
	
	int makeDTIFileNum(); //보류 
}
