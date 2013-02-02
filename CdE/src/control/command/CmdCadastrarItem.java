package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Item;
import model.dao.ItemDAO;

public class CmdCadastrarItem implements Command{

	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;

		ItemDAO dao = new ItemDAO();
		Item p = new Item();
		p.setNome(request.getParameter("nome"));
		p.setDescricao(request.getParameter("descricao"));

		int id=0;
		int idTipo = Integer.parseInt(request.getParameter("idTipoDeItem"));

		if(request.getParameter("idItem")!=null && idTipo>0){
			id=Integer.parseInt(request.getParameter("idItem"));
			p.setTipoDeItem(idTipo);

			if(id>0){
				p = (Item) dao.getOne(id);
				p.setNome(request.getParameter("nome"));
				p.setDescricao(request.getParameter("descricao"));
				p.setTipoDeItem(idTipo);
				dao.updateDados(p);
				msg = "Dados de "+p.getNome()+" atualizado!";
			}else{
				dao.insert(p);
				msg = "Dados de "+p.getNome()+" inseridos!";
			}
		}else{
			request.setAttribute("erroMsg", "Tipo de item não selecionado! Cadastro não realizado!");
		}

//			msg =new LogicCadPessoa().execute(pessoa);

		 	new CmdListaItem().execute(request, response);
			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
