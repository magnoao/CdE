<jsp:include page="header.jsp"></jsp:include>
<%@page import="java.util.*, model.*, model.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 Vector<TipoDeItem> vetTipo = (Vector<TipoDeItem>)new TipoDeItemDAO().getList();
 TipoDeItem tipo = new TipoDeItem();
 
 Item p = new Item();
 p.setTipoDeItem(tipo);
 int id=0;
 if(request.getParameter("idItem")!=null){
	 id = Integer.parseInt(request.getParameter("idItem"));
	 if(id>0){
		 p = (Item) new ItemDAO().getOne(id);
	 }
 }
 %>
<div id="fbox2">
	<form method="post" action="cadastrarItem.jsp">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" name="nome" value="<%=p.getNome()%>"> </td>
			</tr>
			<tr>
				<td>Descrição:</td>
				<td><input type="text" name="descricao" value="<%=p.getDescricao()%>"> </td>
			</tr>
			<tr>
				<td>Tipo de Item:</td>
				<td>
					<select name="idTipoDeItem">
						<option></option>
						<%for (int i = 0; i < vetTipo.size(); i++) {
						tipo=vetTipo.get(i); %>
						<option value="<%=tipo.getIdTipoDeItem() %>" <%if(p.getTipoDeItem().getIdTipoDeItem() == tipo.getIdTipoDeItem()){ %>selected="selected" <%} %> ><%=tipo.getNome()%></option>
						<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>Disponivel?</td>
				<td><input type="text" name="disponivel" value="<%=p.isDisponivel()%>"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idItem" value="<%=p.getIdItem()%>">
					<input type="hidden" name="subMenuAtual" value="listaItem">
					<input type="hidden" name="menuAtual" value="item">
					<input type="submit" value="Salvar">
				</td>
			</tr>
		</table>
		
	</form>
</div>