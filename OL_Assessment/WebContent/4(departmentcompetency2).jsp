<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HR Competency Report</title>

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
<link rel="stylesheet" href="stylesheets,scripts,images/hr_loggedin.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">
<% out.println("<div class=header><br /><center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>

<div class="sidebar1"><br />

<br />

<font class="sidebartext" face="Times New Roman, Times, serif">Info:</font><br />
<br />
<ul class="nav">

	<%="<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+": "+session.getAttribute("Name")+"</font></li>" %>
	<%= "<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>"%>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="6(reportgen).jsp"><%=rb.getString("Back")%></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%=rb.getString("Logout") %></a></font>
	</li>
</ul>

</div>

<div class="content"> <img src="stylesheets,scripts,images/images/printer.png" onclick="window.print(0)" alt="Print" height="32" width="32" />
<center>The average score given by the employees, supervisor
and review-manager for each question are displayed in this table. <br />
<table border="0" cellspacing="5" cellpadding="5">
	<tr>
		<th><%=rb.getString("Question") %></th>
		<th>Employee</th>
		<th>Supervisor</th>
		<th>Review Manager</th>
	</tr>
	<%
HashMap <String,Object> q_avg_emp = (HashMap<String,Object>) session.getAttribute("q_avg_emp");
HashMap <String,Object> q_avg_sup = (HashMap<String,Object>) session.getAttribute("q_avg_sup");
HashMap <String,Object> q_avg_rm = (HashMap<String,Object>) session.getAttribute("q_avg_rm");
String[] que= session.getAttribute("q").toString().split(",");
for(int j=1; j<11; j++)
{
	out.println("<tr align=center><td>Q"+j+" "+que[j]+"  </td><td>"+q_avg_emp.get("Q"+j)+"</td><td>"+q_avg_sup.get("Q"+j)+"</td><td>"+q_avg_rm.get("Q"+j)+"</td></tr>");
}
%>
</table>

<br />
<br />
<a href="<%=request.getContextPath()%>/Download"> <%= rb.getString("Download")%> <% session.setAttribute("from","comprept_2"); %></a>
</center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>
</div>
</body>
</html>
