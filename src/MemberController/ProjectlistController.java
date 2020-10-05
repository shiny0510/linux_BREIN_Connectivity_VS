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
 * Servlet implementation class ProjectlistController
 */
@WebServlet("/ProjectlistController")
public class ProjectlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				response.getWriter().append("Served at: ").append(request.getContextPath());
			
				request.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=EUC-KR");
				response.setCharacterEncoding("euc-kr");	
				
				HttpSession session = request.getSession();
				
				ServletContext application = request.getServletContext();
				/* login processing */
				MemberService service = new MemberServiceImpl(new MemberDaoImpl());		
				
				String passtype = request.getParameter("passtype");
				
				String id = null;
				String pwd = null;
				
				if(passtype.equals("0")) {
				id	= request.getParameter("id");
				pwd	= request.getParameter("pwd");
				
				System.out.println(id);
				System.out.println(pwd);
				
				application.setAttribute("id", id);
				application.setAttribute("pwd", pwd);
				
				String sid=(String)application.getAttribute("id");
				String spwd=(String)application.getAttribute("pwd");
				
				}
				
				boolean flag = service.login(id,pwd);				
				
				String view = "";
				if (flag) {
				
					//Project list get
					projectlistService projectService =new projectlistServiceImpl(new projectDaoImpl());
					ArrayList<projectlist> projectlist = projectService.getById(id);

					request.setAttribute("projectlist", projectlist);
					

					/* session.setAttribute("type", m.getType()); */
					view = "/Projectlist.jsp"; 
					
					RequestDispatcher dispatcher = request.getRequestDispatcher(view);
					
					  if (dispatcher != null) { dispatcher.forward(request, response); }
					 
				} else {
					view = "http://brein.korea.ac.kr/brainorigin/saf/LoginPage/Login.jsp";
					//view = "LoginPage/Login.jsp";
					response.sendRedirect(view); 
					}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
