<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
TipoDeItemDAO dao = new TipoDeItemDAO();
TipoDeItem p = new TipoDeItem();
p.setNome(request.getParameter("nome"));
p.setDescricao(request.getParameter("descricao"));

int id=0;
if(request.getParameter("idTipoDeItem")!=null){
	id=Integer.parseInt(request.getParameter("idTipoDeItem"));

	if(id>0){
		p.setIdTipoDeItem(id);	
		dao.updateDados(p);
	}else{
		dao.insert(p);
	}
}
%>
<jsp:forward page="index.jsp"></jsp:forward>