<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String subMenuAtual = "listaPessoa.jsp";
if(request.getParameter("subMenuAtual")!=null){
	subMenuAtual = request.getParameter("subMenuAtual").toString()+".jsp";
}
%>
<div id="fbox1">
	<ul>
		<li>
			<form method="post">						
				<input type="hidden" name="subMenuAtual" value="formPessoa">
				<input type="hidden" name="menuAtual" value="pessoa">
				<h3><a accesskey="5" title="" onclick="submit()">Cadastrar Pessoa</a></h3>
			</form>
		</li>
		<li>
			<form method="post">						
				<input type="hidden" name="subMenuAtual" value="listaPessoa">
				<input type="hidden" name="menuAtual" value="pessoa">
				<h3><a accesskey="5" title="" onclick="submit()">Listar Pessoas</a></h3>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
