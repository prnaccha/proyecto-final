package edu.pe.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("admin")
public class AdminController {
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) 
	{
		modelMap.put("title", "Home");
		modelMap.put("action", "home");
		return "admin.index";
	}

}
