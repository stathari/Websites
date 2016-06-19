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
		href="2(hr_loggedin).jsp"><%= rb.getString("Back") %></a></font></li>
	<li><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif"><a href="1(home2).jsp"><%= rb.getString("Logout")%></a></font>
	</li>
</ul>

</div>
<div class="content">
<center><br />
<br />
<div id="tainer1"><p>
  <img src="stylesheets,scripts,images/images/printer.png" onclick="window.print(0)" alt="Print" height="32" width="32" />
<br />
<%
if(request.getAttribute("check").toString().equalsIgnoreCase("1")){
int j=1;
session.setAttribute("from","check1");
out.print("Position Wise Report<br />");
while(j<6){
HashMap<String,Object> avg_map= (HashMap<String,Object>) session.getAttribute("own_avg_map"+j);
String emps="a";
for(int i=1; i<6; i++)
{
	emps=emps.concat(","+"kmitd"+j+"_e"+i);
}
String[] empsa= emps.split(",");

out.println("Department "+j+": ");
out.println("<table width=80% style=\"border-style:inset\" >");
out.println("<tr><td>Employee ID</td><td>Average </td></tr>");
out.println("<tr><td colspan=2><hr /></td></tr>");


for(int i=1; i<6; i++)
{
	if(avg_map.containsKey(empsa[i]))
		out.print("<tr><td>"+empsa[i]+"</td><td>"+avg_map.get(empsa[i])+"</td></tr>");
	
}
out.println("<br />");
j++;
out.println("</table>");
//avg_map.clear();
}
%>
<br />
<br />
<a href="<%=request.getContextPath()%>/Download"> <%= rb.getString("Download")%> </a>
<%
}

else if(request.getAttribute("check").toString().equalsIgnoreCase("2")){
	session.setAttribute("from","check2");
	System.out.println("IN JSP2!");
String[] empsa=(session.getAttribute("emps").toString()).split(",");
HashMap <String,Object> emps_avg=(HashMap <String,Object>) session.getAttribute("emps_avg");
HashMap <String,Object> sups_avg=(HashMap <String,Object>) session.getAttribute("sups_avg");
HashMap <String,Object> rms_avg=(HashMap <String,Object>) session.getAttribute("rms_avg");
out.print("Department Wise Report<br />");
out.println("<table width=80% style=\"border-style:inset\">");
out.println("<tr><td>"+rb.getString("Employee")+"</td><td>"+rb.getString("Employee-Average")+"</td><td>"+rb.getString("Supervisor-Average")+"</td><td>"+rb.getString("ReviewManager-Average")+"</td></tr>");
for(int i=1; i<6; i++)
{
	if(emps_avg.containsKey(empsa[i]))
		out.print("<tr><td>"+empsa[i]+"</td><td>"+emps_avg.get(empsa[i])+"</td>");
	if(sups_avg.containsKey(empsa[i]))
		out.print("<td>"+sups_avg.get(empsa[i])+"</td>");
	if(rms_avg.containsKey(empsa[i]))
		out.print("<td>"+rms_avg.get(empsa[i])+"</td></tr>");
	
	
}
out.println("</table>");
%>
<br />
<a href="<%=request.getContextPath()%>/Download"> <%= rb.getString("Download")%> </a>
<%
}
%>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

</div>
</center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	height="70" width="250" /></div>

</div>



</body>
</html>
