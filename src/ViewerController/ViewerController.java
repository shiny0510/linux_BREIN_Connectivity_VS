package ViewerController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FileManage.FMDaoImpl;
import FileManage.FMService;
import FileManage.FMServiceImpl;
import FileManage.FileManager;

/**
 * Servlet implementation class ViewerController
 */
@WebServlet("/ViewerController")
public class ViewerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		int fnum =  Integer.parseInt(request.getParameter("fnum"));
		
		FMService FMservice = new FMServiceImpl(new FMDaoImpl());	
		
		
		String fname = FMservice.getBynum(fnum);
		 
		request.setAttribute("fname", fname);
		
		System.out.println(fname);
		
		String file = "matrixFile/"+fname;
		
		System.out.println(file);
		
		InputStream istream = getServletContext().getResourceAsStream(file);		
		String view = "";
		if(istream != null) {
			view="ViewerTest.jsp";
		}else {
			view = "WaitBar.jsp";
		}
		
		 RequestDispatcher dispatcher = request.getRequestDispatcher(view); 
		 if(dispatcher != null) { dispatcher.forward(request, response); }
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
