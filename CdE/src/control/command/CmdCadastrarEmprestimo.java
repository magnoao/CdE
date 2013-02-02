package control.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Emprestimo;
import model.Item;
import model.Pessoa;
import model.dao.EmprestimoDAO;
import model.dao.ItemDAO;
import model.dao.PessoaDAO;
import util.DateFormat;

public class CmdCadastrarEmprestimo implements Command{

	public void execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		String msg = "";	
		RequestDispatcher rd;

		EmprestimoDAO dao = new EmprestimoDAO();
		ItemDAO itemDAO;
		PessoaDAO pessoaDAO;
		Emprestimo p = new Emprestimo();
		String dataDevolucao =request.getParameter("dataDevolucao");
		String dataEmprestimo =request.getParameter("dataEmprestimo"); 
		String dataPrevistaDevolucao =request.getParameter("dataPrevistaDevolucao");

		try{
		p.setDataDevolucao(DateFormat.parseSqlDate(dataDevolucao));
		p.setDataEmprestimo(DateFormat.parseSqlDate(dataEmprestimo));
		p.setDataPrevistaDevolucao(DateFormat.parseSqlDate(dataPrevistaDevolucao));
		p.setItem(Integer.parseInt(request.getParameter("idItem")));
		p.setPessoa(Integer.parseInt(request.getParameter("idPessoa")));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(p.getDataEmprestimo()!=null && p.getDataPrevistaDevolucao()!=null && p.getItem()!=null && p.getPessoa()!=null){
			int id=0;
			if(request.getParameter("idEmprestimo")!=null){
				id=Integer.parseInt(request.getParameter("idEmprestimo"));
				itemDAO = new ItemDAO();
				pessoaDAO = new PessoaDAO();
				
				if(id>0){
					
					Emprestimo old = (Emprestimo) dao.getOne(id);
					//Disponibilizando o antigo item
					Item item= (Item)itemDAO.getOne(old.getItem().getIdItem());
					Pessoa pessoa= (Pessoa)pessoaDAO.getOne(old.getPessoa().getIdPessoa());
					item.setDisponivel(true);
					itemDAO.updateDados(item);
					
					
					p.setIdEmprestimo(id);	
					dao.updateDados(p);
					//Indisponibilizando o novo item
					item = (Item)itemDAO.getOne(p.getItem().getIdItem());
					item.setDisponivel(false);
					itemDAO.updateDados(item);
					msg = "Dados do emprestimo do item"+p.getItem().getNome()+" atualizado!";
					
					if(p.getDataDevolucao()!=null){
						item= (Item)itemDAO.getOne(old.getItem().getIdItem());
						item.setDisponivel(true);
						itemDAO.updateDados(item);
						
						pessoa= (Pessoa)pessoaDAO.getOne(old.getPessoa().getIdPessoa());
						pessoa.setBloqueado(false);
						pessoaDAO.updateDados(pessoa);
					}
					
					
				}else{
					dao.insert(p);
					//Indisponibilizando o novo item
					Item item = (Item)itemDAO.getOne(p.getItem().getIdItem());
					item.setDisponivel(false);
					itemDAO.updateDados(item);
					msg = "Dados do emprestimo do item "+p.getItem().getNome()+" inseridos!";
				}
			}else{
				request.setAttribute("erroMsg", "Tipo de item não selecionado! Cadastro não realizado!");
			}
		}else{
			request.setAttribute("erroMsg", "Cadastro não realizado por falta do conjunto minimo de paramentros!");
		}
		

//			msg =new LogicCadPessoa().execute(pessoa);
			
			new CmdListaEmprestimo().execute(request, response);
			request.setAttribute("erroMsg", msg);
			rd= request.getRequestDispatcher("/");
			rd.forward(request, response);
	}
}
