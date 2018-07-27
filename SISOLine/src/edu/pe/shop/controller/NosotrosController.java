package edu.pe.shop.controller;

import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("nosotros")
public class NosotrosController 
{
	@RequestMapping(method = RequestMethod.GET)
	public String nosotros(ModelMap modelMap) 
	{
		modelMap.put("title", "Nosotros");
		modelMap.put("action", "nosotros");
		return "home.nosotros";
	}

}
