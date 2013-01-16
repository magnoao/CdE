<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="invalidaAcesso.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.*, model.*, model.dao.*"%>
 <%
 Pessoa p = new Pessoa();
 int idpessoa=0;
 String tituloLista = "Cadastro de Pessoa";
 if(request.getParameter("idPessoa")!=null){
	 idpessoa = Integer.parseInt(request.getParameter("idPessoa"));
	 tituloLista = "Atualização de Pessoa";
	 if(idpessoa>0){
		 p = (Pessoa) new PessoaDAO().getOne(idpessoa);
		 System.out.print(p.getEmail());
	 }
 }
 %>

<div id="fbox2">
	<h2><%=tituloLista %></h2><br/>
	<form method="post" action="cadastrarPessoa.jsp" onsubmit="return checkForm(this)" >
		<table class="tabela" >
			<tr>
				<td align="right" width="25%" >Nome:</td>
				<td width="75%" ><input type="text" class="text" id="Nome" name="nome" value="<%=p.getNome()%>" maxlength="45"> </td>
			</tr>
			<tr>
				<td align="right">Telefone:</td>
				<td><input type="text" class="text" id="Telefone" name="telefone" value="<%=p.getTelefone()%>" maxlength="16"> </td>
			</tr>
			<tr>
				<td align="right">Email:</td>
				<td><input type="text" class="text" id="E-mail" name="email" value="<%=p.getEmail()%>" maxlength="45"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idPessoa" value="<%=p.getIdPessoa()%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU01%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
					<input type="submit" value="Salvar">
				</td>
			</tr>
		</table>
	</form>
</div>