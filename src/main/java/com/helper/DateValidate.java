package com.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateValidate {
	
	public boolean dateValid(String seyehatBas, String seyehatSon){

		try {
				DateFormat format = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH);
				Date seyehatB = format.parse(seyehatBas);
				Date seyehatS = format.parse(seyehatSon);
				if(seyehatB.compareTo(seyehatS) > 0) {
					return true;
				}
				else {
					return false;
				}
		} catch(ParseException ex) {
			return true;
		}
	}
}
