

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


public class check extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	static final long serialVersionUID = 1L;
	Connection con;
	Statement st;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			String XML_empsa= request.getParameter("empsa").toString();
			
			int XML_dept= Integer.parseInt(XML_empsa.substring(5, 6));
			
			HR h1=(HR)  getServletContext().getAttribute("hr");
			
			
			
			String XML_out="a";
			for (int i=1; i<=3; i++)
			{
			
				HashMap<String,Object> XML_hash=h1.Average( XML_dept, 101,i);
				String XML_temp= XML_hash.get(XML_empsa).toString();
				XML_out= XML_out.concat(","+XML_temp);
			}
			
			response.setContentType("text/xml");
			
			response.getWriter().write(XML_out);
			
			response.getWriter().close();
			
				
			}
		
		catch (Exception e) {
			
			
			System.out.println("Employee not evaluated");
		}
	}


}