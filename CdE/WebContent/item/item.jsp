<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String subMenuAtual = "listaItem.jsp";
if(request.getParameter("subMenuAtual")!=null){
	subMenuAtual = request.getParameter("subMenuAtual").toString()+".jsp";
}
%>
<div id="fbox1">
	<ul>
		<li>
			<form method="post">						
				<input type="hidden" name="subMenuAtual" value="formItem">
				<input type="hidden" name="menuAtual" value="item">
				<h3><a accesskey="5" title="" onclick="submit()">Cadastrar Item</a></h3>
			</form>
		</li>
		<li>
			<form method="post">						
				<input type="hidden" name="subMenuAtual" value="listaItem">
				<input type="hidden" name="menuAtual" value="item">
				<h3><a accesskey="5" title="" onclick="submit()">Listar Item</a></h3>
			</form>
		</li>
	</ul>
</div>
	<jsp:include page="<%= subMenuAtual %>"></jsp:include>
