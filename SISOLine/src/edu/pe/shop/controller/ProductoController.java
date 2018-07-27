package edu.pe.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import edu.pe.shop.entity.*;
import edu.pe.shop.service.*;

@Controller
@RequestMapping("producto")
public class ProductoController 
{
	@Autowired
	private CategoriaService categoriaService;
	
	@Autowired
	private ProductoService productoService;
	
	@Autowired
	private EmpresaService empresaService;
	
	
	@RequestMapping(value = "/categoria/{id}", method = RequestMethod.GET)
	public String categoria(@PathVariable("id") Integer id, ModelMap modelMap) {
		Categoria categoria = categoriaService.find(id);
		modelMap.put("title", categoria.getNombre());
		modelMap.put("obj_categoria", categoriaService.find(id));
		modelMap.put("listaProducto", productoService.ListaProducto(id));
		return "categoria.producto";
	}
	
	@RequestMapping(value = "/detalle/{id}",method = RequestMethod.GET)
	public String detalle(@PathVariable("id") Integer id, ModelMap modelMap) 
	{
		Producto producto = productoService.find(id);
		modelMap.put("title", "Detalle");
		modelMap.put("producto", producto);
		modelMap.put("listaProducto", productoService.ListaProducto(producto.getCategoria().getIdcategoria()));
		modelMap.put("empresa", productoService.ListaProducto(producto.getCategoria().getIdcategoria()));
		modelMap.addAttribute("reserva", new Reservadetalle());
		return "producto.detalle";
	}
	
	//Pagina de Listado de todos los productos del cliente
	@RequestMapping(value="/index/{id}", method = RequestMethod.GET)
	public String index(@PathVariable("id") Integer id,HttpSession session, ModelMap modelMap) 
	{
		Usuario entidad = (Usuario)session.getAttribute("usuario");
		List<Producto> listProducto;
		if(id == 0)
		{
			listProducto = productoService.ListProductByUsuario(entidad.getIdusuario());
		}
		else
		{
			listProducto = productoService.ListByUsuarioCategoria(entidad.getIdusuario(),id);
		}		
		List<Categoria> listCategoria = categoriaService.findAll();
		List<Empresa> listEmpresa = empresaService.ListByUsuario(entidad.getIdusuario());
		modelMap.put("title", "Catalogo");
		modelMap.put("listEmpresa", listEmpresa);
		modelMap.put("listCategoria", listCategoria);
		modelMap.put("listProducto", listProducto);
		modelMap.addAttribute("producto", new Producto());
		return "producto.index";
	}
	
	//Pagina para registro de producto	
	@RequestMapping(value ="save",method = RequestMethod.POST)
	public String save(@ModelAttribute("producto") Producto entidad, ModelMap modelMap) 
	{
		productoService.save(entidad);
		return "redirect:index/" + entidad.getCategoria().getIdcategoria() + ".htm";
	}
	
}
