

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


 public class Password extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	 static final long serialVersionUID = 1L;
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		HttpSession hs= request.getSession();
		  
		
		String username= hs.getAttribute("UserName").toString();
		String cpwd= request.getParameter("pwd");
		String npwd= request.getParameter("newPwd");
		String confirm= request.getParameter("confirm");
		Person p= (Person) getServletContext().getAttribute("p");
		int str=p.changePwd(username, cpwd, npwd, confirm);
		
		hs.setAttribute("pwdchecker",str);
		
		RequestDispatcher r=request.getRequestDispatcher("changePwd.jsp");
	    r.forward(request, response);
	}   	  	    
}