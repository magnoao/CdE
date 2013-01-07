<jsp:include page="header.jsp"></jsp:include>
<%@page import="model.*, model.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 TipoDeItem p = new TipoDeItem();
 int id=0;
 if(request.getParameter("idTipoDeItem")!=null){
	 id = Integer.parseInt(request.getParameter("idTipoDeItem"));
	 if(id>0){
		 p = (TipoDeItem) new TipoDeItemDAO().getOne(id);
	 }
 }
 %>

<div id="fbox2">
	<form method="post" action="cadastrarTipo.jsp">
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
				<td colspan="2" align="center">
					<input type="hidden" name="idTipoDeItem" value="<%=p.getIdTipoDeItem()%>">
					<input type="hidden" name="subMenuAtual" value="listaTipo">
					<input type="hidden" name="menuAtual" value="tipo">
					<input type="submit" value="Salvar">
					<input type="submit" value="Limpar">
				</td>
			</tr>
		</table>
		
	</form>
</div>