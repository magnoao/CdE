package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CmdLogin implements Command{
	
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		RequestDispatcher rd;
		request.setAttribute("escopo", "Disciplina");
		
		rd = request.getRequestDispatcher("/disciplinas.jsp");
		rd.forward(request, response);
	}
}
