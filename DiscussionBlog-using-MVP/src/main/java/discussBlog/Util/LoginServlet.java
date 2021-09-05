package discussBlog.Util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import discussBlog.Dao.LoginDao;
import discussBlog.Model.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uemail = request.getParameter("uemail");
		String upass = request.getParameter("upass");
		
		LoginDao dao = new LoginDao();
		if(dao.loginCheck(uemail, upass)) {
			
			HttpSession session = request.getSession();
			
			User user = dao.getUser(uemail, upass);
			int userID = user.userID;
			session.setAttribute("userID", userID);
			session.setAttribute("user", user);
			response.sendRedirect("Home.jsp");
			
		}
		else {
			String st = "Invalid";
			response.sendRedirect("Login.jsp?invalid=" + st);
		}
		
	}

}
