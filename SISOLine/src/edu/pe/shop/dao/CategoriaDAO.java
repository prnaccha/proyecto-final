package edu.pe.shop.dao;
import edu.pe.shop.entity.*;
import java.util.List;

public interface CategoriaDAO {
	public List<Categoria> findAll();
	public Categoria find(Integer id);
}
