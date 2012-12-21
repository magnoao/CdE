package teste;

import java.sql.SQLException;

import model.Usuario;
import model.dao.UsuarioDAO;

public class TesteDeletePessoa {
	
	public static void main() {
		UsuarioDAO o;
		Usuario p; 
		
			try {
				o = new UsuarioDAO();
				
				System.out.println("Deletar (login= 'Zé navalha 2')");
				p = (Usuario)o.getOne(" where login= 'Zé navalha 2'");
				o.exclui(p);
				
				TesteListaUsuario.main();

			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
