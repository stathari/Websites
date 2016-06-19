<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Change Password</title>

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
<link rel="stylesheet" href="stylesheets,scripts,images/average.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">

<div class="header"><br />
<%="<center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>"+rb.getString("Welcome")+": "+session.getAttribute("Name")+"</b></i></font></center><br />" %>
</div>


<div class="sidebar1"><br />
<font class="sidebartext" face="Times New Roman, Times, serif"><%= rb.getString("Info") %>:</font><br />
<br />
<ul class="nav">

	<%= "<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Name")+": "+session.getAttribute("Name")+"</font></li>" %>
	<%= "<li><font class=sidebartext size=+1 face=Times New Roman, Times, serif>"+rb.getString("Email_ID")+": "+session.getAttribute("Email_ID")+"</font></li>" %>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a
		href="changePwd.jsp"><%= rb.getString("Back") %></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout")%></a></font>
	</li>
</ul>

</div>

<div class="content" style="align: center">
<%if(session.getAttribute("pwdchecker").toString().equals("0")){

out.println("<form action=Password method=post>");
out.println( " <center><table>");
 out.println("<tr><td>"+ rb.getString("CurrentPassword")+":&nbsp;&nbsp;<input type=password name=pwd id=pwd></input></td></tr>");
 out.println("<tr><td>"+rb.getString("NewPassword")+":&nbsp;&nbsp;<input type=password name=newPwd id=newPwd></input></td></tr>");
 out.println("<tr><td>"+rb.getString("ConfirmPassword")+":&nbsp;&nbsp;<input type=password name=confirm id=confirm></input></td></tr>");
 out.println("<tr><td>"+"<input type=submit  value=Change /></td></tr></table> <hr />");
 out.println( "<div align=center><img src=stylesheets,scripts,images/images/CodePassion_sm.gif height=70 width=250 /></div>");
 out.println("</center>");
 out.println("</form>");
}%>


<%if(session.getAttribute("pwdchecker").toString().equals("1")){
	out.println("<center><h2>Password changed successfully</h2></center>");
	out.println("<centre><h3>Please login again with the new Password<h3></centre>");
	out.println("<center><a href=1(home2).jsp>"+rb.getString("Logout")+"</a></center>");
}%>
<% if(session.getAttribute("pwdchecker").toString().equals("2")){
	out.println("<center><h2>Current password did not match</h2></center>");
	session.setAttribute("pwdchecker",0);
	out.println("<center><a href=1(home2).jsp>"+rb.getString("Logout")+"</a></center>");
} %>
<% if(session.getAttribute("pwdchecker").toString().equals("3")){
	out.println("<center><h2>Password not confirmed</h2></center>");
	session.setAttribute("pwdchecker",0);
	out.println("<center><a href=1(home2).jsp>"+rb.getString("Logout")+"</a></center>");
} %>
<% if(session.getAttribute("pwdchecker").toString().equals("4")){
	out.println("<center><h2>Username is invalid!</h2></center>");
	session.setAttribute("pwdchecker",0);
	out.println("<center><a href=1(home2).jsp>"+rb.getString("Logout")+"</a></center>");
 } %>
 </div>
 <br/>
 <br/>
 <div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif" height="70" width="250" /></div></div>
</body>
</html>
