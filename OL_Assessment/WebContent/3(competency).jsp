<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Competency</title>
<script language="javascript" type="text/javascript">
</script>
<link rel="stylesheet" href="stylesheets,scripts,images/competency.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>
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
<div class="container2"></div>
<div class="container">

<div class="header"><br />
<center><font color="#FFFFFF" style="font-weight: bold"><%= rb.getString("Welcome")+": "+session.getAttribute("Name") %></font></center>
<br />
</div>


<div class="sidebar1"><br />
<font class="sidebartext" face="Times New Roman, Times, serif" size="+1"><%= rb.getString("Department") %>
:</font><br />
<br />
<ul class="nav">
	<li><a href="4(competencyd1).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif"><%= rb.getString("Department") %>1</font></a>
	</li>
	<li><a href="4(competencyd2).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif"><%= rb.getString("Department") %>2</font></a>
	</li>
	<li><a href="4(competencyd3).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif"><%= rb.getString("Department") %>3</font></a>
	</li>
	<li><a href="4(competencyd4).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif"><%= rb.getString("Department") %>4</font></a>
	</li>
	<li><a href="4(competencyd5).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif"><%= rb.getString("Department") %>5</font></a>
	</li>
	<li><a href="2(hr_loggedin).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif"><%= rb.getString("Back") %></font></a>
	</li>

</ul>

</div>

<div class="content">
<center><%= rb.getString("Select_the_Departments_whose_Competencies_are_to_be_Edited")%></center>
<br />
By clicking any one of the Departments, first the minimum educational
qualifications are displayed which can be edited.<br />
By clicking on Next you can see the questions which are already there
for that department which can also be edited.<br />
Make sure you "save" the changes after editing any of the above.<br />

</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>


</body>
</html>
