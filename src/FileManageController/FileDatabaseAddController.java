package FileManageController;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FileManage.FMDaoImpl;
import FileManage.FMService;
import FileManage.FMServiceImpl;
import FileManage.FileManager;
import Member.MemberDaoImpl;
import Member.MemberService;
import Member.MemberServiceImpl;

/**
 * Servlet implementation class FileDatabaseAddController
 */
@WebServlet("/FileDatabaseAddController")
public class FileDatabaseAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDatabaseAddController() {
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
		
		System.out.println("" + request.getSession().getServletContext().getRealPath("/"));
		
		String filename = request.getParameter("lists");	
		
		String listsArray[]	=filename.split("!");
		
		for(int i =0; i<listsArray.length; i++){
		
		String filepath = request.getSession().getServletContext().getRealPath("/") + "ClientUpload";
			
		FMService service = new FMServiceImpl(new FMDaoImpl());
		
		FileManager f = new FileManager(0,id,listsArray[i],filepath,"",pnum1);
		service.addFile(f);
		}
		
		String view = "/LoginMemberController?passtype=3&aid="+id+"&pname="+pname;
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
		}catch(Exception e){
			String id	= request.getParameter("id");
			String pnum	= request.getParameter("pnum");
			String pname	= request.getParameter("pname");
			
			int pnum1 =Integer.parseInt(pnum);
			
			String view = "/LoginMemberController?passtype=3&aid="+id+"&pname="+pname;
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
