<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
if(request.getParameter("menuAtual")==null){%>
	<jsp:forward page="pageNotFound.jsp"></jsp:forward>
<%}%>
