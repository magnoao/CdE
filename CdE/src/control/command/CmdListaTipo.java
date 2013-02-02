package control.command;

import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TipoDeItem;
import model.dao.TipoDeItemDAO;

public class CmdListaTipo implements Command{

	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;
		Vector<TipoDeItem> vet;
		String tituloLista = "";

		if(request.getParameter("subMenuAtualFiltro")!=null && request.getParameter("subMenuAtualFiltro").equals("listaTipoDeletado")){
			// TODO Auto-generated catch block
			vet = null;
		}else{
			tituloLista = "Lista de Tipos";
			vet =  (Vector<TipoDeItem>)new TipoDeItemDAO().getList();
		}
		
		request.setAttribute("listaDeTipos", vet);
		request.setAttribute("titulo", tituloLista);
		
		//			msg =new LogicListaTipo().execute(null);

			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
