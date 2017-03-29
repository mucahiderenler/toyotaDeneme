package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.BolumDao;
import com.dao.UserDao;
import com.model.Bolum;
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
	
	@RequestMapping(value="/userAdd", method = RequestMethod.GET)
	public String userGet(Model model) {
		model.addAttribute("user",new User());
		model.addAttribute("bolum",new Bolum());
		return "userAdd";
	}
	
	@RequestMapping(value="/userAdd", method = RequestMethod.POST)
	public String userAdd(@ModelAttribute("user") User u,BindingResult result, @ModelAttribute("bolum") Bolum b) {
		System.out.println(u.getUsername());
		System.out.println(u.getPassword());
		if(result.hasErrors()) {
			return "userAdd";
		}
		b.getBolumAdi();
		//u.setBolumId(this.bolumDao.getBolumByName(b.getBolumAdi()).getId());
		this.userDao.addUser(u);
		return "redirect:/users";
	}
}
