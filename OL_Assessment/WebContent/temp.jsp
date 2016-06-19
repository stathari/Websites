<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%

ResourceBundle 	rb=(ResourceBundle)getServletContext().getAttribute("RB_US");
 if (session.getAttribute("Language").toString().equalsIgnoreCase("fr"))
	rb=(ResourceBundle)getServletContext().getAttribute("RB_FR");
else if (session.getAttribute("Language").toString().equalsIgnoreCase("gr"))
		rb=(ResourceBundle)getServletContext().getAttribute("RB_GER");

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Competency</title>

<script language="javascript" type="text/javascript">
</script>
<link rel="stylesheet" href="stylesheets,scripts,images/competencyd.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />

</head>

<body>

<div class="container2"></div>
<div class="container">

<div class="header"><br />
<%out.println("<center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>



<div class="sidebar1"><br />
<font class="sidebartext" face="Times New Roman, Times, serif"><%= rb.getString("Department") %>
:</font><br />
<br />
<ul class="nav">
	<li><a href="3(competency).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif">Home-Competency</font></a></li>
	<%
String dept_comp=session.getAttribute("dept_comp").toString();
int dept= Integer.parseInt(dept_comp);
for(int i=1; i<=5; i++){
	if(i==dept)
		out.println("<li><div class=usedpage><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Department")+": "+i+"</font></div></li>");
	else
		out.println("<li><a href=4(competencyd"+i+").jsp><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Department")+": "+i+"</font></a></li>");
}
%>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a
		href="2(hr_loggedin).jsp"><%= rb.getString("Back") %></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout") %></a></font>
	</li>
</ul>
</div>


<div class="content">
<center><iframe src="8(empcompetencyd1).jsp" name="compframe"
	width="80%" height="500"></iframe></center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>

</div>
</body>
</html>
