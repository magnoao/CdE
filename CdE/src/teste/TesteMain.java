package teste;

public class TesteMain {
	
	public static void main(String[] args) {
		//Pessoa
		System.out.println("Teste para pessoa:");
		System.out.println("\n\n- Inserindo nova pessoa");
		TesteInsertUsuario.main();
		System.out.println("\n\n- Listando pessoas");
		TesteListaUsuario.main();
		System.out.println("\n\n- Pegando um registro do banco");
		TesteGetOneUsuario.main();
		System.out.println("\n\n- Pegando um registro do banco e atualizando");
		TesteUpdateUsuario.main();
		System.out.println("\n\n- Deletando um registro");
		
	}

}
