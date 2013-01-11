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
	<table class="tabela">
		<tr>
			<td width="10%" align="center"><h3>ID</h3></td>
			<td width="60%" align="center"><h3>Nome</h3></td>
			<td width="25%" align="center"><h3>Tipo de Item</h3></td>
			<td></td>
		</tr>
<%
Item p;
for (int i = 0; i < vet.size(); i++) {
	p=vet.get(i);
%>
		<tr <%if(!p.isDisponivel()){%>class="lineBloqueado" title="Bloqueado por não ter sido devolvido ainda!" <%}else{%>class="line"<%}%>>
			<td align="center">
				<form method="post" action="index.jsp">
					<input type="submit" name="idItem" value="<%=p.getIdItem() %>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu01%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
				</form>
			</td>
			<td><%=p.getNome() %></td>
			<td align="center"><%=p.getTipoDeItem().getNome()%></td>
			<td>
				<form method="post" action="excluirItem.jsp" onsubmit="return confirmaRemove()">
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
