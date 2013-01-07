<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String textoMenuAtual = "Tipo";
String textoSubMenu01 = "formTipo";
String textoSubMenu02 = "listaTipo";
String subMenuAtual = "listaTipo.jsp";
if(request.getParameter("subMenuAtual")!=null){
	subMenuAtual = request.getParameter("subMenuAtual").toString()+".jsp";
}

%>
<div id="fbox1">
	<ul>
		<li>
			<form method="post" action="index.jsp">						
				<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu01%>">
				<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
				<h3><a accesskey="5" title="" onclick="submit()">Cadastrar Tipo</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="index.jsp">						
				<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu02%>">
				<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
				<h3><a accesskey="5" title="" onclick="submit()">Listar Tipo</a></h3>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
