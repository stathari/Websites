<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Competency-Deparment 1</title>

<script language="javascript" type="text/javascript">
</script>
<link rel="stylesheet" href="stylesheets,scripts,images/competencyd.css" />
<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>

<body>

<div class="container2"></div>
<div class="container">

<div class="header"><br />
<%out.println("<center><font face=Verdana, Geneva, sans-serif color=#FFFFFF><i><b>Welcome "+session.getAttribute("Name")+"</b></i></font></center><br /></div>");%>


<div class="sidebar1"><br />
<font class="sidebartext" face="Times New Roman, Times, serif">Departments:</font><br />
<br />
<ul class="nav">
	<li><a href="3(competency).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif">Home-Competency</font></a>
	</li>
	<li><a href="4(competencyd1).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif">Deparment1</font></a></li>
	<li><a href="4(competencyd2).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif">Deparment2</font></a></li>
	<li>
	<div class="usedpage"><font class="sidebartext" size="+1"
		face="Times New Roman, Times, serif">Deparment3</font></div>
	</li>
	<li><a href="4(competencyd4).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif">Deparment4</font></a></li>
	<li><a href="4(competencyd5).jsp"><font class="sidebartext"
		size="+1" face="Times New Roman, Times, serif">Deparment5</font></a></li>
</ul>

</div>

<div class="content">
<center>
<%int i=3; session.setAttribute("dept_comp",i); %> <%String name_of_jsp= "temp.jsp"; %>
<% session.setAttribute("4(comp)",name_of_jsp); %> <% request.getRequestDispatcher("/Competency").forward(request,response); %>
<iframe src="8(empcompetencyd1).jsp" name="compframe" width="80%"
	height="500"></iframe></center>
</div>
<div class="footer"><img src="stylesheets,scripts,images/images/CodePassion_sm.gif"
	alt="codePassionKmit" width="250" height="70" /></div>

</div>

</div>
</body>
</html>
