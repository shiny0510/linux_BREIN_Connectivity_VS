package FileManageController;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import T1FileManage.T1FM;
import T1FileManage.T1FMDaoImpl;
import T1FileManage.T1FMService;
import T1FileManage.T1FMServiceImpl;

/**
 * Servlet implementation class FMRIFileDatabaseAddController
 */
@WebServlet("/FMRIFileDatabaseAddController")
public class FMRIFileDatabaseAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FMRIFileDatabaseAddController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=EUC-KR");
			response.setCharacterEncoding("euc-kr");
			
			HttpSession session = request.getSession();
			
			String id	= request.getParameter("id");
			String pnum	= request.getParameter("pnum");
			String pname	= request.getParameter("pname");
			
			int pnum1 =Integer.parseInt(pnum);
			
			String t1name = request.getParameter("lists");	
			
			//T1FMRIprocessing T1FMRIprocessing = new T1FMRIprocessing();
			
			
			//T1FMRIprocessing.T1Processing(t1name);
				
			
			
			String view = "/LoginMemberController?passtype=3&aid="+id+"&pname="+pname;
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(view); 
			if(dispatcher != null) { dispatcher.forward(request, response); }
		 
			}catch(Exception e){
				String view = "/ClientFileUploadPageFMRI.jsp";
				response.sendRedirect(view); 
		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher(view); if
		 * (dispatcher != null) { dispatcher.forward(request, response); }
		 */
			}	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
