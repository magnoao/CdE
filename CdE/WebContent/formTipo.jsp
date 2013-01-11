<jsp:include page="header.jsp"></jsp:include>
<%@page import="model.*, util.*, model.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 TipoDeItem p = new TipoDeItem();
 int id=0;
 String tituloLista = "Cadastro de Tipo";
 if(request.getParameter("idTipoDeItem")!=null){
	 id = Integer.parseInt(request.getParameter("idTipoDeItem"));
	 tituloLista = "Atualização de Tipo";
	 if(id>0){
		 p = (TipoDeItem) new TipoDeItemDAO().getOne(id);
	 }
 }
 %>

<div id="fbox2">
	<h2 align="center"><%=tituloLista %></h2><br/>
	<form method="post" action="cadastrarTipo.jsp" onsubmit="return checkForm(this)">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" class="text" id="Nome" name="nome" value="<%=p.getNome()%>"> </td>
			</tr>
			<tr>
				<td>Descrição:</td>
				<td><input type="text" class="text" id="Descrição" name="descricao" value="<%=p.getDescricao()%>"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idTipoDeItem" value="<%=p.getIdTipoDeItem()%>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU10%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<input type="submit" value="Salvar">
					<input type="submit" value="Limpar">
				</td>
			</tr>
		</table>
		
	</form>
</div>