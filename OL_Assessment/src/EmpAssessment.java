

import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 public class EmpAssessment extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
  String username=null;
	  	
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
	response.setContentType("text/html");
	Person p=(Person) getServletContext().getAttribute("p");
		String ans="1000";
		for(int i=1;i<=10;i++)
		{
			if(request.getParameter("q"+i+"a").toString().equalsIgnoreCase("null"))
				ans=ans.concat(","+0);
			
			else
			ans=ans.concat(","+request.getParameter("q"+i+"a"));
		}
		
		
			String login_un=(String)(request.getSession().getAttribute("UserName"));
		
		char c_dept=login_un.charAt(5);
		char c_n=login_un.charAt(7);
		
		
		int n=7;
		String dept= "DPART"+c_dept;
		
		if(c_n == 'e'){
			n=1;
			
			p.fillAssesment(ans, dept, n, login_un, 101);
		
			if(p.checkStatus(login_un, dept, n)){
					RequestDispatcher r=request.getRequestDispatcher("/SavedAssessment");
					r.forward(request, response);
			request.getSession().invalidate();
			}
			else
				out.println("Assessment Failed!!!");

		}
		else if(c_n == 's' ){
			n=2;
			username=(String)(request.getSession().getAttribute("un"));
		String comm="a";
		for(int i=1; i<11; i++)
			comm=comm.concat(","+request.getParameter("q_comm"+i));
		p.fillAssesment(ans, dept, n, username, 101);
		p.fillAssesment_Comments(comm, dept, n, username);
		
		if(p.checkStatus(username, dept, n)){
			RequestDispatcher r=request.getRequestDispatcher("2(sup_loggedin).jsp");
			r.forward(request, response);
		
		}
		else
			out.println("Assessment Failed!!!");

		}
		else if(c_n== 'r'){
			n=3;
			username=(String)(request.getSession().getAttribute("un"));
			String comm="a";
			for(int i=1; i<11; i++)
				comm=comm.concat(","+request.getParameter("q_comm"+i));
			p.fillAssesment(ans, dept, n, username, 101);
			p.fillAssesment_Comments(comm, dept, n, username);

			if(p.checkStatus(username, dept, n)){
				RequestDispatcher r=request.getRequestDispatcher("2(rm_loggedin).jsp");
				r.forward(request, response);
				
			}
			else
				out.println("Assessment Failed!!!");

	}
		
			
		}  	  	  	    
}