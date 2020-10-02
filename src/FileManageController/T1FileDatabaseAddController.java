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
				
				String reid = "osh";
				String repwd = "1111";
//				String reid	= request.getParameter("id");
	//			String repwd = request.getParameter("pwd");
				
				
				System.out.println("���� �н�" + request.getSession().getServletContext().getRealPath("/"));
				
				String t1name = request.getParameter("lists");	
				
				//T1FMRIprocessing T1FMRIprocessing = new T1FMRIprocessing();
				
				
				//T1FMRIprocessing.T1Processing(t1name);
				
				System.out.println("t1name");
				System.out.println(t1name);
				
				
				String listsArray[]	=t1name.split("!");
					
				for(int i =0; i<listsArray.length; i++){
				
				System.out.println(listsArray[i]);
				//String filepath = request.getSession().getServletContext().getRealPath("/") + "ClientUpload";
				
				String filepath = "C:/Users/Oh Seung Hwan/git/BREIN_ROI/ObJMesh/WebContent/ClientUpload";

				//String id = (String) session.getAttribute("id");
				String id = "osh";
				
				T1FMService service = new T1FMServiceImpl(new T1FMDaoImpl());
				
				/* String id = request.getParameter("id"); */
				
				/* int type = Integer.parseInt(request.getParameter("type")); */ //����
					
				
				T1FM t = new T1FM(0,id,listsArray[i], filepath,null);
				service.addT1File(t);
				}
				
				
				String view = "/LoginMemberController?passtype=1&id="+reid+"&pwd="+repwd;
				
			
				RequestDispatcher dispatcher = request.getRequestDispatcher(view); 
				if(dispatcher != null) { dispatcher.forward(request, response); }
			 
				}catch(Exception e){
					String view = "/LoginMemberController?passtype=1";
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
