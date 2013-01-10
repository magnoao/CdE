package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import model.Pessoa;

public class PessoaDAO extends DAO {
	private Pessoa objeto;
	
	public PessoaDAO() throws SQLException {
		super();
		this.setId("idpessoa");
		table = "tbpessoa";
		select = "SELECT * FROM "+table;
		delete = "DELETE FROM "+table+ " WHERE "+getId()+"=";
	}

	@Override
	public void exclui(Object o) throws SQLException {
		objeto  = (Pessoa)o;
		String sql = delete+objeto.getIdPessoa();
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
		Vector<Pessoa> objetos = new Vector<Pessoa>();
		while (rs.next()) {
			objeto = new Pessoa();
			objeto.setIdPessoa(Integer.parseInt(rs.getString(getId())));
			objeto.setEmail(rs.getString("email"));
			objeto.setTelefone(rs.getString("telefone"));
			objeto.setNome(rs.getString("nome"));
			objeto.setBloqueado(rs.getBoolean("bloqueado"));
			
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

		objeto = new Pessoa();
		rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			objeto.setIdPessoa(Integer.parseInt(rs.getString(getId())));
			objeto.setEmail(rs.getString("email"));
			objeto.setTelefone(rs.getString("telefone"));
			objeto.setNome(rs.getString("nome"));
			objeto.setBloqueado(rs.getBoolean("bloqueado"));
		
			rs.close();
			stmt.close();
		}
		
		return objeto;
	}
	
	@Override
	public void insert(Object o) throws SQLException {
		// prepared statement para inserção
		objeto = (Pessoa)o;
		String sql = "INSERT INTO "+table+" (telefone, email, nome, bloqueado) VALUES (?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getTelefone());
		stmt.setString(2,objeto.getEmail());
		stmt.setString(3,objeto.getNome());
		stmt.setBoolean(4,objeto.isBloqueado());
		
		// executa os query criado...
		stmt.execute();
		stmt.close();
	}
	
	@Override
	public void updateDados(Object o) throws SQLException {
		objeto = (Pessoa)o;
		String sql = "UPDATE "+table+" set email=?, telefone=?, nome=?, bloqueado=?  WHERE "+getId()+" ="+objeto.getIdPessoa();
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getEmail());
		stmt.setString(2,objeto.getTelefone());
		stmt.setString(3,objeto.getNome());
		stmt.setBoolean(4,objeto.isBloqueado());
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}

}
