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
 
else if (session.getAttribute("Language").toString().equalsIgnoreCase("hi"))
	rb=(ResourceBundle)getServletContext().getAttribute("RB_IN");

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Report Generation</title>


<script language="javascript" type="text/javascript">
	function deptfunc()
	{
		document.getElementById('do').type='submit';
		document.getElementById('d2').type='submit';
		document.getElementById('d3').type='submit';
		document.getElementById('d4').type='submit';
		document.getElementById('d5').type='submit';
		document.getElementById('e2').type='hidden';
		document.getElementById('sl').type='hidden';
		document.getElementById('rm').type='hidden';

	}
	function dept1func()
	{
		document.getElementById('d00').type='submit';
		document.getElementById('d22').type='submit';
		document.getElementById('d33').type='submit';
		document.getElementById('d44').type='submit';
		document.getElementById('d55').type='submit';
		document.getElementById('e2').type='hidden';
		document.getElementById('sl').type='hidden';
		document.getElementById('rm').type='hidden';

	}
	function posnfunc()
	{
		document.getElementById('e2').type='submit';
		document.getElementById('sl').type='submit';
		document.getElementById('rm').type='submit';
		document.getElementById('do').type='hidden';
		document.getElementById('d2').type='hidden';
		document.getElementById('d3').type='hidden';
		document.getElementById('d4').type='hidden';
		document.getElementById('d5').type='hidden';

	}

</script>
<link rel="stylesheet" href="stylesheets,scripts,images/reportgen.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">

<div class="header"><br />
<%=  "<center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br />" %>
</div>


<div class="sidebar1"><br />
<font class="sidebartext" face="Times New Roman, Times, serif"><%= rb.getString("Info") %>:</font><br />
<br />
<ul class="nav">

	<%= "<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+": "+session.getAttribute("Name")+"</font></li>" %>
	<%="<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>" %>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a
		href="2(hr_loggedin).jsp"><%= rb.getString("Back")%></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout")%></a></font>
	</li>
</ul>

</div>

<div class="content"><br />
<br /><center>
Generate Reports<br />
In position wise- you have to click on any 1 of the levels (i.e.
Employee/Supervisor/Review-manager level).<br />
The average scores of the employees at that level is given for all
departments.<br />
<br />
<input type="button" value="Position Wise"
	onclick="posnfunc()" />
<table>
	<tr>
		<td>
		<form method="get" action="Report_Gen_Pos"><input type="hidden"
			name="pos" value="1" /><input type="hidden" value="Employee Level"
			id="e2" /></form>
		</td>
		<td>
		<form method="get" action="Report_Gen_Pos"><input type="hidden"
			name="pos" value="2" /><input type="hidden" value="Supervisor Level"
			id="sl" /></form>
		</td>
		<td>
		<form method="get" action="Report_Gen_Pos"><input type="hidden"
			name="pos" value="3" /><input type="hidden"
			value="Review Manager Level" id="rm" /></form>
		</td>
	</tr>
</table>

In Department wise- you click on any 1 of the departments,<br />
and view the averages of all employees in that department at all levels.<br />
<input type="button" value="Department Wise"
	onclick="deptfunc()" /> <br />
<br />
<br />
<table>
	<tr>
		<td>
		<form method="get" action="Report_Gen_Dept"><input
			type="hidden" name="dept_gen" value="1" /><input type="hidden"
			id="do" value="Department 1" /></form>
		</td>
		<td>
		<form method="get" action="Report_Gen_Dept"><input
			type="hidden" name="dept_gen" value="2" /><input type="hidden"
			value="Department 2" id="d2" /></form>
		</td>
		<td>
		<form method="get" action="Report_Gen_Dept"><input
			type="hidden" name="dept_gen" value="3" /><input type="hidden"
			value="Department 3" id="d3" /></form>
		</td>
		<td>
		<form method="get" action="Report_Gen_Dept"><input
			type="hidden" name="dept_gen" value="4" /><input type="hidden"
			value="Department 4" id="d4" /></form>
		</td>
		<td>
		<form method="get" action="Report_Gen_Dept"><input
			type="hidden" name="dept_gen" value="5" /><input type="hidden"
			value="Department 5" id="d5" /></form>
		</td>
	</tr>
</table>

<br />
In Competency report- you have to click on any one of the departments, <br />
then the question wise average scores at all levels are displayed in a
form of a table.<br />
<input type="button" value="Competency Report"
	onclick="dept1func()" /><br />
<table>
	<tr>
		<td>
		<form method="get" action="Comp_Rpt"><input type="hidden"
			name="dept_rp" value="1" /><input type="hidden" id="d00"
			value="Department 1" /></form>
		</td>
		<td>
		<form method="get" action="Comp_Rpt"><input type="hidden"
			name="dept_rp" value="2" /><input type="hidden" value="Department 2"
			id="d22" /></form>
		</td>
		<td>
		<form method="get" action="Comp_Rpt"><input type="hidden"
			name="dept_rp" value="3" /><input type="hidden" value="Department 3"
			id="d33" /></form>
		</td>
		<td>
		<form method="get" action="Comp_Rpt"><input type="hidden"
			name="dept_rp" value="4" /><input type="hidden" value="Department 4"
			id="d44" /></form>
		</td>
		<td>
		<form method="get" action="Comp_Rpt"><input type="hidden"
			name="dept_rp" value="5" /><input type="hidden" value="Department 5"
			id="d55" /></form>
		</td>
	</tr>
</table>
</center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>
</div>


</body>
</html>
