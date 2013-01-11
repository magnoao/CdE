<jsp:include page="header.jsp"></jsp:include>
<%@page import="model.dao.ConsultaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int numPessoas=0, numPessoasBloqueadas=0, numItem=0, numPessoacomObjeto=0,numObjetosEmprestados=0,numObjetosAtrazados=0;
ConsultaDAO dao = new ConsultaDAO();

numPessoas = dao.get("SELECT count(*) pessoas FROM tbpessoa;","pessoas");
numPessoasBloqueadas=dao.get("SELECT count(*) as bloqueados FROM tbpessoa where bloqueado =1;","bloqueados");
numItem=dao.get("SELECT count(*) itens FROM tbitem;","itens");
numObjetosAtrazados=dao.get("SELECT count(*) as numObjetosAtrazados FROM viewitensatrasados;","numObjetosAtrazados");
numObjetosEmprestados=dao.get("SELECT count(*) as numObjetosEmprestados FROM viewemprestados;","numObjetosEmprestados");
numPessoacomObjeto=dao.get("SELECT count(*) as totalpessoas FROM viewdevedores;","totalpessoas");

String textoMenuAtual1 = "Pessoa";
String textoMenuAtual2 = "Item";
String textoMenuAtual3 = "Emprestimo";
String textoSubMenu01 = "listaPessoa";
String textoSubMenu02 = "listaItem";
String textoSubMenu03 = "listaEmprestimo";
String textoSubMenu04 = "listaPessoaBloqueada";
String textoSubMenu05 = "listaPessoaComItens";
String textoSubMenu06 = "listaItemIndisponivel";

%>
<table>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu02%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual2%>">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de itens Cadastrados:<%=numItem %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu01%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual1%>">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de pessoas Cadastradas:<%=numPessoas %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtualFiltro" value="<%= textoSubMenu03%>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu03%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual3%>">
					<a accesskey="2" title="Listar Pessoas" onclick="submit()">Numero de objetos emprestados:<%=numObjetosEmprestados%></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtualFiltro" value="<%= textoSubMenu05%>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu01%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual1%>">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de pessoas com objetos meus:<%=numPessoacomObjeto%></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtualFiltro" value="<%= textoSubMenu04%>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu01%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual1%>">
					<a accesskey="2" title="Listar Categorias" onclick="submit()">Numero de pessoa bloqueadas por nao devolver:<%=numPessoasBloqueadas %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtualFiltro" value="<%= textoSubMenu05%>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu03%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual3%>">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de objetos que ja deveriam ter sido devolvidos:<%=numObjetosAtrazados%></a>
			</form>
		</td>
	</tr>
</table>