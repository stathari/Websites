

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


 public class Assessment_Status extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
  
		
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		HR p=(HR) getServletContext().getAttribute("hr");
		HttpSession hs= request.getSession();
		String empassessed="a";
		String emps="a";
		String supassessed="a";
		String rmassessed="a";
		int dept=Integer.parseInt(request.getParameter("department").toString());
		
		for(int i=1; i<=5; i++)
		{
			if(p.checkStatus("kmitd"+dept+"_e"+i, "DPART"+dept, 1))
				empassessed=empassessed.concat(","+"kmitd"+dept+"_e"+i);
			if(p.checkStatus("kmitd"+dept+"_e"+i, "DPART"+dept, 2))
				supassessed=supassessed.concat(","+"kmitd"+dept+"_e"+i);
			if(p.checkStatus("kmitd"+dept+"_e"+i, "DPART"+dept, 3))
				rmassessed=rmassessed.concat(","+"kmitd"+dept+"_e"+i);
			emps=emps.concat(","+"kmitd"+dept+"_e"+i);
		
		}
	
			
    hs.setAttribute("emps", emps);
    hs.setAttribute("rmassessed", rmassessed);
    hs.setAttribute("supassessed", supassessed);
    hs.setAttribute("empassessed", empassessed);
	
    request.getRequestDispatcher("5(assesmentstats).jsp").forward(request, response);
	}
}