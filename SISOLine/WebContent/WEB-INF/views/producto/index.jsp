<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<section class="static_page_1">
    <div class="container">
        <div class="row">
            <div class="span12">
                <section class="static-page">                                
                    <div class="row">
                    	<div class="span3">
                    		<!-- Sidebar -->
							<aside class="sidebar">
							    <div class="children">
						            <div class="box border-top">				                    
					                    <div class="hgroup title">
					                        <h3>SERVICIO</h3>
					                    </div>
					                    <!-- ACA SE HARA EL LISTADO DE TODOS LOS PROVEEDORES DE UN DETERMINADO SERVICIO -->
					                    <ul class="category-list secondary ">
					                    	<c:forEach var="categoria" items="${listCategoria}">
				                                <li>
				                                    <a href="${pageContext.request.contextPath}/producto/index/${categoria.idcategoria}.htm">${categoria.nombre}<span class="count"></span></a>
				                                </li>
			                                </c:forEach>
					                    </ul>
					                </div>
							    </div>
							    <!-- End class="children" -->
							</aside>
							<!-- End sidebar -->
                    	</div>
                    	<div class="span9">
			                <!-- Cart -->
			                <div class="box">
			                    <div class="box-header">
			                        <h3>CATALOGO DE PRODUCTOS</h3>			                        
			                    </div>
			                    <div class="buttons">
		                            <div class="pull-left">
		                                <a href="#register" class="btn btn-primary btn-small mm20" data-toggle="modal">
		                                Agregar &nbsp; <i class="icon-chevron-right"></i>
		                                </a>
		                            </div>
		                        </div>
			    
			                    <!-- Empresa list -->
			                    <div class="box-content">
								    <div class="cart-items">
								        <table class="styled-table">
								            <thead>
								                <tr>
								                    <th class="col_product text-left">&nbsp;</th>
								                    <th class="col_qty text-left">Nombre</th>								                    
								                    <th class="col_qty text-center">Cantidad</th>
								                    <th class="col_qty text-left">Precio</th>
								                    <th class="col_remove text-right">&nbsp;</th>
								                </tr>
								            </thead>
								
								            <tbody>
													<c:forEach var="product" items="${listProducto}">
									                    <tr>
									                        <td data-title="Producto" class="col_product text-left">
									                            <div class="image visible-desktop">
									                                <a href="${pageContext.request.contextPath }/producto/detalle/${product.idproducto}.htm">
									                                    <img src="${pageContext.request.contextPath }/resource/images/${product.urlimg}"  style="max-width: 60px; max-height: 60px">
									                                </a>
									                            </div>									
									                        </td>
								                            <td data-title="Qty" class="col_qty text-left">${product.nombre}</td>
								                            <td data-title="Qty" class="col_qty text-center">${product.cantidad}</td>
									                        <td data-title="Single" class="col_single text-left">
									                            <span class="single-price">S/. ${product.precio}</span>
									                        </td>									
									                        <td data-title="Remove" class="col_remove text-right">
								                                <a href="#" data-ajax-handler="shop:cart"
								                                    data-ajax-update="#cart-content=shop-cart-content, #mini-cart=shop-minicart"
								                                    data-ajax-extra-fields="delete_item='{{ item.key }}'">
								                                    <i class="icon-trash icon-large"></i>
								                                </a>
								                            </td>
									                    </tr>
								                    </c:forEach>
								                <!--{% endfor %}-->
								            </tbody>
								        </table>
								    </div>
								</div>
			                    <!-- End Cart Items -->	    
			                    
			                </div>
			                <!-- End Cart -->
			            </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <!-- Register modal window -->
    <div id="register" class="modal hide fade" tabindex="-1">
        <s:form action="${pageContext.request.contextPath }/producto/save.htm" method="post" commandName="producto">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            <div class="hgroup title">
	                <h3>Registro Producto</h3>	                
	            </div>
	        </div>	        
	        <div class="modal-body">
	        	<div class = "row-fluid">
	        		<div class="span6">
	        			<div class="control-group">
	                        <label class="control-label" for="signup[last_name]">Categoria *</label>
	                        <div class="controls">                       			
	                            <s:select path="categoria.idcategoria" class="span12">
							        <c:forEach items="${listCategoria}" var="category">
							            <option value="${category.idcategoria}">${category.nombre}</option>
							        </c:forEach>
							    </s:select>
	                        </div>
	                        <span class="error"></span>
	                    </div>
	        		
	        		</div>
	        		<div class="span6">
	        			<div class="control-group">
	                        <label class="control-label" for="signup[last_name]">Empresa *</label>
	                        <div class="controls">
	                            <s:select path="empresa.idempresa" class="span12">
							        <c:forEach items="${listEmpresa}" var="empr">
							            <option value="${empr.idempresa}">${empr.nombre}</option>
							        </c:forEach>
							    </s:select>
	                        </div>
	                        <span class="error"></span>
	                    </div>	        		
	        		</div>
	        	</div>
	        	<div class="row-fluid">
	                <div class="span12">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[last_name]">Servicio *</label>
	                        <div class="controls">
	                        	<s:input path="idusuario" type="hidden" name="flash" value="${sessionScope.usuario.idusuario}"/>
	                        	<s:input path="nombre" type="text" class="span12" id="nombre" />	                            
	                        </div>
	                        <span class="error"></span>
	                    </div>
	                </div>
	            </div>
	            <div class="row-fluid">
	                <div class="span6">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[first_name]">Precio *</label>	                        
	                        <div class="controls">
	                        	<s:input path="precio" type="text" class="span12" id="precio" />
	                        </div>
	                    </div>
	                </div>
	                <div class="span6">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[first_name]">cantidad *</label>	                        
	                        <div class="controls">
	                        	<s:input path="cantidad" type="text" class="span12" id="cantidad" />
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="row-fluid">
	                <div class="span12">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[password]">Descripción</label>
	                        <div class="controls">
	                        	<s:textarea path="descripcion" type="text"  id="descripcion"  />
	                        </div>
	                    </div>
	                </div>	                
	            </div>
	        </div>
	        <div class="modal-footer">
	            <button type="submit" class="btn btn-primary btn-small" name="signup" value="Register">
	            Guardar &nbsp; <i class="icon-ok"></i>
	            </button>
	        </div>
        </s:form>
    </div>
    <!-- End Register modal window -->
</section> 
    