package edu.pe.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.pe.shop.service.*;
import edu.pe.shop.entity.*;

@Controller
@RequestMapping("pedido")
public class PedidoController {

	@Autowired
	private ReservaService reservaService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpSession session, ModelMap modelMap) 
	{
		Usuario user = (Usuario)session.getAttribute("usuario");
		modelMap.put("title", "Pedido");
		modelMap.put("listReserva", reservaService.ListAll(user.getIdusuario()));
		return "pedido.index";
	}
	
	@RequestMapping(value="detalle/{id}" , method = RequestMethod.GET)
	public String detalle(@PathVariable("id") int idreserva, ModelMap modelMap) 
	{
		List<Reservadetalle> lista = reservaService.ListDetalle(idreserva);
		modelMap.put("title", "Detalle Pedido");
		modelMap.put("listadetalle", lista/*reservaService.ListDetalle(idreserva)*/);
		return "pedido.detalle";
	}
	
}
