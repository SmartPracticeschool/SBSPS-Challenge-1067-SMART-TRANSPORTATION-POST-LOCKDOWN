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
import java.sql.ResultSetMetaData;
import java.text.DecimalFormat;

@WebServlet("/ticket")
public class Ticket extends HttpServlet {
	private Connection con;
	private Connection con1;
	private PreparedStatement ps;
	private PreparedStatement ps1;
	private PreparedStatement pst;
	private PreparedStatement pst1;
	private PreparedStatement pst2;
    private PreparedStatement pst3;
    private PreparedStatement pst4;
	String[] selected_routes = new String[50];
	int[] respective_counts = new int[50];
	String route_final=null;
	int num=0;
	int count=0;
	int min_index=0;
//	int next_min=0;
	int factor=0;
//	int diff=0;
//	int min_diff=0;




	//private RequestDispatcher rd;
	//private HttpSession session;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        String uname=req.getParameter("uname");
	    int s_pin= Integer.parseInt(req.getParameter("s_pin"));
		int d_pin= Integer.parseInt(req.getParameter("d_pin"));
		String purpose=req.getParameter("purpose");
		String datetime=req.getParameter("dtime");
		int priority=10;
        num=0;
        int price=0;
		String words[]=purpose.split(" ");
		//System.out.println(words);
		for(String word : words){
			if(word.equals("healthcare")||word.equals("doctor"))
			{
				priority=1;
				System.out.println(priority);
			}
		}
		//System.out.println(s_pin);
		try {
            con = ConnectionDb.getConn();
            System.out.println("connection done");
            String query = "select * from route_details";
            ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();

            int columnsNumber = rsmd.getColumnCount();
            while (rs.next()) {
                //Print one row
                for (int i = 2; i <= columnsNumber; i++) {

                    if (s_pin == rs.getInt(i)) {
                        String source = rs.getString(1);
//                	  System.out.println("source found at "+source);

                        ps1 = con.prepareStatement("select * from route_details where route_name=?");
                        ps1.setString(1, source);
                        ResultSet rs1 = ps1.executeQuery();
//    			      System.out.println("yaha toh aya hai");

                        while (rs1.next()) {

                            for (int j = 2; j <= columnsNumber; j++) {
                                count++;
//                                price += 10;
                                if (d_pin == rs1.getInt(j)) {
//    						       System.out.println("destination found at "+rs1.getString(1));
                                    selected_routes[num] = rs1.getString(1);
                                    respective_counts[num] = count;
                                    num++;
                                    System.out.println("price= "+price);
                                    count = 0;
//                                    price=0;

                                    break;
                                }
                            }
                        }
                        break;
                    }

                    System.out.println();//Move to the next line to print the next row.

                }

            }
            System.out.println("num = " + num);
//			System.out.println(min);
//            System.out.println(route_final);
            //sorting
            int n = respective_counts.length;
            for (int i = 0; i < num; i++)
                for (int j = 0; j < num - i - 1; j++)
                    if (respective_counts[j] > respective_counts[j + 1]) {
                        // swap arr[j+1] and arr[i]
                        int temp = respective_counts[j];
                        respective_counts[j] = respective_counts[j + 1];
                        respective_counts[j + 1] = temp;
                        String temps = selected_routes[j];
                        selected_routes[j] = selected_routes[j + 1];
                        selected_routes[j + 1] = temps;

                    }
            route_final = selected_routes[min_index];
//                    min_index=0;
            System.out.println("finding shortest possible route");
//            for (int k = 0; k < num; k++) {
//                System.out.println(respective_counts[k]+selected_routes[k]);
                String command1 = "select * from route_availability where route_name=?";
                pst1 = con.prepareStatement(command1);
                pst1.setString(1, route_final);

                ResultSet rst = pst1.executeQuery();
                while (rst.next()) {
                    System.out.println("available" + rst.getInt(2));
                    factor = rst.getInt(2);
                    if (factor == 0) {
                        respective_counts[min_index] = 100;
                        System.out.println("value made 100");
                        String command2 = "update route_availability set availability=5 where route_name=?";
                        pst2 = con.prepareStatement(command2);
                        pst2.setString(1, route_final);
                        int i = pst2.executeUpdate();
                        if (i != 1) {
                            System.out.println("some glitch");
                        } else {
                            min_index++;
                            System.out.println("updated min index is " + min_index);
                            if (min_index >= num) {
                                min_index = 0;
                            }
                            route_final = selected_routes[min_index];

                        }
                    }
                }
                System.out.println(route_final);
                    String command3 = "select * from route_availability where route_name=?";
                    pst = con.prepareStatement(command3);
                    pst.setString(1, route_final);
                    ResultSet rst1 = pst1.executeQuery();
                    while (rst1.next()) {
                        factor = rst1.getInt(2);
                        String command4 = "update route_availability set availability=? where route_name=?";
                        pst3 = con.prepareStatement(command4);
                        pst3.setInt(1, (factor-1));
                        pst3.setString(2,route_final);
                        int check=pst3.executeUpdate();
                        if(check!=1){
                            System.out.println("error in updating factor");
                        }
                        else{
                            System.out.println("values updated successfully");
                        }

                    }

                    //updatting booked ticket details
            price=respective_counts[min_index]*10;
                    System.out.println("final price = "+price);
            double a=Math.random();
            DecimalFormat numberFormat = new DecimalFormat("#.###");
            System.out.println(numberFormat.format(a));
            String str=Double.toString(Double.parseDouble(numberFormat.format(a)));
             String tno=uname+"TNBF"+s_pin+"T"+d_pin+str;
                    System.out.println(tno);
            String command5 = "insert into ticket_details values(?,?,?,?,?,?,?)";
            pst4 = con.prepareStatement(command5);
            pst4.setString(1,uname);
            pst4.setInt(2,s_pin);
            pst4.setInt(3,d_pin);
            pst4.setString(4,datetime);
            pst4.setInt(5,price);
            pst4.setString(6,tno);
            pst4.setInt(7,priority);
            int check1=pst4.executeUpdate();
            if(check1<1){
                System.out.println("error in updating ticket details");
                res.sendRedirect("error404.html");
            }
            else{
                System.out.println("ticket values updated successfully");
//                res.sendRedirect("dashboard.jsp");
                RequestDispatcher rd=req.getRequestDispatcher("validation.jsp?tno="+tno);
                rd.forward(req, res);
            }

                }

		catch (Exception e) {
			e.printStackTrace();
		}

	}
}


