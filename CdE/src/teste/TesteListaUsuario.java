package teste;

import java.sql.SQLException;
import java.util.Vector;

import model.Usuario;
import model.dao.UsuarioDAO;

public class TesteListaUsuario {
	
	public static void main() {
		UsuarioDAO o;
		
		
		try {
			o = new UsuarioDAO();
			@SuppressWarnings("unchecked")
			Vector<Usuario> v = (Vector<Usuario>) o.getList();
			
			System.err.println("Lista de Participantes:");
			for (int i = 0; i < v.size(); i++) {
				System.err.println(v.get(i));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
