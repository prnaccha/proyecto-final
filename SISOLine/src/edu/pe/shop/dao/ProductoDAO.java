package edu.pe.shop.dao;

import java.util.List;

import edu.pe.shop.entity.*;

public interface ProductoDAO {
	public Producto find(Integer id);
	public List<Producto> ListProductByUsuario(Integer idusuario);
	public List<Producto> ListByUsuarioCategoria(Integer idusuario, Integer idcategoria);
	public List<Producto> ListaProducto(Integer idcategoria);
	public List<Producto> featured(int n);
	public List<Producto> latest(int n);
	public void Save(Producto producto);
}
