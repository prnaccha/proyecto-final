package edu.pe.shop.controller;

import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import edu.pe.shop.entity.Carrito;
import edu.pe.shop.entity.Reserva;
import edu.pe.shop.service.*;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping("home")
public class HomeController {
	
	@Autowired
	private ProductoService productoService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpSession session, ModelMap modelMap) 
	{
		modelMap.put("title", "Home");
		modelMap.put("action", "home");
		modelMap.put("lista_producto", productoService.featured(9));
		return "home.index";
	}
}
