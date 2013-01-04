<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.*, model.*, model.dao.*"%>

<% 
//pegando as informações vindas do formulário
String login = request.getParameter("login");
String senha = request.getParameter("senha");
boolean login_ok = false;
String nome = "";
UsuarioDAO dao;
Usuario user;

    try {  
    	dao = new UsuarioDAO();
		user = (Usuario)dao.getOne(" where login='"+login+"' and senha='"+senha+"'");	
		if (user.getLogin()!=null) {
				login_ok = true;
				nome = user.getNome();
			}
    } catch (SQLException e) {  
       out.println("Não foi possível conectar ao banco" + e.getMessage());  
    }  
    
if (!login_ok){
	request.setAttribute("erro", "1"); /* erro é o nome da variável que estou criando
										  1 é o valor dela
										 */
%>
<jsp:forward page="login.jsp" /> 
<% } else {
	//criar sessao, redirecionar para a página de logados
	session.setAttribute("user_log", login);
	session.setAttribute("name_log", nome);
	session.setMaxInactiveInterval(1000*60);// 1 minuto
	response.sendRedirect("/CdE");
} %>  
