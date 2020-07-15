package JavaProject;

import JavaProjectInitial.ConnectionDb;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

//import JavaProjectInitial.FieldValidator;
@WebServlet("/register2")
public class Register2 extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//String id=request.getParameter("id");
		int flag=0;
		System.out.println("aa to gye2");
		String uname=request.getParameter("uname");
	
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String pass1=request.getParameter("pass1");
		if(pass.equals(pass1))
			flag=1;
		
		try {
			System.out.println("in try");
			if(flag==1){
			Connection con= ConnectionDb.getConn();
			System.out.println("connection done");
			String command="insert into user_credentials values(?,?,?,0,0)";
			PreparedStatement pst=con.prepareStatement(command);
			pst.setString(1, email);
			pst.setString(2, uname);
			pst.setString(3, pass);
			
			int i=pst.executeUpdate();
			if(i>0){
				System.out.println("value inserted2");
				response.sendRedirect("home.html");
			}
			}
			
			else{
				response.sendRedirect("error404.html");
			}
			}
		 catch (Exception e) {
			e.printStackTrace();
		}
	}
}


