<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.text.*, util.*, model.*, model.dao.*"%>
<%
SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
Vector<Emprestimo> vet = (Vector<Emprestimo>) new EmprestimoDAO().getList();
String textoMenuAtual = "Emprestimo";
String textoSubMenu01 = "formEmprestimo";

%>
<div id="fbox2">
	<table class="tabela">
		<tr>
			<td width="5%" align="center"><h4>ID</h4></td>
			<td width="12%" align="center"><h4>Emprestado</h4></td>
			<td width="12%" align="center"><h4>Devolver</h4></td>
			<td width="12%" align="center"><h4>Recebido</h4></td>
			<td width="35%" align="center"><h4>Quem pegou?</h4></td>
			<td width="24%" align="center"><h4>Item?</h4></td>
			<td></td>
		</tr>
<%
Emprestimo emp;
for (int i = 0; i < vet.size(); i++) {
	emp=vet.get(i);
%>
		<tr class="line">
			<td align="center">
				<form method="post" action="index.jsp">
					<input type="submit" name="idEmprestimo" value="<%=emp.getIdEmprestimo() %>">
					<input type="hidden" name="subMenuAtual" value="<%= textoSubMenu01%>">
					<input type="hidden" name="menuAtual" value="<%=textoMenuAtual%>">
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