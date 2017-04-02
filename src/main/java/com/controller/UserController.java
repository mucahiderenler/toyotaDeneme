package com.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.model.User;

@Controller
public class UserController {
	
	@Autowired
	private BolumDao bolumDao;
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/users", method = RequestMethod.GET)
	public String getUsers(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();	
		model.addAttribute("userList", this.userDao.listUsers());
		model.addAttribute("bolumList", this.bolumDao.listBolums());
		model.addAttribute("user",this.userDao.getUserByName(authentication.getName()));
		return "user";
	}
	
	@RequestMapping(value="/userAdd/{id}", method = RequestMethod.GET)
	public String userGet(Model model, @PathVariable("id") int id) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String auth =  authentication.getAuthorities().toString();
		boolean pass = (auth.contains("ADMIN"));
		if(pass) {
			model.addAttribute("admin","admin"); 		//eğer adminse kullanıcı listesini dropdownda göremez.
		}
		
		if(id == 0) {
			model.addAttribute("user",new User());
		}
		else {
			User hello = this.userDao.getUserById(id);
			hello.setSeyehatGun("");
			hello.setSeyehatZaman("");
			model.addAttribute("user",hello);
			if(hello.getId() != this.userDao.getUserByName(authentication.getName()).getId() && !pass) {
				return "403";
			}
		}
		model.addAttribute("userSession",this.userDao.getUserByName(authentication.getName()));
		model.addAttribute("bolumAdiandId",this.bolumDao.IdAndBolum());
		return "userAdd";
	}
	
	@RequestMapping(value="/userAdd", method = RequestMethod.POST)
	public String userAdd(@Valid @ModelAttribute("user") User u,BindingResult result,Model model) {
		if(result.hasErrors()) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();	
			model.addAttribute("userSession",this.userDao.getUserByName(authentication.getName()));		//user validation
			model.addAttribute("bolumAdiandId",this.bolumDao.IdAndBolum());
			return "userAdd";
		}
		u.setSeyehatGun(u.getSeyehatGun().replace(",", "-"));
		u.setSeyehatZaman(u.getSeyehatZaman().replace(","," "));
		
		if(u.getId() == 0) {
			this.userDao.addUser(u);
		}
		else {
			this.userDao.updateUser(u);
		}
		return "redirect:/users";
	}
	
	@RequestMapping("/users/remove/{id}")
    public String removePerson(@PathVariable("id") int id){		
        this.userDao.removeUser(id);
        return "redirect:/users";
    }
}
