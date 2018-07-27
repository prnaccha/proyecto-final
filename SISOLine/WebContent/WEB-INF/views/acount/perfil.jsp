<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<div class="container">
  <div class="row">
    <div class="span12">
        <section id="profile-addresses">
        	<div class="row-fluid">
				  <div class="span12">
				    <div class="box">
				      <s:form action="${pageContext.request.contextPath }/acount/update.htm" method="post" commandName="usuario">
				        <input type="hidden" name="billing[id]" value="{{ billing.id }}" />
				        <div class="row-fluid">
				          <div class="span6">
				            <h3>Datos de facturación</h3>
				            <div class="row-fluid">
				              <div class="span6">
				                <label for="first_name">Nombres</label>
				                <s:input path="idusuario" type="hidden" name="flash" value="${sessionScope.usuario.idusuario}"/>
				                <s:input path="password" type="hidden" name="flash" value="${sessionScope.usuario.password}"/>
				                <s:input path="nombre" type="text" class="text" id="nombre" value="${sessionScope.usuario.nombre}" />
				                <!--<input name="billing[first_name]" id="first_name" type="text" class="text" value="${sessionScope.usuario.nombre}"/>-->
				                <span class="error"></span>
				              </div>
				              <div class="span6">
				                <label for="last_name">Apellidos</label>
				                <s:input path="apellido" type="text" class="text" id="apellido" value="${sessionScope.usuario.apellido}" />
				                <!--<input name="billing[last_name]" id="last_name" type="text" class="text" value="{{ billing.last_name }}"/>-->
				                <span class="error"></span>
				              </div>
				            </div>
				
				            <div class="row-fluid">
				              <div class="span6">
				                <label for="email">E-mail</label>
				                <s:input path="usuario" type="text" class="text" id="usuario" value="${sessionScope.usuario.usuario}" />
				                <span class="error"></span>
				              </div>
				              <div class="span6">
				                <label for="phone">Telefono</label>
				                <s:input path="telefono" type="text" class="text" id="telefono" value="${sessionScope.usuario.telefono}" />
				                <span class="error"></span>
				              </div>
				            </div>
				
				            <label for="billing_address">Dirección</label>
				            <s:textarea path="direccion" type="text" class="text" id="direccion" value="${sessionScope.usuario.direccion}" />
				            <span class="error"></span>
				
				            <label for="billing_address">Dirección 2</label>
				            <s:textarea path="direcciond" type="textarea" class="text" id="direcciond" value="${sessionScope.usuario.direcciond}" />
				            <!--<textarea id="billing_address" name="billing[street_address_line2]"></textarea>-->
				            <span class="error"></span>
				
				            <div class="row-fluid">
				              <div class="span6">
				                <label for="billing_city">Ciudad</label>
				                <s:input path="ciudad" type="text" class="text" id="ciudad" value="${sessionScope.usuario.ciudad}" />
				                <span class="error"></span>
				              </div>
				              <div class="span6">
				                <label for="billing_zip">Código postal</label>
				                <s:input path="codigoPostal" type="text" class="text" id="codigo_postal" value="${sessionScope.usuario.codigoPostal}" />
				                <span class="error"></span>
				              </div>
				            </div>
				            <div class="row-fluid">
				              <div class="span6">
				                <label for="billing_country">País</label>
				                <!--
				                  The state selector updates automatically when the country changes.
				                  See app.js for the implementation details.
				                -->
				                <s:input path="pais" type="text" class="text" id="pais" value="${sessionScope.usuario.pais}" />
				                <span class="error"></span>
				              </div>
				              <div class="span6">
				                <label for="billing_state">Región</label>
				                <s:input path="region" type="text" class="text" id="region" value="${sessionScope.usuario.region}" />
				                <span class="error"></span>
				              </div>
				            </div>
				          </div>
				
				          <div class="span6">
				            <h3 class="inline-block">Información de envío</h3>
				            <!--<a href="#" id="profile_billing_to_shipping"
				              data-ajax-handler="shop:onUpdateCustomerProfile"
				              data-ajax-update="#profile-addresses=shop-customerprofile"
				              data-validation-message=""
				              data-ajax-extra-fields="copy_billing_to_shipping='1'"
				            >Copie la información de envío</a>-->
				            <input type="hidden" name="shipping[id]" value="{{ shipping.id }}" />
				
				            <div class="row-fluid">
				              <div class="span6">
				                <label for="shipping_first_name">Nombres</label>
				                <s:input path="facnombre" type="text" class="text" id="facnombre" value="${sessionScope.usuario.facnombre}" />
				                <span class="error"></span>
				              </div>
				              <div class="span6">
				                <label for="shipping_last_name">Apellidos</label>
				                <s:input path="facapellido" type="text" class="text" id="facapellido" value="${sessionScope.usuario.facapellido}" />
				                <span class="error"></span>
				              </div>
				            </div>
				            <div class="row-fluid">
				              <div class="span12">
				                <label for="shipping_phone">Teléfono</label>
				                <s:input path="factelefono" type="text" class="text" id="factelefono" value="${sessionScope.usuario.factelefono}" />
				                <span class="error"></span>
				              </div>
				            </div>
				
				            <label for="shipping_address">Dirección</label>
				            <s:textarea path="facdireccion" type="text" class="text" id="facdireccion" value="${sessionScope.usuario.facdireccion}" />
				            <span class="error"></span>
				
				            <label for="shipping_address">Dirección 2</label>
				            <s:textarea path="facdirecciond" type="text" class="text" id="facdirecciond" value="${sessionScope.usuario.facdirecciond}" />
				            <span class="error"></span>
				
				            <div class="row-fluid">
				              <div class="span6">
				                <label for="shipping_city">Ciudad</label>
				                <s:input path="facciudad" type="text" class="text" id="facciudad" value="${sessionScope.usuario.facciudad}" />
				                <span class="error"></span>
				              </div>
				              <div class="span6">
				                <label for="shipping_zip">Código Postal</label>
				                <s:input path="faccodPostal" type="text" class="text" id="faccodigo_postal" value="${sessionScope.usuario.faccodPostal}" />
				                <span class="error"></span>
				              </div>
				            </div>
				            <div class="row-fluid">
				              <div class="span6">
				                <label for="shipping_country">País</label>
				                <s:input path="facpais" type="text" class="text" id="facpais" value="${sessionScope.usuario.facpais}" />
				                <span class="error"></span>
				              </div>
				              <div class="span6">
				                <label for="shipping_state">Región</label>
				                <s:input path="facregion" type="text" class="text" id="facregion" value="${sessionScope.usuario.facregion}" />
				                <span class="error"></span>
				              </div>
				            </div>
				          </div>
				        </div>
				
				        <div class="row-fluid">
				          <div class="span12">
				            <div class="buttons">
				              <input type="submit" class="btn btn-primary btn-large" value="Save"/>
				              <input type="hidden" name="flash" value="Your profile has been successfully updated."/>
				              <input type="hidden" name="redirect" value="{{ root_url('/profile') }}"/>
				            </div>
				          </div>
				        </div>
				      </s:form>
				    </div>
				  </div>
			</div>
        <div class="row-fluid">
		    <div class="span12">
		        <div class="box">
		
		            <h3>Cambiar Contraseña</h3>
		            <h5>necesitas cambiar tu contraseña? No te preocupes, es fácil! Sólo tienes que rellenar el siguiente formulario.</h5>
		
		            	<!-- {{ open_form({'data-ajax-handler': 'shop:onChangePassword', 'class': 'custom', 'data-ajax-update': '#change_password=shop-changepassword', 'data-validation-message' : ''}) }}-->

		                    <div class="row-fluid">
		                        <div class="span6">
		
		                                <label for="password">New password</label>
		                                <input class="span12" id="password" name="password" type="password" value="">
		                                <span class="error"></span>
		
		
		                        </div>
		                        <div class="span6">
		
		                                <label for="passwordConfirm">New password (confirme)</label>
		                                <input class="span12" id="passwordConfirm" name="passwordConfirm" type="password" value="">
		                                    <span class="error"></span>
		
		
		                        </div>
		                    </div>
		                    <div class="row-fluid">
		                        <div class="span12">
		
		                                <label for="oldPassword">Password antiguo</label>
		                                <input class="span12" id="oldPassword" name="oldPassword" type="password" value="">
		                                    <span class="error"></span>
		
		
		                        </div>
		                    </div>
		
		                <div class="buttons">
		                    <input  class="btn btn-primary btn-large" type="submit" value="Change my password"/>
		                </div>
		                <input type="hidden" name="flash" value="Your password has been successfully changed."/>
		                <input type="hidden" name="redirect" value="{{ root_url('/change-password') }}"/>
		            </form>
		        </div>
		    </div>
		</div>
        <!-- Using hasFeature helper method to check whether card variables should be accessed. -->
            <!--{% if hasFeature('saved-cards') %}
                {% set editedCard = '' %}
                
                <div id="profile-edit-card">
                    {{ partial('shop-customerprofile-edit-card') }}
                </div>

                {{ code_block('script') }}
            {% endif %}-->
        </section>
      <!--{% else %}
        Please <a href="{{ root_url('login') }}">login</a> to edit your profile.
      {% endif %}-->
    </div>
  </div>
</div>