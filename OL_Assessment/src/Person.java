

import java.sql.*;


public class Person {
	Connection c,con1; //con2,con3,con4,con5;
	
	public Person()
	{
		try
		{
		Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
		c= DriverManager.getConnection("jdbc:db2:HR","admin","admin");	
		con1= DriverManager.getConnection("jdbc:db2:PERSON","admin","admin");
		}
		catch(Exception e)
		{
			System.out.println("In PERSON constructor");
			e.printStackTrace();
		}
	}
	public Boolean validate(String username,String password)
	{//simple validate. checks uid and password from db
		String str="false";
		try{
			Statement s1;
			char cc1=username.charAt(5);
			char c2=username.charAt(7);
		
			if(cc1=='h')
			{
	
				s1= c.createStatement();	
				ResultSet rs=s1.executeQuery("select USERNAME,PASSWORD from USER_DATA");
				rs.next();
				if(username.equalsIgnoreCase(rs.getString(1)) && password.equalsIgnoreCase(rs.getString(2)))
				{
					str="true";
				}
			}
			else{
			
				s1= con1.createStatement();	
		
			ResultSet rs=null;
			
			if(c2=='e'){
				 rs= s1.executeQuery("Select USERNAME,PASSWORD from EMPLOYEE where DEPARTMENT="+cc1+"");
				System. out.println("1st Servlt call");
			}else if(c2=='r')
				rs= s1.executeQuery("Select USERNAME,PASSWORD from REVIEW_MANAGER where DEPARTMENT="+cc1+"");
			else if(c2=='s')
				rs= s1.executeQuery("Select USERNAME,PASSWORD from SUPERVISOR where DEPARTMENT="+cc1+"");
			
			while(rs.next()){
			if(username.equalsIgnoreCase(rs.getString(1)) && password.equalsIgnoreCase(rs.getString(2)))
			{	str="true";		
				break;
			}
			}
		rs.close();
		s1.close();
			
			}
			
		}
		catch(Exception e)
		{
			System.out.println("In Person.java in Validate method!");
			e.printStackTrace();
			
		}
		return (Boolean.parseBoolean(str));
	}

	
	public String displayForm(String dept, int test_num)
	{//Method to display QUESTIONS FOR any emp or rm or sup
		//REMEBER!!!!:- The string we get off this method has test number as its 1st argument! :) 
		String str=Integer.toString(test_num);
	
		try{
			Statement s1;
			s1= con1.createStatement();	
			ResultSet rs=null;
		
		for(int i=1; i<=10; i++)
		{
			rs=s1.executeQuery("select Q"+i+" from COMPETENCIES where TEST_NUMBER="+test_num+" and DEPARTMENT="+dept.charAt(5)+" ");
			rs.next();
			str=str.concat(","+rs.getString("Q"+i));
		}
		rs.close();
		s1.close();
			}
		catch(Exception e)
		{
			System.out.println("IN Person.java in display form!");
			e.printStackTrace();
		}
		return str;
	}
	
	public String displayComments(String dept, int n, String id, int test_num)
	{//Method to display COMMENTS given by 'n'-level to 'id'- employee
		String str="a";
		try{
			Statement s1;

				s1= con1.createStatement();	
	
		ResultSet rs=null;
		
		for(int i=1; i<=10; i++)
		{
			rs=s1.executeQuery("select * from REMARKS where TEST_NUMBER="+test_num+" AND FLAG="+n+" AND MEMBER_ID='"+id+"' AND DEPARTMENT="+dept.charAt(5)+" ");
			rs.next();
			
			str=str.concat(","+rs.getString("Q"+i+"_COMMENTS"));
		}
		rs.close();
		s1.close();
			}
		catch(Exception e)
		{
			System.out.println("IN Person.java in displayComments!");
			e.printStackTrace();
		}
		return str;
	}

	public String displayMarks(String dept, int n, String id, int test_num)
	{//Method to display marks FOR any emp or rm or sup
		String str="a";
		try{
		
	
		Statement s1;
	
			s1= con1.createStatement();	
		
		 ResultSet rs=null;
		
		for(int i=1; i<=10; i++)
		{
			rs=s1.executeQuery("select * from REMARKS where TEST_NUMBER="+test_num+" AND FLAG="+n+" AND MEMBER_ID='"+id+"'AND DEPARTMENT="+dept.charAt(5)+" ");
			rs.next();
			str=str.concat(","+rs.getString("Q"+i));
		}
		rs.close();
		s1.close();
			}
		catch(Exception e)
		{
			System.out.println("IN Person.java in displayMarks!");
			e.printStackTrace();
		}
		return str;
	}
	
public void fillAssesment(String marks, String dept, int n, String id, int test_num)
	{// this method will fill the answers in the db!
		try{
			
			Statement s1;
		
				s1= con1.createStatement();	
		
			String[] scr=marks.split(",");
			s1.executeUpdate("insert into REMARKS (TEST_NUMBER, MEMBER_ID, FLAG, DEPARTMENT) values ("+test_num+",'"+id+"',"+n+","+dept.charAt(5)+") ");
			for(int i=1; i<=10; i++){
				s1.executeUpdate("update REMARKS set Q"+i+"="+Integer.parseInt(scr[i])+" where FLAG="+n+" AND MEMBER_ID='"+id+"' ");

			}
			s1.close();
			 }
		catch(Exception e)
		{
			System.out.println("IN Person.java in fillAssessment!");
			e.printStackTrace();
		}
	}
 public void fillAssesment_Comments(String comments, String dept, int n, String id)
	{// this method will fill comments in the db!
		try{
			Statement s1;
	
				s1= con1.createStatement();	
			String[] scr=comments.split(",");
			for(int i=1; i<=10; i++){
				s1.executeUpdate("update REMARKS set Q"+i+"_COMMENTS='"+scr[i]+"' where FLAG="+n+" AND MEMBER_ID='"+id+"' ");
				}
			s1.close();

			 }
		catch(Exception e)
		{
			System.out.println("IN Person.java in fillAssessment_comments");
			e.printStackTrace();
		}
	}
public Boolean checkStatus(String id, String dept, int n)
	{ // method will check whether the employee has been assessed on that level!
		String s="false";
		try{
			
			Statement s1;
		
				s1=con1.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
			ResultSet rs= s1.executeQuery("select * from REMARKS where MEMBER_ID='"+id+"' AND FLAG="+n+" ");
			rs.next();
			if(rs.isFirst())
				s="true";
			rs.close();
			s1.close();

		}
		catch(Exception e)
		{
			System.out.println("IN Person.java in checkStatus!");
			e.printStackTrace();
		}
		if(s.equalsIgnoreCase("true"))
			return true;
		else
			return false;
		
	}
public String getDetails(String username)
	{// method will give all the details of that employee. 
		String str="a";
		try{
			char cc1=username.charAt(5);
			char c2=username.charAt(7);
			Statement s1;
			ResultSet rs;
			if(cc1=='h')
			{
				s1= c.createStatement();	
				rs=s1.executeQuery("select * from USER_DATA where USERNAME='"+username+"'  ;");
			}
			else{
				
					s1= con1.createStatement();	
		 rs=null;
				 if(c2=='e'){
					 rs= s1.executeQuery("Select * from EMPLOYEE where USERNAME='"+username+"' AND DEPARTMENT="+cc1+" ");
					
				}
				 else if(c2=='r'){
					rs= s1.executeQuery("Select * from REVIEW_MANAGER where USERNAME='"+username+"' AND DEPARTMENT="+cc1+" ");
				 
				}
				 else if(c2=='s'){
					rs= s1.executeQuery("Select * from SUPERVISOR where USERNAME='"+username+"' AND DEPARTMENT="+cc1+" ");
				
				 }
				 }
			rs.next();
				 for(int i=1; i<=8 ;  i++)
				 
				 {
					 if(i!=2){
					 str=str.concat(","+rs.getString(i));
					 }
				 }
				 
				 
				 rs.close();
				if(cc1!='h' ){
				 rs=s1.executeQuery("Select NAME from REVIEW_MANAGER where DEPARTMENT="+cc1+" "); 
				 rs.next();
				 str=str.concat(","+rs.getString(1));
				 rs.close();
				 rs=s1.executeQuery("Select NAME from SUPERVISOR where DEPARTMENT="+cc1+" "); 
				 rs.next();
				 str=str.concat(","+rs.getString(1));
				 rs.close();
				
				}
				 s1.close();
				 
		}
		catch(Exception e)
		{
			System.out.println("IN Person.java in getDetails!");
			e.printStackTrace();
		}
		return str;
	}	
public int changePwd(String username, String curr_password, String new_password, String confirm)
	{// method to change password of that particular employee!
			Statement s;
			ResultSet r;
			int str=76;
			try{
				char cc1=username.charAt(5);
				char c2=username.charAt(7);
				if(cc1=='h')
				{
				s=c.createStatement();	
				r=s.executeQuery("Select PASSWORD from USER_DATA where USERNAME='"+username+"' ");
				if(new_password.equals(confirm))
				{
					r.next();
					
						if(r.getString(1).equals(curr_password))
						{
							s.executeUpdate("Update USER_DATA set PASSWORD='"+new_password+"' where USERNAME='"+username+"' ");
							str=1;//"Password changed successfully";
						}
						else
						{
							str=2;//"Current password did not match";
						}
					}
				
					else
					{
						str=3;//"Password not confirmed";
					}
				}	
				else
				{
					s=con1.createStatement();
					if(c2=='e')
					{
						r=s.executeQuery("Select PASSWORD from EMPLOYEE where USERNAME='"+username+"' ");
						if(new_password.equals(confirm))
						{
							r.next();
							
								if(r.getString(1).equals(curr_password))
								{
									s.executeUpdate("Update EMPLOYEE set PASSWORD='"+new_password+"' where USERNAME='"+username+"' ");
									str=1;//"Password changed successfully";
								}
								else
								{
									str=2;//"Current password did not match";
								}
							
						}
							else
							{
								str=3;//"Password not confirmed";
							}
					}
					else if(c2=='s')
					{
						r=s.executeQuery("Select PASSWORD from SUPERVISOR where USERNAME='"+username+"' ");
						if(new_password.equals(confirm))
						{
							r.next();
							
								if(r.getString(1).equals(curr_password))
								{
									s.executeUpdate("Update SUPERVISOR set PASSWORD='"+new_password+"' where USERNAME='"+username+"' ");
									str=1;//"Password changed successfully";
								}
								else
								{
									str=2;//"Current password did not match";
								}
							
						}
							else
							{
								str=3;//"Password not confirmed";
							}
					}
					else
					{
						r=s.executeQuery("Select PASSWORD from REVIEW_MANAGER where USERNAME='"+username+"' ");
					
					if(new_password.equals(confirm))
					{
						r.next();
						
							if(r.getString(1).equals(curr_password))
							{
								s.executeUpdate("Update REVIEW_MANAGER set PASSWORD='"+new_password+"' where USERNAME='"+username+"' ");
								str=1;//"Password changed successfully";
							}
							else
							{
								str=2;//"Current password did not match";
							}
						
					}
						else
						{
							str=3;//"Password not confirmed";
						}
					}
					r.close();
					s.close();
				}
				
			}
			catch(SQLException e)
			{
				System.out.println("In Person.java in changePassword");
				str=4;//"Username is invalid!";
			}
			return str;
		}

	
}               