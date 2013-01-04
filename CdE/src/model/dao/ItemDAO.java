package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import model.Item;


public class ItemDAO extends DAO {
	private Item objeto;
	
	
	public ItemDAO() throws SQLException {
		super();
		this.setId("iditem");
		table = "tbitem";
		select = "SELECT * FROM "+table;
		delete = "DELETE FROM "+table+ " WHERE "+getId()+"=";
	}

	@Override
	public void exclui(Object o) throws SQLException {
		objeto  = (Item)o;
		String sql = delete+objeto.getIdItem();
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
		Vector<Item> objetos = new Vector<Item>();
		while (rs.next()) {
			objeto = new Item();
			objeto.setIdItem(Integer.parseInt(rs.getString(getId())));
			objeto.setDescricao(rs.getString("descricao"));
			objeto.setNome(rs.getString("nome"));
			objeto.setDisponivel(rs.getBoolean("disponivel"));
			objeto.setTipoDeItem(rs.getInt("idtipodeitem"));
			
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

		objeto = new Item();
		rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			objeto.setIdItem(Integer.parseInt(rs.getString(getId())));
			objeto.setDescricao(rs.getString("descricao"));
			objeto.setNome(rs.getString("nome"));
			objeto.setDisponivel(rs.getBoolean("disponivel"));
			objeto.setTipoDeItem(rs.getInt("idtipodeitem"));
			
			rs.close();
			stmt.close();
		}
		
		return objeto;
	}
	
	@Override
	public void insert(Object o) throws SQLException {
		// prepared statement para inserção
		objeto = (Item)o;
		String sql = "INSERT INTO "+table+" (nome, descricao, disponivel, idtipodeitem) VALUES (?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getNome());
		stmt.setString(2,objeto.getDescricao());
		stmt.setBoolean(3,objeto.isDisponivel());
		stmt.setInt(4,objeto.getTipoDeItem().getIdTipoDeItem());
		// executa os query criado...
		stmt.execute();
		stmt.close();
	}
	
	@Override
	public void updateDados(Object o) throws SQLException {
		objeto = (Item)o;
		String sql = "UPDATE "+table+" set nome=?, descricao=?, disponivel=?, idtipodeitem=?  WHERE "+getId()+" ="+objeto.getIdItem();
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		// seta os valores...
		stmt.setString(1,objeto.getNome());
		stmt.setString(2,objeto.getDescricao());
		stmt.setBoolean(3,objeto.isDisponivel());
		stmt.setInt(4,objeto.getTipoDeItem().getIdTipoDeItem());
		
						
		// executa os query criado...
		stmt.executeUpdate();
		stmt.close();
	}
	
}
