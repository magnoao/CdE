<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : GoodLife 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20121013
-->

<html>
<head>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta http-equiv="content-language" content="pt-br">
	<title><%=Textos.TITULO %></title>
	<!--
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy' rel='stylesheet' type='text/css' />
	-->
	<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
	<!--[if IE 6]>
	<link href="default_ie6.css" rel="stylesheet" type="text/css" />
	<![endif]-->
</head>
<body>
<div id="header-wrapper">
	<div id="header">
		<div id="logo">
			<h1><%=Textos.TITULO %></h1>
		</div>
		<div id="menu">
		</div>
	</div>
</div>
<div id="footer-wrapper">
	<div id="footer-content">
			<center>
				<form name="login" action="verifica.jsp">
					<table>
						<tr>
							<td>Username </td>
							<td><input type="text" name="login"/></td>
						</tr>
						<tr>
							<td>Password </td>
							<td><input type="password" name="senha"/></td>
						</tr>
					</table>
					
					
					<input type="submit" value="Go!"><input type="reset" value="Clear">
				</form>
			</center>
	</div>
</div>
<div id="footer">
	<p>Powered only for Google Chrome / Copyright (c) 2012 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org">FCT</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
</div>
</body>
</html>
