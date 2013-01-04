<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*, model.dao.*"%>
<%
Vector<TipoDeItem> vet = (Vector<TipoDeItem>)new TipoDeItemDAO().getList();
%>
<div id="fbox2">
	<table>
		<tr>
			<td width="10%">ID</td>
			<td width="40%"><h3>Nome</h3></td>
			<td width="25%"><h3>Descrição</h3></td>
			<td></td>
		</tr>
<%
TipoDeItem p;
for (int i = 0; i < vet.size(); i++) {
	p=vet.get(i);
%>
		<tr>
			<td>
				<form method="post">
					<input type="submit" name="idTipoDeItem" value="<%=p.getIdTipoDeItem() %>">
					<input type="hidden" name="subMenuAtual" value="formTipo">
					<input type="hidden" name="menuAtual" value="tipo">
				</form>
			</td>
			<td><%=p.getNome() %></td>
			<td><%=p.getDescricao()%></td>
			<td>
				<form method="post" action="tipo/excluirTipo.jsp">
					<input type="submit" value="x" >
					<input type="hidden" name="idItem" value="<%=p.getIdTipoDeItem() %>">
					<input type="hidden" name="subMenuAtual" value="listaTipo">
					<input type="hidden" name="menuAtual" value="tipo">
				</form>
			</td>
		</tr>
<%} %>		
	</table>
</div>
