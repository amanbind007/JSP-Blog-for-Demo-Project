package discussBlog.Util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import discussBlog.Dao.RegistrationDao;


@WebServlet("/RegistrationServlet")

public class RegistrationServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String username = (String) request.getParameter("username");
		String email = (String) request.getParameter("email");
		String password = (String) request.getParameter("password");
		String address = (String) request.getParameter("address");
		
		RegistrationDao rdao = new RegistrationDao();
		if(rdao.RegistrationCheck(username, email, password, address)) {
			response.sendRedirect("Login.jsp");
		}
		else {
			String st = "Error";
			response.sendRedirect("Registration.jsp?error=" + st);
		}	
		
	}

}
