<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Assessment</title>


<script language="javascript" type="text/javascript" src="stylesheets,scripts,images/rating2.js">
</script>
<link rel="stylesheet" href="stylesheets,scripts,images/assesmentstyle2.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>
<%

ResourceBundle 	rb=(ResourceBundle)getServletContext().getAttribute("RB_US");//System.out.println(rb.getString("sayThanks"));
 if (session.getAttribute("Language").toString().equalsIgnoreCase("fr"))
	rb=(ResourceBundle)getServletContext().getAttribute("RB_FR");
else if (session.getAttribute("Language").toString().equalsIgnoreCase("gr"))
		rb=(ResourceBundle)getServletContext().getAttribute("RB_GER");
 
else if (session.getAttribute("Language").toString().equalsIgnoreCase("hi"))
	rb=(ResourceBundle)getServletContext().getAttribute("RB_IN");

%>

<div class="container2"><!--<img src="images/nav.png" width="100%" />-->
</div>
<div class="container">
<% out.println("<div class=header><br /><center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>

<div class="sidebar1"><br />

<br />
<ul class="nav">
	<% 
out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name") +": "+session.getAttribute("Name")+"</font></li>");
out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("User_Name") +": "+session.getAttribute("UserName")+"</font></li>");
out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Supervisor_name")+": "+request.getAttribute("Sup")+"</font></li>");
out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("RM_Name") +": "+request.getAttribute("RM")+"</font></li>");
out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>");

%>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="changePwd.jsp"><%= rb.getString("ChangePassword") %></a></font></li>
		<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="help_emp.html" target="window"><%= rb.getString("Help") %></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout") %></a></font>
	</li>
</ul>
</div>

<div class="content">
<center>Self Assessment form. Once Saved , scores cannot be
changed.
<form class="form1" method="post" action="EmpAssessment"><br />

<table border="0">

	<% out.println("<tr><td align=center>Q1 "+request.getAttribute("Q1")+" </td></tr>");%>
	<tr>
		<td>
		<table border="1" style="border:hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q1,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					height="20" width="20" style="visibility: hidden" id="q1i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q1" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% out.println("<tr><td align=center>Q2. "+request.getAttribute("Q2")+"</td></tr>"); %>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q2,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q2i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q2" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<%out.println("<tr><td align=center>Q3. "+request.getAttribute("Q3")+"</td></tr>"); %>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q3,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q3i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q3" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% out.println("<tr><td align=center>Q4. "+request.getAttribute("Q4")+"</td></tr>");%>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q4,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q4i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q4" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% out.println("<tr><td align=center>Q5. "+request.getAttribute("Q5")+"</td></tr>");%>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q5,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q5i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q5" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% out.println("<tr><td align=center>Q6. "+request.getAttribute("Q6")+"</td></tr>");%>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q6,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q6i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q6" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% out.println("<tr><td align=center>Q7. "+request.getAttribute("Q7")+"</td></tr>");%>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q7,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q7i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q7" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% out.println("<tr><td align=center>Q8. "+request.getAttribute("Q8")+"</td></tr>");%>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q8,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q8i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q8" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% out.println("<tr><td align=center>Q9. "+request.getAttribute("Q9")+"</td></tr>");%>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q9,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q9i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q9" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% out.println("<tr><td align=center>Q10. "+request.getAttribute("Q10")+"</td></tr>");%>
	<tr>
		<td>
		<table border="1" style="border: hidden"
			cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,1">1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,2">2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,3">3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,4">4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,5">5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,6">6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,7">7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,8">8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,9">9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id="q10,10">10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					style="visibility: hidden" height="20" width="20" id="q10i" /></td>
				<td style="border: hidden"><input type="button" value="Clear"
					id="q10" onclick="clearer(id)" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center"><input type="submit"
			value="<%= rb.getString("Submit") %>" id="sub1" onmouseover="checker2()" /></td>
	</tr>
</table>
<input type="hidden" value="0" id="q1a" name="q1a"  /> <br />
<input type="hidden" value="0" id="q2a" name="q2a"  /> <br />
<input type="hidden" value="0" id="q3a" name="q3a"  /> <br/>	
<input type="hidden" value="0" id="q4a" name="q4a" /> <br />
<input type="hidden" value="0" id="q5a" name="q5a"  /><br />
<input type="hidden" value="0" id="q6a" name="q6a" /><br />
<input type="hidden" value="0" id="q7a" name="q7a" /><br />
<input type="hidden" value="0" id="q8a" name="q8a" /><br />
<input type="hidden" value="0" id="q9a" name="q9a" /><br />
<input type="hidden" value="0" id="q10a" name="q10a" /><br />

<p>&nbsp;</p>
<p><br />
</p>
</form>
</center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>


</body>
</html>
