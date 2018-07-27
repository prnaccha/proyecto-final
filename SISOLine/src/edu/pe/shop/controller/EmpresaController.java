package edu.pe.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import edu.pe.shop.entity.*;
import edu.pe.shop.service.*;

@Controller
@RequestMapping("empresa")
public class EmpresaController 
{
	@Autowired
	private EmpresaService empresaService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpSession session, ModelMap modelMap) 
	{
		Usuario entidad = (Usuario)session.getAttribute("usuario");
		
		modelMap.put("title", "Empresa");
		modelMap.put("listEmpresa", empresaService.ListByUsuario(entidad.getIdusuario()));
		modelMap.addAttribute("empresa", new Empresa());
		return "empresa.index";
	}
	
	@RequestMapping(value ="save",method = RequestMethod.POST)
	public String save(@ModelAttribute("empresa") Empresa entidad, HttpSession session, ModelMap modelMap) 
	{
		empresaService.Save(entidad);
		modelMap.put("title", "Empresa");
		modelMap.put("listEmpresa", empresaService.ListByUsuario(entidad.getIdusuario()));
		return "redirect:/empresa.htm";
	}
}
