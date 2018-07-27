package edu.pe.shop.dao;

import java.util.List;

import edu.pe.shop.entity.*;

public interface ReservaDAO {
	public int Save(Reserva reserva);
	public int SaveDetalle(Reservadetalle reservaDetalle);
	public List<Reserva> ListAll(Integer idusuario);
	public List<Reservadetalle> ListDetalle(Integer idreserva);
}
