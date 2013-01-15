<%@page import="java.sql.Date"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.*, model.*, model.dao.*"%>
<%
EmprestimoDAO dao = new EmprestimoDAO();
ItemDAO itemDAO;
PessoaDAO pessoaDAO;
Emprestimo p = new Emprestimo();
String dataDevolucao =request.getParameter("dataDevolucao");
String dataEmprestimo =request.getParameter("dataEmprestimo"); 
String dataPrevistaDevolucao =request.getParameter("dataPrevistaDevolucao");

try{
p.setDataDevolucao(DateFormat.parseSqlDate(dataDevolucao));
p.setDataEmprestimo(DateFormat.parseSqlDate(dataEmprestimo));
p.setDataPrevistaDevolucao(DateFormat.parseSqlDate(dataPrevistaDevolucao));
p.setItem(Integer.parseInt(request.getParameter("idItem")));
p.setPessoa(Integer.parseInt(request.getParameter("idPessoa")));
} catch (NumberFormatException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
if(p.getDataEmprestimo()!=null && p.getDataPrevistaDevolucao()!=null && p.getItem()!=null && p.getPessoa()!=null){
	int id=0;
	if(request.getParameter("idEmprestimo")!=null){
		id=Integer.parseInt(request.getParameter("idEmprestimo"));
		itemDAO = new ItemDAO();
		pessoaDAO = new PessoaDAO();
		
		if(id>0){
			
			Emprestimo old = (Emprestimo) dao.getOne(id);
			//Disponibilizando o antigo item
			Item item= (Item)itemDAO.getOne(old.getItem().getIdItem());
			Pessoa pessoa= (Pessoa)pessoaDAO.getOne(old.getPessoa().getIdPessoa());
			item.setDisponivel(true);
			itemDAO.updateDados(item);
			
			
			p.setIdEmprestimo(id);	
			dao.updateDados(p);
			//Indisponibilizando o novo item
			item = (Item)itemDAO.getOne(p.getItem().getIdItem());
			item.setDisponivel(false);
			itemDAO.updateDados(item);
			
			if(p.getDataDevolucao()!=null){
				item= (Item)itemDAO.getOne(old.getItem().getIdItem());
				item.setDisponivel(true);
				itemDAO.updateDados(item);
				
				pessoa= (Pessoa)pessoaDAO.getOne(old.getPessoa().getIdPessoa());
				pessoa.setBloqueado(false);
				pessoaDAO.updateDados(pessoa);
			}
			
			
		}else{
			dao.insert(p);
			//Indisponibilizando o novo item
			Item item = (Item)itemDAO.getOne(p.getItem().getIdItem());
			item.setDisponivel(false);
			itemDAO.updateDados(item);
		}
	}else{
		request.setAttribute("erroMsg", "Tipo de item não selecionado! Cadastro não realizado!");
	}
}else{
	request.setAttribute("erroMsg", "Cadastro não realizado por falta do conjunto minimo de paramentros!");
}
%>
<jsp:forward page="index.jsp"></jsp:forward>