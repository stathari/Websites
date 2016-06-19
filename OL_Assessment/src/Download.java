

import java.io.IOException;
import java.net.URL;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Jpeg;
import com.lowagie.text.pdf.PdfWriter;

 public class Download extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Document document = new Document();
	      try {
	    	  
	    	  
	    	  response.setContentType("application/pdf");
	          
	          PdfWriter.getInstance(document, response.getOutputStream());
	        document.open();
	        
	        //for question comp rpt! from 4(departmentcompetency1,2,3,4,5)
	        if(request.getSession().getAttribute("from").toString().equalsIgnoreCase("comprept_1"))
	        {
	          HashMap <String,Object> q_avg_emp = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_emp");
	    	  HashMap <String,Object> q_avg_sup = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_sup");
	    	  HashMap <String,Object> q_avg_rm = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_rm");
	    	  String[] que= request.getSession().getAttribute("q").toString().split(",");
	        	
	    	  response.setHeader("Content-disposition", "attachment; filename=CompetencyReportD1.pdf ");
	    	  document.addTitle("AVERAGE SCORE REPORT");
	        Jpeg im=new Jpeg(new URL("http","localhost",8080,"/CodePassion_BL1/images/asd2.jpg"));
	        document.add(im);
	        document.add(new Paragraph("\n"));
	    	  document.add(new Paragraph("The Average score for each given question of the department at all the 3 levels is given."));
	        
	        for(int j=1; j<11; j++){
	        document.add(new Paragraph("\n"+"Q"+j+" "+que[j]));
	        document.add(new Paragraph("The average score given by all the Employee's is: "+q_avg_emp.get("Q"+j)));
	        document.add(new Paragraph("The average score given by the Supervisor is: "+q_avg_sup.get("Q"+j)));
	        document.add(new Paragraph("The average score given by the Review Manager is: "+q_avg_rm.get("Q"+j)));
	        }
	      }
	     
	        else if(request.getSession().getAttribute("from").toString().equalsIgnoreCase("comprept_2"))
	        {
	        	  HashMap <String,Object> q_avg_emp = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_emp");
		    	  HashMap <String,Object> q_avg_sup = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_sup");
		    	  HashMap <String,Object> q_avg_rm = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_rm");
		    	  String[] que= request.getSession().getAttribute("q").toString().split(",");
		        	
		    	  response.setHeader("Content-disposition", "attachment; filename=CompetencyReportD2.pdf ");
		    	  Jpeg im=new Jpeg(new URL("http","localhost",8080,"/CodePassion_BL1/images/asd2.jpg"));
			        document.add(im);
			        document.add(new Paragraph("\n"));
		    	  document.add(new Phrase("AVERAGE SCORE REPORT"));
		        document.add(new Paragraph("The Average score for each given question of the department at all the 3 levels is given."));
		        for(int j=1; j<11; j++){
			        document.add(new Paragraph("\n"+"Q"+j+" "+que[j]));
			        document.add(new Paragraph("The average score given by all the Employee's is: "+q_avg_emp.get("Q"+j)));
			        document.add(new Paragraph("The average score given by the Supervisor is: "+q_avg_sup.get("Q"+j)));
			        document.add(new Paragraph("The average score given by the Review Manager is: "+q_avg_rm.get("Q"+j)));
			        }
	        	
	        }
	        
	        else if(request.getSession().getAttribute("from").toString().equalsIgnoreCase("comprept_3"))
	        {
	        	  HashMap <String,Object> q_avg_emp = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_emp");
		    	  HashMap <String,Object> q_avg_sup = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_sup");
		    	  HashMap <String,Object> q_avg_rm = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_rm");
		    	  String[] que= request.getSession().getAttribute("q").toString().split(",");
		        	
		    	  response.setHeader("Content-disposition", "attachment; filename=CompetencyReportD3.pdf ");
		    	  Jpeg im=new Jpeg(new URL("http","localhost",8080,"/CodePassion_BL1/images/asd2.jpg"));
			        document.add(im);
			        document.add(new Paragraph("\n"));
		    	  document.add(new Phrase("AVERAGE SCORE REPORT"));
		        document.add(new Paragraph("The Average score for each given question of the department at all the 3 levels is given."));
		        for(int j=1; j<11; j++){
			        document.add(new Paragraph("\n"+"Q"+j+" "+que[j]));
			        document.add(new Paragraph("The average score given by all the Employee's is: "+q_avg_emp.get("Q"+j)));
			        document.add(new Paragraph("The average score given by the Supervisor is: "+q_avg_sup.get("Q"+j)));
			        document.add(new Paragraph("The average score given by the Review Manager is: "+q_avg_rm.get("Q"+j)));
			        }
	        	
	        }
	        
	        else if(request.getSession().getAttribute("from").toString().equalsIgnoreCase("comprept_4"))
	        {
	        	  HashMap <String,Object> q_avg_emp = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_emp");
		    	  HashMap <String,Object> q_avg_sup = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_sup");
		    	  HashMap <String,Object> q_avg_rm = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_rm");
		    	  String[] que= request.getSession().getAttribute("q").toString().split(",");
		        	
		    	  response.setHeader("Content-disposition", "attachment; filename=CompetencyReportD4.pdf ");
		    	  Jpeg im=new Jpeg(new URL("http","localhost",8080,"/CodePassion_BL1/images/asd2.jpg"));
			        document.add(im);
			        document.add(new Paragraph("\n"));
		    	  document.add(new Phrase("AVERAGE SCORE REPORT"));
		        document.add(new Paragraph("The Average score for each given question of the department at all the 3 levels is given."));
		        for(int j=1; j<11; j++){
			        document.add(new Paragraph("\n"+"Q"+j+" "+que[j]));
			        document.add(new Paragraph("The average score given by all the Employee's is: "+q_avg_emp.get("Q"+j)));
			        document.add(new Paragraph("The average score given by the Supervisor is: "+q_avg_sup.get("Q"+j)));
			        document.add(new Paragraph("The average score given by the Review Manager is: "+q_avg_rm.get("Q"+j)));
			        }
	        }
	        
	        else if(request.getSession().getAttribute("from").toString().equalsIgnoreCase("comprept_5"))
	        {
	        	  HashMap <String,Object> q_avg_emp = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_emp");
		    	  HashMap <String,Object> q_avg_sup = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_sup");
		    	  HashMap <String,Object> q_avg_rm = (HashMap<String,Object>) request.getSession().getAttribute("q_avg_rm");
		    	  String[] que= request.getSession().getAttribute("q").toString().split(",");
		        	
		    	  response.setHeader("Content-disposition", "attachment; filename=CompetencyReportD5.pdf ");
		    	  Jpeg im=new Jpeg(new URL("http","localhost",8080,"/CodePassion_BL1/images/asd2.jpg"));
			        document.add(im);
			        document.add(new Paragraph("\n"));
		    	  document.add(new Phrase("AVERAGE SCORE REPORT"));
		        document.add(new Paragraph("The Average score for each given question of the department at all the 3 levels is given."));
		        for(int j=1; j<11; j++){
			        document.add(new Paragraph("\n"+"Q"+j+" "+que[j]));
			        document.add(new Paragraph("The average score given by all the Employee's is: "+q_avg_emp.get("Q"+j)));
			        document.add(new Paragraph("The average score given by the Supervisor is: "+q_avg_sup.get("Q"+j)));
			        document.add(new Paragraph("The average score given by the Review Manager is: "+q_avg_rm.get("Q"+j)));
			        }
	        	
	        }
	        
	        
	        //for departmental level! 7(average)
	        if(request.getSession().getAttribute("from").toString().equalsIgnoreCase("check2"))	
	        {
	        	
	        	String[] empsa=(request.getSession().getAttribute("emps").toString()).split(",");
	        	HashMap <String,Object> emps_avg=(HashMap <String,Object>) request.getSession().getAttribute("emps_avg");
	        	HashMap <String,Object> sups_avg=(HashMap <String,Object>) request.getSession().getAttribute("sups_avg");
	        	HashMap <String,Object> rms_avg=(HashMap <String,Object>) request.getSession().getAttribute("rms_avg");
	        	int d=Integer.parseInt(request.getSession().getAttribute("dept_gen_down").toString());
	        	String fileName="Department"+d+"Report"+".pdf ";
	        	
	        	response.setHeader("Content-disposition", "attachment; filename="+fileName);
	        	Jpeg im=new Jpeg(new URL("http","localhost",8080,"/CodePassion_BL1/images/asd2.jpg"));
		        document.add(im);
		        document.add(new Paragraph("\n"));
	        	document.add(new Phrase("EMPLOYEE AVERAGE SCORE REPORT (DEPARTMENT :"+d+")"));
		        document.add(new Paragraph("The Average score for each Employee of the department at all the 3 levels is given."));
	        	
	        	for(int j=1; j<6; j++)
	        	{
	        		document.add(new Paragraph("\n"+"Employee ID: "+ empsa[j]));
	        		if(emps_avg.containsKey(empsa[j]))
	        		document.add(new Paragraph("The Average score given to Employee by himself is: "+ emps_avg.get(empsa[j])));
	        		else document.add(new Paragraph("The Average score given to Employee by himself is: Not Yet Evaluated"));
	        		
	        		if(sups_avg.containsKey(empsa[j]))
	        		document.add(new Paragraph("The Average score given to Employee by Supervisor is: "+ sups_avg.get(empsa[j])));
	        		else document.add(new Paragraph("The Average score given to Employee by Supervisor is: Not Yet Evaluated"));
	        		
	        		if(rms_avg.containsKey(empsa[j]))
	        		document.add(new Paragraph("The Average score given to Employee by Review Manager is: "+ rms_avg.get(empsa[j])));
	        		else document.add(new Paragraph("The Average score given to Employee by Review Manager is: Not Yet Evaluated"));
	        	}
	        	
	        }
	        
	        // for position level!!!
	        else if(request.getSession().getAttribute("from").toString().equalsIgnoreCase("check1"))
	        {
	        	String fileName="a";
	        	String level="a";
	        	int d=Integer.parseInt(request.getSession().getAttribute("pos_down").toString());
	        	if(d==1){
	        	fileName="EmployeeLevelReport.pdf"; level="EMPLOYEE"; }	
	        	else if(d==2){
		        	fileName="SupervisorLevelReport.pdf"; level="SUPERVISOR"; }
	        	else if(d==3){
		        	fileName="ReviewManagerLevelReport.pdf"; level="REVIEW MANAER"; }
	        	
	        	response.setHeader("Content-disposition", "attachment; filename="+fileName);
	        	Jpeg im=new Jpeg(new URL("http","localhost",8080,"/CodePassion_BL1/images/asd2.jpg"));
		        document.add(im);
		        document.add(new Paragraph("\n"));
	        	document.add(new Phrase(level+" LEVEL AVERAGE SCORE REPORT"));
		        document.add(new Paragraph("The Average score for each Employee of all the departments at "+level+" is given."));
	        	
		        int j=1;
		        while(j<6){
		        	HashMap<String,Object> avg_map= (HashMap<String,Object>) request.getSession().getAttribute("own_avg_map"+j);
		        	
		        	String emps="a";
		        	for(int i=1; i<6; i++)
		        	{
		        		emps=emps.concat(","+"kmitd"+j+"_e"+i);
		        	}
		        	String[] empsa= emps.split(",");
		        	
		        	document.add(new Paragraph("\n"+"Department : "+j));
		        	for(int i=1; i<6; i++)
		        	{
		        		if(avg_map.containsKey(empsa[i]))
		        			document.add(new Paragraph(" Employee ID: "+empsa[i]+" Average score at this level is: "+avg_map.get(empsa[i])));
		        		else
		        			document.add(new Paragraph(" Employee ID: "+empsa[i]+" Average score at this level Not Yet Evaluated!"));
		        	}
		        	j++;
		        	avg_map.clear();
		        }
	        }
	        
	        
	      }
	      catch (DocumentException de) {
	          de.printStackTrace();
	          System.err.println("document: " + de.getMessage());
	        }
	        
	        document.close();
	  }
}   	  	    
