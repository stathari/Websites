<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Supervisor Dash-board</title>

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
<link rel="stylesheet" href="stylesheets,scripts,images/sup_loggedin.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">

<div class="header"><br />
<%out.println("<center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>


<div class="sidebar1"><br />
<font class="sidebartext" face="Times New Roman, Times, serif"><%= rb.getString("Info")+": " %></font><br />
<br />


<ul class="nav">
	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+": "+session.getAttribute("Name")+"</font></li>"); %>
	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Department")+": "+session.getAttribute("dept")+"</font></li>"); %>
	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>"); %>

	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="changePwd.jsp"><%= rb.getString("ChangePassword") %></a></font></li>
			<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="help_sup.html" target="window"><%= rb.getString("Help") %></a></font></li>		
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout") %></a></font>
	</li>
</ul>

</div>

<div class="content">
<center><%= rb.getString("List_of_Employees_who_have_Submitted_their_Assesments")+": " %><br />
The <img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /> represents that
the work is done.<br />
The <img src=stylesheets,scripts,images/images/error.png width=36 height=36 /> represents that the
work is yet to be done.<br />
If Employee assesses himself, then you can assess him by clicking on
Verify.<br />
If even the you have already assessed him then on clicking Verify the
filled assessment is displayed.<br />
<br />
<table width="80%">
	<tr>
		<td><%= rb.getString("User_Name")%></td>
		<td></td>
	</tr>
	<%
String s=(String)session.getAttribute("emps");
String empass=(String)session.getAttribute("empassessed");
String[] empsa=s.split(",");
int i=1;
while(i<=5)
{
	out.print("<tr><td>"+empsa[i]+"</td>");
	if(empass.contains(empsa[i])){
		out.print("<td><img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /></td>");
		out.println("<form method=post action=Verify><input type=hidden name=emp_un value="+empsa[i]+" >");
		out.println("<td><input value=Verify type=submit /></td></form>");
		 	
	}
	else 
		out.print("<td><img src=stylesheets,scripts,images/images/error.png width=36 height=36 /></td>");
	
		
	
i++;
}
%>
</table>
<br />
</center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>

</div>
</body>
</html>
