package MemberController;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FileManage.FMDaoImpl;
import FileManage.FMService;
import FileManage.FMServiceImpl;
import FileManage.FileManager;
import FileManage.FileNull;
import Member.MemberDaoImpl;
import Member.MemberService;
import Member.MemberServiceImpl;
import Member.member;
import T1FileManage.T1FM;
import T1FileManage.T1FMDaoImpl;
import T1FileManage.T1FMService;
import T1FileManage.T1FMServiceImpl;
import projectlist.projectDaoImpl;
import projectlist.projectlist;
import projectlist.projectlistService;
import projectlist.projectlistServiceImpl;

/**
 * Servlet implementation class LoginMemberController
 */
@WebServlet("/LoginMemberController")
public class LoginMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginMemberController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.getWriter().append("Served at: ").append(request.getContextPath());

		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");

		HttpSession session = request.getSession();

		/* login processing */
		MemberService service = new MemberServiceImpl(new MemberDaoImpl());

		String passtype = request.getParameter("passtype");

		String id = request.getParameter("aid");
		String pwd = request.getParameter("apwd");
		String pnum1 = request.getParameter("pnum");
		String pname = request.getParameter("pname");
		int pnum = Integer.parseInt(pnum1);

		System.out.println("dad");
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(pnum1);

		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);

		boolean flag = service.login(id, pwd);
		if (passtype.equals("3")) {
			System.out.println("aa");
			flag = true;
		}

		String view = "";
		if (flag) {
			System.out.println("aa");
			// DB file list get
			FMService FMservice = new FMServiceImpl(new FMDaoImpl());
			ArrayList<FileManager> list = FMservice.getById(id, pnum);
			request.setAttribute("list", list);

			ArrayList<FileManager> list2 = FMservice.getById(id, pnum);
			ArrayList<FileNull> fnameNull = new ArrayList();

			// DT1file list get
			T1FMService T1FMService = new T1FMServiceImpl(new T1FMDaoImpl());
			ArrayList<T1FM> T1list = T1FMService.getById(id, pnum);

			request.setAttribute("T1list", T1list);

			// file exist? - T1image
			ArrayList<T1FM> T1list0 = T1FMService.getById(id, pnum);
			ArrayList<FileNull> fnameNull0 = new ArrayList();
			for (int j = 0; j < T1list0.size(); j++) {
				T1FM T1list1 = T1list0.get(j);

				String file = "/home/osh0510/WebDatabase/" + id + "/" + pname + "/" + T1list1.getT1name()
						+ "_t1.nii.gz";

				// InputStream istream2 = getServletContext().getResourceAsStream(file);
				try {
					File istream0 = new File(file);
					FileReader file_reader = new FileReader(istream0);
					fnameNull0.add(new FileNull("T1-Exist"));
				} catch (IOException e) {
					fnameNull0.add(new FileNull("T1-Not Exist"));
				}
			}
			request.setAttribute("listfnameNull0", fnameNull0);

			// T1list get
			ArrayList<T1FM> T1list2 = T1FMService.getById(id, pnum);
			ArrayList<FileNull> fnameNull2 = new ArrayList();

			// file exist? - DTIimage
			for (int j = 0; j < T1list2.size(); j++) {

				T1FM T1list3 = T1list2.get(j);

				String file = "/home/osh0510/WebDatabase/" + id + "/" + pname + "/" + T1list3.getT1name()
						+ "_dti.nii.gz";

				// InputStream istream2 = getServletContext().getResourceAsStream(file);
				try {
					File istream2 = new File(file);
					FileReader file_reader = new FileReader(istream2);
					fnameNull2.add(new FileNull("DTI-Exist"));
				} catch (IOException e) {
					fnameNull2.add(new FileNull("DTI-Not Exist"));
				}
			}
			request.setAttribute("listfnameNull2", fnameNull2);
			// T1list get
			ArrayList<T1FM> T1list4 = T1FMService.getById(id, pnum);
			ArrayList<FileNull> fnameNull4 = new ArrayList();

			// file exist? - FMRIimage
			for (int j = 0; j < T1list4.size(); j++) {

				T1FM T1list5 = T1list4.get(j);

				String file = "/home/osh0510/WebDatabase/" + id + "/" + pname + "/" + T1list5.getT1name()
						+ "_fmri.nii.gz";

				System.out.println(file);

				// InputStream istream4 = getServletContext().getResourceAsStream(file);
				try {
					File istream4 = new File(file);
					FileReader file_reader2 = new FileReader(istream4);

					System.out.println(file_reader2);
					fnameNull4.add(new FileNull("FMRI-Exist"));
				} catch (IOException e) {
					fnameNull4.add(new FileNull("FMRI-Not Exist"));
				}

			}
			request.setAttribute("listfnameNull4", fnameNull4);

			// file exist? - upload connectivity
			for (int i = 0; i < list.size(); i++) {

				FileManager list3 = list2.get(i);

				String file = "/home/osh0510/WebDatabase/" + id + "/" + pname + "/matrix\n" + list3.getFname();

				// InputStream istream = getServletContext().getResourceAsStream(file);

				File istream = new File(file);

				System.out.println(istream);

				if (istream == null) {
					fnameNull.add(new FileNull("preprosseing Yet"));
				} else {
					fnameNull.add(new FileNull("preprosseing success"));
				}
			}
			request.setAttribute("listfnameNull", fnameNull);

			member m = service.getMember(id);

			/* session.setAttribute("type", m.getType()); */
			view = "/ClientFileUploadPage.jsp";

			RequestDispatcher dispatcher = request.getRequestDispatcher(view);

			if (dispatcher != null) {
				dispatcher.forward(request, response);
			}

		} else {
			view = "http://brein.korea.ac.kr/brainorigin/saf/LoginPage/Login.jsp";
			// view = "LoginPage/Login.jsp";
			response.sendRedirect(view);
		}
	}

	/*
	 * private ArrayList<FileManager> fnameNull(int i) { // TODO Auto-generated
	 * method stub return null; }
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
