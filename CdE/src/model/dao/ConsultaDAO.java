package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


public class ConsultaDAO extends DAO {
	
	public ConsultaDAO() throws SQLException {
		super();
	}

	@Override
	public void exclui(Object o) throws SQLException {}
	
	@Override
	public Vector<?> getList(String queryComplementar)throws SQLException {
		return objetos;
	}
	
	@Override
	public Object getOne(String queryComplementar) throws SQLException {
		return new Object();
	}
	
	@Override
	public void insert(Object o) throws SQLException {	}	
	
	@Override
	public void updateDados(Object o) throws SQLException {
	}
	
	@SuppressWarnings("unused")
	private final Vector<?> getListPorCampo(String field, String value) throws SQLException {
		return objetos;
	}
	
	public final int get(String query, String complemento) throws SQLException{
		PreparedStatement stmt = this.connection.prepareStatement(query);

		ResultSet rs = stmt.executeQuery();
		int resultado = 0;
		while (rs.next()) {
			resultado = rs.getInt(complemento);
		}
		return resultado;
	}

}
