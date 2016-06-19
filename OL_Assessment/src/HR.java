
import java.sql.*; 
import java.util.*;

public class HR  extends Person {

	Connection c2,c3;
	public HR(){
			super();
			try{
			c2=DriverManager.getConnection("jdbc:db2:HR","admin","admin");
			c3=DriverManager.getConnection("jdbc:db2:PERSON","admin","admin");
	        }
			catch(Exception e)
			{
				System.out.println("HR Constructor!");
				System.out.println("Cons not Made!");
			}
	}
	
	public void fillQualifications(String emp, String sup, String rm, int dept )
	{//method to fill minimum qualifications required for each level
		try{
			
		
		Statement s2=c2.createStatement();
		
		s2.executeUpdate("update QUALIFICATIONS set FLAG="+0+" where DEPARTMENT="+dept+" ");
		s2.executeUpdate("insert into QUALIFICATIONS(DEPARTMENT,EMPLOYEE,SUPERVISOR,REVIEW_MANAGER,FLAG) values("+dept+", '"+emp+"', '"+sup+"', '"+rm+"', 1) ");
		s2.close();
	
		}
		catch(Exception e)
		{
			System.out.println("In HR.java in fillQualifications");
			e.printStackTrace();
		}
	}
	 public String displayQualifications(int dept)
	    {//method to display minimum qualifications required for each level
	    	String str="a";
	    	try{
	    		
	    		Statement s2=c2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    		ResultSet r2=s2.executeQuery("select EMPLOYEE,SUPERVISOR,REVIEW_MANAGER from QUALIFICATIONS where DEPARTMENT="+dept+" ");
	    		r2.last();
	    		int i=1;
	    		while((r2.isAfterLast()==false) && i<4)
	    		{
	    		str=str.concat(","+r2.getString(i));
	    		
	    		i++;
	    		}
	    		r2.close();
	    		s2.close();
	    		
	    		}
	    	catch(Exception e)
	    		{
	    			System.out.println("In HR.java in DisplayQualifications");
	    			System.out.println("No Qualifications in this dept");
	    		}
	    		return str;
	    }
	 public void Questions(String que, int dept)
	    {//method to fill the new questions given
	    	try{
	    		String[] str= que.split(",");
	    		Statement s2=c2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			  	String ques="a";
			  	int qn=1;
			  	int smarks=2;
			  	int rmarks=3;
			  	while(smarks<31){
			  		
			  		ques=ques.concat(",sup"+qn+":"+str[smarks].toString()+",rm"+qn+":"+str[rmarks].toString());
			  		smarks=smarks+3;
			  		rmarks=rmarks+3;
			  		qn++;
			  	}
	    		s2.executeUpdate("update QUALIFICATIONS set QUESTIONS='"+ques+"' where DEPARTMENT="+dept+" ");
	    		s2.close();
	    		
	    		
	    		s2=c3.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    	
	    		int i=1;
	    		int j=1;
	    		while(i<31 && j<11){
	    			
	    			s2.executeUpdate("update COMPETENCIES set Q"+j+"='"+str[i]+"' where DEPARTMENT="+dept+" ");
	    		i+=3;
	    		j++;
	    		}
	    		s2.close();
	    	
	    	}
	    		catch(Exception e)
	    		{
	    			System.out.println("In HR.java in Questions!");
	    			e.printStackTrace();
	    		}
	    }
	public HashMap<String,Object> Average(int dept, int test_num,int level)
	{//this method calculates the average of marks of employees in different levels
		String str[]=new String[5];
		int i=0;
		int j=0;
		int sum=0;
		float avg=0;
		HashMap<String,Object> own_Avg = new HashMap<String,Object>();
		own_Avg.put("empty","empty");
		try{
		
		Statement s2=c3.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs;

		rs=s2.executeQuery("select MEMBER_ID from REMARKS where TEST_NUMBER="+test_num+" AND FLAG="+level+" AND DEPARTMENT="+dept+" ");
		rs.next();
        str [0]=rs.getString(1);
		rs.beforeFirst();
		int flag=0;
		while(i<5 && !(rs.isLast()))
		{
			rs.next();
			while(str[j]!=null )
			{
			   	if(str[j].equalsIgnoreCase(rs.getString(1)))
				            {
					              flag++;
				                  break;
                   			}
				j++;
			}
	        j=0;
	        if(flag==0)
	        {
	        	i++;
	        	str[i]=rs.getString(1);
	        }
	        flag=0;
		}
		
		rs.close();
		
		
		
		
		
		//Till here we get the array of string containing the unique employee!
	
		
		
		
		
		
		
		//the next phase of calculating avg of his own marks!
		i=0;
		while(str[i]!=null){
			System.out.println("MemberID: "+str[i]);
			i++;
			}
		i=0;
		//System.out.println();
		while(str[i]!=null)
		{
			rs=s2.executeQuery("select Q1,Q2,q3,q4,q5,q6,q7,q8,q9,q10 from REMARKS where TEST_NUMBER="+test_num+" AND MEMBER_ID='"+str[i]+"' AND FLAG="+level+" ");
			rs.next();
			for(j=1;j<11;j++)
			{
				sum+=Integer.parseInt(rs.getString("Q"+j));
			}
			float temp=10;
			avg=sum/temp;
			own_Avg.put(str[i], avg); //Main point is it is being stored in a MAP where key is the member id and his avg as Value!
			i++;
			sum=0;
		}
		rs.close();
		s2.close();
		//c3.close();
		i=0;
	
		}
		catch(SQLException e)
		{
			System.out.println("In HR.java in Average");
			System.out.println("NO such ENTRIES!!!");
		}
	return 	own_Avg;
	}
	public HashMap<String,Object> Competencies(int dept,int flag,int test_num)
		{//method to calculate average of marks of employees for each question
			int j=0;
			int sum=0;
			HashMap<String,Object> q_avg = new HashMap<String,Object>();
			q_avg.put("empty","empty");
			try{
				// c3=DriverManager.getConnection("jdbc:db2:PERSON","admin","admin");
				Statement s2=c3.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ResultSet rs=null;
			
				for(j=1;j<11;j++)
				{
				rs=s2.executeQuery("select Q"+j+" from REMARKS where TEST_NUMBER="+test_num+" AND FLAG="+flag+" AND DEPARTMENT="+dept+" ");
                float count=0;		
				while(rs.next())
					{
					count++;
					sum+=rs.getInt("Q"+j);
					}
				float avg=sum/count;
				q_avg.put("Q"+j,avg);
                 sum=0;
             	}
				rs.close();
				s2.close();
				//c3.close();
				
				
			}
			catch(SQLException e)
			{
				System.out.println("In HR.java in Competencies method");
				System.out.println("NO such ENTRIES!!!");
			}
			
			return q_avg;
		}
	
	
 }
   

