package edu.pe.shop.controller;

import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("contacto")
public class ContactoController 
{
	@RequestMapping(method = RequestMethod.GET)
	public String contacto(ModelMap modelMap) 
	{
		modelMap.put("title", "Contacto");
		modelMap.put("action", "contacto");
		return "home.contacto";
	}
}
