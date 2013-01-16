<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="invalidaAcesso.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, util.*, model.*, model.dao.*"%>
<%
String tituloLista = "Lista de Pessoas";
Vector<Pessoa> vet;

if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaPessoaBloqueada")){
	vet = (Vector<Pessoa>)new PessoaDAO().getList("bloqueado",1);
	tituloLista = "Lista de Pessoas bloqueadas";
}else{
	vet = (Vector<Pessoa>)new PessoaDAO().getList();
}
%>
<div id="fbox2">
	<h2><%=tituloLista %></h2><br/>
	<table class="tabela">
		<tr>
			<td width="10%" align="center"><h4>ID</h4></td>
			<td width="40%" align="center"><h4>Nome</h4></td>
			<td width="25%" align="center"><h4>Email</h4></td>
			<td width="25%" align="center"><h4>Telefone</h4></td>
			<td></td>
		</tr>
<%
Pessoa p;
for (int i = 0; i < vet.size(); i++) {
	p=vet.get(i);
%>
		<tr <%if(p.isBloqueado()){%>class="lineBloqueado" title="Bloqueado por ter itens com devolucão atrasada!" <%}else{%>class="line"<%}%>>
			<td align="center">
				<form method="post" action="index.jsp">
					<input type="submit" name="idPessoa" value="<%=p.getIdPessoa() %>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU07%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
				</form>
			</td>
			<td><%=p.getNome() %></td>
			<td><%=p.getEmail()%></td>
			<td align="center"><%=p.getTelefone() %></td>
			<td >
				<form method="post" action="excluirPessoa.jsp"  onsubmit="return confirmaRemove()">
					<input type="submit" value="x" >
					<input type="hidden" name="idPessoa" value="<%=p.getIdPessoa() %>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU01%>">
				</form>
			</td>
		</tr>
<%} %>		
	</table>
</div>
