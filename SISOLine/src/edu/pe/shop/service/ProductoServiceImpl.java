package edu.pe.shop.service;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pe.shop.dao.*;
import edu.pe.shop.entity.*;

@Service
@Transactional
public class ProductoServiceImpl implements ProductoService{
	@Autowired
	private ProductoDAO productoDao;
	
	@Override
	public Producto find(Integer id) {
		Producto entidad = productoDao.find(id);
		return entidad;
	}
	
	@Override
	public List<Producto> ListProductByUsuario(Integer idusuario) {
		List<Producto> lista = productoDao.ListProductByUsuario(idusuario);
		return lista;
	}
	
	@Override
	public List<Producto> ListaProducto(Integer idcategoria)
	{
		List<Producto> oLista = productoDao.ListaProducto(idcategoria);
		return oLista;
	}

	@Override
	public List<Producto> featured(int n) {
		return productoDao.featured(n);
	}

	@Override
	public List<Producto> latest(int n) {
		return productoDao.latest(n);
	}

	@Override
	public void save(Producto producto) {
		productoDao.Save(producto);		
	}

	@Override
	public List<Producto> ListByUsuarioCategoria(Integer idusuario, Integer idcategoria) {
		return productoDao.ListByUsuarioCategoria(idusuario, idcategoria);
	}	
}
