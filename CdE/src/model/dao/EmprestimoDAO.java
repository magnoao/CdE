package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import model.Emprestimo;


public class EmprestimoDAO extends DAO {
	private Emprestimo objeto;
	
	public EmprestimoDAO() throws SQLException {
		super();
		this.setId("idemprestimo");
		table = "tbemprestimo";
		select = "SELECT * FROM "+table;
		delete = "DELETE FROM "+table+ " WHERE "+getId()+"=";
	}

	@Override
	public void exclui(Object o) throws SQLException {
		objeto  = (Emprestimo)o;
		String sql = delete+objeto.getIdEmprestimo();
		PreparedStatement stmt = connection.prepareStatement(sql);
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}
	
	@Override
	public Vector<?> getList(String queryComplementar)
			throws SQLException {
		PreparedStatement stmt = this.connection.prepareStatement(select+queryComplementar);

		ResultSet rs = stmt.executeQuery();
		Vector<Emprestimo> objetos = new Vector<Emprestimo>();
		while (rs.next()) {
			objeto = new Emprestimo();
			objeto.setIdEmprestimo(Integer.parseInt(rs.getString(getId())));
			objeto.setDataDevolucao(rs.getDate("dataDevolucao"));
			objeto.setDataEmprestimo(rs.getDate("dataEmprestimo"));
			objeto.setDataPrevistaDevolucao(rs.getDate("dataPrevistaDevolucao"));
			objeto.setItem(rs.getInt("iditem"));
			objeto.setPessoa(rs.getInt("idpessoa"));
			
		objetos.add(objeto);
		}
		
		rs.close();
		stmt.close();
		return objetos;
	}
	
	@Override
	public Object getOne(String queryComplementar) throws SQLException {
		String sql =select+queryComplementar;
		PreparedStatement stmt = connection.prepareStatement(sql);

		objeto = new Emprestimo();
		rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			objeto.setIdEmprestimo(Integer.parseInt(rs.getString(getId())));
			objeto.setDataDevolucao(rs.getDate("dataDevolucao"));
			objeto.setDataEmprestimo(rs.getDate("dataEmprestimo"));
			objeto.setDataPrevistaDevolucao(rs.getDate("dataPrevistaDevolucao"));
			objeto.setItem(rs.getInt("iditem"));
			objeto.setPessoa(rs.getInt("idpessoa"));
			
			rs.close();
			stmt.close();
		}
		
		return objeto;
	}
	
	@Override
	public void insert(Object o) throws SQLException {
		// prepared statement para inserção
		objeto = (Emprestimo)o;
		String sql = "INSERT INTO "+table+" (dataemprestimo, dataprevistadevolucao, datadevolucao, idpessoa, iditem) VALUES (?,?,?,?,?)";
		
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setDate(1,objeto.getDataEmprestimo());
		stmt.setDate(2,objeto.getDataPrevistaDevolucao());
		stmt.setDate(3,objeto.getDataDevolucao());
		stmt.setInt(4,objeto.getPessoa().getIdPessoa());
		stmt.setInt(5,objeto.getItem().getIdItem());
		
		// executa os query criado...
		stmt.execute();
		stmt.close();
	}
	
	@Override
	public void updateDados(Object o) throws SQLException {
		objeto = (Emprestimo)o;
		String sql = "UPDATE "+table+" set dataemprestimo=?, dataprevistadevolucao=?, datadevolucao=?, idpessoa=?, iditem=?  WHERE "+getId()+" ="+objeto.getIdEmprestimo();
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setDate(1,objeto.getDataEmprestimo());
		stmt.setDate(2,objeto.getDataPrevistaDevolucao());
		stmt.setDate(3,objeto.getDataDevolucao());
		stmt.setInt(4,objeto.getPessoa().getIdPessoa());
		stmt.setInt(5,objeto.getItem().getIdItem());
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}
	
}
