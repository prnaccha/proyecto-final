package edu.pe.shop.controller;

import java.math.BigDecimal;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import edu.pe.shop.service.*;
import edu.pe.shop.entity.*;

@Controller
@RequestMapping("carrito")
public class CarritoController 
{
	
	@Autowired
	private ProductoService productService;
	
	@Autowired
	private ReservaService reservaService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String nosotros(HttpSession session, ModelMap modelMap) 
	{
		List<Carrito> cart = (List<Carrito>) session.getAttribute("cart");
		Reserva reserva = new Reserva();
		modelMap.put("title", "Carrito");
		modelMap.put("action", "carrito");
		if (session.getAttribute("cart") == null) 
		{
			reserva.setCantidad(0);
		} 
		else 
		{			
			reserva = getReservaTotal(cart);			
		}
		modelMap.put("reserva", reserva);
		return "carrito.index";
	}
	
	@RequestMapping(value = "addcart", method = RequestMethod.POST)
	public String add(@ModelAttribute("reserva") Reservadetalle entidad, HttpSession session, ModelMap modelMap) 
	{
		modelMap.put("title", "Carrito");		
		Producto producto = productService.find(entidad.getProducto().getIdproducto());
		Carrito carrito = new Carrito(producto.getIdproducto(),producto.getNombre(),producto.getPrecio(),producto.getUrlimg(),entidad.getCantidad(),entidad.getFechareserva());
		Reserva reserva = new Reserva();
		List<Carrito> cart = new ArrayList<Carrito>();
		if (session.getAttribute("cart") == null) 
		{			
			cart.add(carrito);
			reserva.setCantidad(entidad.getCantidad());
		} 
		else 
		{
			cart = (List<Carrito>)session.getAttribute("cart");
			int index = isExists(entidad.getProducto().getIdproducto(), session);
			if (index == -1)
				cart.add(carrito);
			else {
				int quantity = cart.get(index).getQuantity() + entidad.getCantidad();
				cart.get(index).setQuantity(quantity);
			}			
		}
		reserva = getReservaTotal(cart);
		session.setAttribute("reserva", reserva);
		session.setAttribute("cart", cart);
		//modelMap.put("reserva", reserva);
		return "carrito.index";
	}
	
	@RequestMapping(value = "shop", method = RequestMethod.GET)
	public String shop( HttpSession session, ModelMap modelMap) 
	{
		modelMap.put("title", "Comprar");
		return "carrito.shop";
	}
	
	@RequestMapping(value = "saveshop", method = RequestMethod.POST)
	public String saveShop(HttpSession session,ModelMap modelMap) 
	{
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		Reserva reserva = (Reserva)session.getAttribute("reserva");		
		reserva.setUsuario(usuario);
		List<Carrito> listaDetalle = (List<Carrito>)session.getAttribute("cart");				
		int  id = reservaService.Save(reserva, listaDetalle);
		session.setAttribute("cart", null);
		session.setAttribute("reserva", null);
		modelMap.put("title", "Pedido");
		modelMap.put("listReserva", reservaService.ListAll(usuario.getIdusuario()));
		return "pedido.index";
	}

	@RequestMapping(value = "delete/{index}", method = RequestMethod.GET)
	public String delete(@PathVariable("index") int index, HttpSession session) {
		List<Carrito> cart = (List<Carrito>) session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/carrito.htm";
	}

	private int isExists(int id, HttpSession session) {
		List<Carrito> cart = (List<Carrito>) session.getAttribute("cart");
		for (int i = 0; i < cart.size(); i++)
			if (cart.get(i).getIdproducto() == id)
				return i;
		return -1;
	}
	
	private Reserva getReservaTotal(List<Carrito> cart) {
		Reserva entidad = new Reserva();
		int cantidad = 0;
		double subtotal = 0;
		double descuento = 0;
		BigDecimal preciounitario = new BigDecimal(0);
		for (int i = 0; i < cart.size(); i++)
		{
			cantidad += cart.get(i).getQuantity();
			preciounitario = cart.get(i).getPrecio();
			subtotal += cart.get(i).getQuantity()*preciounitario.doubleValue();			
		}
		
		entidad.setCantidad(cantidad);
		entidad.setDescuento(new BigDecimal(descuento));
		entidad.setSubtotal(new BigDecimal(subtotal));
		entidad.setTotal(new BigDecimal(subtotal-descuento));		
		
		return entidad;
	}
}
