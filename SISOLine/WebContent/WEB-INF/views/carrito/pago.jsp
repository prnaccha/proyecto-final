<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!-- Checkout / Payment Method -->
<section class="checkout">
	<div class="container">
		<div class="row">
			<div class="span9">
				<div class="box">
					<!-- Checkout progress -->
					<div id="checkout-progress">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#"> <i
									class="icon-money icon-large"></i> <span>Pago</span>
							</a></li>
						</ul>
					</div>
					<!-- End id="checkout-progress" -->
					<div id="checkout-content">
						<s:form
							action="${pageContext.request.contextPath }/carrito/saveshop.htm"
							method="post">
							<!--<form method="post" action="" data-ajax-handler="shop:onPay">
						<!--  Pay with stored cards shown in dropdown -->
							<div class="box-header">
								<h3>Seleccione Método Pago</h3>
							</div>
							<div class="box-content">
								<div class="payment-methods">
									<div class="row-fluid">
										<select name="paymentMethodId" id="payment_method"
											class="span6">
											<option value=''>-</option>
											<option value="1">Tarjeta Crédito</option>
											<option value="2">Tarjeta Débito</option>
										</select>

										<div id="payment_form">
											<input type="hidden" value="" name="payment_method_id">
											<div class="row-fluid">
												<div class="span6">
													<div class="control-group">
														<label for="creditCardType" class="control-label">Tarjeta</label>
														<div class="controls">
															<select class="span12" name="creditCardType">
																<option value="Visa">Visa</option>
																<option value="MasterCard">MasterCard</option>
																<option value="Discover">Discover</option>
																<option value="Amex">American Express</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="row-fluid">
												<div class="span6">
													<div class="control-group">
														<label for="firstName" class="control-label">Nombre
															titular</label>
														<div class="controls">
															<input autocomplete="off" class="span12" type="text"
																name="firstName" id="firstName" />
														</div>
													</div>
													<div class="control-group">
														<label for="cardNumber" class="control-label">Nro
															tarjeta</label>
														<div class="controls">
															<input autocomplete="off" class="span12" type="text"
																value="" name="cardNumber" id="cardNumber" />
														</div>
													</div>
													<div class="row-fluid">
														<div class="span6">
															<div class="control-group">
																<label for="expiryMonth" class="control-label">Fecha
																	de caducidad - Mes</label>
																<div class="controls">
																	<select class="span12" name="expiryMonth">
																		<option value="0">Mes</option>
																		<option value="1">Enero</option>
																		<option value="2">Febrero</option>
																		<option value="3">Marzo</option>
																		<option value="4">Abril</option>
																		<option value="5">Mayo</option>
																		<option value="6">Junio</option>
																		<option value="7">Julio</option>
																		<option value="8">Agosto</option>
																		<option value="9">Setiembre</option>
																		<option value="10">Octubre</option>
																		<option value="11">Noviembre</option>
																		<option value="12">Diciembre</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="span6">
															<div class="control-group">
																<label for="expiryYear" class="control-label">Fecha
																	de caducidad - Año</label>
																<div class="controls">
																	<select class="span12" autocomplete="off"
																		name="expiryYear" id="expiryYear">
																		<option value="2017">2017</option>
																		<option value="2018">2018</option>
																		<option value="2019">2019</option>
																		<option value="2020">2020</option>
																		<option value="2021">2021</option>
																		<option value="2022">2022</option>
																		<option value="2023">2023</option>
																		<option value="2024">2024</option>
																		<option value="2025">2025</option>
																		<option value="2026">2026</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="span6">
													<div class="control-group">
														<label for="lastName" class="control-label">Apellido
															Titular</label>
														<div class="controls">
															<input autocomplete="off" class="span12" type="text"
																name="lastName" id="lastName" />
														</div>
													</div>
													<div class="control-group">
														<label for="securityCode" class="control-label">CVV2</label>
														<div class="controls">
															<input autocomplete="off" class="span12" type="text"
																value="" name="securityCode" id="securityCode" />
														</div>
													</div>
												</div>
											</div>
											<div class="box-footer">
												<div class="pull-right">
													<button type="submit" class="btn btn-primary">
														<i class="icon-money"></i> &nbsp; Pagar
													</button>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</s:form>
					</div>
					<!-- End id="checkout-content" -->

				</div>
			</div>
			<div class="span3">
				<div class="box">
					<!-- Order totals -->
					<div id="checkout-totals">
						<div class="hgroup title">
							<h3>Total Orden</h3>
							<h5>Los gastos de envío e impuestos se calcularán durante el
								pago</h5>
						</div>
						<ul class="price-list">
							<li>Descuento: <strong>0.00</strong></li>
							<li>Subtotal: <strong>0.00</strong></li>
							<li>Entrega: <strong>0.00</strong></li>
							<li class="important">Total: <strong>0.00</strong></li>
						</ul>
					</div>
					<!-- End id="checkout-totals" -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End class="checkout" -->