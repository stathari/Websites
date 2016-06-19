

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 public class Report_Gen_Dept extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
  	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HR hr= (HR) getServletContext().getAttribute("hr");
		request.setAttribute("check", 2);
		
		int dept_gen= Integer.parseInt((request.getParameter("dept_gen")).toString());
		HashMap <String,Object> emps_avg= hr.Average(dept_gen, 101, 1);
		HashMap <String,Object> sups_avg= hr.Average(dept_gen, 101, 2);
		HashMap <String,Object> rms_avg= hr.Average(dept_gen, 101, 3);
		String emps="a";
		for(int i=1; i<6; i++)
		{
			emps=emps.concat(","+"kmitd"+dept_gen+"_e"+i);
		}
		
		request.getSession().setAttribute("dept_gen_down", dept_gen);
		request.getSession().setAttribute("emps", emps);
		request.getSession().setAttribute("emps_avg", emps_avg);
		request.getSession().setAttribute("sups_avg", sups_avg);
		request.getSession().setAttribute("rms_avg", rms_avg);
		request.getRequestDispatcher("7(average).jsp").forward(request, response);
	}  	  	  	    
}