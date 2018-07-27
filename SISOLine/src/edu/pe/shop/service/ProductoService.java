package edu.pe.shop.service;

import java.util.List;
import edu.pe.shop.entity.Producto;

public interface ProductoService {
	public void save(Producto producto);
	public Producto find(Integer id);
	public List<Producto> ListaProducto(Integer idcategoria);
	public List<Producto> ListProductByUsuario(Integer idusuario);
	public List<Producto> ListByUsuarioCategoria(Integer idusuario, Integer idcategoria);
	public List<Producto> featured(int n);
	public List<Producto> latest(int n);
}
