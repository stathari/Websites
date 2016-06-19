

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


 public class Competency extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
	   	 	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HR h=(HR) getServletContext().getAttribute("hr");
		String com= h.displayQualifications(Integer.parseInt(request.getSession().getAttribute("dept_comp").toString()));
		if(com.equalsIgnoreCase("a"))
		{
			String str="Please enter the minimum qualifications";
			request.getSession().setAttribute("comp_e", str);
			request.getSession().setAttribute("comp_s", str);
			request.getSession().setAttribute("comp_r", str);
		}
		else{
		String comp[] = com.split(",");
		request.getSession().setAttribute("comp_e", comp[1]);
		request.getSession().setAttribute("comp_s", comp[2]);
		request.getSession().setAttribute("comp_r", comp[3]);
		
		}
		String[] ques= h.displayForm("DPART"+request.getSession().getAttribute("dept_comp").toString(), 101).split(","); 
		for(int i=1;  i<=10 ; i++)
			request.getSession().setAttribute("Q"+i, ques[i]);
		
		
		RequestDispatcher rd= request.getRequestDispatcher(request.getSession().getAttribute("4(comp)").toString());
		rd.forward(request, response);
	}   	  	    
}