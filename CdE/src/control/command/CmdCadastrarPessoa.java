package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pessoa;
import control.logic.LogicCadPessoa;

public class CmdCadPessoa implements Command{

	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg;	
		RequestDispatcher rd;


		if(request.getParameter("Cpf")!=null){

			msg="successo ao carregar a pagina";

			Pessoa pessoa = new Pessoa();	

			pessoa.setNome(request.getParameter("Nome"));			
			pessoa.setEmail(request.getParameter("Email"));
			pessoa.setTelefone(request.getParameter("Telefone"));


			msg =new LogicCadPessoa().execute(pessoa);

			rd= request.getRequestDispatcher("/menuMain.jsp");
			rd.forward(request, response);

		}else{
			
			rd= request.getRequestDispatcher("/formPessoa.jsp");
			rd.forward(request, response);
		}
	}
}
