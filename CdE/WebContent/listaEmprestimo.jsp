<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, java.sql.Date, java.text.*, util.*, model.*, model.dao.*"%>
<%
String tituloLista = "Lista de Emprestimos";
SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
Vector<Emprestimo> vet;
if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaPessoaComItens")){
	vet = (Vector<Emprestimo>) new EmprestimoDAO().getList(" WHERE dataprevistadevolucao < CURDATE() and datadevolucao is null");
	tituloLista = "Lista de emprestimos atrasado";
}else if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaEmprestimo")){
	vet = (Vector<Emprestimo>) new EmprestimoDAO().getList(" WHERE datadevolucao is null");
	tituloLista = "Lista de emprestimos em aberto";
}else{
	vet = (Vector<Emprestimo>) new EmprestimoDAO().getList();
}
%>
<div id="fbox2">
<h2 align="center"><%=tituloLista %></h2><br/>
	<table class="tabela">
		<tr>
			<td width="5%" align="center"><h4>ID</h4></td>
			<td width="14%" align="center"><h4>Emprestado</h4></td>
			<td width="14%" align="center"><h4>Devolver</h4></td>
			<td width="14%" align="center"><h4>Recebido</h4></td>
			<td width="29%" align="center"><h4>Quem pegou?</h4></td>
			<td width="24%" align="center"><h4>Item?</h4></td>
			<td></td>
		</tr>
<%
Emprestimo emp;
for (int i = 0; i < vet.size(); i++) {
	emp=vet.get(i);
%>
		<tr <%if(emp.getDataPrevistaDevolucao().before(new java.sql.Date(new java.util.Date().getTime())) && (emp.getDataDevolucao()==null)){%>class="lineBloqueado" title="Devolução atrazada!" <%}else{%>class="line"<%}%>>
			<td align="center">
				<form method="post" action="index.jsp">
					<input type="submit" name="idEmprestimo" value="<%=emp.getIdEmprestimo() %>">
					<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU09%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
				</form>
			</td>
			<td align="center"><%if(emp.getDataEmprestimo()!=null){ %><%=df.format(emp.getDataEmprestimo())%><%}%></td>
			<td align="center"><%if(emp.getDataPrevistaDevolucao()!=null){ %><%=df.format(emp.getDataPrevistaDevolucao())%><%}%></td>
			<td align="center"><% if(emp.getDataDevolucao()!=null){%><%=df.format(emp.getDataDevolucao())%><%}else{%>?????<%} %></td>
			<td><%=emp.getPessoa().getNome()%></td>
			<td><%=emp.getItem().getNome()%></td>
		</tr>
<%} %>		
	</table>
</div>