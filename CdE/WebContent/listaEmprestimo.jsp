<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="invalidaAcesso.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, java.sql.Date, java.text.*, util.*, model.*, model.dao.*"%>
<%
String tituloLista = (String) request.getAttribute("titulo");
Vector<Emprestimo> vet = (Vector<Emprestimo>) request.getAttribute("listaDeEmprestimos") ;
SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
%>
<div id="fbox2">
	<h2><%=tituloLista %></h2><br/>
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
				<%if(emp.getDataDevolucao()==null){ %>
					<form method="post" action="<%=Textos.SERVLET%>">
						<input type="submit" name="idEmprestimo" value="<%=emp.getIdEmprestimo() %>">
						<input type="hidden" name="subMenuAtual" value="<%=Textos.TEXTOSUBMENU09%>">
						<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
						<input type="hidden" name="command" value="Navegar">
					</form>
				<%}else{ %>
					<%=emp.getIdEmprestimo() %>
				<%} %>
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