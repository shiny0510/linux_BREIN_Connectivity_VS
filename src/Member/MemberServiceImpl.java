package Member;

import java.util.ArrayList;

public class MemberServiceImpl implements MemberService {
	private MemberDao dao;
	
	public MemberServiceImpl(MemberDao dao) {
		this.dao = dao;
	}
	
	
	@Override
	public void join(member m) {
		// TODO Auto-generated method stub
		dao.insert(m);
	}

	@Override
	public boolean login(String id, String pwd) {
		// TODO Auto-generated method stub
		member m = getMember(id);
		if(m!=null && m.getPwd().equals(pwd)) {
			return true;
		}
		System.out.println("로그인실패");
		return false;
	}

	@Override
	public member getMember(String id) {
		// TODO Auto-generated method stub
		return dao.select(id);
	}

	@Override
	public String getId(String name, String tel) {
		// TODO Auto-generated method stub
		return dao.selectId(name, tel);
	}

	@Override
	public void editInfo(member m) {
		// TODO Auto-generated method stub
		dao.update(m);
	}

	@Override
	public void out(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public ArrayList<member> getList(String area) {
		// TODO Auto-generated method stub
		return dao.selectAll(area);
	}

}
