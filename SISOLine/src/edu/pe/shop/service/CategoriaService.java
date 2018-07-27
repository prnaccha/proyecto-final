package edu.pe.shop.service;

import java.util.List;
import edu.pe.shop.entity.*;

public interface CategoriaService {
	public List<Categoria> findAll();
	public Categoria find(Integer id);
}
