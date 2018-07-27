package edu.pe.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import edu.pe.shop.entity.*;
import edu.pe.shop.service.*;

@Controller
@RequestMapping("acount")
public class AcountController 
{
	@Autowired
	private AcountService accountService;
	
	@RequestMapping(value ="session", method = RequestMethod.GET)
	public String login(ModelMap modelMap) 
	{
		modelMap.put("title", "Login");
		modelMap.put("action", "login");
		modelMap.addAttribute("usuario", new Usuario());
		return "acount.login";
	}
	
	@RequestMapping(value ="registrar",method = RequestMethod.POST)
	public String registrar(@ModelAttribute("usuario") Usuario entidad, ModelMap modelMap) 
	{
		String returnview;
		modelMap.put("title", "Registrar");
		modelMap.put("action", "registrar");
		try {
			accountService.create(entidad);
			returnview = "acount.registrar";
			} catch (Exception e) {
			returnview = "acount.registrar";
		}
		return returnview;
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpSession session, ModelMap modelMap) 
	{
		String view;
		modelMap.put("title", "Mi cuenta");
		Usuario acount = new Usuario();
		acount.setUsuario(request.getParameter("usuario") );
		acount.setPassword(request.getParameter("password"));
		
		Usuario account = this.accountService.login(acount);
		if (account == null) {
			view =  "redirect:acount/session.htm";
		} else {
			session.setAttribute("usuario", account);
			view =  "home.index";
		}
		
		return view;
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, ModelMap modelMap) 
	{
		Usuario account = null;
		modelMap.put("title", "Home");		
		session.setAttribute("usuario", account);
		
		return "home.index";
	}
	
	@RequestMapping(value ="perfil/{id}", method = RequestMethod.GET)
	public String perfil(@PathVariable("id") Integer id,ModelMap modelMap) 
	{
		modelMap.put("title", "Perfil");
		modelMap.put("action", "perfil");
		modelMap.addAttribute("usuario", new Usuario());
		return "acount.perfil";
	}
	
	@RequestMapping(value ="update",method = RequestMethod.POST)
	public String update(@ModelAttribute("usuario") Usuario entidad, HttpSession session,ModelMap modelMap) 
	{
		String returnview;
		modelMap.put("title", "Registrar");
		modelMap.put("action", "registrar");
		try {
			accountService.update(entidad);
			session.setAttribute("usuario", entidad);
			returnview = "acount.registrar";
		} catch (Exception e) {
			returnview = "acount.registrar";
		}
		return returnview;
	}
	
}
