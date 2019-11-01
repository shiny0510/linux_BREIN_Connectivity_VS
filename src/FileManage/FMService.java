package FileManage;

import java.util.ArrayList;

public interface FMService {
	void addFile(FileManager m);  // 아이디, 파일 이름, 파일 경로
 
	void editMovie(FileManager f);  //파일 수정 

	void delMovie(int num); //파일 삭제 

	ArrayList<FileManager> getByDate(String fdate); //날짜로 파일 찾기 (리스트)

	ArrayList<FileManager> getByFname(String fname); //파일 이름으로 파일 찾기 (리스트)

	ArrayList<FileManager> getById(String id); // 아이디로 파일 찾기(리스트)

	String getBynum(int fnum); // 넘버 파일 찾기(리스트)
	
	ArrayList<FileManager> getAll(); //파일 전체 리스트 가져오기 (리스트)

	FileManager getFile(int num); 
	
	int makeFileNum(); //보류 
}
