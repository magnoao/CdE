<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*, model.dao.*"%>
<%
Vector<Pessoa> vet = (Vector<Pessoa>)new PessoaDAO().getList();
%>
<div id="fbox2">
	<table>
		<tr>
			<td width="10%">ID</td>
			<td width="40%"><h3>Nome</h3></td>
			<td width="25%"><h3>Email</h3></td>
			<td width="15%"><h3>Telefone</h3></td>
			<td width="5%"><h3>Status</h3></td>
			<td></td>
		</tr>
<%
Pessoa p;
for (int i = 0; i < vet.size(); i++) {
	p=vet.get(i);
%>
		<tr>
			<td>
				<form method="post" action="index.jsp">
					<input type="submit" name="idPessoa" value="<%=p.getIdPessoa() %>">
					<input type="hidden" name="subMenuAtual" value="formPessoa">
					<input type="hidden" name="menuAtual" value="pessoa">
				</form>
			</td>
			<td><%=p.getNome() %></td>
			<td><%=p.getEmail()%></td>
			<td><%=p.getTelefone() %></td>
			<td><% p.isBloqueado();%></td>
			<td>
				<form method="post" action="excluirPessoa.jsp" onsubmit="reload()">
					<input type="submit" value="x" >
					<input type="hidden" name="idPessoa" value="<%=p.getIdPessoa() %>">
					<input type="hidden" name="menuAtual" value="pessoa">
					<input type="hidden" name="acao" value="excluirPessoa">
				</form>
			</td>
		</tr>
<%} %>		
	</table>
</div>
