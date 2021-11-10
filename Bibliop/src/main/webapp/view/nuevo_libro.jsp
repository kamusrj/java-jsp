<%-- 
    Document   : nuevo_libro
    Created on : 12-30-2019, 10:10:50 AM
    Author     : Gustavo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Libro</title>
        <link href="resources/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="resources/js/materialize.js" type="text/javascript"></script>
        <script src="resources/js/funciones.js" type="text/javascript"></script>
        <%
    HttpSession b_ses = request.getSession();
    if (b_ses.getAttribute("nick") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else if (b_ses.getAttribute("rol").equals("Cliente")) {
        response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
    }
%>
    </head>
    <body>
        <jsp:include page="/resources/componentes/menu.jsp"/>
        <div class="row">
            <div class="col s1"></div>
            <div class="col s10 card">
                <br>
                <form action="Control?act=guardarInfo" method="post">
                    <div class="row">
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">book</i>
                            <input type="text" name="txtTitulo" id="txtTitulo" class="validate" value="${libroEd.titulo}">
                            <input type="hidden" name="txtId" id="txtId" value="${libroEd.id_libro}">
                            <label for="txtTitulo">Titulo del libro</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">contacts</i>
                            <select name="cmbAutor">
                                <option value="" disabled="" selected="">Seleccione: </option>
                                <c:forEach items="${listaAutores}" var='la'>
                                    <c:choose>
                                        <c:when test="${la.id_autor == libroEd.autor.id_autor}">
                                            <option value="${la.id_autor}" selected="">${la.nombre} ${la.apellido}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${la.id_autor}">${la.nombre} ${la.apellido}</option>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                            </select>
                            <label for="cmbAutor">Seleccione al autor</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">forum</i>
                            <select name="cmbGenero">
                                <option value="" disabled="" selected="">Seleccione: </option>
                                <c:forEach items="${listaGenero}" var='lg'>
                                    <c:choose>
                                        <c:when test="${lg.id_genero == libroEd.genero.id_genero}">
                                            <option value="${lg.id_genero}" selected="">${lg.genero}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${lg.id_genero}">${lg.genero}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <label for="cmbGenero">Seleccione el genero</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">attach_money</i>
                            <input type="text" name="txtCosto" id="txtCosto" class="validate" value="${libroEd.costo}">
                            <label for="txtCosto">Costo del libro: ($)</label> 
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">description</i>
                            <select name="cmbEditorial">
                                <option value="" disabled="" selected="">Seleccione: </option>
                                <c:forEach items="${listaEditorial}" var='ld'>
                                    <c:choose>
                                        <c:when test="${ld.id_editorial==libroEd.editorial.id_editorial}">
                                            <option value="${ld.id_editorial}" selected="">${ld.editorial}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${ld.id_editorial}">${ld.editorial}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <label for="cmbEditorial">Seleccione la editorial</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">flag</i>
                            <select name="cmbEstante">
                                <option value="" disabled="" selected="">Seleccione: </option>
                                <c:forEach items="${listaEstante}" var='les'>
                                    <c:choose>
                                        <c:when test="${les.id_estante == libroEd.estante.id_estante}">
                                            <option value="${les.id_estante}" selected="">Pasillo: ${les.pasillo.id_pasillo} Estante: ${les.numero_estante}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${les.id_estante}">Pasillo: ${les.pasillo.id_pasillo} Estante: ${les.numero_estante}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <label for="cmbEstante">Seleccione la ubicación</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s2"></div>
                        <div class="col s8 input-field">
                            <i class="material-icons prefix">import_contacts</i>
                            <textarea id="txtSinopsis" name="txtSinopsis" class="materialize-textarea">${libroEd.sinopsis}</textarea>
                            <label for="txtSinopsis">Sinopsis</label>
                        </div>
                        <div class="col s2"></div>
                    </div>
                    <div class="row">
                        <div class="col s8"></div>
                        <div class="col s2 input-field white-text">
                            <a href="Control?act=listaLibros" class="btn btn-block kwaves-effect waves-green red lighten-2">Cancelar</a>
                        </div>
                        <div class="col s2 input-field white-text">
                            <input type="submit" value="Guardar" class="btn btn-block blue darken-3 waves-effect waves-block waves-green">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col s1"></div>
        </div>
        <div class="fixed-action-btn">
            <a class="btn btn-floating btn-large z-depth-3 green darken-1 waves-effect waves-circle white-text"><i class="material-icons">apps</i></a>
            <ul>
                <li>
                    <a href="Control?act=Genero" class="btn btn-floating white-text green darken-4 tooltipped" data-position="left" data-tooltip="Lista de generos">
                        <i class="material-icons center">forum</i>
                    </a>
                </li>
                <li>
                    <a href="Control?act=autor" class="btn btn-floating waves-effect yellow darken-2 tooltipped" data-position="left" data-tooltip="Lista de autores">
                        <i class="material-icons center">contacts</i>
                    </a>
                </li>
                <li>
                    <a href="Control?act=Editorial" class="btn btn-floating white-text blue darken-2 tooltipped" data-position="left" data-tooltip="Lista editoriales">
                        <i class="material-icons center">description</i>
                    </a>
                </li>
                <li>
                    <a href="Control?act=mnuUbicaciones" class="btn btn-floating white-text red darken-2 tooltipped" data-position="left" data-tooltip="Lista ubicaciones">
                        <i class="material-icons center">flag</i>
                    </a>
                </li>
            </ul>
        </div>
<jsp:include page="/resources/componentes/foot.jsp"/>
    </body>
</html>
