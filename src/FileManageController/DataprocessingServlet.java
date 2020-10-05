package FileManageController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FileManage.Dataprocessing;
import FileManage.FMDaoImpl;
import FileManage.FMService;
import FileManage.FMServiceImpl;
import FileManage.FileManager;
/**
 * Servlet implementation class DataprocessingServlet
 */
@WebServlet("/DataprocessingServlet")
public class DataprocessingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataprocessingServlet() {
    	
    	
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		try {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id	= request.getParameter("aid");
		String pnum	= request.getParameter("pnum");
		String pname	= request.getParameter("apname");
		String reid = request.getParameter("process");
		int pnum1 =Integer.parseInt(pnum);
		
		String reid1[] = reid.split("  ");
		
		String Processvalue1 = request.getParameter("Processvalue1");
		String Processvalue2 = request.getParameter("Processvalue2");
		
		String filepath = request.getSession().getServletContext().getRealPath("/") + "ClientUpload";
		
		FMService service = new FMServiceImpl(new FMDaoImpl());
		
		FileManager f = new FileManager(0,id,reid,filepath,"",pnum1);
		
		service.addFile(f);
		
		Dataprocessing ProcessStart = new Dataprocessing();
		
		ProcessStart.linuxstart(reid1[0],Processvalue1,Processvalue2);
		
		String view = "/LoginMemberController?passtype=3&aid="+id+"&pname="+pname;
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
		}catch(Exception e){
			String id	= request.getParameter("aid");
			String pnum	= request.getParameter("pnum");
			String pname	= request.getParameter("apname");
			String reid = request.getParameter("process");
			int pnum1 =Integer.parseInt(pnum);
			
			String view = "/LoginMemberController?passtype=3&aid="+id+"&pname="+pname;
			
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
