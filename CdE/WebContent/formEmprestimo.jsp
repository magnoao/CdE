<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="invalidaAcesso.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, java.text.*,util.*, model.*, model.dao.*"%>
    
 <%
 SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
 
 Vector<Pessoa> vetPessoa = (Vector<Pessoa>)new PessoaDAO().getList();
 Pessoa pessoa = new Pessoa();
 
 Vector<Item> vetItem = (Vector<Item>)new ItemDAO().getList();
 Item item = new Item();
 
 Emprestimo p = new Emprestimo();
 p.setPessoa(new Pessoa());
 p.setItem(new Item());
 int id=0;
 String tituloLista = "Cadastro de emprestimo";
 if(request.getParameter("idEmprestimo")!=null){
	 id = Integer.parseInt(request.getParameter("idEmprestimo"));
	 tituloLista = "Atualização de emprestimo";
	 if(id>0){
		 p = (Emprestimo) new EmprestimoDAO().getOne(id);
	 }
 }
 %>

<div id="fbox2">
	<h2><%=tituloLista %></h2><br/>
	<form method="post" action="<%=Textos.SERVLET %>">
		<table>
			<tr>
				<td>Quem?</td>
				<td>
					<select name="idPessoa" class="text">
						<option></option>
					<%for (int i = 0; i < vetPessoa.size(); i++) {
						pessoa=vetPessoa.get(i); 
						if(!pessoa.isBloqueado()){%>
						<option value="<%=pessoa.getIdPessoa() %>" <%if(p.getPessoa().getIdPessoa() == pessoa.getIdPessoa()){ %>selected="selected" <%} %> ><%=pessoa.getNome()%></option>
						<%}else if((pessoa.getIdPessoa()==p.getPessoa().getIdPessoa())){%>
						<option value="<%=pessoa.getIdPessoa() %>" <%if(p.getPessoa().getIdPessoa() == pessoa.getIdPessoa()){ %>selected="selected" <%} %> ><%=pessoa.getNome()%></option>
						<%} %>
					<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>O que?</td>
				<td>
					<select name="idItem" class="text">
						<option></option>
					<%for (int i = 0; i < vetItem.size(); i++) {
						item=vetItem.get(i); 
						if(item.isDisponivel()){%>
						<option value="<%=item.getIdItem() %>" <%if(p.getItem().getIdItem() == item.getIdItem()){ %>selected="selected" <%} %> ><%=item.getNome()%></option>
						<%}else if((item.getIdItem()==p.getItem().getIdItem())){%>
						<option value="<%=item.getIdItem() %>" <%if(p.getItem().getIdItem() == item.getIdItem()){ %>selected="selected" <%} %> ><%=item.getNome()%></option>
						<%} %>
					<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>Quando?</td>
				<td><input type="text" class="text" name="dataEmprestimo" value="<%if(p.getDataEmprestimo()!=null){ %><%=df.format(p.getDataEmprestimo())%><%}%>"> </td>
			</tr>
			<tr>
				<td>Até quando?</td>
				<td><input type="text" class="text" name="dataPrevistaDevolucao" value="<%if(p.getDataPrevistaDevolucao()!=null){ %><%=df.format(p.getDataPrevistaDevolucao())%><%}%>"> </td>
			</tr>
			<tr>
				<td>Devolvido em:</td>
				<td><input type="text" class="text" name="dataDevolucao" value="<%if(p.getDataDevolucao()!=null){ %><%=df.format(p.getDataDevolucao())%><%}%>"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="idEmprestimo" value="<%=p.getIdEmprestimo()%>">
					<input type="hidden" name="subMenuAtual" value="<%= Textos.TEXTOSUBMENU03%>">
					<input type="hidden" name="menuAtual" value="<%=Textos.TEXTOMENUATUAL3%>">
					<input type="hidden" name="command" value="CadastrarEmprestimo">
					<input type="submit" value="Salvar">
					<input type="submit" value="Limpar">
				</td>
			</tr>
		</table>
	</form>
</div>