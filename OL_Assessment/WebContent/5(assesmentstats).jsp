<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Assessment Stats-HR</title>

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

<script language="javascript" type="text/javascript" src="stylesheets,scripts,images/checkregis.js">

</script>
<style type="text/css">
.tooltip {
	border-bottom: 1px dotted #000000;
	color: #000000;
	outline: none;
	cursor: help;
	text-decoration: none;
	position: relative;
}

.tooltip span {
	margin-left: -999em;
	position: absolute;
}

.tooltip:hover span {
	border-radius: 5px 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);
	font-family: Calibri, Tahoma, Geneva, sans-serif;
	position: absolute;
	left: 1em;
	top: 2em;
	z-index: 99;
	margin-left: 0;
	width: 270px;
}

.tooltip:hover img {
	border: 0;
	margin: -10px 0 0 -55px;
	float: left;
	position: absolute;
}

.tooltip:hover em {
	font-family: Candara, Tahoma, Geneva, sans-serif;
	font-size: 1.2em;
	font-weight: bold;
	display: block;
	padding: 0.2em 0 0.6em 0;
}

.classic {
	padding: 0.8em 1em;
}

.custom {
	padding: 0.5em 0.8em 0.8em 2em;
}

* html a:hover {
	background: transparent;
}

.classic {
	background: #FFFFAA;
	border: 1px solid #FFAD33;
}

.help {
	background: #9FDAEE;
	border: 1px solid #2BB0D7;
}
</style>

<link rel="stylesheet" href="stylesheets,scripts,images/assesmentstats.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">
<% out.println("<div class=header><br /><center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>

<div class="sidebar1"><br />

<br />

<font class="sidebartext" face="Times New Roman, Times, serif"><%= rb.getString("Info")+": " %></font>
<ul class="nav">

	<%="<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+": "+session.getAttribute("Name")+"</font></li>" %>
	<%="<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>" %>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a
		href="2(hr_loggedin).jsp"><%= rb.getString("Back") %></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout") %></a></font>
	</li>
</ul>

</div>

<div class="content"> <img src="stylesheets,scripts,images/images/printer.png" onclick="window.print(0)" alt="Print" height="32" width="32" />
<center><br />
The <img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /> represents that
the work is done.<br />
The <img src=stylesheets,scripts,images/images/error.png width=36 height=36 /> represents that the
work is yet to be done.<br />
If an employee is assessed at all 3 levels then <br />
<br />
<i><%= rb.getString("Click_on_the_Employees_to_view_their_scores") %></i>
<br />
<form>
<table width="80%" border="0">
	<tr>
		<td><%=rb.getString("User_Name") %></td>
		<td><%=rb.getString("Verified_By_Employee") %></td>
		<td><%=rb.getString("Verified_by_Supervisor") %></td>
		<td><%=rb.getString("Verified_by_Review_Manager") %></td>
	</tr>
	<%

String s=(String)session.getAttribute("emps");
String supass=(String)session.getAttribute("supassessed");
System.out.println(supass);
String empass=(String)session.getAttribute("empassessed");
System.out.println(empass);
String rmass=(String)session.getAttribute("rmassessed");
String[] empsa=s.split(",");
int i=1;
//int check=0;
while(i<=5)
{
	out.print("<tr onMouseOver=\"getMaterialDetails('"+empsa[i]+"')\"><td>"+empsa[i]+"</td>");
	if(empass.contains(empsa[i]))
		out.print("<td><img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /></td>");
	else if(!empass.contains(empsa[i]))
		out.print("<td><img src=stylesheets,scripts,images/images/error.png width=36 height=36 /></td>");
	if(supass.contains(empsa[i]))
		out.print("<td><img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /></td>");
	else if(!supass.contains(empsa[i]))
		out.print("<td><img src=stylesheets,scripts,images/images/error.png width=36 height=36 /></td>");
	if(rmass.contains(empsa[i]))
		out.print("<td><img src=stylesheets,scripts,images/images/correct.png width=36 height=36 /></td>");
	else if(!rmass.contains(empsa[i]))
		out.print("<td><img src=stylesheets,scripts,images/images/error.png width=36 height=36 /></td></tr>");
	
i++;

}
%>
	<tr>
		<td colspan="5" align="center"><a href="2(hr_loggedin).jsp"><input
			value=<%= rb.getString("Back") %> type="button" /></a></td>
	</tr>
</table>
</form>
<br />
<hr />
<div class="ajaxwindow" id="ajaxwindow"
	style="background: url(stylesheets,scripts,images/images/Untitled---1.png); background-repeat: no-repeat"><iframe
	name="viewer" height="150" width="400" frameborder="0"></iframe></div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</center>
</div>

<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>
</div>
</body>

</html>
