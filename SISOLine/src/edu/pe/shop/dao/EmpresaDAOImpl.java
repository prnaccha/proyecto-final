package edu.pe.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.pe.shop.entity.Empresa;
import edu.pe.shop.entity.Producto;

@Repository("EmpresaDAO")
public class EmpresaDAOImpl implements EmpresaDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Empresa FindByUsuario(int idusuario) 
	{
		//return (Empresa) sessionFactory.getCurrentSession().get(Empresa.class, id);
		return (Empresa)sessionFactory.getCurrentSession().createQuery("from Empresa where idusuario = " + idusuario).uniqueResult();
	}
	
	@Override
	public List<Empresa> ListByUsuario(int idusuario)
	{
		List<Empresa> lista = sessionFactory.getCurrentSession().createQuery("from Empresa where idusuario = " + idusuario).list();
		return lista;
	}

	@Override
	public void Save(Empresa empresa) 
	{
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(empresa);
		transaction.commit();
		session.close();		
	}

}
