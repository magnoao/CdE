<jsp:include page="header.jsp"></jsp:include>
<%@page import="util.*, model.dao.ConsultaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Ajustes.ajustar();
int numPessoas=0, numPessoasBloqueadas=0, numItem=0, numPessoacomObjeto=0,numObjetosEmprestados=0,numObjetosAtrazados=0;
ConsultaDAO dao = new ConsultaDAO();

numPessoas = dao.get("SELECT count(*) pessoas FROM tbpessoa;","pessoas");
numPessoasBloqueadas=dao.get("SELECT count(*) as bloqueados FROM tbpessoa where bloqueado =1;","bloqueados");
numItem=dao.get("SELECT count(*) itens FROM tbitem;","itens");
numObjetosAtrazados=dao.get("SELECT count(*) as numObjetosAtrazados FROM viewitensatrasados;","numObjetosAtrazados");
numObjetosEmprestados=dao.get("SELECT count(*) as numObjetosEmprestados FROM viewemprestados;","numObjetosEmprestados");
numPessoacomObjeto=dao.get("SELECT count(*) as totalpessoas FROM viewdevedores;","totalpessoas");

%>
<table>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU02%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de itens Cadastrados:<%=numItem %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU01%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL2%>">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de pessoas Cadastradas:<%=numPessoas %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
					<a accesskey="2" title="Listar Pessoas" onclick="submit()">Numero de objetos emprestados:<%=numObjetosEmprestados%></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU05%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU01%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de pessoas com objetos meus:<%=numPessoacomObjeto%></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU04%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU01%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
					<a accesskey="2" title="Listar Categorias" onclick="submit()">Numero de pessoa bloqueadas por nao devolver:<%=numPessoasBloqueadas %></a>
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<form method="post" action="index.jsp">	
					<input type="hidden" name="subMenuAtualFiltro" value="<%= Textos.TEXTOSUBMENU05%>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
					<a accesskey="1" title="Listar Pessoas" onclick="submit()">Numero de objetos que ja deveriam ter sido devolvidos:<%=numObjetosAtrazados%></a>
			</form>
		</td>
	</tr>
</table>