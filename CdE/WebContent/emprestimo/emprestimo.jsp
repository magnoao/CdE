<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String subMenuAtual = "listaEmprestimo.jsp";
if(request.getParameter("subMenuAtual")!=null){
	subMenuAtual = request.getParameter("subMenuAtual").toString()+".jsp";
}
%>
<div id="fbox1">
	<ul>
		<li>
			<form method="post">						
				<input type="hidden" name="subMenuAtual" value="formEmprestimo">
				<input type="hidden" name="menuAtual" value="emprestimo">
				<h3><a accesskey="5" title="Cadastrar Emprestimo" onclick="submit()">Cadastrar Emprestimo</a></h3>
			</form>
		</li>
		<li>
			<form method="post">						
				<input type="hidden" name="subMenuAtual" value="listaEmprestimo">
				<input type="hidden" name="menuAtual" value="emprestimo">
				<h3><a accesskey="5" title="Listar Emprestimos" onclick="submit()">Listar Emprestimos</a></h3>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
