package FileManageController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTIManager.dtilist;
import DTIManager.dtilistDaoImpl;
import DTIManager.dtilistService;
import DTIManager.dtilistServiceImpl;

/**
 * Servlet implementation class DTIFileDatabaseAddController
 */
@WebServlet("/DTIFileDatabaseAddController")
public class DTIFileDatabaseAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DTIFileDatabaseAddController() {
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
			
			HttpSession session = request.getSession();
		
			String id	= request.getParameter("id");
			String pnum	= request.getParameter("pnum");
			String pname	= request.getParameter("pname");
			
			int pnum1 =Integer.parseInt(pnum);
			
			String dtiname = request.getParameter("lists");	
			
			String listsArray[]	=dtiname.split("!");
				
			for(int i =0; i<listsArray.length; i++){
			
			System.out.println(listsArray[i]);
			String filepath = request.getSession().getServletContext().getRealPath("/") + "ClientUpload";
		
			dtilistService service = new dtilistServiceImpl(new dtilistDaoImpl());		
			
			dtilist d = new dtilist(0, id, listsArray[i], filepath,"", pnum1);
			service.addDTIFile(d);
			}
			
			
			String view = "/LoginMemberController?passtype=3&aid="+id+"&pname="+pname;
		   
			RequestDispatcher dispatcher = request.getRequestDispatcher(view); 
			if(dispatcher != null) { dispatcher.forward(request, response); }
		 
			}catch(Exception e){
				String view = "/ClientFileUploadPageDTI.jsp";
				response.sendRedirect(view); 
		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher(view); if
		 * (dispatcher != null) { dispatcher.forward(request, response); }
		 */
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
