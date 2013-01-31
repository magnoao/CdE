package control.logic;


public class LogicCadPessoa implements Logic{

	public String execute(Object objeto) throws Exception {

		String msg =null ;

		/*Curso curso = (Curso)objeto;
		if(!curso.getNome().equals("") && curso.getCHOTotal()>0){
			if(FacadeCursoDAO.getOne(curso.getNome(), curso.getIdModalidade()).getNome().equals("")){
				FacadeCursoDAO.insert(curso);
				msg="Modalidade cadastrada com sucesso!";	
			}else{
				msg="Já existe uma disciplina cadastrada com esse nome!";
			}
		}else{
			msg = "Todos os dados devem ser preenchidos!";
		}
		*/
		return msg;
	}
}
