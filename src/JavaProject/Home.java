package JavaProject;

import JavaProjectInitial.ConnectionDb;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import javax.servlet.http.HttpSession;

//import JavaProjectInitial.FieldValidator;
@WebServlet("/source")
public class Home extends HttpServlet {
//	private HttpSession session;
	private RequestDispatcher rd;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//String id=request.getParameter("id");
		
		System.out.println("aa to gye3");
//		String address=request.getParameter("sAddress");
	    String uname=request.getParameter("uname");
		String state=request.getParameter("sstate");
		String pin=request.getParameter("spin");

		
		
		try {
			System.out.println("in try");
			
			Connection con= ConnectionDb.getConn();
			System.out.println("connection done3");
			String command="update user_credentials set s_pin=? where uname=?";
			PreparedStatement pst=con.prepareStatement(command);
//			pst.setString(1, address);
			pst.setInt(1, Integer.parseInt(pin));
			pst.setString(2, uname);
			
			
			
			int i=pst.executeUpdate();
			if(i>0){
//				System.out.println("valye inserted3");
//				session=request.getSession();
//				session.setAttribute("name", uname);
//				rd=request.getRequestDispatcher("dashboard.html");
//				rd.forward(request, response);
				response.sendRedirect("destination.html");
			}
			else{
				System.out.println("unable to update source");
				response.sendRedirect("error404.html");
			}
		
			}
		 catch (Exception e) {
			e.printStackTrace();
		}
	}
}


