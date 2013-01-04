package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import model.Usuario;


public class UsuarioDAO extends DAO {
	private Usuario objeto;
	
	public UsuarioDAO() throws SQLException {
		super();
		this.setId("idusuario");
		table = "tbUsuario";
		select = "SELECT * FROM "+table;
		delete = "DELETE FROM "+table+ " WHERE "+getId()+"=";
	}

	@Override
	public void exclui(Object o) throws SQLException {
		objeto  = (Usuario)o;
		String sql = delete+objeto.getIdUsuario();
		PreparedStatement stmt = connection.prepareStatement(sql);
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}
	
	@Override
	public Vector<?> getList(String queryComplementar)
			throws SQLException {
		PreparedStatement stmt = this.connection.prepareStatement(queryComplementar);

		ResultSet rs = stmt.executeQuery();
		Vector<Usuario> objetos = new Vector<Usuario>();
		while (rs.next()) {
			objeto = new Usuario();
			objeto.setIdUsuario(Integer.parseInt(rs.getString(getId())));
			objeto.setLogin(rs.getString("login"));
			objeto.setSenha(rs.getString("senha"));
			objeto.setNome(rs.getString("nome"));
			//termina aqui...
			
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

		objeto = new Usuario();
		rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			objeto.setIdUsuario(Integer.parseInt(rs.getString(getId())));
			objeto.setLogin(rs.getString("login"));
			objeto.setSenha(rs.getString("senha"));
			objeto.setNome(rs.getString("nome"));
			
			
			//termina aqui...
			rs.close();
			stmt.close();
		}
		
		return objeto;
	}
	
	@Override
	public void insert(Object o) throws SQLException {
		// prepared statement para inserção
		objeto = (Usuario)o;
		String sql = "INSERT INTO "+table+" (login, senha, nome) VALUES (?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getLogin());
		stmt.setString(2,objeto.getSenha());
		stmt.setString(3,objeto.getNome());
		
		// executa os query criado...
		stmt.execute();
		stmt.close();
	}
	
	@Override
	public void updateDados(Object o) throws SQLException {
		objeto = (Usuario)o;
		String sql = "UPDATE "+table+" set login=?, senha=?, nome=?  WHERE "+getId()+" ="+objeto.getIdUsuario();
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getLogin());
		stmt.setString(2,objeto.getSenha());
		stmt.setString(3,objeto.getNome());
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}

}
