package JavaProject;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/logoutSrv")
public class LogoutServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res){
        HttpSession sess=req.getSession();
        if(sess!=null){
            sess.invalidate();
            try {
                System.out.println("session terminated");
                res.sendRedirect("index.html");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
