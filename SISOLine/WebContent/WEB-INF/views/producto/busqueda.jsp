<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<section class="category">
    <div class="container">
        <div class="row">
            <div class="span12">
                <h3>Productos encontrados</h3>
            </div>
        </div>
        <div class="row">
            <div class="span12">
			    <!-- Products list -->
			    <ul class="product-list isotope">
			     <!--{% for product in pagination.items %}
			      {% set is_on_sale = product.onSale %}
			      {% set page_url = '/product/' ~ product.url_name %}-->
			      
			        <li class="standard" data-price="{{ product.price}}">
			            <a href="{{ page_url }}" title="{{ product.images.first.title }}">
			            <div class="image">
			                <img class="primary" src="" alt="" />
			                <img class="secondary" src="" alt="" />
			                <span class="badge badge-sale">SALE</span>
			            </div>
			            <div class="title">
			                <div class="prices">
			                    <span class="price">0.00</span>
			                </div>
			                <h3>Nombre</h3>
			            </div>
			            </a>
			        </li>
			
			        <!--{% else %}
			      {% if empty_text %}<li class="empty">{{ empty_text }}</li>{% endif %}
			    {% endfor %}-->
			    </ul>
			    <!-- End class="product-list isotope" -->
			
			    <div class="pagination-centered">
			        <div class="pagination">
			          
			        </div>
			    </div>
			
			  <!--{% endpaginate %}
			{{ close_form() }}-->
			</div>
        </div>
    </div>
</section>