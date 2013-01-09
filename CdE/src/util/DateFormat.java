package util;

import java.text.SimpleDateFormat;

public final class DateFormat {
	private static SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

	private DateFormat(){}

	public static java.sql.Date parseSqlDate(String arg0) {
		java.sql.Date d = null;

		try {
			String[] array = arg0.split("/");
			d = java.sql.Date.valueOf(array[2]+"-"+array[1]+"-"+array[0]);

		} catch (Exception e) {
			
		}
		return d;
	}

	public static java.sql.Date parseDate(String arg0) {
		java.sql.Date d = null;

		try {
			d =  (java.sql.Date) df.parse(arg0);

		} catch (Exception e) {
			
		}
		return d;
	}
}