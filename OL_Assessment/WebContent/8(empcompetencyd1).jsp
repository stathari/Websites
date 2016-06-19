<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Competency</title>
<script language="javascript" type="text/javascript">
function clear1(id1)
{
	document.getElementById(id1).value="";
}
</script>

<link rel="stylesheet" href="stylesheets,scripts,images/text.css" />
</head>
<% int hidden=1;
session.setAttribute("hidden",hidden);
%>
<body background="stylesheets,scripts,images/images/formback.jpg">
The minimum Educational Qualifications can be seen(if already existing)
or can be edited or entered.
<br />
Click on "Save" if you made any changes.
<br />
<form method="get" action="Qual">
<div style="text-align: justify">
<table border="0" align="center" cellpadding="5" cellspacing="5">
	<tr>
		<th colspan="2">Qualifications</th>
	</tr>
	<%= "<tr><td>Employee:</td><td><textarea name=employee rows=3 cols=50  id=emp onclick=\"clear1(id)\" >"+session.getAttribute("comp_e")+"</textarea></td></tr>" %>
	<%= "<tr><td>Supervisor</td><td><textarea name=supervisor id=sup rows=3 cols=50  onclick=clear1(id)  >"+session.getAttribute("comp_s")+"</textarea></td></tr>" %>
	<%= "<tr><td>Review Manager</td><td><textarea name=reviewmanager id=rm rows=3 cols=50  onclick=clear1(id) >"+session.getAttribute("comp_r")+"</textarea></td></tr>" %>
	<tr>
		<td align="center"><a href="4(questioncomp).jsp"
			target="compframe"><input type="button" value="Next page" /></a></td>
		<td align="center"><input type="hidden" name="hide" value="1" /><input
			type="submit" value="Save" /></td>
	</tr>
</table>
</div>
</form>
</body>
</html>