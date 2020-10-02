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
		
		//String reid = (String)session.getAttribute("id");
		//String repwd = (String)session.getAttribute("pwd");
		String reid = "osh";
		String repwd = "1111";
		
		System.out.println("" + request.getSession().getServletContext().getRealPath("/"));
		
		String filename = request.getParameter("lists");	
		
		String filepath = request.getSession().getServletContext().getRealPath("/") + "ClientUpload";
		
		//String filepath = "C:/Users/Oh Seung Hwan/git/BREIN_ROI/ObJMesh/WebContent/ClientUpload";

		//String id = (String) session.getAttribute("id");
		
		FMService service = new FMServiceImpl(new FMDaoImpl());
		
		/* String id = request.getParameter("id"); */
		
		/* int type = Integer.parseInt(request.getParameter("type")); */ //����
			
		String id = "osh";
		
		FileManager f = new FileManager(0,id,filename,filepath,null);
		service.addFile(f);
		String view = "/LoginMemberController?passtype=1&id="+reid+"&pwd="+repwd;
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
		}catch(Exception e){
			String view = "/LoginMemberController?passtype=1";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			if (dispatcher != null) {
				dispatcher.forward(request, response);
			}
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
