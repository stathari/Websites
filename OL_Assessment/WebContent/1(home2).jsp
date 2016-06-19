<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
<script language="javascript" type="text/javascript">
	function submit2()
	{
	document.getElementById("form1").submit();
	}
</script>
<style>
body {
	font: 100%/ 1.4 Verdana, Arial, Helvetica, sans-serif;
	background-image: url(stylesheets,scripts,images/images/bckgrnd63.jpg);
	background-repeat: no-repeat;
	background-position: top;
	margin: 0;
	padding-left: 2px;
	color: #000;
}

.loginbox {
	text-shadow: #FFF;
	font-family: Verdana, Geneva, sans-serif;
	font-weight: bold;
	text-align: center;
	background-repeat: no-repeat;
}

.container {
	top: 30%;
}

a img {
	border: none;
}

.foot {
	text-shadow: #999;
	font-weight: bolder;
}

.loginbox1 {
	position: fixed;
}

.form1 {
	top: 40px;
}

.superclass {
	background: url(stylesheets,scripts,images/images/loginbox4.png) no-repeat 100% 100%;
	background-size: auto;
	baclground-repeat: norepeat;
	margin-left: 20px;
}
</style>
</head>

<body text="#666666">
<div class="superclass">
<table border="0" width="100%">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr style="">
		<td>
		<center>
		<div class="container">
		<div class="loginbox"><br />
		<br />
		<br />
		<br />
		<br />

		<form method="post" id="form1" action="Login" class="form1">

		<table border="0" align="center" style="padding-left: 300px"
			width="400" class="loginbox1" cellpadding="0" cellspacing="4">
			<tr>
				<td colspan="3"><img src="stylesheets,scripts,images/images/Employee-Assessment.png" /></td>
			</tr>
			<tr>
				<td><font color="#666666"
					face="Trebuchet MS, Arial, Helvetica, sans-serif">
				<div align="right"><i>UserName</i>:</div>
				</font></td>
				<td><input type="text" align="left" name="uname" id="uname" /></td>
				
			</tr>
			<tr>
				<td><font color="#666666"
					face="Trebuchet MS, Arial, Helvetica, sans-serif">
				<div align="right"><i>Password</i>:</div>
				</font></td>
				<td><input type="password" align="left" name="pwd" id="pwd" /></td>
				
			</tr>

			<tr>
				<td><font color="#666666"
					face="Trebuchet MS, Arial, Helvetica, sans-serif">
				<div align="right"><i>Language</i>:</div>
				</font></td>
				<td colspan="2"><select align="left" name="language">
					<option value="en">English (US)</option>
					<option value="fr">French (FR)</option>
					<option value="gr">German (GER)</option>
					<option value="hi">Hindi (IN)</option>
				</select></td>
			</tr>

			<tr>
				<td colspan="3" align="center">
				<!--<input type="submit" value="LOGIN" class="button1" />--> 
	<img  src="stylesheets,scripts,images/images/login3.png" onclick="submit2()" /> 
				<br />
				<%
int error=Integer.parseInt(getServletContext().getAttribute("error").toString());
System.out.println("Error:"+error);
if (error==1)
{
	out.println("<font color=\"red\"><i>Wrong Login credentials</i></font>");
	getServletContext().setAttribute("error",0);
}
%>
			
			</tr>
		</table>
		</form>
		</div>

		</div>
		</center>
		</td>
	</tr>
</table>
<div style="vertical-align: bottom; padding-left: 8px; bottom: 0">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table style="vertical-align: bottom; padding-right: 50px" align="right"
	border="0">
	<tr>
		<td><img src="stylesheets,scripts,images/images/CodePassion.gif" align="right" height="64"
			width="225" /></td>
		<td><img src="stylesheets,scripts,images/images/kmit_head.png" width="119" height="80"
			align="right" /></td>
	</tr>
</table>
</div>
</div>
</body>
</html>
