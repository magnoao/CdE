package util;

import java.sql.SQLException;
import java.util.Vector;

import model.Emprestimo;
import model.Pessoa;
import model.dao.EmprestimoDAO;
import model.dao.PessoaDAO;

public class Ajustes {

	public static void ajustar(){
		ajustarStatusPessoa();
		ajustarStatusItem();
	}
	
	@SuppressWarnings("unchecked")
	private static void ajustarStatusPessoa(){
		try {
			Vector<Emprestimo> emp = (Vector<Emprestimo>) new EmprestimoDAO().getList(" WHERE dataprevistadevolucao < CURDATE() and datadevolucao is null");
			for (int i = 0; i < emp.size(); i++) {
				Pessoa p = (Pessoa)emp.get(i).getPessoa();
				p.setBloqueado(true);
				new PessoaDAO().updateDados(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	private static void ajustarStatusItem(){
		
	}
}
