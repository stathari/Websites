

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


 public class Qual extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HR h= (HR) getServletContext().getAttribute("hr");
		int hide=Integer.parseInt(request.getParameter("hide").toString());
		
		if(hide==2){
		String ques="101";
		for(int i=1; i<=10; i++)
		{
			ques=ques.concat(","+request.getParameter("QQ"+i).toString()+","+request.getParameter("sup"+i).toString()+","+request.getParameter("rm"+i).toString());
		}
		int dept=Integer.parseInt(request.getSession().getAttribute("dept_comp").toString());
		h.Questions(ques, dept);
		response.getWriter().println("Questions updated in the DEPATMENT! ");
		
	}  	  	  	    
	else if(hide==1)
	{
		String emp=request.getParameter("employee").toString();
		String sup=request.getParameter("supervisor").toString();
		String rm=request.getParameter("reviewmanager").toString();
		int dept=Integer.parseInt(request.getSession().getAttribute("dept_comp").toString());
		h.fillQualifications(emp, sup, rm, dept);
		response.getWriter().println("<html>Qualifications updated ! <a href=\"4(questioncomp).jsp\" target=\"compframe\">Next Page</a></html>");
	
	}
}
}