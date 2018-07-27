package edu.pe.shop.dao;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import edu.pe.shop.entity.*;

@Repository("accountDao")
public class AcountDAOImpl implements AcountDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void Create(Usuario acount) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(acount);
		transaction.commit();
		session.close();		
	}

	@Override
	public Usuario Login(Usuario acount) {
		Usuario entidad =(Usuario) sessionFactory.getCurrentSession()
				.createQuery("from Usuario "
				+ "where usuario = :usuario and "
				+ "password = :password")
				.setString("usuario", acount.getUsuario())
				.setString("password", acount.getPassword())
				.uniqueResult();
		return entidad; 
	}

	@Override
	public void Update(Usuario acount) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		 /*Query query = session.createQuery("update Usuario set nombre= :nombre, "+
		"apellido= :apellido, telefono= :telefono, direccion= :direccion, direcciond= :direcciond, " + 
		"ciudad= :ciudad, codigo_postal= :codigo_postal, pais= :pais, region= :region" + 
		"facnombre= :facnombre, facapellido= :facapellido, factelefono= :factelefono, facdireccion= :facdireccion, facdirecciond= :facdirecciond, " + 
		"facciudad= :facciudad, faccod_postal= :faccod_postal, facpais= :facpais, facregion= :facregion" +
		" where idusuario= :id");
        query.setParameter("nombre", acount.getNombre());
        query.setParameter("apellido", acount.getApellido());
        query.setParameter("telefono", acount.getTelefono());
        query.setParameter("direccion", acount.getDireccion());
        query.setParameter("direcciond", acount.getDirecciond());
        query.setParameter("ciudad", acount.getCiudad());
        query.setParameter("codigo_postal", acount.getCodigo_postal());
        query.setParameter("pais", acount.getPais());
        query.setParameter("region", acount.getRegion());
        query.setParameter("facnombre", acount.getFacnombre());
        query.setParameter("facapellido", acount.getFacapellido());
        query.setParameter("factelefono", acount.getFactelefono());
        query.setParameter("facdireccion", acount.getFacdireccion());
        query.setParameter("facdirecciond", acount.getFacdirecciond());
        query.setParameter("facciudad", acount.getFacciudad());
        query.setParameter("faccod_postal", acount.getFaccod_postal());
        query.setParameter("facpais", acount.getFacpais());
        query.setParameter("facregion", acount.getFacregion());
        query.setLong("id", acount.getIdusuario());
        int result = query.executeUpdate();
		System.out.println("El resultado es: " + result);*/
		
		session.update(acount);
		transaction.commit();
		session.close();
	}

}
