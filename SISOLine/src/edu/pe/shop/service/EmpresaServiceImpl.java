package edu.pe.shop.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pe.shop.dao.*;
import edu.pe.shop.entity.*;

@Service
@Transactional
public class EmpresaServiceImpl implements EmpresaService 
{
	@Autowired
	private EmpresaDAO empresaDao;

	@Override
	public Empresa FindByUsuario(int idusuario) {
		return empresaDao.FindByUsuario(idusuario);
	}
	
	@Override
	public void Save(Empresa empresa) {
		empresaDao.Save(empresa);		
	}

	@Override
	public List<Empresa> ListByUsuario(int idusuario) {
		List<Empresa> lista = empresaDao.ListByUsuario(idusuario);
		return lista;
	}

}
