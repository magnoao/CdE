package teste;

import java.sql.SQLException;
import java.util.Random;

import model.Usuario;
import model.dao.UsuarioDAO;

public class TesteUpdateUsuario {
	
	public static void main() {
		UsuarioDAO o;
		Usuario p; 
		
			try {
				o = new UsuarioDAO();
				
				System.out.println("Alterar (idusuario=4)");
				p = (Usuario)o.getOne(" where idusuario=4");
				System.out.println("Antes de atualizar: \n"+p);
				
				p.setLogin("Outro Nome Estranho "+new Random().nextInt());
				
				o.updateDados(p);
				System.out.println("Depois de atualizar: \n"+p);
				
				TesteListaUsuario.main();

			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
