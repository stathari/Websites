<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Review Manager Dash-board</title>

<%@ page import="java.util.*"%>
<%

ResourceBundle 	rb=(ResourceBundle)getServletContext().getAttribute("RB_US");
 if (session.getAttribute("Language").toString().equalsIgnoreCase("fr"))
	rb=(ResourceBundle)getServletContext().getAttribute("RB_FR");
else if (session.getAttribute("Language").toString().equalsIgnoreCase("gr"))
		rb=(ResourceBundle)getServletContext().getAttribute("RB_GER");
 
else if (session.getAttribute("Language").toString().equalsIgnoreCase("hi"))
	rb=(ResourceBundle)getServletContext().getAttribute("RB_IN");

%>
<script language="javascript" type="text/javascript">

</script>
<link rel="stylesheet" href="stylesheets,scripts,images/rm_loggedin.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">
<% out.println("<div class=header><br /><center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>

<div class="sidebar1"><br />

<br />

<font class="sidebartext" face="Times New Roman, Times, serif"><%= rb.getString("Info")+": " %></font><br />
<br />
<ul class="nav">

	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+": "+session.getAttribute("Name")+"</font></li>"); %>
	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Department")+": "+session.getAttribute("dept")+"</font></li>"); %>
	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>"); %>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="changePwd.jsp"><%= rb.getString("ChangePassword") %></a></font></li>
			<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="help_rm.html" target="window"><%= rb.getString("Help") %></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout")%></a></font></li>
</ul>

</div>

<div class="content">
<center><%= rb.getString("List_of_Employees_who_have_Submitted_their_Assesments")+": " %><br />

The <img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /> represents that
the work is done.<br />
The <img src=stylesheets,scripts,images/images/error.png width=36 height=36 /> represents that the
work is yet to be done.<br />
If both Employee an supervisor assess that employee, then you can assess
by clicking on Verify.<br />
If you have already assessed, then on clicking Verify the filled
assessment is displayed.<br />
<br />
<table width="80%">

	<tr>
		<td><%= rb.getString("User_Name") %></td>
		<td><%= rb.getString("Verified_By_Employee") %></td>
		<td><%= rb.getString("Verified_by_Supervisor") %></td>
		<td></td>
	</tr>

	<%

String s=(String)session.getAttribute("emps");
String supass=(String)session.getAttribute("supassessed");
System.out.println(supass);
String empass=(String)session.getAttribute("empassessed");
System.out.println(empass);
//String rmass=(String)session.getAttribute("rmassessed");
String[] empsa=s.split(",");
int i=1;
int check=0;
while(i<=5)
{
	out.print("<tr><td>"+empsa[i]+"</td>");
	if(empass.contains(empsa[i])){
		out.print("<td><img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /></td>");
		check++;
		}
	else if(!empass.contains(empsa[i]))
		out.print("<td><img src=stylesheets,scripts,images/images/error.png width=36 height=36 /></td>");
	if(supass.contains(empsa[i])){
		out.print("<td><img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /></td>");
		check++;
		}
	else if(!supass.contains(empsa[i]))
		out.print("<td><img src=stylesheets,scripts,images/images/error.png width=36 height=36 /></td></tr>");
	if(check==2){
		out.println("<form method=post action=Verify><input type=hidden name=emp_un value="+empsa[i]+">");
		out.println("<td><input value=Verify type=\"submit\"></form></td>");

	}
i++;
check=0;
}
%>
</table>
<br />

</center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>

</body>
</html>
