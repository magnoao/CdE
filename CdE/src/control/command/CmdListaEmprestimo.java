package control.command;

import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Emprestimo;
import model.dao.EmprestimoDAO;

public class CmdListaEmprestimo implements Command{

	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;
		Vector<Emprestimo> vet;
		String tituloLista = "";

		
		if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaPessoaComItens")){
			vet = (Vector<Emprestimo>) new EmprestimoDAO().getList(" WHERE dataprevistadevolucao < CURDATE() and datadevolucao is null");
			tituloLista = "Lista de emprestimos atrasados";
		}else if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaEmprestimo")){
			vet = (Vector<Emprestimo>) new EmprestimoDAO().getList(" WHERE datadevolucao is null");
			tituloLista = "Lista de emprestimos em aberto";
		}else{
			tituloLista = "Lista de emprestimos";
			vet = (Vector<Emprestimo>) new EmprestimoDAO().getList();
		}
		
		
		request.setAttribute("listaDeEmprestimos", vet);
		request.setAttribute("titulo", tituloLista);
		
		//			msg =new LogicListaEmprestimo().execute(null);

			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
