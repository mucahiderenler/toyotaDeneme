package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value= "/travels/add/{id}", method = RequestMethod.GET)
	public String addTravel(@PathVariable("id") int ID,Model model){
		if(ID == 0){
			model.addAttribute("travel", new Travel());
		}
		else{
			model.addAttribute("travel", this.travelService.getTravelById(ID));
	        //model.addAttribute("listTravels", this.travelService.listTravels());
		}
		return "addTravel";
	}
	
	@RequestMapping(value= "/travels/add", method = RequestMethod.POST)
	public String updateTravel(@ModelAttribute("travel") Travel t){
		
		if(t.getId() == 0){
			//new travel, add it
			this.travelService.addTravel(t);
		}else{
			//existing travel, call update
			this.travelService.updateTravel(t);
		}
		
		return "redirect:/travels";
	}
	
	@RequestMapping("/travels/remove/{id}")
    public String removePerson(@PathVariable("id") int id){		
        this.travelService.removeTravel(id);
        return "redirect:/travels";
    }
	
}
