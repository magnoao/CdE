package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import model.dao.UsuarioDAO;

public class CmdLogin implements Command{
	
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	
		String dispatcher = "/";
		String msg = "";

		UsuarioDAO dao = new UsuarioDAO();

		//recupera os par�metros do request
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		try {
			Usuario user = (Usuario)dao.getOne(" where login='"+login+"' and senha='"+senha+"'");
System.out.println(user);
			if(user != null) {
					//coloca o usu�rio e o n�vel de permiss�o na sess�o
					HttpSession session = request.getSession();
					session.setAttribute("user_log", login);
					session.setAttribute("name_log", user.getNome());
					session.setMaxInactiveInterval(1000*60);// 1 minuto
					response.sendRedirect("/CdE");
			} else {
				dispatcher = "./";
				msg = "Acesso negado!";

			}

		} catch(Exception e) {
			msg = e.getMessage();
			e.printStackTrace();

		}		
		
		request.setAttribute("erroMsg", msg);
		RequestDispatcher rd;
		
		rd = request.getRequestDispatcher(dispatcher);
		rd.forward(request, response);
	}
}
