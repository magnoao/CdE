<jsp:include page="../header.jsp"></jsp:include>
<%@page import="java.util.*, model.*, model.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 Vector<Pessoa> vetPessoa = (Vector<Pessoa>)new PessoaDAO().getList();
 Pessoa pessoa = new Pessoa();
 
 Vector<Item> vetItem = (Vector<Item>)new ItemDAO().getList();
 Item item = new Item();
 
 Emprestimo p = new Emprestimo();
 p.setPessoa(new Pessoa());
 p.setItem(new Item());
 int id=0;
 if(request.getParameter("idEmprestimo")!=null){
	 id = Integer.parseInt(request.getParameter("idEmprestimo"));
	 if(id>0){
		 p = (Emprestimo) new EmprestimoDAO().getOne(id);
	 }
 }
 %>

<div id="fbox2">
	<form method="post" action="emprestimo/cadastrarEmprestimo.jsp">
		<table>
			<tr>
				<td>Quem?</td>
				<td>
					<select name="idPessoa">
						<option></option>
					<%for (int i = 0; i < vetPessoa.size(); i++) {
						pessoa=vetPessoa.get(i); %>
						<option value="<%=pessoa.getIdPessoa() %>" <%if(p.getPessoa().getIdPessoa() == pessoa.getIdPessoa()){ %>selected="selected" <%} %> ><%=pessoa.getNome()%></option>
					<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>O que?</td>
				<td>
					<select name="idItem">
						<option></option>
					<%for (int i = 0; i < vetItem.size(); i++) {
						item=vetItem.get(i); %>
						<option value="<%=item.getIdItem() %>" <%if(p.getItem().getIdItem() == item.getIdItem()){ %>selected="selected" <%} %> ><%=item.getNome()%></option>
					<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>Quando?</td>
				<td><input type="text" name="email" value="<%=p.getDataEmprestimo()%>"> </td>
			</tr>
			<tr>
				<td>At� quando?</td>
				<td><input type="text" name="email" value="<%=p.getDataPrevistaDevolucao()%>"> </td>
			</tr>
			<tr>
				<td>Devolvido em:</td>
				<td><input type="text" name="email" value="<%=p.getDataDevolucao()%>"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idEmprestimo" value="<%=p.getIdEmprestimo()%>">
					<input type="submit" value="Salvar">
					<input type="submit" value="Limpar">
				</td>
			</tr>
		</table>
		
	</form>
</div>