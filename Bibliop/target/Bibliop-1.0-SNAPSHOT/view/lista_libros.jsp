<%-- 
    Document   : lista_libros
    Created on : 12-29-2019, 11:20:56 AM
    Author     : Gustavo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de libros</title>
        <link href="resources/css/materialize.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/alertify.js" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="resources/js/materialize.js" type="text/javascript"></script>
        <script src="resources/js/funciones.js" type="text/javascript"></script>
        <link href="resources/css/alertify.css" rel="stylesheet" type="text/css"/>
        <script>
            function eliminarLibro(id,titulo) {
                alertify.confirm('Eliminar libro', 'Está a punto de eliminar <b>'+titulo+'</b><br>¿Desea continuar?', function () {
                    window.location = "Control?act=eliminarLibro&id=" + id
                }
                , function () {
                    alertify.error('Eliminación cancelada por usuario')
                });
            }
            ${msj}
        </script>
<%
    HttpSession b_ses = request.getSession();
    if (b_ses.getAttribute("nick") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else if (b_ses.getAttribute("rol").equals("Cliente")) {
        response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
    }
    String rol =(String) b_ses.getAttribute("rol");
%>
    </head>
    <body>
        <jsp:include page="/resources/componentes/menu.jsp"/>
        <div class="row">
            <div class="col s8"></div>
            <div class="col s1 right-align">
                <a href="Control?act=nuevoLibro" data-position="left" data-tooltip="Agregar libro" class="btn tooltipped btn-block large waves-effect waves-block waves-green blue lighten-1">
                    <i class="material-icons white-text center">library_add</i>
                </a>
            </div>
            <div class="col s1">
                <a href="Control?act=perfil&tipo=<%=rol%>" data-position="right" data-tooltip="Volver al perfil" class="btn tooltipped btn-block large kwaves-effect waves-green red lighten-2">
                     <i class="material-icons white-text center">person_pin</i>
                </a>
            </div>
            <div class="col s2"></div>
        </div>
        <c:forEach items="${listaLibro}" var='l'>
            <div class="row">
                <div class="col s1"></div>
                <div class="col s3">
                    <div class="card">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator responsive-img" src="${l.portada}">
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">${l.titulo}</span>
                            <p><a href="#portada${l.id_libro}" data-position="right" data-tooltip="Subir portada" class="btn-floating modal-trigger tooltipped blue lighten-3 waves-effect waves-block waves-green z-depth-2">
                                    <i class="material-icons white-text center">file_upload</i>
                                </a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>${l.titulo}</span>
                            <p>${l.sinopsis}</p>
                        </div>
                    </div>
                </div>
                <div class="col s6 card">
                    <table class="responsive-table striped">
                        <tr>
                            <th colspan="3" class="blue-text">${l.titulo}</th>
                            <td class="right-align">
                                <a href="Control?act=editarLibro&id=${l.id_libro}" data-position="left" data-tooltip="Editar libro" class="tooltipped btn z-depth-2 yellow darken-2">
                                    <i class="material-icons white-text">edit</i>
                                </a>&nbsp;&nbsp;
                                <c:choose>
                                    <c:when test="${sessionScope.rol == 'Propietario'}">
                                         <button onclick="eliminarLibro(${l.id_libro},'${l.titulo}')" data-position="right" data-tooltip="Eliminar libro" class="btn tooltipped z-depth-2 red darken-2"><i class="material-icons white-text">delete</i></button>
                                    </c:when>
                                </c:choose>
                               
                            </td>
                        </tr>
                        <tr>
                            <th>Autor:</th>
                            <td colspan="3" class="left-align">${l.autor.nombre} ${l.autor.apellido}</td>

                        </tr>
                        <tr>
                            <th>Genero:</th>
                            <td class="left-align">${l.genero.genero}</td>
                            <th>Editorial:</th>
                            <td class="left-align">${l.editorial.editorial}</td>
                        </tr>
                        <tr>
                            <th>Costo:</th>
                            <td class="left-align">$${l.costo}</td> 
                            <th>Ubicacion</th>
                            <td><b>Pasillo: </b>${l.estante.pasillo.id_pasillo} <b>Estante: </b>${l.estante.numero_estante}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="portada${l.id_libro}" class="modal curve">
                <form action="Control?act=guardarPortada" enctype="multipart/form-data" method="post">
                    <div class="modal-content">
                        <h4>Subir portada</h4>
                        <div class="row">
                            <div class="col s7">
                                <i class="material-icons prefix">book</i>Para: ${l.titulo}
                                <input type="hidden" name="txtId" id="txtId" readonly="" value="${l.id_libro}">

                            </div>
                        </div>
                        <div class="row">
                            <div class="file-field input-field col m7">
                                <div class="btn">
                                    <span>Portada</span>
                                    <input type="file" name="imagen" id="imagen" accept=".png, .jpeg, .jpg">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="#!" class="modal-close waves-effect waves-green btn-flat red lighten-2">Cancelar</a>
                        <input type="submit" value="Subir" class="btn btn-flat waves-effect waves-green blue darken-2">
                    </div>
                </form>
            </div>
        </c:forEach>
        <jsp:include page="/resources/componentes/foot.jsp"/>
    </body>
</html>
