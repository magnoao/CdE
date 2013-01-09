<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*, model.dao.*"%>
<%
Vector<Item> vet = (Vector<Item>)new ItemDAO().getList();
String textoMenuAtual = "Item";
String textoSubMenu01 = "formItem";
String textoSubMenu02 = "listaItem";
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
				<form method="post" action="index.jsp">
					<input type="submit" name="idItem" value="<%=p.getIdItem() %>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu01%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
				</form>
			</td>
			<td><%=p.getNome() %></td>
			<td><%=p.getTipoDeItem().getNome()%></td>
			<td><% p.isDisponivel();%></td>
			<td>
				<form method="post" action="excluirItem.jsp">
					<input type="submit" value="x" >
					<input type="hidden" name="idItem" value="<%=p.getIdItem() %>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu02%>">
				</form>
			</td>
		</tr>
<%} %>		
	</table>
</div>