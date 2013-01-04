<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String subMenuAtual = "listaTipo.jsp";
if(request.getParameter("subMenuAtual")!=null){
	subMenuAtual = request.getParameter("subMenuAtual").toString()+".jsp";
}
%>
<div id="fbox1">
	<ul>
		<li>
			<form method="post">						
				<input type="hidden" name="subMenuAtual" value="formTipo">
				<input type="hidden" name="menuAtual" value="tipo">
				<h3><a accesskey="5" title="" onclick="submit()">Cadastrar Tipo</a></h3>
			</form>
		</li>
		<li>
			<form method="post">						
				<input type="hidden" name="subMenuAtual" value="listaTipo">
				<input type="hidden" name="menuAtual" value="tipo">
				<h3><a accesskey="5" title="" onclick="submit()">Listar Tipo</a></h3>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
