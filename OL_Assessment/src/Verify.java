

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


 public class Verify extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
   	 	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Person p=(Person) getServletContext().getAttribute("p");
		
		HttpSession hs= request.getSession(); 
		
		RequestDispatcher r=null;
		String eun=request.getParameter("emp_un");		
		char dept= eun.charAt(5);
	hs.setAttribute("un", eun);
	
	String empmark=p.displayMarks("DPART"+dept, 1, eun, 101);
	String[] empmarks=empmark.split(",");
	for(int i=1; i<11; i++)
	{
		     hs.setAttribute("empq"+i, empmarks[i]);
		     
	}
	if(hs.getAttribute("UserName").toString().charAt(7)== 'r'){
		if(p.checkStatus(eun,"DPART"+dept, 2) && p.checkStatus(eun,"DPART"+dept, 3))
				{
	
				r= request.getRequestDispatcher("/SavedAssessment");
				
		}
		else{
	
		String supmark=p.displayMarks("DPART"+dept, 2, eun, 101);
		String[] supmarks=supmark.split(",");
		for(int i=1; i<11; i++)
		{
			     hs.setAttribute("supq"+i, supmarks[i]);
			     			      
		}
		r= request.getRequestDispatcher("3(rm_assesment).jsp");
		}
		}
	
	
		else if(request.getSession().getAttribute("UserName").toString().charAt(7)=='s'){
			if(p.checkStatus(eun,"DPART"+dept, 2))
			{
	
			r= request.getRequestDispatcher("/SavedAssessment");
		
			}
			else {
		
			r= request.getRequestDispatcher("3(sup_assesment).jsp");
			}
		}
		
	r.forward(request, response);
		
		
	}
}