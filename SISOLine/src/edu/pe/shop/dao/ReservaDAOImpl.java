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
public class ReservaDAOImpl implements ReservaDAO 
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public int Save(Reserva reserva) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(reserva);
		transaction.commit();
		session.close();
		return reserva.getIdreserva();
	}

	@Override
	public int SaveDetalle(Reservadetalle reservaDetalle) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(reservaDetalle);
		transaction.commit();
		session.close();
		return 0;
	}

	@Override
	public List<Reserva> ListAll(Integer idusuario) {
		List<Reserva> lista = (List<Reserva>)sessionFactory.getCurrentSession().createQuery(
				"from Reserva where idusuario = :idusuario")
				.setInteger("idusuario", idusuario).list();
		return lista;
	}

	@Override
	public List<Reservadetalle> ListDetalle(Integer idreserva) {
		List<Reservadetalle> listadetalle = (List<Reservadetalle>)sessionFactory.getCurrentSession().createQuery(
				"from Reservadetalle where idreserva = :idreserva").setInteger("idreserva", idreserva).list();
		return listadetalle;
	}

}
