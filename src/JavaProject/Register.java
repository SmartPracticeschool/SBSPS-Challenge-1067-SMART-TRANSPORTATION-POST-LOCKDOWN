package JavaProject;

import JavaProjectInitial.ConnectionDb;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

//import JavaProjectInitial.FieldValidator;
@WebServlet("/registerAction")
public class Register extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//String id=request.getParameter("id");
		System.out.println("aa to gye");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String aadhar=request.getParameter("aadhar");
		String mob=request.getParameter("mob");
		try {
			Connection con= ConnectionDb.getConn();
			System.out.println("connection done");
			String command="insert into IBMregistration values(?,?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(command);
			pst.setString(1, fname);
			pst.setString(2, lname);
			pst.setString(3, email);
			pst.setString(4, mob);
			pst.setString(5, aadhar);
			pst.setString(6, gender);
			
			int i=pst.executeUpdate();
			if(i>0){
				System.out.println("valye inserted");
				response.sendRedirect("registration2.html");
			}
			else{
				response.sendRedirect("error404.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


