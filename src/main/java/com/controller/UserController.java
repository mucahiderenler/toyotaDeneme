package com.controller;


import org.springframework.beans.factory.annotation.Autowired;
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
		model.addAttribute("userList", this.userDao.listUsers());
		model.addAttribute("bolumList", this.bolumDao.listBolums());
		return "user";
	}
	
	@RequestMapping(value="/userAdd/{id}", method = RequestMethod.GET)
	public String userGet(Model model, @PathVariable("id") int id) {
		if(id == 0) {
			model.addAttribute("user",new User());
		}
		else {
			User hello = this.userDao.getUserById(id);
			hello.setSeyehatGun("");
			hello.setSeyehatZaman("");
			model.addAttribute("user",hello);
		}
		model.addAttribute("bolumAdiandId",this.bolumDao.IdAndBolum());
		return "userAdd";
	}
	
	@RequestMapping(value="/userAdd", method = RequestMethod.POST)
	public String userAdd(@ModelAttribute("user") User u,BindingResult result) {
		if(result.hasErrors()) {
			return "userAdd";
		}
		System.out.println(u.getId());
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
