package edu.pe.shop.service;

import java.util.List;

import edu.pe.shop.entity.*;

public interface EmpresaService {
	
	public Empresa FindByUsuario(int idusuario);
	public List<Empresa> ListByUsuario(int idusuario);
	public void Save(Empresa empresa);

}
