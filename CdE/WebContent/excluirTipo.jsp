<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
/*
TipoDeItem p = new TipoDeItem();

int id=0;
if(request.getParameter("idTipoDeItem")!=null){
	id=Integer.parseInt(request.getParameter("idTipoDeItem"));
	if(id>0){
		p.setIdTipoDeItem(id);	
		new TipoDeItemDAO().exclui(p);
	}
}
*/
%>
<jsp:forward page="index.jsp"></jsp:forward>