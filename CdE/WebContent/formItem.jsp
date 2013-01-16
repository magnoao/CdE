<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="invalidaAcesso.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, util.*, model.*, model.dao.*"%>
    
 <%
 Vector<TipoDeItem> vetTipo = (Vector<TipoDeItem>)new TipoDeItemDAO().getList();
 TipoDeItem tipo = new TipoDeItem();
 
 Item p = new Item();
 p.setTipoDeItem(tipo);
 int id=0;
 String tituloLista = "Cadastro de Item";
 if(request.getParameter("idItem")!=null){
	 id = Integer.parseInt(request.getParameter("idItem"));
	 tituloLista = "Atualização de Item";
	 if(id>0){
		 p = (Item) new ItemDAO().getOne(id);
	 }
 }
 %>
<div id="fbox2">
	<h2><%=tituloLista %></h2><br/>
	<form method="post" action="cadastrarItem.jsp" onsubmit="return checkForm(this)">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" class="text" id="Nome" name="nome" value="<%=p.getNome()%>"> </td>
			</tr>
			
			<tr>
				<td>Tipo de Item:</td>
				<td>
					<select name="idTipoDeItem" id="Tipo de Item" class="text">
						<option value="0"></option>
						<%for (int i = 0; i < vetTipo.size(); i++) {
						tipo=vetTipo.get(i); %>
						<option value="<%=tipo.getIdTipoDeItem() %>" <%if(p.getTipoDeItem().getIdTipoDeItem() == tipo.getIdTipoDeItem()){ %>selected="selected" <%} %> ><%=tipo.getNome()%></option>
						<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>Descrição:</td>
				<td><input type="text" class="text" id="Descrição" name="descricao" value="<%=p.getDescricao()%>"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idItem" value="<%=p.getIdItem()%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU02%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<input type="submit" value="Salvar">
				</td>
			</tr>
		</table>
		
	</form>
</div>