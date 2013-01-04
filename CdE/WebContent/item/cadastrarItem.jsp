<jsp:include page="../header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
ItemDAO dao = new ItemDAO();
Item p = new Item();
p.setNome(request.getParameter("nome"));
p.setDescricao(request.getParameter("descricao"));
//p.setDisponivel(request.getParameter("disponivel"));
p.setTipoDeItem(Integer.parseInt(request.getParameter("idTipoDeItem")));

int id=0;
if(request.getParameter("idItem")!=null){
	id=Integer.parseInt(request.getParameter("idItem"));

	if(id>0){
		p.setIdItem(id);	
		dao.updateDados(p);
	}else{
		dao.insert(p);
	}
}
response.sendRedirect("/CdE");
%>

