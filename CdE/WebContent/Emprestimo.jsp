<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.*"%>
<%
String subMenuAtual = "listaEmprestimo.jsp";
if(request.getParameter("subMenuAtual")!=null){
	subMenuAtual = request.getParameter("subMenuAtual").toString()+".jsp";
}
%>
<div id="fbox1">
	<ul>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">						
				<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU09%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
				<input type="hidden" name="command" value="Navegar">
				<h3><a accesskey="5" title="Cadastrar Emprestimo" onclick="submit()">Cadastrar Emprestimo</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">			
				<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU03%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
				<input type="hidden" name="command" value="ListaEmprestimo">
				<h3><a accesskey="5" title="Listar Emprestimos" onclick="submit()">Listar Emprestimos</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">
					<input type="hidden" name="subMenuAtualFiltro" value="<%=Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
					<input type="hidden" name="command" value="ListaEmprestimo">
					<a accesskey="2" title="Listar Pessoas" onclick="submit()">Emprestimos em aberto</a>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU05%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
					<input type="hidden" name="command" value="ListaEmprestimo">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Emprestimos atrazados</a>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
