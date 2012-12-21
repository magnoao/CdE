package teste;

import java.sql.SQLException;

import model.Usuario;
import model.dao.UsuarioDAO;

public class TesteInsertUsuario{
	
	public static void main() {
		UsuarioDAO o;
		Usuario p = new Usuario();
		p.setLogin("Zé navalha 2");
		//p.setEscolaridade(1);
		
			try {
				o = new UsuarioDAO();
				o.insert(p);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
