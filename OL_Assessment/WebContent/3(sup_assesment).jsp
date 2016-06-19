<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Supervisor Assessment</title>

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
<script language="javascript" type="text/javascript" src="stylesheets,scripts,images/rating2.js">

</script>
<link rel="stylesheet" href="stylesheets,scripts,images/sup_assesment.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">

<div class="header"><br />
<%out.println("<center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>



<div class="sidebar1"><br />
<font class="sidebartext" face="Times New Roman, Times, serif"><%= rb.getString("Info") %>
:</font><br />
<br />
<ul class="nav">

	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+": "+session.getAttribute("Name")+"</font></li>"); %>
	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Department")+": "+session.getAttribute("dept")+"</font></li>"); %>
	<% out.println("<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>"); %>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout") %></a></font>
	</li>
</ul>

</div>

<div class="content">
<center><br />
<i><%= rb.getString("Employee_answers_are_in")%><font
	color="#666666">Grey</font></i> <br />
<br />
<form class="form1" method="post" action="EmpAssessment">
<table border="0" width="80%" cellpadding="10" cellspacing="10">
	<%="<tr><td colspan=2>"+rb.getString("Employee")+" :</td><td> "+session.getAttribute("un")+"</td></tr>" %>

	<%
for(int i=1; i<11; i++)
{ 

out.println("<tr><td align=center colspan=3>Q"+i+". "+session.getAttribute("Q"+i)+"</td></tr>");
out.println("<tr><td align=center colspan=1 class=empanswer>Employee Answer:"+session.getAttribute("empq"+i)+"</td>");
out.println("<td><textarea cols=40 name=q_comm"+i+"></textarea></td></tr>");
%>
<tr><td colspan="3">
<table border="1" style="border:hidden" cellpadding="20" cellspacing="5">
			<tr>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",1"); %>>1</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",2"); %>>2</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",3"); %>>3</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",4"); %>>4</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",5"); %>>5</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",6"); %>>6</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",7") ;%>>7</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",8") ;%>>8</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",9") ;%>>9</td>
				<td onmouseover="overer(id)" onclick="clicker(id)" id=<% out.println("q"+i+",10"); %>>10</td>
				<td style="border: hidden"><img src="stylesheets,scripts,images/images/correct.png"
					height="20" width="20" style="visibility: hidden" id=<%out.print("q"+i+"i"); %> /></td>
				<td style="border: hidden">
				<% out.println("<input type=button value=Clear id=q"+i+" onclick=clearer(id) />"); %>
				</td></tr>
		</table>
		</td></tr>
		<tr><td colspan="3"><hr /></td></tr>
<%
}
%>

	<tr>
		<td colspan="3" align="center"><input type="submit"
			value=<%= rb.getString("Submit") %> /></td>
	</tr>
</table>
<input type="hidden" id="q1a" name="q1a" />
<input type="hidden" id="q2a" name="q2a" />
<input type="hidden" id="q3a" name="q3a" />
<input type="hidden" id="q4a" name="q4a" />
<input type="hidden" id="q5a" name="q5a" />
<input type="hidden" id="q6a" name="q6a" />
<input type="hidden" id="q7a" name="q7a" />
<input type="hidden" id="q8a" name="q8a" />
<input type="hidden" id="q9a" name="q9a" />
<input type="hidden" id="q10a" name="q10a" />
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</center>
</div>

<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>

</div>
</body>
</html>
