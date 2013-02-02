package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pessoa;
import model.dao.PessoaDAO;

public class CmdCadastrarPessoa implements Command{

	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;

		PessoaDAO dao = new PessoaDAO();
		Pessoa p = new Pessoa();
		p.setNome(request.getParameter("nome"));
		p.setTelefone(request.getParameter("telefone"));
		p.setEmail(request.getParameter("email"));

		int id=0;
		if(request.getParameter("idPessoa")!=null){
			id=Integer.parseInt(request.getParameter("idPessoa"));

			if(id>0){
				p.setIdPessoa(id);	
				dao.updateDados(p);
				msg = "Dados de "+p.getNome()+" atualizado!";
			}else{
				dao.insert(p);
				msg = "Dados de "+p.getNome()+" inseridos!";
			}
		}



//			msg =new LogicCadPessoa().execute(pessoa);

			new CmdListaPessoa().execute(request, response);
			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
