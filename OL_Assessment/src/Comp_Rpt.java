

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 public class Comp_Rpt extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int dept_rp=Integer.parseInt(request.getParameter("dept_rp").toString());
	HR hr= (HR) getServletContext().getAttribute("hr");
	HashMap <String,Object> q_avg1= hr.Competencies(dept_rp, 1, 101);
	HashMap <String,Object> q_avg2= hr.Competencies(dept_rp, 2, 101);
	HashMap <String,Object> q_avg3= hr.Competencies(dept_rp, 3, 101);
	String q=hr.displayForm("DPART"+dept_rp, 101);
	request.getSession().setAttribute("q", q);
	request.getSession().setAttribute("q_avg_emp", q_avg1);
	request.getSession().setAttribute("q_avg_sup", q_avg2);
	request.getSession().setAttribute("q_avg_rm", q_avg3);
	if(dept_rp==1)
	request.getRequestDispatcher("4(departmentcompetency1).jsp").forward(request, response);
	else if(dept_rp==2)
		request.getRequestDispatcher("4(departmentcompetency2).jsp").forward(request, response);
	else if(dept_rp==3)
		request.getRequestDispatcher("4(departmentcompetency3).jsp").forward(request, response);
	else if(dept_rp==4)
		request.getRequestDispatcher("4(departmentcompetency4).jsp").forward(request, response);
	else if(dept_rp==5)
		request.getRequestDispatcher("4(departmentcompetency5).jsp").forward(request, response);
	
	}  	  	  	    
}