package control.logic;

public class LogicAtualizarCurso implements Logic{

	public String execute(Object objeto) throws Exception {

		String msg =null ;

//		Curso curso = (Curso)objeto;
				//FacadeCursoDAO.update(curso);
				msg="Modalidade atualizada com sucesso!";
		return msg;
	}
}
