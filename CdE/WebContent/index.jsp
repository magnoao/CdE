<%@page import="javax.mail.Session"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
String login = (String)session.getAttribute("user_log");
String nome = "";
if (login == null) { %>
	<jsp:include page="login.jsp"></jsp:include><% 
}else{
	nome = (String)session.getAttribute("name_log"); %>
	<jsp:include page="corpo.jsp"></jsp:include><%
	}%>


