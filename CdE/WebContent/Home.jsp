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

String textoMenuAtual = "Pessoa";
String textoSubMenu01 = "formPessoa";
String textoSubMenu02 = "listaPessoa";

%>
<table>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu02%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
					<a accesskey="5" title="Listar Pessoas" onclick="submit()">Numero de pessoas Cadastradas:<%=numPessoas %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a>Numero de categorias Cadastradas:<%=numCatategorias %></a>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a>Numero de itens Cadastrados:<%=numItem %></a>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a>Numero de pessoas com objetos meus:<%=numPessoacomObjeto%></a>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a>Numero de objetos emprestados:<%=numObjetosEmprestados%></a>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a>Numero de objetos que ja deveriam ter sido devolvidos:<%=numObjetosAtrazados%></a>
		</td>
	</tr>
</table>