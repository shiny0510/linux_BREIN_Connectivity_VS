package T1FileManage;

import java.util.ArrayList;

public interface T1FMDao {
	void insert(T1FM t); //t1파일 추가

	T1FM select(String id); //id선택 (파일 찾아오기)
	
	String selectFname(String t1name); //t1파일 찾기

	void update(T1FM t); // t1파일 수정  

	void delete(int t1num); //t1파일 딜리트
	ArrayList<T1FM> selectByDate(String t1date);
	ArrayList<T1FM> selectByFname(String t1name);
	ArrayList<T1FM> selectById(String id);
	String selectByFnum(int t1num);
	
	ArrayList<T1FM> selectAll();
}
