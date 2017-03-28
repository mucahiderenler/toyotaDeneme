package com.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.model.Travel;

public class DateValidate {
	
	public boolean dateValid(Date seyehatBas, Date seyehatSon){

		if(seyehatBas.compareTo(seyehatSon) > 0) {
			return true;
		}
		else {
			return false;
		}

	}
	
	public List<Travel> betweenDates(Date seyehatB, Date seyehatS, List<Travel> travelList) throws ParseException {
		
		List <Travel> finalList = new ArrayList<Travel>();
		for(Travel t: travelList) {
			if(!(stringToDate(t.getSeyehatBas()).compareTo(seyehatB) < 0 || stringToDate(t.getSeyehatSon()).compareTo(seyehatS) > 0)) {
				finalList.add(t);
			}
		}
		return finalList;	
	}
	
	public Date stringToDate(String stringDate) throws ParseException {
		DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
		Date date = format.parse(stringDate);
		return date;
	}
}
