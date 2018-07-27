package edu.pe.shop.dao;

import edu.pe.shop.entity.*;

public interface AcountDAO {
	public void Create(Usuario acount);
	public Usuario Login(Usuario acount);
	public void Update(Usuario acount);
}
