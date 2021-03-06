<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.*"%>
<% 
//request.setAttribute("pageAtual","pessoa.jsp"); 
String menuAtual = "inicio/inicio.jsp";
if(request.getParameter("menuAtual")!=null){
	menuAtual = request.getParameter("menuAtual").toString()+"/"+request.getParameter("menuAtual").toString()+".jsp";
}


%>

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
		<div id="user">
		<h3><a href="logout.jsp" accesskey="6" title=""><%=session.getAttribute("name_log") %> (Sair)</a></h3>
		</div>
		<div id="logo">
			<h1><%=Textos.TITULO %></h1>
		</div>
		<div id="menu">
			<ul>
				<li <%if(menuAtual.equals("inicio/inicio.jsp")){ %>class="current_page_item" <%}%>>
					<form method="post">			
						<input type="hidden" name="menuAtual" value="inicio">
						<a accesskey="1" title="Inicio" onclick="submit()">Inicio</a>
					</form>
				</li>
				<li <%if(menuAtual.equals("pessoa/pessoa.jsp")){ %>class="current_page_item" <%}%>>
					<form method="post">						
						<input type="hidden" name="menuAtual" value="pessoa">
						<a accesskey="2" title="Pessoa" onclick="submit()">Pessoa</a>
					</form>
				</li>
				<li <%if(menuAtual.equals("item/item.jsp")){ %>class="current_page_item" <%}%>>
					<form method="post">	
						<input type="hidden" name="menuAtual" value="item">
						<a href="#" accesskey="3" title="Item" onclick="submit()">Item</a>
					</form>
				</li>
				<li <%if(menuAtual.equals("tipo/tipo.jsp")){ %>class="current_page_item" <%}%>>
					<form method="post">	
						<input type="hidden" name="menuAtual" value="tipo">
						<a accesskey="4" title="Tipo" onclick="submit()">Tipo</a>
					</form>
				</li>
				<li <%if(menuAtual.equals("emprestimo/emprestimo.jsp")){ %>class="current_page_item" <%}%>>
					<form method="post">	
						<input type="hidden" name="menuAtual" value="emprestimo">
						<a accesskey="5" title="Emprestimo" onclick="submit()">Emprestimo</a>
					</form>
				</li>
			</ul>
		</div>
	</div>
</div>
<div id="footer-wrapper">
	<div id="footer-content">
		<jsp:include page="<%=menuAtual%>"></jsp:include>
	</div>
</div>
<div id="page-wrapper">
	<div id="page">
		<div id="content">
			
		</div>
		<div id="sidebar">
						
		</div>
	</div>
</div>
<div id="footer">
	<p>Copyright (c) 2012 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org">FCT</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
</div>
</body>
</html>
