<%@page import="java.sql.Date"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.*, model.*, model.dao.*"%>
<%
EmprestimoDAO dao = new EmprestimoDAO();
Emprestimo p = new Emprestimo();
String dataDevolucao =request.getParameter("dataDevolucao");
String dataEmprestimo =request.getParameter("dataEmprestimo"); 
String dataPrevistaDevolucao =request.getParameter("dataPrevistaDevolucao");

p.setDataDevolucao(DateFormat.parseSqlDate(dataDevolucao));
p.setDataEmprestimo(DateFormat.parseSqlDate(dataEmprestimo));
p.setDataPrevistaDevolucao(DateFormat.parseSqlDate(dataPrevistaDevolucao));
p.setItem(Integer.parseInt(request.getParameter("idItem")));
p.setPessoa(Integer.parseInt(request.getParameter("idPessoa")));

int id=0;
if(request.getParameter("idEmprestimo")!=null){
	id=Integer.parseInt(request.getParameter("idEmprestimo"));

	if(id>0){
		p.setIdEmprestimo(id);	
		dao.updateDados(p);
	}else{
		dao.insert(p);
	}
}else{
	request.setAttribute("erroMsg", "Tipo de item n�o selecionado! Cadastro n�o realizado!");
}
%>
<jsp:forward page="index.jsp"></jsp:forward>