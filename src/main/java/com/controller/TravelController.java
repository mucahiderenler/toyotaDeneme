package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

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
import org.springframework.web.servlet.ModelAndView;

import com.dao.BolumDao;
import com.dao.UserDao;
import com.model.Bolum;
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
			model.addAttribute("user", this.userDao.getUserByName(authentication.getName()));
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
		
		model.addAttribute("user", this.userDao.getUserByName(authentication.getName()));
		
		if(pass){
			model.addAttribute("userNameList", this.userDao.hello());
		}
		
		if(id == 0)
			model.addAttribute("travel", new Travel());
		else{
			model.addAttribute("travel", this.travelService.getTravelById(id));
			if(this.travelService.getTravelById(id).getUserId() != this.userDao.getUserByName(authentication.getName()).getId()
					&& !pass){
				
				return "403";
			}
		}
		
		
		return "addTravel";
	}
	
	@RequestMapping(value= "/travels/add", method = RequestMethod.POST)
	public String updateTravel(@Valid @ModelAttribute("travel") Travel t, BindingResult result){
		System.out.println(t.getId());
		if(result.hasErrors()){
			System.out.println(result.getFieldErrors());
			String returnValue = "/travels/add/" + t.getId();
			return "redirect:" + returnValue;
		}
		
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
	
	@RequestMapping(value="/travels/exportExcel", method = RequestMethod.GET)
	public ModelAndView downloadExcel(){
		ArrayList<String> finalList = new ArrayList<String>();
		
		List<Bolum> bolumList = new ArrayList<Bolum>();
		bolumList = this.bolumDao.listBolums();
		List<Travel> travelList = new ArrayList<Travel>();
		travelList = this.travelService.listTravels();
		List<User> userList = new ArrayList<User>();
		userList = this.userDao.listUsers();
		
		for(Travel t : travelList){
			
			for(User u : userList){
				
				for(Bolum b : bolumList){
						if(u.getId() == t.getUserId() && b.getId() == u.getBolumId()){
							finalList.add(b.getBolumAdi());
							finalList.add(b.getBolumMudur());
							finalList.add(u.getUsername());
							finalList.add(t.getSeyehatBas());
							finalList.add(t.getSeyehatSon());
							finalList.add(t.getSeyehatYeri());
							finalList.add(t.getgidisAmac());
							finalList.add(t.getseyehatMik());
							finalList.add(t.getProjeKod());							
						}
					}
				}
			}
		return new ModelAndView("excelView", "listOfInfo", finalList);
		}
	
	
}
