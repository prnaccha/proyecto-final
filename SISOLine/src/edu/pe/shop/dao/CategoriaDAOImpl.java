package edu.pe.shop.dao;
import edu.pe.shop.entity.*;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
@Transactional
public class CategoriaDAOImpl implements CategoriaDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Categoria> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from Categoria").list();
	}
	
	@Override
	public Categoria find(Integer id) {
	return (Categoria) sessionFactory.getCurrentSession()
	.get(Categoria.class, id);
	}
}
