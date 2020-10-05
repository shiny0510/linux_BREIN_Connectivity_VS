package FileManageController;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FileManage.T1FMRIprocessing;
import T1FileManage.T1FM;
import T1FileManage.T1FMDaoImpl;
import T1FileManage.T1FMService;
import T1FileManage.T1FMServiceImpl;

/**
 * Servlet implementation class T1FileDatabaseAddController
 */
@WebServlet("/T1FileDatabaseAddController")
public class T1FileDatabaseAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public T1FileDatabaseAddController() {
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
				
				System.out.println("���� �н�" + request.getSession().getServletContext().getRealPath("/"));
				
				String t1name = request.getParameter("lists");	
				
				String listsArray[]	=t1name.split("!");
				
				for(int i =0; i<listsArray.length; i++){
				
				System.out.println(listsArray[i]);
					
				String filepath = request.getSession().getServletContext().getRealPath("/") + "ClientUpload";
					
				T1FMService service = new T1FMServiceImpl(new T1FMDaoImpl());
				T1FM t = new T1FM(0,id,listsArray[i], filepath, "", pnum1);
				
				service.addT1File(t);
				}
				
				String view = "/LoginMemberController?passtype=3&aid="+id+"&pname="+pname;
			
				RequestDispatcher dispatcher = request.getRequestDispatcher(view); 
				if(dispatcher != null) { dispatcher.forward(request, response); }
			 
				}catch(Exception e){
					String view = "/ClientFileUploadPageT1.jsp";
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
