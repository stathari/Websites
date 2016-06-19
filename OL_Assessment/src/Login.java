

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

 public class Login extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Person p= (Person) getServletContext().getAttribute("p");
		RequestDispatcher r=null;
		HttpSession hs= request.getSession();
		hs.setAttribute("pwdchecker", 0);//pwd checker
		
		if(p.validate(request.getParameter("uname"), request.getParameter("pwd")))
		{
		char dept=request.getParameter("uname").charAt(5);
		
		String details= p.getDetails(request.getParameter("uname"));
		System.out.println(details);
		String[] arr=details.split(",");
			hs.setAttribute("Language",request.getParameter("language"));
			hs.setAttribute("UserName", arr[1]);
			
			hs.setAttribute("Phone_NO", arr[5]);
			hs.setAttribute("Age", arr[6]);
			hs.setAttribute("DOB", arr[7]);
			
			

		
		
			char c=request.getParameter("uname").charAt(7);
			String uname=request.getParameter("uname");
			//char dept1=request.getParameter("uname").charAt(5);
			
//			hs.setAttribute("uName", request.getAttribute("UserName"));
			if(c=='e')
			{
				hs.setAttribute("Name", arr[3]);
				hs.setAttribute("Email_ID", arr[4]);
				hs.setAttribute("dept", dept);
				if(p.checkStatus(uname, "DPART"+dept, 1))
				{
					
					r=request.getRequestDispatcher("/SavedAssessment");
					
				}
				else{
				r= request.getRequestDispatcher("2(assesment).jsp");
				
				String q=p.displayForm("DPART"+dept, 101);
				String[] qus=q.split(",");
				for(int i=1; i<11; i++)
				{
					request.setAttribute("Q"+i, qus[i]);
				}
				request.setAttribute("RM", arr[8]);
				request.setAttribute("Sup", arr[9]);
				
				}
			}
			
			else if(c=='r'){
				hs.setAttribute("Name", arr[3]);
				hs.setAttribute("Email_ID", arr[4]);
				
				hs.setAttribute("dept", dept);
				
				r= request.getRequestDispatcher("/Rm");
			}
			
			else if(c=='s')
			{
				hs.setAttribute("Name", arr[3]);
				hs.setAttribute("Email_ID", arr[4]);
				hs.setAttribute("dept", dept);
				r=request.getRequestDispatcher("/Rm");
			
			
				
				
				
			}
			else
			{
				hs.setAttribute("Name", arr[2]);
				hs.setAttribute("Email_ID", arr[3]);
				r=request.getRequestDispatcher("2(hr_loggedin).jsp");
						
			}
			
		r.forward(request, response);
				
		}
		else
		{
			
			int error=Integer.parseInt(getServletContext().getAttribute("error").toString());
			error=1;
			getServletContext().setAttribute("error",error);
			r=request.getRequestDispatcher("1(home2).jsp");
			r.forward(request, response);	
		}
		
		
	} 
	

}