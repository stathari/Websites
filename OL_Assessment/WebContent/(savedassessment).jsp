<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Assessment</title>
<%@ page import="java.util.*"%>
<%

ResourceBundle 	rb=(ResourceBundle)getServletContext().getAttribute("RB_US");
 if (session.getAttribute("Language").toString().equalsIgnoreCase("fr"))
	rb=(ResourceBundle)getServletContext().getAttribute("RB_FR");
else if (session.getAttribute("Language").toString().equalsIgnoreCase("gr"))
		rb=(ResourceBundle)getServletContext().getAttribute("RB_GER");

%>


<script language="javascript" type="text/javascript">
</script>
<link rel="stylesheet" href="stylesheets,scripts,images/savedassesment.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">

<div class="header"><br />
<%= " <center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome") +": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>" %>


<div class="sidebar1"><br />

<br />
<ul class="nav">

	<%= "<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+ ": "+session.getAttribute("Name")+"</font></li>" %>
	<%= "<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Department")+": "+session.getAttribute("dept")+"</font></li>" %>
	<%= "<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>" %>

	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout") %></a></font>
	</li>
</ul>

</div>

<div class="content">
<center>
<div class="headings1">
<form class="form1"><br />
Assessed. You are seeing the Filled Assessment.<img src="stylesheets,scripts,images/images/printer.png" onclick="window.print(0)" alt="Print" height="32" width="32" />
<table border="0">

	<tr>
		<th colspan=2 class=celltext><font style="font-weight: bolder">Employee
		ID: <%=request.getSession().getAttribute("un")%></font></th>
	</tr>
	<tr></tr>
	<% out.println(" <tr><th class=celltext><font style='font-weight:bolder' ><i>"+rb.getString("Question")+"</i></font></th><th><font style='font-weight:bolder' ><i>"+rb.getString("Score")+"</i></font></th>");%>

	<%
String un =request.getSession().getAttribute("UserName").toString();
char c= un.charAt(7);
if(c!='e')
	out.print("<th><font style='font-weight:bolder' ><i>"+rb.getString("Comments")+"</font></i></th></tr></div>");
else
	out.print("</tr></div>");
%>
	<% 
if(c!='e'){
for(int i=1; i<11; i++)
{
	out.println("<tr><td class=celltext>"+request.getAttribute("q"+i)+"</td><td>"+request.getAttribute("m"+i)+"</td><td>"+request.getAttribute("comm"+i)+"</td></tr>");
}
}
else{

	for(int i=1; i<11; i++)
	{
		out.println("<tr><td class=celltext>"+request.getAttribute("q"+i)+"</td><td>"+request.getAttribute("m"+i)+"</td></tr>");
	}
}
%>
</table>
<br />
</form>
</div>
</center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>
</div>
</body>

</html>
