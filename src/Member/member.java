package Member;

public class member {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private int mtype;
	
	public member() {
		
	}

	public member(String id, String pwd, String name, String tel, int mtype) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.mtype = mtype;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getMtype() {
		return mtype;
	}

	public void setMtype(int mtype) {
		this.mtype = mtype;
	}

	@Override
	public String toString() {
		return "member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", mtype=" + mtype + "]";
	}
	
	
	
}
