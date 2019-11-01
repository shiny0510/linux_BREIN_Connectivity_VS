package FileManage;

import java.util.ArrayList;

public interface FMDao {
	void insert(FileManager f); //파일 추가

	FileManager select(String id); //id선택 (파일 찾아오기)
	
	String selectFname(String fname); //파일 찾기

	void update(FileManager f); // 파일 수정  

	void delete(int fnum); //파일 딜리트
	ArrayList<FileManager> selectByDate(String fdate);
	ArrayList<FileManager> selectByFname(String fname);
	ArrayList<FileManager> selectById(String id);
	String selectByFnum(int fnum);
	
	ArrayList<FileManager> selectAll();
	
}
