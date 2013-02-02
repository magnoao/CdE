<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.*"%>
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
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU08%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<input type="hidden" name="command" value="Navegar">
				<h3><a accesskey="1" title="" onclick="submit()">Cadastrar Item</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU02%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<input type="hidden" name="command" value="ListaItem">
				<h3><a accesskey="2" title="" onclick="submit()">Ver todos os Itens</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">
				<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU13%>">
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU02%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<input type="hidden" name="command" value="ListaItem">
				<h3><a accesskey="2" title="" onclick="submit()">Ver Bloqueados</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">
				<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU12%>">
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU02%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<input type="hidden" name="command" value="ListaItem">
				<h3><a accesskey="2" title="" onclick="submit()">Ver disponiveis</a></h3>
			</form>
		</li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">			
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU11%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<input type="hidden" name="command" value="Navegar">
				<h3><a accesskey="1" title="" onclick="submit()">Cadastrar Tipo</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="<%=Textos.SERVLET%>">
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU10%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<input type="hidden" name="command" value="ListaTipo">
				<h3><a accesskey="2" title="" onclick="submit()">Listar Tipo</a></h3>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
