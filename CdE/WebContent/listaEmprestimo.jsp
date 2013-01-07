<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*, model.dao.*"%>
<%
Vector<Emprestimo> vet = (Vector<Emprestimo>) new EmprestimoDAO().getList();

%>
<div id="fbox2">
	<table>
		<tr>
			<td width="5%"><h4>ID</h4></td>
			<td width="14%"><h4>Emprestado:</h4></td>
			<td width="14%"><h4>Devolver:</h4></td>
			<td width="14%"><h4>Recebido:</h4></td>
			<td width="23%"><h4>Quem pegou?</h4></td>
			<td width="30%"><h4>Item?</h4></td>
			<td></td>
		</tr>
<%
Emprestimo emp;
for (int i = 0; i < vet.size(); i++) {
	emp=vet.get(i);
%>
		<tr>
			<td>
				<form method="post" action="index.jsp">
					<input type="submit" name="idEmprestimo" value="<%=emp.getIdEmprestimo() %>">
					<input type="hidden" name="subMenuAtual" value="formEmprestimo">
					<input type="hidden" name="menuAtual" value="emprestimo">
				</form>
			</td>
			<td><%=emp.getDataEmprestimo() %></td>
			<td><%=emp.getDataPrevistaDevolucao()%></td>
			<td><% if(emp.getDataDevolucao()!=null){%><%=emp.getDataDevolucao()%><%}else{%>?????<%} %></td>
			<td><%=emp.getPessoa().getNome()%></td>
			<td><%=emp.getItem().getNome()%></td>
		</tr>
<%} %>		
	</table>
</div>