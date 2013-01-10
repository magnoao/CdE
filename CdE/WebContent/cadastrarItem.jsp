<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
ItemDAO dao = new ItemDAO();
Item p = new Item();
p.setNome(request.getParameter("nome"));
p.setDescricao(request.getParameter("descricao"));

int id=0;
int idTipo = Integer.parseInt(request.getParameter("idTipoDeItem"));

if(request.getParameter("idItem")!=null && idTipo>0){
	id=Integer.parseInt(request.getParameter("idItem"));
	p.setTipoDeItem(idTipo);

	if(id>0){
		p.setIdItem(id);	
		dao.updateDados(p);
	}else{
		dao.insert(p);
	}
}else{
	request.setAttribute("erroMsg", "Tipo de item não selecionado! Cadastro não realizado!");
}
%>
<jsp:forward page="index.jsp"></jsp:forward>
