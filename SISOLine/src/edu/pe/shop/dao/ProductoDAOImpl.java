package edu.pe.shop.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.pe.shop.entity.*;

@Repository
@Transactional
public class ProductoDAOImpl implements ProductoDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void Save(Producto producto) 
	{
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(producto);
		transaction.commit();
		session.close();		
	}

	@Override
	public List<Producto> ListProductByUsuario(Integer idusuario) {
		List<Producto> lista = (List<Producto>)sessionFactory.getCurrentSession().createQuery(
				"from Producto where idusuario = :idusuario")
				.setInteger("idusuario", idusuario).list();
		return lista;
	}

	@Override
	public List<Producto> ListByUsuarioCategoria(Integer idusuario, Integer idcategoria) {
		List<Producto> lista = (List<Producto>)sessionFactory.getCurrentSession().createQuery(
				"from Producto where idusuario = :idusuario and idcategoria = :idcategoria ")
				.setInteger("idusuario", idusuario)
				.setInteger("idcategoria", idcategoria)
				.list();
		return lista;
	}

	@Override
	public Producto find(Integer id) {
		return (Producto) sessionFactory.getCurrentSession().get(Producto.class, id);
	}

	@Override
	public List<Producto> ListaProducto(Integer idcategoria) {
		return sessionFactory.getCurrentSession().createQuery("from Producto where idcategoria = " + idcategoria).list();
	}

	@Override
	public List<Producto> featured(int n) 
	{
		List<Producto> lista = (List<Producto>)sessionFactory.getCurrentSession().createQuery("from Producto order by id desc").setMaxResults(n).list();
		return lista;
	}

	@Override
	public List<Producto> latest(int n) {
		return null;
	}

}
