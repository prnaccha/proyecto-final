package edu.pe.shop.entity;

import java.math.BigDecimal;

public class Carrito 
{	
	private int idproducto;
	private String nombre;
	private BigDecimal precio;
	private BigDecimal descuento;
	private String img;
	private int quantity;
	private String fecha;
	
	public Carrito(int idproducto, String nombre, BigDecimal precio, String img, int quantity, String fecha) {
		super();
		this.idproducto = idproducto;
		this.nombre = nombre;
		this.precio = precio;
		this.img = img;
		this.quantity = quantity;
		this.fecha = fecha;
	}

	public int getIdproducto() {
		return idproducto;
	}

	public void setIdproducto(int idproducto) {
		this.idproducto = idproducto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public BigDecimal getPrecio() {
		return precio;
	}

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Carrito() {
		super();
	}

	public BigDecimal getDescuento() {
		return descuento;
	}

	public void setDescuento(BigDecimal descuento) {
		this.descuento = descuento;
	}
	
	
}
