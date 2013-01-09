package util;

public final class Number {

	private Number() {}

	public static double parseDouble(String arg0) throws NumberFormatException {
		String number = "";

		for(char c : arg0.toCharArray()) {
			switch (c) {
			case '0':
				number += c;
				break;

			case '1':
				number += c;
				break;

			case '2':
				number += c;
				break;

			case '3':
				number += c;
				break;

			case '4':
				number += c;
				break;

			case '5':
				number += c;
				break;

			case '6':
				number += c;
				break;

			case '7':
				number += c;
				break;

			case '8':
				number += c;
				break;

			case '9':
				number += c;
				break;
			

			case ',':
				number += '.';
				break;

			default:
				
				break;
			}
		}

		return Double.parseDouble(number);
	}

	public static int parseInt(String arg0) {
		return (int)parseDouble(arg0);
	}

	public static long parseLong(String arg0) {
		return (long)parseDouble(arg0);
	}
}