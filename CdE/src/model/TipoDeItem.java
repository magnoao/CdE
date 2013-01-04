package model;

public class TipoDeItem {
	private int idTipoDeItem;
	private String nome="";
	private String descricao="";
	
	public int getIdTipoDeItem() {
		return idTipoDeItem;
	}
	public void setIdTipoDeItem(int idTipoDeItem) {
		this.idTipoDeItem = idTipoDeItem;
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
	
}
