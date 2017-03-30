package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

 @RequestMapping("login")
 public ModelAndView getLoginForm(
   @RequestParam(required = false) String authfailed, String logout,
   String denied) {
  String message = "";
  if (authfailed != null) {
   message = "Kullanıcı adı veya şifre yanlış !";
  } else if (logout != null) {
   message = "Çıkış yapıldı !";
  } 
  return new ModelAndView("login", "message", message);
 }

 @RequestMapping("403page")
 public String ge403denied() {
  return "403";
 }

}