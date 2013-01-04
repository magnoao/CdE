<%@page import="java.sql.Date"%>
<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
EmprestimoDAO dao = new EmprestimoDAO();
Emprestimo p = new Emprestimo();
p.setDataDevolucao(Date.valueOf(request.getParameter("dataDevolucao")));
p.setDataEmprestimo(Date.valueOf(request.getParameter("dataEmprestimo")));
p.setDataPrevistaDevolucao(Date.valueOf(request.getParameter("dataPrevistaDevolucao")));
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
}
response.sendRedirect("/CdE");
%>
