package projectlist;

import java.util.ArrayList;

public interface projectlistService {
	void addFile(projectlist p);  // 아이디, 파일 이름, 파일 경로
	 
	void editprojectlist(projectlist p);  //파일 수정 

	void delprojectlist(int pnum); //파일 삭제 

	ArrayList<projectlist> getByDate(String pdate); //날짜로 파일 찾기 (리스트)

	ArrayList<projectlist> getByFname(String pname); //파일 이름으로 파일 찾기 (리스트)

	ArrayList<projectlist> getById(String id); // 아이디로 파일 찾기(리스트)

	String getBynum(int pnum); // 넘버 파일 찾기(리스트)
	
	ArrayList<projectlist> getAll(); //파일 전체 리스트 가져오기 (리스트)

	projectlist getFile(int pnum); 
	
	int makeFileNum(); //보류 
}
