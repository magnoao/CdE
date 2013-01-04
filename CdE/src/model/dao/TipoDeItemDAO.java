package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import model.TipoDeItem;


public class TipoDeItemDAO extends DAO {
	private TipoDeItem objeto;
	
	
	public TipoDeItemDAO() throws SQLException {
		super();
		this.setId("idtipodeitem");
		table = "tbtipodeitem";
		select = "SELECT * FROM "+table;
		delete = "DELETE FROM "+table+ " WHERE "+getId()+"=";
	}

	@Override
	public void exclui(Object o) throws SQLException {
		objeto  = (TipoDeItem)o;
		String sql = delete+objeto.getIdTipoDeItem();
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
		Vector<TipoDeItem> objetos = new Vector<TipoDeItem>();
		while (rs.next()) {
			objeto = new TipoDeItem();
			objeto.setIdTipoDeItem(Integer.parseInt(rs.getString(getId())));
			objeto.setDescricao(rs.getString("descricao"));
			objeto.setNome(rs.getString("nome"));
			
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

		objeto = new TipoDeItem();
		rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			objeto.setIdTipoDeItem(Integer.parseInt(rs.getString(getId())));
			objeto.setDescricao(rs.getString("descricao"));
			objeto.setNome(rs.getString("nome"));
			
			rs.close();
			stmt.close();
		}
		
		return objeto;
	}
	
	@Override
	public void insert(Object o) throws SQLException {
		// prepared statement para inserção
		objeto = (TipoDeItem)o;
		String sql = "INSERT INTO "+table+" (nome, descricao) VALUES (?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getNome());
		stmt.setString(2,objeto.getDescricao());
		// executa os query criado...
		stmt.execute();
		stmt.close();
	}
	
	@Override
	public void updateDados(Object o) throws SQLException {
		objeto = (TipoDeItem)o;
		String sql = "UPDATE "+table+" set nome=?, descricao=?  WHERE "+getId()+" ="+objeto.getIdTipoDeItem();
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getNome());
		stmt.setString(2,objeto.getDescricao());
		
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}
	
}
