package JavaProject;

import JavaProjectInitial.ConnectionDb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

@WebServlet("/loginAction")
public class Login extends HttpServlet {
	private Connection con;
	private PreparedStatement ps;
	private RequestDispatcher rd;
	private HttpSession session;

	//private HttpSession session;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		String uname=req.getParameter("uname");
		String pwd=req.getParameter("pass");
		PrintWriter out;
		out = new PrintWriter(System.out);

		try{
			con= ConnectionDb.getConn();
			System.out.println("connection done login");
			ps=con.prepareStatement("select * from user_credentials where uname=? ");
			ps.setString(1,uname);//for both the queries we have passed the data values one time only as any one of them will get executed at a time
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				System.out.println(rs.getString(3));
				if(pwd.equals(rs.getString(3)))
				{
					String command="select * from ticket_details where uname=?";
					PreparedStatement stmt=con.prepareStatement(command);
					stmt.setString(1,uname);
					ResultSet rs1=stmt.executeQuery();
					if(rs1.next()) {
						System.out.println("bookes ticket already");
						session=req.getSession();
						session.setAttribute("name", uname);
						rd=req.getRequestDispatcher("dashboard.jsp");
						rd.forward(req, res);
					}
					else{
						session=req.getSession();
						session.setAttribute("name", uname);
						res.sendRedirect("dashboard.html");
					}


//					res.sendRedirect("dashboard.jsp");
				}
				else{
//					out.print("Wrong credentials .Please try again!");
					System.out.println("wrong password");
					res.sendRedirect("invalid.html");

				}
			}
			else{
				System.out.println("wrong username");
				res.sendRedirect("invalid.html");
			}
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
