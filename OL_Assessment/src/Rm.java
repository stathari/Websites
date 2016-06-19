

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


 public class Rm extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
    	 	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Person p= (Person) getServletContext().getAttribute("p");
		HttpSession hs=request.getSession();
		String supassessed="a" ;
		String empassessed="a";
		String emps="a";
		String dept= hs.getAttribute("dept").toString();
		
		String q=p.displayForm("DPART"+dept, 101);
		String[] qus=q.split(",");
		
		RequestDispatcher r=null;
		for(int i=1; i<11; i++)
		{
			     hs.setAttribute("Q"+i, qus[i]);
		}
		for(int i=1; i<=5; i++)
		{
			if(p.checkStatus("kmitd"+dept+"_e"+i, "DPART"+dept, 1))
				empassessed=empassessed.concat(","+"kmitd"+dept+"_e"+i);
			if(p.checkStatus("kmitd"+dept+"_e"+i, "DPART"+dept, 2))
				supassessed=supassessed.concat(","+"kmitd"+dept+"_e"+i);
			
			emps=emps.concat(","+"kmitd"+dept+"_e"+i);
			
		}
        
        hs.setAttribute("emps", emps);
        hs.setAttribute("supassessed", supassessed);
        hs.setAttribute("empassessed", empassessed);
        
        
        
        
        if(hs.getAttribute("UserName").toString().charAt(7)=='r')
        {
        r=request.getRequestDispatcher("2(rm_loggedin).jsp");
        }
        else
        {
        	
        r=request.getRequestDispatcher("2(sup_loggedin).jsp");
        }
        r.forward(request,response);
				
	}   	  	    
}