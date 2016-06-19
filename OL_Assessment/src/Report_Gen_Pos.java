

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


 public class Report_Gen_Pos extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    
	public Report_Gen_Pos() {
		super();
	}   	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HR hr=(HR) getServletContext().getAttribute("hr");
	request.setAttribute("check", 1);
	int pos=Integer.parseInt(request.getParameter("pos").toString());
	request.getSession().setAttribute("pos_down", pos);
	HashMap<String,Object> own_Avg;
	int j=1;
	while(j<6){
	
		own_Avg=hr.Average(j, 101, pos);
	
	request.getSession().setAttribute("own_avg_map"+j, own_Avg);
	
	
	j++;
	
	}
	request.getRequestDispatcher("7(average).jsp").forward(request, response);	
	  	  	  	    
}
 }