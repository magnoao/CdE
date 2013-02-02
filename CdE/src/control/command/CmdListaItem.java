package control.command;

import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Item;
import model.dao.ItemDAO;

public class CmdListaItem implements Command{

	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;
		Vector<Item> vet;
		String tituloLista = "";

		if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaItensDisponiveis")){
			vet = (Vector<Item>)new ItemDAO().getList("disponivel",1);
			tituloLista = "Lista de itens disponiveis";
		}else if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaItensBloqueados")){
			vet = (Vector<Item>)new ItemDAO().getList("disponivel",0);
			tituloLista = "Lista de itens indisponiveis";
		}else{
			tituloLista = "Lista de itens";
			vet = (Vector<Item>)new ItemDAO().getList();
		}

								
		request.setAttribute("listaDeItens", vet);
		request.setAttribute("titulo", tituloLista);
		
		//			msg =new LogicListaItem().execute(null);

			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
