<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Cart container -->
<section class="cart">
	<div id="cart-content">
		<c:if test="${not empty sessionScope.cart}">
			<div class="container">
				<div class="row">
					<div class="span9">
						<!-- Cart -->
						<div class="box">
							<div class="box-header">
								<h3>Carrito de Compra</h3>
								<h5>
									Actualmente tiene<strong> ${reserva.cantidad} </strong>servicios
									en su carrito de compras
								</h5>
							</div>

							<!-- Cart Items -->
							<div class="box-content">
								<div class="cart-items">
									<table class="styled-table">
										<thead>
											<tr>
												<th class="col_product text-left">Servicio</th>
												<th class="col_remove text-right">&nbsp;</th>
												<th class="col_qty text-right">Fecha</th>
												<th class="col_qty text-right">Cantidad</th>
												<th class="col_single text-right">Precio</th>
												<th class="col_discount text-right">Descuento</th>
												<th class="col_total text-right">Total</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="item" items="${sessionScope.cart}"
												varStatus="i">
												<tr>
													<td data-title="Producto" class="col_product text-left">
														<div class="image visible-desktop">
															<a class="{{ counter == 1 ? 'active' : null }}"
																href="${pageContext.request.contextPath }/producto/detalle/${item.idproducto}.htm">
																<img
																src="${pageContext.request.contextPath }/resource/images/${item.img}"
																style="max-width: 60px; max-height: 60px">
															</a>
														</div>

														<h5>
															<a
																href="${pageContext.request.contextPath }/producto/detalle/${item.idproducto}.htm">${item.nombre}</a>
														</h5>

														<ul class="options">
															<li>${item.nombre}</li>
														</ul>

													</td>

													<!--{%if edit_cart %} -->
													<td data-title="Remove" class="col_remove text-right">
														<a href="#" data-ajax-handler="shop:cart"
														data-ajax-update="#cart-content=shop-cart-content, #mini-cart=shop-minicart"
														data-ajax-extra-fields="delete_item='{{ item.key }}'">
															<i class="icon-trash icon-large"></i>
													</a>
													</td>
													<td data-title="Qty" class="col_qty text-right">${item.fecha}</td>
													<td data-title="Qty" class="col_qty text-right">${item.quantity}</td>
													<!--{% endif %} -->

													<td data-title="Single" class="col_single text-right">
														<span class="single-price">S/. ${item.precio}</span>
													</td>

													<!--{% if item.totalDiscount() > 0 %}
								                          <td data-title="Discount" class="col_discount text-right"><span class="discount">0.00</span></td>
								                        {% else %} -->
													<td data-title="Discount" class="col_discount text-right">S/.
														0.00</td>
													<!--{% endif %} -->

													<td data-title="Total" class="col_total text-right"><span
														class="total-price">${item.precio * item.quantity}</span>
													</td>
												</tr>
											</c:forEach>
											<!--{% endfor %}-->
										</tbody>
									</table>
								</div>
							</div>
							<!-- End Cart Items -->

							<div class="box-footer">
								<div class="pull-left">
									<a href="${pageContext.request.contextPath }/home.htm"
										class="btn btn-small"> <i class="icon-chevron-left"></i>
										&nbsp; Seguir Comprando
									</a>
								</div>
								<div class="pull-right">
									<c:if test="${empty sessionScope.usuario}">
										<a class="btn btn-primary btn-small mm20"
											href="${pageContext.request.contextPath }/acount/session.htm">Comprar</a>
									</c:if>
									<c:if test="${not empty sessionScope.usuario}">
										<a class="btn btn-primary btn-small mm20"
											href="${pageContext.request.contextPath }/carrito/shop.htm">Comprar</a>
									</c:if>

								</div>
							</div>
						</div>
						<!-- End Cart -->
					</div>
					<div class="span3">

						<!-- Cart details -->
						<div class="cart-details">
							<div class="box">
								<div class="hgroup title">
									<h3>Total de su Orden</h3>
									<h5>Los costos de envío e impuestos serán evaluados
										durante el pago</h5>
								</div>
								<ul class="price-list">
									<li>Subtotal: <strong>${sessionScope.reserva.subtotal}</strong></li>
									<li>Descuento: <strong>${sessionScope.reserva.descuento}</strong></li>
									<li class="important">Total: <strong>${sessionScope.reserva.total}</strong></li>
								</ul>
							</div>
						</div>
						<!-- End class="cart-details" -->

						<!-- Coupon -->
						<div class="coupon">
							<div class="box">
								<div class="hgroup title">
									<h3>Código cupón</h3>
									<h5>Ingresa tu código aquí para canjear</h5>
								</div>

								<label for="coupon_code">Coupon code</label>
								<div class="input-append">
									<input id="coupon_code" value="" type="text" name="coupon" />
									<button type="submit" class="btn" value="Apply"
										name="set_coupon_code">
										<i class="icon-ok"></i>
									</button>
								</div>

							</div>
						</div>
						<!-- End class="coupon" -->
					</div>
				</div>

			</div>

		</c:if>
		<c:if test="${empty sessionScope.cart}">
			<div class="container">
				<div class="row">
					<div class="span12 text-center"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="span12">
						<h5>¡Tu carrito esta vacío!</h5>
						<a href="${pageContext.request.contextPath }/home.htm"
							class="btn btn-small"> <i class="icon-chevron-left"></i>
							&nbsp; Seguir Comprando
						</a>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</section>
<!-- End Cart container -->