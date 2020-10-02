package MemberController;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		/* login processing */
		MemberService service = new MemberServiceImpl(new MemberDaoImpl());		
		
		String passtype = request.getParameter("passtype");
		
		String id = request.getParameter("aid");
		String pwd = request.getParameter("apwd");
		String pname = request.getParameter("pname");
		String pnum1 = request.getParameter("pnum");
		int pnum= Integer.parseInt(pnum1);
		
		System.out.println("dad");
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(pname);
		System.out.println(pnum1);
		
		boolean flag = service.login(id,pwd);				
		
		String view = "";
		if (flag) {
			
			//DB file list get
			FMService FMservice = new FMServiceImpl(new FMDaoImpl());
			ArrayList<FileManager> list = FMservice.getById(id,pnum);
			request.setAttribute("list", list);

			ArrayList<FileManager> list2 = FMservice.getById(id,pnum);
			ArrayList<FileNull> fnameNull = new ArrayList();
			
			//DBT1file list get
			T1FMService T1FMService =new T1FMServiceImpl(new T1FMDaoImpl());
			ArrayList<T1FM> T1list = T1FMService.getById(id,pnum);

			request.setAttribute("T1list", T1list);

			ArrayList<T1FM> T1list2 = T1FMService.getById(id,pnum);		
						
			//file exist? - upload connectivity
			for (int i = 0; i < list.size(); i++) {

				FileManager list3 = list2.get(i);

				String file = "matrixFile/" + list3.getFname();

				InputStream istream = getServletContext().getResourceAsStream(file);
				
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
			
			  if (dispatcher != null) { dispatcher.forward(request, response); }
			 
		} else {
			//view = "http://brein.korea.ac.kr/brainorigin/saf/LoginPage/Login.jsp";
			view = "LoginPage/Login.jsp";
			response.sendRedirect(view); 
			}	 
		}

	/*
	 * private ArrayList<FileManager> fnameNull(int i) { // TODO Auto-generated
	 * method stub return null; }
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
