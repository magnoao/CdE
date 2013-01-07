<jsp:include page="header.jsp"></jsp:include>
<%@page import="model.*, model.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 Pessoa p = new Pessoa();
 int idpessoa=0;
 if(request.getParameter("idPessoa")!=null){
	 idpessoa = Integer.parseInt(request.getParameter("idPessoa"));
	 if(idpessoa>0){
		 p = (Pessoa) new PessoaDAO().getOne(idpessoa);
		 System.out.print(p.getEmail());
	 }
 }
 %>

<div id="fbox2">
	<form method="post" action="cadastrarPessoa.jsp">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" name="nome" value="<%=p.getNome()%>"> </td>
			</tr>
			<tr>
				<td>Teledone:</td>
				<td><input type="text" name="telefone" value="<%=p.getTelefone()%>"> </td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" value="<%=p.getEmail()%>"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idPessoa" value="<%=p.getIdPessoa()%>">
					<input type="hidden" name="subMenuAtual" value="listaPessoa">
					<input type="hidden" name="menuAtual" value="pessoa">
					<input type="submit" value="Salvar">
				</td>
			</tr>
		</table>
		
	</form>
</div>