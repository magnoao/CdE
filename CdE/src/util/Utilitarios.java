package util;

import java.util.Calendar;

public class Utilitarios {

	private Utilitarios() {}

	/**
	 * M�todo est�tico para retornar um int[] com o ano<br>atual e os anteriores at� o ano de 2010
	 * 
	 * @return
	 */
	public static int[] getListAno() {
		int anoAtual = Calendar.getInstance().get(Calendar.YEAR);

		int[] listAno = new int[(anoAtual+1)-2010];

		for(int i = 0; i < listAno.length; i++) {
			listAno[i] = anoAtual-i;
		}

		return listAno;
	}

	/**
	 * M�todo est�tico para retornar o nome do m�s por extenso
	 * 
	 * @param mes
	 * @return
	 */
	public static String getMes(int mes) {
		String[] meses = {"Janeiro", "Fevereiro", "Mar�o", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};
		return meses[mes-1];
	}

	/**
	 * M�todo est�tico para retornar o �ltimo dia do m�s de determinado ano
	 * 
	 * @param mes
	 * @param ano
	 * @return
	 */
	public static int getLastDay(int mes, int ano) {
		int[] lastDay = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

		//se o ao for bissexto
		if(ano%4 == 0)
			lastDay[1] = 29;

		return lastDay[mes-1];
	}

	/**
	 * M�todo est�tico para adicionar '/' antes de caracteres especiais como: (, ), ', ", etc
	 * 
	 * @param arg0
	 * @return
	 */
	public static String addSlashes(String arg0) {
		String s = "";
		char[] chars = arg0.toCharArray();

		for(char c : chars) {
			switch (c) {
			case '(':
				s = s.concat("/" + c);
				break;

			case ')':
				s = s.concat("/" + c);
				break;

			case '\'':
				s = s.concat("/" + c);
				break;

			case '\\':
				s = s.concat("/" + c);
				break;

			case '\"':
				s = s.concat("/" + c);
				break;

			case '-':
				s = s.concat("/" + c);
				break;

			case '=':
				s = s.concat("/" + c);
				break;

			default:
				s = s.concat(String.valueOf(c));
				break;
			}
		}

		return s;
	}

	/**
	 * M�todo est�tico para retirar '/' antes de caracteres especiais como: /(, /), /', /", etc
	 * 
	 * @param arg0
	 * @return
	 */
	public static String stripSlashes(String arg0) {
		String s = "";
		char[] chars = arg0.toCharArray();

		for(char c : chars) {
			if(c != '/') {
				s = s.concat(String.valueOf(c));
			}
		}

		return s;
	}

	public static void main(String[] args) {
		String s = addSlashes("' OR 1=1 -- q");
		System.out.println(s);
	}
}