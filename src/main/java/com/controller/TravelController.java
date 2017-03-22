package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value= "/travels/add", method = RequestMethod.GET)
	public ModelAndView addTravel(@ModelAttribute("travel") Travel t){
		
		ModelAndView model = new ModelAndView("addTravel");		
		return model;
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
	
	@RequestMapping("/editTravel/{ID}")
    public String editTravel(@PathVariable("ID") int ID, Model model){
        model.addAttribute("travel", this.travelService.getTravelById(ID));
        model.addAttribute("travelList", this.travelService.listTravels());
        return "travel";
    }
	
}
