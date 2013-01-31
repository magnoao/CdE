package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.command.Command;

/**
 * Servlet que implementa o Front Controller do Projeto.
 * @author Magno
 *
 */

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
    public Controller(){
        super();
    }

	/**
	 * Metodo responsavel em redirecionar as requisções feitas via post
	 * Para um command especifico que trata e executa um dado comando...
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nameCommand = "control.command.Cmd"+request.getParameter("command");
		System.out.println(nameCommand+" - ");
		Class<?> commandClass;
		try {
			commandClass = Class.forName(nameCommand);
			if(!Command.class.isAssignableFrom(commandClass)){
				System.out.println("Comando indisponível!!!");
			}
			Command actionObjeto = (Command) commandClass.newInstance();
			
			actionObjeto.execute(request, response);
			
			System.out.println("nome da classe: "+commandClass.getSimpleName());

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.print(" O comando nao foi executado! ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("Command: "+request.getParameter("command"));
	}

}
