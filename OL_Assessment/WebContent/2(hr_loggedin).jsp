<!-- home page of HR after he has logged in -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HR Dash-board</title>

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
	function deptfunc()
	{
		document.getElementById('d0').type='submit';
		document.getElementById('d2').type='submit';
		document.getElementById('d3').type='submit';
		document.getElementById('d4').type='submit';
		document.getElementById('d5').type='submit';
	}


	
</script>
<link rel="stylesheet" href="stylesheets,scripts,images/hr_loggedin.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/tooltips.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">
<% out.println("<div class=header><br /><center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>



<div class="sidebar1"><br />
<font class="sidebartext" face="Times New Roman, Times, serif"><%= rb.getString("Info") %></font><br />
<br />
<ul class="nav">

	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+": "+session.getAttribute("Name")+"</font></li>"); %>
	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>"); %>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="changePwd.jsp"><%= rb.getString("ChangePassword") %></a></font></li>
			<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="help_hr.html" target="window"><%= rb.getString("Help") %></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout") %></a></font>
	</li>
</ul>

</div>

<div class="content">
<center><br />
Competency will allow the HR to edit and manage the competencies of
employees. <br />
He can set/edit the minimum Educational Qualifications for
Employee/Supervisor/Review-Manager.<br />
He might as well change the Assessment questions and the minimum marks
for it. <br />
<br />
<a href="3(competency).jsp" class="tooltip"><input type="submit" value="Competency"
	/><span class="custom help"><em>Competency</em>To check and maintain the Competencies for each position</span></a><br />
<br />
Assessment Status will ask for a department and in that department it
will show as to how many employees have assessed themselves, or also
have been assessed by supervisor and/or Review-Manager. <br />
<i>If an employee is completely assessed at all the 3 levels. Then
just by clicking on his ID a small table containing his average marks
are displayed. </i><br />
<br />
<a href="#" class="tooltip" ><input type="button" value="Assesment Status" onclick="deptfunc()" /><span class="custom help"><em>Assessments</em>Check the Assesment Status of each Employee</span></a><br />
<br />
<table>
	<tr>
		<td>
		<form method="get" action="Assessment_Status"><input
			type="hidden" value="1" name="department" /><input type="hidden"
			id="d0" value="Department1" /></form>
		</td>
		<td>
		<form method="get" action="Assessment_Status"><input
			type="hidden" value="2" name="department" /><input type="hidden"
			id="d2" value="Department2" /></form>
		</td>
		<td>
		<form method="get" action="Assessment_Status"><input
			type="hidden" value="3" name="department" /><input type="hidden"
			id="d3" value="Department3" /></form>
		</td>
		<td>
		<form method="get" action="Assessment_Status"><input
			type="hidden" value="4" name="department" /><input type="hidden"
			id="d4" value="Department4" /></form>
		</td>
		<td>
		<form method="get" action="Assessment_Status"><input
			type="hidden" value="5" name="department" /><input type="hidden"
			id="d5" value="Department5" /></form>
		</td>
	</tr>
</table>
<br />
Report Generation will have 3 types of Reports- Position wise,
Department wise, Competency/Question wise. <br />
<a href="6(reportgen).jsp" class="tooltip"><input type="button"
	value="Report Generation"  /><span class="custom help"><em>Report Generation</em>Generate Reports</span></a><br />
<br />
<br />

<!-- <textarea name="area" cols="30" rows="2" disabled="disabled"
	readonly="readonly" id="area"><%= rb.getString("Move_cursor_over_the_Buttons_to_know_function")%></textarea> -->
<br />
</center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>
</body>
</html>
