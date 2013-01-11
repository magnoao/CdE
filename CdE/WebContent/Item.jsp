<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.*"%>
<%
String subMenuAtual = "listaItem.jsp";
if(request.getParameter("subMenuAtual")!=null){
	subMenuAtual = request.getParameter("subMenuAtual").toString()+".jsp";
}
%>
<div id="fbox1">
	<ul>
		<li>
			<form method="post" action="index.jsp">						
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU08%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<h3><a accesskey="1" title="" onclick="submit()">Cadastrar Item</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="index.jsp">	
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU02%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<h3><a accesskey="2" title="" onclick="submit()">Listar Item</a></h3>
			</form>
		</li>
				<li>
			<form method="post" action="index.jsp">						
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU11%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<h3><a accesskey="1" title="" onclick="submit()">Cadastrar Tipo</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="index.jsp">	
				<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU10%>">
				<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				<h3><a accesskey="2" title="" onclick="submit()">Listar Tipo</a></h3>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
