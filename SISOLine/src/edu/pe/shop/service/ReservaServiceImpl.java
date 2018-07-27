package edu.pe.shop.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Convert;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pe.shop.dao.*;
import edu.pe.shop.entity.*;

@Service("ReservaService")
@Transactional
public class ReservaServiceImpl implements ReservaService 
{
	@Autowired
	private ReservaDAO reservaDao;
	
	private double descuento = 0;
	@Override
	public int Save(Reserva reserva, List<Carrito> listaDetalle) 
	{
		reserva.setFecharegistro(new Date());
		int idreserva = reservaDao.Save(reserva);
		int iddetalle;
		Reservadetalle detalle;
		Producto producto;
		for(int i = 0; i < listaDetalle.size(); i++)
		{
			
			detalle = new Reservadetalle();
			producto = new Producto();
			producto.setIdproducto(listaDetalle.get(i).getIdproducto());
			detalle.setReserva(reserva);
			detalle.setProducto(producto);
			detalle.setNombre(listaDetalle.get(i).getNombre());
			detalle.setCantidad(listaDetalle.get(i).getQuantity());
			detalle.setDescuento(new BigDecimal(descuento));
			detalle.setFechareserva(listaDetalle.get(i).getFecha());
			detalle.setPrecio(listaDetalle.get(i).getPrecio());
			iddetalle = reservaDao.SaveDetalle(detalle);
			if(iddetalle > 0)
			{
				break;
			}
		}
		
		return idreserva;
	}
	@Override
	public List<Reserva> ListAll(Integer idusuario) {		
		return reservaDao.ListAll(idusuario);
	}
	@Override
	public List<Reservadetalle> ListDetalle(Integer idreserva) {
		// TODO Auto-generated method stub
		return reservaDao.ListDetalle(idreserva);
	}

}
