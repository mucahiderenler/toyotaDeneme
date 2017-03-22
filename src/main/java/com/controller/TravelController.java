package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.Travel;
import com.service.TravelService;

@Controller
public class TravelController {

	private TravelService travelService;
	@Autowired
	@Qualifier(value="travelService")
	public void setTravelService(TravelService ts){
		this.travelService = ts;
	}
	
	@RequestMapping(value="/travels", method = RequestMethod.GET)
	public String getTravels(Model model){
		model.addAttribute("travel", new Travel());
		model.addAttribute("travelList",this.travelService.listTravels());
		return "travel";
	}
	
	
	
	
}
