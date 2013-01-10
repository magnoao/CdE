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
 
 String textoMenuAtual = "Pessoa";
 String textoSubMenu02 = "listaPessoa";
 %>

<div id="fbox2">
	<form method="post" action="cadastrarPessoa.jsp" onsubmit="return checkForm(this)">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" class="text" id="Nome" name="nome" value="<%=p.getNome()%>" maxlength="45"> </td>
			</tr>
			<tr>
				<td>Telefone:</td>
				<td><input type="text" class="text" id="Telefone" name="telefone" value="<%=p.getTelefone()%>" maxlength="16"> </td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" class="text" id="E-mail" name="email" value="<%=p.getEmail()%>" maxlength="45"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idPessoa" value="<%=p.getIdPessoa()%>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu02%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
					<input type="submit" value="Salvar">
				</td>
			</tr>
		</table>
		
	</form>
</div>