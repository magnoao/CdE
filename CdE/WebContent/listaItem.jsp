<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="invalidaAcesso.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,util.*, model.*, model.dao.*"%>
<%

String tituloLista = "Lista de itens";
Vector<Item> vet;

if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaItensDisponiveis")){
	vet = (Vector<Item>)new ItemDAO().getList("disponivel",1);
	tituloLista = "Lista de itens disponiveis";
}else if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaItensBloqueados")){
	vet = (Vector<Item>)new ItemDAO().getList("disponivel",0);
	tituloLista = "Lista de itens indisponiveis";
}else{
	vet = (Vector<Item>)new ItemDAO().getList();
}


Item p;
%>
<div id="fbox2">
	<h2><%=tituloLista %></h2><br/>	
	<table class="tabela">
		<tr>
			<td width="10%" align="center"><h4>ID</h4></td>
			<td width="65%" align="center"><h4>Nome</h4></td>
			<td width="25%" align="center"><h4>Tipo de Item</h4></td>
			<td></td>
		</tr>
<%
for (int i = 0; i < vet.size(); i++) {
	p=vet.get(i);
%>
		<tr <%if(!p.isDisponivel()){%>class="lineBloqueado" title="Bloqueado por não ter sido devolvido ainda!" <%}else{%>class="line"<%}%>>
			<td align="center">
				<form method="post" action="index.jsp">
					<input type="submit" name="idItem" value="<%=p.getIdItem() %>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU08%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
				</form>
			</td>
			<td><%=p.getNome() %></td>
			<td align="center"><%=p.getTipoDeItem().getNome()%></td>
			<td>
				<form method="post" action="excluirItem.jsp" onsubmit="return confirmaRemove()">
					<input type="submit" value="x" >
					<input type="hidden" name="idItem" value="<%=p.getIdItem() %>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU02%>">
				</form>
			</td>
		</tr>
<%} %>		
	</table>
</div>
