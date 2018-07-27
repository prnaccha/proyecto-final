<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="span8">
			<div class="box">
				<div class="box-header">
					<h3>Historial de pedidos</h3>
					<h5>Verifique el estado de su pedido, pague sus pedidos
						impagos y más!</h5>
				</div>
				<div class="box-body">
					<table class="styled-table orders">
						<thead>
							<tr>
								<th class="col_id">Order no.</th>
								<th class="col_date">Fecha</th>
								<th class="col_count">Cantidad</th>
								<th class="col_total">total</th>
								<th class="col_status">Estado</th>
								<th class="col_view hide-for-small">&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="reserva" items="${listReserva}" varStatus="i">
								<tr>
									<td class="col_id">${reserva.idreserva}</td>
									<td class="col_date">${reserva.fecharegistro}</td>
									<td class="col_count">${reserva.cantidad}<span	class="hide-for-small"> item(s)</span></td>
									<td class="col_total">${reserva.total}</td>
									<td class="col_status"><span class="label" style="background-color: 2;">${reserva.estadopago}</span></td>
									<td class="col_view text-right"><a href="${pageContext.request.contextPath }/pedido/detalle/${reserva.idreserva}.htm"
										class="btn btn-small btn-primary"> View &nbsp; <i
											class="icon-chevron-right"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="span4">
			<div class="box">
				<div class="box-header">
					<h3>Estadísticas de orden</h3>
					<h5>Algunas estadísticas sobre ti</h5>
				</div>

				<div class="box-body">
					<ul class="price-list">

						<li>Cliente desde: <strong>"27/07/2018"</strong></li>
						<li>Total de pedidos: <strong>1</strong></li>
						<li>Total items: <strong>3</strong></li>
						<li class="important">Gasto total: <strong>S/. 0.00</strong></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</div>