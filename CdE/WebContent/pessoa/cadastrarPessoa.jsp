<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
PessoaDAO dao = new PessoaDAO();
Pessoa p = new Pessoa();
p.setNome(request.getParameter("nome"));
p.setTelefone(request.getParameter("telefone"));
p.setEmail(request.getParameter("email"));

int id=0;
if(request.getParameter("idPessoa")!=null){
	id=Integer.parseInt(request.getParameter("idPessoa"));

	if(id>0){
		p.setIdPessoa(id);	
		dao.updateDados(p);
	}else{
		dao.insert(p);
	}
}
response.sendRedirect("/CdE");
%>


