<%-- 
    Document   : Home
    Created on : 12-02-2019, 08:29:28 PM
    Author     : Manuel Iván Escobar Castillo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    HttpSession b_ses = request.getSession();
    if (b_ses.getAttribute("nick")!=null) {
        response.sendRedirect(request.getContextPath() + "/Control?act=perfil&tipo="+b_ses.getAttribute("rol"));
    }
%>
<!DOCTYPE html>

<!Menu>

<jsp:include page="/resources/componentes/menu.jsp"/>

<script>${msj}</script>
<!Slider new>
<div class="slider">
    <ul class="slides z-depth-1">
        <li>
            <a href="#one!"><img src="resources/img/banner/portada_perfume.png"/></a>
        </li>
        <li>
            <a href="#two!"><img src="resources/img/banner/La_Luz.png"/></a>
        </li>
        <li>
            <a href="#three!"><img src="resources/img/banner/La_Muerte_Ivan.png"/></a>
        </li>
        <li>
            <a href="#four!"><img src="resources/img/banner/El_Arte_De_La_Guerra.png"/></a>
        </li>
        <li>
            <a href="#five!"><img src="resources/img/banner/amar.jpg"/></a>
        </li>
    </ul>
</div>




<div class="contenedor">
    <div class="row">
        <!Oferta Recomendada Recomendado>
        <div class="col s2">
            <div class="card grey lighten-4" style="height: 400px">
                <div class="card-content black-text">
                    <span class="card-title">(Oferta)</span>
                    <img class="materialboxed" src="resources/img/portadas/Asesinato_Oriente_Expres.jpg" width="128" height="256"/>
                    <p>
                        Detalles de la Oferta
                    </p>
                </div>
                <div class="card-action center">
                    <a href="#!EnlaceOferta">
                        <br>Enlace de la Oferta</a>
                </div>
            </div>
        </div>
        <!Misión y Vision de la Empresa>
        <div class="col s10">
            <div class="card grey lighten-4" style="height: 400px">
                <div class="card-content black-text">
                    <span class="card-title">Misión: </span>
                    <p>
                        Blibliop es un sistema de gestión para una librería dedicada a la venta y alquiler de
                        libros con el fin de hacerlo más accesible a usuarios, poniendo a su disposición un
                        catalogo digital que evita la tediosa tarea de buscar el libro que deseas en los
                        estantes, realizando un pedido que estará listo para cancelar y recibir en el
                        mostrador.

                    </p>
                    <br>
                    <div class="row">
                        <div class="col s4">
                            <img src="resources/img/bibliop.png" width="128" height="128"/>
                        </div>
                        <div class="col s8">
                            <span class="card-title">¿Qué es Bibliop?</span>
                            <p>
                                Ser una empresa de gran reconocimiento y prestigio, compartiendo a todo 
                                público la oportunidad de compra o alquiler de libros tanto clásicos como 
                                modernos, guardando la integridad al impulsar el amor a la lectura por medio 
                                de precios justos y accesibles
                            </p>
                        </div>
                    </div>
                </div>
                <div class="card-action center">
                    <a href="#crearCuenta" class=" btn grey lighten-4 modal-trigger tooltipped  blue-text" data-position="right" data-tooltip="Crea Una Cuenta">¡Registrate ya!</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!Sección de Modales>
<jsp:include page="/resources/componentes/Modal/iniciarSesion.jsp"/>
<jsp:include page="/resources/componentes/Modal/crearCuenta.jsp"/>

<!Foot>
<jsp:include page="/resources/componentes/foot.jsp"/>