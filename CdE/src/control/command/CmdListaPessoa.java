package control.command;

import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pessoa;
import model.dao.PessoaDAO;

public class CmdListaPessoa implements Command{

	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;
		Vector<Pessoa> vet;
		String tituloLista = "";

		if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaPessoaComItens")){
			vet = (Vector<Pessoa>)new PessoaDAO().getList(" WHERE idpessoa in (SELECT * FROM viewdevedores);");
			tituloLista = "Lista de Pessoas com meus itens";
		}else if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaPessoaBloqueada")){
			vet = (Vector<Pessoa>)new PessoaDAO().getList("bloqueado",1);
			tituloLista = "Lista de Pessoas bloqueadas";
		}else{
			tituloLista = "Lista de Pessoas";
			vet = (Vector<Pessoa>)new PessoaDAO().getList();
		}
		
		request.setAttribute("listaDePessoas", vet);
		request.setAttribute("titulo", tituloLista);
		
		//			msg =new LogicNavegar().execute(null);

			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
