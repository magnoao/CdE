<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String login = (String)session.getAttribute("user_log");
String nome = "";
if (login == null) { //n�o tem sess�o
%> <jsp:forward page="index.jsp" /><% 
}else {
	nome = (String)session.getAttribute("name_log");
}	
%>

