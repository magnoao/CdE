package model;

public class Usuario {
	
	private int idUsuario;
	private String login="";
	private String senha="";
	private String nome="";
	
	public int getIdUsuario() {
		return idUsuario;
	}
	
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	public String getLogin() {
		return login;
	}
	
	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getSenha() {
		return this.senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getNome() {
		return this.nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	@Override
	public String toString() {
		return this.idUsuario+" : "+this.login+"   -   "+this.nome; 
	}
	

}
