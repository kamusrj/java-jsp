<%-- 
    Document   : menu
    Created on : 12-14-2019, 12:40:07 PM
    Author     : Echo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    <link href="resources/css/alertify.css" rel="stylesheet" type="text/css"/> <!Hoja de Estilo para mensajes emergentes>
    <link href="resources/css/materialize.css" rel="stylesheet" type="text/css"/> <!Hoja de Estilo del Maquetado>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> <!Iconos de Materialize>
    <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="resources/js/materialize.js" type="text/javascript"></script>
    <script src="resources/js/alertify.js" type="text/javascript"></script>
    <script src="resources/js/funcion.js" type="text/javascript"></script>
    <script>${msjS}</script>
</head>
<body>
    <div class="row card grey lighten-4">
        <div class="col s1 center-align grey lighten-2">
            <!Bloque de Sesión de Usuario
                <br>
            <c:choose>
                <c:when test="${sessionScope.nick != null}">
                    <br>
                    <br>
                    <a href="Control?act=logOut" class="btn btn-block grey lighten-4 modal-trigger tooltipped  blue-text" data-position="right" data-tooltip="Salir"><i class="material-icons">power_settings_new</i></a>
                    <br>
                    <br>
                </c:when>
                <c:otherwise>
                    <br>
                    <a href="#iniciarSesion" class="btn btn-block grey lighten-4 modal-trigger tooltipped  blue-text" data-position="right" data-tooltip="Iniciar Sesión"><i class="material-icons">assignment_ind</i></a>
                    <br>
                    <a href="#crearCuenta" class=" btn btn-block grey lighten-4 modal-trigger tooltipped  blue-text" data-position="right" data-tooltip="Crea Una Cuenta"><i class="material-icons">add</i></a>
                    <br>
                </c:otherwise>
            </c:choose>


        </div>
        <div class="col s9 center-align" style="font-family: cursive">
            <span class="nav-title"><b><h3>B!bliop</h3></b></span>
            <i>
                <p>"Un libro es un sueño que puedes comprar o alquilar"
                </p></i>
        </div>
        <div class="col s2" style="margin-top: 1%">
            <!Bloque del Logo>
            <a href="Control?act=iniciar" class="brand-logo right"><img class="responsive-img" src="resources/img/bibliop.png" width="96" height="96"/> </a>
        </div>
    </div>


