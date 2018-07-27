package edu.pe.shop.service;

import edu.pe.shop.entity.Usuario;

public interface AcountService {
	public void create(Usuario account);
	public void update(Usuario account);
	public Usuario login(Usuario account);
}
