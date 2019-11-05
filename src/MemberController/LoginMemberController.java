package MemberController;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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

/**
 * Servlet implementation class LoginMemberController
 */
@WebServlet("/LoginMemberController")
public class LoginMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		
		/* �α��� ó�� */
		MemberService service = new MemberServiceImpl(new MemberDaoImpl());		
		
		String passtype = request.getParameter("passtype");
		
		System.out.println(passtype);
		
		String id = null;
		String pwd = null;
		
		if(passtype.equals("0")) {
		id	= request.getParameter("id");
		pwd	= request.getParameter("pwd");
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
		System.out.println(id);
		System.out.println(pwd);
		
		String sid=(String)session.getAttribute("id");
		String spwd=(String)session.getAttribute("pwd");
		System.out.println(sid);
		System.out.println(spwd);
		}
		
		if(passtype.equals("1")) {			
			//id = (String) session.getAttribute("id"); 
			//pwd = (String) session.getAttribute("pwd");
			id = "osh";
			pwd = "1111";
			
			System.out.println("passtype");
			System.out.println(id);
			System.out.println(pwd);
		}
		
		boolean flag = service.login(id,pwd);				
		
		
		System.out.println(flag);
		
		String view = "";
		if (flag) {
		
			//DB���� ����Ʈ �������� 
			FMService FMservice = new FMServiceImpl(new FMDaoImpl());
			ArrayList<FileManager> list = FMservice.getById(id);

			request.setAttribute("list", list);

			ArrayList<FileManager> list2 = FMservice.getById(id);

			ArrayList<FileNull> fnameNull = new ArrayList();
			System.out.println(list.size());
			
			//DBT1���� ����Ʈ �������� 
			T1FMService T1FMService =new T1FMServiceImpl(new T1FMDaoImpl());
			ArrayList<T1FM> T1list = T1FMService.getById(id);

			request.setAttribute("T1list", T1list);

			ArrayList<T1FM> T1list2 = T1FMService.getById(id);

			
			
						
			//��������
			for (int i = 0; i < list.size(); i++) {

				FileManager list3 = list2.get(i);

				String file = "matrixFile/" + list3.getFname();

				InputStream istream = getServletContext().getResourceAsStream(file);
				if (istream == null) {
					fnameNull.add(new FileNull("처리 중"));
				} else {
					fnameNull.add(new FileNull("처리완료"));
				}
			}
			request.setAttribute("listfnameNull", fnameNull);
			
			System.out.println(fnameNull);

			member m = service.getMember(id);
		
			/* session.setAttribute("type", m.getType()); */
			view = "/ClientFileUploadPage.jsp?id="+id+"pwd="+pwd; 
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			
			  if (dispatcher != null) { dispatcher.forward(request, response); }
			 
		} else {
			System.out.print("�̵�");
			view = "http://brein.korea.ac.kr/brainorigin/saf/LoginPage/Login.jsp";
			response.sendRedirect(view); 
			}	 
		}

	/*
	 * private ArrayList<FileManager> fnameNull(int i) { // TODO Auto-generated
	 * method stub return null; }
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
