<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<div id="product-page">
	<!-- Product content -->
	<section class="product">
		<!-- Product info -->
		<section class="product-info">
			<div class="container" itemscope
				itemtype="http://data-vocabulary.org/Product">
				<div class="row">
					<div class="span4">
						<div class="product-images">
							<div class="box">
								<div class="primary">
									<!-- FOTO PRINCIPAL DEL PRODUCTO -->
									<img itemprop="image"
										src="${pageContext.request.contextPath}/resource/images/${producto.urlimg}"
										data-zoom-image="{{ product.images.first.thumbnail(746, 'auto')|default('http://placehold.it/460x300') }}"
										alt="{{ product.images.first.title }}" />
								</div>
								<div class="thumbs" id="gallery">
									<ul class="thumbs-list">
										<!-- Lista de galeria de fotos -->
										<li><a class="{{ counter == 1 ? 'active' : null }}"
											href="#" data-image="{{ image.thumbnail(746, 'auto') }}"
											title="{{ product.title }}"
											data-zoom-image="{{ image.thumbnail(746, 'auto') }}"> <img
												src="${pageContext.request.contextPath}/resource/images/${producto.urlimg}"
												alt="{{ image.title }}" />
										</a></li>
									</ul>
								</div>
								<div class="social social-links">
									<button class="facebook btn btn-mini share s_facebook">
										<i class="icon-facebook-sign"></i> &nbsp; <span
											class='badge counter c_facebook'>&nbsp;</span>
									</button>

									<button class="twitter btn btn-mini share s_twitter">
										<i class="icon-twitter-sign"></i>
									</button>

									<button class="google btn btn-mini share s_plus">
										<i class="icon-google-plus-sign"></i> &nbsp; <span
											class='badge counter c_plus'>&nbsp;</span>
									</button>

									<button class="pinterest btn btn-mini share s_pinterest">
										<i class="icon-pinterest-sign"></i> &nbsp; <span
											class='badge counter c_pinterest'>&nbsp;</span>
									</button>

								</div>
							</div>
						</div>
					</div>
					<div class="span8">
						<!-- Product content -->
						<div class="product-content">
							<div class="box">
								<!-- Tab panels' navigation -->
								<ul class="nav nav-tabs">
									<li class="active"><a href="#product" data-toggle="tab">
											<i class="icon-reorder icon-large"></i> <span
											class="hidden-phone">Producto</span>
									</a></li>
								</ul>
								<!-- End Tab panels' navigation -->
								<!-- Tab panels container -->
								<div class="tab-content">
									<!-- Product tab-->
									<s:form
										action="${pageContext.request.contextPath }/carrito/addcart.htm"
										method="post" commandName="reserva">
										<div class="tab-pane active" id="product"
											itemprop="offerDetails" itemscope
											itemtype="http://data-vocabulary.org/Offer">
											<div class="details">
												<h1 itemprop="name">${producto.nombre}</h1>
												<div class="prices">
													<span class="price" itemprop="price">${producto.precio}</span>
													<meta itemprop="currency" content="USD" />
												</div>
												<div class="meta">
													<div class="sku">
														<i class="icon-pencil"></i> <span itemprop="identifier"
															content="sku" rel="tooltip" title="Stock por fecha">${producto.cantidad}</span>
													</div>
													<div class="categories">
														<ul class="links">
															<span itemprop="category"><i class="icon-tags"></i><a
																href="${pageContext.request.contextPath }/producto/categoria/${producto.categoria.idcategoria}.htm"
																title="Categoria">${producto.categoria.nombre}</a></span>
														</ul>
													</div>
												</div>
											</div>
											<div class="short-description">${producto.descripcion}
											</div>
											<!-- SI HAY PRODUCTO -->
											<div class="add-to-cart">
												<div class="quantity inline">
													<h5>Cantidad</h5>
													<s:input path="cantidad" type="text"
														class="md-input quantity" id="cantidad" value="1" />
												</div>

												<div class="controls">
													<h5>Fecha</h5>
													<s:input path="fechareserva" type="text" id="fecha" />
												</div>

												<s:input path="producto.idproducto" type="hidden" name="productId"
													value="${producto.idproducto}" />

												<button type="submit" class="btn btn-primary btn-large"
													id="add_to_cart">
													<i class="icon-plus"></i> &nbsp;Carrito
												</button>
											</div>
											<!-- ELSE -->
										</div>
									</s:form>
									<!-- End id="product" -->

									<!-- Description tab -->
									<div class="tab-pane" id="description" itemprop="description">
										Descripcion de producto</div>
									<!-- End id="description" -->
								</div>
								<!-- End tab panels container -->
							</div>
						</div>
						<!-- End class="product-content" -->
					</div>
				</div>
				<div class="row">
					<div class="span12">
						<h3>Artículos relacionados</h3>
						<ul class="product-list isotope">
							<c:forEach var="producto" items="${listaProducto}">
								<li class="standard" data-price="${producto.precio}"><a
									href="${pageContext.request.contextPath}/producto/detalle/${producto.idproducto}.htm"
									title="${producto.nombre}">
										<div class="image">
											<img class="primary"
												src="${pageContext.request.contextPath}/resource/images/${producto.urlimg}"
												alt="${producto.nombre}" /> <img class="secondary"
												src="${pageContext.request.contextPath}/resource/images/${producto.urlimg}"
												alt="" />
										</div>
										<div class="title">
											<div class="prices">
												<span class="price">${producto.precio}</span>
											</div>
											<h3>${producto.nombre}</h3>
										</div>
								</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!-- End class="product-info" -->
		<!-- Added to cart modal window -->
		<!--<div id="added" class="modal hide fade" tabindex="-1">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            <div class="hgroup title">
	                <h3>You're one step closer to owning this product!</h3>
	                <h5>"{{ product.name }}" has been added to your cart</h5>
	            </div>
	        </div>
	        <div class="modal-footer">
	            <div class="pull-right">
	                <a href="/cart" class="btn btn-primary btn-small">
	                Go to cart &nbsp; <i class="icon-chevron-right"></i>
	                </a>
	            </div>
	        </div>
	    </div>-->
		<!-- End id="added" -->
	</section>
	<!-- End class="product-info" -->
</div>