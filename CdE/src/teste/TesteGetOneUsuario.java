package teste;

import java.sql.SQLException;

import model.Usuario;
import model.dao.UsuarioDAO;

public class TesteGetOneUsuario{
	
	public static void main() {
		UsuarioDAO o;
		Usuario p; 
		
			try {
				o = new UsuarioDAO();
				
				System.out.println("Busca por ID (idusuario= 4)");
				p = (Usuario)o.getOne(" where idpessoa = 4");
				System.out.println((p));

				System.out.println("Busca por Nome (login="+p.getLogin()+")");
				p = ((Usuario)o.getOne(" where Nome = \'"+p.getLogin()+"\'"));
				System.out.println(p);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
