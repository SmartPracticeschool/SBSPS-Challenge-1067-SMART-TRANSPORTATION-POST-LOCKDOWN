package JavaProject;

import JavaProjectInitial.ConnectionDb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

@WebServlet("/changepass")
public class UpdatePassword extends HttpServlet {
    private Connection con;
    private PreparedStatement ps;
    private RequestDispatcher rd;
    private HttpSession session;
    //private HttpSession session;
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        String pwd=req.getParameter("newpassword");
        String pwd1=req.getParameter("newpassword1");
        String email=req.getParameter("email");
        System.out.println("password process begins");

        try{
            if(pwd.equals(pwd1)){
            con= ConnectionDb.getConn();
            System.out.println("connection done");
            String command="update user_credentials set pass=? where email=?";
            ps=con.prepareStatement(command);
            ps.setString(1,pwd);//for both the queries we have passed the data values one time only as any one of them will get executed at a time
                ps.setString(2,email);
               int check=ps.executeUpdate();
               if(check>0)
                {
//                    session=req.getSession();
//                    session.setAttribute("name", uname);
                    System.out.println("password changed");
//                    rd=req.getRequestDispatcher("login.html");
//                    rd.forward(req, res);


					res.sendRedirect("login.html");
                }
               else{
                   System.out.println("password not changed");
                   res.sendRedirect("error404.html");
               }
            }
            else{
                System.out.println("password not same");
            }
            ps.close();
            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
}

