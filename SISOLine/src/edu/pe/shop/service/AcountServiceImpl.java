package edu.pe.shop.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pe.shop.entity.Usuario;
import edu.pe.shop.dao.*;

@Service("AcountService")
@Transactional
public class AcountServiceImpl implements AcountService {
	
	@Autowired
	private AcountDAO acountDao;
	
	@Override
	public void create(Usuario acount) {
		acountDao.Create(acount);
	}

	@Override
	public Usuario login(Usuario acount) {
		return acountDao.Login(acount);
	}

	@Override
	public void update(Usuario acount) {
		acountDao.Update(acount);
	}

}
