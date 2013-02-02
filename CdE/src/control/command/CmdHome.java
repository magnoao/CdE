package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ConsultaDAO;
import util.Ajustes;

public class CmdHome implements Command{

	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;
		
		
		Ajustes.ajustar();
		int numPessoas=0, numPessoasBloqueadas=0, numItem=0, numPessoacomObjeto=0,numObjetosEmprestados=0,numObjetosAtrazados=0;
		ConsultaDAO dao = new ConsultaDAO();

		numPessoas = dao.get("SELECT count(*) pessoas FROM tbpessoa;","pessoas");
		numPessoasBloqueadas=dao.get("SELECT count(*) as bloqueados FROM tbpessoa where bloqueado =1;","bloqueados");
		numItem=dao.get("SELECT count(*) itens FROM tbitem;","itens");
		numObjetosAtrazados=dao.get("SELECT count(*) as numObjetosAtrazados FROM viewitensatrasados;","numObjetosAtrazados");
		numObjetosEmprestados=dao.get("SELECT count(*) as numObjetosEmprestados FROM viewemprestados;","numObjetosEmprestados");
		numPessoacomObjeto=dao.get("SELECT count(*) as totalpessoas FROM viewdevedores;","totalpessoas");

		request.setAttribute("numPessoas",numPessoas);
		request.setAttribute("numPessoasBloqueadas",numPessoasBloqueadas);
		request.setAttribute("numItem", numItem);
		request.setAttribute("numObjetosAtrazados", numObjetosAtrazados);
		request.setAttribute("numObjetosEmprestados", numObjetosEmprestados);
		request.setAttribute("numPessoacomObjeto", numPessoacomObjeto);
		

		//			msg =new LogicNavegar().execute(null);
		
			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
