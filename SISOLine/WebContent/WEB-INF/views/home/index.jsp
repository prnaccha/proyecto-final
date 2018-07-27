<%@page import="org.springframework.context.ApplicationContext"%>
<%@page
	import="org.springframework.web.servlet.support.RequestContextUtils"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.pe.shop.service.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!-- Slider -->

<%
	ApplicationContext applicationContext = RequestContextUtils.getWebApplicationContext(request);
	CategoriaService categoriaService = (CategoriaService) applicationContext.getBean("CategoriaService");
%>
<section class="home">
	<section class="flexslider">
	    <ul class="slides">
	        <li>
	          <img src="${pageContext.request.contextPath }/resource/images/Puya.jpeg?1508346774" alt="" />
	          <div class="caption">
	              <div class="container">
	                  <div class="span6">
	                    <h3>H&Tours</h3>
			<br />
			<p>Disfruta una aventura inolvidable en nuestros distintos paisajes que ofrece ayacucho.</p>
			<br /> <a class="btn btn-small" title="" href="${pageContext.request.contextPath }/producto/categoria/3.htm">Ver mas</a>
			<a class="btn btn-primary btn-small" title="" href="${pageContext.request.contextPath }/producto/categoria/3.htm">
			    Reservar Ahora &nbsp; <em class="icon-chevron-right"></em>
			</a>
	                  </div>
	              </div>
	          </div>
	        </li>
	        <li>
	            <img src="${pageContext.request.contextPath }/resource/images/ayacucho1.jpg?1508346774" alt="" />
	            <div class="caption">
	              <div class="container">
	                <div class="span6 offset6 text-right">
	                	<h3>Turismo y cultura</h3>
			<br />
			<p>Disfruta al máximo de nuestra cultura y lugares turísticos.</p>
			<br /> <a class="btn btn-small" title="" href="${pageContext.request.contextPath }/producto/categoria/2.htm">Ver más</a>
			<a class="btn btn-primary btn-small" title="" href="${pageContext.request.contextPath }/producto/categoria/2.htm">
			    Comprar ahora &nbsp; <em class="icon-chevron-right"></em>
			</a>				                      
	                </div>
	              </div>
	            </div>
	        </li>
	        <li>
	            <img src="${pageContext.request.contextPath }/resource/images/hotele.jpg?1508346774" alt="" />
	            <div class="caption">
	              <div class="container">
	                <div class="span6 offset6 text-right">
	                	<h3>HOTELES</h3>
			<br />
			<p>Disfruta de la mejor estadia y sientete como en casa en nuestro comodos y atractivos hoteles</p>
			<br /> <a class="btn btn-small" title="" href="${pageContext.request.contextPath }/producto/categoria/1.htm">Ver más</a>
			<a class="btn btn-primary btn-small" title="" href="${pageContext.request.contextPath }/producto/categoria/1.htm">
			    Reservar ahora &nbsp; <em class="icon-chevron-right"></em>
			</a>
	                </div>
	              </div>
	            </div>
	        </li>
	    </ul>
	</section>
	<!-- End class="flexslider" -->
	<section class="promos">
		<div class="container">
		    <div class="row">
		        <div class="span4">
		            <div class="free-shipping">
		                <div class="box border-top">
		                    <img src="${pageContext.request.contextPath }/resource/images/free-shipping.png" alt="" />
		                    <div class="hgroup title">
		                        <h3>¡Te recogemos!</h3>
		                        <h5>Sin costo alguno</h5>
		                    </div>
		                    <p>Para que disfrutes tu estadia desde tu llegada. Aprovecha nuestras ofertas!</p>
		                </div>
		            </div>
		        </div>
		
		        <div class="span4">
		            <div class="world-shipping">
		                <div class="box border-top">
		                    <img src="${pageContext.request.contextPath }/resource/images/world-shipping.png" alt="" />
		                    <div class="hgroup title">
		                        <h3>¡Ahora somos globales!</h3>
		                        <h5>A nivel Nacional</h5>
		                    </div>
		                    <p>Vive al máximo todas las aventuras con toda la seguridad. Siente la adrenalina y naturaleza!</p>
		                </div>
		            </div>
		        </div>
		
		        <div class="span4">
		            <div class="low-price">
		                <div class="box border-top">
		                    <img src="${pageContext.request.contextPath }/resource/images/low-price.png" alt="" />
		                        <div class="hgroup title">
		                            <h3>Precio más bajo garantizadoo!</h3>
		                        </div>
	                        <p>En nuestras oficinas no más lejos! Ahora puedes reservar y asegurar un sitio para ti desde cualquier lugar del mundo.</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<!-- End seccion class="promos" -->
	
	<section class="featured">
        <div class="container">

            <div class="row">
                <div class="span9">
                     <ul class="product-list isotope">
                        <c:forEach var="producto" items="${lista_producto}">
                        	<li class="standard" data-price="${producto.precio}">
	                            <a href="${pageContext.request.contextPath}/producto/detalle/${producto.idproducto}.htm" title="${producto.nombre}">
	                            <div class="image">
	                                <img class="primary" src="${pageContext.request.contextPath}/resource/images/${producto.urlimg}" alt="${producto.nombre}" />
	                                <img class="secondary" src="${pageContext.request.contextPath}/resource/images/${producto.urlimg}" alt="" />
	                            </div>
	                            <div class="title">
	                                <div class="prices">
	                                    <span class="price">${producto.precio}</span>
	                                </div>
	                                <h3>${producto.nombre}</h3>
	                            </div>
	                            </a>
	                        </li>
	                    </c:forEach>
                     </ul>
                </div>
                <div class="span3">
                    <!-- Categories widget -->
                    <div class="widget Categories">
                       	<h3 class="widget-title widget-title ">SERVICIOS</h3>
                       	<ul class=" category-list secondary ">
							<c:forEach var="categoria" items="<%= categoriaService.findAll()%>">
								<li><a
								href="${pageContext.request.contextPath }/producto/categoria/${categoria.idcategoria }.htm">${categoria.nombre }</a>
								</li>
							</c:forEach>
				    	</ul>
                    </div>
                    <!-- End class="widget Categories" -->

                    <!-- This month only! widget -->
                    <div class="widget Text">
			              <h3 class="widget-title widget-title ">Solo este Mes!</h3>
			              <h5>Traslado Gratis!</h5>
			              <h6>Sin Costo adicional</h6>
			              <p>Aprovecha nuestras promociones > Pages > Home</p>
			              <a class="btn btn-primary" href="/shop">
			              Reservar
			              </a>
		            </div>
                    <!-- End class="widget Text" -->

                </div>
            </div>
        </div>
    </section>
    <!-- End Featured content" -->	
	
</section>