<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="invalidaAcesso.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, util.*, model.*"%>
<%
String tituloLista = (String)request.getAttribute("titulo"); //"Lista de Pessoas";
Vector<Pessoa> vet = (Vector<Pessoa>)request.getAttribute("listaDePessoas");
Pessoa p;
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
for (int i = 0; i < vet.size(); i++) {
	p=vet.get(i);
%>
		<tr <%if(p.isBloqueado()){%>class="lineBloqueado" title="Bloqueado por ter itens com devolucão atrasada!" <%}else{%>class="line"<%}%>>
			<td align="center">
				<form method="post" action="<%=Textos.SERVLET%>">
					<input type="submit" name="idPessoa" value="<%=p.getIdPessoa() %>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU07%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL1%>">
					<input type="hidden" name="command" value="Navegar">
				</form>
			</td>
			<td><%=p.getNome() %></td>
			<td><%=p.getEmail()%></td>
			<td align="center"><%=p.getTelefone() %></td>
			<td >
				<form method="post" action="<%=Textos.SERVLET%>"  onsubmit="return confirmaRemove()">
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
