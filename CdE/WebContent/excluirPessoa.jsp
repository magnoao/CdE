<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
/*
if(request.getParameter("excluirPessoa")!=null){
	System.out.print(request.getParameter("excluirPessoa"));
}
Pessoa p = new Pessoa();
	
	int id=0;
	if(request.getParameter("idPessoa")!=null){
		id=Integer.parseInt(request.getParameter("idPessoa"));
		if(id>0){
			p.setIdPessoa(id);	
			new PessoaDAO().exclui(p);
		}
	}
*/
//request.getRequestDispatcher("/").forward(request, response);
//response.sendRedirect("/CdE");
%>
<jsp:forward page="index.jsp"></jsp:forward>