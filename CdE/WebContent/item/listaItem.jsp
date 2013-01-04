<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*, model.dao.*"%>
<%
Vector<Item> vet = (Vector<Item>)new ItemDAO().getList();
%>
<div id="fbox2">
	<table>
		<tr>
			<td width="10%">ID</td>
			<td width="40%"><h3>Nome</h3></td>
			<td width="25%"><h3>Tipo de Item</h3></td>
			<td width="5%"><h3>Status</h3></td>
			<td></td>
		</tr>
<%
Item p;
for (int i = 0; i < vet.size(); i++) {
	p=vet.get(i);
%>
		<tr>
			<td>
				<form method="post">
					<input type="submit" name="idItem" value="<%=p.getIdItem() %>">
					<input type="hidden" name="subMenuAtual" value="formItem">
					<input type="hidden" name="menuAtual" value="item">
				</form>
			</td>
			<td><%=p.getNome() %></td>
			<td><%=p.getTipoDeItem().getNome()%></td>
			<td><% p.isDisponivel();%></td>
			<td>
				<form method="post" action="item/excluirItem.jsp">
					<input type="submit" value="x" >
					<input type="hidden" name="idItem" value="<%=p.getIdItem() %>">
					<input type="hidden" name="subMenuAtual" value="listaItem">
					<input type="hidden" name="menuAtual" value="item">
				</form>
			</td>
		</tr>
<%} %>		
	</table>
</div>
