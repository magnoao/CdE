package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CmdEmprestimo implements Command{

	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;

		//			msg =new LogicNavegar().execute(null);

			new CmdListaEmprestimo().execute(request, response);
			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
