

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



 public class SavedAssessment extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Person p= (Person) getServletContext().getAttribute("p");
		RequestDispatcher r;
		
		Object ousername=request.getSession().getAttribute("UserName");
		String username= ousername.toString();
		char dept=username.charAt(5);

			
		char c_n=username.charAt(7);
		int n=7;
	
	
		
		String quest=p.displayForm("DPART"+dept, 101);
		String[] qu= quest.split(",");
		if(c_n == 'e'){
			
			n=1;
			request.getSession().setAttribute("un", username);
			String ans=p.displayMarks("DPART"+dept, n, username, 101);
			String [] marks=ans.split(",");
			for(int i=1; i<11; i++)
			{
				request.setAttribute("q"+i, qu[i]);
				request.setAttribute("m"+i, marks[i]);
			}
		}
		else if(c_n == 's' ){
			
			n=2;
			username=request.getSession().getAttribute("un").toString();
			String ans=p.displayMarks("DPART"+dept, n, username, 101);
			String [] marks=ans.split(",");
			for(int i=1; i<11; i++)
			{
				request.setAttribute("q"+i, qu[i]);
				request.setAttribute("m"+i, marks[i]);
			}
			String ans_comm=p.displayComments("DPART"+dept, n, username, 101);
			String [] comm=ans_comm.split(",");
			for(int i=1; i<11; i++)
			{
				
				if(comm[i].equalsIgnoreCase("null"))
					comm[i]="-";
					request.setAttribute("comm"+i, comm[i]);
			}
			
		}
		else if(c_n== 'r'){
			
			n=3;
			username=request.getSession().getAttribute("un").toString();
			String ans=p.displayMarks("DPART"+dept, n, username, 101);
			String [] marks=ans.split(",");
			for(int i=1; i<11; i++)
			{
				request.setAttribute("q"+i, qu[i]);
				request.setAttribute("m"+i, marks[i]);
			}
			String ans_comm=p.displayComments("DPART"+dept, n, username, 101);
			String [] comm=ans_comm.split(",");
			for(int i=1; i<11; i++)
			{
				if(comm[i].equalsIgnoreCase("null"))
						comm[i]="-";
						request.setAttribute("comm"+i, comm[i]);
				
			}
		}
		
		r=request.getRequestDispatcher("(savedassessment).jsp");
		r.forward(request, response);
	
	}  	  	  	    
}