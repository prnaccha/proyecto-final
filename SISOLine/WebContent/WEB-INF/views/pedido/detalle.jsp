<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<!--{% if order %}-->
		<div class="span8">
			<div class="box">

				<div class="box-header">
					<h3>Orden</h3>
					<h5>
						This order is currently <span class="label"
							style="background-color: {{"> 1 </span>
						and has been since
					</h5>
				</div>

				<div class="box-body">
					<div class="cart-items">
						<table class="styled-table order">
							<thead>
								<tr>
									<th class="col_product text-left">Producto</th>
									<th class="col_qty text-center">Fecha</th>
									<th class="col_qty text-center">Cantidad</th>
									<th class="col_single text-right">Precio</th>
									<th class="col_discount text-right">Descuento</th>
									<th class="col_total text-right">Total</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach var="detalle" items="${listadetalle}" varStatus="i">
									<tr>
										<td class="col_product">
											<div class="image">
												<a	href="${pageContext.request.contextPath }/producto/detalle/${detalle.producto.idproducto}.htm">
													<img src="${pageContext.request.contextPath }/resource/images/${detalle.producto.urlimg}"
													style="max-width: 60px; max-height: 60px">
												</a>
											</div>

											<h5>
												<a
													href="${pageContext.request.contextPath }/producto/detalle/${detalle.producto.idproducto}.htm">
													${detalle.producto.nombre}</a>
											</h5> 
											<br/>
											<ul class="options">
												<li>${detalle.producto.descripcion}</li>
											</ul>

										</td>
										<td class="col_qty text-center"><span class="quantity">${detalle.fechareserva}</span></td>
										<td class="col_qty text-right"><span class="quantity">${detalle.cantidad}</span></td>
										<td class="col_single text-right"><span class="price">${detalle.precio}</span></td>
										<td class="col_discount text-right"><span
											class="discount">${detalle.descuento}</span></td>
										<td class="col_total text-right"><span class="total">${detalle.precio*detalle.cantidad}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="box-footer">
					<div class="pull-left">
						<a class="btn btn-small" href="${pageContext.request.contextPath }/pedido.htm"> <i
							class="icon-chevron-left"></i> &nbsp; Order list
						</a>
					</div>

					<!--{% if order.payment_method.has_payment_form() and not
					order.payment_processed() %}-->
					<div class="pull-right">
						<a class="btn btn-small btn-primary"
							href="${pageContext.request.contextPath }/carrito/shop.htm"> Pagar Ahora
							&nbsp; <i class="icon-chevron-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>

		<div class="span4">
			<div class="box">{{ partial("shop-ordertotals") }}</div>
		</div>

		<!-- {% else %}
		<div class="span12">
			<p class="alert">Order not found</p>
		</div>
		{% endif %}-->
	</div>
</div>