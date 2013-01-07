<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, util.*"%>
<% 
//request.setAttribute("pageAtual","pessoa.jsp"); 
String menuAtual = "Home.jsp";
String selecionado = "Home";
if(request.getParameter("menuAtual")!=null){
	selecionado = request.getParameter("menuAtual");
	menuAtual= selecionado +".jsp";
	
}

Vector<String> menuTextos = new Vector<String>();
menuTextos.add("Home");
menuTextos.add("Pessoa");
menuTextos.add("Item");
menuTextos.add("Tipo");
menuTextos.add("Emprestimo");

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
				<%for(int i=0; i<menuTextos.size(); i++){ 
					String textoExibido = menuTextos.get(i);%>
					<li <%if(selecionado.equals(textoExibido)){ %>class="current_page_item" <%}%>>
						<form method="post" action="index.jsp">
							<input type="hidden" name="menuAtual" value="<%=textoExibido%>">
							<a accesskey="1" title="<%=textoExibido%>" onclick="submit()"><%=textoExibido%></a>
						</form>
					</li>
				<%} %>
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
