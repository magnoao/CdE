<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
/*
Emprestimo p = new Emprestimo();

int id=0;
if(request.getParameter("idEmprestimo")!=null){
	id=Integer.parseInt(request.getParameter("idEmprestimo"));
	if(id>0){
		p.setIdEmprestimo(id);	
		new EmprestimoDAO().exclui(p);
	}
}
*/
%>
<jsp:forward page="index.jsp"></jsp:forward>