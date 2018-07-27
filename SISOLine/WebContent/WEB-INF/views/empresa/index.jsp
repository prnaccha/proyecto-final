<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<section class="static_page_1">
    <div class="container">
        <div class="row-fluid">
            <div class="span12">
                <section class="static-page">                                
                    <div class="row">
                    	<div class="span12">
			                <!-- Cart -->
			                <div class="box">
			                    <div class="box-header">
			                        <h3>LISTA DE EMPRESAS</h3>			                        
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
								                    <th class="col_qty text-left">RAZÓN SOCIAL</th>								                    
								                    <th class="col_qty text-center">RUC</th>
								                    <th class="col_qty text-left">DIRECCION</th>
								                    <th class="col_remove text-right">&nbsp;</th>
								                </tr>
								            </thead>
								
								            <tbody>
													<c:forEach var="empresa" items="${listEmpresa}">
									                    <tr>
									                        <td data-title="Producto" class="col_product text-left">
									                            <div class="image visible-desktop">
									                                <a href="/product/{{ item.product.url_name }}">
									                                    <img src="${pageContext.request.contextPath }/resource/img/${empresa.imagen}">
									                                </a>
									                            </div>									
									                        </td>
								                            <td data-title="Qty" class="col_qty text-left">${empresa.nombre}</td>
								                            <td data-title="Qty" class="col_qty text-center">${empresa.ruc}</td>
									                        <td data-title="Single" class="col_single text-left">
									                            <span class="single-price">S/. ${empresa.direccion}</span>
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
        <s:form action="${pageContext.request.contextPath }/empresa/save.htm" method="post" commandName="empresa">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            <div class="hgroup title">
	                <h3>Registro Empresa</h3>	                
	            </div>
	        </div>
	        <div class="modal-body">
	        	<div class="row-fluid">
	                <div class="span6">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[last_name]">Ruc *</label>
	                        <div class="controls">
	                        	<s:input path="idusuario" type="hidden" name="flash" value="${sessionScope.usuario.idusuario}"/>
	                        	<s:input path="ruc" type="text" class="span12" id="apellido" />	                            
	                        </div>
	                        <span class="error"></span>
	                    </div>
	                </div>
	            </div>
	            <div class="row-fluid">
	                <div class="span12">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[first_name]">Razón Social *</label>	                        
	                        <div class="controls">
	                        	<s:input path="nombre" type="text" class="span12" id="nombre" />
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="row-fluid">
	                <div class="span12">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[email]">Dirección*</label>
	                        <div class="controls">	                        	
	                        	<s:input path="direccion" type="text" class="span12" id="direccion" />
	                        </div>
	                        <span class="error"></span>
	                    </div>
	                </div>
	            </div>
	            <div class="row-fluid">
	                <div class="span12">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[password]">Descripción</label>
	                        <div class="controls">
	                        	<s:textarea path="descripcion" type="text" class="text" id="descripcion" value="${sessionScope.usuario.direccion}" />
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
