<jsp:include page="header.jsp"></jsp:include>
<%@page import="model.dao.ConsultaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int numPessoas=0, numCatategorias=0, numItem=0, numPessoacomObjeto=0,numObjetosEmprestados=0,numObjetosAtrazados=0;
ConsultaDAO dao = new ConsultaDAO();

numPessoas = dao.get("SELECT count(*) pessoas FROM tbpessoa;","pessoas");
numCatategorias=dao.get("SELECT count(*) categorias FROM tbtipodeitem;","categorias");
numItem=dao.get("SELECT count(*) itens FROM tbitem;","itens");
numObjetosAtrazados=dao.get("SELECT count(*) numObjetosAtrazados FROM tbemprestimo WHERE dataprevistadevolucao < now() and datadevolucao = '0000-00-00';","numObjetosAtrazados");
numObjetosEmprestados=dao.get("SELECT count(*) numObjetosEmprestados FROM tbemprestimo WHERE datadevolucao = '0000-00-00';","numObjetosEmprestados");
numPessoacomObjeto=dao.get("SELECT count(*) totalpessoas FROM tbemprestimo WHERE datadevolucao = '0000-00-00' group by idpessoa ;","totalpessoas");



%>
<table>
	<tr>
		<td align="right">Numero de pessoas Cadastradas:</td>
		<td><%=numPessoas %></td>
	</tr>
	<tr>
		<td align="right">Numero de categorias Cadastradas:</td>
		<td><%=numCatategorias %></td>
	</tr>
	<tr>
		<td align="right">Numero de itens Cadastrados:</td>
		<td><%=numItem %></td>
	</tr>
	<tr>
		<td align="right">Numero de pessoas com objetos meus:</td>
		<td><%=numPessoacomObjeto%></td>
	</tr>
	<tr>
		<td align="right">Numero de objetos emprestados:</td>
		<td><%=numObjetosEmprestados%></td>
	</tr>
	<tr>
		<td align="right">Numero de objetos que ja deveriam ter sido devolvidos:</td>
		<td><%=numObjetosAtrazados%></td>
	</tr>
</table>