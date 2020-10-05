package MemberController;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FileManage.Mkdirprocessing;
import projectlist.projectDaoImpl;
import projectlist.projectlist;
import projectlist.projectlistService;
import projectlist.projectlistServiceImpl;

/**
 * Servlet implementation class ProjectAddController
 */
@WebServlet("/ProjectAddController")
public class ProjectAddController extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectAddController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=EUC-KR");
			response.setCharacterEncoding("euc-kr");
			
			System.out.println("hi");
			
			HttpSession session = request.getSession();
			String id	= request.getParameter("aid");
			String pwd = request.getParameter("apwd");
			String projectname = request.getParameter("projectname");
			
			System.out.println(projectname);
			
			projectlistService service = new projectlistServiceImpl(new projectDaoImpl());
			
			projectlist p = new projectlist(0,id, projectname,null);
			service.addFile(p);
			
			Mkdirprocessing MkdirProcessStart = new Mkdirprocessing();
			
			MkdirProcessStart.linuxstart(id,projectname);
			
			String view = "/ProjectlistController?passtype=0&id="+id+"&pwd="+pwd;
			
		
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			
			if(dispatcher != null) { dispatcher.forward(request, response); }
		 
			}catch(Exception e){
				String view = "http://brein.korea.ac.kr/brainorigin/saf/Project_add.jsp";
				response.sendRedirect(view); 
			}
		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher(view); if
		 * (dispatcher != null) { dispatcher.forward(request, response); }
		 */
			}	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
