<%-- 
    Document   : estantes
    Created on : 01-01-2020, 02:13:07 PM
    Author     : usuario
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
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
            <h1>Estantes</h1>
            <!-- Modal Estante-->
            <a class="waves-effect waves-light btn modal-trigger blue-grey" href="#modal1">Nuevo Estante</a>
            <a class="waves-effect waves-light btn btn-block blue-grey" href="Control?act=mnuUbicaciones">Regresar</a>


            <table class="grey darken-3 white-text">
                <tr>
                    <th>ID Estante</th>
                    <th>Nombre del Estante</th>
                    <th>Nombre del Pasillo</th>
                </tr>
                <c:forEach items="${estante}" var="es">
                    <tr>
                        <td>${es.id_estante}</td>
                        <td>${es.numero_estante}</td>
                        <td>${es.pasillo.id_pasillo} / ${es.pasillo.pasillo}</td>
                        <td>
                            <a href="control?action=eliminarEstante&id=${es.id_estante}" class="btn btn-xs alert-info">Eliminar</a>
                        </td>
                        <td>
                            <a href="control?action=editEstante&id=${es.id_estante}" class="btn btn-xs alert-info">Editar</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <form method="post" action="control?action=saveEstante">
            <!-- Modal Pasillo -->
            <div id="modal1" class="modal grey lighten-2">
                <div class="modal-content">
                    <h4>Nuevo Estante</h4>
                    <p>Numero del Estante:</p>
                    <input type="number" name="txtEstante" placeholder="1">
                    <br>
                    <p>Pasillo :</p>
                    <select name="cmbPasillo">
                        <c:forEach items="${pasillo}" var="pas">
                            <option value="${pas.id_pasillo}">${pas.pasillo}(${pas.id_pasillo})</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="modal-footer">
                    <a href="control?action=guardarEstante" class="modal-close waves-effect waves-green btn-flat">Guardar</a>
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
