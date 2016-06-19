<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Employee Competency</title>
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
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body background="stylesheets,scripts,images/images/formback.jpg">
The questions already in use by this department are displayed.
<br />
These can be edited along with minimum marks by
supervisor/review-manager, that an employee needs to have for that
question are entered.
<br />
<br />
<form method="get" action="Qual">
<div style="text-align: justify">
<table  style="border-style: dashed" align="center"
	cellpadding="5" cellspacing="5">
	<tr>
		<th colspan="3" align="center"><%= rb.getString("Minimum_Requirements") %></th>
	</tr>
	
	<tr>
		<td><%=rb.getString("Question")%></td>
		<td>Supervisor</td>
		<td>Review Manager</td>
	</tr>
	<%
for(int i=1; i<=10; i++)
	out.println("<tr><td><textarea name=QQ"+i+" rows=1>"+session.getAttribute("Q"+i)+"</textarea></td><td><select name=sup"+i+"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td><td><select name=rm"+i+"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td></tr>");%>
	<tr>
		<td align="center" colspan="3"><a href="8(empcompetencyd1).jsp"
			target="compframe"><input type="button" value="Previous page" /></a></td>
	</tr>
	<tr>
		<td align="center" colspan="3"><input type="hidden" name="hide"
			value="2" /><input type="submit" value="Save" /></td>
	</tr>
</table>
</div>
</form>
</body>
</html>
