<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.*" %>
<%
String subMenuAtual = "nada.jsp";
if(request.getParameter("subMenuAtual")!=null){
	subMenuAtual = request.getParameter("subMenuAtual").toString()+".jsp";
}
%>
<div id="fbox1">
	<ul>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">						
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU07%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
				<input type="hidden" name="command" value="Navegar">
				<h3><a accesskey="5" title="Cadastrar Pessoa" onclick="submit()">Cadastrar Pessoa</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU01%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
				<input type="hidden" name="command" value="ListaPessoa">
				<h3><a accesskey="5" title="Listar Pessoas" onclick="submit()">Listar Pessoas</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">
					<input type="hidden" name="subMenuAtualFiltro" value="<%=Textos.TEXTOSUBMENU04%>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU01%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
					<input type="hidden" name="command" value="ListaPessoa">
					<a accesskey="2" title="Listar Categorias" onclick="submit()">Pessoa bloqueadas</a>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
