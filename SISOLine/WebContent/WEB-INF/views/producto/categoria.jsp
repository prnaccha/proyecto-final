
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="category">
    <div class="container">
        <div class="row">
            <div class="span3">
                <!-- Sidebar -->
				<aside class="sidebar">
				    <div class="children">
			            <div class="box border-top">				                    
		                    <div class="hgroup title">
		                        <h3><a href="" title="SERVICIO ">${obj_categoria.nombre}</a></h3>
		                    </div>
		                    <!-- ACA SE HARA EL LISTADO DE TODOS LOS PROVEEDORES DE UN DETERMINADO SERVICIO -->
		                    <ul class="category-list secondary ">
                                <li>
                                    <a href="">empresa<span class="count">0</span></a>
                                </li>
		                    </ul>
		                </div>				            
			            <!-- Price filter -->
			            <div class="price-filter">
			                <div class="box border-top">
			                    <div class="hgroup title">
			                        <h3>Seleccione Rango por</h3>
			                        <h5>Precio</h5>
			                    </div>
			                    <div id="slider" data-max="200" data-step="5" data-currency="&#x24;"></div>
			                    <span id="slider-label">Price range:  (S/. )<strong>0 &ndash; 200</strong></span>
			                </div>
			            </div>
				    </div>
				    <!-- End class="children" -->
				</aside>
				<!-- End sidebar -->
            </div>
            <!-- End class="span3" -->
            <div class="span9">
                 <ul class="product-list isotope">
                    <c:forEach var="producto" items="${listaProducto}">
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
        </div>
    </div>
</section>