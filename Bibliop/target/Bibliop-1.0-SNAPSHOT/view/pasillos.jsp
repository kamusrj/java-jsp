<%-- 
    Document   : pasillos
    Created on : 01-01-2020, 02:13:25 PM
    Author     : usuario
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="resources/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <%
            HttpSession b_ses = request.getSession();
            if (b_ses.getAttribute("nick") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else if (b_ses.getAttribute("rol").equals("Cliente")) {
                response.sendRedirect(request.getContextPath() + "/Control?act=logOut");
            }
        %>
        <jsp:include page="/resources/componentes/menu.jsp"/>
        <div class="container">
            <h1>Pasillos</h1>
            <!-- Modal Pasillo-->
            <a class="waves-effect waves-light btn modal-trigger blue-grey" href="#modal1">Nuevo Pasillo</a>
            <a class="waves-effect waves-light btn btn-block blue-grey" href="Control?act=mnuUbicaciones">Regresar</a>

        </div>
        <div class="row">
            <div class="col m1"></div>
            <div class="col m10">
                <table class="grey darken-3 white-text">
                    <tr>
                        <th>ID Pasillo</th>
                        <th>Nombre del Pasillo</th>
                    </tr>
                    <c:forEach items="${pasillo}" var="pa">
                        <tr>
                            <td>${pa.id_pasillo}</td>
                            <td>${pa.pasillo}</td>
                            <td>
                                <a href="control?action=eliminarPasillo&id=${pa.id_pasillo}" class="btn btn-xs alert-info">Eliminar</a>
                            </td>
                            <td>
                                <a href="control?action=editPasillo&id=${pa.id_pasillo}" class="btn btn-xs alert-info">Editar</a>
                            </td>
                        </tr>
                    </c:forEach>         
                </table>
            </div>
            <div class="col m1"></div>
        </div>


        <form method="post" action="control?action=savePasillo">
            <!-- Modal Pasillo -->
            <div id="modal1" class="modal black white-text">
                <div class="modal-content white-text">
                    <h4>Nuevo Pasillo</h4>
                    <p>Nombre:</p>
                    <input class="text" name="txtIdPas" placeholder="ejemplo: B ">
                    <p>Información:</p>
                    <input class="text" name="txtPasillo" placeholder="Ejemplo: Comedia">
                </div>
                <div class="modal-footer">
                    <a href="control?action=guardarPasillo" class="modal-close waves-effect waves-green btn-flat">Guardar</a>
                    <a href="#!" class="modal-close waves-effect waves-red btn-flat">Cancelar</a>
                </div>
            </div>
        </form>


        <script src="resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="resources/js/materialize.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('.modal').modal();
            });
        </script>
        <jsp:include page="/resources/componentes/foot.jsp"/>
    </body>
</html>
