<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String textoMenuAtual = "Pessoa";
String textoSubMenu01 = "formPessoa";
String textoSubMenu02 = "listaPessoa";
String subMenuAtual = "listaPessoa.jsp";
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
				<h3><a accesskey="5" title="Cadastrar Pessoa" onclick="submit()">Cadastrar Pessoa</a></h3>
			</form>
		</li>
		<li>
			<form method="post" action="index.jsp">	
				<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu02%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
				<h3><a accesskey="5" title="Listar Pessoas" onclick="submit()">Listar Pessoas</a></h3>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
