<%@page import="org.springframework.context.ApplicationContext"%>
<%@page
	import="org.springframework.web.servlet.support.RequestContextUtils"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.pe.shop.service.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html dir="ltr" lang="en" class="csstransforms csstransforms3d csstransitions js">
    <head>        
        <!--  {{ code_block('setup') }}-->

		<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1"/>
		<meta charset="UTF-8">
		<meta name="Description" content="{{ page.description }}"/>
		<meta name="Keywords" content="{{ page.keywords }}"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<link rel="icon" type="image/png" href="{{ theme.faviconImage.thumbnail('16', '16') }}"/>
		<title>E-COMERCE TURISMO Y HOTELERIA</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/combined.min.css">
		<link href="https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">

		<link href="https://fonts.googleapis.com/css?family=Lato:300,300italic,400,400italic,700,700italic|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- LemonStand CSS -->
		<link rel="stylesheet" type="text/css" href="/cms/lemonstand.css">

		<!-- If you want to add custom styles, uncomment the stylesheet below. -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/turquoise.css" id="color_scheme">

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/custom.css">

		<!--[if lt IE 9]>
		<script src="{{ 'javascript/html5shiv.js'|theme_resource }}"></script>
		<![endif]-->

		<script type="text/javascript" src="${pageContext.request.contextPath }/resource/javascript/combined.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
		<script type="text/javascript" src="/cms/lemonstand.js"></script>

    </head>
    <body>
    	<%
		ApplicationContext applicationContext = RequestContextUtils.getWebApplicationContext(request);
		CategoriaService categoriaService = (CategoriaService) applicationContext.getBean("CategoriaService");
	%>
        <div class="wrapper">
        <!-- Header -->
        	
            <div class="header">
			<!-- Top bar -->
			<div class="top">
				<div class="container">
					<div class="row">
						<div class="span6">
							<p>
							COMERCIO ELECTRÓNICO
							</p>
						</div>
						<div class="span6 hidden-phone">
							<ul class="inline pull-right">
								<c:if test="${not empty sessionScope.usuario}">
		                          <li><a href="${pageContext.request.contextPath }/pedido.htm">Order history</a></li>
		                          <li>
		                            <a href="${pageContext.request.contextPath }/acount/perfil/${sessionScope.usuario.idusuario}.htm">Perfil</a>
		                          </li>
		                          <li> <a class="icon-off" href="${pageContext.request.contextPath }/acount/logout.htm" title="Salir"></a></li>
		                          <li class="menu-item-seperator"></li>
		                        </c:if>
		                        <c:if test="${empty sessionScope.usuario}">
		                            <li><a href="${pageContext.request.contextPath }/acount/session.htm" title="Login">Login/Registrar</a></li>
		                        </c:if>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- End class="top" -->
			<!-- Logo & Search bar -->
			<div class="bottom">
				<div class="container">
					<div class="row">
						<div class="span8">
							<div class="logo">
								<a href="${pageContext.request.contextPath }/home.htm" title="&larr; Back home">
								<img src="${pageContext.request.contextPath }/resource/images/Logo1.jpg?1508346774" alt="HyT" />
								</a>
							</div>
						</div>
						<div class="span4">
							<div class="row-fluid">
								<div class="span10">

									<!-- Search -->
									<div class="search">
										<div class="qs_s">
											<form action="a" method="get">
												<input type="text" name="query" id="query" placeholder="Search store&hellip;" autocomplete="off">
											</form>
										</div>
									</div>
									<!-- End class="search"-->

								</div>
								<div class="span2">

									<!-- Mini cart -->
									<div id="mini-cart" class="mini-cart">
										<a href="${pageContext.request.contextPath }/carrito.htm">
											<c:if test="${not empty sessionScope.reserva}">
												<span>${sessionScope.reserva.cantidad}</span>
											</c:if>
											<c:if test="${empty sessionScope.reserva}">
												<span>0</span>
											</c:if>
										</a>
									</div>
									<!-- End class="mini-cart" -->

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End class="bottom" -->
		</div>

        <!-- End Header -->
        
        <!-- Navigation -->
            <nav class="navigation">
				<div class="container">
					<div class="row">
						<div class="span8">
							<a href="#" class="main-menu-button">Navigation</a>
							<!-- Begin Menu Container -->
							<div class="megamenu_container">
								<div class="menu-main-navigation-container">
								  <ul id="menu-main-navigation" class="main-menu">
									<li class="menu-item-home menu-item-has-children megamenu-parent"><a href="${pageContext.request.contextPath }/home.htm">Inicio</a></li>
									<li class="menu-item-has-children">
									  <a>Servicios</a>
										  <ul class="sub-menu span2">
											<c:forEach var="categoria" items="<%= categoriaService.findAll()%>">
												<li><a
													href="${pageContext.request.contextPath }/producto/categoria/${categoria.idcategoria }.htm">${categoria.nombre }</a>
												</li>
											</c:forEach>
										  </ul>									  
									</li>
									
									<c:if test="${not empty sessionScope.usuario}">
										<li class="menu-item-about"><a href="${pageContext.request.contextPath }/pedido.htm">Pedidos</a></li>
										<li class="menu-item-about"><a href="${pageContext.request.contextPath }/producto/index/0.htm">Catalogo</a></li>
										<li class="menu-item-about"><a href="${pageContext.request.contextPath }/empresa.htm">Empresa</a></li>
									</c:if>									
									<li class="menu-item-about"><a href="${pageContext.request.contextPath }/nosotros.htm">Acerca</a></li>
									<li class="menu-item-contact"><a href="${pageContext.request.contextPath }/contacto.htm">Contacenos</a></li>
								  </ul>
								  
								</div>
							</div>
						</div>
						<div class="span4 visible-desktop">
						</div>
					</div>
				</div>
			</nav>

        <!-- End class="navigation" -->

        <!-- Content section -->		
        <section class="main">
               <tiles:insertAttribute name="content"></tiles:insertAttribute>                       
        </section>
        <!-- End class="main" -->
 
        <!-- Footer -->
            <div class="footer">
			    <div class="container">
			        <div class="row">
			
			            <div class="span2">
			                <!-- Support -->
			                <div class="support">
			                    <h6>Soporte</h6>
			                    <ul>
								    <li><a href="${pageContext.request.contextPath }/nosotros.htm">Acerca de nosotros</a></li>
								    <!--<li><a href="/typography">Typography</a></li>
								    <li><a href="/retina-ready-icons">Retina-ready icons</a></li>
								    <li><a href="/buttons">Buttons</a></li>
								    <li><a href="/elements">Elements</a></li>
								    <li><a href="/grids">Grids</a></li>
								    <li><a href="/store-locator">Store locator</a></li>-->
								    <li><a href="${pageContext.request.contextPath }/contacto.htm">Contactanos</a></li>
								</ul>		
			                </div>
			                <!-- End class="support" -->
			                <hr />
			                <!-- My account -->
			                <div class="account">
			                    <h6>Mi cuenta</h6>
			                    <ul class="links">
			                        <!-- {% if customer %}
			                            <li><a href="{{ site_url('/orders') }}" title="Order history">Order History</a></li>
			                            <li><a href="{{ site_url('/change-password') }}" title="Change password">Change password</a></li>
			                            <li><a href="{{ site_url('/logout') }}" title="Logout">Logout</a></li>
			                        {% else %}
			                            <li><a href="{{ site_url('/login') }}" title="Login / Register">Login / Register</a></li>
			                        {% endif %}-->
			                    </ul>
			                </div>
			                <!-- End class="account"-->
			
			            </div>
			            <div class="span2">
			
			                <!-- Categories -->
			                <div class="categories">
			                    <h6>Servicios</h6>
			                    <ul class="links">
			                        <c:forEach var="categoria" items="<%= categoriaService.findAll()%>">
										<li><a
											href="${pageContext.request.contextPath }/producto/categoria/${categoria.idcategoria }.htm">${categoria.nombre }</a>
										</li>
									</c:forEach>
			                    </ul>
			                </div>
			                <!-- End class="categories" -->
			            </div>
			            <div class="span4">
			                <!-- Pay with confidence -->
			                <div class="confidence">
			                    <h6>Pay with confidence</h6>
			                    <!-- additional card images available in resource images folder -->
			                    <img src="${pageContext.request.contextPath }/resource/images/visa.png" alt="Aceptamos todas las principales tarjetas de crédito" />
			                    <img src="${pageContext.request.contextPath }/resource/images/mastercard.png" alt="Aceptamos todas las principales tarjetas de crédito" />
			                    <img src="${pageContext.request.contextPath }/resource/images/paypal.png" alt="Aceptamos todas las principales tarjetas de crédito" />
			                </div>
			                <!-- End class="confidence" -->
			            </div>
			            <div class="span4">
			                <!-- Newsletter subscription -->
			                <div class="newsletter">
			                    <h6>Boletín de suscripción</h6>
			                    <form onsubmit="$('#newsletter_subscribe').modal('show'); return false;" enctype="multipart/form-data" action="index.html" method="post">
			
			                        <div class="input-append">
			                            <input type="text" class="span3" name="email" />
			                            <button class="btn" type="submit">Go!</button>
			                        </div>
			                    </form>
			                    <p>Regístrese para recibir nuestras últimas noticias y actualizaciones directamente en su bandeja de entrada</p>
			                </div>
			                <!-- End class="newsletter" -->
			                <hr />
			
			
			                <!-- Social icons -->
			                <div class="social">
			                    <h6>Redes</h6>
			                    <ul class="social-icons">
			                        <li>
			                            <a class="twitter" href="{{ theme.twitterLinkText }}" title="Twitter">Twitter</a>
			                        </li>
			                        <li>
			                            <a class="facebook" href="{{ theme.facebookLinkText }}" title="Facebook">Facebook</a>
			                        </li>
			                        <li>
			                            <a class="pinterest" href="{{ theme.pinterestLinkText }}" title="Pinterest">Pinterest</a>
			                        </li>
			                        <li>
			                            <a class="youtube" href="#" title="YouTube">YouTube</a>
			                        </li>
			                        <li>
			                            <a class="googleplus" href="#" title="Google+">Google+</a>
			                        </li> 
			                    </ul>
			                </div>
			                <!-- End class="social" -->
			            </div>
			        </div>
			    </div>
			</div>
			<!-- Newsletter modal window -->
			<div id="newsletter_subscribe" class="modal hide fade" tabindex="-1">
			    <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <div class="hgroup title">
			            <h3>Ahora estás suscrito a nuestro boletín</h3>
			            <h5>Todas las últimas ofertas y ofertas llegarán a su bandeja de entrada en breve</h5>
			        </div>
			    </div>
			    <div class="modal-footer">
			        <div class="pull-left">
			            <button data-dismiss="modal" aria-hidden="true" class="btn btn-small">
			            Close &nbsp; <i class="icon-ok"></i>
			            </button>
			        </div>
			    </div>
			</div>
			<!-- End id="newsletter_subscribe" -->
        <!-- End id="footer" -->            
            
        <!-- Credits bar -->
        <div class="credits">
		    <div class="container">
		        <div class="row">
		            <div class="span8">
		                <p>&copy; 2018 H&T&middot; Todos los derechos reservados.</p>
		            </div>
		            <div class="span4 text-right hidden-phone">
		                <p>eCommerce theme by <a href="http://www.twindots.com/" title="Responsive eCommerce template">Twin Dots</a>, powered by <a href="https://lemonstand.com">LemonStand</a></p>
		            </div>
		        </div>
		    </div>
		</div>
        <!-- End class="credits" -->            
        </div>
    </body>
</html>