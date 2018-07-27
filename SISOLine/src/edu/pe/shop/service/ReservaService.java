package edu.pe.shop.service;

import java.util.List;

import edu.pe.shop.entity.*;

public interface ReservaService {
	public int Save(Reserva reserva, List<Carrito> listaDetalle);
	public List<Reserva> ListAll(Integer idusuario);
	public List<Reservadetalle> ListDetalle(Integer idreserva);
}
