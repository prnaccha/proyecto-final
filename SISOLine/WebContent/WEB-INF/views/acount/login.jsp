<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<!-- Login / Register -->
<section class="login_register">
    <div class="container">
        <div class="row">
            <div class="span6">
                <!-- Login -->
                <div class="login">
                    <div class="box">
                        <form action="${pageContext.request.contextPath }/acount/login.htm" method="post">
	                        <div class="hgroup title">
	                            <h3>Login</h3>
	                            <h5>Por favor inicie sesión usando su cuenta existente</h5>
	                        </div>
	                        <div class="box-content">
	                            <div class="row-fluid">
	                                <div class="span6">
	                                    <div class="control-group">
	                                        <label class="control-label" for="usuario">Email</label>
	                                        <div class="controls">
	                                            <input class="span12" id="usuario" type="text" name="usuario" value="" />
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="span6">
	                                    <div class="control-group">
	                                        <label class="control-label" for="login_password">Password</label>
	                                        <div class="controls">
	                                            <input class="span12" id="password" type="password" name="password" />
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="buttons">
	                            <div class="pull-left">
	                                <button type="submit" class="btn btn-primary btn-small" name="login" value="Login">
	                                Login
	                                </button>
	                                <a href="${pageContext.request.contextPath }/acount/registrar.htm" class="btn btn-small">
	                                	Reset my password
	                                </a>
	                            </div>
	                        </div>
	                        <input type="hidden" name="redirect" value="{{ site_url(root_url('/')) }}"/>
                        </form>
                    </div>
                </div>
                <!-- End class="login" -->
            </div>
            <div class="span6">
                <!-- Register -->
                <div class="register">
                    <div class="box">
                        <div class="hgroup title">
                            <h3>Quiere registrarse?</h3>
                            <h5>El registro le permite evitar completar los formularios de facturación y envío cada vez que finaliza la compra en este sitio web. También podrá rastrear sus pedidos con facilidad!</h5>
                        </div>
                        <div class="buttons">
                            <div class="pull-left">
                                <a href="#register" class="btn btn-small" data-toggle="modal">
                                Registrarse &nbsp; <i class="icon-chevron-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End class="register" -->
            </div>
        </div>
    </div>
    <!-- Register modal window -->
    <div id="register" class="modal hide fade" tabindex="-1">
        <s:form action="${pageContext.request.contextPath }/acount/registrar.htm" method="post" commandName="usuario">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            <div class="hgroup title">
	                <h3>Registro</h3>
	                <h5>Los usuarios registrados obtienen acceso a funciones como el historial de pedidos y mucho más!</h5>
	            </div>
	        </div>
	        <div class="modal-body">
	            <div class="row-fluid">
	                <div class="span6">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[first_name]">Nombres *</label>
	                        <div class="controls">
	                        	<s:input path="nombre" type="text" class="span12" id="nombre" />
	                            <!--<input class="span12" type="text" id="signup[first_name]" name="signup[first_name]" value="" />-->
	                        </div>
	                    </div>
	                </div>
	                <div class="span6">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[last_name]">Apellidos *</label>
	                        <div class="controls">
	                        	<s:input path="apellido" type="text" class="span12" id="apellido" />
	                            <!--<input class="span12" type="text" id="signup[last_name]" name="signup[last_name]" value="" />-->
	                        </div>
	                        <span class="error"></span>
	                    </div>
	                </div>
	            </div>
	            <div class="row-fluid">
	                <div class="span12">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[email]">Email *</label>
	                        <div class="controls">
	                        	<s:input path="usuario" type="text" class="span12" id="usuario" />
	                            <!--<input class="span12" type="text" id="signup[email]" name="signup[email]" value="" />-->
	                        </div>
	                        <span class="error"></span>
	                    </div>
	                </div>
	            </div>
	            <div class="row-fluid">
	                <div class="span6">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[password]">Password *</label>
	                        <div class="controls">
	                        	<s:password path="password" class="span12" id="password" autocomplete="off"/>
	                        </div>
	                    </div>
	                </div>
	                <div class="span6">
	                    <div class="control-group">
	                        <label class="control-label" for="signup[password_confirmation]">Password confirmar *</label>
	                        <div class="controls">	                            
	                            <input class="span12" id="signup[password_confirmation]" type="password"  name="signup[password_confirmation]" autocomplete="off" />
	                        </div>
	                    </div>
	                </div>
	                <input type="checkbox" name="accepts_marketing" id="accepts_marketing" checked style="float: left;"> <label style="margin-left: 1.5em;"> Reciba correos electrónicos promocionales</label>
	            </div>
	        </div>
	        <input type="hidden" name="autologin" value="1" />
	        <input type="hidden" name="redirect" value="{{ site_url('registered') }}"/>
	        <div class="modal-footer">
	            <button type="submit" class="btn btn-primary btn-small" name="signup" value="Register">
	            Register &nbsp; <i class="icon-ok"></i>
	            </button>
	        </div>
        </s:form>
    </div>
    <!-- End Register modal window -->
</section>
<!-- End Login / Register -->