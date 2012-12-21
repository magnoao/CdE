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
		//objeto = (Escolaridade) this.getOne(objeto.getIdEscolaridade());
		String sql = delete+objeto.getIdUsuario();
		PreparedStatement stmt = connection.prepareStatement(sql);
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}
	
	@Override
	public Vector<?> getList(String queryComplementar)
			throws SQLException {
		String sql = "select idescolaridade, nome from tbescolaridade";
		PreparedStatement stmt = this.connection.prepareStatement(sql);

		ResultSet rs = stmt.executeQuery();
		Vector<Object> objetos = new Vector<Object>();
		while (rs.next()) {
			//comum a pessoa...
			//Começa aqui...
			objeto = new Usuario();
			objeto.setIdUsuario(Integer.parseInt(rs.getString(getId())));
			objeto.setLogin(rs.getString("login"));
			objeto.setSenha(rs.getString("senha"));
			
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

		System.out.println(sql);
		
		objeto = new Usuario();
		rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			//comum a pessoa...
			//Começa aqui...
			objeto.setIdUsuario(Integer.parseInt(rs.getString(getId())));
			objeto.setLogin(rs.getString("login"));
			objeto.setSenha(rs.getString("senha"));
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
		String sql = "INSERT INTO "+table+" (login, senha) VALUES (?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getLogin());
		stmt.setString(2,objeto.getSenha());
		
		// executa os query criado...
		stmt.execute();
		stmt.close();
	}
	
	@Override
	public void updateDados(Object o) throws SQLException {
		String sql = "UPDATE "+table+" set login=?, senha=?  WHERE "+getId()+" ="+objeto.getIdUsuario();
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getLogin());
		stmt.setString(2,objeto.getSenha());
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}
	
	/**
	 * Metodo para listar com like...
	 */
	public final Vector<?> getListPorCampo(String field, String value) throws SQLException {
		String queryComplementar = " where " + field + " LIKE '" + value + "%'"; 
		objetos=this.getList(queryComplementar);
		return objetos;
	}

}
