package model;

import java.sql.SQLException;

import model.dao.TipoDeItemDAO;

public class Item {
	private int idItem =0;
	private String nome="";
	private String descricao="";
	private boolean disponivel;
	private TipoDeItem tipoDeItem;
	
	public int getIdItem() {
		return idItem;
	}
	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public boolean isDisponivel() {
		return disponivel;
	}
	public void setDisponivel(boolean disponivel) {
		this.disponivel = disponivel;
	}
	public TipoDeItem getTipoDeItem() {
		return tipoDeItem;
	}
	public void setTipoDeItem(TipoDeItem tipoDeItem) {
		this.tipoDeItem = tipoDeItem;
	}
	public void setTipoDeItem(int tipoDeItem) {
		try {
			this.tipoDeItem = (TipoDeItem)new TipoDeItemDAO().getOne(tipoDeItem);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	

}
