package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.BolumDao;
import com.dao.UserDao;
import com.model.Travel;
import com.model.User;
import com.service.TravelService;

@Controller
public class TravelController {

	private TravelService travelService;
	@Autowired
	@Qualifier(value="travelService")
	public void setTravelService(TravelService ts){
		this.travelService = ts;
	}
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private BolumDao bolumDao;
	
	@RequestMapping(value="/travels", method = RequestMethod.GET)
	public String getTravels(Model model){
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();	
		String auth =  authentication.getAuthorities().toString();
		boolean pass = (auth.contains("ADMIN"));
		
		if(pass){
			model.addAttribute("userList", this.userDao.listUsers());
		}
		else{
			model.addAttribute("user", this.userDao.getUserByName((String)authentication.getName()));
		}
		
		model.addAttribute("bolumList", this.bolumDao.listBolums());
		model.addAttribute("travelList",this.travelService.listTravels());
		
		return "travel";
	}
	
	@RequestMapping(value= "/travels/add/{id}", method = RequestMethod.GET)
	public String addTravel(@PathVariable("id") int id,Model model){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String auth =  authentication.getAuthorities().toString();
		boolean pass = (auth.contains("ADMIN"));
		
		if(pass){
			model.addAttribute("userNameList", this.userDao.hello());
		}
		
		if(id == 0)
			model.addAttribute("travel", new Travel());
		else
			model.addAttribute("travel", this.travelService.getTravelById(id));
		
		model.addAttribute("user", this.userDao.getUserByName((String)authentication.getName()));
		
		return "addTravel";
	}
	
	@RequestMapping(value= "/travels/add", method = RequestMethod.POST)
	public String updateTravel(@ModelAttribute("travel") Travel t){
		
		System.out.println(t.getUserId());

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
