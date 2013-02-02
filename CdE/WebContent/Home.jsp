<jsp:include page="header.jsp"></jsp:include>
<%@page import="util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int numPessoas=0, numPessoasBloqueadas=0, numItem=0, numPessoacomObjeto=0,numObjetosEmprestados=0,numObjetosAtrazados=0;

numPessoas = Integer.parseInt(request.getAttribute("numPessoas").toString());
numPessoasBloqueadas =  Integer.parseInt(request.getAttribute("numPessoasBloqueadas").toString());
numItem =  Integer.parseInt(request.getAttribute("numItem").toString());
numObjetosAtrazados =  Integer.parseInt(request.getAttribute("numObjetosAtrazados").toString());
numObjetosEmprestados =  Integer.parseInt(request.getAttribute("numObjetosEmprestados").toString());
numPessoacomObjeto =  Integer.parseInt(request.getAttribute("numPessoacomObjeto").toString());

%>
<table>
	<tr>
		<td align="right">
			<form method="post" action="<%=Textos.SERVLET%>">	
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU02%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<input type="hidden" name="command" value="ListaItem">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de itens Cadastrados:<%=numItem %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="<%=Textos.SERVLET%>">	
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU01%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<input type="hidden" name="command" value="ListaPessoa">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de pessoas Cadastradas:<%=numPessoas %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="<%=Textos.SERVLET%>">
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
					<input type="hidden" name="command" value="ListaEmprestimo">
					<a accesskey="2" title="Listar Pessoas" onclick="submit()">Numero de objetos emprestados:<%=numObjetosEmprestados%></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="<%=Textos.SERVLET%>">
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU05%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU01%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
					<input type="hidden" name="command" value="ListaPessoa">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de pessoas com objetos meus:<%=numPessoacomObjeto%></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="<%=Textos.SERVLET%>">
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU04%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU01%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
					<input type="hidden" name="command" value="ListaPessoa">
					<a accesskey="2" title="Listar Categorias" onclick="submit()">Numero de pessoa bloqueadas por nao devolver:<%=numPessoasBloqueadas %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="<%=Textos.SERVLET%>">
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU05%>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
					<input type="hidden" name="command" value="ListaEmprestimo">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de objetos que ja deveriam ter sido devolvidos:<%=numObjetosAtrazados%></a>
			</form>
		</td>
	</tr>
</table>