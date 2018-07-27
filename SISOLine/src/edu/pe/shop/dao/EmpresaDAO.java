package edu.pe.shop.dao;

import java.util.List;

import edu.pe.shop.entity.Empresa;

public interface EmpresaDAO {
	public Empresa FindByUsuario(int idusuario);
	public List<Empresa> ListByUsuario(int idusuario);
	public void Save(Empresa empresa);
}
