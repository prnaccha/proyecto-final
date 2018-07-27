package edu.pe.shop.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pe.shop.dao.*;
import edu.pe.shop.entity.*;

@Service("CategoriaService")
@Transactional
public class CategoriaServiceImpl implements CategoriaService {
	@Autowired
	private CategoriaDAO categoriaDao;
	
	@Override
	public List<Categoria> findAll() {
		List<Categoria> list = categoriaDao.findAll();
		
		for (Categoria categoria : list) {
			System.out.println("elemento: " + categoria);
		}
		return list;
	}

	@Override
	public Categoria find(Integer id) {
		Categoria object = new Categoria();
		object = categoriaDao.find(id);
		System.out.println("el objeto es: " + object.getNombre());
		return object;
	}
}
