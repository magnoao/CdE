<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="invalidaAcesso.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, util.*, model.*, model.dao.*"%>
<%
String tituloLista = "Lista de Tipos";
Vector<TipoDeItem> vet = (Vector<TipoDeItem>)new TipoDeItemDAO().getList();
%>
<div id="fbox2">
	<h2><%=tituloLista %></h2><br/>
	<table class="tabela">
		<tr>
			<td width="10%" align="center"><h4>ID</h4> </td>
			<td width="25%" align="center"><h4>Nome</h4></td>
			<td width="65%" align="center"><h4>Descrição</h4></td>
			<td></td>
		</tr>
<%
TipoDeItem p;
for (int i = 0; i < vet.size(); i++) {
	p=vet.get(i);
%>
		<tr class="line">
			<td align="center">
				<form method="post" action="index.jsp">
					<input type="submit" name="idTipoDeItem" value="<%=p.getIdTipoDeItem() %>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU11%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				</form>
			</td >
			<td><%=p.getNome() %></td>
			<td><%=p.getDescricao()%></td>
			<td>
				<form method="post" action="excluirTipo.jsp"  onsubmit="return confirmaRemove()">
					<input type="submit" value="x" >
					<input type="hidden" name="idItem" value="<%=p.getIdTipoDeItem() %>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU10%>">
				</form>
			</td>
		</tr>
<%} %>		
	</table>
</div>
