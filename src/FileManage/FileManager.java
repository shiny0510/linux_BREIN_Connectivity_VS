package FileManage;

public class FileManager {
	private int fnum;
	private String id;
	private String fname;
	private String fpath;
	private String fdate;
	
	
	public FileManager() {
		
	}
	
	public FileManager(int fnum, String id, String fname, String fpath, String fdate) {
		super();
		this.fnum = fnum;
		this.id = id;
		this.fname = fname;
		this.fpath = fpath;
		this.fdate = fdate;
	}

	public int getFnum() {
		return fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFpath() {
		return fpath;
	}

	public void setFpath(String fpath) {
		this.fpath = fpath;
	}

	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}

	@Override
	public String toString() {
		return "FileManager [fnum=" + fnum + ", id=" + id + ", fname=" + fname + ", fpath=" + fpath + ", fdate=" + fdate
				+ "]";
	}

}

