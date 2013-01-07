<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*, model.dao.*"%>
<%
Item p = new Item();

int id=0;
if(request.getParameter("idItem")!=null){
	id=Integer.parseInt(request.getParameter("idItem"));
	if(id>0){
		p.setIdItem(id);	
		new ItemDAO().exclui(p);
	}
}
%>
<jsp:forward page="index.jsp"></jsp:forward>