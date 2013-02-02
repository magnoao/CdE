package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TipoDeItem;
import model.dao.TipoDeItemDAO;

public class CmdCadastrarTipo implements Command{

	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;

		TipoDeItemDAO dao = new TipoDeItemDAO();
		TipoDeItem p = new TipoDeItem();
		p.setNome(request.getParameter("nome"));
		p.setDescricao(request.getParameter("descricao"));

		int id=0;
		if(request.getParameter("idTipoDeItem")!=null){
			id=Integer.parseInt(request.getParameter("idTipoDeItem"));

			if(id>0){
				p.setIdTipoDeItem(id);	
				dao.updateDados(p);
				msg = "Dados de "+p.getNome()+" atualizado!";
			}else{
				dao.insert(p);
				msg = "Dados de "+p.getNome()+" inseridos!";
			}		
		
//			msg =new LogicCadItem().execute(p);

			new CmdListaTipo().execute(request, response);
			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
		}
	}
}
