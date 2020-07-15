package JavaProject;

import JavaProjectInitial.ConnectionDb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.text.DecimalFormat;

@WebServlet("/cancel")
public class CancelTicket extends HttpServlet {
    private Connection con;
    private PreparedStatement ps;
//    private RequestDispatcher rd;
    private HttpSession session;
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        String tno=req.getParameter("tno");
        String uname=" ";

        try {
            con = ConnectionDb.getConn();
            System.out.println("connection done");
//            HttpSession session;
//            String uname= (String)session.getAttribute("name");
            String command0="select * from ticket_details where tno=?";
            PreparedStatement stmt0=con.prepareStatement(command0);
            stmt0.setString(1,tno);
            ResultSet rs0=stmt0.executeQuery();
//                HttpSession session;
            if(rs0.next()) {
                System.out.println("uname got!"+rs0.getString(1));
                uname=rs0.getString(1);}
            else{
                System.out.println("error in getting user name ");
            }
            ps = con.prepareStatement("delete from ticket_details where tno=?");
            ps.setString(1, tno);//for both the queries we have passed the data values one time only as any one of them will get executed at a time
            int check = ps.executeUpdate();
            if (check > 0) {
                System.out.println("ticket cancelled"+uname);
                String command="select * from ticket_details where uname=?";
                PreparedStatement stmt=con.prepareStatement(command);
                stmt.setString(1,uname);
                ResultSet rs1=stmt.executeQuery();
//                HttpSession session;
                if(rs1.next()) {
                    System.out.println("bookes ticket already");
//                    session=req.getSession();
//                    session.setAttribute("name", uname);
                    RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
                    rd.forward(req, res);
                }
                else{
//                    session=req.getSession();
//                    session.setAttribute("name", uname);
                    res.sendRedirect("dashboard.html");
                }

//                res.sendRedirect("dashboard.jsp");
            } else {
                System.out.println("issue in cancelling ticket");
                res.sendRedirect("error404.html");
            }
            ps.close();
            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
}