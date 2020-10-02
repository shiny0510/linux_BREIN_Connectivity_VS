package projectlist;

public class projectlist {
	private int pnum;
	private String id;
	private String pname;
	private String pdate;
	
	public projectlist() {
		
	}
	
	public projectlist(int pnum, String id, String pname, String pdate) {
		super();
		this.pnum = pnum;
		this.id = id;
		this.pname = pname;
		this.pdate = pdate;
	}
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	@Override
	public String toString() {
		return "projectlist [pnum=" + pnum + ", id=" + id + ", pname=" + pname + ", pdate=" + pdate + "]";
	}
	
}
